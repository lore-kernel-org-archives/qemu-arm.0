Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe5c924sm67494466b.30.2025.04.03.03.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:00:28 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 720275F90D;
	Thu,  3 Apr 2025 11:00:27 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Jim MacArthur <jim.macarthur@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] tests/tcg: make aarch64 boot.S handle different starting modes
Date: Thu,  3 Apr 2025 11:00:16 +0100
Message-Id: <20250403100016.4118475-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8fUuJA+fA6f+

Currently the boot.S code assumes everything starts at EL1. This will
break things like the memory test which will barf on unaligned memory
access when run at a higher level.

Adapt the boot code to do some basic verification of the starting mode
and the minimal configuration to move to the lower exception levels.
With this we can run the memory test with:

  -M virt,secure=on
  -M virt,secure=on,virtualization=on
  -M virt,virtualisation=on

Cc: Julian Armistead <julian.armistead@linaro.org>
Cc: Jim MacArthur <jim.macarthur@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/aarch64/system/boot.S | 88 +++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index 4eb1b35b88..8fbcba757e 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -86,6 +86,94 @@ lower_a32_serror:
 	.align 4
 	.global __start
 __start:
+	/* Determine current Exception Level */
+	mrs     x0, CurrentEL
+	lsr     x0, x0, #2        /* CurrentEL[3:2] contains the current EL */
+
+	/* Branch based on current EL */
+	cmp     x0, #3
+	b.eq    setup_el3
+	cmp     x0, #2
+	b.eq    setup_el2
+	cmp     x0, #1
+	b.eq    at_el1            /* Already at EL1, skip transition */
+	/* Should not be at EL0 - error out */
+	b       curr_sp0_sync
+
+setup_el3:
+	/* Ensure we trap if we get anything wrong */
+	adr	x0, vector_table
+	msr	vbar_el3, x0
+
+	/* Configure EL3 to for lower states (EL2 or EL1) */
+	mrs     x0, scr_el3
+	orr     x0, x0, #(1 << 10)    /* RW = 1: EL2/EL1 execution state is AArch64 */
+	orr     x0, x0, #(1 << 0)     /* NS = 1: Non-secure state */
+	msr     scr_el3, x0
+
+	/*
+	 * We need to check if EL2 is actually enabled via ID_AA64PFR0_EL1,
+	 * otherwise we should just jump straight to EL1.
+	 */
+	mrs     x0, id_aa64pfr0_el1
+	ubfx    x0, x0, #8, #4        /* Extract EL2 field (bits 11:8) */
+	cbz     x0, el2_not_present   /* If field is 0 no EL2 */
+
+
+	/* Prepare SPSR for exception return to EL2 */
+	mov	x0, #0x3c9            /* DAIF bits and EL2h mode (9) */
+	msr     spsr_el3, x0
+
+	/* Set EL2 entry point */
+	adr     x0, setup_el2
+	msr     elr_el3, x0
+
+	/* Return to EL2 */
+	eret
+	nop
+
+el2_not_present:
+	/* Initialize SCTLR_EL1 with reset value */
+	msr     sctlr_el1, xzr
+
+	/* Set EL1 entry point */
+	adr     x0, at_el1
+	msr     elr_el3, x0
+
+	/* Prepare SPSR for exception return to EL1h with interrupts masked */
+	mov     x0, #0x3c5            /* DAIF bits and EL1h mode (5) */
+	msr     spsr_el3, x0
+
+	isb                           /* Synchronization barrier */
+	eret                          /* Jump to EL1 */
+
+setup_el2:
+	/* Ensure we trap if we get anything wrong */
+	adr	x0, vector_table
+	msr	vbar_el2, x0
+
+	/* Configure EL2 to allow transition to EL1 */
+	mrs     x0, hcr_el2
+	orr     x0, x0, #(1 << 31)    /* RW = 1: EL1 execution state is AArch64 */
+	msr     hcr_el2, x0
+
+	/* Initialize SCTLR_EL1 with reset value */
+	msr     sctlr_el1, xzr
+
+	/* Set EL1 entry point */
+	adr     x0, at_el1
+	msr     elr_el2, x0
+
+	/* Prepare SPSR for exception return to EL1 */
+	mov     x0, #(0x5 << 0)       /* EL1h (SPx), with interrupts disabled */
+	msr     spsr_el2, x0
+
+	/* Return to EL1 */
+	eret
+
+	nop
+
+at_el1:
 	/* Installs a table of exception vectors to catch and handle all
 	   exceptions by terminating the process with a diagnostic.  */
 	adr	x0, vector_table
-- 
2.39.5

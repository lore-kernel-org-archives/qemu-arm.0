Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1e26fa7e2sm43978666b.97.2025.05.06.05.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 60F095FA34;
	Tue,  6 May 2025 13:57:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Julian Armistead <julian.armistead@linaro.org>,
	Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v2 03/14] tests/tcg: make aarch64 boot.S handle different starting modes
Date: Tue,  6 May 2025 13:57:04 +0100
Message-Id: <20250506125715.232872-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506125715.232872-1-alex.bennee@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OJeE33On8C6B

Currently the boot.S code assumes everything starts at EL1. This will
break things like the memory test which will barf on unaligned memory
access when run at a higher level.

Adapt the boot code to do some basic verification of the starting mode
and the minimal configuration to move to the lower exception levels.
With this we can run the memory test with:

  -M virt,secure=on
  -M virt,secure=on,virtualization=on
  -M virt,virtualisation=on

If a test needs to be at a particular EL it can use the semihosting
command line to indicate the level we should execute in.

Cc: Julian Armistead <julian.armistead@linaro.org>
Cc: Jim MacArthur <jim.macarthur@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - allow tests to control the final EL we end up at
  - use tabs consistently
  - validate command line arg is between 1 and 3
---
 tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
 tests/tcg/aarch64/system/boot.S           | 135 +++++++++++++++++++++-
 2 files changed, 136 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index 9c52475b7a..f7a7d2b800 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -68,7 +68,8 @@ run-plugin-semiconsole-with-%: semiconsole
 
 # vtimer test needs EL2
 QEMU_EL2_MACHINE=-machine virt,virtualization=on,gic-version=2 -cpu cortex-a57 -smp 4
-run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_BASE_ARGS) -kernel
+QEMU_EL2_BASE_ARGS=-semihosting-config enable=on,target=native,chardev=output,arg="2"
+run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_EL2_BASE_ARGS) -kernel
 
 # Simple Record/Replay Test
 .PHONY: memory-record
diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index a5df9c173d..a52d28c881 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -16,6 +16,7 @@
 #define semihosting_call hlt 0xf000
 #define SYS_WRITEC	0x03	/* character to debug channel */
 #define SYS_WRITE0	0x04	/* string to debug channel */
+#define SYS_GET_CMDLINE 0x15	/* get command line */
 #define SYS_EXIT	0x18
 
 	.align	12
@@ -81,10 +82,137 @@ lower_a32_serror:
 .error:
 	.string "Terminated by exception.\n"
 
+	.align 8
+.get_cmd:
+	.quad	cmdline
+	.quad	128
+
 	.text
 	.align 4
 	.global __start
 __start:
+	/*
+	 * The test can set the semihosting command line to the target
+	 * EL needed for the test. Keep that in w11.
+	 */
+	mov	x0, SYS_GET_CMDLINE
+	adr	x1, .get_cmd
+	semihosting_call
+	adrp	x10, cmdline
+	add	x10, x10, :lo12:cmdline
+	ldrb	w11, [x10]
+	cbz	w11, 2f
+
+	/* sanity check, clamp to 1 if invalid */
+	cmp w11, #'0'
+	b.lt 1f
+	cmp w11, #'4'
+	b.ge 1f
+	sub	w11, w11, #'0'
+	b 2f
+1:	mov w11, #1
+
+2:
+	/* Determine current Exception Level */
+	mrs	x0, CurrentEL
+	lsr	x0, x0, #2	  /* CurrentEL[3:2] contains the current EL */
+
+	/* Branch based on current EL */
+	cmp	x0, #3
+	b.eq	setup_el3
+	cmp	x0, #2
+	b.eq	setup_el2
+	cmp	x0, #1
+	b.eq	at_testel	     /* Already at EL1, skip transition */
+	/* Should not be at EL0 - error out */
+	b	curr_sp0_sync
+
+setup_el3:
+	/* Ensure we trap if we get anything wrong */
+	adr	x0, vector_table
+	msr	vbar_el3, x0
+
+	/* Does the test want to be at EL3? */
+	cmp	w11, #3
+	beq	at_testel
+
+	/* Configure EL3 to for lower states (EL2 or EL1) */
+	mrs	x0, scr_el3
+	orr	x0, x0, #(1 << 10)    /* RW = 1: EL2/EL1 execution state is AArch64 */
+	orr	x0, x0, #(1 << 0)     /* NS = 1: Non-secure state */
+	msr	scr_el3, x0
+
+	/*
+	 * We need to check if EL2 is actually enabled via ID_AA64PFR0_EL1,
+	 * otherwise we should just jump straight to EL1.
+	 */
+	mrs	x0, id_aa64pfr0_el1
+	ubfx	x0, x0, #8, #4	      /* Extract EL2 field (bits 11:8) */
+	cbz	x0, el2_not_present   /* If field is 0 no EL2 */
+
+
+	/* Prepare SPSR for exception return to EL2 */
+	mov	x0, #0x3c9	      /* DAIF bits and EL2h mode (9) */
+	msr	spsr_el3, x0
+
+	/* Set EL2 entry point */
+	adr	x0, setup_el2
+	msr	elr_el3, x0
+
+	/* Return to EL2 */
+	eret
+	nop
+
+el2_not_present:
+	/* Initialize SCTLR_EL1 with reset value */
+	msr	sctlr_el1, xzr
+
+	/* Set EL1 entry point */
+	adr	x0, at_testel
+	msr	elr_el3, x0
+
+	/* Prepare SPSR for exception return to EL1h with interrupts masked */
+	mov	x0, #0x3c5	      /* DAIF bits and EL1h mode (5) */
+	msr	spsr_el3, x0
+
+	isb			      /* Synchronization barrier */
+	eret			      /* Jump to EL1 */
+
+setup_el2:
+	/* Ensure we trap if we get anything wrong */
+	adr	x0, vector_table
+	msr	vbar_el2, x0
+
+	/* Does the test want to be at EL2? */
+	cmp	w11, #2
+	beq	at_testel
+
+	/* Configure EL2 to allow transition to EL1 */
+	mrs	x0, hcr_el2
+	orr	x0, x0, #(1 << 31)    /* RW = 1: EL1 execution state is AArch64 */
+	msr	hcr_el2, x0
+
+	/* Initialize SCTLR_EL1 with reset value */
+	msr	sctlr_el1, xzr
+
+	/* Set EL1 entry point */
+	adr	x0, at_testel
+	msr	elr_el2, x0
+
+	/* Prepare SPSR for exception return to EL1 */
+	mov	x0, #(0x5 << 0)	      /* EL1h (SPx), with interrupts disabled */
+	msr	spsr_el2, x0
+
+	/* Return to EL1 */
+	eret
+
+	nop
+
+	/*
+	 * At the target EL for the test, usually EL1. Note we still
+	 * set everything up as if we were at EL1.
+	 */
+at_testel:
 	/* Installs a table of exception vectors to catch and handle all
 	   exceptions by terminating the process with a diagnostic.  */
 	adr	x0, vector_table
@@ -100,7 +228,7 @@ __start:
 	 * maps RAM to the first Gb. The stage2 tables have two 2mb
 	 * translation block entries covering a series of adjacent
 	 * 4k pages.
-	*/
+	 */
 
 	/* Stage 1 entry: indexed by IA[38:30] */
 	adr	x1, .				/* phys address */
@@ -233,6 +361,11 @@ __sys_outc:
 	ret
 
 	.data
+
+	.align 8
+cmdline:
+	.space 128, 0
+
 	.align	12
 
 	/* Translation table
-- 
2.39.5

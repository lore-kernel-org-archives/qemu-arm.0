Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9777CD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 16:34:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waFgX-0006na-RI; Thu, 18 Jun 2026 12:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1waFg6-0006gP-88
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 12:33:19 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1waFg4-0006NQ-Eb
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 12:33:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4923fb1f095so638765e9.1
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 09:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781800395; x=1782405195; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=52umHFSUDthXMcK75iwY6XmJbWZQ0XPbx9W1Vy1cSJY=;
 b=BI4kcPGd3K6nwhkYexHKqrfbuXtHKbakqPOqgqcGUZY/a+A67LkcusiqdO/nHNQLtt
 PPfvm/xQLt19V5znXhbLy8Dmabz6fpNYlcoXYJfJagyD3WbZ/0wVUW1Hq6W0aeeX7FJe
 VU9xgiIHqY8eqtuPoxfM69VHGvwYQ84v9U830cXKD0SjDRwXlVJZdrKUq5G3zCO8i1ny
 mxwg1dNa4gPOa8bP5MYlSgSFsIlU+gtlPDkPCoe4+VEdbbb4oUW91HvYuKExtrv1o6x9
 pVef885iHHt2SACyq7TKkV5ez26Fj2HRlojQQRNOfwTNwIzQs3+GqnbGl1YNaSNRfO1j
 JvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781800395; x=1782405195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=52umHFSUDthXMcK75iwY6XmJbWZQ0XPbx9W1Vy1cSJY=;
 b=obGwyQ5mNXH4BPRS/4GAwciDRtuM6dE1VJi7eIiiKkIdw8fZx883o5swI06xx8IJJX
 gduWrtGbuwC12GWRof8bwfMFIuzdlktmKx4WfbO4BXM/GjAlRttq1cGAoiU2p8txKfEd
 7W5XGP2llrpYy9q2FnXtZhtBVkuBj46DNsJAYV5tDlJPniZ0wfxY5wrsV713LAiHcCVb
 Lxmn5X0W1oWh+o3QLCgkbn6jc06E/O0RpW8E1kL8DGaIoH1YYoGqml1myTKiMSDpbpvX
 ZN6VOAMxhL5Q/QdGm/PDTtxlvdcdiyZKnj5G7oyKEPJQx87IRf99cxOv9dspj3pI+61W
 6enA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8r4t0w5lbcsZQhEBhyHsoUneHBv5hJFVozbQGWDhTkUxjygrmZwfF5+2YW08r3cZR8OMToTpuOvg==@nongnu.org
X-Gm-Message-State: AOJu0Yw6IPEc4uHt8zSMWdbKRdumYbrZZDBUNUJjJ9r3lehe1nfCc5Tg
 KORUGfsAtdh44gBxZM62UAmVyAbeTgCDAzeaSr+q04jr97poSoCJL4V56WmrtktlgP4=
X-Gm-Gg: AfdE7cmR5v0Fr1cyRC5xK/leJ8sE16tsmTLxOKsrLwKiiaBZRmLt2bRj9vSz6JriADK
 bLnWCNh5JPg7IeToDIR7AWECysD5l7czxwXmcBQmu+SPea0Y4N7KwRAuSG9mCyy0rhuRFAnB6hW
 ezp7K+NmyP6gfJzAU4jeFA5MXP+44wfjHZtQRRDRx9mz8mHW2T4zp2YohnjkCJNgaiCduJCFZS3
 +Ji9tMqq4sp7RdHHjc0Y6yond5wrG14CrtrxES+GX9Sbhe89fIilWD7rw3QdBbZfwW5LSl5n0cn
 plmw3mkgca5wGiGW0tBDXbmb+FljJw0Ubeb5AOC1TPgJZeEsU7AwBXAdWi9CjvMx9+C4vfUrdtk
 BMimlX9XHUP3QPKDZ6fCL5zRokJE2Df/6UAgtBiklRc7KMxn+vw00OndoMibzct1d4NoE/SIlN6
 dT14niNbNFBNPGGknawebJeYYC
X-Received: by 2002:a05:600c:4caa:b0:490:bad8:329c with SMTP id
 5b1f17b1804b1-4923f33cfa3mr4326475e9.12.1781800394856; 
 Thu, 18 Jun 2026 09:33:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:b52:6a9:569d:e33e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc426e1sm26942f8f.29.2026.06.18.09.33.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2026 09:33:14 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Thu, 18 Jun 2026 17:33:08 +0100
Subject: [PATCH v3 5/6] tests/tcg/aarch64/system: Alternative boot object
 for exception logging
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-jmac-gpc3b-v3-5-353e546067e7@linaro.org>
References: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
In-Reply-To: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This allows us to record information about exceptions using a small
area of memory, and continue with the test so it can verify exceptions
have been taken where expected.

LOGGING_VECTOR_TABLE is added to switch this on, and vec_logging_boot.o
is built from boot.S with this flag. Since boot.o is created for multiple
test targets, we have to build a separate object and selectively link this
new vec_logging_boot.o into particular test binaries.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 11 ++++--
 tests/tcg/aarch64/system/boot.S           | 65 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/system/boot.h           | 14 +++++++
 3 files changed, 86 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index f7a7d2b800..c353b7f8d6 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -25,7 +25,7 @@ LDFLAGS=-Wl,-T$(LINK_SCRIPT)
 TESTS+=$(AARCH64_TESTS) $(MULTIARCH_TESTS)
 EXTRA_RUNS+=$(MULTIARCH_RUNS)
 CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
-LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
+LDFLAGS+=-static -nostdlib $(MINILIB_OBJS) -lgcc
 
 config-cc.mak: Makefile
 	$(quiet-@)( \
@@ -36,17 +36,20 @@ config-cc.mak: Makefile
 # building head blobs
 .PRECIOUS: $(CRT_OBJS)
 
+vector_log_boot.o: $(CRT_PATH)/boot.S
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -DLOGGING_VECTOR_TABLE -x assembler-with-cpp -Wa,--noexecstack -c $< -o $@
+
 %.o: $(CRT_PATH)/%.S
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -Wa,--noexecstack -c $< -o $@
 
 # Build and link the tests
 %: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) boot.o
 
 memory: CFLAGS+=-DCHECK_UNALIGNED=1
 
 memory-sve: memory.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) boot.o
 
 memory-sve: CFLAGS+=-DCHECK_UNALIGNED=1 -march=armv8.1-a+sve -O3
 
@@ -107,7 +110,7 @@ QEMU_MTE_ENABLED_MACHINE=-M virt,mte=on -cpu max -display none
 QEMU_OPTS_WITH_MTE_ON = $(QEMU_MTE_ENABLED_MACHINE) $(QEMU_BASE_ARGS) -kernel
 mte: CFLAGS+=-march=armv8.5-a+memtag
 mte: mte.S $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
-	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) boot.o
 
 run-mte: QEMU_OPTS=$(QEMU_OPTS_WITH_MTE_ON)
 run-mte: mte
diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
index 8bfa4e4efc..c6e5ad889b 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -60,6 +60,40 @@ curr_sp0_irq:
 curr_sp0_fiq:
 curr_sp0_serror:
 curr_spx_sync:
+#ifdef LOGGING_VECTOR_TABLE
+	sub     sp, sp, #16
+	stp     x0, x1, [sp, #0]
+	mrs     x0, ESR_EL3
+	lsr 	x0, x0, #26
+	and 	x0, x0, #0x3f
+	cmp 	x0, #37
+	beq 	data_fault
+	cmp 	x0, #30
+	beq 	gpc_fault
+	b       generic_exception
+
+data_fault:
+	mrs     x0, FAR_EL3
+	adrp    x1, exception_log
+	str     x0, [x1]
+	ldr     x0, =0x1001
+	str     x0, [x1, #8]
+	b       skip_return
+gpc_fault:
+	mrs     x0, FAR_EL3
+	adrp    x1, exception_log
+	str     x0, [x1]
+	ldr     x0, =0x1002
+	str     x0, [x1, #8]
+	/* Fall through */
+skip_return:
+	mrs     x0, ELR_EL3
+	add     x0, x0, #4 /* Skip faulting instruction */
+	msr     ELR_EL3, x0
+	ldp     x0, x1, [sp, #0]
+	add     sp, sp, #16
+	eret
+#endif
 curr_spx_irq:
 curr_spx_fiq:
 curr_spx_serror:
@@ -71,6 +105,7 @@ lower_a32_sync:
 lower_a32_irq:
 lower_a32_fiq:
 lower_a32_serror:
+generic_exception:
 	adr	x1, .unexp_excp
 exit_msg:
 	mov	x0, SYS_WRITE0
@@ -404,6 +439,36 @@ ttb_stage2:
 	.space	4096, 0
 
 	.align	12
+	.global realms_gpt0
+	/* GPT stage 0 table */
+realms_gpt0:
+	.space 4096, 0
+	.align 17
+	.global realms_gpt1
+	/* GPT stage 1 table, initialised to all 0xFF (full access) */
+realms_gpt1:
+	.space 524288, 0xFF
+#ifdef LOGGING_VECTOR_TABLE
+	.align 12
+	.global exception_fault_address
+	.type exception_fault_address, @object
+	.size exception_fault_address, 8
+	.global exception_type_code
+	.type exception_type_code, @object
+	.size exception_type_code, 8
+	/*
+         * These fields record details of the last exception, if
+         * LOGGING_VECTOR_TABLE is defined.
+         */
+exception_log:
+exception_fault_address:
+	/* The contents of FAR_EL3 when an exception is taken. */
+	.space 8, 0
+exception_type_code:
+	/* A generic code indicating what type of exception occurred. */
+	.space 8, 0
+#endif
+	.align 12
 system_stack:
 	.space 4096, 0
 system_stack_end:
diff --git a/tests/tcg/aarch64/system/boot.h b/tests/tcg/aarch64/system/boot.h
new file mode 100644
index 0000000000..cb9ab6c1b9
--- /dev/null
+++ b/tests/tcg/aarch64/system/boot.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ *
+ *
+ * Copyright (c) 2026 Linaro Ltd
+ *
+ */
+
+
+/* Global variables exported in boot.S */
+extern volatile uint64_t exception_fault_address; /* Updated by ISR */
+extern volatile uint64_t exception_type_code; /* Updated by ISR */
+extern uint64_t realms_gpt0[];
+extern uint64_t realms_gpt1[];

-- 
2.43.0



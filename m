Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79803CD6E57
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 18:27:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUqId-0000cy-2c; Wed, 03 Jun 2026 14:26:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wUqIU-0000YM-6O
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 14:26:35 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wUqIR-0003aN-03
 for qemu-arm@nongnu.org; Wed, 03 Jun 2026 14:26:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-45fd464d51fso2403123f8f.3
 for <qemu-arm@nongnu.org>; Wed, 03 Jun 2026 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780511189; x=1781115989; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JCOFwbtmACj5KLqY5uWhFxRDRINL6yEo/buAYwIBFpo=;
 b=w4ox6v6MiUUfabuSRGYj/ek7i1gSDSGBlrsv9ZN1ZrMoRawQFA4CCbE0tZST5acIfA
 sPW6LZ5LEOaxgBUMSefDO/vfQUynTutCzg6UoGEEMcCsAZtGHYSo8vDW4fMlU8Jg1hEj
 Jd06g6wViW5G7jTkVg7tFBMgmZUV8C9/RRH5XkrJkCJ1Cp69C6/qbkjklhwqRvD8WJAX
 E21Wm7GhgmT8pKWRn/hYgT7ZnAtGT19qx/38tS1pQmNfKsiqfir1FkjS6t81q2geYlH1
 KxEpv3PMu55KsLdUFci6MnfxWphG2lEghmLbMhwoxoQsh95U946uRTjo7ycndrMATMXE
 DviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780511189; x=1781115989;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JCOFwbtmACj5KLqY5uWhFxRDRINL6yEo/buAYwIBFpo=;
 b=GTYRny0jpKHYLFtCnZrhdwFKmRbbz8StwKgVTRAx3Ov2vKSzA5Xq+Ia+fRkGu8tA9e
 Iv06R2cRwgmP8xh5SRf1qKWSQFbeNZrjSPjjHh3nJsBkt04jymuDfUZvFY9yYUJ9XRBO
 C6KJi2NShJh2n5G6Bb0Lwlh+9yD+loufl6jXyi5KOQXBn+7JRhmiAVV9kI/HSZzddQOa
 GeuBAkS4JbGy2bAP4Rp/WUtmfQpishCIRE6Wick+2y8LcZVKdQj48EfMI3AtKSWDDo/j
 PBNfXbBiI4W6Qc6XIlQOWT7Zq0B2H0NDbzQgbZoNEv0y65RWyqmdoicZZ4oKtEzQAsbj
 DqyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9YBzhIp/AE7kqTa65OLsbFQ7dBePZUDbq193lbReWDUDunRtON6lguAvsII+0hVHJOgcuPeepTJw==@nongnu.org
X-Gm-Message-State: AOJu0YwcVZ/5sTQT0wMFeMZBKz2TDlARF4HkTWuh9V6uw/euOVrGcyV9
 0B6C9xKSyk6mGpMp0ogMbltzjrX9yodKuzA8MLyD1RG7EsiTgrizPhw3VgnTqEy3eRTSP0Yz7B0
 1G7lAVUk=
X-Gm-Gg: Acq92OG5UZ0hWHBQX3AkPQ2GwfyJFMxRpZN1wWahNnOlIRCrj4Ez+PAzuX2TA6eys8a
 q91bbElntOTQ1KWG85aiPvV+T5BQwNypAAfAOgtqiKtZTjE5T0Rel2w2OKEqe6UZGnNsG8abiFe
 6DqwhauYnmXpYBluSvXtI6ydeOyUzGe8qyBEmH1tnXPv3Y++LCEAEW1ADddRDj2Gy0O7IMBU9K8
 HSX06bd02RzYZ5/rXWA9TY9C9Ky4nYZhwQPtFde7QLO7AB5RA/fTGhYTOZOnyhQDC+K6+aQD622
 kDOIfBBYX+9+Bw2Q84FIT6aiIx3KYN4vxbUYFYeZzo4eQ8OJgTDPFAyDPkKk6VicXSKkv84Iw0t
 7zn5ZMgExMjbgCuY0GEeg33ZQCwxPKoaxVLNkEFFxV7FcNB4jlUBRxBwPBfvlI3Fr+s8+ivisaW
 U5W4sfR43bY6d77igPrfDVpyyzy+nDOhANp4a23g==
X-Received: by 2002:a05:6000:4b0b:b0:45e:f68d:e791 with SMTP id
 ffacd0b85a97d-46021615d47mr7464882f8f.0.1780511189508; 
 Wed, 03 Jun 2026 11:26:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:d530:6a6b:58a7:e220])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ed944sm9793127f8f.13.2026.06.03.11.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 11:26:29 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Wed, 03 Jun 2026 19:26:24 +0100
Subject: [PATCH v2 5/6] tests/tcg/aarch64/system: Alternative boot object
 for exception logging
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-jmac-gpc3b-v2-5-115c51936962@linaro.org>
References: <20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org>
In-Reply-To: <20260603-jmac-gpc3b-v2-0-115c51936962@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x42b.google.com
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

ALT_VECTOR_TABLE is added to switch this on, and altboot.o
is built from boot.S with this flag. Since boot.o is created for multiple
test targets, we have to build a separate object and selectively link this
new altboot.o into particular test binaries.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 tests/tcg/aarch64/Makefile.softmmu-target | 11 ++++--
 tests/tcg/aarch64/system/boot.S           | 62 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/system/boot.h           | 14 +++++++
 3 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index f7a7d2b800..47b32968fb 100644
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
 
+altboot.o: $(CRT_PATH)/boot.S
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -DALT_VECTOR_TABLE -x assembler-with-cpp -Wa,--noexecstack -c $< -o $@
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
index 8bfa4e4efc..57bddda976 100644
--- a/tests/tcg/aarch64/system/boot.S
+++ b/tests/tcg/aarch64/system/boot.S
@@ -60,6 +60,40 @@ curr_sp0_irq:
 curr_sp0_fiq:
 curr_sp0_serror:
 curr_spx_sync:
+#ifdef ALT_VECTOR_TABLE
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
@@ -404,6 +439,33 @@ ttb_stage2:
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
+#ifdef ALT_VECTOR_TABLE
+	.align 12
+	.global exception_log
+	.global exception_fault_address
+	.global exception_type_code
+exception_log:
+	/*
+	 *These fields record details of the last exception, if ALT_VECTOR_TABLE
+	 * is defined.
+	 */
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



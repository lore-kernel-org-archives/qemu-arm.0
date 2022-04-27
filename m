Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp711935lfu;
        Tue, 26 Apr 2022 21:23:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz+VDFylN5p5ikgV/ttUUnjBH3E+GzsbegSmOizanDZspMt2r0CDWNydtLYYIXLJNu+XNz
X-Received: by 2002:a05:622a:1a19:b0:2f3:6517:70aa with SMTP id f25-20020a05622a1a1900b002f3651770aamr10005914qtb.60.1651033428871;
        Tue, 26 Apr 2022 21:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651033428; cv=none;
        d=google.com; s=arc-20160816;
        b=QNj/w3f3bJ/SLxUO2Q6uTEh7ZA+H/UFjHGF3Dv8C5tLZ8w92mAzQPJiNv8h/jmDIkZ
         1W+XsOyAYPi0Li0vTCll8j4iWCKYrXHPgoqPI5z/9AVOvP8ZrzTnL9rZYv9dcohe+gDo
         MVQIPogXiszlV3EpbvAiLxCyNHJwcweSd/0idors0dgmhGPJMa69+vrs5nqOUUwxaml3
         C/lr4JAY3Pen9zCtjE9+5hUoZJQyWTuc4PpdoEiANGaHSPigL8oW6T36C8L70X3f4m4C
         iNSpY4t7vLF8P9v2N5uoOyI0kWC3sC3W4aLJxnsiu8S51ZCshF5Y1V58YJVoRUYJ5ZIh
         1KiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=tRHn2mdN0R0av8YyHUzJgxZG/sPCJkq9JFL0TZYgnqQ=;
        b=fo1BSzMtqZ+4HxQT+0ijROnVXAUTg4m7/77ShD9lJc5zsy8kGy23Rl0KTFBbwTZ2A4
         jpJR1AiAh1RY+mUihidRwzc2u2eoJ9zKzgy/iyq8KCCFxS08wWAxtec5CZytyNa9VpeN
         F4CCTtsZN9JCDn+hORNMx+rBJ78+kSqZm3DPmjpSogrr6CECNqpJoCD0QTWODld9d49D
         ZfGI0uGI9zjt8qwBSgAZ6tNeoumOZjNvzbkD8UGILKKDYBvBu+slLs8d2NVW8FwHiQhW
         KKnbke3cVvy7Vb2eLhwNPcSblLJut2a7Jt8NfAhMfYNNBQbqymnM8jHZ7YA8w1sZ36Y5
         rjMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gq2SusrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a05622a13ce00b002f1f1af53e0si81162qtk.645.2022.04.26.21.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 21:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gq2SusrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njZDP-000163-RO
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 00:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZD3-00014d-4A
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 00:23:25 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njZCw-0004ps-BK
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 00:23:21 -0400
Received: by mail-pl1-x62b.google.com with SMTP id c23so591134plo.0
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 21:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tRHn2mdN0R0av8YyHUzJgxZG/sPCJkq9JFL0TZYgnqQ=;
 b=Gq2SusrUeJPU7fI4BBK7yWivjCeTz9Rpm1knngsr/kmYtGTmrzeWvi5o31VHPEyi2U
 +2gmxMFNsAUwRL+OJJnjAxz+zdGYeJLkB797gSeeTRjf4eKDLzRD1jcm2I9TTOSfyJ4E
 pkpCqpl9OE0EoSfSUs943xilkOU+uG0a8wiSRBC71E5bry4yDRwHadKcWAyeIuuNKTHY
 UVYfyXlTTinXRVJRptaVB1hBOm38jOc5BrwAcbwRdN6bF6clONABiAtPa3WgvyjURIJA
 SsbvzCglVn9yWhzbuFr4H0rjhfJX9Vlzk/kMqTZs9SHxr60eyQHeec5o4aMEDD0t36F5
 /hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tRHn2mdN0R0av8YyHUzJgxZG/sPCJkq9JFL0TZYgnqQ=;
 b=IULjDibKVqivzvjey1PHCiapCz2uPXkWkSEnR1oKtm1RBJS8iDn9HU9So/uC9VlOci
 +Ub5lr40qANr4dGU8xOQV8AZGM8gl6ob+FCMpUCIETfvshR/3GhrcwMVQsb13AdC5U8D
 8DIjuhaG3HcT+bBw+SrD2/nUcv9rYvuyvdQKjiviqR8FkO08aAkwKIDYTV2btJjKCEjS
 1cLowXAyDl/Mkj12K6M0+QDjU++masVa2xOSZ0Mr+S4Lk36NAzQHK6h1Jt3oDBsSQY/8
 6HKpnf51OGcZY7cpvwdcWDZqzqqnH0H0BbFbPMRHELUsUno6FADzp6jGRHo8KPhN/k6c
 LX9Q==
X-Gm-Message-State: AOAM532vUWSgu8g2hBzln7Nnw12lHuHTCL3pVAqr5I4nkFI8auC9TcXQ
 nWBA7EmTUfUSKGEqU9Q3lGQYzoLnZgMiyA==
X-Received: by 2002:a17:90a:ba15:b0:1cb:be7d:bbca with SMTP id
 s21-20020a17090aba1500b001cbbe7dbbcamr41341075pjr.143.1651033393867; 
 Tue, 26 Apr 2022 21:23:13 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 iy19-20020a17090b16d300b001cd4989fee6sm4846064pjb.50.2022.04.26.21.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 21:23:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
Date: Tue, 26 Apr 2022 21:23:12 -0700
Message-Id: <20220427042312.294300-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8jTShajRS/CI

This controls whether the PACI{A,B}SP instructions trap with BTYPE=3
(indirect branch from register other than x16/x17).  The linux kernel
sets this in bti_enable().

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/998
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c                  |  2 ++
 tests/tcg/aarch64/bti-3.c         | 42 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  8 +++---
 3 files changed, 48 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/aarch64/bti-3.c

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e3f8215203..c50a8dca0b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -197,6 +197,8 @@ static void arm_cpu_reset(DeviceState *dev)
         /* Enable all PAC keys.  */
         env->cp15.sctlr_el[1] |= (SCTLR_EnIA | SCTLR_EnIB |
                                   SCTLR_EnDA | SCTLR_EnDB);
+        /* Trap on btype=3 for PACIxSP. */
+        env->cp15.sctlr_el[1] |= SCTLR_BT0;
         /* and to the FP/Neon instructions */
         env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 20, 2, 3);
         /* and to the SVE instructions */
diff --git a/tests/tcg/aarch64/bti-3.c b/tests/tcg/aarch64/bti-3.c
new file mode 100644
index 0000000000..a852856d9a
--- /dev/null
+++ b/tests/tcg/aarch64/bti-3.c
@@ -0,0 +1,42 @@
+/*
+ * BTI vs PACIASP
+ */
+
+#include "bti-crt.inc.c"
+
+static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
+{
+    uc->uc_mcontext.pc += 8;
+    uc->uc_mcontext.pstate = 1;
+}
+
+#define BTYPE_1() \
+    asm("mov %0,#1; adr x16, 1f; br x16; 1: hint #25; mov %0,#0" \
+        : "=r"(skipped) : : "x16", "x30")
+
+#define BTYPE_2() \
+    asm("mov %0,#1; adr x16, 1f; blr x16; 1: hint #25; mov %0,#0" \
+        : "=r"(skipped) : : "x16", "x30")
+
+#define BTYPE_3() \
+    asm("mov %0,#1; adr x15, 1f; br x15; 1: hint #25; mov %0,#0" \
+        : "=r"(skipped) : : "x15", "x30")
+
+#define TEST(WHICH, EXPECT) \
+    do { WHICH(); fail += skipped ^ EXPECT; } while (0)
+
+int main()
+{
+    int fail = 0;
+    int skipped;
+
+    /* Signal-like with SA_SIGINFO.  */
+    signal_info(SIGILL, skip2_sigill);
+
+    /* With SCTLR_EL1.BT0 set, PACIASP is not compatible with type=3. */
+    TEST(BTYPE_1, 0);
+    TEST(BTYPE_2, 0);
+    TEST(BTYPE_3, 1);
+
+    return fail;
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 6ad0ad49f9..a738eb137c 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -26,11 +26,11 @@ run-plugin-pauth-%: QEMU_OPTS += -cpu max
 endif
 
 # BTI Tests
-# bti-1 tests the elf notes, so we require special compiler support.
+# bti-1 test the elf notes, so we require special compiler support.
 ifneq ($(CROSS_CC_HAS_ARMV8_BTI),)
-AARCH64_TESTS += bti-1
-bti-1: CFLAGS += -mbranch-protection=standard
-bti-1: LDFLAGS += -nostdlib
+AARCH64_TESTS += bti-1 bti-3
+bti-1 bti-3: CFLAGS += -mbranch-protection=standard
+bti-1 bti-3: LDFLAGS += -nostdlib
 endif
 # bti-2 tests PROT_BTI, so no special compiler support required.
 AARCH64_TESTS += bti-2
-- 
2.34.1


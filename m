Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1944761lfq;
        Fri, 2 Oct 2020 15:00:10 -0700 (PDT)
X-Received: by 2002:a9d:5a8c:: with SMTP id w12mr3207699oth.332.1601676010513;
        Fri, 02 Oct 2020 15:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601676010; cv=none;
        d=google.com; s=arc-20160816;
        b=avJQcnVlEHftbGHmMtimXgi8x6M+3bYEe/yA9BuyIDCJmZ0sj3My9hUae3us2sFxvL
         BuEnNZmsPl90ajGRg8giCx0uCABzTDQyr4FVknvLTYThQnuNOxXbMp4L9+To0wnqpIsE
         qp1m/UG+uCwLeOFwnhFU8ZrRXbL1du+7jP5bXilemYLJTbJk8UfOZKM16kSstQukf6Cf
         eWfQYdFj7lt98hYhH4EaF3hGD3N695BGO/67TtXY8VeEmLhsESAgKZ9PF/XWKShl//GT
         LJzDTFF0l6mlwslmk2NnWc36L8sbupd2fZZmgROR1P4/ThbO5pBwMNL9hrYeVvOPHhUR
         LWzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=S4v0KO82Wzlx0JZkhGIkBUAKLry2EN5cCldjJF9G/o4=;
        b=TNBZD4zoQLe1wV8bYX3FgIizamdSp5BuFRp2XzkOIhzu1nlMz5ld+0vB6LiiLYeV7Q
         DZ2qAbsvdNtbPcH9H/TzGaJjIwjTIvL2vI9neKXCP6ESjFI6soT8QJIhYmQY4mAkknJb
         yJgxb/puRfWyuE8VDGA3xVc0kRMpeV5z0Idb/6GXD+fhaW0tffo2MdG6jk8iHwNIySMq
         AVqSVWYiwBRnMuDpMcKwsAO69srU2e2gnZfIc56cbahr/G70eWtpBQ1mZnd7BwGJMesZ
         0dUs0RqeppLwtJ52mdIaHHnM7LU+uVZdZHwtcDrETJZLRvFbzEs8SUobxnZfqI5Ddi7j
         WVMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LwMqakNC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x68sor203224oix.114.2020.10.02.15.00.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Oct 2020 15:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LwMqakNC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S4v0KO82Wzlx0JZkhGIkBUAKLry2EN5cCldjJF9G/o4=;
        b=LwMqakNC2QpnD9J255X+mbTTPKvXL9QSu/A20IPVh7SQzOAMWEwVzamj4SeE9MgwU8
         4OSWR+zBL4QscrJqidiP3RssFihuT5Ckfr3fH1/tXf3oe42SoIvXuCY+EIbIPq3u5vXc
         MXuyUJVwLj+DGfUcxbXC7O5q/kpaUzBC55jhnGsI6zYgeam8eGb2NHKBR1XkMc7OUnJK
         K5vME11cMvtUzJevkdaWMmzG+Rr6ilsWw0ArMYSTjtAFfQBwHIx1pJlRf4g8+T8gOY3O
         zwuuiHpIbKtwnFCCXqkGcJjeyWFDhvpPn7BNMpyiv53JWIvP7IFx/o0ntqmbyaFTFSjB
         SZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S4v0KO82Wzlx0JZkhGIkBUAKLry2EN5cCldjJF9G/o4=;
        b=U4uW1/YNqdgCsz3H03Dqqr0uHx0BjPDWTr12FOMt9Yg5eCxYYrIU/bNHb863PcLFVw
         PzRHOOph/+0G4MH9+WWxDAganLy99JRnEjbFTfFoJEOPUo1ye299PanGMxau884fYTe0
         lYgfx9CMOV//t+E41qlCWTFcMkU+oLz40RGMIxj9oMPFGG8SuZVY8UBwYjJU2/Z0cL+L
         Z8UBEkXYmts8IPrXrHuC6mpPnz1Gm6JIaKWK+0MAPQXpSDdOLCE0U+algO2/w02gHlQn
         rZn/kv75ylqAzTMUDcEh27HlKelXmrccA7csshCEdJxDoXRyHWsp3ZP8hcOE+sFCShrO
         qtKg==
X-Gm-Message-State: AOAM5312iazAZZr6ovGndBXyTnaDQCJHdR+NMFxyZ43FOlpd+fJlbVMu
	kX5VAxweKIHBqqohoxLidgqI5yuRq+yVYHDn6To=
X-Google-Smtp-Source: ABdhPJyDg5AYgtto1TjYwk96iEDlmR2uWk2IWKxajQsAfXzMXEG+9UxteMc+BygUv2Cdy4Ra8y6XbA==
X-Received: by 2002:aca:5b09:: with SMTP id p9mr2381132oib.68.1601676010042;
        Fri, 02 Oct 2020 15:00:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k10sm684268ots.60.2020.10.02.15.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:00:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v10 8/8] tests/tcg/aarch64: Add bti smoke test
Date: Fri,  2 Oct 2020 16:59:55 -0500
Message-Id: <20201002215955.254866-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002215955.254866-1-richard.henderson@linaro.org>
References: <20201002215955.254866-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FCw+lqj3/iwW

This test requires gcc 10 for -mbranch-protection=standard.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v9: Expect and require gcc 10.
---
 tests/tcg/aarch64/bti-1.c         | 62 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/bti-crt.inc.c   | 51 +++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  7 ++++
 tests/tcg/configure.sh            |  4 ++
 4 files changed, 124 insertions(+)
 create mode 100644 tests/tcg/aarch64/bti-1.c
 create mode 100644 tests/tcg/aarch64/bti-crt.inc.c

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
new file mode 100644
index 0000000000..61924f0d7a
--- /dev/null
+++ b/tests/tcg/aarch64/bti-1.c
@@ -0,0 +1,62 @@
+/*
+ * Branch target identification, basic notskip cases.
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
+#define NOP       "nop"
+#define BTI_N     "hint #32"
+#define BTI_C     "hint #34"
+#define BTI_J     "hint #36"
+#define BTI_JC    "hint #38"
+
+#define BTYPE_1(DEST) \
+    asm("mov %0,#1; adr x16, 1f; br x16; 1: " DEST "; mov %0,#0" \
+        : "=r"(skipped) : : "x16")
+
+#define BTYPE_2(DEST) \
+    asm("mov %0,#1; adr x16, 1f; blr x16; 1: " DEST "; mov %0,#0" \
+        : "=r"(skipped) : : "x16", "x30")
+
+#define BTYPE_3(DEST) \
+    asm("mov %0,#1; adr x15, 1f; br x15; 1: " DEST "; mov %0,#0" \
+        : "=r"(skipped) : : "x15")
+
+#define TEST(WHICH, DEST, EXPECT) \
+    do { WHICH(DEST); fail += skipped ^ EXPECT; } while (0)
+
+
+int main()
+{
+    int fail = 0;
+    int skipped;
+
+    /* Signal-like with SA_SIGINFO.  */
+    signal_info(SIGILL, skip2_sigill);
+
+    TEST(BTYPE_1, NOP, 1);
+    TEST(BTYPE_1, BTI_N, 1);
+    TEST(BTYPE_1, BTI_C, 0);
+    TEST(BTYPE_1, BTI_J, 0);
+    TEST(BTYPE_1, BTI_JC, 0);
+
+    TEST(BTYPE_2, NOP, 1);
+    TEST(BTYPE_2, BTI_N, 1);
+    TEST(BTYPE_2, BTI_C, 0);
+    TEST(BTYPE_2, BTI_J, 1);
+    TEST(BTYPE_2, BTI_JC, 0);
+
+    TEST(BTYPE_3, NOP, 1);
+    TEST(BTYPE_3, BTI_N, 1);
+    TEST(BTYPE_3, BTI_C, 1);
+    TEST(BTYPE_3, BTI_J, 0);
+    TEST(BTYPE_3, BTI_JC, 0);
+
+    return fail;
+}
diff --git a/tests/tcg/aarch64/bti-crt.inc.c b/tests/tcg/aarch64/bti-crt.inc.c
new file mode 100644
index 0000000000..47805f4e35
--- /dev/null
+++ b/tests/tcg/aarch64/bti-crt.inc.c
@@ -0,0 +1,51 @@
+/*
+ * Minimal user-environment for testing BTI.
+ *
+ * Normal libc is not (yet) built with BTI support enabled,
+ * and so could generate a BTI TRAP before ever reaching main.
+ */
+
+#include <stdlib.h>
+#include <signal.h>
+#include <ucontext.h>
+#include <asm/unistd.h>
+
+int main(void);
+
+void _start(void)
+{
+    exit(main());
+}
+
+void exit(int ret)
+{
+    register int x0 __asm__("x0") = ret;
+    register int x8 __asm__("x8") = __NR_exit;
+
+    asm volatile("svc #0" : : "r"(x0), "r"(x8));
+    __builtin_unreachable();
+}
+
+/*
+ * Irritatingly, the user API struct sigaction does not match the
+ * kernel API struct sigaction.  So for simplicity, isolate the
+ * kernel ABI here, and make this act like signal.
+ */
+void signal_info(int sig, void (*fn)(int, siginfo_t *, ucontext_t *))
+{
+    struct kernel_sigaction {
+        void (*handler)(int, siginfo_t *, ucontext_t *);
+        unsigned long flags;
+        unsigned long restorer;
+        unsigned long mask;
+    } sa = { fn, SA_SIGINFO, 0, 0 };
+
+    register int x0 __asm__("x0") = sig;
+    register void *x1 __asm__("x1") = &sa;
+    register void *x2 __asm__("x2") = 0;
+    register int x3 __asm__("x3") = sizeof(unsigned long);
+    register int x8 __asm__("x8") = __NR_rt_sigaction;
+
+    asm volatile("svc #0"
+                 : : "r"(x0), "r"(x1), "r"(x2), "r"(x3), "r"(x8) : "memory");
+}
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index e7249915e7..491683e91d 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -25,6 +25,13 @@ run-pauth-%: QEMU_OPTS += -cpu max
 run-plugin-pauth-%: QEMU_OPTS += -cpu max
 endif
 
+# BTI Tests
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_BTI),)
+AARCH64_TESTS += bti-1
+bti-%: CFLAGS += -mbranch-protection=standard
+bti-%: LDFLAGS += -nostdlib
+endif
+
 # Semihosting smoke test for linux-user
 AARCH64_TESTS += semihosting
 run-semihosting: semihosting
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index be51bdb5a4..e1b70e25f2 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -240,6 +240,10 @@ for target in $target_list; do
                -march=armv8.3-a -o $TMPE $TMPC; then
                 echo "CROSS_CC_HAS_ARMV8_3=y" >> $config_target_mak
             fi
+            if do_compiler "$target_compiler" $target_compiler_cflags \
+               -mbranch-protection=standard -o $TMPE $TMPC; then
+                echo "CROSS_CC_HAS_ARMV8_BTI=y" >> $config_target_mak
+            fi
         ;;
     esac
 
-- 
2.25.1

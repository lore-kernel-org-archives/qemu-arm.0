Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1781146lfa;
        Fri, 16 Oct 2020 11:42:29 -0700 (PDT)
X-Received: by 2002:a62:1a4c:0:b029:152:706d:dabb with SMTP id a73-20020a621a4c0000b0290152706ddabbmr5043866pfa.40.1602873748974;
        Fri, 16 Oct 2020 11:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602873748; cv=none;
        d=google.com; s=arc-20160816;
        b=J2M9X/GGAAU4nlpu2O6ywAijqduUbYxrLyESL3zHC9YInr69H3nk1omgrkVagoxOIX
         W08m6JcH6EzJroGQ/updgAZuKNiKClrpapRbis2Y4DanOohwAv+AF4xmZiw/1cSCa4zh
         EyzdNAidL2pWfD6lZDhWedQQ1QFD7JCqeD9VYt3lCJJTBuKGvum0RLh+IV0eHfynPHtI
         QVZA26xOeth4OMCVBrqy/zKBTsePEyKUa8Gdn0Q6nD9Zpj5u4rhljcxBLoYL4l93B5k/
         g97tc2nPs+FBrU7OcOyUrgiibAkIRTSgRkODy5W3dvAsWtxZc7AJCh17qClDfSPFQ7Lf
         HG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sxotxj6XB7hzF7JenULfKlm4NqUCIgIUU5zaZ0WIWOQ=;
        b=JtJeUU+RVMvh4mUX/V5m+j2X3TmBt+IwdIG13Y9lSFUd3IOUUgzn+dklH+3HXQwSS4
         0LHBknbfXs360dj/TEO0w6+vIInMgXLAVGNyvx7ESIQOMJhNAR5s3oHxmdYIWlmheVhb
         2hSwRw0sbv6/Pkz4uqY0u/pySmRTTirHx1Vy4nQPP9Fuda5MzvlJK9P1MKhWNRbd66lM
         uvfKXDNze0lgwwyviNlgFrep43JDtIkLZF95UTrT4Ojv/NjHRryHJW1lkDd2EiKvV1KW
         AeOHdiR13zYIZuhRuLyTEyglIdqf7ngxJz9vKQJO4O7t25tnRU0NonOSCnLuOfFzNoep
         cltg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yS2Jo41y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w2sor1718916pjv.43.2020.10.16.11.42.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 16 Oct 2020 11:42:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yS2Jo41y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sxotxj6XB7hzF7JenULfKlm4NqUCIgIUU5zaZ0WIWOQ=;
        b=yS2Jo41yV7EhlVhdqVxZ7EAubOw+rSsvov7dgPhqj481h70lP3dpb/mZwDCYW0hkP+
         ZL3qx/vEyAcBsrtUOBNsbchYradWQl0z5ejy5foaLM9HNmPay7A7lmQ5gRAJH4/dbrrR
         9CETd+4kfnNmFvMkM9bKqHcv9w19m5mdDAae/INUg2eqRjVHv2DCQ+Gskw1i+n0zZ470
         zaQCZ3W3Uu3eNySOLxDtS0PVRaSIQK45Ipcfmhs0Y5Z4A46s2DHEo7oIoApyqlQR3ALr
         Miw2jmcnQNFqjxo2A10TC+7dEZyyFsD78fuCBrzx62kMYNszMK1clGhI4LCs0Gc87/os
         Iv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sxotxj6XB7hzF7JenULfKlm4NqUCIgIUU5zaZ0WIWOQ=;
        b=IBm3+/DQnDSrSyZplXfd/JU1eZxvilwzBc4EaB1ziISHsYm3N6VcTiZGv6q49ULeeh
         GWGm82W4CbNuqCsBAZoZlW9aQ0uwwInQGVHAMY5dNuFDBx8XnbqGGwg0VfCLIRzy4iNY
         UunTm2ugi6UhPo0Z1X9TNZcFuTbPBtW/4F6SVLwZVYD18hmPslCurEb4dt2rbI5l7nWc
         0EnnDzTKQYd6xO+wssgFxqsOs81TdMCT85IiuZcstC7JVs6LcCuBiZvl3ePyh9uT+l6P
         Ncdl9d5pkpsNPHJJZSIwSsDOpj6DSIUbs7Ek72ujBDL7hIprhi1M3t/vyPUwMGka8Mah
         b4gQ==
X-Gm-Message-State: AOAM532FIItjmCl23rr04hNYfLYOiSLfPH0N1/8lIil9j5cCu1189eMb
	eEqVBtQHD1S8kQTqaUWkweWN9M2y
X-Google-Smtp-Source: ABdhPJzOnl5cpuWrA60i+NFXVU8zxCowjszm0rvCnuT52zUSguaWhUnTZN9+wwM+rH/Hmbd5zj2RZQ==
X-Received: by 2002:a17:90a:be11:: with SMTP id a17mr5136520pjs.181.1602873748439;
        Fri, 16 Oct 2020 11:42:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id c15sm3426011pgg.77.2020.10.16.11.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:42:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v11 12/12] tests/tcg/aarch64: Add bti smoke tests
Date: Fri, 16 Oct 2020 11:42:07 -0700
Message-Id: <20201016184207.786698-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
References: <20201016184207.786698-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zdodOqaiwv2O

The note test requires gcc 10 for -mbranch-protection=standard.
The mmap test uses PROT_BTI and does not require special compiler support.

Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v9: Expect and require gcc 10.
v11: Squash mmap smoke test.
---
 tests/tcg/aarch64/bti-1.c         |  62 +++++++++++++++++
 tests/tcg/aarch64/bti-2.c         | 108 ++++++++++++++++++++++++++++++
 tests/tcg/aarch64/bti-crt.inc.c   |  51 ++++++++++++++
 tests/tcg/aarch64/Makefile.target |  10 +++
 tests/tcg/configure.sh            |   4 ++
 5 files changed, 235 insertions(+)
 create mode 100644 tests/tcg/aarch64/bti-1.c
 create mode 100644 tests/tcg/aarch64/bti-2.c
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
diff --git a/tests/tcg/aarch64/bti-2.c b/tests/tcg/aarch64/bti-2.c
new file mode 100644
index 0000000000..6dc8908b5a
--- /dev/null
+++ b/tests/tcg/aarch64/bti-2.c
@@ -0,0 +1,108 @@
+/*
+ * Branch target identification, basic notskip cases.
+ */
+
+#include <stdio.h>
+#include <signal.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/mman.h>
+
+#ifndef PROT_BTI
+#define PROT_BTI  0x10
+#endif
+
+static void skip2_sigill(int sig, siginfo_t *info, void *vuc)
+{
+    ucontext_t *uc = vuc;
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
+#define BTYPE_1(DEST)    \
+    "mov x1, #1\n\t"     \
+    "adr x16, 1f\n\t"    \
+    "br x16\n"           \
+"1: " DEST "\n\t"        \
+    "mov x1, #0"
+
+#define BTYPE_2(DEST)    \
+    "mov x1, #1\n\t"     \
+    "adr x16, 1f\n\t"    \
+    "blr x16\n"          \
+"1: " DEST "\n\t"        \
+    "mov x1, #0"
+
+#define BTYPE_3(DEST)    \
+    "mov x1, #1\n\t"     \
+    "adr x15, 1f\n\t"    \
+    "br x15\n"           \
+"1: " DEST "\n\t"        \
+    "mov x1, #0"
+
+#define TEST(WHICH, DEST, EXPECT) \
+    WHICH(DEST) "\n"              \
+    ".if " #EXPECT "\n\t"         \
+    "eor x1, x1," #EXPECT "\n"    \
+    ".endif\n\t"                  \
+    "add x0, x0, x1\n\t"
+
+extern char test_begin[], test_end[];
+
+asm("\n"
+"test_begin:\n\t"
+    BTI_C "\n\t"
+    "mov x2, x30\n\t"
+    "mov x0, #0\n\t"
+
+    TEST(BTYPE_1, NOP, 1)
+    TEST(BTYPE_1, BTI_N, 1)
+    TEST(BTYPE_1, BTI_C, 0)
+    TEST(BTYPE_1, BTI_J, 0)
+    TEST(BTYPE_1, BTI_JC, 0)
+
+    TEST(BTYPE_2, NOP, 1)
+    TEST(BTYPE_2, BTI_N, 1)
+    TEST(BTYPE_2, BTI_C, 0)
+    TEST(BTYPE_2, BTI_J, 1)
+    TEST(BTYPE_2, BTI_JC, 0)
+
+    TEST(BTYPE_3, NOP, 1)
+    TEST(BTYPE_3, BTI_N, 1)
+    TEST(BTYPE_3, BTI_C, 1)
+    TEST(BTYPE_3, BTI_J, 0)
+    TEST(BTYPE_3, BTI_JC, 0)
+
+    "ret x2\n"
+"test_end:"
+);
+
+int main()
+{
+    struct sigaction sa;
+
+    void *p = mmap(0, getpagesize(),
+                   PROT_EXEC | PROT_READ | PROT_WRITE | PROT_BTI,
+                   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+    if (p == MAP_FAILED) {
+        perror("mmap");
+        return 1;
+    }
+
+    memset(&sa, 0, sizeof(sa));
+    sa.sa_sigaction = skip2_sigill;
+    sa.sa_flags = SA_SIGINFO;
+    if (sigaction(SIGILL, &sa, NULL) < 0) {
+        perror("sigaction");
+        return 1;
+    }
+
+    memcpy(p, test_begin, test_end - test_begin);
+    return ((int (*)(void))p)();
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
index e7249915e7..d7d33e293c 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -25,6 +25,16 @@ run-pauth-%: QEMU_OPTS += -cpu max
 run-plugin-pauth-%: QEMU_OPTS += -cpu max
 endif
 
+# BTI Tests
+# bti-1 tests the elf notes, so we require special compiler support.
+ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_BTI),)
+AARCH64_TESTS += bti-1
+bti-1: CFLAGS += -mbranch-protection=standard
+bti-1: LDFLAGS += -nostdlib
+endif
+# bti-2 tests PROT_BTI, so no special compiler support required.
+AARCH64_TESTS += bti-2
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

Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp467604ejx;
        Mon, 21 Aug 2023 21:27:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp05DiPPGR8wPIQKNax+oXt72YuoakT4gl8D6WxfT13sDYSXGyf/J2U1WLFKCduobb1tD7
X-Received: by 2002:a05:622a:d6:b0:402:d96c:c840 with SMTP id p22-20020a05622a00d600b00402d96cc840mr12377295qtw.18.1692678422318;
        Mon, 21 Aug 2023 21:27:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692678422; cv=none;
        d=google.com; s=arc-20160816;
        b=HKPiGqKhfVOgBbbjTGrpmJmT1vl4dvWBKkA0aiRVfrgTaPMvVevMGLgKE90PYsdw7w
         cyUw4up4Qt6GbzgoYdpkZzjIfiO4J/fIotivXEHrvCmc8538YzZpLaYptg5nw0rRBgsG
         4GKuPXv0kF6K97bJRL4GUwgEwkOaDJ9J8jzMFMIf1kiweg26Z1f4F6xT2nhE1GTHIJWy
         zrooxoooPh6g2XXX2sTZeFNgisTRErgp8bTpJmR+Ae3BNRC+K51zsp6AQWLZoEdZfFrj
         UjelOQxNph2Maee4CQJ+NZK4A0HubbZw+mMsmOWlU14e5FNw5dfoGIy78GRUp0CA+kgL
         lFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GKKXT9DfTD7fk9RFPmaJK1tvcnI2h1es3y0tUToo9LE=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=da+7AQp5bVBesTZo53rLKvY4fuTIhYw1cAFPfPFYym1UJ/zHnCEUnk4OyUngXdEuSN
         DvQh6Icr7gkGZ1JH8JBMXDNNDav3jxANM70l8IWkxu8m84Ut3IgH8oD7+PYPGSD9ahEd
         aWpAzrDTOLfWDR1c06UV8PvmLduh04Ae+IZzTgu/YuLiBVZ/PYQigT5XBiBqQUccetUM
         5AmbMkYMJU2yeDw4C8Vipyk24Y9mgDAm2akHzMgzJKvWqg9L2YWK2SvREAK/hIebKdh0
         qH4oaz7G9tOBZ1JmuSA56y+POVUqTStr4da5hptv4n7qCg2/t2WkNvYDVH78mVVmPIq8
         WDEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yswBk9T+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl18-20020a05620a1a9200b00767c77c80b5si769511qkb.477.2023.08.21.21.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Aug 2023 21:27:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yswBk9T+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYIxY-0006IG-SR; Tue, 22 Aug 2023 00:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxX-0006Ew-01
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:39 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qYIxS-0007Vy-Gh
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 00:25:38 -0400
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a85c5854deso1113536b6e.0
 for <qemu-arm@nongnu.org>; Mon, 21 Aug 2023 21:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692678333; x=1693283133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GKKXT9DfTD7fk9RFPmaJK1tvcnI2h1es3y0tUToo9LE=;
 b=yswBk9T+36TM/RGeloDgkFjIfcVZ9EJU9e3UA5VdwJH4eIDKcXwQSqGbIhvRW33xq2
 KFre4jNGhJTq/gqosDJEf/7xwXa0mwDj7JnvKUUNdnkzU63XOtwLiXFLXa2r8VsC1KKU
 fRzpOJio5mUg0DdpQ57EhxAazZx4o9ba2UWPixL4eJkhS64JY+d9Qe/+friYMSOD4HzS
 fkB9WZrtCi/yVFIUx61XfIWCBScj/dU2cHSaMwwMHrxPlpH7VLCCFKX+kcFpuYBM+bAB
 +s2QIZ/JcHQsu1Vfw/IqhzxldYX/anm0ffBhysZz7oOFvDNImuJpmyjywle9P2m9pleh
 f9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692678333; x=1693283133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GKKXT9DfTD7fk9RFPmaJK1tvcnI2h1es3y0tUToo9LE=;
 b=bnWQ1zwgqFZTuKJpOgR10i4Z2v8KznUBolQBGbl3VZlSTekjsdikjwQ+4Z4DEk4AAt
 8o/xQ1R6xLy5cwDBfR2PLMwnb5GWK3ooW/MC2Ap32zgU1h3yKJQrxuoi1COT26J22SSQ
 moZjs3vLkhexCX8WeYYTF4Wi0I4mpiykzuEfZY+TO+hk+aWaYYLflF15O5tGGx6jsEWm
 OMk8N+II9mkfZnP31iazgelPdubDKOZqlER7ZiS+ZokjGbevE92Aef43NEU7qyoBkwPR
 MgO8f/a9YRRMU57rD4Iw18qUpfSqzAXcR2YrGGxOCR3hXAHM2qYsNaTy0Cusr2Pdsl4z
 woVg==
X-Gm-Message-State: AOJu0YxiXxxfiFG50tzqWmG1NQWAO3TUePpkEu0qobW+3zHlbciimmHU
 2rOjVbxElfksmdATRrwlTll6+CntOr7tiMmV0N8=
X-Received: by 2002:a54:4d9b:0:b0:3a7:4f89:5b6d with SMTP id
 y27-20020a544d9b000000b003a74f895b6dmr8686434oix.58.1692678332956; 
 Mon, 21 Aug 2023 21:25:32 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:2c08:e710:4459:46f1])
 by smtp.gmail.com with ESMTPSA id
 m14-20020aa7900e000000b0068a3f861b24sm3364908pfo.195.2023.08.21.21.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Aug 2023 21:25:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 1/9] tests/tcg/aarch64: Adjust pauth tests for FEAT_FPAC
Date: Mon, 21 Aug 2023 21:25:22 -0700
Message-Id: <20230822042530.1026751-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230822042530.1026751-1-richard.henderson@linaro.org>
References: <20230822042530.1026751-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 12o0GfJpapqR

With FEAT_FPAC, AUT* instructions that fail authentication
do not produce an error value but instead fault.

For pauth-2, install a signal handler and verify it gets called.

For pauth-4 and pauth-5, we are explicitly testing the error value,
so there's nothing to test with FEAT_FPAC, so exit early.
Adjust the makefile to use -cpu neoverse-v1, which has FEAT_EPAC
but not FEAT_FPAC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/pauth-2.c       | 61 +++++++++++++++++++++++++++----
 tests/tcg/aarch64/pauth-4.c       | 28 ++++++++++++--
 tests/tcg/aarch64/pauth-5.c       | 20 ++++++++++
 tests/tcg/aarch64/Makefile.target |  5 ++-
 4 files changed, 101 insertions(+), 13 deletions(-)

diff --git a/tests/tcg/aarch64/pauth-2.c b/tests/tcg/aarch64/pauth-2.c
index 978652ede3..d498d7dd8b 100644
--- a/tests/tcg/aarch64/pauth-2.c
+++ b/tests/tcg/aarch64/pauth-2.c
@@ -1,5 +1,21 @@
 #include <stdint.h>
+#include <signal.h>
+#include <stdlib.h>
 #include <assert.h>
+#include <sys/auxv.h>
+
+static void sigill(int sig, siginfo_t *info, void *vuc)
+{
+    ucontext_t *uc = vuc;
+    uint64_t test;
+
+    /* There is only one insn below that is allowed to fault. */
+    asm volatile("adr %0, auth2_insn" : "=r"(test));
+    assert(test == uc->uc_mcontext.pc);
+    exit(0);
+}
+
+static int pac_feature;
 
 void do_test(uint64_t value)
 {
@@ -27,31 +43,60 @@ void do_test(uint64_t value)
      * An invalid salt usually fails authorization, but again there
      * is a chance of choosing another salt that works.
      * Iterate until we find another salt which does fail.
+     *
+     * With FEAT_FPAC, this will SIGILL instead of producing a result.
      */
     for (salt2 = salt1 + 1; ; salt2++) {
-        asm volatile("autda %0, %2" : "=r"(decode) : "0"(encode), "r"(salt2));
+        asm volatile("auth2_insn: autda %0, %2"
+                     : "=r"(decode) : "0"(encode), "r"(salt2));
         if (decode != value) {
             break;
         }
     }
 
+    assert(pac_feature < 4);  /* No FEAT_FPAC */
+
     /* The VA bits, bit 55, and the TBI bits, should be unchanged.  */
     assert(((decode ^ value) & 0xff80ffffffffffffull) == 0);
 
     /*
-     * Bits [54:53] are an error indicator based on the key used;
-     * the DA key above is keynumber 0, so error == 0b01.  Otherwise
-     * bit 55 of the original is sign-extended into the rest of the auth.
+     * Without FEAT_Pauth2, bits [54:53] are an error indicator based on
+     * the key used; the DA key above is keynumber 0, so error == 0b01.
+     * Otherwise * bit 55 of the original is sign-extended into the rest
+     * of the auth.
      */
-    if ((value >> 55) & 1) {
-        assert(((decode >> 48) & 0xff) == 0b10111111);
-    } else {
-        assert(((decode >> 48) & 0xff) == 0b00100000);
+    if (pac_feature < 3) {
+        if ((value >> 55) & 1) {
+            assert(((decode >> 48) & 0xff) == 0b10111111);
+        } else {
+            assert(((decode >> 48) & 0xff) == 0b00100000);
+        }
     }
 }
 
 int main()
 {
+    static const struct sigaction sa = {
+        .sa_sigaction = sigill,
+        .sa_flags = SA_SIGINFO
+    };
+    unsigned long isar1, isar2;
+
+    assert(getauxval(AT_HWCAP) & HWCAP_CPUID);
+
+    asm("mrs %0, id_aa64isar1_el1" : "=r"(isar1));
+    asm("mrs %0, id_aa64isar2_el1" : "=r"(isar2));
+
+    pac_feature = ((isar1 >> 4) & 0xf)   /* APA */
+                | ((isar1 >> 8) & 0xf)   /* API */
+                | ((isar2 >> 12) & 0xf); /* APA3 */
+    assert(pac_feature != 0);
+
+    if (pac_feature >= 4) {
+        /* FEAT_FPAC */
+        sigaction(SIGILL, &sa, NULL);
+    }
+
     do_test(0);
     do_test(0xda004acedeadbeefull);
     return 0;
diff --git a/tests/tcg/aarch64/pauth-4.c b/tests/tcg/aarch64/pauth-4.c
index 24a639e36c..0d79ef21ea 100644
--- a/tests/tcg/aarch64/pauth-4.c
+++ b/tests/tcg/aarch64/pauth-4.c
@@ -2,14 +2,34 @@
 #include <assert.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <sys/auxv.h>
 
 #define TESTS 1000
 
 int main()
 {
+    char base[TESTS];
     int i, count = 0;
     float perc;
-    void *base = malloc(TESTS);
+    unsigned long isar1, isar2;
+    int pac_feature;
+
+    assert(getauxval(AT_HWCAP) & HWCAP_CPUID);
+
+    asm("mrs %0, id_aa64isar1_el1" : "=r"(isar1));
+    asm("mrs %0, id_aa64isar2_el1" : "=r"(isar2));
+
+    pac_feature = ((isar1 >> 4) & 0xf)   /* APA */
+                | ((isar1 >> 8) & 0xf)   /* API */
+                | ((isar2 >> 12) & 0xf); /* APA3 */
+
+    /*
+     * Exit if no PAuth or FEAT_FPAC, which will SIGILL on AUTIA failure
+     * rather than return an error for us to check below.
+     */
+    if (pac_feature == 0 || pac_feature >= 4) {
+        return 0;
+    }
 
     for (i = 0; i < TESTS; i++) {
         uintptr_t in, x, y;
@@ -17,7 +37,7 @@ int main()
         in = i + (uintptr_t) base;
 
         asm("mov %0, %[in]\n\t"
-            "pacia %0, sp\n\t"        /* sigill if pauth not supported */
+            "pacia %0, sp\n\t"
             "eor %0, %0, #4\n\t"      /* corrupt single bit */
             "mov %1, %0\n\t"
             "autia %1, sp\n\t"        /* validate corrupted pointer */
@@ -36,10 +56,10 @@ int main()
         if (x != y) {
             count++;
         }
-
     }
+
     perc = (float) count / (float) TESTS;
-    printf("Checks Passed: %0.2f%%", perc * 100.0);
+    printf("Checks Passed: %0.2f%%\n", perc * 100.0);
     assert(perc > 0.95);
     return 0;
 }
diff --git a/tests/tcg/aarch64/pauth-5.c b/tests/tcg/aarch64/pauth-5.c
index 67c257918b..5dbfb14768 100644
--- a/tests/tcg/aarch64/pauth-5.c
+++ b/tests/tcg/aarch64/pauth-5.c
@@ -1,4 +1,5 @@
 #include <assert.h>
+#include <sys/auxv.h>
 
 static int x;
 
@@ -6,6 +7,25 @@ int main()
 {
     int *p0 = &x, *p1, *p2, *p3;
     unsigned long salt = 0;
+    unsigned long isar1, isar2;
+    int pac_feature;
+
+    assert(getauxval(AT_HWCAP) & HWCAP_CPUID);
+
+    asm("mrs %0, id_aa64isar1_el1" : "=r"(isar1));
+    asm("mrs %0, id_aa64isar2_el1" : "=r"(isar2));
+
+    pac_feature = ((isar1 >> 4) & 0xf)   /* APA */
+                | ((isar1 >> 8) & 0xf)   /* API */
+                | ((isar2 >> 12) & 0xf); /* APA3 */
+
+    /*
+     * Exit if no PAuth or FEAT_FPAC, which will SIGILL on AUTDA failure
+     * rather than return an error for us to check below.
+     */
+    if (pac_feature == 0 || pac_feature >= 4) {
+        return 0;
+    }
 
     /*
      * With TBI enabled and a 48-bit VA, there are 7 bits of auth, and so
diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 681dfa077c..780ab3f183 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -42,7 +42,10 @@ endif
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
 pauth-%: CFLAGS += -march=armv8.3-a
-run-pauth-%: QEMU_OPTS += -cpu max
+run-pauth-1: QEMU_OPTS += -cpu max
+run-pauth-2: QEMU_OPTS += -cpu max
+run-pauth-4: QEMU_OPTS += -cpu neoverse-v1
+run-pauth-5: QEMU_OPTS += -cpu neoverse-v1
 endif
 
 # BTI Tests
-- 
2.34.1


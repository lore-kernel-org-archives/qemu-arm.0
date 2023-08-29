Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3989980ejc;
        Tue, 29 Aug 2023 16:26:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxZRkjBVLOZ63Y+6DGS7RuFzCe99yJemHiyUy99XNmHZnD6B6oedFXaxlpMRYbkOg1WLk4
X-Received: by 2002:a0c:eac4:0:b0:63c:ff47:dc10 with SMTP id y4-20020a0ceac4000000b0063cff47dc10mr460506qvp.54.1693351572226;
        Tue, 29 Aug 2023 16:26:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693351572; cv=none;
        d=google.com; s=arc-20160816;
        b=oL2xoI5vtTRPWjeafIZ2ARJCkn7nSrh2gjgsSO+IVYOyuMPv6pPxpB+wI45FJUMCoO
         ex7Fw3M63vgzhGlP173c9CngffyGYjAawQgwtNZhtwvAhLqYLHtrgL3JmQhEQgwJh9Mt
         tpqWzCFDpp7SMkRAlN/gMvVFKz1M6kd50ikTKfDMk6CwoZAr2cIGVA5JPOEGmthZa3Fh
         WTNNmtHaB3LJutYnQo19J7WifPOfCKpth2yeXb1wDnJQ4xrBLVXOwnAy74FCQ4mHAMNk
         3HQgAdxFvh1ivFbFb2Vb7OaB4hR9gYLdYfT4Gw2AEKfWYHE7uFH8Kz1BzooZY+o6K5uv
         2N8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GOQxCV2ZeNNpKDkyg+BAXzxnOS5aPcNG/SXJ9WibMEs=;
        fh=L6OjQZ2TPsHFQEGPRBuboSqhQBavDZ5pPqlyX67xn3A=;
        b=iqgzPApZwORtJIBQ4gHe7BfMU+T7FLZ6MafSfECaHtKeS8NkLuPcjJ+UA1yg2YcxfE
         cwLFH+PlxphE5omDrzkqSpRu5On2odShdg1e0R9BO9Wc8QajGbKaYTiYHsAdUIgXWuZl
         wXdlDFvmTCW7b5q5VgTDfhvC49VROal4JNI6ZxcofN6rlxHGGJz0KgB5SvbFDDf0EZDz
         6wVaLC0yZM5EZt8rAQRXAtah47lpSZmaOu1M3BZxOl9d1FTtu5kQUWnusVTwOfcVdEyq
         Lkj5y1BGGGzMXXn+ZVHO56Fp+/ZxcjhZMlRZ9tR5wjrr5DgXopkm6Dihmua2vmMl3pMA
         FCFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4WCu8KI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a0cf0c7000000b00647fe073b5asi5217920qvl.240.2023.08.29.16.26.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 16:26:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y4WCu8KI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb83m-0003K3-A6; Tue, 29 Aug 2023 19:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83k-00035J-JB
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 19:23:44 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb83f-0001Lt-Ff
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 19:23:44 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68c3b9f85b7so2476188b3a.2
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 16:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693351418; x=1693956218; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GOQxCV2ZeNNpKDkyg+BAXzxnOS5aPcNG/SXJ9WibMEs=;
 b=y4WCu8KIwponZSD6lMaiZw81ljVaXROBXBJD26OHL/SracIS+zrYw/7UBFygAL4TtD
 iHDv1f8aJKepPLzBmbWRzDPy5gcgwTTt3Xo3PCfKLGnPpLTVhUpMD21kSbLqenHpAFxb
 rvVe7HcNAl9eyFZbKH7qj2NYtfvEB8Jh4lUil0+gH+JNBVIBSTaX+AAZAvycQwfFN/E2
 DXiPXu0BbeuuZLpq+m0RwXwnzcyGpf9eNHzZlhy8gfd2Mm2Oh3XW/wDcPpimOJpppW2N
 9OCyomXY437Ohk/hQO/aAs2tPn+fhkyJdd4vwtC0NbIsTiiurR9rtOieBKH8YEdMzwYm
 fzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693351418; x=1693956218;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GOQxCV2ZeNNpKDkyg+BAXzxnOS5aPcNG/SXJ9WibMEs=;
 b=SVOv5A0zy/e05yaZ6nvExmqGYw7pGLj9ZgqWFO2FmlfKyz/n5xmcGL88EX/DJ+WsCz
 FxL7lwqCjvLjsmQq1l7+Uj7We3p53zUSr9Wt0SyUro7bQHBl2N2NGp5PR2AaxkCCAtHx
 ZHZbddy2MZlT7+24urd8GaXl9igfL7EdKviCTFkla/+4u7n8yXhEkqaB57ZVFO1aphs9
 cOZCg4Jq8Xj+zwCWxoujGL4PbZ+h3ssCW2rCakIoaBtUhyOB8Cm7dREsHbh7fLRAzvq+
 BQgaqUf4WMuq8bXWZn69Ukx/hgpDF7vrie5F9uN7lU104kZbvR5S8C3XZk1Qonep+z8H
 IfMw==
X-Gm-Message-State: AOJu0YwgyX4NcmKrIDRxz8y4NLjZd7OdkXqrvOZ2Vt/4bhdmqZMl5JQT
 wgpgMcH3Tdawhi+0Ux5B+VWsmkrZ2nubBuWECzg=
X-Received: by 2002:a05:6a20:3954:b0:137:e595:830f with SMTP id
 r20-20020a056a20395400b00137e595830fmr876263pzg.57.1693351418016; 
 Tue, 29 Aug 2023 16:23:38 -0700 (PDT)
Received: from stoup.. ([71.212.131.115]) by smtp.gmail.com with ESMTPSA id
 t9-20020a170902e84900b001b9dadf8bd2sm9829970plg.190.2023.08.29.16.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 16:23:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: aaron@os.amperecomputing.com, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 01/12] tests/tcg/aarch64: Adjust pauth tests for FEAT_FPAC
Date: Tue, 29 Aug 2023 16:23:24 -0700
Message-Id: <20230829232335.965414-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829232335.965414-1-richard.henderson@linaro.org>
References: <20230829232335.965414-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: Ww6XwgREMeLq

With FEAT_FPAC, AUT* instructions that fail authentication
do not produce an error value but instead fault.

For pauth-2, install a signal handler and verify it gets called.

For pauth-4 and pauth-5, we are explicitly testing the error value,
so there's nothing to test with FEAT_FPAC, so exit early.
Adjust the makefile to use -cpu neoverse-v1, which has FEAT_EPAC
but not FEAT_FPAC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/aarch64/pauth.h         | 23 +++++++++++++
 tests/tcg/aarch64/pauth-2.c       | 54 ++++++++++++++++++++++++++-----
 tests/tcg/aarch64/pauth-4.c       | 18 ++++++++---
 tests/tcg/aarch64/pauth-5.c       | 10 ++++++
 tests/tcg/aarch64/Makefile.target |  6 +++-
 5 files changed, 98 insertions(+), 13 deletions(-)
 create mode 100644 tests/tcg/aarch64/pauth.h

diff --git a/tests/tcg/aarch64/pauth.h b/tests/tcg/aarch64/pauth.h
new file mode 100644
index 0000000000..543b234437
--- /dev/null
+++ b/tests/tcg/aarch64/pauth.h
@@ -0,0 +1,23 @@
+/*
+ * Helper for pauth test case
+ *
+ * Copyright (c) 2023 Linaro Ltd
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <assert.h>
+#include <sys/auxv.h>
+
+static int get_pac_feature(void)
+{
+    unsigned long isar1, isar2;
+
+    assert(getauxval(AT_HWCAP) & HWCAP_CPUID);
+
+    asm("mrs %0, id_aa64isar1_el1" : "=r"(isar1));
+    asm("mrs %0, S3_0_C0_C6_2" : "=r"(isar2));     /* id_aa64isar2_el1 */
+
+    return ((isar1 >> 4) & 0xf)   /* APA */
+         | ((isar1 >> 8) & 0xf)   /* API */
+         | ((isar2 >> 12) & 0xf); /* APA3 */
+}
diff --git a/tests/tcg/aarch64/pauth-2.c b/tests/tcg/aarch64/pauth-2.c
index 978652ede3..89ffdbf1df 100644
--- a/tests/tcg/aarch64/pauth-2.c
+++ b/tests/tcg/aarch64/pauth-2.c
@@ -1,5 +1,22 @@
 #include <stdint.h>
+#include <signal.h>
+#include <stdlib.h>
 #include <assert.h>
+#include "pauth.h"
+
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
@@ -27,31 +44,52 @@ void do_test(uint64_t value)
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
+     * Otherwise, bit 55 of the original is sign-extended into the rest
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
+
+    pac_feature = get_pac_feature();
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
index 24a639e36c..b254f413af 100644
--- a/tests/tcg/aarch64/pauth-4.c
+++ b/tests/tcg/aarch64/pauth-4.c
@@ -2,14 +2,24 @@
 #include <assert.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include "pauth.h"
 
 #define TESTS 1000
 
 int main()
 {
+    char base[TESTS];
     int i, count = 0;
     float perc;
-    void *base = malloc(TESTS);
+    int pac_feature = get_pac_feature();
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
@@ -17,7 +27,7 @@ int main()
         in = i + (uintptr_t) base;
 
         asm("mov %0, %[in]\n\t"
-            "pacia %0, sp\n\t"        /* sigill if pauth not supported */
+            "pacia %0, sp\n\t"
             "eor %0, %0, #4\n\t"      /* corrupt single bit */
             "mov %1, %0\n\t"
             "autia %1, sp\n\t"        /* validate corrupted pointer */
@@ -36,10 +46,10 @@ int main()
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
index 67c257918b..ed8d5a926b 100644
--- a/tests/tcg/aarch64/pauth-5.c
+++ b/tests/tcg/aarch64/pauth-5.c
@@ -1,4 +1,5 @@
 #include <assert.h>
+#include "pauth.h"
 
 static int x;
 
@@ -6,6 +7,15 @@ int main()
 {
     int *p0 = &x, *p1, *p2, *p3;
     unsigned long salt = 0;
+    int pac_feature = get_pac_feature();
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
index 681dfa077c..1ee6309920 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -42,7 +42,11 @@ endif
 ifneq ($(CROSS_CC_HAS_ARMV8_3),)
 AARCH64_TESTS += pauth-1 pauth-2 pauth-4 pauth-5
 pauth-%: CFLAGS += -march=armv8.3-a
-run-pauth-%: QEMU_OPTS += -cpu max
+run-pauth-1: QEMU_OPTS += -cpu max
+run-pauth-2: QEMU_OPTS += -cpu max
+# Choose a cpu with FEAT_Pauth but without FEAT_FPAC for pauth-[45].
+run-pauth-4: QEMU_OPTS += -cpu neoverse-v1
+run-pauth-5: QEMU_OPTS += -cpu neoverse-v1
 endif
 
 # BTI Tests
-- 
2.34.1


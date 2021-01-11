Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3061128lfq;
        Mon, 11 Jan 2021 15:11:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvmF0/7Kd0wf6RzfAg93uvCYzeYvl6qXKBaw4J3mkHKLECTqxF02ehHldDd1qYfh9/QMaB
X-Received: by 2002:a25:f54:: with SMTP id 81mr2890575ybp.103.1610406694342;
        Mon, 11 Jan 2021 15:11:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610406694; cv=none;
        d=google.com; s=arc-20160816;
        b=KahpdtZl4qcOpvFgQnv/HSijRafndlwPT95DaUejxgYByN4nebKjql2mfr8F7oZcSJ
         hpD8QwU8MOtlzM6vofMlAtXOfTYibBOBA1JeG/pyaPvnjIZ9BUijTb3wFskMjwXGFip9
         2v1QfoxfwgRZxtEEuXcXOt29c0j6KaGcxDLBTNNzbyMW7E25RfWBlWlUjrbQ+Hhv73rB
         IjB5dVWhsnUDWjAh4wFfjP2gi9w/goh8kZpEu+ysPDJLMaWD78ExECBKJ0aY8SmnGu5M
         +73jJ7HbYdGh3prBTctzFbIAUrxeqiYHc9Nxzwx7MtndptE1fh2PiYz8qSOfbSfnTn5L
         CavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UMumzk4fm+ReubqkvThPEU9TX17+RjW08bNhr8jJ4Ok=;
        b=u2W0zNrywACn68iERAjtVQZRHCruTgRopgOD8kBQ3+EJVBVh0X7kLNqfuAoHWQ1ndN
         m3XB7/kShYXMu/5edKFaPvBA7L4SI6y6PAJG68xJGFQu//UK2Q4V0LIRhOeLCDmKq6On
         7IdMP4JO1NKMPZsCtgBqDn3JxU4jLOk13AM2x08dgFWhG9PncttcG3IYOa1j0ejmJ5M4
         3tJ8Qx1Y9oP18yY54U2gs3tleLmm7lK02wWb4f3FBv0FBmge2D4+AU/0G4ISuOXzAiqc
         rNrumUrMeGGjPtw/7c+72fFeTnS+q0bTBjByQ0+95o+T85j/EVnLCOkUlci1okQWKPl+
         0RXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VCrGfXHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s11si1204524ybp.477.2021.01.11.15.11.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 15:11:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VCrGfXHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz6LV-0004fP-Ln
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 18:11:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LH-0004dS-JF
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:11:20 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz6LE-0006C6-9r
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:11:19 -0500
Received: by mail-pg1-x52a.google.com with SMTP id v19so141746pgj.12
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 15:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMumzk4fm+ReubqkvThPEU9TX17+RjW08bNhr8jJ4Ok=;
 b=VCrGfXHdYTeywmvh5VGW2sEx6OlZELG+v45spTTE/O3ULFc0t2XrzIG8G9ePgrDfZb
 o+NXuANfJ/Tweh8fuFCt+FOIIbVHlUm2I6gjGL8nV8+pVFSEqULhqzHAJQjJS0/p7hj0
 PWreKt/TrbLSfdDzD0bDVWuQi+cX2ATNwMitHCJ2FwRDF99NBgIKVSVIAQ+20908WdBB
 pn1Pw33uxzfNZDTQR6Z/qRreb6uzdiaGKthDWKYktS+9lbvayz7lMUZSp9rkDjBjnSu8
 B+Uxzd8LyQ8bM0cHq7IjbMfAK2JV2d/uh5Nvi0C42FcpppbX9Qry23Ee0KMcB7QLVsRm
 Li4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UMumzk4fm+ReubqkvThPEU9TX17+RjW08bNhr8jJ4Ok=;
 b=OIdKzeuc9ELIcCdCJJQNvxSaXFt2YdGNV5N5bt9ckDXJcy6m/ZP7V+TPjFuZmkRIHq
 2MIPLHAQg7EOmHLKFR9CIYlgudkiOiYxcvaCvche4TEDdOBC/MhW9VkaQ5nAgwIKPTuF
 j+xqhp1qBSLioN7GKPCQy+zJ0nmRr4mxHYcHhFJdB2xkk+ymdz0uAg+KCFefwrJZ0+Z5
 68kx5kH1s5Voeu26UrEfmr1urgg70Zyvr7S3kdglTY/5WQWWhphGIAmbk9JYtwVStOqh
 lvvX59VBKH9MTA34fBpiKbZtMHSJWEKTRlY2WW0ltCoX582Es+go/KIZdqd4cWQZp+9j
 Vjzg==
X-Gm-Message-State: AOAM530gIyMdY9YrZeKQwf+MBYbtCwc78yN6LabeWb17aQSvopmHYPy4
 LFtqp7a5nRqygIS1tTw2QOeN1dVqsYRIaQ==
X-Received: by 2002:a63:1110:: with SMTP id g16mr1698073pgl.357.1610406673397; 
 Mon, 11 Jan 2021 15:11:13 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id g202sm658105pfb.196.2021.01.11.15.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:11:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/3] target/arm: Implement an IMPDEF pauth algorithm
Date: Mon, 11 Jan 2021 13:11:06 -1000
Message-Id: <20210111231108.461088-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111231108.461088-1-richard.henderson@linaro.org>
References: <20210111231108.461088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sUqMriA4uy5e

Without hardware acceleration, a cryptographically strong
algorithm is too expensive for pauth_computepac.

Even with hardware accel, we are not currently expecting
to link the linux-user binaries to any crypto libraries,
and doing so would generally make the --static build fail.

So choose XXH64 as a reasonably quick and decent hash.

Tested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Move the XXH64 bits to xxhash.h (ajb).
    Create isar_feature_aa64_pauth_arch and fixup a comment
    in isar_feature_aa64_pauth that no longer applies.
v6: Introduce qemu_xxhash64_4 (pmm).
---
 include/qemu/xxhash.h     | 98 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h          | 15 ++++--
 target/arm/pauth_helper.c | 27 +++++++++--
 3 files changed, 131 insertions(+), 9 deletions(-)

diff --git a/include/qemu/xxhash.h b/include/qemu/xxhash.h
index 076f1f6054..c2dcccadbf 100644
--- a/include/qemu/xxhash.h
+++ b/include/qemu/xxhash.h
@@ -119,4 +119,102 @@ static inline uint32_t qemu_xxhash6(uint64_t ab, uint64_t cd, uint32_t e,
     return qemu_xxhash7(ab, cd, e, f, 0);
 }
 
+/*
+ * Component parts of the XXH64 algorithm from
+ * https://github.com/Cyan4973/xxHash/blob/v0.8.0/xxhash.h
+ *
+ * The complete algorithm looks like
+ *
+ *  i = 0;
+ *  if (len >= 32) {
+ *      v1 = seed + XXH_PRIME64_1 + XXH_PRIME64_2;
+ *      v2 = seed + XXH_PRIME64_2;
+ *      v3 = seed + 0;
+ *      v4 = seed - XXH_PRIME64_1;
+ *      do {
+ *          v1 = XXH64_round(v1, get64bits(input + i));
+ *          v2 = XXH64_round(v2, get64bits(input + i + 8));
+ *          v3 = XXH64_round(v3, get64bits(input + i + 16));
+ *          v4 = XXH64_round(v4, get64bits(input + i + 24));
+ *      } while ((i += 32) <= len);
+ *      h64 = XXH64_mergerounds(v1, v2, v3, v4);
+ *  } else {
+ *      h64 = seed + XXH_PRIME64_5;
+ *  }
+ *  h64 += len;
+ *
+ *  for (; i + 8 <= len; i += 8) {
+ *      h64 ^= XXH64_round(0, get64bits(input + i));
+ *      h64 = rol64(h64, 27) * XXH_PRIME64_1 + XXH_PRIME64_4;
+ *  }
+ *  for (; i + 4 <= len; i += 4) {
+ *      h64 ^= get32bits(input + i) * PRIME64_1;
+ *      h64 = rol64(h64, 23) * XXH_PRIME64_2 + XXH_PRIME64_3;
+ *  }
+ *  for (; i < len; i += 1) {
+ *      h64 ^= get8bits(input + i) * XXH_PRIME64_5;
+ *      h64 = rol64(h64, 11) * XXH_PRIME64_1;
+ *  }
+ *
+ *  return XXH64_avalanche(h64)
+ *
+ * Exposing the pieces instead allows for simplified usage when
+ * the length is a known constant and the inputs are in registers.
+ */
+#define XXH_PRIME64_1   0x9E3779B185EBCA87ULL
+#define XXH_PRIME64_2   0xC2B2AE3D27D4EB4FULL
+#define XXH_PRIME64_3   0x165667B19E3779F9ULL
+#define XXH_PRIME64_4   0x85EBCA77C2B2AE63ULL
+#define XXH_PRIME64_5   0x27D4EB2F165667C5ULL
+
+static inline uint64_t XXH64_round(uint64_t acc, uint64_t input)
+{
+    return rol64(acc + input * XXH_PRIME64_2, 31) * XXH_PRIME64_1;
+}
+
+static inline uint64_t XXH64_mergeround(uint64_t acc, uint64_t val)
+{
+    return (acc ^ XXH64_round(0, val)) * XXH_PRIME64_1 + XXH_PRIME64_4;
+}
+
+static inline uint64_t XXH64_mergerounds(uint64_t v1, uint64_t v2,
+                                         uint64_t v3, uint64_t v4)
+{
+    uint64_t h64;
+
+    h64 = rol64(v1, 1) + rol64(v2, 7) + rol64(v3, 12) + rol64(v4, 18);
+    h64 = XXH64_mergeround(h64, v1);
+    h64 = XXH64_mergeround(h64, v2);
+    h64 = XXH64_mergeround(h64, v3);
+    h64 = XXH64_mergeround(h64, v4);
+
+    return h64;
+}
+
+static inline uint64_t XXH64_avalanche(uint64_t h64)
+{
+    h64 ^= h64 >> 33;
+    h64 *= XXH_PRIME64_2;
+    h64 ^= h64 >> 29;
+    h64 *= XXH_PRIME64_3;
+    h64 ^= h64 >> 32;
+    return h64;
+}
+
+static inline uint64_t qemu_xxhash64_4(uint64_t a, uint64_t b,
+                                       uint64_t c, uint64_t d)
+{
+    uint64_t v1 = QEMU_XXHASH_SEED + XXH_PRIME64_1 + XXH_PRIME64_2;
+    uint64_t v2 = QEMU_XXHASH_SEED + XXH_PRIME64_2;
+    uint64_t v3 = QEMU_XXHASH_SEED + 0;
+    uint64_t v4 = QEMU_XXHASH_SEED - XXH_PRIME64_1;
+
+    v1 = XXH64_round(v1, a);
+    v2 = XXH64_round(v2, b);
+    v3 = XXH64_round(v3, c);
+    v4 = XXH64_round(v4, d);
+
+    return XXH64_avalanche(XXH64_mergerounds(v1, v2, v3, v4));
+}
+
 #endif /* QEMU_XXHASH_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7e6c881a7e..70e9618d13 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3852,10 +3852,8 @@ static inline bool isar_feature_aa64_fcma(const ARMISARegisters *id)
 static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
 {
     /*
-     * Note that while QEMU will only implement the architected algorithm
-     * QARMA, and thus APA+GPA, the host cpu for kvm may use implementation
-     * defined algorithms, and thus API+GPI, and this predicate controls
-     * migration of the 128-bit keys.
+     * Return true if any form of pauth is enabled, as this
+     * predicate controls migration of the 128-bit keys.
      */
     return (id->id_aa64isar1 &
             (FIELD_DP64(0, ID_AA64ISAR1, APA, 0xf) |
@@ -3864,6 +3862,15 @@ static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
              FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0;
 }
 
+static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
+{
+    /*
+     * Return true if pauth is enabled with the architected QARMA algorithm.
+     * QEMU will always set APA+GPA to the same value.
+     */
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index 564c48faa6..cd6df18150 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -24,6 +24,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
+#include "qemu/xxhash.h"
 
 
 static uint64_t pac_cell_shuffle(uint64_t i)
@@ -207,8 +208,8 @@ static uint64_t tweak_inv_shuffle(uint64_t i)
     return o;
 }
 
-static uint64_t pauth_computepac(uint64_t data, uint64_t modifier,
-                                 ARMPACKey key)
+static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
+                                             ARMPACKey key)
 {
     static const uint64_t RC[5] = {
         0x0000000000000000ull,
@@ -272,6 +273,22 @@ static uint64_t pauth_computepac(uint64_t data, uint64_t modifier,
     return workingval;
 }
 
+static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
+                                        ARMPACKey key)
+{
+    return qemu_xxhash64_4(data, modifier, key.lo, key.hi);
+}
+
+static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
+                                 uint64_t modifier, ARMPACKey key)
+{
+    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
+        return pauth_computepac_architected(data, modifier, key);
+    } else {
+        return pauth_computepac_impdef(data, modifier, key);
+    }
+}
+
 static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                              ARMPACKey *key, bool data)
 {
@@ -292,7 +309,7 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     bot_bit = 64 - param.tsz;
     ext_ptr = deposit64(ptr, bot_bit, top_bit - bot_bit, ext);
 
-    pac = pauth_computepac(ext_ptr, modifier, *key);
+    pac = pauth_computepac(env, ext_ptr, modifier, *key);
 
     /*
      * Check if the ptr has good extension bits and corrupt the
@@ -341,7 +358,7 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     uint64_t pac, orig_ptr, test;
 
     orig_ptr = pauth_original_ptr(ptr, param);
-    pac = pauth_computepac(orig_ptr, modifier, *key);
+    pac = pauth_computepac(env, orig_ptr, modifier, *key);
     bot_bit = 64 - param.tsz;
     top_bit = 64 - 8 * param.tbi;
 
@@ -442,7 +459,7 @@ uint64_t HELPER(pacga)(CPUARMState *env, uint64_t x, uint64_t y)
     uint64_t pac;
 
     pauth_check_trap(env, arm_current_el(env), GETPC());
-    pac = pauth_computepac(x, y, env->keys.apga);
+    pac = pauth_computepac(env, x, y, env->keys.apga);
 
     return pac & 0xffffffff00000000ull;
 }
-- 
2.25.1


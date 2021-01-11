Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3084797lfq;
        Mon, 11 Jan 2021 15:58:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrkVBivplkI0qtmn4ylTQqcOTbGRs73DioOJ4PimRxjqO9KMfI6vxJy7buSujCcqcPXAi5
X-Received: by 2002:a25:7752:: with SMTP id s79mr3192064ybc.54.1610409494234;
        Mon, 11 Jan 2021 15:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610409494; cv=none;
        d=google.com; s=arc-20160816;
        b=Go52bEWAlsIo7f+J7ZoQ4QxTpieSGtR8N84wInBk9eDq3btha5Bri1PZykbxA5RRDv
         kEz3JuiqdXpe+nvIBGPLFLbz/l0q6e1GER9jhBMNxSn8sohAuWVdSeXK/xy8kkK7HOgn
         QoOPfX9LpooRxh3KH31/p9Dn2tqFHyntsiqleJS4ytILKWw1584QPXgc3DMQF1W25vWh
         TiSPc+gBh4RFiVWWZ34GqXy7RNf4Sy4GJZIG3eWXbjOjs8mmjrXAQXBCA1EVojAL6SGJ
         TIW0k1F0SwxgCJiKdhx21882XiNELTsFD/oh6aCdpFmZR/6CkJk9Bm0DClcpSHJ7RdpU
         mBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UMumzk4fm+ReubqkvThPEU9TX17+RjW08bNhr8jJ4Ok=;
        b=v1qRosjGXfv7+UryQcacZC61APJJMdJY5QGT2Ca/wuNXPhAMFjK6/dDFJVOyyTJuSd
         GS2u/3gwV8R/z8XIsmjLdx6wLAZLFkJZG8NpK3CqC10/JWfNse97FhSiOdv0JdMnkU3H
         Ycy85QSaE8doJ7ghElqqDMEvEoS0Yzcu3z3oqupd7IVdU+i+s8eJarKDC8+ehQ0OZl2J
         9PNe8z83jkVgwIip2Z7d8/fqYdLOJdnqA/t9WM2vgXdpcx6JqZ86zKrKKWcL1dJkUcgf
         jmEJZSrhlXLXvzXr84SDEe4n0/9U9VvPknVLkno1KlchH6lhXn4CjKnxptYME7GdoxG/
         ipYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z6nuiMud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si990002ybl.251.2021.01.11.15.58.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 15:58:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z6nuiMud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz74f-0005UD-Fc
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 18:58:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74H-0005SU-7x
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:57:50 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:38453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz74E-0003V7-Mv
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 18:57:49 -0500
Received: by mail-pf1-x42c.google.com with SMTP id d2so266735pfq.5
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 15:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMumzk4fm+ReubqkvThPEU9TX17+RjW08bNhr8jJ4Ok=;
 b=Z6nuiMud4Et4m4CNVFkYDEcvv5wp7NPEFXi0gyAdzzBVeQJGh/GzpZE+8QLcJi20oF
 CLCSl5XOpy7NQiO8neA+kiTXLnDCB4s8pH/fmyghYQKtuRQvs6fS+MI+oq3YUR6VlEGb
 mieW0FPOGrtwsJhNzwThadP1yCgaynCH6ZjRAHYB6gHuJDaKcyBWdaHzdlNJ6idjS87Z
 k+o3tli6j12Jsnsi9F8aeXdQ1+k259uvOnYHTzsyFXslDDBo7fhHgMFNhq1uFjo9gT4U
 BIMHaps19wtvDmEls9MH1SlACIZzp/CcEQ9HndR7fMOPBlwgCo74Mzbhg206hy+qmx3p
 P5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UMumzk4fm+ReubqkvThPEU9TX17+RjW08bNhr8jJ4Ok=;
 b=A0ivFx8imbSLuF7g5SDH5Yym0WfGDrORsL9Zk4lXXD5BVXQXht9w4KSAZhEf3LLf4Q
 cYL+I+MK9s5mq02l8rWLMGI5JzSuRb0oWSLzrTHwB1J8HyEJ9l7lUbDduyKj9GDziqTZ
 dF/eSPLlMuSTOXnferse2O82Kvo72Ef/b8TIY3s13y7vzp5UDhyvjmULi5npubo5Hms2
 BYktIbd9T5n44sMXMp3PkooAkUv57640QSfjjSdFkup58aOxQpvZjuXDvvOYWMsHwb/5
 iaC/NHPH336f8B38VJNk2UuwS0kSQe5lgOvnAF0RctS/UZXgf+fJw8mfNgje7njw7Z+I
 skxw==
X-Gm-Message-State: AOAM531Qh0fYWVtMKv2jluFEBjkDSDij2srsdXMORWlosokNvtv+QMR1
 IWy+7zl+Q8dCrW/44Pg6+WTR9bYtImj9mQ==
X-Received: by 2002:a63:d041:: with SMTP id s1mr1846099pgi.249.1610409465473; 
 Mon, 11 Jan 2021 15:57:45 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s67sm872220pgb.60.2021.01.11.15.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 15:57:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/3] target/arm: Implement an IMPDEF pauth algorithm
Date: Mon, 11 Jan 2021 13:57:38 -1000
Message-Id: <20210111235740.462469-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111235740.462469-1-richard.henderson@linaro.org>
References: <20210111235740.462469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: txUstUELnz+W

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


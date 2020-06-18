Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1273589lfm;
        Wed, 17 Jun 2020 21:51:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbeusMLzjt+tSrJ2ovZJaM6Jj7KKtYzvA9EZnr7D6r7GdK2XrFEmVTNndi07vXcK9n1TDb
X-Received: by 2002:a25:5641:: with SMTP id k62mr3659039ybb.58.1592455877396;
        Wed, 17 Jun 2020 21:51:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592455877; cv=none;
        d=google.com; s=arc-20160816;
        b=AbZS9AMy6SMvxDbVQh3lt78LRQNHaRmTfsrg1G+PRbGQ55zbqHVhknSkk14mB/t+63
         6neTGil4M1pTEz5G+mo9bz4DIqqZa5AKM3y0t8W7Y5wOWAOEFXYitYdtikLbPEzv0xdT
         6sVJ7Ao3SU0VExBe/+zn+XG2nFdmXkjh/LfY/e9KOHYGAcSkvjXmNjzxsc+TvIRjtB8D
         iIxtgCaehsW5APC1luu3Z6eTi2IoVrHL4sMhAJb4zUkYT14c4adtVrWtHPPo0o7Hs66W
         kveql3s/YuzS8ai/V73tsvSvjTdEiCe8Y6n254yVuoP4TqIWtYV7MvtLg/i9m0K3sYFj
         V2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=w2JqdG41pPzH1jxTxEz1E8bWLaaIOIoau8TkYkyq+9E=;
        b=xJYY+Iy1rHq0EJEnK2uMD9doMMizHv2v6KxyKVs7TzrjkHBljZ6vPdSPje6ERq9ohf
         IaptWiWNPRs6423ikg72cosGXG9yhQJ4tQsfMcLuccmbhHY7Nd/jsbv84yM/GqBWvIxq
         77Xs4DVkK6gEH/fyH4GVirugpkpdQWZvaiXHpQFQYLWYsKpS+Js7cPI7uiAeB4KMJ5Yb
         srpWwIRt6pvtSRDiRSZLVc5hBllGXfbg1Zjy04yaRPdX5aqUo2A6iQ4cyQfX2EuNumwr
         J9Zyey6bygRdnsRNkPQOonpZ+8m5IBlOUU5mMVAcnR2Yd1EXMgpERCf7Sxj0SZg5u9lU
         XxpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZcQcQNML;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si1653255ybo.49.2020.06.17.21.51.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:51:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZcQcQNML;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmWC-0008RD-Nn
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBU-0008RF-7u
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:52 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmBS-0002ve-8M
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:29:51 -0400
Received: by mail-pg1-x542.google.com with SMTP id h10so2321890pgq.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w2JqdG41pPzH1jxTxEz1E8bWLaaIOIoau8TkYkyq+9E=;
 b=ZcQcQNMLb11yw4gDBVX5HPz+d5gdiGPrFivT6m/qMuflCG6wGtjfxoMg2Eh2g/J4CK
 RVwxnvGjm58wiEtVetpHiXrtD1UPemkCImy23buWOFDsJL6hs/bCaOcF6Atpe6xJDwJD
 UIwnYO4apVeC1L2XLQijY9XkQHh8pgVMrtDEaYLD8AXu1msjxLu4IfDrasY7E0eIV/MS
 /aaBIxR6oaIzbM3HiDc+Twlzq3E5/bs2L3NMu4FOJWCSrEmtr2kIcfM4lwQKR1jnpErf
 pmsuLtI2aS0YzCwCDdpHN5ETgT6dTPWU2Y2IAOiYtS8rIjVI5Ra+jdHPzNvxO3uKLq6r
 JlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w2JqdG41pPzH1jxTxEz1E8bWLaaIOIoau8TkYkyq+9E=;
 b=nYmlcdSjyp+mlTwyrTr3HWR+69tX8gHkb4FddIPUUMVDE6tStjJuoQbBrERHyEh3PU
 hYbwIBwQVSAv1xCveDckYyQhjee40UBrB62xZy6uOk2NjDwqJEPsC54IT4aE7q0F3iJ0
 fW7np/5gDq+hGhvW97MHJA08S0EseT9J5MViZSAmdw3ku164vgyuz0bbgrJ5wMUUJrn7
 XASt5LrRROWdc8SccmyotH/yqqJM6ar/DbdFg6xZVDeLh5qaWd98cQgpO14cMuxoPK1Y
 5YGjoy0PSASyzRrfbR7sdDVEI5cw08uvGVaLUf4drhKFDltvTahEq00qZv6Js2Ci0LoJ
 82Uw==
X-Gm-Message-State: AOAM530110Jy7lg2CJVwZvG4tc5Ea4RI11rPS3qrhMo0NEY+mgK0wbPp
 P9+n7vRIUBykheeO2B13+6ZV6A==
X-Received: by 2002:a63:4822:: with SMTP id v34mr1762810pga.81.1592454588936; 
 Wed, 17 Jun 2020 21:29:48 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id j17sm1157899pgk.66.2020.06.17.21.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:29:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 045/100] target/arm: Implement SVE2 WHILEGT, WHILEGE,
 WHILEHI, WHILEHS
Date: Wed, 17 Jun 2020 21:25:49 -0700
Message-Id: <20200618042644.1685561-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KLuKblUdOZxs

Rename the existing sve_while (less-than) helper to sve_whilel
to make room for a new sve_whileg helper for greater-than.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Use a new helper function to implement this.
---
 target/arm/helper-sve.h    |  3 +-
 target/arm/sve.decode      |  2 +-
 target/arm/sve_helper.c    | 38 +++++++++++++++++++++++++-
 target/arm/translate-sve.c | 56 ++++++++++++++++++++++++++++----------
 4 files changed, 82 insertions(+), 17 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index acb967506d..4c4a8b27b1 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -913,7 +913,8 @@ DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
 
-DEF_HELPER_FLAGS_3(sve_while, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+DEF_HELPER_FLAGS_3(sve_whilel, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
+DEF_HELPER_FLAGS_3(sve_whileg, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
 
 DEF_HELPER_FLAGS_4(sve_subri_b, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
 DEF_HELPER_FLAGS_4(sve_subri_h, TCG_CALL_NO_RWG, void, ptr, ptr, i64, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5f76a95139..b7038f9f57 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -700,7 +700,7 @@ SINCDECP_z      00100101 .. 1010 d:1 u:1 10000 00 .... .....    @incdec2_pred
 CTERM           00100101 1 sf:1 1 rm:5 001000 rn:5 ne:1 0000
 
 # SVE integer compare scalar count and limit
-WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 1 rn:5 eq:1 rd:4
+WHILE           00100101 esz:2 1 rm:5 000 sf:1 u:1 lt:1 rn:5 eq:1 rd:4
 
 ### SVE Integer Wide Immediate - Unpredicated Group
 
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a79039ad52..5d80dc8c58 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3711,7 +3711,7 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
     return sum;
 }
 
-uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
+uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
 {
     uintptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
     intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
@@ -3737,6 +3737,42 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
     return predtest_ones(d, oprsz, esz_mask);
 }
 
+uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
+{
+    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
+    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    uint64_t esz_mask = pred_esz_masks[esz];
+    ARMPredicateReg *d = vd;
+    intptr_t i, invcount, oprbits;
+    uint64_t bits;
+
+    if (count == 0) {
+        return do_zero(d, oprsz);
+    }
+
+    oprbits = oprsz * 8;
+    tcg_debug_assert(count <= oprbits);
+
+    bits = esz_mask;
+    if (oprbits & 63) {
+        bits &= MAKE_64BIT_MASK(0, oprbits & 63);
+    }
+
+    invcount = oprbits - count;
+    for (i = (oprsz - 1) / 8; i > invcount / 64; --i) {
+        d->p[i] = bits;
+        bits = esz_mask;
+    }
+
+    d->p[i] = bits & MAKE_64BIT_MASK(invcount & 63, 64);
+
+    while (--i >= 0) {
+        d->p[i] = 0;
+    }
+
+    return predtest_ones(d, oprsz, esz_mask);
+}
+
 /* Recursive reduction on a function;
  * C.f. the ARM ARM function ReducePredicated.
  *
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 262194f163..dc6f39b5bb 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3121,7 +3121,14 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     TCGv_ptr ptr;
     unsigned desc, vsz = vec_full_reg_size(s);
     TCGCond cond;
+    uint64_t maxval;
+    /* Note that GE/HS has a->eq == 0 and GT/HI has a->eq == 1. */
+    bool eq = a->eq == a->lt;
 
+    /* The greater-than conditions are all SVE2. */
+    if (!a->lt && !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
     if (!sve_access_check(s)) {
         return true;
     }
@@ -3144,22 +3151,42 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
      */
     t0 = tcg_temp_new_i64();
     t1 = tcg_temp_new_i64();
-    tcg_gen_sub_i64(t0, op1, op0);
+
+    if (a->lt) {
+        tcg_gen_sub_i64(t0, op1, op0);
+        if (a->u) {
+            maxval = a->sf ? UINT64_MAX : UINT32_MAX;
+            cond = eq ? TCG_COND_LEU : TCG_COND_LTU;
+        } else {
+            maxval = a->sf ? INT64_MAX : INT32_MAX;
+            cond = eq ? TCG_COND_LE : TCG_COND_LT;
+        }
+    } else {
+        tcg_gen_sub_i64(t0, op0, op1);
+        if (a->u) {
+            maxval = 0;
+            cond = eq ? TCG_COND_GEU : TCG_COND_GTU;
+        } else {
+            maxval = a->sf ? INT64_MIN : INT32_MIN;
+            cond = eq ? TCG_COND_GE : TCG_COND_GT;
+        }
+    }
 
     tmax = tcg_const_i64(vsz >> a->esz);
-    if (a->eq) {
+    if (eq) {
         /* Equality means one more iteration.  */
         tcg_gen_addi_i64(t0, t0, 1);
 
-        /* If op1 is max (un)signed integer (and the only time the addition
-         * above could overflow), then we produce an all-true predicate by
-         * setting the count to the vector length.  This is because the
-         * pseudocode is described as an increment + compare loop, and the
-         * max integer would always compare true.
+        /*
+         * For the less-than while, if op1 is maxval (and the only time
+         * the addition above could overflow), then we produce an all-true
+         * predicate by setting the count to the vector length.  This is
+         * because the pseudocode is described as an increment + compare
+         * loop, and the maximum integer would always compare true.
+         * Similarly, the greater-than while has the same issue with the
+         * minimum integer due to the decrement + compare loop.
          */
-        tcg_gen_movi_i64(t1, (a->sf
-                              ? (a->u ? UINT64_MAX : INT64_MAX)
-                              : (a->u ? UINT32_MAX : INT32_MAX)));
+        tcg_gen_movi_i64(t1, maxval);
         tcg_gen_movcond_i64(TCG_COND_EQ, t0, op1, t1, tmax, t0);
     }
 
@@ -3168,9 +3195,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     tcg_temp_free_i64(tmax);
 
     /* Set the count to zero if the condition is false.  */
-    cond = (a->u
-            ? (a->eq ? TCG_COND_LEU : TCG_COND_LTU)
-            : (a->eq ? TCG_COND_LE : TCG_COND_LT));
     tcg_gen_movi_i64(t1, 0);
     tcg_gen_movcond_i64(cond, t0, op0, op1, t0, t1);
     tcg_temp_free_i64(t1);
@@ -3190,7 +3214,11 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     ptr = tcg_temp_new_ptr();
     tcg_gen_addi_ptr(ptr, cpu_env, pred_full_reg_offset(s, a->rd));
 
-    gen_helper_sve_while(t2, ptr, t2, t3);
+    if (a->lt) {
+        gen_helper_sve_whilel(t2, ptr, t2, t3);
+    } else {
+        gen_helper_sve_whileg(t2, ptr, t2, t3);
+    }
     do_pred_flags(t2);
 
     tcg_temp_free_ptr(ptr);
-- 
2.25.1


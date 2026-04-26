Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C6AFF885C
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:53:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzse-00082H-29; Sun, 26 Apr 2026 09:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzs5-0007E2-Uy
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:50:08 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGzs1-0002ti-3a
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:50:04 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-82f69a286dbso7071158b3a.2
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211399; x=1777816199; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4ZR7BNBo95nAjIhUGH+JAucrVhM1zoFe7ZmH1Xd6n0M=;
 b=GXDlAH7eAsKp9KhsaOH0VoAprSO5pwszHehrMdTStB30uDSTVMHgK7Uc0H+kFZ0aqU
 30ve7fz04Yz9Oa6zfU2hL+Hk7HmTyXVzJ91rYHWOFujTBDH7DIddT5kX7E2kmlyKWil8
 c2ZdqGMSogX0JP978otA38qn2zBHG6yiv5RX4jWh7M+xUdzL4zUwKJ/1BscyaOZhL1bt
 EXbh9hVeeEmX9ioFjlyIQH02lG6MXCPW3nwdOjNU5V+s/t1orpwxAcmmLfMh4fbkX/Lk
 VrrdJvS+/RMBEvwswY3hq6FslXvnR2NnCsbfwm8cgC1d8DoHDEZxX+ORmV7gF4DLB2Sw
 pFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211399; x=1777816199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4ZR7BNBo95nAjIhUGH+JAucrVhM1zoFe7ZmH1Xd6n0M=;
 b=iilP6RUWYHuItT7VNjur6fIgJTEOOesO9EFVM43m5HWxytoB6a03KgRL9Boe7fFJHG
 52vwbCzicixst8noTDtQhiigegB+hXFL/AkefOXVWe+9AoFKDwxvTksS4HVinBMs5gNZ
 IinHYyw3m4dzwxsHdp4mOR1WVRMYl5KZVvFu06q4MoTIMLP+NWAmcbbiWAIXrEL2DZ04
 Aec1FhCeeai6lq6bXaHozmeiKtcVMHtrq9jzt60H7mf/+9umXCoiavIuBYtIqZoJXknA
 +gTNneA2oXe2gs9MJ3adnoeMyK9Mkz2SJgqIa4CYkU1eqfachALU21tNa9UzHBKiwtvt
 Vbbw==
X-Gm-Message-State: AOJu0YwuVI/aWD7SzTTYnt6HPhVdEpWLqbA9/IdO7u42+8q3ckJtxSqf
 qYLJd3FPAKK4/DIh/WF25qMJsW0Ndv3qCVbnpjZmxs4CnHZDtZA2Lyp1oM379pCCYxrgkG3XnEd
 0Xs71hVY=
X-Gm-Gg: AeBDietaRY3UGMFFmaGJhQH3G8n1SowxR1ZUuk638n7vN1eb7E9YNGK9aFsHrVOGC77
 n2t9nnvBDjO87jtoC/E6fYpBCQn3ar1sOOGKEIVARMRKMR7Er7Q3yq5lkkQx9UeXzvImaW+YYxV
 BvJMiUhfN8wti06u5BAvkRMU3HyWRmgwLvnXhCAHJw0Wt5dUXUZLDOOIGjY4CjLSgamGRJJ0gY/
 SC8xjg5wXE+Cds0P2l+aH6MKZAloa2CGEZdDIWJYcf+1OhEthYkeP8hjkkWBicUxycy6JoW5jOO
 ZPCOYzXXp5uuaJs/JDfJ6BKFYBK7kkIOF863m0JcJPdv4Djh5sy7rA5F5MQErZIAUeTKQGsWDS+
 tbRD+J47HwozT9nsJw5RcHvLKySfgxse5EM0vH0WtJtEklrUWfuYYmDaq8vGFZIjILF2kZyZuub
 Br3hTAnPhYex/nDktE8NJPmWRuR5VEitq48hK8s2mT96cgh8D6tU4=
X-Received: by 2002:a05:6a00:ba02:b0:82f:8b20:9165 with SMTP id
 d2e1a72fcca58-82f8c9222e1mr42356652b3a.44.1777211399182; 
 Sun, 26 Apr 2026 06:49:59 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8ebba485sm36307102b3a.38.2026.04.26.06.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:49:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 83/84] target/arm: Drop oddstatus from is_ebf and bfdotadd_ebf
Date: Sun, 26 Apr 2026 23:40:00 +1000
Message-ID: <20260426134002.865628-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This argument is no longer used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_internal.h | 12 +++------
 target/arm/tcg/sme_helper.c   |  6 ++---
 target/arm/tcg/vec_helper.c   | 50 +++++++++++++++--------------------
 3 files changed, 29 insertions(+), 39 deletions(-)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 4edd2b4fc1..c7ccb28b18 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -270,7 +270,6 @@ float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2, float_status *fpst);
  * @sum: addend
  * @e1, @e2: multiplicand vectors
  * @fpst: floating-point status to use
- * @fpst_odd: floating-point status to use for round-to-odd operations
  *
  * BFloat16 2-way dot product of @e1 & @e2, accumulating with @sum.
  * The @e1 and @e2 operands correspond to the 32-bit source vector
@@ -279,23 +278,20 @@ float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2, float_status *fpst);
  * Corresponds to the ARM pseudocode function BFDotAdd, specialized
  * for the FPCR.EBF == 1 case.
  */
-float32 bfdotadd_ebf(float32 sum, uint32_t e1, uint32_t e2,
-                     float_status *fpst, float_status *fpst_odd);
+float32 bfdotadd_ebf(float32 sum, uint32_t e1, uint32_t e2, float_status *fpst);
 
 /**
  * is_ebf:
  * @env: CPU state
  * @statusp: pointer to floating point status to fill in
- * @oddstatusp: pointer to floating point status to fill in for round-to-odd
  *
  * Determine whether a BFDotAdd operation should use FPCR.EBF = 0
- * or FPCR.EBF = 1 semantics. On return, has initialized *statusp
- * and *oddstatusp to suitable float_status arguments to use with either
- * bfdotadd() or bfdotadd_ebf().
+ * or FPCR.EBF = 1 semantics. On return, has initialized *statusp as suitable
+ * for float_status arguments to either bfdotadd() or bfdotadd_ebf().
  * Returns true for EBF = 1, false for EBF = 0. (The caller should use this
  * to decide whether to call bfdotadd() or bfdotadd_ebf().)
  */
-bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp);
+bool is_ebf(CPUARMState *env, float_status *statusp);
 
 /*
  * Negate as for FPCR.AH=1 -- do not negate NaNs.
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index ab5999c592..0702a1b129 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -1435,9 +1435,9 @@ static void do_bfmopa_w(void *vza, void *vzn, void *vzm,
                         uint32_t desc, uint32_t negx, bool ah_neg)
 {
     intptr_t row, col, oprsz = simd_maxsz(desc);
-    float_status fpst, fpst_odd;
+    float_status fpst;
 
-    if (is_ebf(env, &fpst, &fpst_odd)) {
+    if (is_ebf(env, &fpst)) {
         for (row = 0; row < oprsz; ) {
             uint16_t prow = pn[H2(row >> 4)];
             do {
@@ -1458,7 +1458,7 @@ static void do_bfmopa_w(void *vza, void *vzn, void *vzm,
                             uint32_t m = *(uint32_t *)(vzm + H1_4(col));
 
                             m = f16mop_adj_pair(m, pcol, 0);
-                            *a = bfdotadd_ebf(*a, n, m, &fpst, &fpst_odd);
+                            *a = bfdotadd_ebf(*a, n, m, &fpst);
                         }
                         col += 4;
                         pcol >>= 4;
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 1f305515cf..d004be5e1b 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -2845,7 +2845,7 @@ DO_MMLA_B(gvec_usmmla_b, do_usmmla_b)
  * BFloat16 Dot Product
  */
 
-bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp)
+bool is_ebf(CPUARMState *env, float_status *statusp)
 {
     /*
      * For BFDOT, BFMMLA, etc, the behaviour depends on FPCR.EBF.
@@ -2865,11 +2865,7 @@ bool is_ebf(CPUARMState *env, float_status *statusp, float_status *oddstatusp)
     *statusp = env->vfp.fp_status[is_a64(env) ? FPST_A64 : FPST_A32];
     set_default_nan_mode(true, statusp);
 
-    if (ebf) {
-        /* EBF=1 needs to do a step with round-to-odd semantics */
-        *oddstatusp = *statusp;
-        set_float_rounding_mode(float_round_to_odd, oddstatusp);
-    } else {
+    if (!ebf) {
         set_flush_to_zero(true, statusp);
         set_flush_inputs_to_zero(true, statusp);
         set_float_rounding_mode(float_round_to_odd_inf, statusp);
@@ -2893,8 +2889,7 @@ float32 bfdotadd(float32 sum, uint32_t e1, uint32_t e2, float_status *fpst)
     return t1;
 }
 
-float32 bfdotadd_ebf(float32 sum, uint32_t e1, uint32_t e2,
-                     float_status *fpst, float_status *fpst_odd)
+float32 bfdotadd_ebf(float32 sum, uint32_t e1, uint32_t e2, float_status *fpst)
 {
     /* Unpack two BFloat16 into two Float32, trivially. */
     float32 s1r = e1 << 16;
@@ -2965,11 +2960,11 @@ void HELPER(gvec_bfdot)(void *vd, void *vn, void *vm, void *va,
     intptr_t i, opr_sz = simd_oprsz(desc);
     float32 *d = vd, *a = va;
     uint32_t *n = vn, *m = vm;
-    float_status fpst, fpst_odd;
+    float_status fpst;
 
-    if (is_ebf(env, &fpst, &fpst_odd)) {
+    if (is_ebf(env, &fpst)) {
         for (i = 0; i < opr_sz / 4; ++i) {
-            d[i] = bfdotadd_ebf(a[i], n[i], m[i], &fpst, &fpst_odd);
+            d[i] = bfdotadd_ebf(a[i], n[i], m[i], &fpst);
         }
     } else {
         for (i = 0; i < opr_sz / 4; ++i) {
@@ -2988,14 +2983,14 @@ void HELPER(gvec_bfdot_idx)(void *vd, void *vn, void *vm,
     intptr_t eltspersegment = MIN(16 / 4, elements);
     float32 *d = vd, *a = va;
     uint32_t *n = vn, *m = vm;
-    float_status fpst, fpst_odd;
+    float_status fpst;
 
-    if (is_ebf(env, &fpst, &fpst_odd)) {
+    if (is_ebf(env, &fpst)) {
         for (i = 0; i < elements; i += eltspersegment) {
             uint32_t m_idx = m[i + H4(index)];
 
             for (j = i; j < i + eltspersegment; j++) {
-                d[j] = bfdotadd_ebf(a[j], n[j], m_idx, &fpst, &fpst_odd);
+                d[j] = bfdotadd_ebf(a[j], n[j], m_idx, &fpst);
             }
         }
     } else {
@@ -3022,17 +3017,16 @@ void HELPER(sme2_bfvdot_idx)(void *vd, void *vn, void *vm,
     uint16_t *n0 = vn;
     uint16_t *n1 = vn + sizeof(ARMVectorReg);
     uint32_t *m = vm;
-    float_status fpst, fpst_odd;
+    float_status fpst;
 
-    if (is_ebf(env, &fpst, &fpst_odd)) {
+    if (is_ebf(env, &fpst)) {
         for (i = 0; i < elements; i += eltspersegment) {
             uint32_t m_idx = m[i + H4(idx)];
 
             for (j = 0; j < eltspersegment; j++) {
                 uint32_t nn = (n0[H2(2 * (i + j) + sel)])
                             | (n1[H2(2 * (i + j) + sel)] << 16);
-                d[i + H4(j)] = bfdotadd_ebf(a[i + H4(j)], nn, m_idx,
-                                            &fpst, &fpst_odd);
+                d[i + H4(j)] = bfdotadd_ebf(a[i + H4(j)], nn, m_idx, &fpst);
             }
         }
     } else {
@@ -3055,9 +3049,9 @@ void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va,
     intptr_t s, opr_sz = simd_oprsz(desc);
     float32 *d = vd, *a = va;
     uint32_t *n = vn, *m = vm;
-    float_status fpst, fpst_odd;
+    float_status fpst;
 
-    if (is_ebf(env, &fpst, &fpst_odd)) {
+    if (is_ebf(env, &fpst)) {
         for (s = 0; s < opr_sz / 4; s += 4) {
             float32 sum00, sum01, sum10, sum11;
 
@@ -3069,20 +3063,20 @@ void HELPER(gvec_bfmmla)(void *vd, void *vn, void *vm, void *va,
              *               i   j               i   k             j   k
              */
             sum00 = a[s + H4(0 + 0)];
-            sum00 = bfdotadd_ebf(sum00, n[s + H4(0 + 0)], m[s + H4(0 + 0)], &fpst, &fpst_odd);
-            sum00 = bfdotadd_ebf(sum00, n[s + H4(0 + 1)], m[s + H4(0 + 1)], &fpst, &fpst_odd);
+            sum00 = bfdotadd_ebf(sum00, n[s + H4(0 + 0)], m[s + H4(0 + 0)], &fpst);
+            sum00 = bfdotadd_ebf(sum00, n[s + H4(0 + 1)], m[s + H4(0 + 1)], &fpst);
 
             sum01 = a[s + H4(0 + 1)];
-            sum01 = bfdotadd_ebf(sum01, n[s + H4(0 + 0)], m[s + H4(2 + 0)], &fpst, &fpst_odd);
-            sum01 = bfdotadd_ebf(sum01, n[s + H4(0 + 1)], m[s + H4(2 + 1)], &fpst, &fpst_odd);
+            sum01 = bfdotadd_ebf(sum01, n[s + H4(0 + 0)], m[s + H4(2 + 0)], &fpst);
+            sum01 = bfdotadd_ebf(sum01, n[s + H4(0 + 1)], m[s + H4(2 + 1)], &fpst);
 
             sum10 = a[s + H4(2 + 0)];
-            sum10 = bfdotadd_ebf(sum10, n[s + H4(2 + 0)], m[s + H4(0 + 0)], &fpst, &fpst_odd);
-            sum10 = bfdotadd_ebf(sum10, n[s + H4(2 + 1)], m[s + H4(0 + 1)], &fpst, &fpst_odd);
+            sum10 = bfdotadd_ebf(sum10, n[s + H4(2 + 0)], m[s + H4(0 + 0)], &fpst);
+            sum10 = bfdotadd_ebf(sum10, n[s + H4(2 + 1)], m[s + H4(0 + 1)], &fpst);
 
             sum11 = a[s + H4(2 + 1)];
-            sum11 = bfdotadd_ebf(sum11, n[s + H4(2 + 0)], m[s + H4(2 + 0)], &fpst, &fpst_odd);
-            sum11 = bfdotadd_ebf(sum11, n[s + H4(2 + 1)], m[s + H4(2 + 1)], &fpst, &fpst_odd);
+            sum11 = bfdotadd_ebf(sum11, n[s + H4(2 + 0)], m[s + H4(2 + 0)], &fpst);
+            sum11 = bfdotadd_ebf(sum11, n[s + H4(2 + 1)], m[s + H4(2 + 1)], &fpst);
 
             d[s + H4(0 + 0)] = sum00;
             d[s + H4(0 + 1)] = sum01;
-- 
2.43.0



Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F04CD4F3D
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPSj-00086x-K6; Sat, 16 May 2026 20:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPS1-0006hA-RS
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:50 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPRz-0006nw-3h
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:49 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-3680540a6efso472241a91.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978025; x=1779582825; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VNbX6rDkUzGYSDjQPckiG6GuulyRjAicqxJ0YGYEVwQ=;
 b=ko5lrW2P4AD5j1wB1A7RakpOn29gPrr+clWK1qVwB7xYQBzKPzam8flkoCUbKbrlzX
 26ND9/0RLZXsC/kitNRkUFkUiPBexalLyul4lfVsZdc/srpbfxP9JS5SyapSILg2Ml6B
 5GavZkYUdqPt76LmnPx9l8LcJ17Zcy0xoBfBX/PznasZFfDavFUqhOmy7H5kpoyjiu/q
 +g047r87kDoQNOXkgDqgvVe+aeMfHFBwuXGtErpnXT8mRpHZlUVszdpaHiWHKIa/hG/5
 9XPoV5pJvel8wbfvd1fLPHqyVAXZtnSIW8ttUI9gBj5rge4c7YjAlYUxpQDSxuYuuyZ2
 wZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978025; x=1779582825;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VNbX6rDkUzGYSDjQPckiG6GuulyRjAicqxJ0YGYEVwQ=;
 b=FRNF/lcTDyUUjJR9jqdcdbkccDUKgq9ksP2SSrdK+uaoiTnkMK1Y1kILZzGJlx0Au/
 wcR06yE+LDk2tpbAWYhm3fxio2+nDAqG9YfcE4xLGj9g0zQyu1XlVQru7pkwh0DpuDnR
 RRh+wEC3thp6KAtLunEPrkk0/bYASElDDtvI1GAmpoCq8jpJiOmTw2QCIrLUuO9mJ4X7
 56jPLxPhMcl2JYqUn4fU6rm4AT6EWoiytIGdIBk/i/x8QLewm3MykL/VjnoQBoPw2+HQ
 xFyFyHqH4MWqPMIaWCNFhXMEpP94b+7d9Av3b/7lfHxziqgC+dFrpVOwF0P9jBMA3Cr/
 PyIg==
X-Gm-Message-State: AOJu0YzsWNT4tdd4mh6nH9y3QBeqnUVwUPM7J4pvHcn0SA1Q+k/U6p+A
 mPf16dLwugSHP8wtpsXHVxO7OrtZOHYu1AikIPm40UZ4qXagKtG6QbeZkBu9mj4rwLER5FWxwI+
 GY5Js
X-Gm-Gg: Acq92OFZDRl4BcxwM0IyzdhtOK8c28OMmSKKCZSzDszyAqmbOxTp9eqL56ynAFpa0xb
 B7AF+3QKGmCMAkX2VDV6bQ+rQox38TCzwvvltl+ATSadA78YluTa7gZ+CGLB9IHRPPjK6MzRARO
 pYPBvWx4K862t/tQcqbtsk7TQMel4XwvDTMdUquVOHpgRn75QtqL+5Xg88EKyGd7B2YTewgkHGt
 jgEt3R/sQ2E2MRj/wz8TCZgmodgqtr6ci8FcX4xDkscuczfW2NviV0tvNu5FaHXlFbF7khRpYqC
 hrQrK4w8rIRiwfpnE1T8uqkQFGeBTx8TK7pemEJHgcMiTHxyxIFBy8gaJXLU2WFjDcO1NJw/vNV
 mdIifOpyWocr5U5KfsrgVLG39Xw9HJ1ZaVpj+Hk/vW2vJpPS1lw/Mf8hruCaqeNim0IM8Oj/JQp
 7kSJB5ulg/2LeKThcsD5cQ2/CHaTAl
X-Received: by 2002:a05:6a20:e212:b0:3aa:c93b:6266 with SMTP id
 adf61e73a8af0-3b22e738febmr10834416637.19.1778978025231; 
 Sat, 16 May 2026 17:33:45 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:33:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 45/63] target/arm: Implement FMLALB, FMLALT for AdvSIMD
Date: Sat, 16 May 2026 17:29:44 -0700
Message-ID: <20260517003002.321430-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h        |   5 ++
 target/arm/tcg/helper-fp8-defs.h |   3 +
 target/arm/tcg/fp8_helper.c      | 113 +++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   |  16 +++++
 target/arm/tcg/a64.decode        |   8 +++
 5 files changed, 145 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 007e656ed4..ee20d74164 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1590,6 +1590,11 @@ static inline bool isar_feature_aa64_f8cvt(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8CVT);
 }
 
+static inline bool isar_feature_aa64_f8fma(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8FMA);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 36ae977431..7aa8366d94 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -23,3 +23,6 @@ DEF_HELPER_FLAGS_4(sve2_fcvtnb_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvtnt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtn_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmla_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_fmla_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 931ea54cb6..c873de65cd 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -571,3 +571,116 @@ void HELPER(sme2_fcvtn_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_finish(env, &ctx);
 }
+
+typedef struct FP8MulContext {
+    float_status stat;
+    fp8_input_fn *fmt1;
+    fp8_input_fn *fmt2;
+    int scale;
+} FP8MulContext;
+
+static FP8MulContext fp8_mul_start(CPUARMState *env, int scale_mask)
+{
+    uint64_t fpmr = env->vfp.fpmr;
+
+    FP8MulContext ret = {
+        .stat = env->vfp.fp_status[FPST_A64],
+        .fmt1 = fp8_input_fmt[FIELD_EX64(fpmr, FPMR, F8S1)],
+        .fmt2 = fp8_input_fmt[FIELD_EX64(fpmr, FPMR, F8S2)],
+        .scale = -(FIELD_EX64(fpmr, FPMR, LSCALE) & scale_mask),
+    };
+
+    set_flush_to_zero(0, &ret.stat);
+    set_flush_inputs_to_zero(0, &ret.stat);
+    set_default_nan_mode(true, &ret.stat);
+    set_float_rounding_mode(FIELD_EX64(fpmr, FPMR, OSM)
+                            ? float_round_nearest_even_max
+                            : float_round_nearest_even, &ret.stat);
+
+    return ret;
+}
+
+static void fp8_mul_finish(CPUARMState *env, FP8MulContext *c)
+{
+    /*
+     * FP8 multiplies don't update FPSR.{IDC,IOC,IXC,UFC}.
+     * Since this is multiply-add, DZC does not apply and only OFC remains.
+     */
+    fp8_finish_fpst(&env->vfp.fp_status[FPST_A64], &c->stat,
+                    float_flag_overflow);
+}
+
+static FloatParts64 f8dot(uint64_t a, uint64_t b, int n, FP8MulContext *ctx)
+{
+    /*
+     * Because of default_nan_mode, NaNs need no special handling.
+     * We'll simply get the default NaN out at the end of the sequence.
+     */
+    FloatParts64 p0 = ctx->fmt1(a & 0xff, &ctx->stat);
+    FloatParts64 p1 = ctx->fmt2(b & 0xff, &ctx->stat);
+    FloatParts64 pr = parts64_mul(&p0, &p1, &ctx->stat);
+
+    for (int i = 1; i < n; ++i) {
+        p0 = ctx->fmt1(extract64(a, i * 8, 8), &ctx->stat);
+        p1 = ctx->fmt2(extract64(b, i * 8, 8), &ctx->stat);
+        pr = parts64_muladd(&p0, &p1, &pr, 0, &ctx->stat);
+    }
+    return parts64_scalbn(&pr, ctx->scale, &ctx->stat);
+}
+
+static float16 f8dotadd_h(uint64_t a, uint64_t b, int n, float16 c,
+                          FP8MulContext *ctx)
+{
+    FloatParts64 p0 = f8dot(a, b, n, ctx);
+    FloatParts64 p1 = float16_unpack_canonical(c, &ctx->stat);
+
+    p0 = parts64_addsub(&p0, &p1, &ctx->stat, false);
+    return float16_round_pack_canonical(&p0, &ctx->stat);
+}
+
+void HELPER(gvec_fmla_hb)(void *vd, void *vn, void *vm,
+                          CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, 0xf);
+    bool high = extract32(desc, SIMD_DATA_SHIFT, 1);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    uint8_t *n = vn;
+    uint8_t *m = vm;
+    float16 *d = vd;
+
+    for (size_t i = 0; i < nelem; i++) {
+        uint8_t e0 = n[H1(2 * i + high)];
+        uint8_t e1 = m[H1(2 * i + high)];
+
+        d[H2(i)] = f8dotadd_h(e0, e1, 1, d[H2(i)], &ctx);
+    }
+
+    fp8_mul_finish(env, &ctx);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fmla_idx_hb)(void *vd, void *vn, void *vm,
+                              CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, 0xf);
+    bool idx_n = extract32(desc, SIMD_DATA_SHIFT, 1);
+    size_t idx_m = extract32(desc, SIMD_DATA_SHIFT + 2, 4);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    uint8_t *n = vn;
+    uint8_t *m = vm;
+    float16 *d = vd;
+    size_t i = 0;
+
+    do {
+        uint8_t e1 = m[2 * i + H1(idx_m)];
+        do {
+            uint8_t e0 = n[H1(2 * i + idx_n)];
+            d[H2(i)] = f8dotadd_h(e0, e1, 1, d[H2(i)], &ctx);
+        } while (++i % 8 != 0);
+    } while (i < nelem);
+
+    fp8_mul_finish(env, &ctx);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ee71c63116..1c1d4ad2f7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7384,6 +7384,22 @@ TRANS_FEAT(FMLSL_vi, aa64_fhm, do_fmlal_idx, a, true, false)
 TRANS_FEAT(FMLAL2_vi, aa64_fhm, do_fmlal_idx, a, false, true)
 TRANS_FEAT(FMLSL2_vi, aa64_fhm, do_fmlal_idx, a, true, true)
 
+static bool do_fmla_fp8(DisasContext *s, arg_rxx *a,
+                        gen_helper_gvec_3_ptr *fn)
+{
+    if (fpmr_access_check(s) && fp_access_check(s)) {
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, 16, vec_full_reg_size(s),
+                           a->idxn | (a->idxm << 2), fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(FMLAL_hb_v, aa64_f8fma, do_fmla_fp8, a, gen_helper_gvec_fmla_hb)
+TRANS_FEAT(FMLAL_hb_vi, aa64_f8fma, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
+
 static bool do_int3_vector_idx(DisasContext *s, arg_qrrx_e *a,
                                gen_helper_gvec_3 * const fns[2])
 {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 6aea3ce89f..b89e83ce76 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -25,6 +25,7 @@
 %esz_hsd        22:2 !function=xor_2
 %hl             11:1 21:1
 %hlm            11:1 20:2
+%hlm4           11:1 19:3
 
 &r              rn
 &rrr            rd rn rm
@@ -38,6 +39,7 @@
 &rri_e          rd rn imm esz
 &rrr_e          rd rn rm esz
 &rrx_e          rd rn rm idx esz
+&rxx            rd rn rm idxn idxm
 &rrrr_e         rd rn rm ra esz
 &qrr_e          q rd rn esz
 &qrri_e         q rd rn imm esz
@@ -1204,6 +1206,9 @@ FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 FCVTN_bh        0.00 1110 010 ..... 11110 1 ..... ..... @qrrr_h
 FCVTN_bs        0.00 1110 000 ..... 11110 1 ..... ..... @qrrr_h
 
+FMLAL_hb_v      0 idxn:1 00 1110 110 rm:5 11111 1 rn:5 rd:5 \
+                &rxx idxm=0
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
@@ -1322,6 +1327,9 @@ SQDMLAL_vi      0.00 1111 10 . ..... 0011 . 0 ..... .....   @qrrx_s
 SQDMLSL_vi      0.00 1111 01 .. .... 0111 . 0 ..... .....   @qrrx_h
 SQDMLSL_vi      0.00 1111 10 . ..... 0111 . 0 ..... .....   @qrrx_s
 
+FMLAL_hb_vi     0 idxn:1 00 1111 11 ... rm:3 0000 . 0 rn:5 rd:5 \
+                &rxx idxm=%hlm4
+
 # Floating-point conditional select
 
 FCSEL           0001 1110 .. 1 rm:5 cond:4 11 rn:5 rd:5     esz=%esz_hsd
-- 
2.43.0



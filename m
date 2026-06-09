Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBB4CD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:31:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX28N-0004t9-Od; Tue, 09 Jun 2026 15:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX22B-0003gf-Dt
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:54 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21x-00047R-Sy
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:38 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2bf2247e38eso61965665ad.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032892; x=1781637692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rxb79hxCzf4Kl+mKeq/AGRdkdZO3Qt35u5WPt1Nbzks=;
 b=twIMVPRGJHBEbTPxmj3DMbZH74I90hLn6LSPWF+DXT/1FtVW24uRlEPP2Yhx0yTRWw
 wOYGUpWvoH3E9QGGp33JhZbMoz+LXjKPauQD6qWSCZWBLVOagnHwEPT1vE8IodCoGqXL
 f+i7ajSunoucCvnBNZg12snaYwvW8rVwvDTA5GInIirWgc7LnLA+261RJwne0Vpl+AIC
 WqvYvKVrFsQwEVTwV1mzkCcdjjX6Gv7OWFpifBmALhuYLOn66xZQjIU2B3vGZucIGdXs
 alyrgL56GjZQ1SkeaPi9rn6bHBOAXwl/yCvzbXacrA5/JV1FrM+giC1G7iG30nbtiI4D
 RqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032892; x=1781637692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rxb79hxCzf4Kl+mKeq/AGRdkdZO3Qt35u5WPt1Nbzks=;
 b=c7yo/hVEjnzkVLcZpE3eGfF7Teh/8MPiGQH9MAGY7NZfZiCiSuyV1+0jFjBSC4zaiy
 O6gAIkKTHIlpRBKVZxkKKnYqznokIjRBjvoZPCih9Q9dYIBL/MFmSaTUgGXseLNqD4xq
 NeNLkvmC1Fe9RClwX3XBUC2bl/Z3qsgiUD9JF2z5viBixcwyWAdzTsB0H6k31QQLeZTe
 fj9EcoKFq1AGdUaQYLQcn+MHoTfbArKGypwFwp8nqUtNQ83qFq2HtwPwReG+7EyHcn+x
 NgsOqZjoYARsfR1U6ytX11kmvQaNtc59vbCSs60f2I7zkuMlhyzpaVNsmyNQS8tNBmOq
 2/hQ==
X-Gm-Message-State: AOJu0Yy7RoRpzU/rCPGHcuXHCXgw2qtqq2Wg+sXm1gVWQPZrpaldWk1n
 bWdqpPu9FVR1xK93kSpz/MT6NqHcIrkOGLaNlOvTe3TdELeNaaTGamuW7B16D0dAzZV0VDQXWb3
 OOJmI6LY=
X-Gm-Gg: Acq92OGcRrp89HtTD7akuMpcCWiAvAzaelpMQGUe89R47oKr2jmFkhC6hymgZaD4jCD
 DLJiQ8czLx8mWR1MKjrto64pgcGS2oqfqU1li4jGMQm8NxJm9SFgeMeOftdb/UAtcJguO3w5OkN
 AfmuEg7lu5VBflNSAGL7p8oZXoHqh14E/3RMlB9ctFSLzePsq1R4J4xAJNARhO43JWj2pPqWH3E
 aFmTLtOSolsZ4blGgP8fi2DI2FyCrDUqkpNYzV0VKWcEfWSmrc8Xu0RSxBFPwt0zuWCn9Xu4ntg
 VGP2Z0csvOjLmTiv8Y0kzHXndwiBqJ5LNKfV3k9KaTTyMsYrCi9i12wwaxYIZ9qvgyId1Q71Kez
 vgHlOBp3k38doSHWKeVlexznuUpyIgkIDc34fN9rqe+B0gj22MiQuq1U2dNRWLag/CgvropZBhC
 nCY9IF3SG+2q0OTW85DwHIc2Tfx//pPsKAKfafVMI=
X-Received: by 2002:a17:903:291:b0:2c0:c940:dc32 with SMTP id
 d9443c01a7336-2c1e821dde8mr257665365ad.16.1781032892406; 
 Tue, 09 Jun 2026 12:21:32 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 29/45] target/arm: Implement FMLALB, FMLALT for AdvSIMD
Date: Tue,  9 Jun 2026 12:20:53 -0700
Message-ID: <20260609192110.752384-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h        |   5 ++
 target/arm/tcg/helper-fp8-defs.h |   3 +
 target/arm/tcg/fp8_helper.c      | 106 +++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   |  16 +++++
 target/arm/tcg/a64.decode        |   8 +++
 5 files changed, 138 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index b3ff825488..418abf33ab 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1600,6 +1600,11 @@ static inline bool isar_feature_aa64_f8cvt(const ARMISARegisters *id)
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
index a39dc6f859..71d30aa33a 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -568,3 +568,109 @@ void HELPER(sme2_fcvtn_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_cvt_finish(env, &ctx);
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
+    /*
+     * FP8 multiplies don't update any of the FPSR exception flags,
+     * so we do not need an fp8_mul_finish() to propagate status
+     * changes back from ret.stat into env->vfp.fp_status[].
+     */
+    return ret;
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
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d6466de03f..4abf75531f 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7467,6 +7467,22 @@ TRANS_FEAT(FMLSL_vi, aa64_fhm, do_fmlal_idx, a, true, false)
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
index 2d06f14e1d..715d5f05d8 100644
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
@@ -1215,6 +1217,9 @@ FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 FCVTN_bh        0.00 1110 010 ..... 11110 1 ..... ..... @qrrr_h
 FCVTN_bs        0.00 1110 000 ..... 11110 1 ..... ..... @qrrr_h
 
+FMLAL_hb_v      0 idxn:1 00 1110 110 rm:5 11111 1 rn:5 rd:5 \
+                &rxx idxm=0
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
@@ -1333,6 +1338,9 @@ SQDMLAL_vi      0.00 1111 10 . ..... 0011 . 0 ..... .....   @qrrx_s
 SQDMLSL_vi      0.00 1111 01 .. .... 0111 . 0 ..... .....   @qrrx_h
 SQDMLSL_vi      0.00 1111 10 . ..... 0111 . 0 ..... .....   @qrrx_s
 
+FMLAL_hb_vi     0 idxn:1 00 1111 11 ... rm:3 0000 . 0 rn:5 rd:5 \
+                &rxx idxm=%hlm4
+
 # Floating-point conditional select
 
 FCSEL           0001 1110 .. 1 rm:5 cond:4 11 rn:5 rd:5     esz=%esz_hsd
-- 
2.43.0



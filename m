Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395D7CCFA13
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:25:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIF9M-0006KA-NV; Wed, 29 Apr 2026 20:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9I-0006Gl-3H
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:21:00 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIF9G-00065x-2b
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:20:59 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-834f1075805so248644b3a.2
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508457; x=1778113257; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWIPSgFXM14xagFSaM0RuKbNAbnPwaHok4JiUn9LCMU=;
 b=kmmuXFG0ec6o9J+h+62LPzy5jCqsT5eBYG7ClZkBPGpoamCQ6pGKMNwjZsZ/kCu2Nu
 +Ad+FOxY/2QqujwoGTHPEozfa0qXErGMAYjF1+7f701GLhZEYM+vyoZYDp5m2PO+pMjS
 GxajvhH11yBuWQ2XYVgTCyPvXGs1lyCrvv5qGIf1N6DgeZTSJ9uq8gB/gaWkbv1GtY74
 4M3ZyU2r3dK9H+roqjFis6q0CgoGYjhvZjKGriLBGEJHXB3ezZ8KLqDdnERWf0e5qnBb
 PKWRVZlQ7AQR/cTKAd5oD7LLl6HehsolmOL/L0QS6HseBrIX6ElIc4pRQm1XX8sB1h+9
 Dx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508457; x=1778113257;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oWIPSgFXM14xagFSaM0RuKbNAbnPwaHok4JiUn9LCMU=;
 b=rc1Sn7NYt2F9uVSJz0JVtPu7uPgPGSc//nTkIfq6fZVpdrdKGVJiO9Ej1mmbI4+Ps4
 8UutzF3o65s3sq0Oofo/jHeK8nE8jWPYf8Z8GjRUtOF7jU5luM/Xw/WwVNs2aoBkgUFW
 FY/gJDTA7dn6njSqtv40b2UBBqBwpB2aykEsNo5RPVrtiF3dngbZz4MalHL1iFW9UMWk
 zo0gImf8h6tOV6M732IRLfm/UnobC5HUuZ8ctyRyQBhDpU4Fqma5iSVMWm+2ojYVD+Pn
 wYv0F+QNTkcVJh4SS8bTxW/OpgQYYs5FA/MsSOgTBrLSRwK1umG/pV36qRfnhx0qMPi9
 gLDQ==
X-Gm-Message-State: AOJu0YwAOMoBG8+HQCJGwvPtU1xBcqtREi0sQ9TSOB4uCW98x6eFZ+nh
 1juapJpPtmohumT4X2GNQL3eQNe6gnTL1+7trqU6WyAI4DHWCjr4RVypx9zJREcescQ=
X-Gm-Gg: AeBDiet7oiq816M6ToGNm+TT/zkLl9vWvcO2SyEgH9XVYY5Ktsu12RrkrDKIiMCPUH2
 3da/3L3n5j0GlfTzGDKvAgmjKJM+GBK5/VXncB7dp/+5vFWIiggdxIZN+JxFX47kBppkV6NhYTg
 1pLs3fK9UdSw1c1tjPediWt18DbfK4qkHwDbgtT777EJImIun+0HdVOOMG35UixeZrA/H3rtfG0
 pDr8MoqQw3b1JUwKvRFroZ9qPd8blNsGWsYGZYbHmrpKjIz0RnN7D/U2+3hN4OgDHA06KPDuSQ5
 g1NDmP6jj0NCMsQ8kJSB8k9yqmuaGu7pN1wW54XXojbei48ZK2uxaeQ00as/ad2D3M6QOk3mNZu
 x5Xk6BCaesaqIkSZBY/mrbYRfU8D5uc65ojIo/U0joIgrfw0W9b1l4dlopzXnvFTPHRaPGeXaKN
 uQP8/mT2LcxIZxuPvHRf0T0s1KtvrBHB10RMV6V6h+
X-Received: by 2002:a05:6a00:230b:b0:82f:7076:cf2b with SMTP id
 d2e1a72fcca58-834fdc49aabmr831549b3a.40.1777508456568; 
 Wed, 29 Apr 2026 17:20:56 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:20:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 02/47] target/arm: Implement FEAT_FAMINMAX for AdvSIMD
Date: Thu, 30 Apr 2026 10:20:01 +1000
Message-ID: <20260430002046.59739-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
 target/arm/cpu-features.h        |  5 +++++
 target/arm/tcg/helper-a64-defs.h |  7 +++++++
 target/arm/tcg/vec_internal.h    |  7 +++++++
 target/arm/tcg/translate-a64.c   | 14 +++++++++++++
 target/arm/tcg/vec_helper64.c    | 35 ++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode        |  5 +++++
 6 files changed, 73 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index d442bb98eb..f84b451626 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1053,6 +1053,11 @@ static inline bool isar_feature_aa64_ats1a(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ISAR2, ATS1A);
 }
 
+static inline bool isar_feature_aa64_faminmax(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64ISAR3, FAMINMAX) != 0;
+}
+
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
diff --git a/target/arm/tcg/helper-a64-defs.h b/target/arm/tcg/helper-a64-defs.h
index 3c3c5dddb7..215df1201b 100644
--- a/target/arm/tcg/helper-a64-defs.h
+++ b/target/arm/tcg/helper-a64-defs.h
@@ -145,6 +145,13 @@ DEF_HELPER_FLAGS_5(gvec_fmulx_idx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst,
 DEF_HELPER_FLAGS_5(gvec_fmulx_idx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_fmulx_idx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_famax_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famin_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famax_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famin_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famax_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_famin_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+
 #ifndef CONFIG_USER_ONLY
 DEF_HELPER_2(exception_return, void, env, i64)
 #endif
diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index c7ccb28b18..cc2691b2f6 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -338,6 +338,13 @@ bfloat16 helper_sme2_ah_fmin_b16(bfloat16 a, bfloat16 b, float_status *fpst);
 float32 sve_f16_to_f32(float16 f, float_status *fpst);
 float16 sve_f32_to_f16(float32 f, float_status *fpst);
 
+float16 float16_famax(float16, float16, float_status *);
+float16 float16_famin(float16, float16, float_status *);
+float32 float32_famax(float32, float32, float_status *);
+float32 float32_famin(float32, float32, float_status *);
+float64 float64_famax(float64, float64, float_status *);
+float64 float64_famin(float64, float64, float_status *);
+
 /*
  * Decode helper functions for predicate as counter.
  */
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9a27c4c6ec..3c6559964b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6478,6 +6478,20 @@ static gen_helper_gvec_3_ptr * const f_vector_fminnmp[3] = {
 };
 TRANS(FMINNMP_v, do_fp3_vector, a, 0, f_vector_fminnmp)
 
+static gen_helper_gvec_3_ptr * const f_vector_famax[3] = {
+    gen_helper_gvec_famax_h,
+    gen_helper_gvec_famax_s,
+    gen_helper_gvec_famax_d,
+};
+TRANS_FEAT(FAMAX, aa64_faminmax, do_fp3_vector, a, 0, f_vector_famax)
+
+static gen_helper_gvec_3_ptr * const f_vector_famin[3] = {
+    gen_helper_gvec_famin_h,
+    gen_helper_gvec_famin_s,
+    gen_helper_gvec_famin_d,
+};
+TRANS_FEAT(FAMIN, aa64_faminmax, do_fp3_vector, a, 0, f_vector_famin)
+
 static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
 {
     if (fp_access_check(s)) {
diff --git a/target/arm/tcg/vec_helper64.c b/target/arm/tcg/vec_helper64.c
index 249a257177..b5ad67b5e0 100644
--- a/target/arm/tcg/vec_helper64.c
+++ b/target/arm/tcg/vec_helper64.c
@@ -140,3 +140,38 @@ void HELPER(simd_tblx)(void *vd, void *vm, CPUARMState *env, uint32_t desc)
     memcpy(vd, &result, 16);
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+#define DO_FAMINMAX(NAME, TYPE, FN)                             \
+TYPE TYPE##_##NAME(TYPE a, TYPE b, float_status *s)             \
+{                                                               \
+    bool save_fz = get_flush_to_zero(s);                        \
+    bool save_fiz = get_flush_inputs_to_zero(s);                \
+    int new_flags, save_flags = get_float_exception_flags(s);   \
+                                                                \
+    set_flush_to_zero(0, s);                                    \
+    set_flush_inputs_to_zero(0, s);                             \
+    TYPE r = TYPE##_##FN(TYPE##_abs(a), TYPE##_abs(b), s);      \
+                                                                \
+    set_flush_to_zero(save_fz, s);                              \
+    set_flush_inputs_to_zero(save_fiz, s);                      \
+    new_flags = get_float_exception_flags(s);                   \
+    new_flags = (save_flags & float_flag_input_denormal_used)   \
+              | (new_flags & ~float_flag_input_denormal_used);  \
+    set_float_exception_flags(new_flags, s);                    \
+                                                                \
+    return r;                                                   \
+}
+
+DO_FAMINMAX(famax, float16, max)
+DO_FAMINMAX(famin, float16, min)
+DO_FAMINMAX(famax, float32, max)
+DO_FAMINMAX(famin, float32, min)
+DO_FAMINMAX(famax, float64, max)
+DO_FAMINMAX(famin, float64, min)
+
+DO_3OP(gvec_famax_h, float16_famax, float16)
+DO_3OP(gvec_famin_h, float16_famin, float16)
+DO_3OP(gvec_famax_s, float32_famax, float32)
+DO_3OP(gvec_famin_s, float32_famin, float32)
+DO_3OP(gvec_famax_d, float64_famax, float64)
+DO_3OP(gvec_famin_d, float64_famin, float64)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 01b1b3e38b..666a293540 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1193,6 +1193,11 @@ RSUBHN          0.10 1110 ..1 ..... 01100 0 ..... ..... @qrrr_e
 PMULL_p8        0.00 1110 001 ..... 11100 0 ..... ..... @qrrr_b
 PMULL_p64       0.00 1110 111 ..... 11100 0 ..... ..... @qrrr_b
 
+FAMAX           0.00 1110 110 ..... 00011 1 ..... ..... @qrrr_h
+FAMAX           0.00 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
+FAMIN           0.10 1110 110 ..... 00011 1 ..... ..... @qrrr_h
+FAMIN           0.10 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0



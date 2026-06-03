Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579B2CD6E6C
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:31:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIW-0007Ex-EC; Tue, 02 Jun 2026 23:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcIG-0006s3-Dx
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:25 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcIE-0003l0-5E
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:23 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-8422f395a4aso131329b3a.0
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457361; x=1781062161; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dd9QfAaWI8PgPbxUzO/B+KRB9MuMDE7ChDPIJdPgstQ=;
 b=izqIIWM1xBv0ewXs9nyLdUO3IWnu21ZamJHfgBrXmVtNX/8KzWtRFkz6hIC8rWaXqJ
 Y3y7EuyMMDfEAqyKRu06UuuZDtQJ+bsXNFWqSU8T2pU1Qxt0gdL5jX5gJywHXTnhNtmb
 S6JHRVwOO9FLmbbCD31JqfIZcZtW8Unhk4IiXnFklt6c2w1nh44jGr6VZPt8ndZ5g9vL
 AArgDhZEVxf3WsQVFQw7eltVopzTWBYvvp5lYlQepVYfjU5kVCM7AQ4YiqqIEIwbqjrK
 mFdFQCZA/9DxCYq8iqdaFeRpG9h/6CGOkbBHFzfRBOSOOE4g8OMSUMKsoOh/vS0zJKM5
 f1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457361; x=1781062161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Dd9QfAaWI8PgPbxUzO/B+KRB9MuMDE7ChDPIJdPgstQ=;
 b=ZD+e4E77uy30gDND3WDxVg0fiaXwxXGb/KI0vfH3q8hxQx/XbRT4x/EW4EOymzp8qm
 NEpUPifn3HANyyghN4N/x1QTFcGeTVBf8QvXKKVhjIDYcNbnjKTZz1TtVAFQbuCa1Yt3
 ADfeILkPhkxURHzAKXecsj6oN9ObluyqvEv7XXRlrpYRmyP8xdPRNRezVgVy4WK3MLM2
 +XzgdYSaP6MpSTZhjkw73Bh8t+YZK3bpOD5uvA07/i7KuMdTlDF2g061G3zsQohKiO05
 Hj+g9CQaPJJq3vqvUGYBmijhyB2nrn38heCJL8N26ZQ/CRtYiHSfG6LE24Di6iz/4JLi
 eViw==
X-Gm-Message-State: AOJu0YxbGOCIdOms1P767ldu3jxfgH4dKChZf2gisGCZ6d/J/Wa7Qin1
 /G4+eAwVwWkKTS+b5vLDCvjXlCDVLlbigDDRt9gA09b2MulpkqIYR+3ga2GR7GBLCMM=
X-Gm-Gg: Acq92OEmFnCEU7ZZlNgDGKbbZ1eQHOWyi65YJjsDQhvthV/ET7knYiOamcVU5k8KSyB
 u6jXKg8+H/td+jVEz/ZxJGcMCVL9zyvFO0IV3gTJ0ipLGRMVGzMyDc7m9JS6BNrFm46jzg/7IVP
 29VB0dX4oc0oyPbRi3J8eu0i1ToHkVCJZ8JFOzfL+tCVeGuXHDdWS2uUFnIBjvlgKK4zMQ656nM
 iT4rX1XQlDX10k36ILVpTaYSAtCpp7a27dUMSfEfaTtgeiWJ0FXhYWD66u9ChYQ75XDK3bOUfvt
 Ja3BsNP0M2LD6Q+TJuq4WYGvbXebU7m0HdtaCkRqjH5Mi5eRFu6zinXas76nr9VvpS7yCxTonXP
 8Jw/s66XQyklPoDE+5+Mx9axY27AfNlPikuQvHeE/UgzpZz2aQQC+EKo4Jb5bR2+xP7Q/rmeSyj
 fV9emuSzh/nZW5GO44NB9EElAVf8HDJVUxTD5PaAU5dGqgiNC4Gw==
X-Received: by 2002:a05:6a00:2d94:b0:837:8342:abe5 with SMTP id
 d2e1a72fcca58-84285cbad82mr997900b3a.18.1780457360001; 
 Tue, 02 Jun 2026 20:29:20 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 34/45] target/arm: Implement FDOT (FP8 to FP32) for AdvSIMD
Date: Tue,  2 Jun 2026 20:28:43 -0700
Message-ID: <20260603032855.106930-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
 target/arm/cpu-features.h        |  5 ++++
 target/arm/tcg/helper-fp8-defs.h |  3 +++
 target/arm/tcg/fp8_helper.c      | 39 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   | 30 ++++++++++++++++++++++++
 target/arm/tcg/a64.decode        |  4 ++++
 5 files changed, 81 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 5e9eb3405b..4342a2461e 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1610,6 +1610,11 @@ static inline bool isar_feature_aa64_f8fma(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8FMA);
 }
 
+static inline bool isar_feature_aa64_f8dp4(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8DP4);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 802a3b430e..ee6f2e9236 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -29,3 +29,6 @@ DEF_HELPER_FLAGS_5(gvec_fmla_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 
 DEF_HELPER_FLAGS_5(gvec_fmla_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_fmla_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fdot_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_fdot_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 2e3eb43799..d1d5b22cbf 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -728,3 +728,42 @@ void HELPER(gvec_fmla_idx_sb)(void *vd, void *vn, void *vm,
 
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fdot_sb)(void *vd, void *vn, void *vm,
+                          CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, -1);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+    uint32_t *n = vn;
+    uint32_t *m = vm;
+    float32 *d = vd;
+
+    for (size_t i = 0; i < nelem; i++) {
+        d[i] = f8dotadd_s(n[i], m[i], 4, d[i], &ctx);
+    }
+
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fdot_idx_sb)(void *vd, void *vn, void *vm,
+                              CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, -1);
+    size_t idx = simd_data(desc);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+    uint32_t *n = vn;
+    uint32_t *m = vm;
+    float32 *d = vd;
+    size_t i = 0;
+
+    do {
+        uint32_t e1 = m[i + H4(idx)];
+        do {
+            d[i] = f8dotadd_s(n[i], e1, 4, d[i], &ctx);
+        } while (++i % 4 != 0);
+    } while (i < nelem);
+
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b58a55895b..960de1aa86 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7486,6 +7486,36 @@ TRANS_FEAT(FMLAL_hb_vi, aa64_f8fma, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
 TRANS_FEAT(FMLALL_sb_v, aa64_f8fma, do_fmla_fp8, a, gen_helper_gvec_fmla_sb)
 TRANS_FEAT(FMLALL_sb_vi, aa64_f8fma, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_sb)
 
+static bool do_f8dot(DisasContext *s, arg_qrrr_e *a,
+                     gen_helper_gvec_3_ptr *fn)
+{
+    if (fpmr_access_check(s) && fp_access_check(s)) {
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, a->q ? 16 : 8, vec_full_reg_size(s),
+                           0, fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(FDOT_sb_v, aa64_f8dp4, do_f8dot, a, gen_helper_gvec_fdot_sb)
+
+static bool do_f8dot_idx(DisasContext *s, arg_qrrx_e *a,
+                         gen_helper_gvec_3_ptr *fn)
+{
+    if (fpmr_access_check(s) && fp_access_check(s)) {
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, a->q ? 16 : 8, vec_full_reg_size(s),
+                           a->idx, fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(FDOT_sb_vi, aa64_f8dp4, do_f8dot_idx, a, gen_helper_gvec_fdot_idx_sb)
+
 static bool do_int3_vector_idx(DisasContext *s, arg_qrrx_e *a,
                                gen_helper_gvec_3 * const fns[2])
 {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index ee7391a13c..08c493c11e 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1224,6 +1224,8 @@ FMLAL_hb_v      0 idxn:1 00 1110 110 rm:5 11111 1 rn:5 rd:5 \
 FMLALL_sb_v     0.00 1110 0.0 rm:5 110001 rn:5 rd:5 \
                 &rxx idxm=0 idxn=%fmlall_idxn
 
+FDOT_sb_v       0.00 1110 000 ..... 11111 1 ..... ..... @qrrr_s
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
@@ -1348,6 +1350,8 @@ FMLAL_hb_vi     0 idxn:1 00 1111 11 ... rm:3 0000 . 0 rn:5 rd:5 \
 FMLALL_sb_vi    0 . 10 1111 0 . ... rm:3 1000 . 0 rn:5 rd:5 \
                 &rxx idxm=%hlm4 idxn=%fmlall_idxn
 
+FDOT_sb_vi      0.00 1111 00 . ..... 0000 . 0 ..... .....   @qrrx_s
+
 # Floating-point conditional select
 
 FCSEL           0001 1110 .. 1 rm:5 cond:4 11 rn:5 rd:5     esz=%esz_hsd
-- 
2.43.0



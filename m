Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BDDCD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:32:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPs-0000Dw-BJ; Sat, 16 May 2026 20:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOu-0007GX-M0
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:42 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOp-00055s-8E
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:36 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c798fc1a28cso369942a12.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977830; x=1779582630; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEqsTd2VJ1sFN/d6Kvzn3pQD1Ykhi1GgjAdhB88nO0o=;
 b=ljroRduncW1JpT/ifS87F1gR74cuLRWixMGoPcKrKLE7XDpP5oYfWcq+zYmkRw05/X
 b1fYqj7mH5NsbZmvBibFnNGaEX8z0Vkyha9Ad9M7mYRn1J/5i9iF5pvuGJ4KaublN2jx
 YKYr8L1vID8cX2FnOH55TBSaaVmGiLkYASIyoZS6CbJhTVIyfql9Tv3jV9If3UBZXZpD
 althoN5ZLaAaESlD3XKJX0hnYixpmqE0q2rxzD6qaWNurVNYE8DqDPrGbBhNM4ahZmha
 zjwCxsC3gX5aze8isL5jNqO1RSllZx5r0knPY3XXkVo7dcDAaBybLC1AJiLxpADsgcZz
 y1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977830; x=1779582630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zEqsTd2VJ1sFN/d6Kvzn3pQD1Ykhi1GgjAdhB88nO0o=;
 b=PCS5kfftknXIGCWfP3FOwgKT36U7347b8Zst65GSZoVwa69O99Wf3C2EFeLXnXrDt9
 88N3fjBZW4sBiR3Cm3syz94LVkkhN1YvaYuNTYO+khJqgdyguOAJxYfrULVQKdOoMRnL
 IfuNboo9lQuRK0VU01c42uWS2LFYvKO78Gh8SPssqSjAD4S0zjwpSv3Jv2ALNpKa0Swe
 JlUyH9f70b7aerkbMdsZ7o5iVGsRWXBWGPjPDcfLuXv+0xJciC+Avq1u9DIg3JD64VfX
 iK/eCyHXVjRaOWADEoE2zMSNhmdfYToRQFJQcwn9Yi20hKv19zNzqxsqmdsvty6DYz2Y
 4X/A==
X-Gm-Message-State: AOJu0Yx8OASnFqp0l1z3J12/hnlzNpIYAQcE2K/rkdy8TFPQEOfZwqD2
 T9xYj58c5TiYoqaq4aGrhO6hnFwD9gBPM/bLLZgYmAghSU5rSYVq6Vtg08rHGHhGlKdlvJYzU2N
 9TFYI
X-Gm-Gg: Acq92OEDE10tgybcG11XKRcID5I/H0RxHC5WGRpAiCTon1zdLjWZkcV64jQ0WKp/svY
 fsC2QhsKDM2CiLwnh2tudGz58Al973xGa8ldZU/cqrNaVD7cLs++vaWsU/NQiaPCbbbUPll+/Ah
 cXO3OpjNaxTGThGF+ycKzWuyEOh1mGkTD3LzpyxUXwKZMX66C+B0aDj4FJ0O7FVT09wot+Ojxw+
 kA+3I5fo/bcqDAduaZb/gg4LBVn20lX6RKKV4xbwqhe2kG95k/HaE4lW/j/WbgFtQP6MbrzfbhR
 QH14k51JBC1kCWvjEWyb7RqKaUoNL92/db4ObtrabvElvWIgPvtZSF+5cmIPsJGGoQNsgMIPjH4
 rk13Ve4iE0I0+VsHRbqg98lvh3bWCLlQsyC344al0FJfo2EGDra948ofpX9fLrZ9M8rVP0mSRGa
 Rj+dTu/dngMLFagge6Q1WRLq7/rNdC
X-Received: by 2002:a05:6a00:2382:b0:838:c01a:7a54 with SMTP id
 d2e1a72fcca58-83f33ab35e7mr10188373b3a.2.1778977829553; 
 Sat, 16 May 2026 17:30:29 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 30/63] target/arm: Implement BFCVTN for SVE
Date: Sat, 16 May 2026 17:29:29 -0700
Message-ID: <20260517003002.321430-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-fp8-defs.h |  2 +
 target/arm/tcg/fp8_helper.c      | 87 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  3 ++
 target/arm/tcg/sve.decode        |  2 +
 4 files changed, 94 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index b5dc2b7064..bbc8d69e28 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -12,3 +12,5 @@ DEF_HELPER_FLAGS_4(advsimd_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index ec802ed391..8d01393ff9 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -84,6 +84,16 @@ static FP8Context fp8_src_start(CPUARMState *env, uint32_t desc, int scale_mask)
     return fp8_start(env, desc, f8fmt, scale);
 }
 
+static FP8Context fp8_dst_start(CPUARMState *env, uint32_t desc, bool is_f16)
+{
+    uint64_t fpmr = env->vfp.fpmr;
+    FPMRType f8fmt = FIELD_EX64(fpmr, FPMR, F8D);
+    int scale = (is_f16
+                 ? FIELD_SEX64(fpmr, FPMR, NSCALE_F16)
+                 : FIELD_SEX64(fpmr, FPMR, NSCALE));
+
+    return fp8_start(env, desc, f8fmt, scale);
+}
 
 static FloatParts64 fp8_invalid_input(uint8_t x, float_status *s)
 {
@@ -119,6 +129,60 @@ static float16 fcvt_fp8_to_f16(uint8_t x, fp8_input_fn *f8fmt,
     return float16_round_pack_canonical(&p, s);
 }
 
+typedef uint8_t fcvt_fp8_output_fn(FloatParts64 *, int, bool, float_status *);
+
+static uint8_t fcvt_fp8_invalid_output(FloatParts64 *p, int scale,
+                                       bool saturate, float_status *s)
+{
+    /* Invalid output format writes -1 and raises invalid.  */
+    float_raise(float_flag_invalid, s);
+    return 0xff;
+}
+
+static uint8_t fcvt_fp8_e4m3_output(FloatParts64 *p, int scale,
+                                    bool saturate, float_status *s)
+{
+    *p = parts64_scalbn(p, scale, s);
+    /*
+     * Saturating Inf -> Max handled in uncanon_e4m3_overflow
+     * because there is no infinity encoding.
+     */
+    return float8_e4m3_round_pack_canonical(p, s, saturate);
+}
+
+static uint8_t fcvt_fp8_e5m2_output(FloatParts64 *p, int scale,
+                                    bool saturate, float_status *s)
+{
+    /*
+     * Because e5m2 has an infinity encoding, we need to handle
+     * conversion of Inf -> Max manually.  This will be converted
+     * to the actual maximum value during rounding.
+     */
+    if (unlikely(p->cls == float_class_inf)) {
+        if (saturate) {
+            p->cls = float_class_normal;
+            p->exp = INT_MAX;
+            p->frac = -1;
+        }
+    } else {
+        *p = parts64_scalbn(p, scale, s);
+    }
+    return float8_e5m2_round_pack_canonical(p, s, saturate);
+}
+
+static fcvt_fp8_output_fn * const fcvt_fp8_output_fmt[8] = {
+    [0 ... 7] = fcvt_fp8_invalid_output,
+    [OFP8_E5M2] = fcvt_fp8_e5m2_output,
+    [OFP8_E4M3] = fcvt_fp8_e4m3_output,
+};
+
+static uint8_t fcvt_b16_to_fp8(bfloat16 x, fcvt_fp8_output_fn *f8fmt,
+                               int scale, bool saturate, float_status *s)
+{
+    FloatParts64 p = bfloat16_unpack_canonical(x, s);
+    return f8fmt(&p, scale, saturate, s);
+}
+
 void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -285,3 +349,26 @@ void HELPER(sme2_fcvtl_hb)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_finish(env, &ctx);
 }
+
+void HELPER(sve2_bfcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, false);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint16_t *n0 = vn;
+    uint16_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+
+    for (size_t i = 0; i < nelem; ++i) {
+        bfloat16 e0 = n0[H2(i)];
+        bfloat16 e1 = n1[H2(i)];
+        d[H1(2 * i + 0)] = fcvt_b16_to_fp8(e0, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+        d[H1(2 * i + 1)] = fcvt_b16_to_fp8(e1, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 5200f3d034..7276d9c44a 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4099,6 +4099,9 @@ TRANS_FEAT(BF1CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
 TRANS_FEAT(BF2CVTLT, aa64_sme2_or_sve2_f8cvt, do_f8cvt, a,
            gen_helper_sve2_bfcvt, true, true)
 
+TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_bfcvtn_bh, false, false)
+
 /*
  *** SVE Floating Point Compare with Zero Group
  */
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index ca110f4bc1..b6ef8ed8de 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1101,6 +1101,8 @@ BF2CVT          01100101 00 001 000 001111 ..... .....          @rd_rn_e0
 BF1CVTLT        01100101 00 001 001 001110 ..... .....          @rd_rn_e0
 BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
+BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
+
 ### SVE FP Compare with Zero Group
 
 FCMGE_ppz0      01100101 .. 0100 00 001 ... ..... 0 ....        @pd_pg_rn
-- 
2.43.0



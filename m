Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF43CCFA13
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:26:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFE5-0007h3-8K; Wed, 29 Apr 2026 20:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDp-0006WK-Hd
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:41 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDm-0007Xc-0s
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:41 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c70c112cb61so182460a12.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508734; x=1778113534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPx4OYP0T6C/6FxkTyH0Xnk5PleHFSWN0X4r8PZjzLU=;
 b=kkVOIYYkF58buSDimG72C4WMQpluVMgWIPDPlbF1OzcV+/SR7bY6OhLyTvd3i6i+wU
 0I2l6yVsacDUu9OlQ9bu+zZeQ9gxfiaiG52zXVNEWlJjs5oPTbhqEp0/lL7djjv/6Wjj
 8OxSMGEFkq9dGcbJdXnqz7BaQCwXFVG4I7mCR2Xkave6420RJU3pp3UQIMj6u5ttVLLz
 F6hfjhrqiDmsKn/wWYHl+HQMmPwZWKdMSZksxuUYKaK5F7S5uD61yOLjO97xX//sZ4Tl
 H1ZfL3B0AZ3AwIERg+D6yfyamEqdcVoWpzXRUWw9Ycc3BAqds2Xlwhqn3t8CFGQkOAEZ
 j8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508734; x=1778113534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sPx4OYP0T6C/6FxkTyH0Xnk5PleHFSWN0X4r8PZjzLU=;
 b=JzkiaQehrrUe0ikYmtH1+9tZSB1XKnlSVfVO9Z+hdCv/nnDDoUDwFTKRVyR/DbpnBK
 6Ad/h1ABdto8ApSwHMXhJMLSjgl+fwRRCr2Nu4TFhrgKsznjuN5nXba/EUNQblcI3ORw
 +DlBnjvf4mzSWybjQbS/FTxGz2Hza4ZWcFy+GhrrCtxP8hf5xAi/WLpZ+dEybOMEknv5
 KFmjFpFXCscfy+g8Ssa5vhmS98TFGuE1fe4GxW1aKpzSiCHhXKVXHZm7Etl1IwBbMJrE
 D7erkxo8qXelb1b9r1gyzjw2sxokRqowBZg0hBKfO6iA57+8JbDijrgDP/PLqEC15snS
 Kpvg==
X-Gm-Message-State: AOJu0Yyd6/SQRc2ZT70SfPHGd+B/o67HkJgIE/6Mp7C8KW2amkQjyN6e
 uv/owRXY95AWRwXoc2Y4VKtNzjeC64fXVFFnNR1ym96LDgk9Nl0oKzG7VfC+XrPt80s=
X-Gm-Gg: AeBDievTkqdCdq2rcNRQIb1G22LRtaXjVeVMJ9Enw3kj/+5nKBbuHZI1xdudspVexcB
 0O1+k+JYIeUfhW+eU1YmbrYsmopeZ0r35eUSj2zs31bLZnD12zmozu/K01zL2P25Ro8YngF94W/
 4gebGPCX+PaYWhhftAvymANuRqx3DAIT2Y9JgwvvcP+p6z5ge8dFPd+UsCrjCFeVJXU2ZP1a64A
 IqLHt7r+9xSLSsNyqHBrF8YKKqcRemmIEnvMCG9AvOtXAYSadd97H+XS0+tw31eifiMNfNkJMoi
 2CYyHiukgCx+znx3ZX48X/JxV6n6ivkcgkP1nFzyLNeBgfZ0RBTwp971on39q/0X1oTueesm0bj
 uTMqndU0BX8cKrZVMwyjCDUvje9dwHuzAYuRtUl5CSLI5Rw6PxDuWBYKQjxFld7rYlzB5zJ5I2v
 +xv7LhrVFKTr9YiHhUjZqufr2YU0jlsi4tfLrsfSSy
X-Received: by 2002:a05:6a20:2585:b0:398:9d1e:1c6 with SMTP id
 adf61e73a8af0-3a3cf129ab6mr761850637.0.1777508733669; 
 Wed, 29 Apr 2026 17:25:33 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7fd64f21b4sm3204112a12.21.2026.04.29.17.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:25:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 45/47] target/arm: Implement FMLALL{BB, BT, TB,
 TT} for AdvSIMD
Date: Thu, 30 Apr 2026 10:20:44 +1000
Message-ID: <20260430002046.59739-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  3 ++
 target/arm/tcg/fp8_helper.c      | 81 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   |  3 ++
 target/arm/tcg/a64.decode        |  7 +++
 4 files changed, 94 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 7aa8366d94..802a3b430e 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -26,3 +26,6 @@ DEF_HELPER_FLAGS_4(sme2_fcvtn_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fmla_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_fmla_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmla_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_fmla_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 4825316b3b..79d66e2604 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -953,3 +953,84 @@ void HELPER(gvec_fmla_idx_hb)(void *vd, void *vn, void *vm,
                 &env->vfp.fp_status[FPST_A64]);
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fmla_sb)(void *vd, void *vn, void *vm,
+                          CPUARMState *env, uint32_t desc)
+{
+    float_status stat = env->vfp.fp_status[FPST_A64];
+    size_t idx = extract32(desc, SIMD_DATA_SHIFT, 2);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+    uint8_t *n = vn;
+    uint8_t *m = vm;
+    float32 *d = vd;
+
+    uint64_t fpmr = env->vfp.fpmr;
+    FPMRType fmt_n = FIELD_EX64(fpmr, FPMR, F8S1);
+    FPMRType fmt_m = FIELD_EX64(fpmr, FPMR, F8S2);
+    int scale = -FIELD_EX64(fpmr, FPMR, LSCALE);
+
+    set_flush_to_zero(0, &stat);
+    set_flush_inputs_to_zero(0, &stat);
+    set_default_nan_mode(true, &stat);
+    set_float_rounding_mode(FIELD_EX64(fpmr, FPMR, OSM)
+                            ? float_round_nearest_even_max
+                            : float_round_nearest_even, &stat);
+
+    for (size_t i = 0; i < nelem; i++) {
+        FloatParts64 p0 = unpack_fp8(n[H1(4 * i + idx)], fmt_n, &stat);
+        FloatParts64 p1 = unpack_fp8(m[H1(4 * i + idx)], fmt_m, &stat);
+        FloatParts64 p2 = float32_unpack_canonical(d[H4(i)], &stat);
+
+        f8muladd(&p0, &p1, &p2, scale, &stat);
+        d[H4(i)] = float32_round_pack_canonical(&p0, &stat);
+    }
+
+    float_raise(get_float_exception_flags(&stat)
+                & ~float_flag_input_denormal_used,
+                &env->vfp.fp_status[FPST_A64]);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_fmla_idx_sb)(void *vd, void *vn, void *vm,
+                              CPUARMState *env, uint32_t desc)
+{
+    float_status stat = env->vfp.fp_status[FPST_A64];
+    size_t idx_n = extract32(desc, SIMD_DATA_SHIFT, 2);
+    size_t idx_m = extract32(desc, SIMD_DATA_SHIFT + 2, 4);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+    uint8_t *n = vn;
+    uint8_t *m = vm;
+    float32 *d = vd;
+
+    uint64_t fpmr = env->vfp.fpmr;
+    FPMRType fmt_n = FIELD_EX64(fpmr, FPMR, F8S1);
+    FPMRType fmt_m = FIELD_EX64(fpmr, FPMR, F8S2);
+    int scale = -FIELD_EX64(fpmr, FPMR, LSCALE);
+
+    set_flush_to_zero(0, &stat);
+    set_flush_inputs_to_zero(0, &stat);
+    set_default_nan_mode(true, &stat);
+    set_float_rounding_mode(FIELD_EX64(fpmr, FPMR, OSM)
+                            ? float_round_nearest_even_max
+                            : float_round_nearest_even, &stat);
+
+    for (size_t seg = 0; seg < nelem; seg += 4) {
+        FloatParts64 p1 = unpack_fp8(m[H1(4 * seg + idx_m)], fmt_m, &stat);
+
+        for (size_t j = 0; j < 4; j++) {
+            size_t i = seg + j;
+            FloatParts64 p0 = unpack_fp8(n[H1(4 * i + idx_n)], fmt_n, &stat);
+            FloatParts64 p2 = float32_unpack_canonical(d[H4(i)], &stat);
+
+            f8muladd(&p0, &p1, &p2, scale, &stat);
+            d[H4(i)] = float32_round_pack_canonical(&p0, &stat);
+        }
+    }
+
+    float_raise(get_float_exception_flags(&stat)
+                & ~float_flag_input_denormal_used,
+                &env->vfp.fp_status[FPST_A64]);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1c1d4ad2f7..946c16d439 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7400,6 +7400,9 @@ static bool do_fmla_fp8(DisasContext *s, arg_rxx *a,
 TRANS_FEAT(FMLAL_hb_v, aa64_f8fma, do_fmla_fp8, a, gen_helper_gvec_fmla_hb)
 TRANS_FEAT(FMLAL_hb_vi, aa64_f8fma, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
 
+TRANS_FEAT(FMLALL_sb_v, aa64_f8fma, do_fmla_fp8, a, gen_helper_gvec_fmla_sb)
+TRANS_FEAT(FMLALL_sb_vi, aa64_f8fma, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_sb)
+
 static bool do_int3_vector_idx(DisasContext *s, arg_qrrx_e *a,
                                gen_helper_gvec_3 * const fns[2])
 {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index b89e83ce76..ef6d7dfeaa 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1209,6 +1209,10 @@ FCVTN_bs        0.00 1110 000 ..... 11110 1 ..... ..... @qrrr_h
 FMLAL_hb_v      0 idxn:1 00 1110 110 rm:5 11111 1 rn:5 rd:5 \
                 &rxx idxm=0
 
+%fmlall_idxn    30:1 22:1
+FMLALL_sb_v     0.00 1110 0.0 rm:5 110001 rn:5 rd:5 \
+                &rxx idxm=0 idxn=%fmlall_idxn
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
@@ -1330,6 +1334,9 @@ SQDMLSL_vi      0.00 1111 10 . ..... 0111 . 0 ..... .....   @qrrx_s
 FMLAL_hb_vi     0 idxn:1 00 1111 11 ... rm:3 0000 . 0 rn:5 rd:5 \
                 &rxx idxm=%hlm4
 
+FMLALL_sb_vi    0 . 10 1111 0 . ... rm:3 1000 . 0 rn:5 rd:5 \
+                &rxx idxm=%hlm4 idxn=%fmlall_idxn
+
 # Floating-point conditional select
 
 FCSEL           0001 1110 .. 1 rm:5 cond:4 11 rn:5 rd:5     esz=%esz_hsd
-- 
2.43.0



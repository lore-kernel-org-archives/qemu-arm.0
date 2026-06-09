Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD56CD8CB2
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 19:29:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX27B-0002C3-2h; Tue, 09 Jun 2026 15:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21d-0003P2-Uk
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:16 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wX21Z-00044N-KH
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 15:22:12 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2bf1f074a12so61437025ad.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 12:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781032883; x=1781637683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ybfc9/84kaK89cj9awAqOn1QSIiEVQTPnx128PRnNeE=;
 b=hd8D7rBSZltuNZk27FzH4LAnLlIAAcifd1M6UMbh6Zc0xUtgPT5UvGHIyJ9UBfl1Pj
 Gw2C3dKEPNlEXexmGSJb1m0t/GYE8Moc8rutbyiql8lrHp1tscWK5sL/PVuaWyxoeMpg
 8gOiKH4Bnhd7xW+suDA0apuYxi9y9gpfDuv6kcmeuCip2Jcz2q+Otz5wMTqeQgjEolIO
 YUSKTdPajAdGnytKURfOL5mqqnu1M5Fv8P6kce3OC1zqrCI1jUPdEpCileVC3kBhHzqA
 s4WlXnFR5cGGjU6i4qyBAeJvFZBroIhHajr0Yvzbc8++gKfoTSM88JjL4MuWZH2fLTn/
 CW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781032883; x=1781637683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ybfc9/84kaK89cj9awAqOn1QSIiEVQTPnx128PRnNeE=;
 b=o/mru64EPt4hwtp5Ig9BWY24/ElG9ywalYGCO9shrwQDWAkvB1i/qryVXG3R4k7Gc3
 tPln4Za7IaediSBWMIZSVPApUVv+0HIR/3zTTOBz0f8PM+ppe53rFCqfgob8N/uH2rM5
 t8WneWMyB0RFovHiSdtTo8Us0vNRD5pplKuC3x48MuMM4Abo9g3TyH1xwTUUHMyrJ47W
 myCdgxLxNREIlgNzT7oe8zZ/0uls++Hm0pAgO2fS5SvCKIUWcKqlr0Ah5XjS+ziff+aq
 1OcFS0ME3cV+gcSNNr2cYRQywWxlQgioW9WvnJxh++8kQnrZCyZgoszZcoMHBa7wawW1
 j8bQ==
X-Gm-Message-State: AOJu0YyTjUQdIWv7AX8rsWvh5ZffYoerUCjRwHg64d4rJvcXW7Ihrw8g
 GWG82lkNo5xOk0HodcHJa9dthXRJiv4QeNJzhWRPc36jw5p23Xb4gJZ+P8ULpy9sC84mRiJZA2M
 t6yFVll0=
X-Gm-Gg: Acq92OEPmqxmqWPqmVTo21eMAnmum5wOLNHaYuYKisKw96H9B2+OAqtWJoEC+Ggkctn
 9gmNDriHYw7OiXpsAeCkGVtoalHgu129DN0roU75n3GCGhZZW5aQnFUc5N11Wcxgqppv2MydI8s
 ugU2Cki3ii4vVtymVLVxq232GUv2g33ospQtH5ZSFWYLspRaR9D0Wf+ue5Y9VhWNWAcxyTwO7ff
 nQROtJgLZdIHGz/bkr3wIwdjDLAspRSb1RlQxXvcKKZsOT2QlQ+KcO0JdEph+2G1rwon6XbKYp1
 Jcp+oVvtLtjM3wzBfqtl3JkHz/WSOX/Xh6orgNWl/HtjlJAUnUsqn+Bzguo6hl2k644PVyt+Za9
 KfwU0tFGKmWRHSmQZs23605WZWLq8utQI6ZpyR/BDoUA1zyqkDaDNCg0ny1KrE8emGcO6dQ21QW
 yqpBqt3wI1h/3x+mRpup15pgDLJXed0CCB7m9nf9s=
X-Received: by 2002:a17:903:3847:b0:2c0:c262:b917 with SMTP id
 d9443c01a7336-2c1e80e429amr255049135ad.5.1781032882959; 
 Tue, 09 Jun 2026 12:21:22 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164f88473sm240806095ad.25.2026.06.09.12.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 12:21:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v10 16/45] target/arm: Implement FCVTN,
 FCVTN2 (32- to 8-bit fp) for AdvSIMD
Date: Tue,  9 Jun 2026 12:20:40 -0700
Message-ID: <20260609192110.752384-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609192110.752384-1-richard.henderson@linaro.org>
References: <20260609192110.752384-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 33 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   | 16 ++++++++++++++++
 target/arm/tcg/a64.decode        |  1 +
 4 files changed, 52 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 6530d1a6da..023a49e12f 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -16,3 +16,5 @@ DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 8e7982a888..0b86ed9eb9 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -187,6 +187,13 @@ static uint8_t fcvt_f16_to_fp8(float16 x, fcvt_fp8_output_fn *f8fmt,
     return f8fmt(&p, scale, saturate, s);
 }
 
+static uint8_t fcvt_f32_to_fp8(float32 x, fcvt_fp8_output_fn *f8fmt,
+                               int scale, bool saturate, float_status *s)
+{
+    FloatParts64 p = float32_unpack_canonical(x, s);
+    return f8fmt(&p, scale, saturate, s);
+}
+
 void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -406,3 +413,29 @@ void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
     fp8_cvt_finish(env, &ctx);
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
+                             CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, false);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint32_t *n = vn, *m = vm, scratch[4];
+    uint8_t *d = vd + 8 * ctx.high;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+
+    if (vd == vm) {
+        m = memcpy(scratch, vm, 16);
+    }
+
+    for (size_t i = 0; i < 4; ++i) {
+        d[H1(i + 0)] = fcvt_f32_to_fp8(n[H4(i)], output_fmt,
+                                       ctx.scale, osc, &ctx.stat);
+    }
+    for (size_t i = 0; i < 4; ++i) {
+        d[H1(i + 4)] = fcvt_f32_to_fp8(m[H4(i)], output_fmt,
+                                       ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_cvt_finish(env, &ctx);
+    clear_tail(vd, ctx.high ? 16 : 8, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9415419f19..75be92ce15 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6620,6 +6620,22 @@ static bool trans_FCVTN_bh(DisasContext *s, arg_qrrr_e *a)
     return true;
 }
 
+static bool trans_FCVTN_bs(DisasContext *s, arg_qrrr_e *a)
+{
+    if (!dc_isar_feature(aa64_f8cvt, s)) {
+        return false;
+    }
+    if (fpmr_access_check(s) && fp_access_check(s)) {
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, 16, vec_full_reg_size(s),
+                           (a->q << 1) | FPST_A64 << 2,
+                           gen_helper_advsimd_fcvt_bs);
+    }
+    return true;
+}
+
 static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
 {
     if (fp_access_check(s)) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index b08895d917..610047846f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1213,6 +1213,7 @@ FSCALE          0.10 1110 110 ..... 00111 1 ..... ..... @qrrr_h
 FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 
 FCVTN_bh        0.00 1110 010 ..... 11110 1 ..... ..... @qrrr_h
+FCVTN_bs        0.00 1110 000 ..... 11110 1 ..... ..... @qrrr_h
 
 ### Advanced SIMD scalar x indexed element
 
-- 
2.43.0



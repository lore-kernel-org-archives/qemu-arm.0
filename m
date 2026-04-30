Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FB8FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:28:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFAO-0007W4-98; Wed, 29 Apr 2026 20:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAJ-0007F8-In
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:03 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAF-0006U4-RC
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:03 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-827270d50d4so334065b3a.3
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508518; x=1778113318; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r77LULBA40W+/K4GrZLQrDZvSQ+2dumyW18cQ2IB7o8=;
 b=CZMcM1P9xx/iIgC98GUK/R99pnoiTORLymV7YUHMH6l2WDaZCAYSC+KfELzQztEhO6
 hMa9C1L2ZPyoL5LFBGNMVaLDVNeBrElF56qsKoi+nwJ7Q1sZHE9o4bOSoL8QVC5o6lIo
 ivUfGVWgIBwkLLPtxG5lVrsh+hSQWPxu23tLiXruECJlfJYV5E1gQcENNzP65xRjmnn3
 RKZdz4z6DparS8Gr0SbdbuFrP0MSONC5aFq/HoXpMVBL+LAzGL5EdJFp/uU8gK3Egz4e
 sBBuDuLrOr6+lD+LQ3PGfYap16eyMVzNp54RvpknhFR8+EYQ+lS7ElF+foplGu2uwbZ+
 vHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508518; x=1778113318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r77LULBA40W+/K4GrZLQrDZvSQ+2dumyW18cQ2IB7o8=;
 b=Bot/YPga87WqC0qTmV/uJ7qxilz9I2PEmk6PTp4R/kNy3u+o8F1s7Tifx7K25JnBBy
 Qgy9e+Omoes/1m27mM26Jg0UMiauIJSlPbhDu1CXZuiLRWd7sJv9xCvouB/B+X292ojU
 6ZgBEIEZuZuk1TieL0ah90elliSEPmUdeMtlYnBo39pDcYal6ivrBIUandRrGe4wQ8YO
 P2nxBwQiHUjnZKSyzPYT1KVSAIt68HaekLEOazkYAj+UGPPCiLKGCx7/aeJOlRL5utPc
 GeC9FYHd3LQAAZmCR5x7/M9UG3km0+LLHvW4HDoHn0evLhW/PIMtF7MJM1ttBHg8Q4/j
 QecQ==
X-Gm-Message-State: AOJu0YxDtvsIsTtz4QV0wxiE+01pR8A/JKKyn1b0Ux7oz18pk040hq3h
 Q6Btpv4ElnGe232DFEKZah5i58LtFj8xX/ljIMQBCEhXW5GcN/Sasl7We7ez4dk4upL3wNzrv+g
 qx1F7vdM=
X-Gm-Gg: AeBDietXLstOZ+FvF+fja9jts1THQBOpNgmji3yBt7DUPPPvn/bszoRDkYYedUyWnuI
 D7V8gYW6BpSUyGClNks2nPcLvzHlbdbigfCcye2pWTV9mmzWaFUkIh+c5bObtL51B5+lQyZwyAo
 sSh90Q09XKW1MXQPZx5+jfjurwrRLCTvj2G2caIfqX/es5qKAnks9POF5LBc6+QEfLBzB/DdEb0
 9bOFkRG8fZ2J1Gw1erJfVPZS2LRTUt4kQYXEBUNMxdQPICEniQFvEG0iSlbGcpo0sMQyWMXVFKR
 1xyfVJYyUSE+sZt2k8huS2+jhlWjHQ4HqjUox8HNabN3dzC0fzBP8m6yawy6Q2JxtCks8PAHJ3f
 bEjQWrU7B8eVGNv4p5qYc6ZSzBVIf+y7pdcZEAiCBKQsEaW6+7pWIloSXi7zSx9S+6KMs3pe+Z7
 hPxt/NBF/0IaTq6tp4AtrJRO9pTGMcpO7IDcNI0mB5LtqIfoVpvXc=
X-Received: by 2002:a05:6a00:2d0b:b0:824:a635:4181 with SMTP id
 d2e1a72fcca58-834fdb32c70mr892220b3a.15.1777508517800; 
 Wed, 29 Apr 2026 17:21:57 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:21:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 30/47] target/arm: Implement FCVTN,
 FCVTN2 (32- to 8-bit fp) for AdvSIMD
Date: Thu, 30 Apr 2026 10:20:29 +1000
Message-ID: <20260430002046.59739-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 60 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   | 16 +++++++++
 target/arm/tcg/a64.decode        |  1 +
 4 files changed, 79 insertions(+)

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
index 9658eeac8d..facbf4f6c6 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -205,6 +205,24 @@ static float8_e5m2 fcvt_f16_to_fp8e5m2(float16 x, int scale,
     return float8_e5m2_round_pack_canonical(&p, s, saturate);
 }
 
+static float8_e4m3 fcvt_f32_to_fp8e4m3(float32 x, int scale,
+                                       bool saturate, float_status *s)
+{
+    FloatParts64 p = float32_unpack_canonical(x, s);
+
+    p = parts64_scalbn(&p, scale, s);
+    return float8_e4m3_round_pack_canonical(&p, s, saturate);
+}
+
+static float8_e5m2 fcvt_f32_to_fp8e5m2(float32 x, int scale,
+                                       bool saturate, float_status *s)
+{
+    FloatParts64 p = float32_unpack_canonical(x, s);
+
+    scalbn_to_fp8e5m2(&p, scale, saturate, s);
+    return float8_e5m2_round_pack_canonical(&p, s, saturate);
+}
+
 void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -568,3 +586,45 @@ void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
     fp8_finish(env, &ctx);
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
+                             CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint32_t *n = vn, *m = vm, scratch[4];
+    uint8_t *d = vd + 8 * ctx.high;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+
+    if (vd == vm) {
+        m = memcpy(scratch, vm, 16);
+    }
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < 4; ++i) {
+            float32 e = n[H4(i)];
+            d[H1(i + 0)] = fcvt_f32_to_fp8e5m2(e, ctx.scale, osc, &ctx.stat);
+        }
+        for (size_t i = 0; i < 4; ++i) {
+            float32 e = m[H4(i)];
+            d[H1(i + 4)] = fcvt_f32_to_fp8e5m2(e, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < 4; ++i) {
+            float32 e = n[H4(i)];
+            d[H1(i + 0)] = fcvt_f32_to_fp8e4m3(e, ctx.scale, osc, &ctx.stat);
+        }
+        for (size_t i = 0; i < 4; ++i) {
+            float32 e = m[H4(i)];
+            d[H1(i + 4)] = fcvt_f32_to_fp8e4m3(e, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        float8_invalid_output(d, 8, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+    clear_tail(vd, ctx.high ? 16 : 8, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 0927eb6516..3c784afc99 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6537,6 +6537,22 @@ static bool trans_FCVTN_bh(DisasContext *s, arg_qrrr_e *a)
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
index 71456d44e1..a9cf259b9b 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1202,6 +1202,7 @@ FSCALE          0.10 1110 110 ..... 00111 1 ..... ..... @qrrr_h
 FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 
 FCVTN_bh        0.00 1110 010 ..... 11110 1 ..... ..... @qrrr_h
+FCVTN_bs        0.00 1110 000 ..... 11110 1 ..... ..... @qrrr_h
 
 ### Advanced SIMD scalar x indexed element
 
-- 
2.43.0



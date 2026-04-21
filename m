Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2595EA7184
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 05:16:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wF3Sk-0000f6-Hq; Tue, 21 Apr 2026 01:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3SF-00005U-6E
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:34 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wF3SC-0006wJ-B1
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 01:15:22 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2adff872068so17896655ad.1
 for <qemu-arm@nongnu.org>; Mon, 20 Apr 2026 22:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776748518; x=1777353318; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JHw9W0r73gnNntSyeFRZzouxm1QL1rIad4n1+k+yIsY=;
 b=c0ADSwEiGQe4Fwc2BBFFK+jkd4l6W/BlJOr3bULl3Q6pYRW7mFZgg45PcpyjFnEkgj
 G4891Fg3Iz/Z2lIz9dvXmoiM6AQoIvLAWIItFlQKVeL1I87bQkDcW0GZRtE7PlEP/mle
 qzVj1D1y6eA8LOwOQfTwL2+A1be8ZuIeT2cMxwGwtZU+0EXEJKZbFyJdZUvtea2PZLOc
 s0tDuLT/7tCQfMbNBZbl06eJuSkJ7M5DDdD0iwikBDcmKxmm6NOYoJlE8GOCbP9xUZzC
 ZzO/bz8GvWwumsFDDnSS6ulAMGXgDR/WRiSsUmoogHYOvzZYsBvqCWPPhHcoCPd7UXYk
 uPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776748518; x=1777353318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JHw9W0r73gnNntSyeFRZzouxm1QL1rIad4n1+k+yIsY=;
 b=DOurBXb6YWq7l7J5d46+YlDFgRQXt7CKHckcgZvpJ0RwGQAkMQKVGDmlezxSgpKlQC
 GLG1P5nlyWesaw8SjYQ/VwWx8jz185oRSmMqEvVYyoVMgSowMYxAIjrhlTggAmQkbjgM
 1RgmEs7iwtpcSfLz7QhirIXNZyReMvz0iu0KxUcB/nNj44x+G7ZOkZ/weWaDuS/42HTf
 pSIfE0neI1mWOcHMRkMbKr9zWfS92RElQeVCIm9u2s33aMHwvUarmKedMpiwOLsvRHvt
 Zol+VDslLFs+7teK0jpWT64M2Gdx1Y/B8YFbPp9qnN8uli//UHyx9yIeUP9qqclUIlmI
 gDaA==
X-Gm-Message-State: AOJu0YwUUm4f9ruxny9cAPpAaievJkKXd8gAlpUBNqWU0jujZHUgV+mn
 iicjvfBqrfLKZoBOL7xJPW7h3mttBOu7X9Pg2WWcRu5d1GE/VPd+HmkasH2ZVHBW6Dg+fUpIBmP
 SovJD8jw=
X-Gm-Gg: AeBDies9iZk3sajEoIGQOoSUcaAlsmApWGnT7HXX16j1h6xvTxKbs5L1YY3BLpdcv3a
 7AlusgazPuKX3Oh4a6q0Se+/0kYXBwFPewb4q8smlLnF/lMJ8cDd9BmwhMtrkjaClPOPjcKboXo
 xd5mkPsB8yVIQEgfvijkLplc7RwgvgcSNlz+JOJXN28jC2Hs1IMZtQK1l3OAvPHbaSBMxq5sQ2Q
 cdPdK98NaGCeuDNsqjWnhjePUcntm30x9oOlYYAxDtM3SxYtnkYF1fN2lKbkue4NpIRzUyJEAMQ
 GTFR1UYLTtYm9hSXnNdy/grR4+gntO0Vsj8SNWYahKVoVkRalWceWdByVAPMhiuPyKiB8e1XuET
 tfFmgz+e3CnduK5UVVjG9OTqruB1GaG3LP8ojhdOeKoJcbxgiPxgpCjIZuihgTD7WPHuYd9jI1H
 oqInVcTE9m2KunRO1XPdH/y9adtR7rNjc1WRdC3Eb6R8v4WFje/Fo=
X-Received: by 2002:a17:902:930b:b0:2b2:67ca:5fff with SMTP id
 d9443c01a7336-2b5f9fd24b7mr118390615ad.28.1776748517640; 
 Mon, 20 Apr 2026 22:15:17 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab0cddfsm174631715ad.49.2026.04.20.22.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 22:15:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 36/37] target/arm: Implement FCVT, FCVTN (FP32 to FP8) for SME
Date: Tue, 21 Apr 2026 15:13:45 +1000
Message-ID: <20260421051346.41106-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421051346.41106-1-richard.henderson@linaro.org>
References: <20260421051346.41106-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 target/arm/tcg/fp8_helper.c      | 95 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sme.c   |  3 +
 target/arm/tcg/sme.decode        |  3 +
 4 files changed, 103 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 5863a6dbb8..36ae977431 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -21,3 +21,5 @@ DEF_HELPER_FLAGS_4(sve2_fcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvtnb_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvtnt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sme2_fcvtn_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index ebd448b466..099ca44c4a 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -645,3 +645,98 @@ void HELPER(sve2_fcvtnt_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_finish(env, &ctx);
 }
+
+void HELPER(sme2_fcvt_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    ARMVectorReg scratch[4];
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint32_t *n = vn;
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+    size_t stride = sizeof(ARMVectorReg) / 4;
+
+    if (vectors_overlap(vd, 1, vn, 4)) {
+        n = memcpy(scratch, vn, sizeof(scratch));
+    }
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; i++) {
+            for (size_t j = 0; j < 4; j++) {
+                float32 e = n[H4(i) + stride * j];
+                d[H1(i + nelem * j)] =
+                    float32_to_float8_e5m2(e, ctx.scale, osc, &ctx.stat);
+            }
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; i++) {
+            for (size_t j = 0; j < 4; j++) {
+                float32 e = n[H4(i) + stride * j];
+                d[H1(i + nelem * j)] =
+                    float32_to_float8_e5m2(e, ctx.scale, osc, &ctx.stat);
+            }
+        }
+        break;
+    default:
+        float8_invalid_output(d, oprsz, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
+
+void HELPER(sme2_fcvtn_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc);
+    uint32_t *n0 = vn;
+    uint32_t *n1 = vn + sizeof(ARMVectorReg);
+    uint32_t *n2 = vn + sizeof(ARMVectorReg) * 2;
+    uint32_t *n3 = vn + sizeof(ARMVectorReg) * 3;
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+
+    switch (ctx.f8fmt) {
+    case OFP8_E5M2:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            float32 e2 = n2[H2(i)];
+            float32 e3 = n3[H2(i)];
+            d[H1(4 * i + 0)] =
+                float32_to_float8_e5m2(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 1)] =
+                float32_to_float8_e5m2(e1, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 2)] =
+                float32_to_float8_e5m2(e2, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 3)] =
+                float32_to_float8_e5m2(e3, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    case OFP8_E4M3:
+        for (size_t i = 0; i < nelem; ++i) {
+            float32 e0 = n0[H2(i)];
+            float32 e1 = n1[H2(i)];
+            float32 e2 = n2[H2(i)];
+            float32 e3 = n3[H2(i)];
+            d[H1(4 * i + 0)] =
+                float32_to_float8_e4m3(e0, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 1)] =
+                float32_to_float8_e4m3(e1, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 2)] =
+                float32_to_float8_e4m3(e2, ctx.scale, osc, &ctx.stat);
+            d[H1(4 * i + 3)] =
+                float32_to_float8_e4m3(e3, ctx.scale, osc, &ctx.stat);
+        }
+        break;
+    default:
+        float8_invalid_output(d, oprsz, &ctx.stat);
+        break;
+    }
+
+    fp8_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index b112f16cd7..c57c7c122e 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1571,6 +1571,9 @@ static bool trans_FCVT_bh(DisasContext *s, arg_zz_n *a)
     return true;
 }
 
+TRANS_FEAT(FCVT_bs, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvt_bs, 0)
+TRANS_FEAT(FCVTN_bs, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_fcvtn_bs, 0)
+
 static bool do_zipuzp_4(DisasContext *s, arg_zz_e *a,
                         gen_helper_gvec_2 * const fn[5])
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index a02bcc0e22..2b9e41a75a 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -865,6 +865,9 @@ BF2CVTL         11000001 111 00110 111000 ..... ....1       @zz_2x1
 
 FCVT_bh         11000001 001 00100 111000 ....0 .....       @zz_1x2
 
+FCVT_bs         11000001 001 10100 111000 ...00 .....       @zz_1x4
+FCVTN_bs        11000001 001 10100 111000 ...01 .....       @zz_1x4
+
 ZIP_4           11000001 esz:2 1 10110 111000 ...00 ... 00   \
                 &zz_e zd=%zd_ax4 zn=%zn_ax4
 ZIP_4           11000001 001     10111 111000 ...00 ... 00   \
-- 
2.43.0



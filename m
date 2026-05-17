Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AD1CD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:32:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPq-0008Vi-Po; Sat, 16 May 2026 20:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOw-0007Il-MM
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:43 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOs-00059L-Mn
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:38 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-c798fc1a28cso369956a12.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977833; x=1779582633; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2+cLaofG6jzP54pUuw/n61K4yVyE6QqU7IL0/8Yt60=;
 b=qmPOi/fPhiPb5XrO7AjiL/rtXQtJDqVkcOjHWvRDsQ9fYkzmoUgOEMhLGitQGUEYNb
 RzyyzDM2QEZ3w8QTFJ3homxOfsyDKpL0QJz+KdaoOv0Azei6u7BR1MiPAygS1fom8Trg
 CMyCeByLJeMoXhRvYjCe4ICBcUUrsksZgsMWR+SnjvJUdlp1YNp5D746LdLQSUyYcT4S
 K73Q0Rjxb+1SpeeLum+vKQhbf6Up76fyGSPFbmZN1P4bSLVpbcdU8ssBjvgdO3x5QsF1
 G7TJctUIc5zgoWfB8CoReoMONqLUJNoLjoSxbwvSa90oCL6F8jpxXKbIWQQR2VQTJESV
 SSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977833; x=1779582633;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X2+cLaofG6jzP54pUuw/n61K4yVyE6QqU7IL0/8Yt60=;
 b=IcFp7wBGAQ2SSDI8o7UwDPGTFtalr+7T20x/7s1QdF1SZIwBoF76X8Cs87U8qKi0v+
 c07ui0pdDiOAzvFMCcVfNwyi8HuEFoRPeyaFab+PXgWiuVkbD0PFXOQfVLnbpv3smHBp
 R6EDmNHlZs/8Wl9xVcw0bDo5ej5dIeZHfPYC5rrGQWBQlJ0H7HVyitnLqyieWFNBvCQx
 w3zP2EbJ87ftroaDfZVEwHrl+g488Tdz2E9BZWWmpIkJXHCvser6jQ7yfpfUHXxIczmW
 yd14stYGWqS+UBy68EEiCTrgTOYUVAOSfYqzapP0JlrqoIXj8C0TgIj63Us4T3ngjtFx
 DC5A==
X-Gm-Message-State: AOJu0YxBIXKfbdAZG2suTNyVLBaRFTLnxQMI9cgfscDaQ/hXK4pUsitE
 nb8eMwRv3+LCWbhGXr/trQpPkAj3NHulKaluXYrF5jZJijML8v98B1Z03hzO/hk/5xI=
X-Gm-Gg: Acq92OEsQ6f+DtBQPG8fVJcUn9sUr38Auea4xmKXA9aZJAG8lyj4ht3b21Cj4YnPmh+
 9KAzvPJwaaopGpXpjh0X10ERTkA417Qk7ludiZlOmfyIrQ1fEa/b7dqC1L0NzIvErtAcAbPSZZ/
 mxOdKNfdFQgeGfPC718tpEuLaGGeAijs6DXkhBeOkfptTEEivOenZbkKheGEYvgQP1jlKu/5afA
 IYOz+caS7ZJ75f376LMlgtXDGWtlDpcmUB+6dgaD+bhVgx/J5s+H7rF6nZ2A0LAyCLpeM3gVqvG
 7A+55KfsNYi9SQ9pkSmZDlrvX7rnqz2LiSnZTK3+DjEbwCnex8QYQekBJQxoSV5rEciGFeQ27kT
 AGLeFiA09T+V79cmQZcCFrJ5cWOvZ7TuSWqqIIpzUgrErfQM6hss83wTs0StvMQ98jEy62CARu3
 e/D5Lepw9jP90rLnQphKIE4W1nIoJp
X-Received: by 2002:a05:6a00:1d85:b0:83a:a55f:c3f9 with SMTP id
 d2e1a72fcca58-83f33b4e019mr9880552b3a.20.1778977832987; 
 Sat, 16 May 2026 17:30:32 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 34/63] target/arm: Implement FCVTNB, FCVTNT for SVE
Date: Sat, 16 May 2026 17:29:33 -0700
Message-ID: <20260517003002.321430-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
 target/arm/tcg/fp8_helper.c      | 47 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-sve.c   |  4 +++
 target/arm/tcg/sve.decode        |  2 ++
 4 files changed, 55 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index e67fb191c2..5863a6dbb8 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -19,3 +19,5 @@ DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sve2_fcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(advsimd_fcvt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtnb_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_4(sve2_fcvtnt_bs, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index c32577a9e4..e1d255f864 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -465,3 +465,50 @@ void HELPER(advsimd_fcvt_bs)(void *vd, void *vn, void *vm,
     fp8_finish(env, &ctx);
     clear_tail(vd, ctx.high ? 16 : 8, simd_maxsz(desc));
 }
+
+void HELPER(sve2_fcvtnb_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, false);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint32_t *n0 = vn;
+    uint32_t *n1 = vn + sizeof(ARMVectorReg);
+    uint16_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        float32 e0 = n0[H4(i)];
+        float32 e1 = n1[H4(i)];
+        /* Zero-extend uint8_t to clear the odd lanes. */
+        d[H2(2 * i + 0)] = fcvt_f32_to_fp8(e0, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+        d[H2(2 * i + 1)] = fcvt_f32_to_fp8(e1, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_finish(env, &ctx);
+}
+
+void HELPER(sve2_fcvtnt_bs)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, false);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint32_t *n0 = vn;
+    uint32_t *n1 = vn + sizeof(ARMVectorReg);
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 4;
+
+    for (size_t i = 0; i < nelem; ++i) {
+        float32 e0 = n0[H4(i)];
+        float32 e1 = n1[H4(i)];
+        d[H1(4 * i + 1)] = fcvt_f32_to_fp8(e0, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+        d[H1(4 * i + 3)] = fcvt_f32_to_fp8(e1, output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_finish(env, &ctx);
+}
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index c7fcf27183..13f7ab01af 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4103,6 +4103,10 @@ TRANS_FEAT(FCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_fcvtn_bh, false, false)
 TRANS_FEAT(BFCVTN, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
            a, gen_helper_sve2_bfcvtn_bh, false, false)
+TRANS_FEAT(FCVTNB, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtnb_bs, false, false)
+TRANS_FEAT(FCVTNT, aa64_sme2_or_sve2_f8cvt, do_f8cvt,
+           a, gen_helper_sve2_fcvtnt_bs, false, false)
 
 /*
  *** SVE Floating Point Compare with Zero Group
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 806953bc35..72755b27af 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1103,6 +1103,8 @@ BF2CVTLT        01100101 00 001 001 001111 ..... .....          @rd_rn_e0
 
 FCVTN           01100101 00 001 010 001100 ....0 .....          @rd_rnx2 esz=1
 BFCVTN          01100101 00 001 010 001110 ....0 .....          @rd_rnx2 esz=1
+FCVTNB          01100101 00 001 010 001101 ....0 .....          @rd_rnx2 esz=2
+FCVTNT          01100101 00 001 010 001111 ....0 .....          @rd_rnx2 esz=2
 
 ### SVE FP Compare with Zero Group
 
-- 
2.43.0



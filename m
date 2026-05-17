Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB67CCD4F3D
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:33:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPp-0008Rh-Od; Sat, 16 May 2026 20:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOv-0007HA-0E
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:42 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOr-00058A-Ea
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:36 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c70fb6aa323so348908a12.3
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977831; x=1779582631; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4TZle6J3SJxA7e07EfpXC2uO2wgjZ/jOBLd9NJqphzg=;
 b=GDXxvRcZ+e9tJmPsg9jPXoT82C4Z7+1ZujT4A1XH66zOjEYuuSVaYAPksEC8oxg4hg
 LjkDyew2dvdwRIcpGZKmJGpr3S27aGYgswHrqvUt2zd/Jq3EHuzw/o+qlBng8IX6QKmi
 SRLiKVSti2GHuRJheCOda0IG8T7zyaLw+b/1uloFuTCGNjP5Vm8ZEWacklG5uGEx/nsP
 QEUevoBFBb+PjJTpXi03mSqN2XQOYe4kj2OPEAsWSSoqfOZJI9+O0abz3APRZl8/IjpX
 iQ0LTj9n8RSIR8UZM7DTNd58XpbgWLTc69La6ZGtryP1g2VqtWkI/SxCIooB9vAh47k1
 zlZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977831; x=1779582631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4TZle6J3SJxA7e07EfpXC2uO2wgjZ/jOBLd9NJqphzg=;
 b=f01HzT/LnwSwIffzrlRWgW28179ymLxuCwZvI71i9DUyybuk2bFWix2Esl0hemBFYI
 xJsR9s+CbsZgRdVmfpWvbVoj/RWLfo3BYO5ZRObNIJw7p9nH7yp/PnOArDQFRTYfI2LH
 LC9xLiNJhB/KK7RJCGikZGDEtBGQNZvARcgi/X/T5Ok77Gc3xET3BJFNvuH8LOGwvaHN
 upwr7GuwsrEipFSBvbwEOwnzvpgj4owj+J7mObvAh/t56zyW/Ko5/dkj+yYvp6h2pXDl
 s08yv+Pf718Esf/GxKL7YcX8ABk+CwOOhli1Z8braUa933k9ZXxx+zW/QjfoMO58szg7
 sWmg==
X-Gm-Message-State: AOJu0YweZuFb52jsRZymAi/YQpfJLGcxCnNXRdqJvOg03zE2TeWMgvWQ
 YIsHVs+5rbAd2wjbTsnOpUQ3BvbM8QbiJnA1IBqzGXR48QD297x20795EQU77gqe3NU=
X-Gm-Gg: Acq92OGzaXqryTf8uB2sPsfObcT0Wv01aImRj1kZNZKssxxJKnjgC5CqVvJGu7Ex+SE
 R8SkbaOmJB/DBaO5D4ljOh/7D/ZC/CVSq6HgpD+ngxU2UcGoXMvYiT6PF3gsLI1HRdTwG5Zx8QR
 yLwsmlrKExan0mNDBh3Fb3CZwO/S09rIoQ7e2PSSoBilcwxTdrKQCrMqit1tQg0SW3SrkMB6OEJ
 hveuCxZqcp3y3dj9s8PzpFAc46w+98jK8n9lo9Raa25L5yL0/f9JjdmCpfJ4wwspgUcWDMb09qA
 i4wQvKxzdSlQwlazzC41bMF9gJN4pRcBMeRU3gxM+hq9eLK4geC+G/DJcvWJR6iN7INuhEeb+PZ
 qpiB2cE4GBdATWiwJURWPC2wyxpeSXS8jDjMSDaFL1c+iRe7S/B50PULD5VLR/otKdXQm023KRG
 n9tjDhJgtkVsoRTv3wPJ6VfHC7fVxw
X-Received: by 2002:a05:6a00:1ca4:b0:81f:3fbd:ccf with SMTP id
 d2e1a72fcca58-83f33da0f1amr9007229b3a.23.1778977831017; 
 Sat, 16 May 2026 17:30:31 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 31/63] target/arm: Implement FCVTN (16- to 8-bit fp) for
 AdvSIMD
Date: Sat, 16 May 2026 17:29:30 -0700
Message-ID: <20260517003002.321430-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
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
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 37 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   | 15 +++++++++++++
 target/arm/tcg/a64.decode        |  2 ++
 4 files changed, 56 insertions(+)

diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index bbc8d69e28..6530d1a6da 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -14,3 +14,5 @@ DEF_HELPER_FLAGS_4(sme2_fcvt_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_fcvtl_hb, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(sve2_bfcvtn_bh, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fcvt_bh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 8d01393ff9..95c37a037e 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -183,6 +183,13 @@ static uint8_t fcvt_b16_to_fp8(bfloat16 x, fcvt_fp8_output_fn *f8fmt,
     return f8fmt(&p, scale, saturate, s);
 }
 
+static uint8_t fcvt_f16_to_fp8(float16 x, fcvt_fp8_output_fn *f8fmt,
+                               int scale, bool saturate, float_status *s)
+{
+    FloatParts64 p = float16_unpack_canonical(x, s);
+    return f8fmt(&p, scale, saturate, s);
+}
+
 void HELPER(advsimd_bfcvtl)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 {
     FP8Context ctx = fp8_src_start(env, desc, 0x3f);
@@ -372,3 +379,33 @@ void HELPER(sve2_bfcvtn_bh)(void *vd, void *vn, CPUARMState *env, uint32_t desc)
 
     fp8_finish(env, &ctx);
 }
+
+void HELPER(gvec_fcvt_bh)(void *vd, void *vn, void *vm,
+                          CPUARMState *env, uint32_t desc)
+{
+    FP8Context ctx = fp8_dst_start(env, desc, true);
+    fcvt_fp8_output_fn *output_fmt = fcvt_fp8_output_fmt[ctx.f8fmt];
+    uint16_t *n = vn;
+    uint16_t *m = vm;
+    uint8_t *d = vd;
+    bool osc = FIELD_EX64(env->vfp.fpmr, FPMR, OSC);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nelem = oprsz / 2;
+    ARMVectorReg scratch;
+
+    if (vd == vm) {
+        m = memcpy(&scratch, vm, oprsz);
+    }
+
+    for (size_t i = 0; i < nelem; ++i) {
+        d[H1(i)] = fcvt_f16_to_fp8(n[H2(i)], output_fmt,
+                                   ctx.scale, osc, &ctx.stat);
+    }
+    for (size_t i = 0; i < nelem; ++i) {
+        d[H1(i) + nelem] = fcvt_f16_to_fp8(m[H2(i)], output_fmt,
+                                           ctx.scale, osc, &ctx.stat);
+    }
+
+    fp8_finish(env, &ctx);
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 565053a1a4..0927eb6516 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -6522,6 +6522,21 @@ static gen_helper_gvec_3_ptr * const f_vector_fscale[3] = {
 };
 TRANS_FEAT(FSCALE, aa64_f8cvt, do_fp3_vector, a, 0, f_vector_fscale)
 
+static bool trans_FCVTN_bh(DisasContext *s, arg_qrrr_e *a)
+{
+    if (!dc_isar_feature(aa64_f8cvt, s)) {
+        return false;
+    }
+    if (fpmr_access_check(s) && fp_access_check(s)) {
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, a->q ? 16 : 8, vec_full_reg_size(s),
+                           FPST_A64 << 2, gen_helper_gvec_fcvt_bh);
+    }
+    return true;
+}
+
 static bool do_fmlal(DisasContext *s, arg_qrrr_e *a, bool is_s, bool is_2)
 {
     if (fp_access_check(s)) {
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 26d31d0a33..71456d44e1 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1201,6 +1201,8 @@ FAMIN           0.10 1110 1.1 ..... 11011 1 ..... ..... @qrrr_sd
 FSCALE          0.10 1110 110 ..... 00111 1 ..... ..... @qrrr_h
 FSCALE          0.10 1110 1.1 ..... 11111 1 ..... ..... @qrrr_sd
 
+FCVTN_bh        0.00 1110 010 ..... 11110 1 ..... ..... @qrrr_h
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0



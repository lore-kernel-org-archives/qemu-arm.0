Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19504C83F17
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 17:49:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucpCc-000666-JL; Fri, 18 Jul 2025 13:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucouw-0004zc-GH
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:42 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucout-0000q3-H1
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:42 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a528243636so1473888f8f.3
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752859837; x=1753464637; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uLfjhxFT0Ps5Y4fJ3SOOFDl8UOrvO7ldqv+w/Ov3CDc=;
 b=Y1KiAL5ovlnZ9lfk77op6jQJr3fZCG/AfpLg981gGMOoxy9zOsTzRTWVfZBsW7RNCm
 Vkv+oVYi54b6KpMAEFeplcPfxFYhCpx1wvBwzbkeR+9zwdsGpMCXQAtOQjGnfnGoNqmd
 U4oiC2viYjpMFwGzKsfWqbCHQ2gL2wEbuTAJb3fMH+MXM/izeSYC3Z6mrXBXqn7e9IsX
 0Rodc9yf6VChMU13pAYMpfawbbT4FlMaVWeVJVWmXrQvT9j1CY2eUnhX6vxEnT77slux
 f9NCOaKYNdfbxtgrtkMqO/CQFqlJOytWlw1b7C8v7WLvI2MaFJFH8EVi8Uj2uV5HNrK8
 L+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859837; x=1753464637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uLfjhxFT0Ps5Y4fJ3SOOFDl8UOrvO7ldqv+w/Ov3CDc=;
 b=JB1mvtIW8eEc3cV146h6BD+bJe1wqz/R3Z8PcQztL6UelzjqjGTsMkvwcKkZt9mM/g
 KpCKkWcS9oo+B5KPz+QQRrl+MDGDyI+o/XzGertfKZF7a4+Yf3gi0hK3INPGu6UJdtha
 N2dvuHOAblNAKaSrfnIYYwQHlP9CZmW/mxpnv6MfjT9+bmPtJciTjV4Yi2yGe4W5laZd
 CJ8Dqf+hU6AGsYD2IsmOAPzXieSX5p85cXxXbjqYz59OCF7RUZapZJI3wfDkZlYcmyc6
 hznluTQm1iuuzuE99loNym7JXZQlhoodRU+dQUFRiKz7JDRwLJTCUXJIQJZ3TZ1WbSci
 pLvQ==
X-Gm-Message-State: AOJu0YzD5fXXi4iYm3x6P9knSWXnngz9hMohEnOLz55iMEcEFu8JfI/T
 HRABxQOeHxgxdvE01a5IRCVafGPHbY1htGX07Zw8vH7udRE5zW/M0hMrXtd7MVnE1RF+41sDUR1
 X01Dz
X-Gm-Gg: ASbGncvQUlbRTx1gRl445FoyFsS2sIW5+9jB6gRJp7YniIoym35agd8oB566FCv2Hmy
 GqxuJxXBY8CIOs7SwSubaMB+ynrfdqCQaDYTRPTksOG50wYGitDVDoywzA4B6YgRo7nXBdJWc/Z
 gAHF2Rh78UuXCPQFj0AI8hOPKf310975nB6Kh7eNc7Fh1gaMWR+MkNl/niYwfFNTYkcQsr9jsYS
 EBzQjpAmYDQd8DuxBLQUj6T2sAK/xUDDLd7G2yxn9aKnAz+NjSTN7+TQiAOVGXl1q9/7plMR65y
 Y/gp5teU4NtBvtOsDFCaDIi0GsqkcxrJ3Es5kEZsd6QU9nn3LoftIT//3NWiET3Rv9ohLOUbg4X
 f6lZdleGfxYzC0k/KPf+dmG/p3fVw
X-Google-Smtp-Source: AGHT+IEZ/8Dq4H3f1TYlOQSvccLptAZUQh3U3D5++hHppWYiv3XFQTkhVjQZMZYQNW07AvaF8Dwong==
X-Received: by 2002:a05:6000:652:b0:3b5:dc07:50a4 with SMTP id
 ffacd0b85a97d-3b61b0ec0f1mr2991191f8f.2.1752859837151; 
 Fri, 18 Jul 2025 10:30:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25443sm2454655f8f.9.2025.07.18.10.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:30:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-10.1 02/10] target/arm: Add BFADD, BFSUB, BFMUL, BFMAXNM,
 BFMINNM (predicated)
Date: Fri, 18 Jul 2025 18:30:24 +0100
Message-ID: <20250718173032.2498900-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718173032.2498900-1-peter.maydell@linaro.org>
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

FEAT_SVE_B16B16 adds bfloat16 versions of the SVE floating point
(predicated) instructions, which are encoded via sz=0b00.
Add BFADD, BFSUB, BFMUL, BFMAXNM, BFMINNM; these are all the insns
in this group which do not change behaviour for AH=1.

We will deal with BFMAX/BFMIN (which do have different AH=1
behaviour) in a following commit.

Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-sve.h    | 10 ++++++++++
 target/arm/tcg/sve_helper.c    |  5 +++++
 target/arm/tcg/translate-sve.c | 22 +++++++++++++++++-----
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index c36090d13d1..d612bcaded3 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1196,6 +1196,8 @@ DEF_HELPER_FLAGS_5(sve_fcmne0_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_fcmne0_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_fadd_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fadd_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fadd_s, TCG_CALL_NO_RWG,
@@ -1203,6 +1205,8 @@ DEF_HELPER_FLAGS_6(sve_fadd_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fadd_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_fsub_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fsub_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fsub_s, TCG_CALL_NO_RWG,
@@ -1210,6 +1214,8 @@ DEF_HELPER_FLAGS_6(sve_fsub_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fsub_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_fmul_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fmul_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fmul_s, TCG_CALL_NO_RWG,
@@ -1252,6 +1258,8 @@ DEF_HELPER_FLAGS_6(sve_ah_fmax_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_ah_fmax_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_fminnum_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fminnum_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fminnum_s, TCG_CALL_NO_RWG,
@@ -1259,6 +1267,8 @@ DEF_HELPER_FLAGS_6(sve_fminnum_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fminnum_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_fmaxnum_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fmaxnum_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fmaxnum_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 43b872c7fd6..a229503bc21 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4629,14 +4629,17 @@ void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg,       \
     } while (i != 0);                                           \
 }
 
+DO_ZPZZ_FP(sve_fadd_b16, uint16_t, H1_2, bfloat16_add)
 DO_ZPZZ_FP(sve_fadd_h, uint16_t, H1_2, float16_add)
 DO_ZPZZ_FP(sve_fadd_s, uint32_t, H1_4, float32_add)
 DO_ZPZZ_FP(sve_fadd_d, uint64_t, H1_8, float64_add)
 
+DO_ZPZZ_FP(sve_fsub_b16, uint16_t, H1_2, bfloat16_sub)
 DO_ZPZZ_FP(sve_fsub_h, uint16_t, H1_2, float16_sub)
 DO_ZPZZ_FP(sve_fsub_s, uint32_t, H1_4, float32_sub)
 DO_ZPZZ_FP(sve_fsub_d, uint64_t, H1_8, float64_sub)
 
+DO_ZPZZ_FP(sve_fmul_b16, uint16_t, H1_2, bfloat16_mul)
 DO_ZPZZ_FP(sve_fmul_h, uint16_t, H1_2, float16_mul)
 DO_ZPZZ_FP(sve_fmul_s, uint32_t, H1_4, float32_mul)
 DO_ZPZZ_FP(sve_fmul_d, uint64_t, H1_8, float64_mul)
@@ -4661,10 +4664,12 @@ DO_ZPZZ_FP(sve_ah_fmax_h, uint16_t, H1_2, helper_vfp_ah_maxh)
 DO_ZPZZ_FP(sve_ah_fmax_s, uint32_t, H1_4, helper_vfp_ah_maxs)
 DO_ZPZZ_FP(sve_ah_fmax_d, uint64_t, H1_8, helper_vfp_ah_maxd)
 
+DO_ZPZZ_FP(sve_fminnum_b16, uint16_t, H1_2, bfloat16_minnum)
 DO_ZPZZ_FP(sve_fminnum_h, uint16_t, H1_2, float16_minnum)
 DO_ZPZZ_FP(sve_fminnum_s, uint32_t, H1_4, float32_minnum)
 DO_ZPZZ_FP(sve_fminnum_d, uint64_t, H1_8, float64_minnum)
 
+DO_ZPZZ_FP(sve_fmaxnum_b16, uint16_t, H1_2, bfloat16_maxnum)
 DO_ZPZZ_FP(sve_fmaxnum_h, uint16_t, H1_2, float16_maxnum)
 DO_ZPZZ_FP(sve_fmaxnum_s, uint32_t, H1_4, float32_maxnum)
 DO_ZPZZ_FP(sve_fmaxnum_d, uint64_t, H1_8, float64_maxnum)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index f00cccf1548..2739c226d73 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -407,6 +407,10 @@ static bool gen_gvec_fpst_zzzp(DisasContext *s, gen_helper_gvec_4_ptr *fn,
 static bool gen_gvec_fpst_arg_zpzz(DisasContext *s, gen_helper_gvec_4_ptr *fn,
                                    arg_rprr_esz *a)
 {
+    /* These insns use MO_8 to encode BFloat16. */
+    if (a->esz == MO_8 && !dc_isar_feature(aa64_sve_b16b16, s)) {
+        return false;
+    }
     return gen_gvec_fpst_zzzp(s, fn, a->rd, a->rn, a->rm, a->pg, 0,
                               a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
 }
@@ -4206,13 +4210,21 @@ TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
                s->fpcr_ah ? name##_ah_zpzz_fns[a->esz] :                \
                name##_zpzz_fns[a->esz], a)
 
-DO_ZPZZ_FP(FADD_zpzz, aa64_sve, sve_fadd)
-DO_ZPZZ_FP(FSUB_zpzz, aa64_sve, sve_fsub)
-DO_ZPZZ_FP(FMUL_zpzz, aa64_sve, sve_fmul)
+/* Similar, but for insns where sz == 0 encodes bfloat16 */
+#define DO_ZPZZ_FP_B16(NAME, FEAT, name) \
+    static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = { \
+        gen_helper_##name##_b16, gen_helper_##name##_h,         \
+        gen_helper_##name##_s, gen_helper_##name##_d            \
+    };                                                          \
+    TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz, name##_zpzz_fns[a->esz], a)
+
+DO_ZPZZ_FP_B16(FADD_zpzz, aa64_sve, sve_fadd)
+DO_ZPZZ_FP_B16(FSUB_zpzz, aa64_sve, sve_fsub)
+DO_ZPZZ_FP_B16(FMUL_zpzz, aa64_sve, sve_fmul)
 DO_ZPZZ_AH_FP(FMIN_zpzz, aa64_sve, sve_fmin, sve_ah_fmin)
 DO_ZPZZ_AH_FP(FMAX_zpzz, aa64_sve, sve_fmax, sve_ah_fmax)
-DO_ZPZZ_FP(FMINNM_zpzz, aa64_sve, sve_fminnum)
-DO_ZPZZ_FP(FMAXNM_zpzz, aa64_sve, sve_fmaxnum)
+DO_ZPZZ_FP_B16(FMINNM_zpzz, aa64_sve, sve_fminnum)
+DO_ZPZZ_FP_B16(FMAXNM_zpzz, aa64_sve, sve_fmaxnum)
 DO_ZPZZ_AH_FP(FABD, aa64_sve, sve_fabd, sve_ah_fabd)
 DO_ZPZZ_FP(FSCALE, aa64_sve, sve_fscalbn)
 DO_ZPZZ_FP(FDIV, aa64_sve, sve_fdiv)
-- 
2.43.0



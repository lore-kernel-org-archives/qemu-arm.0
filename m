Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD58EC83F17
	for <qemu-arm@archiver.kernel.org>; Fri, 18 Jul 2025 17:42:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ucp6E-0006cb-R8; Fri, 18 Jul 2025 13:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucouw-0004zf-Nc
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ucout-0000qC-UJ
 for qemu-arm@nongnu.org; Fri, 18 Jul 2025 13:30:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3b611665b96so1302404f8f.2
 for <qemu-arm@nongnu.org>; Fri, 18 Jul 2025 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752859838; x=1753464638; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxiUs6iZVyfgl9d86a275Qgs9iTqajSpXpijYt48TxM=;
 b=JdhrYLPWMCCaXSqO/8pzHdkXBf75+pfspdE2YI29QjK+sZP3A6r8UFLOD3gyQ2MP+7
 BY08OKNEKtnaagA8M+qenMbz28MBDmTvuj5x8iM094Zxx3lzwCXJMeUtUykudNG02vbL
 o17oYq9ucFaUMkYfI94pyeJiaEwjAn30yEqAlVZKNCoZGxr8zN0s0Jnx/ZsVOt8TLkjz
 5xq5wmYkApV1c778kd9+2E0/1vqTToPslnjql8olW3f9vMfrNb+KrcIKxyhHOV7M9/a4
 5FBMLcPhJ3q22oyaN2u6nwZEKJDKBx9C0dUNzUNkrD1sn3ad7qzSSi40UAT5pHeLB3ir
 Qx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752859838; x=1753464638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxiUs6iZVyfgl9d86a275Qgs9iTqajSpXpijYt48TxM=;
 b=mriY5suw6Vs2EhPZ3pznlfgmyWX6GnzkN8OS+w2rg17H5EpxW72QCoRSMorjO8Tc+s
 s9bndS+0oOdQ3x+MYbe4ZGiFEbX/xNYNN0bIofDm82LdkpNleDy86gVTZ4d28ziaKB60
 4A5tmshuFWm9MGyn0pHlGZHdxTJy/ROT7SsqwGtDgQW5XwXUvEmK9kFtTCy69PtPKGP+
 KjmvPX5BeT27QqyoI+tizSuryXkmFAe4QAXStE/cM6PmjMpx2ZwrtQGRI1aPZlUK7YxA
 iB+BaYAbN8d+Lmk98j7JwWnTX/bD1QaZBa2Q+aWdYgH0vSiFb/tC6mvPNS1/BBujzvvM
 OzWw==
X-Gm-Message-State: AOJu0YxzJHua3nQIlVd1nc+Pe5KD29Srgm8+gDN7czNTIsOU32Gy+rk7
 Owf9n+tFTkp6tExRO+rROLsKCJ88oOe6hvchrabI1bq0mzpBN4FagU1KMXl/juukMU7hMP2pjrk
 wXJ9s
X-Gm-Gg: ASbGncuHpmCGNXNtEsIqgrW+DDcBoy3NC+zQF34+ldtTVeB9OYiZYAZOZ8bXWtyenYy
 3M/trVR9rORG/pWKI5Ca6yIEEP+X0B+yyw1tDHz8TZFCUTmFVuHmYunRbONMd/LPoLDOCdnYKF1
 Mpo9/oA2ZvptkX/yCzNDyMwKAjsRi70O/08DkJ5gdL/UW/Lk3mKliaoyCBpBegrBi4d3VPCljWh
 AP37U7ZMPAYcftu3TotyiRDMSzVTHhP4jYVIBYpOKwLrRsGKkK3JNutvaqLp2WBeifi7OVhCmRi
 GWCcJ2oZmgVPgvogWh2JpWg2J8hoFHT24QwXJRyEegBTSZxcdDvDu1pQslIItTzM7XGH4xhc1Re
 9ZZFhvTu+onNdngiUSOpJIqd49EI/
X-Google-Smtp-Source: AGHT+IEVaVlpvMpYmZ0FgokhwR+ZbGw4V/qYatVFSl4IyceDSxLcN6LrsCpVaFODf4LjX/oCzUVo6w==
X-Received: by 2002:a05:6000:40ce:b0:3a5:27ba:47a8 with SMTP id
 ffacd0b85a97d-3b60e52355cmr8174611f8f.52.1752859838163; 
 Fri, 18 Jul 2025 10:30:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b61ca25443sm2454655f8f.9.2025.07.18.10.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 10:30:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH for-10.1 03/10] target/arm: Add BFMIN, BFMAX (predicated)
Date: Fri, 18 Jul 2025 18:30:25 +0100
Message-ID: <20250718173032.2498900-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718173032.2498900-1-peter.maydell@linaro.org>
References: <20250718173032.2498900-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
(predicated) instructions, which are encoded via sz=0b00.  Add the
BFMAX and BFMIN insns.  These have separate behaviour for AH=1 and
AH=0; we have already implemented the AH=1 helper for the SME2
versions of these insns.

Fixes: 7b1613a1020d2942 ("target/arm: Enable FEAT_SME2p1 on -cpu max")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-sve.h    |  8 ++++++++
 target/arm/tcg/sve_helper.c    |  4 ++++
 target/arm/tcg/translate-sve.c | 17 +++++++++++++++--
 3 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index d612bcaded3..cb6c2355e58 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -1230,6 +1230,8 @@ DEF_HELPER_FLAGS_6(sve_fdiv_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fdiv_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_fmin_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fmin_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fmin_s, TCG_CALL_NO_RWG,
@@ -1237,6 +1239,8 @@ DEF_HELPER_FLAGS_6(sve_fmin_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fmin_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_fmax_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fmax_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_fmax_s, TCG_CALL_NO_RWG,
@@ -1244,6 +1248,8 @@ DEF_HELPER_FLAGS_6(sve_fmax_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fmax_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_ah_fmin_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_ah_fmin_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_ah_fmin_s, TCG_CALL_NO_RWG,
@@ -1251,6 +1257,8 @@ DEF_HELPER_FLAGS_6(sve_ah_fmin_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_ah_fmin_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve_ah_fmax_b16, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_ah_fmax_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_6(sve_ah_fmax_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index a229503bc21..1a56fa86d9c 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4648,18 +4648,22 @@ DO_ZPZZ_FP(sve_fdiv_h, uint16_t, H1_2, float16_div)
 DO_ZPZZ_FP(sve_fdiv_s, uint32_t, H1_4, float32_div)
 DO_ZPZZ_FP(sve_fdiv_d, uint64_t, H1_8, float64_div)
 
+DO_ZPZZ_FP(sve_fmin_b16, uint16_t, H1_2, bfloat16_min)
 DO_ZPZZ_FP(sve_fmin_h, uint16_t, H1_2, float16_min)
 DO_ZPZZ_FP(sve_fmin_s, uint32_t, H1_4, float32_min)
 DO_ZPZZ_FP(sve_fmin_d, uint64_t, H1_8, float64_min)
 
+DO_ZPZZ_FP(sve_fmax_b16, uint16_t, H1_2, bfloat16_max)
 DO_ZPZZ_FP(sve_fmax_h, uint16_t, H1_2, float16_max)
 DO_ZPZZ_FP(sve_fmax_s, uint32_t, H1_4, float32_max)
 DO_ZPZZ_FP(sve_fmax_d, uint64_t, H1_8, float64_max)
 
+DO_ZPZZ_FP(sve_ah_fmin_b16, uint16_t, H1_2, helper_sme2_ah_fmin_b16)
 DO_ZPZZ_FP(sve_ah_fmin_h, uint16_t, H1_2, helper_vfp_ah_minh)
 DO_ZPZZ_FP(sve_ah_fmin_s, uint32_t, H1_4, helper_vfp_ah_mins)
 DO_ZPZZ_FP(sve_ah_fmin_d, uint64_t, H1_8, helper_vfp_ah_mind)
 
+DO_ZPZZ_FP(sve_ah_fmax_b16, uint16_t, H1_2, helper_sme2_ah_fmax_b16)
 DO_ZPZZ_FP(sve_ah_fmax_h, uint16_t, H1_2, helper_vfp_ah_maxh)
 DO_ZPZZ_FP(sve_ah_fmax_s, uint32_t, H1_4, helper_vfp_ah_maxs)
 DO_ZPZZ_FP(sve_ah_fmax_d, uint64_t, H1_8, helper_vfp_ah_maxd)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 2739c226d73..27af3df9a4b 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4218,11 +4218,24 @@ TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
     };                                                          \
     TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz, name##_zpzz_fns[a->esz], a)
 
+#define DO_ZPZZ_AH_FP_B16(NAME, FEAT, name, ah_name)                    \
+    static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = {         \
+        gen_helper_##name##_b16, gen_helper_##name##_h,                 \
+        gen_helper_##name##_s, gen_helper_##name##_d                    \
+    };                                                                  \
+    static gen_helper_gvec_4_ptr * const name##_ah_zpzz_fns[4] = {      \
+        gen_helper_##ah_name##_b16, gen_helper_##ah_name##_h,           \
+        gen_helper_##ah_name##_s, gen_helper_##ah_name##_d              \
+    };                                                                  \
+    TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz,                      \
+               s->fpcr_ah ? name##_ah_zpzz_fns[a->esz] :                \
+               name##_zpzz_fns[a->esz], a)
+
 DO_ZPZZ_FP_B16(FADD_zpzz, aa64_sve, sve_fadd)
 DO_ZPZZ_FP_B16(FSUB_zpzz, aa64_sve, sve_fsub)
 DO_ZPZZ_FP_B16(FMUL_zpzz, aa64_sve, sve_fmul)
-DO_ZPZZ_AH_FP(FMIN_zpzz, aa64_sve, sve_fmin, sve_ah_fmin)
-DO_ZPZZ_AH_FP(FMAX_zpzz, aa64_sve, sve_fmax, sve_ah_fmax)
+DO_ZPZZ_AH_FP_B16(FMIN_zpzz, aa64_sve, sve_fmin, sve_ah_fmin)
+DO_ZPZZ_AH_FP_B16(FMAX_zpzz, aa64_sve, sve_fmax, sve_ah_fmax)
 DO_ZPZZ_FP_B16(FMINNM_zpzz, aa64_sve, sve_fminnum)
 DO_ZPZZ_FP_B16(FMAXNM_zpzz, aa64_sve, sve_fmaxnum)
 DO_ZPZZ_AH_FP(FABD, aa64_sve, sve_fabd, sve_ah_fabd)
-- 
2.43.0



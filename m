Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14732CD4F5E
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 12:30:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ2X9-00011I-Fp; Thu, 21 May 2026 08:29:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ2Wf-0000xs-E3
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:29:23 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ2Wd-0001cV-8a
 for qemu-arm@nongnu.org; Thu, 21 May 2026 08:29:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so70786765e9.2
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 05:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779366558; x=1779971358; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8ZF++qrDnuZBikX/tugNauIXQvtq2xExzyD11E2IKo=;
 b=q5AkWG4BEDQUFM2cogmJG8FduKuQn0sJjN/LLNnESzr2BLAix2d+t74a5ySest63gX
 CU65ulzWxY1jriAmCohlXP+SjcDRo32BZPDgyXxF/y8oJwPb6JB4U0ayr+mJuA3KxPCw
 KYFBtp6ovIwBvjWhEwTZcO/uWvOdH2Kjfv0qNGww3Uk0pvW3rALhYrW817nJYFv+DK/N
 Tm0W004vFj1/YQCKlBiXSCbvElRhyY76A1LGGXvu5TtKjJ1xXsi8O5Y7Pr8Ls5m3eQgY
 lGakIh3M9zTnTRWJNtngfgXTEjq5HiLE1x7rxZfLSeRXsc8dTdywjpZKTamHpb2J1OFF
 eqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779366558; x=1779971358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W8ZF++qrDnuZBikX/tugNauIXQvtq2xExzyD11E2IKo=;
 b=GbywN89IyqwHoQJMZibx7CYBN3mR6Ht4pq/hImDhfT04myzCS1bTqt4+T4xpYexSXO
 N2WoR5tD+9uag2yH8Gd7u9S9Oh8ygM1zS55VuYex/DCa9E/51Ssx0k/2Oc8lL/Npm8h1
 bZ04fWUQwE4NCKq9HADtePMZqyN4FXPnrLdh0knd+yduqc5j06kgI38cBeTqmSx2BbEc
 K3wmyq4Eboa4rzFxlHuJT4ewQo1EW1t8GH1qA4zpTyCQHaBcffPS8gat3Feb/DbgvWi+
 CMbQq8yuFlUmou/TFtIL/1szdxgZqdaUkrGlBjSZy17GJ1FjWmxrA5OtN3UiSBQMqVG+
 q6MQ==
X-Gm-Message-State: AOJu0YzLS+x5aRx82be2qzB1LlCkb3yM4jvbSkFtylYhT4eHhLXVmf6V
 NSkgxu9n1t9nCzPPDtRwv5xKRbRkCMv2WdVVdQp+a9ccjBojYfBygJ1Ui+K1wE0cCurOqC9Zdw1
 sf47E
X-Gm-Gg: Acq92OEOUR7cbOV4O7FaO4RqFnnW2GlItum/IXhJGczHM1ZAFkX4jEnkfsZOTgbBHfb
 J3vRlJ+oV1oEhGqN8t53RYDDqscjGw1BYBg9h+SX9ttYykrQADb93mEl/qT5PA6QRQaDoWBRIIC
 mhyi9Vyu7MTAzOeSuSvfF9+FDF6BGqbXxzqYKf//aHbSD4EG6kC9Co2rDwyC8fRTwyKEw/2RHfk
 bsZmnfAifmy/U0YDTD1sgvFTUgHpdJNEN6MO3wLSoGfkqDUe0ytkHaiCEF7ZpD0BFF2VNFZs4J/
 qJQb1NctfPwOTc6A1pxmyUKj4uykDPNjGf9oFT8KI+Pekpx2vkEKGBkHo1BmSAw8FSKVLG+pxAv
 LH0O1TcuauSiw1kC5mZwycbwSeG8gIWxGn2tSDH2//XTb6Q3vw2xP30C3wTBYKTQpzTwLEha1wG
 BdEbFhQHSIiFHeedchGiaew6JyJY4ONdPH+ftwZMRldTQ34W/t7vym/MWDfhIFhxrbGD7idN86G
 5iOjZelQVHGPdZQTkLhtwbQTLm2VKA=
X-Received: by 2002:a05:600c:4e92:b0:490:3b84:c106 with SMTP id
 5b1f17b1804b1-4903b84c8ffmr28205435e9.26.1779366557662; 
 Thu, 21 May 2026 05:29:17 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49035c72c78sm22054245e9.3.2026.05.21.05.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 05:29:17 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 1/3] target/arm: SVE2 FMAXP, FMINP must honour AH=1
Date: Thu, 21 May 2026 13:29:11 +0100
Message-ID: <20260521122913.1565011-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521122913.1565011-1-peter.maydell@linaro.org>
References: <20260521122913.1565011-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

The behaviour of floating-point maximum and minimum insns has
some odd special cases when FPCR.AH=1. We get this right in most
places (for instance, the ASIMD FMAXP, FMINP) but forgot about
it for the SVE2 versions of FMAXP and FMINP.

Cc: qemu-stable@nongnu.org
Fixes: 384433e70983 ("target/arm: Implement FPCR.AH semantics for FMINP and FMAXP")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-sve-defs.h | 14 ++++++++++++++
 target/arm/tcg/sve_helper.c      |  8 ++++++++
 target/arm/tcg/translate-sve.c   |  4 ++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/helper-sve-defs.h b/target/arm/tcg/helper-sve-defs.h
index c3541a8ca8..cd05dd0fb4 100644
--- a/target/arm/tcg/helper-sve-defs.h
+++ b/target/arm/tcg/helper-sve-defs.h
@@ -2914,6 +2914,20 @@ DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve2_fminp_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_6(sve2_ah_fmaxp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_ah_fmaxp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_ah_fmaxp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+
+DEF_HELPER_FLAGS_6(sve2_ah_fminp_zpzz_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_ah_fminp_zpzz_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_6(sve2_ah_fminp_zpzz_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_5(sve2_eor3, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bcax, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_bsl1n, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 062d8881bd..179cbd74fb 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -778,6 +778,14 @@ DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_h, float16, H1_2, float16_min)
 DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_s, float32, H1_4, float32_min)
 DO_ZPZZ_PAIR_FP(sve2_fminp_zpzz_d, float64, H1_8, float64_min)
 
+DO_ZPZZ_PAIR_FP(sve2_ah_fmaxp_zpzz_h, float16, H1_2, helper_vfp_ah_maxh)
+DO_ZPZZ_PAIR_FP(sve2_ah_fmaxp_zpzz_s, float32, H1_4, helper_vfp_ah_maxs)
+DO_ZPZZ_PAIR_FP(sve2_ah_fmaxp_zpzz_d, float64, H1_8, helper_vfp_ah_maxd)
+
+DO_ZPZZ_PAIR_FP(sve2_ah_fminp_zpzz_h, float16, H1_2, helper_vfp_ah_minh)
+DO_ZPZZ_PAIR_FP(sve2_ah_fminp_zpzz_s, float32, H1_4, helper_vfp_ah_mins)
+DO_ZPZZ_PAIR_FP(sve2_ah_fminp_zpzz_d, float64, H1_8, helper_vfp_ah_mind)
+
 #undef DO_ZPZZ_PAIR_FP
 
 /* Three-operand expander, controlled by a predicate, in which the
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index aa7d72a35e..bf9f0ae179 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7667,8 +7667,8 @@ TRANS_FEAT_NONSTREAMING(HISTSEG, aa64_sve2, gen_gvec_ool_arg_zzz,
 DO_ZPZZ_FP(FADDP, aa64_sme_or_sve2, sve2_faddp_zpzz)
 DO_ZPZZ_FP(FMAXNMP, aa64_sme_or_sve2, sve2_fmaxnmp_zpzz)
 DO_ZPZZ_FP(FMINNMP, aa64_sme_or_sve2, sve2_fminnmp_zpzz)
-DO_ZPZZ_FP(FMAXP, aa64_sme_or_sve2, sve2_fmaxp_zpzz)
-DO_ZPZZ_FP(FMINP, aa64_sme_or_sve2, sve2_fminp_zpzz)
+DO_ZPZZ_AH_FP(FMAXP, aa64_sme_or_sve2, sve2_fmaxp_zpzz, sve2_ah_fmaxp_zpzz)
+DO_ZPZZ_AH_FP(FMINP, aa64_sme_or_sve2, sve2_fminp_zpzz, sve2_ah_fminp_zpzz)
 
 static bool do_fmmla(DisasContext *s, arg_rrrr_esz *a,
                      gen_helper_gvec_4_ptr *fn)
-- 
2.43.0



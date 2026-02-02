Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3809E7316F
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 13:35:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmu4G-00076b-G0; Mon, 02 Feb 2026 08:34:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu4F-00075W-C5
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:15 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vmu4A-0002hM-2m
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 08:34:15 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso26570335e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 05:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770039249; x=1770644049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1D5gDxMSdzziaFg9/E0uX86KkUPhS7bg4mwduipKGMc=;
 b=N2e4EL+Y2T0tJQiOLENfu5DicTJAX2/vg8abiJhHtEyJqsMHxIaz1HiwddEvU6pUs5
 HWQ+C2s3v2TIbq59U4qrDCQtPowdA342heSaxITT4kAnHDWzd+UvBFMm/GboYwyPwn88
 0OheW6dDPEUR96/QbPd9REosyE491XbUcp0eBd++CkdgfuXh1G0zEHgP2N6yXv6UpOkD
 Pe+DSH91Qywmpq4qpKkobyCQKBVcnibeDY+dkdLbY098YTFVBP5dG3ZQRKUoAbk843JV
 REHB7ry49S9lzfXCyjVJjhGIan/i2qkr8IRjZNSibogWqXB3Sk0XWMxI6GHq8mBIzuik
 uaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770039249; x=1770644049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1D5gDxMSdzziaFg9/E0uX86KkUPhS7bg4mwduipKGMc=;
 b=qaCSYPcmsobg8sux8CH6j3hiMyS1JTpC8mwIuHT5xWg931ZpzbqINioVJS4oitzDGq
 diVN+kNH4CCuVqKkv6AuUvD/i9NYedVszr9YgiU6u8gbxG8D46e0RQZa8rHFSD5zAQV6
 RhtJx4h/CYjucvzgNMnSI9lrPAMgKVj6LWMi76lQd3Jq+T9jkn2/fc8lmRrziLyHWSRU
 B+HkXPeZPmoSVCKg4pqdErRJdXKl2PYiQQSZHsQpEKGQY9YwND52PIrHJL7PtFY891xY
 47FRfdPgQIHGBySM7MmGCZ/jQg2O4VX5qZx8fLmt+EPidz+T14MQlye5RA+jH1AiFvfG
 sSoA==
X-Gm-Message-State: AOJu0Yw1r6QedY2ex5CIaPzupyySQ4UcXUtGvb2y/wM0GwPYCc2v/mOA
 nW5kiyH7H8pmm2ZZsGeESEuiyUGy1LU1+Rx+OtRQBHRxxqEXCKwQfB0j6gOF3PQIYMVEE2Oim1w
 04MCW
X-Gm-Gg: AZuq6aL1o3RDI8GWk8LqVER93NLYo/x4HdC0IRxik+SfqWsZboKWwiefT/sRtyY2KsF
 P672N/erqRr/t+RoMKvNTjfb2xX1nyHPGYAtmUANxkHdVQwSR+XBbHBFJtTMY1wQ2XhjNcAjOmG
 GBDGFL1D7h2owbsgonDuiYLYSV0OHfaKdSLLomRW0IuDpkOI/dbMGlpqSE3wdIyIyPdR3gFKd84
 RJQyLelQyq/pwQbn7cegkVHO36pf2dUAyCEXD/hZjGRsjayzkq3pAfOm0wybjsHj/UiYVaGknWX
 CR9kSLVf9rNkctMBcw/ISb8CWT5y8E3DkLt0WUDSqrgA+H5SsfugTHDEJyYzMyGkBTK4tspdVY2
 DwQ1p4qzjs3LcCShbHMLSiIg/cuKD5cUcpvv7FxdTllfg0/vgQKQtuX1QjZTcQuNU/rEnuZUwne
 ksgKV9HdMoQQFf+wF8h4B7Sbr8J3lkBQ==
X-Received: by 2002:a05:600c:1f94:b0:480:3338:292d with SMTP id
 5b1f17b1804b1-482db492928mr161880355e9.31.1770039248579; 
 Mon, 02 Feb 2026 05:34:08 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c42895sm478054495e9.14.2026.02.02.05.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 05:34:07 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 11/15] target/arm/tcg: Correct SVE/SME I8MM checks
Date: Mon,  2 Feb 2026 13:33:49 +0000
Message-ID: <20260202133353.2231685-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260202133353.2231685-1-peter.maydell@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
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

The I8MM field of ID_AA64ZFR0_EL1 is set when the CPU implements
FEAT_I8MM and either FEAT_SVE or FEAT_SME. Currently we assume
that it is only set for FEAT_SVE. Update the feature checks:
 * we rename the existing feature check function to sve_sme_i8mm
   to indicate that it is true for either SVE or SME I8MM
 * we add a new check function for FEAT_SVE && FEAT_I8MM (giving
   it the sve_i8mm name that the old function used to have)
 * the instructions which are (SVE || SME) && I8MM need their
   checks updating to sve_sme_i8mm: these are SUDOT, USDOT
 * instructions which are SVE && I8MM (i.e. really SVE-only) stay
   unchanged with sve_i8mm: these are SMMLA, USMMLA, UMMLA

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h      | 8 +++++++-
 target/arm/tcg/translate-sve.c | 6 +++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 40393d88f0..8b8de5db04 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1449,7 +1449,8 @@ static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SM4) != 0;
 }
 
-static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
+/* Note that this is true if either SVE or SME are implemented with I8MM */
+static inline bool isar_feature_aa64_sme_sve_i8mm(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64ZFR0, I8MM) != 0;
 }
@@ -1542,6 +1543,11 @@ static inline bool isar_feature_aa64_sme2_f64f64(const ARMISARegisters *id)
     return isar_feature_aa64_sme2(id) && isar_feature_aa64_sme_f64f64(id);
 }
 
+static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_i8mm(id);
+}
+
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 44eda7b07d..53d35f6de9 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3758,9 +3758,9 @@ TRANS_FEAT(UDOT_zzxw_4s, aa64_sme_or_sve, gen_gvec_ool_arg_zzxz,
 TRANS_FEAT(UDOT_zzxw_4d, aa64_sme_or_sve, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_udot_idx_4h, a)
 
-TRANS_FEAT(SUDOT_zzxw_4s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
+TRANS_FEAT(SUDOT_zzxw_4s, aa64_sme_sve_i8mm, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_sudot_idx_4b, a)
-TRANS_FEAT(USDOT_zzxw_4s, aa64_sve_i8mm, gen_gvec_ool_arg_zzxz,
+TRANS_FEAT(USDOT_zzxw_4s, aa64_sme_sve_i8mm, gen_gvec_ool_arg_zzxz,
            gen_helper_gvec_usdot_idx_4b, a)
 
 TRANS_FEAT(SDOT_zzxw_2s, aa64_sme2_or_sve2p1, gen_gvec_ool_arg_zzxz,
@@ -7778,7 +7778,7 @@ static gen_helper_gvec_4 * const sqrdcmlah_fns[] = {
 TRANS_FEAT(SQRDCMLAH_zzzz, aa64_sme_or_sve2, gen_gvec_ool_zzzz,
            sqrdcmlah_fns[a->esz], a->rd, a->rn, a->rm, a->ra, a->rot)
 
-TRANS_FEAT(USDOT_zzzz_4s, aa64_sve_i8mm, gen_gvec_ool_arg_zzzz,
+TRANS_FEAT(USDOT_zzzz_4s, aa64_sme_sve_i8mm, gen_gvec_ool_arg_zzzz,
            gen_helper_gvec_usdot_4b, a, 0)
 
 TRANS_FEAT(SDOT_zzzz_2s, aa64_sme2_or_sve2p1, gen_gvec_ool_arg_zzzz,
-- 
2.43.0



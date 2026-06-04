Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05746CD6E6E
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Jun 2026 23:52:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wVHoC-0006jt-HG; Thu, 04 Jun 2026 19:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHoA-0006h7-83
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:06 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wVHo6-0007tQ-ON
 for qemu-arm@nongnu.org; Thu, 04 Jun 2026 19:49:05 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2bf2247e38eso13168335ad.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2026 16:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780616941; x=1781221741; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HVdxUuVXoVTJSAA6YhnuFT2CqG+OhK5lpSAh/HDbipo=;
 b=p4gDVhLYcX8jKTzd4fd+Aw6iarO3RdLgM2FSVIkXWNb2bJChVA0XXwYPm6Zc9yeaGN
 fY+v0AtHJarbDzgKE6MMC/tXRUNFvZcmp55Y7HUQQ8tdSfafSY6poAXY4t/pQKO6MtdN
 Cbp/A1SQjPado79/vRUAtb50s3552+SBSE8TjysrIB68dMBduBUyXNQ2Z6+zTbKXFFxX
 8y8RXVNHdqfJcqnR3+rSAMGPJgSWCQmaRZdx5xXasaLGehVZqsvD3RkTZFwMlUNyf/d4
 fRLka5K4w4paFy8UeukegAILzMo1nCFf1L0tNaHeeRV8l0c9xi0bvcRi6G4AI5x9OxC1
 FVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780616941; x=1781221741;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HVdxUuVXoVTJSAA6YhnuFT2CqG+OhK5lpSAh/HDbipo=;
 b=ogGRgg/PEdtWOXmGqcYZwetQ6IsKmz5ZUElLRwjLvpvro74iU9DzXYFv6NV2k8rgDE
 UsZqWCClVk7Bn1bwJ8WzcLSdW4wa9Svm95EuCGw6S9C2fgls48JR7Aq5gLjyI7om6Ij/
 JtenO3xS8PD6YZeKCfhgcIdfMpQ5NQRo1+AAHamYiVtIXJ1uFkLcxUJknNIl636/Y0+0
 RhPU2CgTK6FjOAOSeYLHFksr5FgYJo6aytajfP+kxbFVnWLTBxDxwavPdm1iWLm5iGox
 q8oYYxb8LURlBnzZTGJeehff8qwzSjvOvfmu0SO3JROqOkLjf+xhhqGBnM4nx1nbvfB6
 7uXQ==
X-Gm-Message-State: AOJu0YyjrqMglZuRdeuPkZMDTaJ2wV8i9Xt7FXUefYsqMGxFl5J7L5xF
 afy1qVqf5PH71Vcus4TCCu4M6F/WI9U6FdpdkcPpYKPRm286IKLn6kyiBJE3FhLWFvoYul+dy5V
 aptdPvGQ=
X-Gm-Gg: Acq92OGyHsn3ApSutHUkEYiQnuQvr+WC8v74hUCJOYP2fOL0Mv6Nzn4EnJcw0eE1ai6
 MXt61RYkh69jHtGzqnrZW3AMUW/DJ9vkdyx+hT2XZQ8SXS7nmIjbPyflOo9yrsgnkLnP4FpctWq
 Comvmv+/9osCNr+iBKZ38QurIJvLllK9HhVZHchyOagk6/b6FcK87jYWletoqBR+meYZDA7Pgil
 t9/FExHoe6QUJGAiLAAn7R5kgh4PppzTbN5h+J+NXsnrgQmRF/UK4suAl8sFVZdlYrPu337vZOI
 3pKeTZ6Vb/O8EfNMfYU8ZdJi5SueeQiUlA2JzjVvoAXl9yXrNVm30M2S6/tRFJtra2VW6/zozRp
 eB/IQo11gZh4xrfRheqwLSU3+Fl7KSjdfrmUUXx228jduZ4pVMHmiq4SgMLOJqlwmlJZsNR6XS6
 JvKa4L5OvNf0Ef9CbtDDBstqvYT2mFy1sGmVeq0b5+/8lLr4VCSg==
X-Received: by 2002:a17:903:1205:b0:2c0:b6c7:2271 with SMTP id
 d9443c01a7336-2c1e80e3bc0mr7674155ad.4.1780616941330; 
 Thu, 04 Jun 2026 16:49:01 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c1664950aesm66541465ad.69.2026.06.04.16.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 16:49:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/25] target/arm: Add data argument to do_frint_mode
Date: Thu,  4 Jun 2026 16:48:37 -0700
Message-ID: <20260604234852.573178-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604234852.573178-1-richard.henderson@linaro.org>
References: <20260604234852.573178-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Prepare for needing a non-zero value.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 083b70b487..e9c0a73e90 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4656,7 +4656,8 @@ TRANS_FEAT(FRINTX_m, aa64_sme_or_sve, gen_gvec_fpst_arg_zpz,
            a->esz == MO_16 ? FPST_A64_F16 : FPST_A64);
 
 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
-                          ARMFPRounding mode, gen_helper_gvec_3_ptr *fn)
+                          ARMFPRounding mode, int data,
+                          gen_helper_gvec_3_ptr *fn)
 {
     unsigned vsz;
     TCGv_i32 tmode;
@@ -4676,22 +4677,22 @@ static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
     tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
                        vec_full_reg_offset(s, a->rn),
                        pred_full_reg_offset(s, a->pg),
-                       status, vsz, vsz, 0, fn);
+                       status, vsz, vsz, data, fn);
 
     gen_restore_rmode(tmode, status);
     return true;
 }
 
 TRANS_FEAT(FRINTN_m, aa64_sme_or_sve, do_frint_mode, a,
-           FPROUNDING_TIEEVEN, frint_fns[a->esz])
+           FPROUNDING_TIEEVEN, 0, frint_fns[a->esz])
 TRANS_FEAT(FRINTP_m, aa64_sme_or_sve, do_frint_mode, a,
-           FPROUNDING_POSINF, frint_fns[a->esz])
+           FPROUNDING_POSINF, 0, frint_fns[a->esz])
 TRANS_FEAT(FRINTM_m, aa64_sme_or_sve, do_frint_mode, a,
-           FPROUNDING_NEGINF, frint_fns[a->esz])
+           FPROUNDING_NEGINF, 0, frint_fns[a->esz])
 TRANS_FEAT(FRINTZ_m, aa64_sme_or_sve, do_frint_mode, a,
-           FPROUNDING_ZERO, frint_fns[a->esz])
+           FPROUNDING_ZERO, 0, frint_fns[a->esz])
 TRANS_FEAT(FRINTA_m, aa64_sme_or_sve, do_frint_mode, a,
-           FPROUNDING_TIEAWAY, frint_fns[a->esz])
+           FPROUNDING_TIEAWAY, 0, frint_fns[a->esz])
 
 static gen_helper_gvec_3_ptr * const frecpx_fns[] = {
     NULL,                    gen_helper_sve_frecpx_h,
@@ -7998,9 +7999,9 @@ TRANS_FEAT(FCVTLT_sd_m, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpz,
            gen_helper_sve2_fcvtlt_sd, a, 0, FPST_A64)
 
 TRANS_FEAT(FCVTX_ds_m, aa64_sme_or_sve2, do_frint_mode, a,
-           FPROUNDING_ODD, gen_helper_sve_fcvt_ds)
+           FPROUNDING_ODD, 0, gen_helper_sve_fcvt_ds)
 TRANS_FEAT(FCVTXNT_ds_m, aa64_sme_or_sve2, do_frint_mode, a,
-           FPROUNDING_ODD, gen_helper_sve2_fcvtnt_ds)
+           FPROUNDING_ODD, 0, gen_helper_sve2_fcvtnt_ds)
 
 static gen_helper_gvec_3_ptr * const flogb_fns[] = {
     NULL,               gen_helper_flogb_h,
-- 
2.43.0



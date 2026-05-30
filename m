Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC876CD6E4C
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:15:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrL-0000Af-VB; Sat, 30 May 2026 19:12:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrK-00009R-RM
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:50 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrJ-0007WV-8c
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:50 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-c8584e80d59so345941a12.2
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182768; x=1780787568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XPwmmJFUjef+Kqfhm4rFoijt4nOcoSJTA+5hXdlp2cI=;
 b=fL6XRbQYdO02mVigChyYnbKTNt027W9YaYE26SK+gFIFUwM12C5+1llevInnrZxUT0
 GO5fVs437igSrwq2P9pvZZtUhPmCGnpsQol7iLwon5/F8KdJ+1LIc1oyjjE32PWOfBrV
 LSUHFgyqq1tQd4Yq2mpQNUfmaZUfeRIAFzExUyXnuoS3T3t1q475hbanrv5GFcrn0trR
 D+kZjCVL5x0v2vI11QykID4aW+7TBT9p5ZLXX8cRnGQkoJcMANQW7cATLtvimORktoy1
 jH8A6W6vuVtI+S05u726VF6Tcy7utYjbPITgECLj16oofbqpXDDVqdl5nMBigwVwI6OZ
 xrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182768; x=1780787568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XPwmmJFUjef+Kqfhm4rFoijt4nOcoSJTA+5hXdlp2cI=;
 b=H7R4rYD75PYyhU9MwR8ztVyUFmGGwZPWhNSyKsrGG/XjlOtC/pDYkuDM+uQEd8rEN+
 FaABLE3TSo9EDJrSrXu1KX4UG8fZ1Q9XIKFZTabsTK1J9DgP9dqALPzXxJ5mFHBu+Aol
 R6pFfBSAgXAsBLh2teNljHMM3ehhlmEntfYh5HEdWgQdEtsNOqZQH1zWekYrjqHuvvM9
 D/WPVFz5a33io2QhblEJHNYfsgZ9YzdE4rCLFj1uKwVdknUYKfOzOK1lbaxCtbbz1oTN
 idnsHoOuUuWQxQ6Vxn9KCtHSBIAaNyDC7h0Cxg67h0QiVJHg9fWjR9kga+2bTSpSSM/l
 aBPg==
X-Gm-Message-State: AOJu0YxsbNuF3zoeRwrBSlPa7TAR1l7bIrL25MzaLPzjcqLSwMo0e7lK
 rqYRkQYyZ8Du7vPtXAglcZ0cXJ4zXyKhuKBe9KbTVNWQ+GZoqV5zCzpXhNM38DbkzXZTdVQJNzN
 TizXPUEQ=
X-Gm-Gg: Acq92OHjMwVf3R6/a1bzmHtAvmGpc3UWvR0q8RN/buH66DwIvUDdm04FL8CXSYKAZQ0
 DQ4DMPAQAnHFmgAg6TTaRSkcwBkrdgXoIHzqie+Hvo9sev1lKfkn4Z/359UEA8/juAaCtbROtJI
 Hhtgye9JDE3l59mQ3OJZFHkmUHDEgpKHjb7yCjj+b3Zcw0cQkdnSqhwC96oi5sqthbpOGsUflJD
 z615bnU8pTD1WLv/1QgWHLB/qQwEkwmg6p461pa9HwkiuKLEbTqDeBYm8JI4LMoAshHD6//fjvi
 dSSshbB5dWt58rYLrUaC0JiiVi/sjHlzAp2Hfb4jsV/F6kIPU8Led+wDGdeDxsb9BG9/3Su1Mhq
 vmo9aAxJT2fEkc55TZUb+wjlcJUwpsD8Lopv0ZOchE7utNT9v3HXldC9XAenC4BMbyJdCi/UHEf
 IjVwlsv/bF3tOjo5ZW08ela1V4y43Hl6rwbFkLBn8=
X-Received: by 2002:a05:6a21:3a83:b0:3a2:d838:bfca with SMTP id
 adf61e73a8af0-3b427be8509mr5460367637.3.1780182767605; 
 Sat, 30 May 2026 16:12:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 15/41] target/arm: Implement FCVT (FP16 to FP8) for SME
Date: Sat, 30 May 2026 16:12:03 -0700
Message-ID: <20260530231229.400441-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
 target/arm/tcg/translate-sme.c | 16 ++++++++++++++++
 target/arm/tcg/sme.decode      |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index c0fe77242b..49eee95d88 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1556,6 +1556,22 @@ TRANS_FEAT(BF2CVT, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvt_hb, 1)
 TRANS_FEAT(BF1CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 0)
 TRANS_FEAT(BF2CVTL, aa64_sme2_f8cvt, do_f8cvt, a, gen_helper_sme2_bfcvtl_hb, 1)
 
+static bool trans_FCVT_bh(DisasContext *s, arg_zz_n *a)
+{
+    if (!dc_isar_feature(aa64_sme2_f8cvt, s)) {
+        return false;
+    }
+    if (fpmr_access_check(s) && sme_sm_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->zd),
+                           vec_full_reg_offset(s, a->zn),
+                           vec_full_reg_offset(s, a->zn + 1),
+                           tcg_env, svl, svl,
+                           FPST_ZA << 2, gen_helper_gvec_fcvt_bh);
+    }
+    return true;
+}
+
 static bool do_zipuzp_4(DisasContext *s, arg_zz_e *a,
                         gen_helper_gvec_2 * const fn[5])
 {
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index d6192eb59d..a02bcc0e22 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -863,6 +863,8 @@ BF2CVT          11000001 111 00110 111000 ..... ....0       @zz_2x1
 BF1CVTL         11000001 011 00110 111000 ..... ....1       @zz_2x1
 BF2CVTL         11000001 111 00110 111000 ..... ....1       @zz_2x1
 
+FCVT_bh         11000001 001 00100 111000 ....0 .....       @zz_1x2
+
 ZIP_4           11000001 esz:2 1 10110 111000 ...00 ... 00   \
                 &zz_e zd=%zd_ax4 zn=%zn_ax4
 ZIP_4           11000001 001     10111 111000 ...00 ... 00   \
-- 
2.43.0



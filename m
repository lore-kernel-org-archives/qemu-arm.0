Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97FFC4452D
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Jul 2026 18:50:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmFX2-0002iN-4x; Tue, 21 Jul 2026 14:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUn-00011o-Tg
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:15 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wmFUl-0006d9-Io
 for qemu-arm@nongnu.org; Tue, 21 Jul 2026 14:47:13 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-382ef647e20so11214503a91.1
 for <qemu-arm@nongnu.org>; Tue, 21 Jul 2026 11:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784659630; x=1785264430; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ztxjnkKW+Do3FxcGy10ntSz6MbMGjbPM1y8JkY9WyA8=;
 b=RUJr7aIjvYq6iyFjfETTss/doWjnsWxXR6/FFFL43kL3LIjIwJTVx8d/8/G+z20kaH
 W2ccb0CRE8zZ/LEnM0CZ9auUEW7J6iK+j2Sq5MZ0G7BFgkaXHhaXhxM7CofkAL9LUS2G
 cSq0M0EeaSzNQ+RO80KMkQhKLzhPfhOGoyFtePziF7Q7aumx5ir0o/TQPHkybzoTdzD4
 fSmght4w6f8SYUTQT9kS1FF5TtJQLPapXm5GmQDAmaf0ycf6WmH41kEADv3wCJPs1xmc
 M5RaBmmGF+an+7/lGddtCcdEHOK2Q0Lxfb/F68SO2fG2gxa7r1D8+QBETjOS8f/VBzXH
 SJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784659630; x=1785264430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ztxjnkKW+Do3FxcGy10ntSz6MbMGjbPM1y8JkY9WyA8=;
 b=ZdIUwRnYdbOw0YAwNMe8g5ADZwMS+eP6hpNBFV6wJV3gMPCS7+/r6OxnAWW5+IbKWx
 4ZBnrxgCVOCxdPThwqUMCI0InP4V1CWzfiO3tcT839DwcL8bJbas063IQOeVV7i5S6Lp
 7eZqr8haBIc+k1vV/dfCWRqk0z/+kwSrxm6K9+smcGKUkrOOInboVj1sNetZihe1cj/u
 ZaRV+0r01LSOAwLjU2/e+eXwxRx0FGWCx9HndaypcxLVBs7HEIfmwJptzjb4OBUsX2vZ
 T0I+n368G/DRlee5q3NANefEpexJ5LZm+vjIDO/RYl2FlAiJrDevmneRjWqDdXCF79Lv
 RuHA==
X-Gm-Message-State: AOJu0YzLW4g0nnsSvNJ6dpk13CKm6L+BDwTf7wpuBZqx0a+wZ3JxJICd
 mVVAMH5+RwlAllHnGy3TM0+qJ0zzH8Yg+c93d2E7ZSDm3iRiMJ7hs4GgaGqLWw/DELGVX9uJXFF
 FvHyI
X-Gm-Gg: AR+sD10WwN513vtJMoqN3+uDwKe5WPlmucB5RlUfmFp5gYhcirP1b6f6W8Gxb71jm0i
 ULnvNs7eKrL5DiY+qN5n6cqkXMmvlU0McLX5hpKLaH5bn6FUHIa1uAjkVpB78i13C29SUoJ5AQU
 As16Rxen+ZG88qvPOwz5StPvRFRzY08EuNQOzNXMgzMpPRsNnHpt1PxzefpVVtKBjke7lfUcJcg
 cZargrKpHMoIukopCGPZ8TX0ixmPryBUsvu2fo7Qnu7t9j+NNR9HFObqeNML+PNH6Qc3K3OZ/bu
 pDlr45XYdUC4lB+jHfGBRGYb8vDPXNBH7TsauVtsPc/Vub0/0VejNoqbXOxgw6tCk8lU1bk0ADr
 RMlCXiFSRWhE6S2pO+MpmaQSOlDtgyo4adLKr9Muw46A9i3x3Sni8ABr5TXIXSr8Ac36mstwz7b
 O4OMazwsU=
X-Received: by 2002:a17:90b:38ca:b0:387:e0db:3d8f with SMTP id
 98e67ed59e1d1-38e4b5b4fadmr18611061a91.42.1784659629816; 
 Tue, 21 Jul 2026 11:47:09 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce29e340esm41108094c88.5.2026.07.21.11.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2026 11:47:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 08/20] target/arm: Implement SME BFMUL
Date: Tue, 21 Jul 2026 11:46:44 -0700
Message-ID: <20260721184656.530230-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721184656.530230-1-richard.henderson@linaro.org>
References: <20260721184656.530230-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
 target/arm/tcg/translate-sme.c |  4 ++++
 target/arm/tcg/sme.decode      | 24 ++++++++++++++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index d28574a8cf..08b25b0be9 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -903,6 +903,10 @@ static gen_helper_gvec_3_ptr * const f_vector_fmul[4] = {
 };
 TRANS_FEAT(FMUL_n1, aa64_sme2p2, do_zzz_n1_fpst, a, f_vector_fmul[a->esz])
 TRANS_FEAT(FMUL_nn, aa64_sme2p2, do_zzz_nn_fpst, a, f_vector_fmul[a->esz])
+TRANS_FEAT(BFMUL_n1, aa64_sme2_sve_bfscale, do_zzz_n1_fpst, a,
+           gen_helper_gvec_fmul_b16)
+TRANS_FEAT(BFMUL_nn, aa64_sme2_sve_bfscale, do_zzz_nn_fpst, a,
+           gen_helper_gvec_fmul_b16)
 
 /* Add/Sub vector Z[m] to each Z[n*N] with result in ZA[d*N]. */
 static bool do_azz_n1(DisasContext *s, arg_azz_n *a, int esz,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 4e19c42b19..3e4cb7e582 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -296,10 +296,18 @@ SQDMULH_n1     1100000 1 .. 10 .... 1010.1 00000 .... 0    @z2z_4x1
   FSCALE_n1    1100000 1 .. 10 .... 1010.0 01100 .... 0    @z2z_4x1
 }
 
-FMUL_n1        1100000 1 esz:2 1 zm:4 0 111010 ....0 ....0 \
+{
+  BFMUL_n1     1100000 1 00    1 zm:4 0 111010 ....0 ....0 \
+               &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2 esz=0
+  FMUL_n1      1100000 1 esz:2 1 zm:4 0 111010 ....0 ....0 \
                &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2
-FMUL_n1        1100000 1 esz:2 1 zm:4 1 111010 ...00 ...00 \
+}
+{
+  BFMUL_n1     1100000 1 00    1 zm:4 1 111010 ...00 ...00 \
+               &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4 esz=0
+  FMUL_n1      1100000 1 esz:2 1 zm:4 1 111010 ...00 ...00 \
                &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4
+}
 
 ### SME2 Multi-vector Multiple Vectors SVE Destructive
 
@@ -380,10 +388,18 @@ FAMIN_nn       1100000 1 .. 1 ..... 1011.0 01010 .... 1    @z2z_4x4
   FSCALE_nn    1100000 1 .. 1 ..... 1011.0 01100 .... 0    @z2z_4x4
 }
 
-FMUL_nn        1100000 1 esz:2 1 ....0 111001 ....0 ....0  \
+{
+  BFMUL_nn     1100000 1 00    1 ....0 111001 ....0 ....0  \
+               &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2 zm=%zm_ax2 esz=0
+  FMUL_nn      1100000 1 esz:2 1 ....0 111001 ....0 ....0  \
                &zzz_en n=2 zd=%zd_ax2 zn=%zn_ax2 zm=%zm_ax2
-FMUL_nn        1100000 1 esz:2 1 ...01 111001 ...00 ...00  \
+}
+{
+  BFMUL_nn     1100000 1 00    1 ...01 111001 ...00 ...00  \
+               &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4 zm=%zm_ax4 esz=0
+  FMUL_nn      1100000 1 esz:2 1 ...01 111001 ...00 ...00  \
                &zzz_en n=4 zd=%zd_ax4 zn=%zn_ax4 zm=%zm_ax4
+}
 
 ### SME2 Multi-vector Multiple and Single Array Vectors
 
-- 
2.43.0



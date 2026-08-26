Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3349C5DF97
	for <qemu-arm@archiver.kernel.org>; Wed, 26 Aug 2026 17:43:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzHdv-000055-Ay; Wed, 26 Aug 2026 13:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHds-0008Uu-VL
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:29 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wzHdr-0004mU-2P
 for qemu-arm@nongnu.org; Wed, 26 Aug 2026 13:42:28 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-84f3ab8750cso972995b3a.0
 for <qemu-arm@nongnu.org>; Wed, 26 Aug 2026 10:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787766146; x=1788370946; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qe4rdKZlqsUlBu504HN1M1M/BmaKRqAbXrUNJ3++caU=;
 b=RSgN6PG/aNXfdnoJWwRLN1jYl0MBm0Sv29dD3cmM0kUh0lwgfd5lKOnD1m/dUQjqeN
 tXTTxEOCJ+Xzdh7f+OcBxlXxiZCHxoQbdIRMSypbU4YYBuik5T3ABc2of8D/OK3mFCqs
 PbYgTy1c8pPUDYHzFCEPev8yAJuthCmZbpfxMdVgmyPLTzs/7FVx3nfPhduv7lyXWEnt
 61tFFbRW9J/TlLRgp36QlRi76g1vM17hHEMYF4osY5u8mRM1Rjk10GguvN6t5rzzkKf2
 ZBVbnQuriLEq+KeL1iBzroYybdLUxpQmt1DTfJ6OtRyS1dfmb08ghCQPfvSfwSqBs0M7
 vniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787766146; x=1788370946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qe4rdKZlqsUlBu504HN1M1M/BmaKRqAbXrUNJ3++caU=;
 b=fvN1ebDJ63bWD+VIr53EZS1qboc1Y909f/1zlLyWk1hl5plx8tRyVTldjuZiTyoiHI
 3YuFzia40Z9SPGjPHCn9aC6sImj6095XViPVpeOssrLh9Y66baF6nh1wt6pjrLlwSFBk
 it4OV95dlTIQaD9tO/EB04uX1pQP6EBVVzhhdvZTj+wb+6sdqoGx5AegaJdTzmCIh3/h
 Jd7jA0j8TZy+1I2hurd4LPfhopHQQqpGh71O4tGKFBGJnVnj/pWzvudkK9/04EAH1AIB
 2CaAaqKJ7JmE5nGwHeWSLGiofRDOjvlVsbBfUdhTeGspTlpy5THc4yB8ufgFC+5Arw91
 kqtQ==
X-Gm-Message-State: AFuF++nrg01TDsgkrayO3AAro3llfR8hmo/IYZLC6PLVaFJQRVZThgEA
 QNYYHlbZDuEoHQqh9XMyTtQeHYL9V5eG+AQV0FjrooIoojMxz1yzwM2ZY0JUZIxuLzyiVeAS3up
 E3zc2aD0=
X-Gm-Gg: AR+sD11QZQEGOUnjNsCyIb7uh8x7ext8ym4HT/HekLGudRteWyVyYwf4KO/kFSrgBw3
 UlbfXmqbxoZcNMtYTAGNildoqB4YOkHqo7ObasGSCEkeZCxO6IWw14jd4+kQevZ1e4D2i/jxpHi
 M0YiK0yVjdEOFmf5Z9Xa33PZtLmAKMIBlbuUG6kYkL9z8NPhRgAfKnvqXivqdkKRBlsyGrUqs8v
 uTd6PjmJUtdyXpiRtvFlHi2QB5zHOlZAF7Gb0Dc7PwuLOapC4VUO2cnv4FX805bUuOZTYgPei2L
 iRVHTLk0TDN4mRHKkd9npvBFswNkrzMAnZIUXyjmNZtLvz5DBSHaJdJ106GidIuy3gZoRSjVq8h
 fEI/DCafK06fs5yvUsdhiEc5npWlHTQj03IvItGpBiXBdt2qSjC1TPwRXfbuei3G42n0RCtVe+9
 FUAunlVXXpf33TSze4it06I5sXv6eZGfYMx4DBXFtTKmQdTFS3JAUcoF+b5S0xD/FUsI+Xj9zPM
 +7poiYV2uIhcczpmw==
X-Received: by 2002:a05:6a21:3216:b0:3c0:b943:f984 with SMTP id
 adf61e73a8af0-3cf76286193mr17929008637.3.1787766145378; 
 Wed, 26 Aug 2026 10:42:25 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1bec66020sm1260072a12.21.2026.08.26.10.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 10:42:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 08/25] target/arm: Remove DO_ZPZZ_AH_FP from translate-sme.c
Date: Wed, 26 Aug 2026 10:41:55 -0700
Message-ID: <20260826174213.614571-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826174213.614571-1-richard.henderson@linaro.org>
References: <20260826174213.614571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

Expand the macro at each use site.
Merge the two arrays and index by fpcr_ah.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 41 +++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 347eeb4602e..6e984d02f82 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4425,19 +4425,6 @@ TRANS_FEAT_NONSTREAMING(FTSMUL, aa64_sve, gen_gvec_fpst_arg_zzz,
  *** SVE Floating Point Arithmetic - Predicated Group
  */
 
-#define DO_ZPZZ_AH_FP(NAME, FEAT, name, ah_name)                        \
-    static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = {         \
-        NULL,                  gen_helper_##name##_h,                   \
-        gen_helper_##name##_s, gen_helper_##name##_d                    \
-    };                                                                  \
-    static gen_helper_gvec_4_ptr * const name##_ah_zpzz_fns[4] = {      \
-        NULL,                  gen_helper_##ah_name##_h,                \
-        gen_helper_##ah_name##_s, gen_helper_##ah_name##_d              \
-    };                                                                  \
-    TRANS_FEAT(NAME, FEAT, gen_gvec_fpst_arg_zpzz,                      \
-               s->fpcr_ah ? name##_ah_zpzz_fns[a->esz] :                \
-               name##_zpzz_fns[a->esz], a)
-
 #define DO_ZPZZ_AH_FP_B16(NAME, FEAT, name, ah_name)                    \
     static gen_helper_gvec_4_ptr * const name##_zpzz_fns[4] = {         \
         gen_helper_##name##_b16, gen_helper_##name##_h,                 \
@@ -4499,7 +4486,14 @@ static gen_helper_gvec_4_ptr * const sve_fminnum_fns[4] = {
 TRANS_FEAT(FMINNM_zpzz, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
            sve_fminnum_fns[a->esz], a)
 
-DO_ZPZZ_AH_FP(FABD, aa64_sme_or_sve, sve_fabd, sve_ah_fabd)
+static gen_helper_gvec_4_ptr * const sve_fabd_zpzz_fns[4][2] = {
+    { NULL, NULL },
+    { gen_helper_sve_fabd_h, gen_helper_sve_ah_fabd_h },
+    { gen_helper_sve_fabd_s, gen_helper_sve_ah_fabd_s },
+    { gen_helper_sve_fabd_d, gen_helper_sve_ah_fabd_d },
+};
+TRANS_FEAT(FABD, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
+           sve_fabd_zpzz_fns[a->esz][s->fpcr_ah], a)
 
 static gen_helper_gvec_4_ptr * const sve_fscalbn_zpzz_fns[4] = {
     NULL,
@@ -8144,8 +8138,23 @@ static gen_helper_gvec_4_ptr * const sve_fminnmp_zpzz_fns[4] = {
 TRANS_FEAT(FMINNMP, aa64_sme_or_sve2, gen_gvec_fpst_arg_zpzz,
            sve_fminnmp_zpzz_fns[a->esz], a)
 
-DO_ZPZZ_AH_FP(FMAXP, aa64_sme_or_sve2, sve2_fmaxp_zpzz, sve2_ah_fmaxp_zpzz)
-DO_ZPZZ_AH_FP(FMINP, aa64_sme_or_sve2, sve2_fminp_zpzz, sve2_ah_fminp_zpzz)
+static gen_helper_gvec_4_ptr * const sve_fmaxp_zpzz_fns[4][2] = {
+    { NULL, NULL },
+    { gen_helper_sve2_fmaxp_zpzz_h, gen_helper_sve2_ah_fmaxp_zpzz_h },
+    { gen_helper_sve2_fmaxp_zpzz_s, gen_helper_sve2_ah_fmaxp_zpzz_s },
+    { gen_helper_sve2_fmaxp_zpzz_d, gen_helper_sve2_ah_fmaxp_zpzz_d },
+};
+TRANS_FEAT(FMAXP, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
+           sve_fmaxp_zpzz_fns[a->esz][s->fpcr_ah], a)
+
+static gen_helper_gvec_4_ptr * const sve_fminp_zpzz_fns[4][2] = {
+    { NULL, NULL },
+    { gen_helper_sve2_fminp_zpzz_h, gen_helper_sve2_ah_fminp_zpzz_h },
+    { gen_helper_sve2_fminp_zpzz_s, gen_helper_sve2_ah_fminp_zpzz_s },
+    { gen_helper_sve2_fminp_zpzz_d, gen_helper_sve2_ah_fminp_zpzz_d },
+};
+TRANS_FEAT(FMINP, aa64_sme_or_sve, gen_gvec_fpst_arg_zpzz,
+           sve_fminp_zpzz_fns[a->esz][s->fpcr_ah], a)
 
 static bool do_fmmla(DisasContext *s, arg_rrrr_esz *a,
                      gen_helper_gvec_4_ptr *fn)
-- 
2.53.0



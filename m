Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4550973lft;
        Wed, 6 Jul 2022 01:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uC9Vf+rRwEZrS6YMm/fkM2TtCf5IszLwhvpq1Ibvqcs1zVe/qLhuibluxlVYUbcEwjyS6p
X-Received: by 2002:a05:622a:1042:b0:31d:4a3e:dc1f with SMTP id f2-20020a05622a104200b0031d4a3edc1fmr12805407qte.315.1657097921346;
        Wed, 06 Jul 2022 01:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657097921; cv=none;
        d=google.com; s=arc-20160816;
        b=bE98HxQctN5Ua3lZZu9y7rI/o9oUfZkSW3enk4GJitkNFspPrLTUfuXGaNMICn5v/t
         crfv8vJ0QxUVgyar4mKT5mKvvp8X19PS5MHdeKNn7siSa/+WxpF8aqED+pV2i/OUv8HZ
         V36FBMzkFEE9PHDMMx5tYF5phJIgRCr6Luyi012Ivce54LAxPGDiTXp0zuuwYDVaIGK4
         YNOoPGv4xvm/GNVwEdILAaP3P6JjGvb2spOlTLzH5yv7bBhoCoEhB77KIgBlS43qGB+Z
         ofq+8t9YpgoIWewRagOP95CCOQi9h7cbwbFtCnbHqS8PS6Dk+VARvCFfYC4ZJLgT3+c6
         OUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hqPebj8e+A/slNwJFXKTlqvHw3rlOVkEOFZ7HeJe4nE=;
        b=xrEIDwHLA3iORAQHKwio/jWvZ39j3m1QWFGWJlZnnluzzG9vaU14DpTB637ymf+1Z6
         Wq6ROeWYbHnM4Jp4O6ENsyEs93KgylXG+/e1/pjEDC7KFS9Iu+ak68Zqc4IIkeKImaO/
         2z2XaJ3akG42hLevmrwMtquVgqU32tcMxR4sAMSyn43XhlHeSDiTTUTHInyynn701Zkp
         FSbPPT7grvZbW2uzkVzfgjBLNJOWw865Mj5FhdSP0B2OVoMneArhGdR9LoKaC1omK16Z
         TCFuArWxEscZ5Zc7NmDu7R3U5gVCVKjfm1/ZLhzWh6BjxT019nbw8gIfZnPzx8dmtq5F
         5Z6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MAo6xusE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b37-20020a05620a272500b006af217e92cdsi17472071qkp.695.2022.07.06.01.58.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 01:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MAo6xusE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o90rk-0002V2-Pn
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 04:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kr-0005m3-SM
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:39 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:35638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Ko-0000MS-Er
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 04:24:37 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so9285074pjn.0
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 01:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hqPebj8e+A/slNwJFXKTlqvHw3rlOVkEOFZ7HeJe4nE=;
 b=MAo6xusEZTL25xlVrurkDpv+mMnwNp9MB3y7qNcPz9xChdOxWeYbZGTezduFJ26NyA
 713v29v28J5wK+RMHiF523iCHwDRg1IBW5Yk5NsO5xC5cZgd1g9sInmvObwks+Yzd/I7
 vlCne3R6JiXwBAYF3/zD30Doq6uQMUr7xOCSKLxJu1/2e10g0blIDQin5xWmcfWAcY9g
 +Lg/ziKehbmpD9afUAP18foRUbyrL+sbEwuVA8R2O6TISEEGChG2pDOSAGDzqTMRF6Uy
 VKfWCBrIfTb7/CtOGqNmyb+08wVd7TjyW07D09CGdHJOqpVOK80I8zV8ppSmn7t9NXWf
 dpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hqPebj8e+A/slNwJFXKTlqvHw3rlOVkEOFZ7HeJe4nE=;
 b=3oRBeU3g1CqOiC1Xe2PNCeaW3pEKaxDYmmTbrQ0qWe5MtxnJBkW3D+zD10WlapIkzT
 orHR+GJCr60oWFpNFe2GvFzPSU5St+1Hnj7aFfA9j6HH2H9eMh87mPvgyhAHtjqEeYVr
 vCaUtMqcC8OPk9FWktTWDya2+IvNmS7WkaDAkdhuoZ9/DH1n3VOm0BOxGmi/Exdy67wv
 jQYXc+g4bYibNwLfQmH8Wi9aRY3vZUycoeMPikgXMASyfyB7qprxKKAlbOjAZZm3G+gl
 hLUWTZoyix+a+4FhrlPPZakv6pA0bH22aIW+dSf2n1muobUyGcxBxW/evbp9cq8KUOtd
 1+Yg==
X-Gm-Message-State: AJIora/rRsf15okC9Nzan04DBwN4ccIyb57FSwQWqbZ/uwR4JBKN4JQs
 SP7vU/XulKqOB8EZDwrLNOZDvZBc6ySJGaF3
X-Received: by 2002:a17:902:ccc3:b0:16b:d658:57c3 with SMTP id
 z3-20020a170902ccc300b0016bd65857c3mr22036104ple.1.1657095872427; 
 Wed, 06 Jul 2022 01:24:32 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 06/45] target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA,
 FTSSEL as non-streaming
Date: Wed,  6 Jul 2022 13:53:32 +0530
Message-Id: <20220706082411.1664825-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UQQuhuv8XmIu

Mark these as a non-streaming instructions, which should trap
if full a64 support is not enabled in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  3 ---
 target/arm/translate-sve.c | 22 ++++++++++++----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index fa2b5cbf1a..4f515939d9 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -59,9 +59,6 @@ FAIL    0001 1110 0111 1110 0000 00-- ---- ----   # FJCVTZS
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    0000 0100 --1- ---- 1011 -0-- ---- ----   # FTSSEL, FEXPA
-FAIL    0000 0101 --10 0001 100- ---- ---- ----   # COMPACT
-FAIL    0100 0101 --0- ---- 1011 ---- ---- ----   # BDEP, BEXT, BGRP
 FAIL    0100 0101 000- ---- 0110 1--- ---- ----   # PMULLB, PMULLT (128b result)
 FAIL    0110 0100 --1- ---- 1110 01-- ---- ----   # FMMLA, BFMMLA
 FAIL    0110 0101 --0- ---- 0000 11-- ---- ----   # FTSMUL
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d6faec15fe..ae48040aa4 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1333,14 +1333,15 @@ static gen_helper_gvec_2 * const fexpa_fns[4] = {
     NULL,                   gen_helper_sve_fexpa_h,
     gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
 };
-TRANS_FEAT(FEXPA, aa64_sve, gen_gvec_ool_zz,
-           fexpa_fns[a->esz], a->rd, a->rn, 0)
+TRANS_FEAT_NONSTREAMING(FEXPA, aa64_sve, gen_gvec_ool_zz,
+                        fexpa_fns[a->esz], a->rd, a->rn, 0)
 
 static gen_helper_gvec_3 * const ftssel_fns[4] = {
     NULL,                    gen_helper_sve_ftssel_h,
     gen_helper_sve_ftssel_s, gen_helper_sve_ftssel_d,
 };
-TRANS_FEAT(FTSSEL, aa64_sve, gen_gvec_ool_arg_zzz, ftssel_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(FTSSEL, aa64_sve, gen_gvec_ool_arg_zzz,
+                        ftssel_fns[a->esz], a, 0)
 
 /*
  *** SVE Predicate Logical Operations Group
@@ -2536,7 +2537,8 @@ TRANS_FEAT(TRN2_q, aa64_sve_f64mm, gen_gvec_ool_arg_zzz,
 static gen_helper_gvec_3 * const compact_fns[4] = {
     NULL, NULL, gen_helper_sve_compact_s, gen_helper_sve_compact_d
 };
-TRANS_FEAT(COMPACT, aa64_sve, gen_gvec_ool_arg_zpz, compact_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(COMPACT, aa64_sve, gen_gvec_ool_arg_zpz,
+                        compact_fns[a->esz], a, 0)
 
 /* Call the helper that computes the ARM LastActiveElement pseudocode
  * function, scaled by the element size.  This includes the not found
@@ -6374,22 +6376,22 @@ static gen_helper_gvec_3 * const bext_fns[4] = {
     gen_helper_sve2_bext_b, gen_helper_sve2_bext_h,
     gen_helper_sve2_bext_s, gen_helper_sve2_bext_d,
 };
-TRANS_FEAT(BEXT, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
-           bext_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(BEXT, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+                        bext_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bdep_fns[4] = {
     gen_helper_sve2_bdep_b, gen_helper_sve2_bdep_h,
     gen_helper_sve2_bdep_s, gen_helper_sve2_bdep_d,
 };
-TRANS_FEAT(BDEP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
-           bdep_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(BDEP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+                        bdep_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const bgrp_fns[4] = {
     gen_helper_sve2_bgrp_b, gen_helper_sve2_bgrp_h,
     gen_helper_sve2_bgrp_s, gen_helper_sve2_bgrp_d,
 };
-TRANS_FEAT(BGRP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
-           bgrp_fns[a->esz], a, 0)
+TRANS_FEAT_NONSTREAMING(BGRP, aa64_sve2_bitperm, gen_gvec_ool_arg_zzz,
+                        bgrp_fns[a->esz], a, 0)
 
 static gen_helper_gvec_3 * const cadd_fns[4] = {
     gen_helper_sve2_cadd_b, gen_helper_sve2_cadd_h,
-- 
2.34.1


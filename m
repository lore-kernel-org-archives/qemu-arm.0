Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp332365lft;
        Fri, 8 Jul 2022 08:19:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tPewGN0PcffZJ2YqLmIgMxtdWbgDjl2EYhDRNrYX2heTlpQniyChnOoAjIDJkqg1YmuZ8c
X-Received: by 2002:a05:622a:547:b0:31d:c3da:fdcc with SMTP id m7-20020a05622a054700b0031dc3dafdccmr3488147qtx.165.1657293569934;
        Fri, 08 Jul 2022 08:19:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293569; cv=none;
        d=google.com; s=arc-20160816;
        b=jrJO4IdC/gvu/MXvqWzqYxqlaBvnEi1mSR39IMD59EqocNk1RbmezuILgNDEdJMYJT
         d3thkkLsRJmGWZT1w0577GFdgjQd7nGP7B+SmaceVBC2dFqjzZDR1rw7b8IZHa5qUvZe
         rk41nb8tCIEEn/xewkGduOllWF9x5Z9fEEz0w8QwrdTu+LTZSzXjQANNmHkO2RhQ1GEx
         JBnGh2nJD4iJkeG4KYlEIQA//ZvS/PFGdFCrkUdmsqPRNoMCI+/rlfAGc/HS6Rh8tiKZ
         /bq6K6cJva50I/o6xzgHtpi5iKx4rP57QEXGp5hz5CAcsB8SAwHxsSKbnWmriBx/aezB
         +kKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hqPebj8e+A/slNwJFXKTlqvHw3rlOVkEOFZ7HeJe4nE=;
        b=Pesvhb122zInRyIAwYicBBilehuilSdNxk2BBdhtNwbnS/e8M2dup0/bpHEJPYMHdV
         I+Muz0TcJ5xHjqBqMwzXpTm+YrCH86ju54rJik0aWspV75qXhGVKPvwCUPnvwp/+mFSK
         H1Mh5wFuoW0RxcQeRA727ZKCBOM4kPo6AR6VrBkIyzPZBubZN1IO0JDhWO1v2qhCal/i
         ZhBT3Y9KMBsFmRCKcxpHvrvcHwvRz/uHizJRgdkEHbfjCTjNF1YnNiiTWEbrmdKXPMCw
         imtoF0bXg+ZZqCw8QAzMd1BoqpNeJKDUFyefF3kFAkuZqGhG8/BL8AbZtYcuuSUX1FzX
         lvJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kXgJ9Llj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ew3-20020a05622a514300b0031d469c1ae6si10782271qtb.436.2022.07.08.08.19.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:19:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kXgJ9Llj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9plR-0008Rz-Be
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piJ-0002GZ-Nv
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:17 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:36833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9piA-00027k-Hc
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:08 -0400
Received: by mail-pg1-x52f.google.com with SMTP id s206so22622015pgs.3
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hqPebj8e+A/slNwJFXKTlqvHw3rlOVkEOFZ7HeJe4nE=;
 b=kXgJ9LljZCm79DFXUXbuhkRulo8yv+p8i3+9PHDQv6J0cHJIJV4ExvhaI2on95XwVx
 Yfuly0cxUh9SOzHGYIXeCqLPSqgIX2di/iR2yn52keYIIbUfaKthCZXbnd/LNXlSySwI
 qSeXA8WOBRyXq4qHNJ7Nw51p1gQVvzgkjQ2Qe97HjD4U4z1bH2B54gWq6jCXJJ61Gw8T
 pGdTMDio/RkCcXPIDqECMPIj4E5XKZzJHKDHnAxnKcXP1S0UE0on0XMfOnZS2PsanNtG
 bPNKB8QwUgjIT08+EvMgmv88h3KzTny4mS3JK70ILoRbVHvpyXOJiK5owhoRaCOR1udU
 gVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hqPebj8e+A/slNwJFXKTlqvHw3rlOVkEOFZ7HeJe4nE=;
 b=e3Bfbf+CRjVpt9vw3qAyMNkM0nt0SxH4nx3oo+bKNsmxSdWKyoaPVJFshZUoJphVxl
 8haMqAvWstk5Q0w0Cxx5V6IS4vweuDy+Swt1X3l9YXKfcN3l4hjxSJ8wKZNKnqi65q21
 bFpqUeKZA7jb/JQCh33bfskZ90GesVuLjVgFRcD3cpnPNIn8nnInsE0Dlp45UCZMQhpI
 WMzw2626oShkbVEnBZIk8y5dHEBz93DsMU0abqyL2hyRpQTK4cC5IeJOjG5fEwd63Nwq
 Eil7BKBx2J3+5bzcAOKBDdY0Wk9tPmY/PT3H0gmcuJ3gfkVAtZ/k4cICJhBuDJ33d94R
 Wilw==
X-Gm-Message-State: AJIora8LdQA/hL09AXv/frA9BMiBpZEQeAcIrEPClVwUSZ2SYVXEPhdo
 crvBQrh6xYLqVyQCFbJT/owrokLfuRYPddIS
X-Received: by 2002:a63:150:0:b0:412:acfc:b6bf with SMTP id
 77-20020a630150000000b00412acfcb6bfmr3742308pgb.377.1657293365192; 
 Fri, 08 Jul 2022 08:16:05 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 06/45] target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA,
 FTSSEL as non-streaming
Date: Fri,  8 Jul 2022 20:45:01 +0530
Message-Id: <20220708151540.18136-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Q78D/OYq4i25

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


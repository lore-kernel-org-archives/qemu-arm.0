Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1207500lfh;
        Fri, 27 May 2022 11:24:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS1e7tmRfMpnuZVxsWDDKKaNKPf8sMEsUQnLwSnCZkXiCsgxNRQ6o/FEu0akB3fIAN0O3X
X-Received: by 2002:a05:620a:4545:b0:6a0:74de:c70e with SMTP id u5-20020a05620a454500b006a074dec70emr28775463qkp.73.1653675854810;
        Fri, 27 May 2022 11:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675854; cv=none;
        d=google.com; s=arc-20160816;
        b=wloCRaxnKMZ9e5eq5WiAII88+3iOG/iORNWtFOqGffBguszBrrykeWQ5xoOdZrmRub
         7cKjS5SfAWXmsDUtKiV+nucA71aNaPQD3egLwT6WWvJTW+4XLJlb0h1fyVKf9Tzf96uN
         M1niY6R65Ahet+2m2W87YdV0GluNjqE29yKXm3/J0sJ0G2ULnom2dwSLYYC8J2LWsTw1
         69OgR4KtCI/KRgHnqpoR+1ZyjBz5PjFzfJkj71qSRoxmb/5g1kjPnKXOL10UKbwKz7Bj
         qI4kUz5pZWqOU4D8z9wIUqnOPhCz99exaWQZr/D5vLpk7Ii2/hygGaHxKpRrwHlL0rp1
         SffQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pOFat1B1ryBBllWoHMJ+FJCh+hFLpauEM5Gtx+fR17c=;
        b=UVAzBGf3W9wmyQRT+AUaVUxpPyvReZ1a5aqqRnortVGTqwXALUaqQ1XkZlyK1YRrKc
         +BwDlSo0hbioCuizUxWhfBKgpZyhPzkAvq7U5a8WAKBD1uy4KAh4Jx4qxOtYifezYCY2
         tBXFyPmeVHgg+5ftv06IkklL55ZHZkPGkK6dHEwe9lBEWb2SjNWn8VQi0mAgmo8ytKNI
         YV9sY/eglbhYI0HPhcso/ZRW5kVe3xEorUl+zgqujoJdu+mj+zYzBpDvY+MXFbP3bQrd
         j/0XRepMD6gKCKC2JsGr+EabD+GmJrG65JGloSoX79mO3C8azhdF1JbsVLqttNoj3cTu
         +t1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PwvjpARZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k8-20020ac85fc8000000b002f9402fe899si3122447qta.66.2022.05.27.11.24.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PwvjpARZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nuedC-0005uN-9h
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYP-0006EA-9R
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:17 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYL-0003VM-Br
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:17 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 137so4566076pgb.5
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pOFat1B1ryBBllWoHMJ+FJCh+hFLpauEM5Gtx+fR17c=;
 b=PwvjpARZ+RQ6Q/zChfHSxWlyzNro+iaspdBW6loT/qzAT/Xzmv0V+DdzOVliT5v/aI
 i0Z/or45BiXv+l4+JooPifW5uu4EM+vd+JqsGcknHXV/UgEUSyvytHXwdnAq6YJIPOp6
 wwTsuLjXteyGtZGai8AFvPos+JWOF7LWqhKQSbHENcVK+ODZrLMVNQ9xVTwn2OSSvcQV
 Ai/pcaGAh2gelceArWAmPhXJQYLBoUbPljaDR9aSwFHo5K9tjRFKjl7vinzNAIIOGSt0
 YtF1quG5rKfsPg5/R95P9cCUPSd8teOosYzJ8SB3XNrvCtLiYRl2MCGPlmIHEHWjMIyw
 laXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pOFat1B1ryBBllWoHMJ+FJCh+hFLpauEM5Gtx+fR17c=;
 b=QdVkwk6YiePHagkjUiWhmd7cw8JbWABc/CnsPDcqhCIIfzY1wK5UdnNX9ExVCIo3co
 ofCDg6C4iMpKH3Z4YCqDSeQpGRNQDjYq7BMHf9BN+se9p8ak9OxxB2wkcg6oBxOnXJ0R
 hkhTH28u1MDerr4PpvdfSm1OwQV2Im361p5cPT/5KrNV/HYc5xzrVLQIoDPKAhV7zB1J
 d3b7D6LgelneqPmAzaegx8Zu2wncOwyYxFCE/eGK8MEa9Zw0NJvjAIH7H6WWdv1l3jcA
 NBUfxuM6ZJNQwgXJ0MMKOKFB+f8Du4UzbpKsH1ls2MSFsZkTpaAsgj2eiXhcQNyu95dl
 GRNw==
X-Gm-Message-State: AOAM531OxqGWu5jNn4L3V+lExM/NKMeKuJa/yEo7j1al8Tclg78GSh85
 2B7XzQcRYs8dApqC+RUWmCJPNeH0KXS/ag==
X-Received: by 2002:a05:6a00:1502:b0:518:d3bd:c9eb with SMTP id
 q2-20020a056a00150200b00518d3bdc9ebmr18382659pfu.86.1653675552060; 
 Fri, 27 May 2022 11:19:12 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 003/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_zz
Date: Fri, 27 May 2022 11:17:16 -0700
Message-Id: <20220527181907.189259-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-TUID: dtRpTLJYRm3r

Convert SVE translation functions using gen_gvec_ool_zz to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 39 +++++++++++++-------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 903514cb6a..f7e7a569b7 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1375,16 +1375,12 @@ static bool trans_ADR_u32(DisasContext *s, arg_rrri *a)
  *** SVE Integer Misc - Unpredicated Group
  */
 
-static bool trans_FEXPA(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2 * const fns[4] = {
-        NULL,
-        gen_helper_sve_fexpa_h,
-        gen_helper_sve_fexpa_s,
-        gen_helper_sve_fexpa_d,
-    };
-    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-}
+static gen_helper_gvec_2 * const fexpa_fns[4] = {
+    NULL,                   gen_helper_sve_fexpa_h,
+    gen_helper_sve_fexpa_s, gen_helper_sve_fexpa_d,
+};
+TRANS_FEAT(FEXPA, aa64_sve, gen_gvec_ool_zz,
+           fexpa_fns[a->esz], a->rd, a->rn, 0)
 
 static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
 {
@@ -2418,14 +2414,11 @@ static bool trans_INSR_r(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
-static bool trans_REV_v(DisasContext *s, arg_rr_esz *a)
-{
-    static gen_helper_gvec_2 * const fns[4] = {
-        gen_helper_sve_rev_b, gen_helper_sve_rev_h,
-        gen_helper_sve_rev_s, gen_helper_sve_rev_d
-    };
-    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-}
+static gen_helper_gvec_2 * const rev_fns[4] = {
+    gen_helper_sve_rev_b, gen_helper_sve_rev_h,
+    gen_helper_sve_rev_s, gen_helper_sve_rev_d
+};
+TRANS_FEAT(REV_v, aa64_sve, gen_gvec_ool_zz, rev_fns[a->esz], a->rd, a->rn, 0)
 
 static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
 {
@@ -8376,14 +8369,8 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     return true;
 }
 
-static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
-{
-    if (!dc_isar_feature(aa64_sve2_aes, s)) {
-        return false;
-    }
-    return gen_gvec_ool_zz(s, gen_helper_crypto_aesmc,
-                           a->rd, a->rd, a->decrypt);
-}
+TRANS_FEAT(AESMC, aa64_sve2_aes, gen_gvec_ool_zz,
+           gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt)
 
 static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
 {
-- 
2.34.1


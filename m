Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1236834lfh;
        Fri, 27 May 2022 12:19:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsZEdFrDgGhhFQvQwy19rbzFuNLJ+nH7RT3x9D4UI82tpg5YvF6jkN7MCEgNdoOpeSaZKM
X-Received: by 2002:a05:620a:681:b0:6a2:e7ac:2560 with SMTP id f1-20020a05620a068100b006a2e7ac2560mr28353270qkh.160.1653679179205;
        Fri, 27 May 2022 12:19:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653679179; cv=none;
        d=google.com; s=arc-20160816;
        b=KwSTSVC9jnbNQgY7EwZo1CghAfYlQ9PbABoK6pcMi8HI8N4nJUNqEuTEWJ2k0NjFNW
         HJ5PqM/3WJ6TqclQLawsigd4R2wJWScfxQLbJKkTmFNRhLbd6tMrWklcaijgVFdIqFJs
         9dA1yfoS22w2T6Iu9ZK+nXQ6ctDVmuQClHA+urBz49sfQ3SYwd+iZ6ZTqmutQrSj6+ii
         ZmSJqkyrXUAF4w91+d6Y0mKE9tjw5ZTCACcOHe27JbwRCtzuxWdWHBs8sJwx4unmCvok
         a00ibYm/6sQe+4H3xoi4H/exNn/JswENNOM2sjy3dY3AgZNMtopWxO09loQ+L8XyqFC4
         V2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=JP1jEzSyCeD7J5isISjzjuuYkjaJtztreKWCJd8+D18=;
        b=l2sApyB2JrGgGiPu0x2O6FuPyFz/qSVwaYkSOmt94oDtuWKLE3OSjOqkCQri3/Sbei
         fyl63swNLt0SE1nKnIUhriOtZ6dD0cDOkTG5etfFtazOzob2Oezip6EtFzPgmIfG7H+P
         K11q9FARzE5dBL6vnfle4dAJc9GBAYiuiIwHhtjgBtLFxZn/+Id8sRb1fX+c8NmGQNGu
         79HQM93HASATP/etrnBHcuk6GHpYnM2O4HWKpIqGLwJpPYXkrqJ0BdotlW4OaWWy0gjR
         WQ+O9LSO7EFeEp/vHraN9k8mZPrOnvgQ+gWaPBKA6YHP2QsFt+G3Bq42XBm1YLXhp862
         rFnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g5u6DykL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020a05620a268300b0069f619960a6si4283710qkp.208.2022.05.27.12.19.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:19:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g5u6DykL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufUo-00021v-Nc
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec3-0003J4-76
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:33540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuebw-0004Kl-OP
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:02 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f18so4850184plg.0
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JP1jEzSyCeD7J5isISjzjuuYkjaJtztreKWCJd8+D18=;
 b=g5u6DykLU14WEfeHoMCg8X2gTMA457gyusjxRXfLxES38aXh1nYGR8jxfXSyvzIo30
 QdMmrxSMYDEfq9V3G6p47abBs3GmqlPhCxWQjrUcrXhQUgI1HLtZsLjT1HI0NaKm07Am
 l9BhqRUIMdyoTRgZ+WOJcge1Qx6H090/6PLgDalSIJylV8JSSFTgWxT1RLUhEB41cfAI
 c3yJsk421AsOWtuZqP1akIwjRdOo5L0A85flTT5sthC0lMMHN/y6/NonQlpqyekOXIP4
 PFbXuILcgSVbM9YvmVLyJACkQuTwtp6KsovUfitdoHxZQ76Ed8BerkIJlNTuD9M8Sa1A
 o3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JP1jEzSyCeD7J5isISjzjuuYkjaJtztreKWCJd8+D18=;
 b=xW6ISu+kYNWu7G8rDh1iabo2Jr3qSLFUZvcapOS6kGuQ2tQAoZ4eicUBbrFYd8fhDk
 C3oN1JaKqgRI1pnllkvrj1ApHYyLT/Y5RKlAW3wZvvfhu1EWYZg5dfzut/7Vvm16ubZg
 hpkj/gJSu9jgv7JH/BBRw7kp7Arqsl0d3RkYlyFkZJ5GjBxPZkGJT+jkIZZlrPDgwz5s
 jYs2gXhQTaGpwsn6cgn+5rr+IsvKErjZu7j7pA2kAEoiN025tBCAmFxrOQhrghXAOvud
 FGGnnf8JPClQI8zHxNfLc2XS/gdJXvMRUhPEJddn2/bZ+Ii6oCeF6xsS20IFQmGUnYBU
 C+2g==
X-Gm-Message-State: AOAM531w0w7eznGa805erhmS8EprxfUw2woDvFZn/sPPsPlvDPc1iEjm
 jK7erFfLwqdtj9Me2AZgPjiSzg==
X-Received: by 2002:a17:90a:1b09:b0:1e2:754d:aec with SMTP id
 q9-20020a17090a1b0900b001e2754d0aecmr5806079pjq.171.1653675769140; 
 Fri, 27 May 2022 11:22:49 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 043/114] target/arm: Use TRANS_FEAT for do_vpz_ool
Date: Fri, 27 May 2022 11:17:56 -0700
Message-Id: <20220527181907.189259-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: DMOoSYW0EvwR

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 911d2e28bf..6103bd7f1d 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -858,14 +858,11 @@ static bool do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
 }
 
 #define DO_VPZ(NAME, name) \
-static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a)                \
-{                                                                        \
-    static gen_helper_gvec_reduc * const fns[4] = {                      \
+    static gen_helper_gvec_reduc * const name##_fns[4] = {               \
         gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,            \
         gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,            \
     };                                                                   \
-    return do_vpz_ool(s, a, fns[a->esz]);                                \
-}
+    TRANS_FEAT(NAME, aa64_sve, do_vpz_ool, a, name##_fns[a->esz])
 
 DO_VPZ(ORV, orv)
 DO_VPZ(ANDV, andv)
@@ -877,14 +874,11 @@ DO_VPZ(UMAXV, umaxv)
 DO_VPZ(SMINV, sminv)
 DO_VPZ(UMINV, uminv)
 
-static bool trans_SADDV(DisasContext *s, arg_rpr_esz *a)
-{
-    static gen_helper_gvec_reduc * const fns[4] = {
-        gen_helper_sve_saddv_b, gen_helper_sve_saddv_h,
-        gen_helper_sve_saddv_s, NULL
-    };
-    return do_vpz_ool(s, a, fns[a->esz]);
-}
+static gen_helper_gvec_reduc * const saddv_fns[4] = {
+    gen_helper_sve_saddv_b, gen_helper_sve_saddv_h,
+    gen_helper_sve_saddv_s, NULL
+};
+TRANS_FEAT(SADDV, aa64_sve, do_vpz_ool, a, saddv_fns[a->esz])
 
 #undef DO_VPZ
 
-- 
2.34.1


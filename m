Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1254860lfh;
        Fri, 27 May 2022 12:58:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKUTrCDucbaHJJ/3VUjI0oHVh8qH6LC3vIwXfZdJaVYTHj4I/yvF36iC8SZHdSnACbPX0q
X-Received: by 2002:a05:620a:2847:b0:67d:2bad:422f with SMTP id h7-20020a05620a284700b0067d2bad422fmr29371396qkp.559.1653681489989;
        Fri, 27 May 2022 12:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653681489; cv=none;
        d=google.com; s=arc-20160816;
        b=ir8ZBohO6gw6YAcKEKUR/fnbB/RrnWGNGqn/ez2QhNWKG9zVSVRdQjY+Y5Hc+cl0Mu
         mcbFNw+ej2gU1yyAViZu+5e+1+3mOPDqCL8UYEtJb9XcukimDXo1WndDQs+9LC7he/gE
         K2EqimwLNFvpqXmhDBOh42Qm2l4UAyFgbEbMp1NB7/gG2fqjAwmNb5RZB265xmljNLmx
         TBGcYr+RlVUbD4E6hwWOqEmM6h5KzEeoN+6G5e3lyx0cKOzFIxhRbgtkC/bDxWul5q6o
         p8u0GIXfwPifnJPKgpTAtR3Mv0+I8uduKn8IuCTTILV5Qpx+k0Hg20gG/zZRyKsruIaH
         r7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qHeO17YCPFCpt+rKLCOncNDfCYaqscqX/LTqWwqXD8U=;
        b=tSqzqeo3xvzlBJA78I4QABv8D1DY9RplRIvV7Pbn0D+/H3c0up6JdFVnO6UggIK0fd
         n6APJEm6FOgbN2cWQv1+XIsQIKR9FJoNPGp0BGpeI51kGqSdqqd+7aDUZP08O+4z6/tf
         YDU6HiqrL14vzXcGk+Mew18EK9ZRwn3qOOcYrs0hmjwTDP33U236N2ioSgXxhn1392fD
         BuDTO3B5GY3aKreekso/aUvywXuk9y8RwXOguXbXqIHcEMxEdwyeIs4ypguJNcXYZjVw
         SbSPbTlQDC+HnSRensFWwBqttirumjBXBzhtV6Fgw7sbDlBtNnfkZMEd8FzfHuuJ/eLn
         N06w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6B6ohCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020ac858cb000000b002fbcf6b9f2csi3694106qta.273.2022.05.27.12.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:58:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e6B6ohCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nug65-0002Pp-BR
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefO-0001bZ-Ki
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:30 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefL-0005I0-A3
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:26:29 -0400
Received: by mail-pl1-x633.google.com with SMTP id c2so4826916plh.2
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qHeO17YCPFCpt+rKLCOncNDfCYaqscqX/LTqWwqXD8U=;
 b=e6B6ohCSkq72mZtoYRcu7l3RQg2jGpHEjDmc03NTs+BooOJ3Fv4VqP3HarwMOjOK8+
 1cdzwe3S7ZHzfDoaFXlidJ43aj9udAKvK/81gBbbf1cSBkn0HD5glaVPpba/MeP7NWks
 B1w2vOJfR0fbpUQA0SNuIArxOUOCAWhaF8v2bw7ywDlqpQ3HCi+Yv2qg4MuYMexFWAgz
 GrEMJldZxW9W3NwwH9x0UjVnF1wjrSvKMi1EtBK/1K6rnQIWMH0RiYGBDmo7QsmGNkfC
 YDklGxlW1ckpiBKMNEWftfsRdkQplNFbKePWSR020xHksuVInCJ6j3cp+Fjf67MlHses
 kTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qHeO17YCPFCpt+rKLCOncNDfCYaqscqX/LTqWwqXD8U=;
 b=ratTQnrgNR+BVML1o8YtWH8066FpA0fbtHt3NTrYR2Rw2dg2D0/mJdQx01dBkSrdOE
 //zK29+/EZB1JvXh3ImQOkj5eWjDUNuul9OX10vzlUWWKg56igR9U2NOMjqx7eIxAEC/
 DCDdsKTfKH9WXc7TwRGdIrKEG46BhbI0WRd5AeFAoY9ribXzw9sSPcWnrrChYeP4uyu2
 a38q7swEaT7Ho+O0DupKeXviANKdMVXulCQNvf3yxAN7sv2KJl2KbDr5GyJt+GZ14tw8
 zeBYjV/iTmsRsAz2jsvy4eRZSvKhoEMEaIxLP33nKWL6EEjs43HFCRcEy6CezVnkpr9r
 xUcQ==
X-Gm-Message-State: AOAM5320f/sO/ZENZmrXTWDSm2hws6iXXLYouOjKBvosAU3vXZwvRYeo
 gy1Ye7wmjElIy4L2mL7a2OkFJg==
X-Received: by 2002:a17:902:e54f:b0:162:15d5:fcf7 with SMTP id
 n15-20020a170902e54f00b0016215d5fcf7mr28958449plf.38.1653675985995; 
 Fri, 27 May 2022 11:26:25 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 083/114] target/arm: Use TRANS_FEAT for FMLA
Date: Fri, 27 May 2022 11:18:36 -0700
Message-Id: <20220527181907.189259-84-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
X-TUID: gfehF8fQbiUz

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 6e8d8d54bf..5aa3e477cf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3521,15 +3521,8 @@ static bool do_FMLA_zzxz(DisasContext *s, arg_rrxr_esz *a, bool sub)
                               a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
 }
 
-static bool trans_FMLA_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
-{
-    return do_FMLA_zzxz(s, a, false);
-}
-
-static bool trans_FMLS_zzxz(DisasContext *s, arg_FMLA_zzxz *a)
-{
-    return do_FMLA_zzxz(s, a, true);
-}
+TRANS_FEAT(FMLA_zzxz, aa64_sve, do_FMLA_zzxz, a, false)
+TRANS_FEAT(FMLS_zzxz, aa64_sve, do_FMLA_zzxz, a, true)
 
 /*
  *** SVE Floating Point Multiply Indexed Group
-- 
2.34.1


Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1210139lfh;
        Fri, 27 May 2022 11:29:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/hAIevxz6Q+bnop4Bk9yr46xq4bseUBrnHa/nBEXcYOZVPPd/p8YQ9di63qs0Myb+90Do
X-Received: by 2002:ae9:e318:0:b0:6a3:7c6e:a52b with SMTP id v24-20020ae9e318000000b006a37c6ea52bmr19123183qkf.98.1653676170271;
        Fri, 27 May 2022 11:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653676170; cv=none;
        d=google.com; s=arc-20160816;
        b=E0MBAyZT1+zMov6ADcDbCj9QL08A2wUw2IAsJmqabemaCTzzZ/wQ2DA8Q7eRd+cJPv
         mjYl4/hOGilbisSkU7FqbPTbY9t+TlcBl6dJsjAK4S4PINM9z5QndVYlKYrH4nlGS9Hj
         kCfajGNUnBDNSWSc9zSPAAbgp/kzH0HZCCq5vikTUPkETxPCnWNVNpUgt7NIQwTVDxrd
         FpjjeJ0/122hJEX+GmQIgMb5D7vqz33Ad3YIlJ5+wJk2EdnG7aGb2hRAaHQpZDvAgKhS
         Sd3mYLx5SqgG3+d3ZhcPHwI2fhCuXnb3eIeHTerb2BySSre/E+B3KrjJaoOPt+81isFy
         grkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q/r/5sQg7LcKfCo6q8wVtM0uONgheR0ZHGVQXD4ChPE=;
        b=DyHYrEOdloSc1991GJu1a4NgweuV/8qiaxKDhwza2AF9Jbfo+Njqx/6S/Lqlo3Swrl
         L6r9CQaB8T2NjsliyhQMO9PNxReekR+Pt2R8sFTbsN0/Xo2gugfCUk2hINgxAc6bwMLO
         UeBKbwXeRdrbmcMGVMAv2xE9h2G4G7HfqMiEnRsQkEVyvEqEDl7j4ga5RkqmCSsFTJ+R
         MdAFjkl16THH2kbqWsGVuN0SxyAqfYRPN53As7EV8ynwFKHuvc9hkxxiWwv9q1iBMMQl
         GwyFnj3ZmRwyPSXwAiPCEftN+gtlzDk6309WhfBYUA6wnwBAuYbGOp356dSpIP7ATMFa
         KLpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPd+yrS1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5-20020a0562140ac500b004625665a7a4si3476967qvi.114.2022.05.27.11.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:29:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NPd+yrS1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueiH-0007Fa-NX
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYi-0007Lt-OA
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:36 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:42774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYe-0003dV-Vi
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:36 -0400
Received: by mail-pg1-x52b.google.com with SMTP id d129so4555827pgc.9
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q/r/5sQg7LcKfCo6q8wVtM0uONgheR0ZHGVQXD4ChPE=;
 b=NPd+yrS1B6CMnt3LPYCyb8DeSBUHrTZrOqSB8NFByS9R+OecgawI/V2lMgFHExX8r3
 MwQKVtleL68ySAhdjQ4TdwUCuUOtSAW0CLkuGnGX7G+Gfm1q70Z9ogB1gPDJbzD7MCMu
 zFLi3cPgpadH8AKYo+mDSS3sHI6wRiP0BuUZro+3IG0LF3WTje3qVWlOstPj5zK2Zz9S
 C42r63RZbeX3tjMSiDNOXAYjfnnYhUf6OTQrF97PBxPja7xq0gnk0l/ksr6fknuora/j
 4mHwQyoay/2aYTP+cRPf3u6yljSin11/K8/IQJHNPQtwJgdPlICrJTEfwE/FBjuFC1un
 9zdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q/r/5sQg7LcKfCo6q8wVtM0uONgheR0ZHGVQXD4ChPE=;
 b=PmTO/3/URis8kDjx/v+hQt4hdtzkDDkH4rjeSv1/8+UOqeiPcVmxNy8/MbHb6RePhS
 zjBG6o8gVRlUxm8lfm1GzI9zr7chpHQib8b0Zi4/gMjx4ErAkz7VK1IMB9cFRepGOfus
 oeEMPok53M+KDr0EWEPgREzMadLhWUXI26AMSJGwhL+08069vrNVCEOnHTRldW8Z16nF
 l8WCemfJwUzT62CFkuUMgsKcFnjjezWo4wfadAGkyrlS5izu7/sCebaeK1YiGppbtCpO
 v/zGG1muJ7zEKwXXXyZ4BoxtNPWixOff+I5du2GMdn5VXCOiWZGr/D3bjQlBiG6v/Cx+
 d6+g==
X-Gm-Message-State: AOAM532EBliapBkI9l5TDrsLH6TvF1JbSdsozr6m/jqEx7+Ja3VSRau6
 0jyu4C3pNazIyhYizGvOjrgS5nKyBp2EVg==
X-Received: by 2002:a63:4a4b:0:b0:3fa:8a72:b2 with SMTP id
 j11-20020a634a4b000000b003fa8a7200b2mr19524202pgl.544.1653675571690; 
 Fri, 27 May 2022 11:19:31 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 024/114] target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzi
Date: Fri, 27 May 2022 11:17:37 -0700
Message-Id: <20220527181907.189259-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: YJIOYA1jOi0/

Convert some SVE translation functions using
gen_gvec_ool_arg_zpzi to TRANS_FEAT.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 85 ++++++++++++++------------------------
 1 file changed, 30 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 86e87a2078..10614bf915 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -1027,65 +1027,40 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
     }
 }
 
-static bool trans_SQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
-        gen_helper_sve2_sqshl_zpzi_s, gen_helper_sve2_sqshl_zpzi_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const sqshl_zpzi_fns[4] = {
+    gen_helper_sve2_sqshl_zpzi_b, gen_helper_sve2_sqshl_zpzi_h,
+    gen_helper_sve2_sqshl_zpzi_s, gen_helper_sve2_sqshl_zpzi_d,
+};
+TRANS_FEAT(SQSHL_zpzi, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : sqshl_zpzi_fns[a->esz], a)
 
-static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_uqshl_zpzi_b, gen_helper_sve2_uqshl_zpzi_h,
-        gen_helper_sve2_uqshl_zpzi_s, gen_helper_sve2_uqshl_zpzi_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const uqshl_zpzi_fns[4] = {
+    gen_helper_sve2_uqshl_zpzi_b, gen_helper_sve2_uqshl_zpzi_h,
+    gen_helper_sve2_uqshl_zpzi_s, gen_helper_sve2_uqshl_zpzi_d,
+};
+TRANS_FEAT(UQSHL_zpzi, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : uqshl_zpzi_fns[a->esz], a)
 
-static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_srshr_b, gen_helper_sve2_srshr_h,
-        gen_helper_sve2_srshr_s, gen_helper_sve2_srshr_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const srshr_fns[4] = {
+    gen_helper_sve2_srshr_b, gen_helper_sve2_srshr_h,
+    gen_helper_sve2_srshr_s, gen_helper_sve2_srshr_d,
+};
+TRANS_FEAT(SRSHR, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : srshr_fns[a->esz], a)
 
-static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_urshr_b, gen_helper_sve2_urshr_h,
-        gen_helper_sve2_urshr_s, gen_helper_sve2_urshr_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const urshr_fns[4] = {
+    gen_helper_sve2_urshr_b, gen_helper_sve2_urshr_h,
+    gen_helper_sve2_urshr_s, gen_helper_sve2_urshr_d,
+};
+TRANS_FEAT(URSHR, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : urshr_fns[a->esz], a)
 
-static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
-{
-    static gen_helper_gvec_3 * const fns[4] = {
-        gen_helper_sve2_sqshlu_b, gen_helper_sve2_sqshlu_h,
-        gen_helper_sve2_sqshlu_s, gen_helper_sve2_sqshlu_d,
-    };
-    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
-}
+static gen_helper_gvec_3 * const sqshlu_fns[4] = {
+    gen_helper_sve2_sqshlu_b, gen_helper_sve2_sqshlu_h,
+    gen_helper_sve2_sqshlu_s, gen_helper_sve2_sqshlu_d,
+};
+TRANS_FEAT(SQSHLU, aa64_sve2, gen_gvec_ool_arg_zpzi,
+           a->esz < 0 ? NULL : sqshlu_fns[a->esz], a)
 
 /*
  *** SVE Bitwise Shift - Predicated Group
-- 
2.34.1


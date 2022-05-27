Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1249692lfh;
        Fri, 27 May 2022 12:46:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQGfr6+HB+W29GIUIT+LE0OLV+nJavLsWSKZEOaGbgFrxhfYJoEE7lAJTOD//4tQnFTIiR
X-Received: by 2002:a37:cd3:0:b0:6a3:2587:6dc4 with SMTP id 202-20020a370cd3000000b006a325876dc4mr28877204qkm.454.1653680747051;
        Fri, 27 May 2022 12:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653680747; cv=none;
        d=google.com; s=arc-20160816;
        b=A2S4BuKrllJa7ThQbF/ugfSXI05+TiI1wa+sH4qYEpFo8nIIU5Cu4LZuF0I6L8izJw
         nADVxiTFeNLfyFOTSYApVsKaz2+eDESq/cKDADSI9cPLmD7u9awRVCElkYdIOCbN69wn
         wf3nPPbdYQRQbhhM6m3BJJDM6upRuIU5g+g1/HOYwm+yTJI00TTBSTR2L6EAE8CMDWoA
         AtILxy+NrvWh8TKnocv9z5o6STzBw3iuh+lkm+w4GamS3h1ZaJVI6pxXYzltvqXg1dFr
         XXxXNfwfEAfDBmL2dw8lAbLA8ey3uH+858ZKb4y46lRRCpgT71zpXlmrk9fV89Xi54iT
         50Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=t46XTEgGH7GaDo7Nv2mR9+DWEKTQLPHUxBDLqqQQZbA=;
        b=dIFb/X4VT6+X7WBEpin0Mqxvkbo88DhN9SbOgtGVe3ho0Fm8T773GuzmJ2rSVawOwb
         6SnuZFzHJJTe54dm6tV8oryT4YtxrDInNwZeAbo4+A0fbbHwlwfSUpVPtxuBe7YE+gu0
         VOYpqCDFeuZOBDepwo2Y+56tdi2qL0BFQSudqR3MDLffZJVnt3tEU1HKD+c0ttNWkB2D
         snytvdUJUsxt8OgTfIoYT2C2hCfdREudjByL7faiCCRJTl3NW+0b95dMZaEaDDxUc06z
         TQP6GuMWaHfZXO2a8qduER5aRdArzIC3J6aoFNvj3Wj5BUsHx2QtSIOdsOM7ZUjZBTHd
         VSqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vq3vY7aF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b12-20020ac85bcc000000b002fb0eace504si3447121qtb.544.2022.05.27.12.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vq3vY7aF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufu6-000840-HY
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecQ-0003h1-3Z
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:40865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecB-0004Li-Ht
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:25 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q92-20020a17090a17e500b001e0817e77f6so7779709pja.5
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t46XTEgGH7GaDo7Nv2mR9+DWEKTQLPHUxBDLqqQQZbA=;
 b=vq3vY7aF2YJ1XbmrAvTouCr6fDyWJ5opHkBDmr9gTQq51Y5nlsNBPFZ7o1A8jv3y/h
 r5kXCoO3Epv3UcfE2dgeQfNc6uyCZj5eK93rCBoqxua+DqJdtvNzcU0tiJ4Y7pmIqYqS
 FbGwVJ57KIBWURCmWuwzrgiptG6nJSdNyWEW1CUZ956wIF02urHzytVPSHEZsmmctcaW
 ZPU3FigpJ7JIhZvVzOHJi1ewSOyEGWkFjg2eaiZDKympzS11a7xPrdb/bxZrSGjCorAd
 38SWD3hd65uv8iHCelJCeTH+hRTTjabBD/xYaTY4GeuL/8Hght++wt6+uFcEKFN1jSIP
 nPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t46XTEgGH7GaDo7Nv2mR9+DWEKTQLPHUxBDLqqQQZbA=;
 b=O7CZPBiQ+JBTcnV80vhL6vO4bfQ5a+vkmuOw/AHTZHjk3X6KzwLC4X6kZ6XLJL60TA
 uSWEDJqpk6/UZBUYvCRMX8QEOFMgYgfoXBMztEgXdQ6cEv89Rop45hZfFY/R70yMWDBd
 B+MP5Yst6fJUT/XngqOPPhlnF3He8HMDTPByA8IGmchHl3OINIScCk/69/5DA1pI4INR
 NplISXXD/Z5zo8ILlMU2H/ol9Y8Vk/dG0VLqAFFVb70dunCH7QTTlLcaS2Z9Atz5Rlp2
 QTw31MkanxdjStkHa4ambRrJOBZj84OQDzXBZJVLTQg5Qt0XPcQHO+qvVPYo8ch0lSV2
 hnxw==
X-Gm-Message-State: AOAM530dgi0WI5Ugy9qSjYepZK1j9LrNp+XgnPcySaHbbZujWMtUzQlG
 rFnFPTxMvtIptI/+oAobpfC47g==
X-Received: by 2002:a17:902:aa07:b0:162:467:db94 with SMTP id
 be7-20020a170902aa0700b001620467db94mr33197221plb.26.1653675789799; 
 Fri, 27 May 2022 11:23:09 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 066/114] target/arm: Use TRANS_FEAT for do_ppzz_flags
Date: Fri, 27 May 2022 11:18:19 -0700
Message-Id: <20220527181907.189259-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: BY2v0xgFNytL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 8eb70fd56f..73b5b67c25 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2708,14 +2708,12 @@ static bool do_ppzz_flags(DisasContext *s, arg_rprr_esz *a,
 }
 
 #define DO_PPZZ(NAME, name) \
-static bool trans_##NAME##_ppzz(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
-        gen_helper_sve_##name##_ppzz_b, gen_helper_sve_##name##_ppzz_h,   \
-        gen_helper_sve_##name##_ppzz_s, gen_helper_sve_##name##_ppzz_d,   \
-    };                                                                    \
-    return do_ppzz_flags(s, a, fns[a->esz]);                              \
-}
+    static gen_helper_gvec_flags_4 * const name##_ppzz_fns[4] = {       \
+        gen_helper_sve_##name##_ppzz_b, gen_helper_sve_##name##_ppzz_h, \
+        gen_helper_sve_##name##_ppzz_s, gen_helper_sve_##name##_ppzz_d, \
+    };                                                                  \
+    TRANS_FEAT(NAME##_ppzz, aa64_sve, do_ppzz_flags,                    \
+               a, name##_ppzz_fns[a->esz])
 
 DO_PPZZ(CMPEQ, cmpeq)
 DO_PPZZ(CMPNE, cmpne)
@@ -2727,14 +2725,12 @@ DO_PPZZ(CMPHS, cmphs)
 #undef DO_PPZZ
 
 #define DO_PPZW(NAME, name) \
-static bool trans_##NAME##_ppzw(DisasContext *s, arg_rprr_esz *a)         \
-{                                                                         \
-    static gen_helper_gvec_flags_4 * const fns[4] = {                     \
-        gen_helper_sve_##name##_ppzw_b, gen_helper_sve_##name##_ppzw_h,   \
-        gen_helper_sve_##name##_ppzw_s, NULL                              \
-    };                                                                    \
-    return do_ppzz_flags(s, a, fns[a->esz]);                              \
-}
+    static gen_helper_gvec_flags_4 * const name##_ppzw_fns[4] = {       \
+        gen_helper_sve_##name##_ppzw_b, gen_helper_sve_##name##_ppzw_h, \
+        gen_helper_sve_##name##_ppzw_s, NULL                            \
+    };                                                                  \
+    TRANS_FEAT(NAME##_ppzw, aa64_sve, do_ppzz_flags,                    \
+               a, name##_ppzw_fns[a->esz])
 
 DO_PPZW(CMPEQ, cmpeq)
 DO_PPZW(CMPNE, cmpne)
-- 
2.34.1


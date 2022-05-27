Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1205555lfh;
        Fri, 27 May 2022 11:19:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYZga8tJ+U+5+LtYgas7oI63CMYIUcl2blcv/NjTLIrec1lix7XppDRUdRi2HLbpK0QHX9
X-Received: by 2002:a05:620a:2104:b0:6a3:502b:5375 with SMTP id l4-20020a05620a210400b006a3502b5375mr24229917qkl.131.1653675578917;
        Fri, 27 May 2022 11:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653675578; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBeiO2TWRCaH7XX3eWRnm0lHJzZ87cLFfhwkQZcRIAHzeA73xSNIzP8wLyR3Nj8rYa
         fC+8RLHc9rkJgTZmJTVNiDoIntQBIxtw2YroYFWEcBcQ1LO489vYbP5s3Pao0o4SMeEN
         GtkrpYiQKloHohsjbcS/GB/hyC65WOFg3Ka7vtPKjTjWwekAfP/E00ejlJ6SR46xv31I
         tn+fptczZHzaoEbcAX7+UtcQNZ+1GiHJI2hWqOgGz+Lbp/Qw84CNc7/+IgH786bonHk3
         yWP1ZDXWj26gLJj0JWnLol/foHQwtdGH52EzogubBtYAcBhQE9ImXNzsnVqHCRme4qzH
         h5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=z/J8KIBd8FwwQ9GCtKuGXF2/fLJclKixu9nNnrnC2i4=;
        b=QojaPuXN4ikkZ6mAKNbjyGgushLrwcq0P0mA/u+v8I41LU3uVHg1uxZ1EVshp5dYYb
         ndqwANdQbxscW05wjk7mKX1tOtP8tCTTJmLN2vghWuHCpgHCmvWgL4Si3tjyPBmemWsN
         M+1VFrUbrDz04cVHqEEjxnXkp6FHKDTYjHVDSm25I+M7i3InAdkIgMtL1uteHFHHssKD
         csb0YFNr+Mm8CXgnbPWGMoOQke4a5v6xDuxs2MG4xpoDcZiNYbHmFRU/k/jIX0o0Nz4k
         D8PZdy2z2ZGbSir+H+Ui1fJgEPxcFibVEJOHSVxfIO9UIlLKrfLGkS+EgJUF0Ja3o997
         6IEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TTOLyHLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a0562141c0b00b0045af47a3c59si2987531qvc.14.2022.05.27.11.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:19:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TTOLyHLz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueYk-0006cm-Ce
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYN-0006AX-Qk
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:15 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:33387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYK-0003V3-GQ
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:15 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 qe5-20020a17090b4f8500b001e26126abccso2899258pjb.0
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z/J8KIBd8FwwQ9GCtKuGXF2/fLJclKixu9nNnrnC2i4=;
 b=TTOLyHLzdBe+m//0qpy69wpnOMHGCdUDahS+iBfIrrIsn/ptO0mVxZunS2fSYRVU2D
 Cx4IivtuBMLCvXO6xpLXxrzsHSyGYG802jakbudXxh5eS3jm+QLcQAfjk1KF0MVNBUcW
 YoqS/AqhpCkor2pMM+rfonCT7HzYIrNULgcShzw7GyfCKBnrNTh0oXYDmIZCiXk5dXRB
 Uxy/L8dQJlYuCetWwaVQTEKSX+HlT4H/2PqsRgQYH7iYCrtJuDTCiVuyhdXGAj+U0VrI
 /rTVV4a2T7TDpd0QDAWGwo4HVUO/BiLQ5qWr/cp1C6Ny1LWHAPrb63I9J9ZmF98hbeOl
 wU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z/J8KIBd8FwwQ9GCtKuGXF2/fLJclKixu9nNnrnC2i4=;
 b=Q46LMdO7WgwRB4/W0mh2GljG4kyiiTNIvi8LlDte9mrKHID8jrlwOVGcQJVPiPmxwG
 8UZOYs3188Y6u29B1gt5qDEeAqKn5iBEAzvv/Y7ZldiRA68FDMeoSBcpqlZLBmKb+bQt
 kC+QSZ6tWvCXC8BndSTlrI5Nqo67C+aeXUgLsi2r4lHs9ghN4EppuH7BL221ZpQmT1kZ
 3kRmYJnBNnFhHz9lO++dIGmTFGaMv420n+ur9FZH4Z1IJI448Gz84y7Vfd8tezyCl6p/
 rNMVxZyEgkPWGMA/p5P5bDLxohOzNu0fxpPn3yksV3L5JicS9mfejX7+KK1R2yZ/sf+Y
 0vzQ==
X-Gm-Message-State: AOAM53286JWxRl1g3jFBVZWF0/jKuCWv2O1GLTwHON4xx4eUKAvYpba0
 y/AaviTarPuMl+RWTRcQ20V1K6Z6RfEkjg==
X-Received: by 2002:a17:90b:38d2:b0:1df:51e5:9a0b with SMTP id
 nn18-20020a17090b38d200b001df51e59a0bmr9675468pjb.101.1653675551163; 
 Fri, 27 May 2022 11:19:11 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 002/114] target/arm: Move null function and sve check into
 gen_gvec_ool_zz
Date: Fri, 27 May 2022 11:17:15 -0700
Message-Id: <20220527181907.189259-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
X-TUID: NY1Py3aYdcBk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index dd4a5b23ab..903514cb6a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -137,13 +137,19 @@ static int pred_gvec_reg_size(DisasContext *s)
 }
 
 /* Invoke an out-of-line helper on 2 Zregs. */
-static void gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
+static bool gen_gvec_ool_zz(DisasContext *s, gen_helper_gvec_2 *fn,
                             int rd, int rn, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_2_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_2_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke an out-of-line helper on 3 Zregs. */
@@ -1377,13 +1383,7 @@ static bool trans_FEXPA(DisasContext *s, arg_rr_esz *a)
         gen_helper_sve_fexpa_s,
         gen_helper_sve_fexpa_d,
     };
-    if (a->esz == 0) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-    }
-    return true;
+    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
 }
 
 static bool trans_FTSSEL(DisasContext *s, arg_rrr_esz *a)
@@ -2424,11 +2424,7 @@ static bool trans_REV_v(DisasContext *s, arg_rr_esz *a)
         gen_helper_sve_rev_b, gen_helper_sve_rev_h,
         gen_helper_sve_rev_s, gen_helper_sve_rev_d
     };
-
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
-    }
-    return true;
+    return gen_gvec_ool_zz(s, fns[a->esz], a->rd, a->rn, 0);
 }
 
 static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
@@ -8385,10 +8381,8 @@ static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
     if (!dc_isar_feature(aa64_sve2_aes, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zz(s, gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt);
-    }
-    return true;
+    return gen_gvec_ool_zz(s, gen_helper_crypto_aesmc,
+                           a->rd, a->rd, a->decrypt);
 }
 
 static bool do_aese(DisasContext *s, arg_rrr_esz *a, bool decrypt)
-- 
2.34.1


Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp746626lfr;
        Fri, 16 Apr 2021 14:39:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTTVDM3ec3ljCDoSWqlk2WzK/4zu2wLxAhjNnaMGgG8CTTieUpL2kFj1MGr1eUQ0W6VORn
X-Received: by 2002:a05:6602:24d4:: with SMTP id h20mr5239219ioe.4.1618609196045;
        Fri, 16 Apr 2021 14:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609196; cv=none;
        d=google.com; s=arc-20160816;
        b=Lc5gI0RZbAG5Rl5o5jN5BlCefZsO6fW7o8KzGtf2ruvoajIbv8OyIeBucq3SR2sfx3
         BNTUM9jvV6/Gr/dvBnmu7X06rIuWmcUrscND+TDrW1YasKaaATPHh3kIm7zQgIzYszwS
         zdKa6sT4+LF0nUzhrzrNPmi6UDyjverrj4lca42UigTehvOleyEhcIR2hTOVTI5AmBfc
         YK/mQU952gwuT/GxDE6suGf3+LtZa5/eYr7qUIW4QNmUSCiZH4lpl4zytJAqwXAUoxtN
         TKplq3KgILt7t3jjggz2qFk2Mu1+VAa8NYaLczMzhZ/Qj+hE1cnSxD7kNj7wgyPthNN6
         jQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MCDHvXiyFXS1mzEiFOdu1UrmPEyO05QZiiThz71om18=;
        b=X6r2HYEI3JM22F3/JYJk+zrISCgpXbYetx8yEYYb+TI8rGzMpcjRoE0gGDzTD2hKRI
         v6UZegDB3er+vs0sewIk5GWI/Z9Hu6Ufvz7jXhVDzyGCq4G6pFzUfHqO7jNI/dGXALeQ
         y2hd7ysk8q8HaMcYUNj25hRu9zaWfizYclB4pOEHZR9OKHvuaCtK7eWG6iV3bNS8Bu15
         sLeSgW3fXRIWFlKMyIVsKEaQB7P9Qx5z/JAWkphXYAdXM6mTILTQEpcNRyEOFOIEXdGf
         9bKRCnwHqAI3HlVgRDeB1/VMw4QkuCchlSa8LTTO0b4TVj5rcmP4EahZvM8CWFqSBJ4e
         Cm9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KVAj4DKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si7328348ioo.20.2021.04.16.14.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KVAj4DKa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWBv-0000pi-By
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdf-00068I-NJ
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:31 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdO-0001jd-Q5
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:31 -0400
Received: by mail-pg1-x52d.google.com with SMTP id p2so4545903pgh.4
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MCDHvXiyFXS1mzEiFOdu1UrmPEyO05QZiiThz71om18=;
 b=KVAj4DKavMVJw5wI5GH7QMxT6FW2E6YDuOuPBeY4z4tDTmfUCans+feT5uli14Pttv
 ff+JQ2O3W7n+DbVczxme2y7lXpYycyMmtqzaQllI3D1mSxFLuzx9toZB6z+9WeVIEjH7
 Wpz1uo58AhTmdKy4la8tdXliFNS8dJ2GfjY5/5D8Jhz5/xVsXsqelzpGWCLYWx2TNuXc
 RwFPNqa+/yEqXPvihi9PmE/bvw8qyBcyFylq/yZAJ3OqK4m6CeukoDP4tJlePPv52aIJ
 s96xgUJTpUeq9Sl684FICuPrdO4d8Bd0zq2xJMu4h8bMHMHyQorFI34ziImSa1U/YJbe
 yfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MCDHvXiyFXS1mzEiFOdu1UrmPEyO05QZiiThz71om18=;
 b=FQ+XQt7tJzs7xeBvxHZvTsMki6Nja3X72Db+l8I1xR/b3OIAbybADvrSyHoey9IS+X
 6bPt7olVgomI5HbSmMhOQbzLxmnzT0tuaGcuCiM2LHm4FplvWh0hZUCZ96VgBzAA6mHl
 ujiY4GAXWakb3GDRhX+cKbCfdLNC8GLrsTAb+EgNT16u2YhJgAZKLFllM2twKs5ZTvIL
 thM0Z/VwN2JK/Z+JxUtH4jMqU7os85+HoVQERisuHXoSEccQf1vceYFECZpUsS0lLO0e
 qU+8HVJeIGKw0wq6Lekeg4zX4PJeXM3DLjyB5monmamvxfksLcXBnbGS1yt4rc2OYlW4
 VuOA==
X-Gm-Message-State: AOAM531xpNHftSqTr59WRPBem74RtM0le/ULVks7n+Mdlzw1i8zyMfLY
 JYXCm/C0wihvfWX+vRMSuAD/YJ7YHzLiKw==
X-Received: by 2002:a63:5223:: with SMTP id g35mr864332pgb.164.1618607051735; 
 Fri, 16 Apr 2021 14:04:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 61/81] target/arm: Implement SVE2 crypto unary operations
Date: Fri, 16 Apr 2021 14:02:20 -0700
Message-Id: <20210416210240.1591291-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oam/Xcmy3i7S

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  6 ++++++
 target/arm/translate-sve.c | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 73f1348313..6ab13b2f78 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1509,3 +1509,9 @@ STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
 STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
                 @rprr_scatter_store xs=0 esz=2 scale=0
+
+### SVE2 Crypto Extensions
+
+# SVE2 crypto unary operations
+# AESMC and AESIMC
+AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0da4a48199..4213411caa 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -8072,3 +8072,14 @@ static bool trans_USDOT_zzzz(DisasContext *s, arg_USDOT_zzzz *a)
     }
     return true;
 }
+
+static bool trans_AESMC(DisasContext *s, arg_AESMC *a)
+{
+    if (!dc_isar_feature(aa64_sve2_aes, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zz(s, gen_helper_crypto_aesmc, a->rd, a->rd, a->decrypt);
+    }
+    return true;
+}
-- 
2.25.1


Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2168393ejb;
        Tue, 24 Oct 2023 09:26:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBohWKyflA/kDcTY06DzR1IgNwC8gW6YEjndAH2aqaFeQrkA9VcYrVJmqO+Ss/r9tAd3Zx
X-Received: by 2002:a05:6808:181b:b0:3af:6634:49d0 with SMTP id bh27-20020a056808181b00b003af663449d0mr14604469oib.18.1698164788646;
        Tue, 24 Oct 2023 09:26:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698164788; cv=none;
        d=google.com; s=arc-20160816;
        b=UltXuSEqQomkJhm6YpijfaVY//zVNpyhgUkkMZWuTcclur+mafRk9LjpVufZA1cgyG
         wZ2D8abvy9l9an6PGcgjlJmlGLqXcstPr43LRtJFl5QgpMMWJXdoQKRa61LAxotBIHBq
         KpTPuIJcv4W1GZKBVDUTKebwvGB39w24LMXGK9fiPeRvOwkdTVWVfhVFD/pCaR6RcE+z
         5E+W1oyCAzEwU6fhluPqRTdBu9G3o7i0+S+Rwn6qzfmDAFXjuTFLpHuDYY/kL/+TyJnQ
         5a5XexHFsfhy6DMeznZpPHDV7JjvlBVrwhd2n67W6JvtEzQ9fRfPCX7MOFYH2GIZNFqU
         RPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4gSUEVnjZ5l3XM9Uz+TU/GJi2M4pExdkC8HE+Bw6uwA=;
        fh=WVEKgOIyTrr8n58k2pegoTwEDRNm1XlZWphDTwgTwzs=;
        b=q6DYwHXbgv1Iy6KHdpsp02ZMT+OGJ9Co7pEQ273/bQImLN/xqXFFgxg4XLMswwlE2N
         j9AOqrTanCmqxEpPPRyGujGuFqtZ/8+ayZGCSxbrJhyuz342FviWSUC8qf8CgSerG+JQ
         XP+5nopKbSJj8QkX+1TOhijRXZz3ZkK4ERR9r2Apu4zmWZcPQ1PZIRqfA6tjTrAwTjqe
         kJDlSkV0QxTsmoQX0JqDe1N9fZ4iXrNWIhmCfCFTXjyd+M/P9F1jGIInZnXClcFK2t69
         N6Tm9cmcqYIwf6ElkPjsuWhEveJxW2pZYffvRkwTYwpEhELlrBxnVnUBe+OyH0ZIqO7z
         VBtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSehJHHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12-20020ad4448c000000b0065b11085b24si7532177qvt.299.2023.10.24.09.26.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:26:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BSehJHHY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvKDF-00015Y-Rr; Tue, 24 Oct 2023 12:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKDD-00011n-QG
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:25:00 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvKDB-0000zM-Dn
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 12:24:59 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-507962561adso6732075e87.0
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698164695; x=1698769495; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4gSUEVnjZ5l3XM9Uz+TU/GJi2M4pExdkC8HE+Bw6uwA=;
 b=BSehJHHYXjzIKnTrwYxxvjHAsmtU06w5GrCUw4B0edLizOCISK5d0dxs1v+uVL9FYZ
 +/0CXluzyw40vNcsCsVk5kUxY67BoAlV4dPWR0LfDLPy0/F9W96XHJeNtS+mjE3tKBHB
 GU4aiKWHJLW/HtkbPxWXno3/GhxpeyWHYAUJAi7IzX2TJ7T1IMpQAmpYtTAN6unsyRVV
 R3YgLmdecop1UE2EAyOSfSbjl1Qv739WF3HGvmxQiXvjrMqHi4Xrh1ybZ+GE9fBII5wL
 lzTFpo7xMu728IZgjHRutcQr+zJZDMm+WwTJIP6bp9jM0ezSyQurPOjqOee4BG6jMzXa
 LqpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698164695; x=1698769495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4gSUEVnjZ5l3XM9Uz+TU/GJi2M4pExdkC8HE+Bw6uwA=;
 b=X5s/wc/yNIbKQc0FC2cnqt4ZtrBzzhJfWj1anUxSn+0UwoHYntZNaYXdOSIsFsk5GG
 aTkovldGVpRaogJiALtZawzH+YVe3LrkyDwjcxM344IOeswgQhsTBARYzokJS9rdsys6
 nwmD/bexZaVfSYppynWBJkaHCptG0tdkPJPnQpyv0Z2CUlmaBVneylV41HmSbfSM5CV2
 YeX1+kyC7JzXsRtmldo8GgzfRrX9kZoRG2LDCfvBpqaRtDBm8pQZW+2KEdQwION9bJju
 Tgifeu4ewyuV31SX/FcYy2M4mv4iy6MMyDhbsBXdWr4unb8gCaEtPDfPdcO1BDKTXkVJ
 JpMA==
X-Gm-Message-State: AOJu0YxR1jc2EslGe63FCi1i6PGJjS8sdp4dmrSRuJgCyYh+OE057Ben
 WEVDnxEMrVTmxY+KdWNZ9AnW2Q==
X-Received: by 2002:a05:6512:baa:b0:500:acf1:b432 with SMTP id
 b42-20020a0565120baa00b00500acf1b432mr10873478lfv.63.1698164695601; 
 Tue, 24 Oct 2023 09:24:55 -0700 (PDT)
Received: from m1x-phil.lan (sem44-h01-176-172-55-165.dsl.sta.abo.bbox.fr.
 [176.172.55.165]) by smtp.gmail.com with ESMTPSA id
 b24-20020a05600c06d800b004064e3b94afsm17039304wmn.4.2023.10.24.09.24.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 09:24:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 05/11] hw/arm/aspeed: Introduce TYPE_ASPEED10X0_SOC
Date: Tue, 24 Oct 2023 18:24:16 +0200
Message-ID: <20231024162423.40206-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231024162423.40206-1-philmd@linaro.org>
References: <20231024162423.40206-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pStyJIzdM+9E

TYPE_ASPEED10X0_SOC inherits from TYPE_ASPEED_SOC.
In few commits we'll add more fields, but to keep
review process simple, don't add any yet.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/aspeed_soc.h |  7 +++++++
 hw/arm/aspeed_ast10x0.c     | 26 +++++++++++++-------------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8adff70072..dcb43a4ecd 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -101,6 +101,13 @@ struct AspeedSoCState {
 #define TYPE_ASPEED_SOC "aspeed-soc"
 OBJECT_DECLARE_TYPE(AspeedSoCState, AspeedSoCClass, ASPEED_SOC)
 
+struct Aspeed10x0SoCState {
+    AspeedSoCState parent;
+};
+
+#define TYPE_ASPEED10X0_SOC "aspeed10x0-soc"
+OBJECT_DECLARE_SIMPLE_TYPE(Aspeed10x0SoCState, ASPEED10X0_SOC)
+
 struct AspeedSoCClass {
     DeviceClass parent_class;
 
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 649b3b13c1..1c15bf422f 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -435,18 +435,18 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     sc->get_irq = aspeed_soc_ast1030_get_irq;
 }
 
-static const TypeInfo aspeed_soc_ast1030_type_info = {
-    .name          = "ast1030-a1",
-    .parent        = TYPE_ASPEED_SOC,
-    .instance_size = sizeof(AspeedSoCState),
-    .instance_init = aspeed_soc_ast1030_init,
-    .class_init    = aspeed_soc_ast1030_class_init,
-    .class_size    = sizeof(AspeedSoCClass),
+static const TypeInfo aspeed_soc_ast10x0_types[] = {
+    {
+        .name           = TYPE_ASPEED10X0_SOC,
+        .parent         = TYPE_ASPEED_SOC,
+        .instance_size  = sizeof(Aspeed10x0SoCState),
+        .abstract       = true,
+    }, {
+        .name           = "ast1030-a1",
+        .parent         = TYPE_ASPEED10X0_SOC,
+        .instance_init  = aspeed_soc_ast1030_init,
+        .class_init     = aspeed_soc_ast1030_class_init,
+    },
 };
 
-static void aspeed_soc_register_types(void)
-{
-    type_register_static(&aspeed_soc_ast1030_type_info);
-}
-
-type_init(aspeed_soc_register_types)
+DEFINE_TYPES(aspeed_soc_ast10x0_types)
-- 
2.41.0


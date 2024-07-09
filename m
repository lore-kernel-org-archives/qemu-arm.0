Received: by 2002:a05:7022:1005:b0:83:cb6b:1575 with SMTP id em5csp1559354dlb;
        Tue, 9 Jul 2024 08:26:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMhQAzvChuaCbiY6YRpC02I/T6KTCnbpOU7bJ0+oBmXl4ZCOKPfx1UBgnmgnTyarWw1BL1p+S3eMVIQdoz6b9Cxgmd9m8v
X-Google-Smtp-Source: AGHT+IGevtZGjSg8PxnZ3RCkNml8DDQQMZAx3BwJ8CDULTgtKeCz/Qdb8crHeCAtnfvJrs5K5b7y
X-Received: by 2002:a05:6214:2b0a:b0:6b5:a4c6:4b3b with SMTP id 6a1803df08f44-6b61c1cff6fmr36418536d6.54.1720538794860;
        Tue, 09 Jul 2024 08:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720538794; cv=none;
        d=google.com; s=arc-20160816;
        b=N03NJP4iWsPz1fig+SuEKnCS6/CRavUdWgiWjHeR7x2WKvLAFMzvDVVoq+jPUA5s4m
         63xgAItNZBvy2RYRLwzvhURPTDwE2XRl9KCZpB7lhC+/gvRYy+ZN4JoQRB8BeHPpMF7+
         V1pKVCPdQVVrTjUDngq/pPWp0WK/B6ukhn03wlBZ0pI971t/RNWEuPwW5O3IbWNeyv10
         lt/Riu1ZnKpirp6IlUJbbVjcLMqBkNsJHkScS0zgcqja+kCkiXaR2rwBfw4HTm+MQn4u
         2+n1B0MPHIqcV+B9EowabKOTGDcVWcm6DYfxkPOOtG+EtvWX9z1jjuKUh6SEDun4ERV2
         s+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Qg1OvvbVnYB9NkPyvKNWOuJA/h7PKPgrnxpR3YQLVd8=;
        fh=MYHLfIjJ6Hvx7rPuopPO2Khw7ypziP9+A2jw2XPCPDM=;
        b=Sfbw2mPEsHjyec+RyPCy2VfWarctkEiio0pprBm4TX8K753dBAJDth8viNzCn+XGr9
         ylCq6oHGLj55dbRMEwKxBuF39PBTGP3ZJZBUT2WuD4wQAFqVbmsQ+QrQnOJFvKykf7YR
         llk5adnY24EzouDcdarCO8i6Wzy+x66d7jvHy3nAWVsSQCWMqC8CL+119NETFkq3hw70
         1sVfjp6Al2YA+8AS43g+x6dixQbkzynd924AZ+h0hSdYc5osoKQekVFLPvzZ+Et5r4vc
         NsMN1egU852gRTYTAW1lG1Ai8NdMAJUWJZ1jDMtgsn6yp7/nWWclAhsqHHlttfjXAKNa
         vCnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qe79qGCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba8f35esi24006866d6.214.2024.07.09.08.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 08:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qe79qGCD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRCjN-0002u5-T9; Tue, 09 Jul 2024 11:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjM-0002rl-0b
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:12 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sRCjK-0006BX-6X
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 11:26:11 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so66273581fa.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 08:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720538768; x=1721143568; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qg1OvvbVnYB9NkPyvKNWOuJA/h7PKPgrnxpR3YQLVd8=;
 b=qe79qGCD1MrbcMPa5Gab6KXm3Nom68m4Ba/FUfPkxD7HRbaDMnBpmf71NCmQsMPoaj
 Em3nKRdpmg4bPTlFPRbRj80Z7OfYIHDFpHlxu612pdUb3Sw1LeV2x0KkEu5VuM/Oszim
 jycivY+2dXA4noodsz11gZrjS4gnMkGuORWQqzc1xORX7c/uf5gDmxiOYyqU3uX7H4Ls
 3bGHS+tcrTODHJRjROmtEts6eA+lO/ZJyiGMRn5MkiKp1JFlnNR6OziIn8f9yZmECK2u
 ELYneF1zN0D1ZqUSlsP7BmwTFGW4UfsQ3Cnhjz5Gb4Av2vDRU6lvn0ZD20OfG3imsJ+R
 s91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538768; x=1721143568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qg1OvvbVnYB9NkPyvKNWOuJA/h7PKPgrnxpR3YQLVd8=;
 b=Htm+HEbhiM2aTKAMq7NAe2+2RdJCM7ikVDkCtfJG+eARGFZcAemLjIE72jkG+BmO+o
 MAtYjspM4B4DgGSkluC1jT2Wk2iktO0L7QSCPudheBU2q/TDMug5+KMYfBCIsvQnRFn7
 oAD9PrqXt96nbSvcool1+wMX/woTZXNji0388rEfFRxVRStMAL+8DenK/zwjmj+1M3HV
 wo3VP8uIifjL6qqe1Z2YB/kIEtOnkro3ZZVlwnZIyDvQcNRDhp1XY//8j/HaHgSfAq11
 uxsoZ1TJALZumAxhlHgwObDzoLjz8rnvoyXKTIbhKXPDgU/WtDzKznJzZYFcXyabvfOA
 tABg==
X-Gm-Message-State: AOJu0YyC63794NyJd9zUtYZJjGu0LPrbki5GnW1TQCG8qx/WJHo0p3ss
 txT91/NP/s3y5bGOOm+hsjE3cacpsUuS0wTPxlOVt2zWhcPnmgNKBX0ibYDdsfY=
X-Received: by 2002:a2e:3014:0:b0:2ec:543f:6013 with SMTP id
 38308e7fff4ca-2eeb30d9814mr18582841fa.13.1720538766585; 
 Tue, 09 Jul 2024 08:26:06 -0700 (PDT)
Received: from m1x-phil.lan (vau06-h02-176-184-43-20.dsl.sta.abo.bbox.fr.
 [176.184.43.20]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f6f5f25sm46032035e9.26.2024.07.09.08.26.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jul 2024 08:26:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, qemu-block@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bin Meng <bmeng.cn@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v47 01/19] hw/sd/sdcard: Basis for eMMC support
Date: Tue,  9 Jul 2024 17:25:38 +0200
Message-ID: <20240709152556.52896-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240709152556.52896-1-philmd@linaro.org>
References: <20240709152556.52896-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bwmc+9SFk32I

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add basis for supporting eMMC.

Since eMMC are soldered on boards, it is not user-creatable.

Currently TYPE_EMMC is just a stub, so disabled (marked abstract).

RCA register is initialized to 1, per spec v4.3,
chapter 8.5 "RCA register":

  The default value of the RCA register is 0x0001.
  The value 0x0000 is reserved to set all cards into
  the Stand-by State with CMD7.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sd.h |  3 +++
 hw/sd/sd.c         | 50 +++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 0d6d9e452b..d35a839f5e 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -96,6 +96,9 @@ OBJECT_DECLARE_TYPE(SDState, SDCardClass, SD_CARD)
 #define TYPE_SD_CARD_SPI "sd-card-spi"
 DECLARE_INSTANCE_CHECKER(SDState, SD_CARD_SPI, TYPE_SD_CARD_SPI)
 
+#define TYPE_EMMC "emmc"
+DECLARE_INSTANCE_CHECKER(SDState, EMMC, TYPE_EMMC)
+
 struct SDCardClass {
     /*< private >*/
     DeviceClass parent_class;
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index d6a07f0ade..91a73aea8d 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -2,6 +2,8 @@
  * SD Memory Card emulation as defined in the "SD Memory Card Physical
  * layer specification, Version 2.00."
  *
+ * eMMC emulation defined in "JEDEC Standard No. 84-A43"
+ *
  * Copyright (c) 2006 Andrzej Zaborowski  <balrog@zabor.org>
  * Copyright (c) 2007 CodeSourcery
  * Copyright (c) 2018 Philippe Mathieu-Daudé <f4bug@amsat.org>
@@ -169,12 +171,18 @@ struct SDState {
 static void sd_realize(DeviceState *dev, Error **errp);
 
 static const SDProto sd_proto_spi;
+static const SDProto sd_proto_emmc;
 
 static bool sd_is_spi(SDState *sd)
 {
     return sd->proto == &sd_proto_spi;
 }
 
+static bool sd_is_emmc(SDState *sd)
+{
+    return sd->proto == &sd_proto_emmc;
+}
+
 static const char *sd_version_str(enum SDPhySpecificationVersion version)
 {
     static const char *sdphy_version[] = {
@@ -697,7 +705,7 @@ static void sd_reset(DeviceState *dev)
     sd->state = sd_idle_state;
 
     /* card registers */
-    sd->rca = 0x0000;
+    sd->rca = sd_is_emmc(sd) ? 0x0001 : 0x0000;
     sd->size = size;
     sd_set_ocr(sd);
     sd_set_scr(sd);
@@ -2375,6 +2383,13 @@ static const SDProto sd_proto_sd = {
     },
 };
 
+static const SDProto sd_proto_emmc = {
+    /* Only v4.3 is supported */
+    .name = "eMMC",
+    .cmd = {
+    },
+};
+
 static void sd_instance_init(Object *obj)
 {
     SDState *sd = SDMMC_COMMON(obj);
@@ -2446,6 +2461,15 @@ static void sd_realize(DeviceState *dev, Error **errp)
     }
 }
 
+static void emmc_realize(DeviceState *dev, Error **errp)
+{
+    SDState *sd = SDMMC_COMMON(dev);
+
+    sd->spec_version = SD_PHY_SPECv3_01_VERS; /* Actually v4.3 */
+
+    sd_realize(dev, errp);
+}
+
 static Property sdmmc_common_properties[] = {
     DEFINE_PROP_DRIVE("drive", SDState, blk),
     DEFINE_PROP_END_OF_LIST()
@@ -2457,6 +2481,10 @@ static Property sd_properties[] = {
     DEFINE_PROP_END_OF_LIST()
 };
 
+static Property emmc_properties[] = {
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void sdmmc_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -2509,6 +2537,20 @@ static void sd_spi_class_init(ObjectClass *klass, void *data)
     sc->proto = &sd_proto_spi;
 }
 
+static void emmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    SDCardClass *sc = SDMMC_COMMON_CLASS(klass);
+
+    dc->desc = "eMMC";
+    dc->realize = emmc_realize;
+    device_class_set_props(dc, emmc_properties);
+    /* Reason: Soldered on board */
+    dc->user_creatable = false;
+
+    sc->proto = &sd_proto_emmc;
+}
+
 static const TypeInfo sd_types[] = {
     {
         .name           = TYPE_SDMMC_COMMON,
@@ -2530,6 +2572,12 @@ static const TypeInfo sd_types[] = {
         .parent         = TYPE_SD_CARD,
         .class_init     = sd_spi_class_init,
     },
+    {
+        .name           = TYPE_EMMC,
+        .parent         = TYPE_SDMMC_COMMON,
+        .class_init     = emmc_class_init,
+        .abstract       = true, /* FIXME: Remove once model fully functional */
+    },
 };
 
 DEFINE_TYPES(sd_types)
-- 
2.41.0


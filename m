Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp1260396njk;
        Wed, 17 Jul 2024 23:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgBkrjzJn904ej3crfo5/2W/tsGYdubp8mWKsoZm+ouPFbJV1lyU3Oylkiim0UsVRQwxH4zndqx3cK4T1bLWwKtPbDMhsz
X-Google-Smtp-Source: AGHT+IHhv5l2O9rd4o9JfXHDatP1VT5YMWIbSRUnPMD41FIZloOIZl2GQ/985/FR2o9pNjWiCBBZ
X-Received: by 2002:a05:6214:580f:b0:6ad:84aa:2956 with SMTP id 6a1803df08f44-6b79cc43fa1mr28654396d6.13.1721285446191;
        Wed, 17 Jul 2024 23:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721285446; cv=none;
        d=google.com; s=arc-20160816;
        b=GSY9CZGsHbZVLkWk9fVRI33LBmYElhBCZIPfDI7x2RSHYcbEVZQcIydSRUU7cIORaM
         kIMjZp5DiMhdFmlgGNtqVv32wUkSlPaFynXXMvvDgV5of+r+c58R4AV6+b376V95lKRB
         /eu4I1maqW261YaBiZQ5N+wbUVMDYcafwqrqyZC+FA1PQpn442Z9aoM/Tb2X554VlaR+
         yDEyezg4SLnXOhVyYPpbG4Iz5Z5rRxDLGMUwi+qC07elzZT+b6JrAQRvEBETTC8Rcpg7
         r21+5nxx46azin5H05x+pxiLRQdR4K/ZKcXDuzjtgxOwj806H717LiLlsD0q1tg/UCui
         0kyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Y8tA0rkZQRHnLmkfbdUboBQekJ58j/si0K6zyg85SBo=;
        fh=cqT0Sm0iQHqDiDEsJ3ixFD44Q88e2AVQBWE8a4yA5Ck=;
        b=BCnfVRfeQBo1tm6GKYvQ3ZO7Ia12WLzfAxK2E9Tt8Bvcan2SlVzEGqpG7JrDfrSMzw
         QHamxWwtV+4EGqisRz4Rl1wV+RmOrfW9KWOSoP3taa7QYG6rgp7ufj4tTO8JpbitR/ql
         0x/6e9gSSWmyUssxKPmJLOlHkv69HuO2gD5knZwOh74O/6K2seW639KK+4zpropgvgS+
         LFLLm7fnGICYDSDrXQQ69fX9AfiPGs911TtEr/B/XAZ44wjqB3gAS8BNYAFs2wH0hDrw
         NAdGWUtcqGf8NvhlCoPnEZ079v3yBnkAjO9wdiJ2iz9+CcbAzvUCx9yl6P0VcTNZZkCm
         qieA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b79c7b35d2si12673336d6.240.2024.07.17.23.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 23:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sUKy5-0004yJ-WD; Thu, 18 Jul 2024 02:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKy4-0004vG-D9; Thu, 18 Jul 2024 02:50:20 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sUKy2-0004L5-6S; Thu, 18 Jul 2024 02:50:19 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 18 Jul
 2024 14:50:15 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 18 Jul 2024 14:49:50 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v1 01/15] aspeed/adc: Add AST2700 support
Date: Thu, 18 Jul 2024 14:49:11 +0800
Message-ID: <20240718064925.1846074-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
References: <20240718064925.1846074-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HPRBWoWDAqri

AST2700 and AST2600 ADC controllers are identical.
Introduce ast2700 class and set 2 engines.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/adc/aspeed_adc.c         | 16 ++++++++++++++++
 include/hw/adc/aspeed_adc.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
index 68bdbc73b0..48328ef891 100644
--- a/hw/adc/aspeed_adc.c
+++ b/hw/adc/aspeed_adc.c
@@ -398,6 +398,15 @@ static void aspeed_1030_adc_class_init(ObjectClass *klass, void *data)
     aac->nr_engines = 2;
 }
 
+static void aspeed_2700_adc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
+
+    dc->desc = "ASPEED 2700 ADC Controller";
+    aac->nr_engines = 2;
+}
+
 static const TypeInfo aspeed_adc_info = {
     .name = TYPE_ASPEED_ADC,
     .parent = TYPE_SYS_BUS_DEVICE,
@@ -430,6 +439,12 @@ static const TypeInfo aspeed_1030_adc_info = {
     .class_init = aspeed_1030_adc_class_init, /* No change since AST2600 */
 };
 
+static const TypeInfo aspeed_2700_adc_info = {
+    .name = TYPE_ASPEED_2700_ADC,
+    .parent = TYPE_ASPEED_ADC,
+    .class_init = aspeed_2700_adc_class_init,
+};
+
 static void aspeed_adc_register_types(void)
 {
     type_register_static(&aspeed_adc_engine_info);
@@ -438,6 +453,7 @@ static void aspeed_adc_register_types(void)
     type_register_static(&aspeed_2500_adc_info);
     type_register_static(&aspeed_2600_adc_info);
     type_register_static(&aspeed_1030_adc_info);
+    type_register_static(&aspeed_2700_adc_info);
 }
 
 type_init(aspeed_adc_register_types);
diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
index ff1d06ea91..f502f197ac 100644
--- a/include/hw/adc/aspeed_adc.h
+++ b/include/hw/adc/aspeed_adc.h
@@ -18,6 +18,7 @@
 #define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
 #define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
 #define TYPE_ASPEED_1030_ADC TYPE_ASPEED_ADC "-ast1030"
+#define TYPE_ASPEED_2700_ADC TYPE_ASPEED_ADC "-ast2700"
 OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
 
 #define TYPE_ASPEED_ADC_ENGINE "aspeed.adc.engine"
-- 
2.34.1


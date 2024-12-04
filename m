Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp33739njb;
        Wed, 4 Dec 2024 00:07:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCsP2JHh1c0QJULsYCcQZB/5xgQgEHHICTMB4m1PWlfmNsnmA1l/zALSygHOFiV4pcBJa/e13qGmcDDA==@linaro.org
X-Google-Smtp-Source: AGHT+IFGJ44efgTcwO9RkZm5BZVUWpFxGKmCoB4GXpNgI+/Z1wZBJpGJWhDCAms+YGwaHFFzSNAA
X-Received: by 2002:a05:6214:21eb:b0:6d8:b3a7:75af with SMTP id 6a1803df08f44-6d8b7426cadmr63109726d6.46.1733299630991;
        Wed, 04 Dec 2024 00:07:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733299630; cv=none;
        d=google.com; s=arc-20240605;
        b=H1aTsgpKV0ZpoKOf27rMGV+pmBXolj89Yqwmmx1XE/MVhjGudnel9dQrdn87g/dTWe
         hvU+V4UMx04qf/9ebWg4BVIOQRsJJL/iB3TC6q7cm/ufWJ1e4B1lUjTTCaPf4CL25TMq
         pUPYfRnuj34l7C+UQaHWdNHLFLc+sCii3a9/mqu9ka3wHOzhC6Z2uWNALxEZWkXyQe+0
         4sniTCpAwZ0L+WAhF/4Bj/lSB/uNmjK658GowQuzZgiRgXYSEmcOePakWh5aZeXr8gQA
         YKs/TXl3T6+7EhEyrQG5InKiHK2BVclHAgLq5hb/tfELG1PEoMFhnEPLqF4m5TN0VaAH
         k7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=U5VmLB+AjWtYjZ5aMKEX09mvDce6qy6G7HUywFEOuOQ=;
        fh=dcWtL3UV6hgfvVRRNBgcZIYWwd7971OyicJdpXZbSYo=;
        b=WEB64nzzMtakupRogrl6Entq+CqC69W9xBevt/8Rldky+UvAlE9m1/8/R2hXzldiwj
         4a5arGx20c2DSAQE1arcI6x81AQ4RFlHmNOw9O9pBXlBugTqqB2weL+rSsBaHxyzYSVc
         lRteI0odLtEobd5cAVcLjC4DlzKWiTXpfTfGqrFE06BpQq0giJlN+F0Gt7dDqCv8mk1/
         ifK+AGY2iaE0Eqwe5BLlauyyEanTDrv+frc5/Fi8N2KyVCy0G849Sc86n6Pu42ON1ff9
         WrAl/ithIhXfOzmeNHYwn8aalbuh6cCZbHMqUdR86LE4jFBNEuRYmxjLq+zIQ/UOJOYb
         mGqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8cbcfbcb8si8260556d6.247.2024.12.04.00.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:07:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIkOZ-0004I1-O8; Wed, 04 Dec 2024 03:06:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkOV-0004HP-4R; Wed, 04 Dec 2024 03:06:00 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tIkOQ-00082v-IM; Wed, 04 Dec 2024 03:05:58 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 4 Dec
 2024 16:05:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 4 Dec 2024 16:05:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v3 6/7] aspeed/soc: Support SDHCI for AST2700
Date: Wed, 4 Dec 2024 16:05:22 +0800
Message-ID: <20241204080523.4025780-7-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
References: <20241204080523.4025780-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 7ApuzzkyiEMv

Add SDHCI model for AST2700 SDHCI support. The SDHCI controller only support 1
slot and registers base address is start at 0x1408_0000 and its interrupt is
connected to GICINT133_INTC at bit 1.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index 63d1fcb086..baddd35ecf 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -65,6 +65,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_I2C]       =  0x14C0F000,
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
     [ASPEED_DEV_RTC]       =  0x12C0F000,
+    [ASPEED_DEV_SDHCI]     =  0x14080000,
 };
 
 #define AST2700_MAX_IRQ 256
@@ -113,6 +114,7 @@ static const int aspeed_soc_ast2700_irqmap[] = {
     [ASPEED_DEV_KCS]       = 128,
     [ASPEED_DEV_DP]        = 28,
     [ASPEED_DEV_I3C]       = 131,
+    [ASPEED_DEV_SDHCI]     = 133,
 };
 
 /* GICINT 128 */
@@ -158,6 +160,7 @@ static const int aspeed_soc_ast2700_gic132_intcmap[] = {
 
 /* GICINT 133 */
 static const int aspeed_soc_ast2700_gic133_intcmap[] = {
+    [ASPEED_DEV_SDHCI]     = 1,
     [ASPEED_DEV_PECI]      = 4,
 };
 
@@ -380,6 +383,14 @@ static void aspeed_soc_ast2700_init(Object *obj)
     object_initialize_child(obj, "gpio", &s->gpio, typename);
 
     object_initialize_child(obj, "rtc", &s->rtc, TYPE_ASPEED_RTC);
+
+    snprintf(typename, sizeof(typename), "aspeed.sdhci-%s", socname);
+    object_initialize_child(obj, "sd-controller", &s->sdhci, typename);
+    object_property_set_int(OBJECT(&s->sdhci), "num-slots", 1, &error_abort);
+
+    /* Init sd card slot class here so that they're under the correct parent */
+    object_initialize_child(obj, "sd-controller.sdhci",
+                            &s->sdhci.slots[0], TYPE_SYSBUS_SDHCI);
 }
 
 /*
@@ -681,6 +692,15 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_RTC));
 
+    /* SDHCI */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->sdhci), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sdhci), 0,
+                    sc->memmap[ASPEED_DEV_SDHCI]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->sdhci), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_SDHCI));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.34.1


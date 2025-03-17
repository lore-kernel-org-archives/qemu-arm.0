Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2053977njb;
        Mon, 17 Mar 2025 00:05:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWvTalP/r3R435qIlZfttsVkilBuHxz0WT3RBsGBqq/ZNW3e95B+gwd8/3BVUsSz1A4hwzXzKf523aNew==@linaro.org
X-Google-Smtp-Source: AGHT+IGzWwhmBHRh8acQA+NJmOGiLBjNKBm1TL+eTf5bs2oKP3MX0nhfs6nefesamgr6GdkM/E7C
X-Received: by 2002:ad4:5cc7:0:b0:6d4:19a0:202 with SMTP id 6a1803df08f44-6eaeaae38dbmr166365516d6.33.1742195131254;
        Mon, 17 Mar 2025 00:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742195131; cv=none;
        d=google.com; s=arc-20240605;
        b=hzkMRmHbQ1YHy19eNnCDEmFXNTEZwqY8R1lEdTBLaSiaR/AwjTANMdoLMazV8AlU3w
         /rq1u24kucAiAvnK9PbG0ydMJIvxKE7Ed0xhDcAQtrVYwzQPjCMzZAsDVPm4/66nKgKn
         fKp+3QqFmT75Rv5sEG9dcKtlynqAwdYCQjheKeemfZraz3YWzdW3HnKcm8w2r97T8jJF
         CMQa8d8Mha66B42y56wuxUMS9k4zE2t4YQ3Ctxlc+11IokavyRslyp3RsUGFdsBXbOpW
         IMgcIJJbiuv22McUxgqudcOAmi968zrB1x13pIMgX/SMHodukXGC+qD6piUUVTRSx42H
         Fr8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=t5pHnZJp5lXDtnmpoM4RmezeTu9G9qFD3Pu3fKWqZn8=;
        fh=3pwoN2jATzlbrF1hdgMWpXpxIEomk4/s3GQqt40kaGI=;
        b=HM14yeI0S+Qb4KWozRlNMNkYX7/rWIi9OnlMuvdfYTlzjXrO1jrjPLdrZej0r3HuLw
         8sz/OrmJG6fltGPHLUfXKOV+u33YKmb9BME9dw/t98eP0i1hb+8hBOr8On6RxV7hmqpM
         Rk2oiH6NujLdxl/xbvlwCYR78F1cownbesTubdIoO/zsA2VkufNZbEVjnDG8xiQypwia
         d4v0L8E4D2WFXcXeG9MW3djJOdwU5WoTQ9rCtSPFB5R4gzu220W6xFply8pG+d5yBfhu
         QNCSHMsEO4F1cBd+uTmu3Jm8F2qvnCB7GlalEfs8eoXi4xHtYmUXMhH5rJt+pjDohy4/
         4nAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade1de2b8si93704006d6.88.2025.03.17.00.05.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Mar 2025 00:05:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tu4XI-0002Ai-6x; Mon, 17 Mar 2025 03:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1tu4X3-00026J-7l; Mon, 17 Mar 2025 03:05:05 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1tu4X1-00027F-Bs; Mon, 17 Mar 2025 03:05:04 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 17 Mar
 2025 14:59:39 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 17 Mar 2025 14:59:39 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <yunlin.tang@aspeedtech.com>
Subject: [PATCH 2/2] hw/arm: ast27x0: Wire up EHCI controllers
Date: Mon, 17 Mar 2025 14:59:38 +0800
Message-ID: <20250317065938.1902272-2-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317065938.1902272-1-troy_lee@aspeedtech.com>
References: <20250317065938.1902272-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=troy_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Troy Lee <troy_lee@aspeedtech.com>
From:  Troy Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uymwvAdupHQY

AST27x0 has 4 EHCI controllers, where each CPU and I/O die has 2
instances. This patch use existing TYPE_PLATFORM_EHCI. After wiring up
the EHCI controller, the ast2700a1-evb can find up to 4 USB EHCI
interfaces.

ehci-platform 12061000.usb: EHCI Host Controller
ehci-platform 12061000.usb: new USB bus registered, assigned bus number 2
ehci-platform 12063000.usb: EHCI Host Controller
ehci-platform 12063000.usb: new USB bus registered, assigned bus number 3
ehci-platform 12061000.usb: irq 88, io mem 0x12061000
ehci-platform 12063000.usb: irq 90, io mem 0x12063000
ehci-platform 14121000.usb: EHCI Host Controller
ehci-platform 14123000.usb: EHCI Host Controller
ehci-platform 12061000.usb: USB 2.0 started, EHCI 1.00
ehci-platform 14121000.usb: new USB bus registered, assigned bus number 5
ehci-platform 14123000.usb: new USB bus registered, assigned bus number 6
ehci-platform 14121000.usb: irq 91, io mem 0x14121000
ehci-platform 14123000.usb: irq 92, io mem 0x14123000
ehci-platform 12063000.usb: USB 2.0 started, EHCI 1.00
usb usb2: Manufacturer: Linux 6.6.78-dirty-bafd2830c17c-gbafd2830c17c-dirty ehci_hcd
usb usb3: Manufacturer: Linux 6.6.78-dirty-bafd2830c17c-gbafd2830c17c-dirty ehci_hcd
ehci-platform 14121000.usb: USB 2.0 started, EHCI 1.00
usb usb5: Manufacturer: Linux 6.6.78-dirty-bafd2830c17c-gbafd2830c17c-dirty ehci_hcd
ehci-platform 14123000.usb: USB 2.0 started, EHCI 1.00
usb usb6: Manufacturer: Linux 6.6.78-dirty-bafd2830c17c-gbafd2830c17c-dirty ehci_hcd

Note that, AST27x0A0 only has 2 EHCI controllers due to hw issue.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c     | 28 ++++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h |  4 +++-
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index dce7255a2c..4ff4462ec1 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -25,6 +25,8 @@
 
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_SRAM]      =  0x10000000,
+    [ASPEED_DEV_EHCI1]     =  0x12061000,
+    [ASPEED_DEV_EHCI2]     =  0x12063000,
     [ASPEED_DEV_HACE]      =  0x12070000,
     [ASPEED_DEV_EMMC]      =  0x12090000,
     [ASPEED_DEV_INTC]      =  0x12100000,
@@ -47,6 +49,8 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_ETH2]      =  0x14060000,
     [ASPEED_DEV_ETH3]      =  0x14070000,
     [ASPEED_DEV_SDHCI]     =  0x14080000,
+    [ASPEED_DEV_EHCI3]     =  0x14121000,
+    [ASPEED_DEV_EHCI4]     =  0x14123000,
     [ASPEED_DEV_ADC]       =  0x14C00000,
     [ASPEED_DEV_SCUIO]     =  0x14C02000,
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
@@ -91,6 +95,8 @@ static const int aspeed_soc_ast2700a0_irqmap[] = {
     [ASPEED_DEV_TIMER7]    = 22,
     [ASPEED_DEV_TIMER8]    = 23,
     [ASPEED_DEV_DP]        = 28,
+    [ASPEED_DEV_EHCI1]     = 33,
+    [ASPEED_DEV_EHCI2]     = 37,
     [ASPEED_DEV_LPC]       = 128,
     [ASPEED_DEV_IBT]       = 128,
     [ASPEED_DEV_KCS]       = 128,
@@ -137,6 +143,8 @@ static const int aspeed_soc_ast2700a1_irqmap[] = {
     [ASPEED_DEV_TIMER7]    = 22,
     [ASPEED_DEV_TIMER8]    = 23,
     [ASPEED_DEV_DP]        = 28,
+    [ASPEED_DEV_EHCI1]     = 33,
+    [ASPEED_DEV_EHCI2]     = 37,
     [ASPEED_DEV_LPC]       = 192,
     [ASPEED_DEV_IBT]       = 192,
     [ASPEED_DEV_KCS]       = 192,
@@ -212,6 +220,8 @@ static const int ast2700_gic132_gic196_intcmap[] = {
     [ASPEED_DEV_UART10]    = 16,
     [ASPEED_DEV_UART11]    = 17,
     [ASPEED_DEV_UART12]    = 18,
+    [ASPEED_DEV_EHCI3]     = 28,
+    [ASPEED_DEV_EHCI4]     = 29,
 };
 
 /* GICINT 133 */
@@ -434,6 +444,11 @@ static void aspeed_soc_ast2700_init(Object *obj)
         object_initialize_child(obj, "spi[*]", &s->spi[i], typename);
     }
 
+    for (i = 0; i < sc->ehcis_num; i++) {
+        object_initialize_child(obj, "ehci[*]", &s->ehci[i],
+                                TYPE_PLATFORM_EHCI);
+    }
+
     snprintf(typename, sizeof(typename), "aspeed.sdmc-%s", socname);
     object_initialize_child(obj, "sdmc", &s->sdmc, typename);
     object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
@@ -709,6 +724,17 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
                         ASPEED_SMC_GET_CLASS(&s->spi[i])->flash_window_base);
     }
 
+    /* EHCI */
+    for (i = 0; i < sc->ehcis_num; i++) {
+        if (!sysbus_realize(SYS_BUS_DEVICE(&s->ehci[i]), errp)) {
+            return;
+        }
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->ehci[i]), 0,
+                        sc->memmap[ASPEED_DEV_EHCI1 + i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->ehci[i]), 0,
+                           aspeed_soc_get_irq(s, ASPEED_DEV_EHCI1 + i));
+    }
+
     /*
      * SDMC - SDRAM Memory Controller
      * The SDMC controller is unlocked at SPL stage.
@@ -900,6 +926,7 @@ static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, void *data)
     sc->silicon_rev  = AST2700_A0_SILICON_REV;
     sc->sram_size    = 0x20000;
     sc->spis_num     = 3;
+    sc->ehcis_num    = 2;
     sc->wdts_num     = 8;
     sc->macs_num     = 1;
     sc->uarts_num    = 13;
@@ -927,6 +954,7 @@ static void aspeed_soc_ast2700a1_class_init(ObjectClass *oc, void *data)
     sc->silicon_rev  = AST2700_A1_SILICON_REV;
     sc->sram_size    = 0x20000;
     sc->spis_num     = 3;
+    sc->ehcis_num    = 4;
     sc->wdts_num     = 8;
     sc->macs_num     = 3;
     sc->uarts_num    = 13;
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index f069d17d16..c1e80c8908 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -43,7 +43,7 @@
 #include "hw/intc/arm_gicv3.h"
 
 #define ASPEED_SPIS_NUM  3
-#define ASPEED_EHCIS_NUM 2
+#define ASPEED_EHCIS_NUM 4
 #define ASPEED_WDTS_NUM  8
 #define ASPEED_CPUS_NUM  4
 #define ASPEED_MACS_NUM  4
@@ -192,6 +192,8 @@ enum {
     ASPEED_DEV_SPI2,
     ASPEED_DEV_EHCI1,
     ASPEED_DEV_EHCI2,
+    ASPEED_DEV_EHCI3,
+    ASPEED_DEV_EHCI4,
     ASPEED_DEV_VIC,
     ASPEED_DEV_INTC,
     ASPEED_DEV_INTCIO,
-- 
2.43.0


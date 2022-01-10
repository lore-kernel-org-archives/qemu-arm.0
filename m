Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp690989lfj;
        Sun, 9 Jan 2022 23:51:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJcWDEwmCLZLN4oNcmqfAafEAJeER81A59WVD7gQzKjU6Jm65T39cTYL89nrRTrU9krOLr
X-Received: by 2002:a25:5ca:: with SMTP id 193mr86515256ybf.406.1641801100182;
        Sun, 09 Jan 2022 23:51:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641801100; cv=none;
        d=google.com; s=arc-20160816;
        b=b7+tloYRv6AYpcSAC4caEI75rW9v4tnPFxhenLLTjpOOHO+xFrLhYxdQyUtwAmFLyT
         ZqV3DUR7EAeV/0ExPsKJ12cQtApdtw4qIHpTN2WwJVAbCMpa0o++uFS1s3OTBZWRFuYy
         oyTQoERogZQHwHohiOaKL/MYQhU6bbxIt0MQJXX9OgAl+P9/gT5R/6IKO6GvJB7RA3bD
         32/N/LpPhloHXTYodBlKG+GHy1fdyI21masodN3pKfwXictzg/LF1bsfJybdKS4B4XTs
         95xXeL5L8E4tBoptli2D4I1uUBm69WwyFLEvB7vRkqkIVD0EQiAF0YU3BP4FoplO8Hvw
         Jp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=cJuZi2mit5RAFBTT1qvK8EDI2hqnOUaWpAw0Y9l/ri0=;
        b=Yw0TsV5hCPP9k6lkENufygjsr/3w9yUvwBH78R3rdWySzP/pjrTYjs0kntQ+6+QfAv
         vC2+R1gce3oPW85AAZm9u+m6S4uUViTTOx0N1tIHSSq+YyYShZ04aZHi3qPylMIuyzvZ
         WRsCTsHmd83fv4IbSoHl3mc29FIbY1TJomFmjblozPk73zDuVscatKggMqx4pbn1CGMe
         dOLOSZDX91hUxYpr1dLeXooCrLLmfRDZOZXfmws0BDmpWK/W/ZQfxwxvjle2qDagn3O/
         aG+blxfAfQvsZIikqusVVcJqZzS62z5W55TkayFfUWWLDChUVHEWKCH2PnfwZvS33F4D
         KFpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si4410442ybk.568.2022.01.09.23.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Jan 2022 23:51:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n6pSt-0006Um-L7
	for alex.bennee@linaro.org; Mon, 10 Jan 2022 02:51:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n6p0R-0004In-SX; Mon, 10 Jan 2022 02:22:16 -0500
Received: from twspam01.aspeedtech.com ([211.20.114.71]:31554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <troy_lee@aspeedtech.com>)
 id 1n6p0N-0002XW-G9; Mon, 10 Jan 2022 02:22:13 -0500
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 20A7Ewso025367;
 Mon, 10 Jan 2022 15:14:58 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 10 Jan
 2022 15:21:28 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 2/2] hw/arm/aspeed_ast2600: create i3c instance
Date: Mon, 10 Jan 2022 15:21:25 +0800
Message-ID: <20220110072125.1886683-3-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110072125.1886683-1-troy_lee@aspeedtech.com>
References: <20220110072125.1886683-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 20A7Ewso025367
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=troy_lee@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 hailin.wu@aspeedtech.com, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2FBtMnNaV9+M

This patch includes i3c instance in ast2600 soc.

v2: Rebase to mainline QEMU

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast2600.c     | 19 ++++++++++++++++++-
 include/hw/arm/aspeed_soc.h |  3 +++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e33483fb5d..36aa31601a 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -29,7 +29,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_PWM]       = 0x1E610000,
     [ASPEED_DEV_FMC]       = 0x1E620000,
     [ASPEED_DEV_SPI1]      = 0x1E630000,
-    [ASPEED_DEV_SPI2]      = 0x1E641000,
+    [ASPEED_DEV_SPI2]      = 0x1E631000,
     [ASPEED_DEV_EHCI1]     = 0x1E6A1000,
     [ASPEED_DEV_EHCI2]     = 0x1E6A3000,
     [ASPEED_DEV_MII1]      = 0x1E650000,
@@ -61,6 +61,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_UART1]     = 0x1E783000,
     [ASPEED_DEV_UART5]     = 0x1E784000,
     [ASPEED_DEV_VUART]     = 0x1E787000,
+    [ASPEED_DEV_I3C]       = 0x1E7A0000,
     [ASPEED_DEV_SDRAM]     = 0x80000000,
 };
 
@@ -108,6 +109,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_ETH4]      = 33,
     [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
     [ASPEED_DEV_DP]        = 62,
+    [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
 };
 
 static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
@@ -223,6 +225,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+
+    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
 }
 
 /*
@@ -523,6 +527,19 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+    /* I3C */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_I3C));
+    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                        sc->irqmap[ASPEED_DEV_I3C] + i);
+        /* The AST2600 I3C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
+    }
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 18fb7eed46..cae9906684 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -21,6 +21,7 @@
 #include "hw/timer/aspeed_timer.h"
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
+#include "hw/misc/aspeed_i3c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/misc/aspeed_hace.h"
 #include "hw/watchdog/wdt_aspeed.h"
@@ -51,6 +52,7 @@ struct AspeedSoCState {
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
+    AspeedI3CState i3c;
     AspeedSCUState scu;
     AspeedHACEState hace;
     AspeedXDMAState xdma;
@@ -141,6 +143,7 @@ enum {
     ASPEED_DEV_HACE,
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
+    ASPEED_DEV_I3C,
 };
 
 #endif /* ASPEED_SOC_H */
-- 
2.25.1


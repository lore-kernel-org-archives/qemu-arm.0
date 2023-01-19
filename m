Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp297008ejc;
        Thu, 19 Jan 2023 04:37:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtB65QPTkDn5Ua1jf8cN9yLQIsGtzeg9pffj/w+ScQZQGW6nnDHkG34aE6q7/g1vE9mlyf0
X-Received: by 2002:ac8:524f:0:b0:3b6:2e12:4d25 with SMTP id y15-20020ac8524f000000b003b62e124d25mr22184127qtn.31.1674131837561;
        Thu, 19 Jan 2023 04:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674131837; cv=none;
        d=google.com; s=arc-20160816;
        b=fK9Xs53wHKNUD3rhsaRc9uEY8jp7XNvec3JIQSev/L0izSqejg4JppkzqPTt6Pwj85
         f1rUZ9UyI7B75B04C3rgZE4bhaEe2pelZe6nBHLOIFY5ry1r1vjfh6P9W1zDQjHDMCUB
         G8xxey8tIZug1gqgh93mJGar6S3GPl88K7HVa0Vd+dHksIxVXpsf7L6AWW080l06X7rv
         TmJGCgRkaFeArH0/C3TDkpIq7MDXNSy86f897tZmqG9EgbP2Xw7dCehIkP+L8Mkz0dSP
         ysePAKvSfabmnXO6Sh75AC+WJZsGamNVtssLSccT/Sk4fEeFMO8xjWMK0bk7/h/MOL9/
         JqGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=ngvsRaVf5Dzmt7+rXgZqvscdURNeHO8PMNbv/nGbFDw=;
        b=UVUYGKniLHS5YdgCDx/dIV6qiHkpJ0Efb0MWuSDByZpSRO0qC7mn0+iNcElX1yfYao
         rXZF35nE7JFlY/eHMKqomj/JHwjbzMKeVSoLDo7HSslGAzOdVvZhcsfK/p2yarKtkn0R
         D3M5Zd9EeSp5AI2/NBRjTLtmI6uEwelhR4W6l5b1sjCh/WhGM/ReSWr2K7Q/E+wpTlZy
         WKqhE8hzTKs0iErUtWOK7f6QqlBs+n5ko3tPb9VuwKhw3y15wEL4C2r6/YAF6Bzp9htX
         SsDOY6jGez7h8s8oeiTfRsSmG/EW4w1XD1BhBimtnINJNgjWnF5buE7aDY1jQni0jgXo
         kTQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cq4-20020a05622a424400b003ab5fd4885asi22826650qtb.246.2023.01.19.04.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 04:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIU9L-0007XK-H9; Thu, 19 Jan 2023 07:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU9D-0007IC-4p; Thu, 19 Jan 2023 07:36:04 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org>)
 id 1pIU9A-0007fS-Qs; Thu, 19 Jan 2023 07:36:02 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4NyMYV0fVgz4xyV;
 Thu, 19 Jan 2023 23:35:58 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4NyMYS0PGRz4xHV;
 Thu, 19 Jan 2023 23:35:55 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 20/25] hw/arm/aspeed_ast10x0: Add various unimplemented
 peripherals
Date: Thu, 19 Jan 2023 13:34:44 +0100
Message-Id: <20230119123449.531826-21-clg@kaod.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119123449.531826-1-clg@kaod.org>
References: <20230119123449.531826-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=w1SB=5Q=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kVNx18wTV1c7

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Based on booting Zephyr demo from [1] running QEMU with
'-d unimp' and checking missing devices in [2].

[1] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
[2] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 11 +++++++++++
 hw/arm/aspeed_ast10x0.c     | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 8389200b2d..9a5e3c0bac 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -44,6 +44,7 @@
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
 #define ASPEED_UARTS_NUM 13
+#define ASPEED_JTAG_NUM  2
 
 struct AspeedSoCState {
     /*< private >*/
@@ -87,6 +88,11 @@ struct AspeedSoCState {
     UnimplementedDeviceState video;
     UnimplementedDeviceState emmc_boot_controller;
     UnimplementedDeviceState dpmcu;
+    UnimplementedDeviceState pwm;
+    UnimplementedDeviceState espi;
+    UnimplementedDeviceState udc;
+    UnimplementedDeviceState sgpiom;
+    UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
 };
 
 #define TYPE_ASPEED_SOC "aspeed-soc"
@@ -174,6 +180,11 @@ enum {
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
     ASPEED_DEV_I3C,
+    ASPEED_DEV_ESPI,
+    ASPEED_DEV_UDC,
+    ASPEED_DEV_SGPIOM,
+    ASPEED_DEV_JTAG0,
+    ASPEED_DEV_JTAG1,
 };
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index b483735dc2..b970a5ea58 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -27,10 +27,15 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_FMC]       = 0x7E620000,
     [ASPEED_DEV_SPI1]      = 0x7E630000,
     [ASPEED_DEV_SPI2]      = 0x7E640000,
+    [ASPEED_DEV_UDC]       = 0x7E6A2000,
     [ASPEED_DEV_SCU]       = 0x7E6E2000,
+    [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
+    [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
     [ASPEED_DEV_ADC]       = 0x7E6E9000,
+    [ASPEED_DEV_ESPI]      = 0x7E6EE000,
     [ASPEED_DEV_SBC]       = 0x7E6F2000,
     [ASPEED_DEV_GPIO]      = 0x7E780000,
+    [ASPEED_DEV_SGPIOM]    = 0x7E780500,
     [ASPEED_DEV_TIMER1]    = 0x7E782000,
     [ASPEED_DEV_UART1]     = 0x7E783000,
     [ASPEED_DEV_UART2]     = 0x7E78D000,
@@ -78,12 +83,17 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_LPC]       = 35,
     [ASPEED_DEV_PECI]      = 38,
     [ASPEED_DEV_FMC]       = 39,
+    [ASPEED_DEV_ESPI]      = 42,
     [ASPEED_DEV_PWM]       = 44,
     [ASPEED_DEV_ADC]       = 46,
     [ASPEED_DEV_SPI1]      = 65,
     [ASPEED_DEV_SPI2]      = 66,
     [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
+    [ASPEED_DEV_UDC]       = 9,
+    [ASPEED_DEV_SGPIOM]    = 51,
+    [ASPEED_DEV_JTAG0]     = 27,
+    [ASPEED_DEV_JTAG1]     = 53,
 };
 
 static qemu_irq aspeed_soc_ast1030_get_irq(AspeedSoCState *s, int dev)
@@ -154,6 +164,15 @@ static void aspeed_soc_ast1030_init(Object *obj)
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
                             TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "pwm", &s->pwm, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "espi", &s->espi, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "udc", &s->udc, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "sgpiom", &s->sgpiom,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "jtag[0]", &s->jtag[0],
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "jtag[1]", &s->jtag[1],
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
@@ -336,6 +355,22 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                     sc->memmap[ASPEED_DEV_GPIO]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpio), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_GPIO));
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->pwm), "aspeed.pwm",
+                                  sc->memmap[ASPEED_DEV_PWM], 0x100);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->espi), "aspeed.espi",
+                                  sc->memmap[ASPEED_DEV_ESPI], 0x800);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->udc), "aspeed.udc",
+                                  sc->memmap[ASPEED_DEV_UDC], 0x1000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->sgpiom), "aspeed.sgpiom",
+                                  sc->memmap[ASPEED_DEV_SGPIOM], 0x100);
+
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[0]), "aspeed.jtag",
+                                  sc->memmap[ASPEED_DEV_JTAG0], 0x20);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->jtag[1]), "aspeed.jtag",
+                                  sc->memmap[ASPEED_DEV_JTAG1], 0x20);
 }
 
 static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
-- 
2.39.0


Received: by 2002:a17:505:840c:b0:1be9:327d:8ee3 with SMTP id lq12csp728800njc;
        Wed, 12 Mar 2025 22:46:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxLd/GvSr8dcC32wFvIscAnAmFylKclzSUnjbRJaa4Rr0miMcNLD608CokI199FX1bqJYRBF6V+LAx4A==@linaro.org
X-Google-Smtp-Source: AGHT+IFPAY4JPG4AWWH5lTivxAxYK2UZ2brWthvXB23UzGJh/8dgjeUtIxSuHlItG2loLsFGgiuz
X-Received: by 2002:ad4:5490:0:b0:6ea:d033:2846 with SMTP id 6a1803df08f44-6ead0332b71mr71396306d6.25.1741844790680;
        Wed, 12 Mar 2025 22:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741844790; cv=none;
        d=google.com; s=arc-20240605;
        b=cwcF1ykadtCIU05JnMNo72XQw5yEDVfxsB9T53LNMMwU77wBmSghGGk8HH3Xd+xQCn
         d2iJWi7rhs5Kuk1/vC5CqfvyaZr70HxaCg6/eSGVSqGckeBQ9wRF90Jwea6S6mgWsMPY
         8/1wxNJQc9SrVzTrGwkgSp/3ZURLaIfyUcBFBvckoIOKGTVmGTqwXqjfRO4ydyHJ0aTr
         OxVSbW1YBccWkE22VlJO3jFhvSziTkhmRwl6r3fbvPLh5HxOXhGPJSvMyMRLCmMDLFfh
         C/tA4CDN5B6dSy+JyBmB9sUg5W5ExLxew1SfndWxXTZ6x5ankhLBH1RjuyjnD/OCcAIU
         8kLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=YO2Q95vkaLjc3hi1OoPuM+Sb9BrE5Svad6RMxL3icYI=;
        fh=NwMdySSevMv+4zB5gT5UiU9uLqpwDS+7odbjbNLg6yI=;
        b=PpSIJYX+ZgO+BooUqGo3MgB61RZQSLp10fOnyqp/xIAGBzMjhGJ5FYzgnTkNjjGB/F
         Qy89MNiopYfjZHqwgZzIEoKarcwDOARsvKDRBEDSlj5BcCCFmUQc08Fuz5c567vkYJyM
         bHhXgr6tX8AQzDSUjThrWejfiOOfoDfJyKVp6oupg9jomuHTvu+qzLPIoMFthpX1JucJ
         r5x+1wgUVMsL3uGhry7kED4o9HsF/8WruwvxhKsnIUoSyVfVO/vGr2phc/ZSL36+K6Tm
         sf5PaqHwpVk58Qb8wGrkq3yCaKcS8TrfCO34z6+Ro/7iuXxPXiV0ZqgTehxWBtSGXOkD
         Kenw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eade2123fasi9669916d6.127.2025.03.12.22.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Mar 2025 22:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tsbOb-0004tI-Jt; Thu, 13 Mar 2025 01:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbO4-0004n5-FN; Thu, 13 Mar 2025 01:45:50 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tsbO2-0005Ve-Bq; Thu, 13 Mar 2025 01:45:43 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 13 Mar
 2025 13:40:21 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 13 Mar 2025 13:40:21 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <yunlin.tang@aspeedtech.com>
Subject: [PATCH 01/13] aspeed: ast27x0: Map unimplemented devices in SoC memory
Date: Thu, 13 Mar 2025 13:40:05 +0800
Message-ID: <20250313054020.2583556-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
References: <20250313054020.2583556-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Xh6M13+bpaMe

Maps following unimplemented devices in SoC memory
- dpmcu
- iomem
- iomem0
- iomem1
- ltpi

Iomem, Iomem0 and Iomem1 include unimplemented controllers in the
memory ranges 0x0 - 0x1000000, 0x120000000 - 0x121000000 and
0x14000000 - 0x141000000.

For instance:
- USB hub at 0x12010000
- eSPI at 0x14C5000
- PWM at 0x140C0000

DPMCU stands for Display Port MCU controller. LTPI is used to connect
to AST1700.
AST1700 is an I/O expander that supports the DC-SCM 2.1 LTPI protocol.
It provides AST2700 with additional GPIO, UART, I3C, and other
interfaces.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: Iea6c11651c40e341a395b6dbb81975ea2639aebd
---
 include/hw/arm/aspeed_soc.h |  6 +++++
 hw/arm/aspeed_ast27x0.c     | 51 ++++++++++++++++++++++++++++++++-----
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index f899356ed9..c46ec6302d 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -90,6 +90,8 @@ struct AspeedSoCState {
     SerialMM uart[ASPEED_UARTS_NUM];
     Clock *sysclk;
     UnimplementedDeviceState iomem;
+    UnimplementedDeviceState iomem0;
+    UnimplementedDeviceState iomem1;
     UnimplementedDeviceState video;
     UnimplementedDeviceState emmc_boot_controller;
     UnimplementedDeviceState dpmcu;
@@ -97,6 +99,7 @@ struct AspeedSoCState {
     UnimplementedDeviceState espi;
     UnimplementedDeviceState udc;
     UnimplementedDeviceState sgpiom;
+    UnimplementedDeviceState ltpi;
     UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
     AspeedAPB2OPBState fsi[2];
 };
@@ -171,6 +174,9 @@ const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
 enum {
     ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
+    ASPEED_DEV_IOMEM0,
+    ASPEED_DEV_IOMEM1,
+    ASPEED_DEV_LTPI,
     ASPEED_DEV_UART0,
     ASPEED_DEV_UART1,
     ASPEED_DEV_UART2,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index dce7255a2c..a3fe2582f8 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -23,8 +23,16 @@
 #include "qobject/qlist.h"
 #include "qemu/log.h"
 
+#define AST2700_SOC_IO_SIZE          0x01000000
+#define AST2700_SOC_IOMEM_SIZE       0x01000000
+#define AST2700_SOC_DPMCU_SIZE       0x00040000
+#define AST2700_SOC_LTPI_SIZE        0x01000000
+
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
+    [ASPEED_DEV_IOMEM]     =  0x00000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
+    [ASPEED_DEV_DPMCU]     =  0x11000000,
+    [ASPEED_DEV_IOMEM0]    =  0x12000000,
     [ASPEED_DEV_HACE]      =  0x12070000,
     [ASPEED_DEV_EMMC]      =  0x12090000,
     [ASPEED_DEV_INTC]      =  0x12100000,
@@ -36,6 +44,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_TIMER1]    =  0x12C10000,
     [ASPEED_DEV_SLI]       =  0x12C17000,
     [ASPEED_DEV_UART4]     =  0X12C1A000,
+    [ASPEED_DEV_IOMEM1]    =  0x14000000,
     [ASPEED_DEV_FMC]       =  0x14000000,
     [ASPEED_DEV_SPI0]      =  0x14010000,
     [ASPEED_DEV_SPI1]      =  0x14020000,
@@ -68,6 +77,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_UART12]    =  0X14C33B00,
     [ASPEED_DEV_WDT]       =  0x14C37000,
     [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
+    [ASPEED_DEV_LTPI]      =  0x300000000,
     [ASPEED_DEV_SDRAM]     =  0x400000000,
 };
 
@@ -491,6 +501,16 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+    object_initialize_child(obj, "dpmcu", &s->dpmcu,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "ltpi", &s->ltpi,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "iomem", &s->iomem,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "iomem0", &s->iomem0,
+                            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "iomem1", &s->iomem1,
+                            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 /*
@@ -526,8 +546,10 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(gicbusdev, errp)) {
         return false;
     }
-    sysbus_mmio_map(gicbusdev, 0, sc->memmap[ASPEED_GIC_DIST]);
-    sysbus_mmio_map(gicbusdev, 1, sc->memmap[ASPEED_GIC_REDIST]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->gic), 0,
+                    sc->memmap[ASPEED_GIC_DIST]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->gic), 1,
+                    sc->memmap[ASPEED_GIC_REDIST]);
 
     for (i = 0; i < sc->num_cpus; i++) {
         DeviceState *cpudev = DEVICE(&a->cpu[i]);
@@ -876,11 +898,26 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
 
-    create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
-    create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
-    create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-    create_unimplemented_device("ast2700.ltpi", 0x30000000, 0x1000000);
-    create_unimplemented_device("ast2700.io", 0x0, 0x4000000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->dpmcu),
+                                  "aspeed.dpmcu",
+                                  sc->memmap[ASPEED_DEV_DPMCU],
+                                  AST2700_SOC_DPMCU_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->ltpi),
+                                  "aspeed.ltpi",
+                                  sc->memmap[ASPEED_DEV_LTPI],
+                                  AST2700_SOC_LTPI_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem),
+                                  "aspeed.io",
+                                  sc->memmap[ASPEED_DEV_IOMEM],
+                                  AST2700_SOC_IO_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem0),
+                                  "aspeed.iomem0",
+                                  sc->memmap[ASPEED_DEV_IOMEM0],
+                                  AST2700_SOC_IOMEM_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem1),
+                                  "aspeed.iomem1",
+                                  sc->memmap[ASPEED_DEV_IOMEM1],
+                                  AST2700_SOC_IOMEM_SIZE);
 }
 
 static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, void *data)
-- 
2.34.1


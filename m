Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp749097njj;
        Fri, 2 May 2025 03:37:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXL0ikESIMF7x+4aDsodSKBAaRJHMWyujLmdfsBCMJUkvwFIrw1T0eC+veosz96qco2i9jqtn5osBMpMg==@linaro.org
X-Google-Smtp-Source: AGHT+IHxgkxnWLSeCXIpAzNynVl/NJ++12U6c1wGVY/xrxnatTaRUjejE9X5CZ5nku4//HZGHtb/
X-Received: by 2002:a05:6000:2585:b0:390:ec6e:43ea with SMTP id ffacd0b85a97d-3a094038f02mr4305819f8f.15.1746182228645;
        Fri, 02 May 2025 03:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746182228; cv=none;
        d=google.com; s=arc-20240605;
        b=Q7S2LMDvaaEVDnYcbOgKqXBs6rwA1SiM1p4ppUOE2KhbixdKbHZMr33dUBMpSl6ou0
         sjG9WIm4me+PoeurO22nOubAwEpZYcKPyY564Nj8Quh+Vp4H3sBJVR8KUzR6j+D5qJNx
         X6azfz0mib9G0zvX4QmVNClYU+cNI64/I2JtHpAofDy+zLyLfoE6uVe8uyuB7pESNquz
         IoeErfNB4rQPbTLLJW1oxbTIYm4m8L6sQsZrByi3OnW83UYYRVM2pgvhUBiD1nTETYtU
         4KSiHDXuY5HVvccS76VJGbQEMZo4ISXu4saAwUtgRUE54oa1PWrQpblVA026z3I2leHT
         WHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=kEqnUWHfUhlkersrO5Kybcyh58b6KKqLCfgl3LLTUGM=;
        fh=vQPqsNMqoAlDx9Lray1TJhxW/ME1Lx6izgi/4Tj22z8=;
        b=GW7ryjmPlLimRIat151dSL3LXVgZ2yQiL3Y3UQ5GIrcn1OnYJbhN/oCV7/oi+9EDkM
         KinnjMZs+1huWOu0PT6fD+mm0dJ051gu7/HFmsxGAFoJ7YJ5gLNFYESXojSyHlbIkt4X
         pZGKTX6DG337uanpI0jW7IY1PXadbmJIM8uoZfncVEI78/GOH+7m844D4nZgnX7zt2G0
         tZpX2aSfx7Ziw2clY6pnyWt+UIpB5MIdRSQ2cUUPCkyf7hPUVV8OTTjfjVemsGZ0KFBc
         1F5JOkyBcL9TqN9lPKzWesLPER63PtRTz2AEYmDBqNF47jjLWN7hMy8bbcFTQrer7G51
         5iRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099b100b3si946286f8f.685.2025.05.02.03.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uAnjr-00085h-Ci; Fri, 02 May 2025 06:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uAnjU-00080N-AN; Fri, 02 May 2025 06:35:04 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uAnjR-0005yi-V1; Fri, 02 May 2025 06:35:03 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 2 May
 2025 18:34:50 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 2 May 2025 18:34:50 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v4 1/9] aspeed: ast27x0: Map unimplemented devices in SoC
 memory
Date: Fri, 2 May 2025 18:34:37 +0800
Message-ID: <20250502103449.3091642-2-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502103449.3091642-1-steven_lee@aspeedtech.com>
References: <20250502103449.3091642-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: k7NPEtOAf2Tc

Maps following unimplemented devices in SoC memory
- dpmcu
- iomem
- iomem0
- iomem1
- ltpi

Iomem, Iomem0 and Iomem1 include unimplemented controllers in the memory ranges 0x0 - 0x1000000, 0x120000000 - 0x121000000 and
0x14000000 - 0x141000000.

For instance:
- USB hub at 0x12010000
- eSPI at 0x14C5000
- PWM at 0x140C0000

DPMCU stands for Display Port MCU controller. LTPI is used to connect to AST1700.
AST1700 is an I/O expander that supports the DC-SCM 2.1 LTPI protocol.
It provides AST2700 with additional GPIO, UART, I3C, and other interfaces.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: Iae4db49a4818af3e2c43c16a27fc76329d2405d6
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed_soc.h |  6 +++++
 hw/arm/aspeed_ast27x0.c     | 52 ++++++++++++++++++++++++++++++++-----
 2 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 4dcb1010dc..5fcfd2fe2e 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -91,6 +91,8 @@ struct AspeedSoCState {
     SerialMM uart[ASPEED_UARTS_NUM];
     Clock *sysclk;
     UnimplementedDeviceState iomem;
+    UnimplementedDeviceState iomem0;
+    UnimplementedDeviceState iomem1;
     UnimplementedDeviceState video;
     UnimplementedDeviceState emmc_boot_controller;
     UnimplementedDeviceState dpmcu;
@@ -98,6 +100,7 @@ struct AspeedSoCState {
     UnimplementedDeviceState espi;
     UnimplementedDeviceState udc;
     UnimplementedDeviceState sgpiom;
+    UnimplementedDeviceState ltpi;
     UnimplementedDeviceState jtag[ASPEED_JTAG_NUM];
     AspeedAPB2OPBState fsi[2];
 };
@@ -173,6 +176,9 @@ enum {
     ASPEED_DEV_VBOOTROM,
     ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
+    ASPEED_DEV_IOMEM0,
+    ASPEED_DEV_IOMEM1,
+    ASPEED_DEV_LTPI,
     ASPEED_DEV_UART0,
     ASPEED_DEV_UART1,
     ASPEED_DEV_UART2,
diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index a289e65e49..21769669df 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -23,9 +23,17 @@
 #include "qobject/qlist.h"
 #include "qemu/log.h"
 
+#define AST2700_SOC_IO_SIZE          0x01000000
+#define AST2700_SOC_IOMEM_SIZE       0x01000000
+#define AST2700_SOC_DPMCU_SIZE       0x00040000
+#define AST2700_SOC_LTPI_SIZE        0x01000000
+
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
+    [ASPEED_DEV_IOMEM]     =  0x00000000,
     [ASPEED_DEV_VBOOTROM]  =  0x00000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
+    [ASPEED_DEV_DPMCU]     =  0x11000000,
+    [ASPEED_DEV_IOMEM0]    =  0x12000000,
     [ASPEED_DEV_EHCI1]     =  0x12061000,
     [ASPEED_DEV_EHCI2]     =  0x12063000,
     [ASPEED_DEV_HACE]      =  0x12070000,
@@ -39,6 +47,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_TIMER1]    =  0x12C10000,
     [ASPEED_DEV_SLI]       =  0x12C17000,
     [ASPEED_DEV_UART4]     =  0X12C1A000,
+    [ASPEED_DEV_IOMEM1]    =  0x14000000,
     [ASPEED_DEV_FMC]       =  0x14000000,
     [ASPEED_DEV_SPI0]      =  0x14010000,
     [ASPEED_DEV_SPI1]      =  0x14020000,
@@ -73,6 +82,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_UART12]    =  0X14C33B00,
     [ASPEED_DEV_WDT]       =  0x14C37000,
     [ASPEED_DEV_SPI_BOOT]  =  0x100000000,
+    [ASPEED_DEV_LTPI]      =  0x300000000,
     [ASPEED_DEV_SDRAM]     =  0x400000000,
 };
 
@@ -507,6 +517,16 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
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
@@ -542,8 +562,11 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
     if (!sysbus_realize(gicbusdev, errp)) {
         return false;
     }
-    sysbus_mmio_map(gicbusdev, 0, sc->memmap[ASPEED_GIC_DIST]);
-    sysbus_mmio_map(gicbusdev, 1, sc->memmap[ASPEED_GIC_REDIST]);
+
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->gic), 0,
+                    sc->memmap[ASPEED_GIC_DIST]);
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&a->gic), 1,
+                    sc->memmap[ASPEED_GIC_REDIST]);
 
     for (i = 0; i < sc->num_cpus; i++) {
         DeviceState *cpudev = DEVICE(&a->cpu[i]);
@@ -911,11 +934,26 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
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
 
 static void aspeed_soc_ast2700a0_class_init(ObjectClass *oc, const void *data)
-- 
2.34.1


Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5012200njk;
        Tue, 24 Dec 2024 18:09:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX4NKwPtJjGQQw4Zz3DD1TJZhA4OrWga3lqLj2476zmS2ilZr+z0DM9Q8R38kHs28XljntVFy2vHlQi8g==@linaro.org
X-Google-Smtp-Source: AGHT+IFama95xlKLZ2wm4v8+l30xjCoCHbHQswMQ356EeqPU2kl8/2maWn4EtdenBNHvwz8vPMBg
X-Received: by 2002:a05:622a:1492:b0:467:8765:51ae with SMTP id d75a77b69052e-46a4a97042fmr356550281cf.39.1735092562631;
        Tue, 24 Dec 2024 18:09:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735092562; cv=none;
        d=google.com; s=arc-20240605;
        b=A5xY1vez+GY4G0KVCS/XVvM/3MKT0uRLjU0D+gGI8sJ4Gcpcik0a7tdu5MAPh9UDdR
         Gh6kNMktc9yE8MliUHJPdYKJCCNl65RAfX65hX9j/DQbnp1nxgNBuC1MtgLwPEttENwp
         WKM/oj87qW6/Pn/lO/+4a8yx/MzPtISikz/6CMa8kB/4zM6yWYCaS5jb+4l2C+uSFzlH
         dAnNUgcHS1k6QXLbd4rde8I451pxKsd8VnBVH73P3O8Ywxizac+mZgkXocxDnYoKyubt
         J0ec7sK6fIfiF2F6jDfLZmOAwigjUIvfG/e69SnQBHW6nxtxQpwNVCyqeMYMTFE2lfdQ
         J+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Ovn7mFfHV0f4HAAxPhj/S/B/VqbSshHtFUJMOOcVm9U=;
        fh=6s1QC7yDVMwxtLiXCOqIXsaBZ0NU8/0BFNqJIfybTQk=;
        b=WBP3AV02iK1V7/nb81aj3eCc48lsmHrizhrDQ19hrAfam736if6+wGu5i4u3ej2jVu
         AnKCN8vROlsPnGv8UEoIDlTtHeG/bN/qafW4pSFNNGG/TlGmqIFscVdvufwJZ2ziOsqd
         g/pzbwhTYOZihOrLQOEBZENsHIVdr6DO5hfYmO4l68UbksyXZ7CzipdBzyzE0/DAAZ3y
         FKiFF8B0Me/7+2qBou72huNxFV+Tv+poLVCtWRE+Yl18yn+UCFuYzTe3gVZKAcdxmOgu
         bTbgaqHjBY0SRhofHPtEnYarXlttoLk/2LdkR+vnaw41ODqQoPjdwcbcyKDe7lSYYLYx
         Xqgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebd5d40si138307291cf.515.2024.12.24.18.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Dec 2024 18:09:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQGp9-00080z-Eo; Tue, 24 Dec 2024 21:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tQGp6-000808-Mi; Tue, 24 Dec 2024 21:08:32 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1tQGp5-0002ew-A6; Tue, 24 Dec 2024 21:08:32 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 25 Dec
 2024 10:03:13 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 25 Dec 2024 10:03:13 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH 2/5] aspeed: ast27x0: Map unimplemented devices in SoC memory
Date: Wed, 25 Dec 2024 10:03:08 +0800
Message-ID: <20241225020311.3718080-3-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241225020311.3718080-1-steven_lee@aspeedtech.com>
References: <20241225020311.3718080-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: eHhCBhpfUPvz

Maps following unimplemented devices in SoC memory
- dpmcu
- iomem0
- iomem1
- ltpi
- io

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
---
 hw/arm/aspeed_ast27x0.c     | 45 +++++++++++++++++++++++++++++++------
 include/hw/arm/aspeed_soc.h |  6 +++++
 2 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index fee3755837..fd09872403 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -23,11 +23,19 @@
 #include "qapi/qmp/qlist.h"
 #include "qemu/log.h"
 
+#define AST2700_SOC_IO_SIZE          0x04000000
+#define AST2700_SOC_IOMEM_SIZE       0x01000000
+#define AST2700_SOC_DPMCU_SIZE       0x00040000
+#define AST2700_SOC_LTPI_SIZE        0x01000000
+
 static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_SPI_BOOT]  =  0x400000000,
+    [ASPEED_DEV_IOMEM]     =  0x00000000,
     [ASPEED_DEV_SRAM]      =  0x10000000,
+    [ASPEED_DEV_IOMEM0]    =  0x12000000,
     [ASPEED_DEV_SDMC]      =  0x12C00000,
     [ASPEED_DEV_SCU]       =  0x12C02000,
+    [ASPEED_DEV_IOMEM1]    =  0x14000000,
     [ASPEED_DEV_SCUIO]     =  0x14C02000,
     [ASPEED_DEV_UART0]     =  0X14C33000,
     [ASPEED_DEV_UART1]     =  0X14C33100,
@@ -66,6 +74,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_GPIO]      =  0x14C0B000,
     [ASPEED_DEV_RTC]       =  0x12C0F000,
     [ASPEED_DEV_SDHCI]     =  0x14080000,
+    [ASPEED_DEV_LTPI]      =  0x30000000,
 };
 
 #define AST2700_MAX_IRQ 256
@@ -397,6 +406,14 @@ static void aspeed_soc_ast2700_init(Object *obj)
 
     object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.slots[0],
                             TYPE_SYSBUS_SDHCI);
+
+    object_initialize_child(obj, "dpmcu", &s->dpmcu, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "ltpi", &s->ltpi, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "io", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "iomem0", &s->iomem0,
+            TYPE_UNIMPLEMENTED_DEVICE);
+    object_initialize_child(obj, "iomem1", &s->iomem1,
+            TYPE_UNIMPLEMENTED_DEVICE);
 }
 
 /*
@@ -432,8 +449,10 @@ static bool aspeed_soc_ast2700_gic_realize(DeviceState *dev, Error **errp)
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
@@ -716,11 +735,23 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
 
-    create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
-    create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
-    create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-    create_unimplemented_device("ast2700.ltpi", 0x30000000, 0x1000000);
-    create_unimplemented_device("ast2700.io", 0x0, 0x4000000);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->dpmcu), "aspeed.dpmcu",
+                                  sc->memmap[ASPEED_DEV_DPMCU],
+                                  AST2700_SOC_DPMCU_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->ltpi), "aspeed.ltpi",
+                                  sc->memmap[ASPEED_DEV_LTPI],
+                                  AST2700_SOC_LTPI_SIZE);
+    aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
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
 
 static void aspeed_soc_ast2700_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 689f52dae8..bf885da3fc 100644
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
@@ -172,6 +175,9 @@ const char *aspeed_soc_cpu_type(AspeedSoCClass *sc);
 enum {
     ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
+    ASPEED_DEV_IOMEM0,
+    ASPEED_DEV_IOMEM1,
+    ASPEED_DEV_LTPI,
     ASPEED_DEV_UART0,
     ASPEED_DEV_UART1,
     ASPEED_DEV_UART2,
-- 
2.34.1


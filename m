Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp11781ejc;
        Thu, 2 Mar 2023 09:43:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+odjhkWkiONypEFMa50hFFWXQbDm0Z1WL2KgJHwQckZJ4MVhSuk747Locwvi/hw2M5vrRh
X-Received: by 2002:ac8:5e49:0:b0:3bd:1bbc:8d8e with SMTP id i9-20020ac85e49000000b003bd1bbc8d8emr19578280qtx.0.1677779009975;
        Thu, 02 Mar 2023 09:43:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677779009; cv=none;
        d=google.com; s=arc-20160816;
        b=CSgjTayPcvnrQUrpHs+w8YolepvSmQXY8JUoJL2dz3ci7qs8PmjUWB+9tNzlTc41Uk
         FhbZv0x+IRbUXLjzU3J1D7d9KWPVbMD1SgM1Mg5N5ZXBtQOjO4PXPgJ95X7jNROZobV5
         KKwxW416QOwR60O1WyYhFyTKYveCqo70BT+zm3fXGMOV1NWtlJHvT6sHmWtB65bqPdC5
         V1UF7D9VGWz9qjsaeLZkFeY6sj8fjLXzjGCPWN19vt+CTP5ZTafCr01XaOA+RLUXFp1o
         z4YxdUTBLONzZXxfFA28hdxGUBkp8ObgdWrO6u0bSN19t5IwCZr+Y7plD0NF6F6awpak
         dKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=zh1zHkf3JcslRREQYRaiBO8YMYltOIDGnHcdBhReuGo=;
        b=hofGGNFdrnFOulrf7IIDfK+VuQ9S/k0fAz9Y2orJq9gxUMdcJr7ckzcBsStfYPE2Id
         kvuu8mN1O7TPX0JTmDZW4g1R0M4qeoxdS4D2SPXOk6b6vMc/MxN7pZxQDMsmUC0IIVY9
         BQJ/Djs7lgdqwbSEY66xZQe9VWGRDYjx7oMfjGQe6XHOjfUVmgV9OmQykCik2ITWnAy5
         RV5cFJeS/wsiQO+aDxfXm06MddQ41vSOru/79L6Q9wuTBQQ03Mz+UM6XQOjF3QTnkdAw
         Gu6c0a8BpfwlFZr5JH9rMvzJl3KYNL2WuzQ0IrNQcoP80BYXuCk1tUfnBFT9m8pz/KFL
         cWBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4-20020a05622a134400b003b9bc94c065si95056qtk.388.2023.03.02.09.43.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 09:43:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXmxM-0005SU-RV; Thu, 02 Mar 2023 12:43:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmx2-0004zI-3q; Thu, 02 Mar 2023 12:42:45 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=Cwst=62=kaod.org=clg@ozlabs.org>)
 id 1pXmwy-0002nD-Lf; Thu, 02 Mar 2023 12:42:43 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PSJMx3ZW8z4x80;
 Fri,  3 Mar 2023 04:42:37 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSJMv4fKcz4x5X;
 Fri,  3 Mar 2023 04:42:35 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/11] aspeed: Introduce a spi_boot region under the SoC
Date: Thu,  2 Mar 2023 18:42:04 +0100
Message-Id: <20230302174206.2434673-10-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302174206.2434673-1-clg@kaod.org>
References: <20230302174206.2434673-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=Cwst=62=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: hCTzGIQynzrc

The default boot address of the Aspeed SoCs is 0x0. For this reason,
the FMC flash device contents are remapped by HW on the first 256MB of
the address space. In QEMU, this is currently done in the machine init
with the setup of a region alias.

Move this code to the SoC and introduce an extra container to prepare
ground for the boot ROM region which will overlap the FMC flash
remapping.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  5 +++++
 hw/arm/aspeed.c             | 13 +------------
 hw/arm/aspeed_ast2600.c     | 13 +++++++++++++
 hw/arm/aspeed_soc.c         | 14 ++++++++++++++
 hw/arm/fby35.c              |  8 +-------
 5 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index bd1e03e78a..8adff70072 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -58,6 +58,8 @@ struct AspeedSoCState {
     MemoryRegion *dram_mr;
     MemoryRegion dram_container;
     MemoryRegion sram;
+    MemoryRegion spi_boot_container;
+    MemoryRegion spi_boot;
     AspeedVICState vic;
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
@@ -120,6 +122,7 @@ struct AspeedSoCClass {
 
 
 enum {
+    ASPEED_DEV_SPI_BOOT,
     ASPEED_DEV_IOMEM,
     ASPEED_DEV_UART1,
     ASPEED_DEV_UART2,
@@ -190,6 +193,8 @@ enum {
     ASPEED_DEV_JTAG1,
 };
 
+#define ASPEED_SOC_SPI_BOOT_ADDR 0x0
+
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
 bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp);
 void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cb59a37b07..4a2814b7ea 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -388,18 +388,7 @@ static void aspeed_machine_init(MachineState *machine)
         MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
         uint64_t size = memory_region_size(&fl->mmio);
 
-        /*
-         * create a ROM region using the default mapping window size of
-         * the flash module. The window size is 64MB for the AST2400
-         * SoC and 128MB for the AST2500 SoC, which is twice as big as
-         * needed by the flash modules of the Aspeed machines.
-         */
-        if (ASPEED_MACHINE(machine)->mmio_exec) {
-            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
-                                     &fl->mmio, 0, size);
-            memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
-                                        boot_rom);
-        } else {
+        if (!ASPEED_MACHINE(machine)->mmio_exec) {
             memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
                                    size, &error_abort);
             memory_region_add_subregion(get_system_memory(), FIRMWARE_ADDR,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index bb2769df04..1bf1246148 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -21,6 +21,7 @@
 #define ASPEED_SOC_DPMCU_SIZE       0x00040000
 
 static const hwaddr aspeed_soc_ast2600_memmap[] = {
+    [ASPEED_DEV_SPI_BOOT]  = ASPEED_SOC_SPI_BOOT_ADDR,
     [ASPEED_DEV_SRAM]      = 0x10000000,
     [ASPEED_DEV_DPMCU]     = 0x18000000,
     /* 0x16000000     0x17FFFFFF : AHB BUS do LPC Bus bridge */
@@ -282,6 +283,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     qemu_irq irq;
     g_autofree char *sram_name = NULL;
 
+    /* Default boot region (SPI memory or ROMs) */
+    memory_region_init(&s->spi_boot_container, OBJECT(s),
+                       "aspeed.spi_boot_container", 0x10000000);
+    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SPI_BOOT],
+                                &s->spi_boot_container);
+
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
                                   sc->memmap[ASPEED_DEV_IOMEM],
@@ -431,6 +438,12 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
 
+    /* Set up an alias on the FMC CE0 region (boot default) */
+    MemoryRegion *fmc0_mmio = &s->fmc.flashes[0].mmio;
+    memory_region_init_alias(&s->spi_boot, OBJECT(s), "aspeed.spi_boot",
+                             fmc0_mmio, 0, memory_region_size(fmc0_mmio));
+    memory_region_add_subregion(&s->spi_boot_container, 0x0, &s->spi_boot);
+
     /* SPI */
     for (i = 0; i < sc->spis_num; i++) {
         object_property_set_link(OBJECT(&s->spi[i]), "dram",
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index e884d6badc..bf22258de9 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -25,6 +25,7 @@
 #define ASPEED_SOC_IOMEM_SIZE       0x00200000
 
 static const hwaddr aspeed_soc_ast2400_memmap[] = {
+    [ASPEED_DEV_SPI_BOOT]  =  ASPEED_SOC_SPI_BOOT_ADDR,
     [ASPEED_DEV_IOMEM]  = 0x1E600000,
     [ASPEED_DEV_FMC]    = 0x1E620000,
     [ASPEED_DEV_SPI1]   = 0x1E630000,
@@ -59,6 +60,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
 };
 
 static const hwaddr aspeed_soc_ast2500_memmap[] = {
+    [ASPEED_DEV_SPI_BOOT]  = ASPEED_SOC_SPI_BOOT_ADDR,
     [ASPEED_DEV_IOMEM]  = 0x1E600000,
     [ASPEED_DEV_FMC]    = 0x1E620000,
     [ASPEED_DEV_SPI1]   = 0x1E630000,
@@ -245,6 +247,12 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     g_autofree char *sram_name = NULL;
 
+    /* Default boot region (SPI memory or ROMs) */
+    memory_region_init(&s->spi_boot_container, OBJECT(s),
+                       "aspeed.spi_boot_container", 0x10000000);
+    memory_region_add_subregion(s->memory, sc->memmap[ASPEED_DEV_SPI_BOOT],
+                                &s->spi_boot_container);
+
     /* IO space */
     aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
                                   sc->memmap[ASPEED_DEV_IOMEM],
@@ -354,6 +362,12 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_FMC));
 
+    /* Set up an alias on the FMC CE0 region (boot default) */
+    MemoryRegion *fmc0_mmio = &s->fmc.flashes[0].mmio;
+    memory_region_init_alias(&s->spi_boot, OBJECT(s), "aspeed.spi_boot",
+                             fmc0_mmio, 0, memory_region_size(fmc0_mmio));
+    memory_region_add_subregion(&s->spi_boot_container, 0x0, &s->spi_boot);
+
     /* SPI */
     for (i = 0; i < sc->spis_num; i++) {
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->spi[i]), errp)) {
diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
index 90c04bbc33..f4600c290b 100644
--- a/hw/arm/fby35.c
+++ b/hw/arm/fby35.c
@@ -100,13 +100,7 @@ static void fby35_bmc_init(Fby35State *s)
         MemoryRegion *boot_rom = g_new(MemoryRegion, 1);
         uint64_t size = memory_region_size(&fl->mmio);
 
-        if (s->mmio_exec) {
-            memory_region_init_alias(boot_rom, NULL, "aspeed.boot_rom",
-                                     &fl->mmio, 0, size);
-            memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
-                                        boot_rom);
-        } else {
-
+        if (!s->mmio_exec) {
             memory_region_init_rom(boot_rom, NULL, "aspeed.boot_rom",
                                    size, &error_abort);
             memory_region_add_subregion(&s->bmc_memory, FBY35_BMC_FIRMWARE_ADDR,
-- 
2.39.2


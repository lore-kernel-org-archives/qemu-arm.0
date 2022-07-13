Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp69315lfp;
        Wed, 13 Jul 2022 00:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vMEQ1+w+T+7gOd7jLbawCAJ+MaNkvkl679mIhmzVbnE1s5MKXim0tylNacJLJem41A9eRs
X-Received: by 2002:a05:6214:3016:b0:473:7a74:15ab with SMTP id ke22-20020a056214301600b004737a7415abmr1707881qvb.46.1657698888796;
        Wed, 13 Jul 2022 00:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657698888; cv=none;
        d=google.com; s=arc-20160816;
        b=jTGuwrc3Csibsxc/q4CuRm1KwQfNfUvWcBdLQHF9iH+mXaSFA79kHr79YoCTHrVSEV
         +h3pI1GAlDVCTLygl6m/+VMcjo1smtYg7Qn2Il7TZf+jMrrKItQNhxnVwsIeXubrB0K9
         EO95xcLJ3y5I9sPRapenmQ7cFt6iedS3MG5w/KYiyuvCTlvNy3+yov4CCjlAa87m7GOj
         11FSY/AR7FNWOTZkeJC00242WSxB1HE8FJccMWN61hrW1Ozug3V4AmbsXaSGWZqN1udr
         oK1lr7cRThNZH2K4Y+NpjzIfmeDSRWohxImNQdA5FZRLIgJGuxlDJzA7vMh/RZ0xF+WL
         FpDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=9cB1DiSdoB0WJH5YlPeYfJTGn0oasy3sxn/Rtp33YcQ=;
        b=Igvm3MhlYJ56sHC2SFVupgFtmnUYVSvCWyTjUS4b0LoojS3HM0g7vaDReiTD4+91oH
         AMV1QzWStigOWBdpwqWdaMtR8W7t1xbcPJ2L/fXfIN0Ixrw90akkYHWJkTG8hHdszIsf
         fZJJ8m2FLf5jtx0GMxIhVoPsa9owSGe8D3ByMOqOBYC6PZNFYZwg0znny8FSYgdiCd9R
         3dJrovor914a7PvxtiJ5R7AfCOYkQIcdvW7n35kk9irmLrf0Fc/5YdSjk/fiORSewLRo
         E/49R0sjWbB2HdJ8FJ5qE/+A71rPIAALVE1TdAk+u9CBzSrii720in2xDsWOXGRQ3lld
         jpcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq3-20020ad45963000000b004738f54a571si1079672qvb.191.2022.07.13.00.54.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 00:54:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBXCq-0000Qx-6g
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 03:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBW-00080F-JT; Wed, 13 Jul 2022 03:53:30 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:52253
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBT-0002YU-LQ; Wed, 13 Jul 2022 03:53:26 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVH51xbbz4ySb;
 Wed, 13 Jul 2022 17:53:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVH31QfYz4ySW;
 Wed, 13 Jul 2022 17:53:18 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 06/19] aspeed: Refactor UART init for multi-SoC machines
Date: Wed, 13 Jul 2022 09:52:42 +0200
Message-Id: <20220713075255.2248923-7-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z6UiFkrUmfqY

From: Peter Delevoryas <peter@pjd.dev>

This change moves the code that connects the SoC UART's to serial_hd's
to the machine.

It makes each UART a proper child member of the SoC, and then allows the
machine to selectively initialize the chardev for each UART with a
serial_hd.

This should preserve backwards compatibility, but also allow multi-SoC
boards to completely change the wiring of serial devices from the
command line to specific SoC UART's.

This also removes the uart-default property from the SoC, since the SoC
doesn't need to know what UART is the "default" on the machine anymore.

I tested this using the images and commands from the previous
refactoring, and another test image for the ast1030:

    wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/fuji.mtd
    wget https://github.com/facebook/openbmc/releases/download/v2021.49.0/wedge100.mtd
    wget https://github.com/peterdelevoryas/OpenBIC/releases/download/oby35-cl-2022.13.01/Y35BCL.elf

Fuji uses UART1:

    qemu-system-arm -machine fuji-bmc \
        -drive file=fuji.mtd,format=raw,if=mtd \
        -nographic

ast2600-evb uses uart-default=UART5:

    qemu-system-arm -machine ast2600-evb \
        -drive file=fuji.mtd,format=raw,if=mtd \
        -serial null -serial mon:stdio -display none

Wedge100 uses UART3:

    qemu-system-arm -machine palmetto-bmc \
        -drive file=wedge100.mtd,format=raw,if=mtd \
        -serial null -serial null -serial null \
        -serial mon:stdio -display none

AST1030 EVB uses UART5:

    qemu-system-arm -machine ast1030-evb \
        -kernel Y35BCL.elf -nographic

Fixes: 6827ff20b2975 ("hw: aspeed: Init all UART's with serial devices")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220705191400.41632-4-peter@pjd.dev>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  7 ++++--
 hw/arm/aspeed.c             | 22 +++++++++++++---
 hw/arm/aspeed_ast10x0.c     |  8 +++++-
 hw/arm/aspeed_ast2600.c     |  8 +++++-
 hw/arm/aspeed_soc.c         | 50 +++++++++++++++++++++++++------------
 5 files changed, 71 insertions(+), 24 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e65926a667ee..68e907cd64bb 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -36,12 +36,14 @@
 #include "hw/misc/aspeed_lpc.h"
 #include "hw/misc/unimp.h"
 #include "hw/misc/aspeed_peci.h"
+#include "hw/char/serial.h"
 
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_EHCIS_NUM 2
 #define ASPEED_WDTS_NUM  4
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  4
+#define ASPEED_UARTS_NUM 13
 
 struct AspeedSoCState {
     /*< private >*/
@@ -79,7 +81,7 @@ struct AspeedSoCState {
     AspeedSDHCIState emmc;
     AspeedLPCState lpc;
     AspeedPECIState peci;
-    uint32_t uart_default;
+    SerialMM uart[ASPEED_UARTS_NUM];
     Clock *sysclk;
     UnimplementedDeviceState iomem;
     UnimplementedDeviceState video;
@@ -175,7 +177,8 @@ enum {
 };
 
 qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev);
-void aspeed_soc_uart_init(AspeedSoCState *s);
+bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp);
+void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr);
 bool aspeed_soc_dram_init(AspeedSoCState *s, Error **errp);
 void aspeed_mmio_map(AspeedSoCState *s, SysBusDevice *dev, int n, hwaddr addr);
 void aspeed_mmio_map_unimplemented(AspeedSoCState *s, SysBusDevice *dev,
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6fe9b1354804..e287a76e2843 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -26,6 +26,7 @@
 #include "qemu/error-report.h"
 #include "qemu/units.h"
 #include "hw/qdev-clock.h"
+#include "sysemu/sysemu.h"
 
 static struct arm_boot_info aspeed_board_binfo = {
     .board_id = -1, /* device-tree-only board */
@@ -301,6 +302,21 @@ static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
                                &error_fatal);
 }
 
+static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
+{
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
+    AspeedSoCState *s = &bmc->soc;
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+
+    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
+    for (int i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+        if (uart == amc->uart_default) {
+            continue;
+        }
+        aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
+    }
+}
+
 static void aspeed_machine_init(MachineState *machine)
 {
     AspeedMachineState *bmc = ASPEED_MACHINE(machine);
@@ -346,8 +362,7 @@ static void aspeed_machine_init(MachineState *machine)
         object_property_set_int(OBJECT(&bmc->soc), "hw-prot-key",
                                 ASPEED_SCU_PROT_KEY, &error_abort);
     }
-    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
-                         amc->uart_default);
+    connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&bmc->soc.fmc,
@@ -1383,8 +1398,7 @@ static void aspeed_minibmc_machine_init(MachineState *machine)
 
     object_property_set_link(OBJECT(&bmc->soc), "memory",
                              OBJECT(get_system_memory()), &error_abort);
-    qdev_prop_set_uint32(DEVICE(&bmc->soc), "uart-default",
-                         amc->uart_default);
+    connect_serial_hds_to_uarts(bmc);
     qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
 
     aspeed_board_init_flashes(&bmc->soc.fmc,
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 677699e54c0a..4d0b9b115f0d 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -144,6 +144,10 @@ static void aspeed_soc_ast1030_init(Object *obj)
         object_initialize_child(obj, "wdt[*]", &s->wdt[i], typename);
     }
 
+    for (i = 0; i < sc->uarts_num; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
+    }
+
     snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
     object_initialize_child(obj, "gpio", &s->gpio, typename);
 
@@ -255,7 +259,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
                                 sc->irqmap[ASPEED_DEV_KCS] + aspeed_lpc_kcs_4));
 
     /* UART */
-    aspeed_soc_uart_init(s);
+    if (!aspeed_soc_uart_realize(s, errp)) {
+        return;
+    }
 
     /* Timer */
     object_property_set_link(OBJECT(&s->timerctrl), "scu", OBJECT(&s->scu),
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 64eb5a7b2600..aa2cd90bec17 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -214,6 +214,10 @@ static void aspeed_soc_ast2600_init(Object *obj)
         object_initialize_child(obj, "mii[*]", &s->mii[i], TYPE_ASPEED_MII);
     }
 
+    for (i = 0; i < sc->uarts_num; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
+    }
+
     snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
     object_initialize_child(obj, "xdma", &s->xdma, typename);
 
@@ -386,7 +390,9 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
     /* UART */
-    aspeed_soc_uart_init(s);
+    if (!aspeed_soc_uart_realize(s, errp)) {
+        return;
+    }
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 0bb6a2f092c9..b05b9dd41602 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -208,6 +208,10 @@ static void aspeed_soc_init(Object *obj)
                                 TYPE_FTGMAC100);
     }
 
+    for (i = 0; i < sc->uarts_num; i++) {
+        object_initialize_child(obj, "uart[*]", &s->uart[i], TYPE_SERIAL_MM);
+    }
+
     snprintf(typename, sizeof(typename), TYPE_ASPEED_XDMA "-%s", socname);
     object_initialize_child(obj, "xdma", &s->xdma, typename);
 
@@ -315,7 +319,9 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
                        aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
 
     /* UART */
-    aspeed_soc_uart_init(s);
+    if (!aspeed_soc_uart_realize(s, errp)) {
+        return;
+    }
 
     /* I2C */
     object_property_set_link(OBJECT(&s->i2c), "dram", OBJECT(s->dram_mr),
@@ -482,8 +488,6 @@ static Property aspeed_soc_properties[] = {
                      MemoryRegion *),
     DEFINE_PROP_LINK("dram", AspeedSoCState, dram_mr, TYPE_MEMORY_REGION,
                      MemoryRegion *),
-    DEFINE_PROP_UINT32("uart-default", AspeedSoCState, uart_default,
-                       ASPEED_DEV_UART5),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -573,23 +577,37 @@ qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int dev)
     return ASPEED_SOC_GET_CLASS(s)->get_irq(s, dev);
 }
 
-void aspeed_soc_uart_init(AspeedSoCState *s)
+bool aspeed_soc_uart_realize(AspeedSoCState *s, Error **errp)
 {
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
-    int i, uart;
-
-    /* Attach an 8250 to the IO space as our UART */
-    serial_mm_init(s->memory, sc->memmap[s->uart_default], 2,
-                   aspeed_soc_get_irq(s, s->uart_default), 38400,
-                   serial_hd(0), DEVICE_LITTLE_ENDIAN);
-    for (i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
-        if (uart == s->uart_default) {
-            uart++;
+    SerialMM *smm;
+
+    for (int i = 0, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
+        smm = &s->uart[i];
+
+        /* Chardev property is set by the machine. */
+        qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
+        qdev_prop_set_uint32(DEVICE(smm), "baudbase", 38400);
+        qdev_set_legacy_instance_id(DEVICE(smm), sc->memmap[uart], 2);
+        qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
+        if (!sysbus_realize(SYS_BUS_DEVICE(smm), errp)) {
+            return false;
         }
-        serial_mm_init(s->memory, sc->memmap[uart], 2,
-                       aspeed_soc_get_irq(s, uart), 38400,
-                       serial_hd(i), DEVICE_LITTLE_ENDIAN);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(smm), 0, aspeed_soc_get_irq(s, uart));
+        aspeed_mmio_map(s, SYS_BUS_DEVICE(smm), 0, sc->memmap[uart]);
     }
+
+    return true;
+}
+
+void aspeed_soc_uart_set_chr(AspeedSoCState *s, int dev, Chardev *chr)
+{
+    AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int i = dev - ASPEED_DEV_UART1;
+
+    g_assert(0 <= i && i < ARRAY_SIZE(s->uart) && i < sc->uarts_num);
+    qdev_prop_set_chr(DEVICE(&s->uart[i]), "chardev", chr);
 }
 
 /*
-- 
2.35.3


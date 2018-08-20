Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp750890wrd;
        Mon, 20 Aug 2018 07:28:47 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyi1l+t1ScUMLwM9X8C0aJoVgJoC/E8wkp+NEzOFCb2ZZcqK9/8X9aFhEZT/oITuKHaaomC
X-Received: by 2002:a37:1118:: with SMTP id b24-v6mr14631238qkh.253.1534775327793;
        Mon, 20 Aug 2018 07:28:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534775327; cv=none;
        d=google.com; s=arc-20160816;
        b=Ba3rL2vDZayNTTqZm197QuZ998Rgndpyv0phCOChpdtN2DUIE9XpJy+nH9KCTFjMSz
         o6ilHO2/mZtjTy997+8zL23bCRp5cwFIMDWLXWynUKObC4ARewKJt4hww1JtTcq8PYDx
         u9NMoKxYe0oVMQ/5oCGc1D4U+0NPEyBESIh2cWky9LycuzjNVl1ONwJyeEMMN2/IUl1d
         o1FsSSvKMPBtRIkoCrF/YH1I7e/ASsVIQL1VrB59mpv4bL3XNmeOgFSVwhDmy7v/9Q0W
         BuRQJw9nmswP4wHggfO71Pfc/n/k296FtkKwLktvRfLXE79nRu8xeLHgjslYCjHa8uU7
         R3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=e3mSFFweo7jqVbtBx5dungUZ66UOzuUr1z8Hwji4bj4=;
        b=OrJqvAQvsp5VCtqN81h5lax09lva0j5ImICvy1iVLFuidq7+9YBlCD+jt6OLsdLO4e
         eCW2GocUFyBS4mADxrwqZaWrKA+FHv5BDFZ9EtZ08PEBxhRz53geuXuUSOnuKB4K1bWn
         cUPQqxs4u6Y0n82eN739jugw770zvFI1rLWOFCRSltcGxpCo7uNBgpRMexEF2v45kfeT
         zn3UzzuuOrdBmbbPHieNbXQgV85Q6f4JNan9g9Gw++iV+V+mgwvQwfDF1UTpznrEmM/5
         nvW6U8LE7U1ezzb8toyjLoiaoWYN7rVez07WDgMQRi/VXhbSNrUH27TVgmGjZi1GcogV
         3G+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7-v6si1994916qkh.86.2018.08.20.07.28.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Aug 2018 07:28:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1frlAl-00021o-7J
	for alex.bennee@linaro.org; Mon, 20 Aug 2018 10:28:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuK-0003m1-4D
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1frkuJ-0007UF-Cf
	for qemu-devel@nongnu.org; Mon, 20 Aug 2018 10:11:48 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1frkuH-0007QD-EP; Mon, 20 Aug 2018 10:11:45 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1frkuE-0003VR-IH; Mon, 20 Aug 2018 15:11:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 20 Aug 2018 15:11:15 +0100
Message-Id: <20180820141116.9118-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180820141116.9118-1-peter.maydell@linaro.org>
References: <20180820141116.9118-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 21/22] hw/arm/mps2-tz: Instantiate SPI
 controllers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wgYNdnyYVi/8

The SPI controllers in the MPS2 AN505 board are PL022s.
We have a model of the PL022, so create these devices.

We don't currently model the LCD controller that sits behind
one of the PL022s; the others are intended to control devices
that sit on the FPGA's general purpose SPI connector or
"shield" expansion connectors.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index d810e51a1b4..cedf605e20e 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -48,6 +48,7 @@
 #include "hw/misc/tz-msc.h"
 #include "hw/arm/iotkit.h"
 #include "hw/dma/pl080.h"
+#include "hw/ssi/pl022.h"
 #include "hw/devices.h"
 #include "net/net.h"
 #include "hw/core/split-irq.h"
@@ -73,7 +74,7 @@ typedef struct {
     MPS2FPGAIO fpgaio;
     TZPPC ppc[5];
     TZMPC ssram_mpc[3];
-    UnimplementedDeviceState spi[5];
+    PL022State spi[5];
     UnimplementedDeviceState i2c[4];
     UnimplementedDeviceState i2s_audio;
     UnimplementedDeviceState gpio[4];
@@ -324,6 +325,31 @@ static MemoryRegion *make_dma(MPS2TZMachineState *mms, void *opaque,
     return sysbus_mmio_get_region(s, 0);
 }
 
+static MemoryRegion *make_spi(MPS2TZMachineState *mms, void *opaque,
+                              const char *name, hwaddr size)
+{
+    /*
+     * The AN505 has five PL022 SPI controllers.
+     * One of these should have the LCD controller behind it; the others
+     * are connected only to the FPGA's "general purpose SPI connector"
+     * or "shield" expansion connectors.
+     * Note that if we do implement devices behind SPI, the chip select
+     * lines are set via the "MISC" register in the MPS2 FPGAIO device.
+     */
+    PL022State *spi = opaque;
+    int i = spi - &mms->spi[0];
+    DeviceState *iotkitdev = DEVICE(&mms->iotkit);
+    SysBusDevice *s;
+
+    sysbus_init_child_obj(OBJECT(mms), name, spi, sizeof(mms->spi[0]),
+                          TYPE_PL022);
+    object_property_set_bool(OBJECT(spi), true, "realized", &error_fatal);
+    s = SYS_BUS_DEVICE(spi);
+    sysbus_connect_irq(s, 0,
+                       qdev_get_gpio_in_named(iotkitdev, "EXP_IRQ", 51 + i));
+    return sysbus_mmio_get_region(s, 0);
+}
+
 static void mps2tz_common_init(MachineState *machine)
 {
     MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
@@ -422,11 +448,11 @@ static void mps2tz_common_init(MachineState *machine)
         }, {
             .name = "apb_ppcexp1",
             .ports = {
-                { "spi0", make_unimp_dev, &mms->spi[0], 0x40205000, 0x1000 },
-                { "spi1", make_unimp_dev, &mms->spi[1], 0x40206000, 0x1000 },
-                { "spi2", make_unimp_dev, &mms->spi[2], 0x40209000, 0x1000 },
-                { "spi3", make_unimp_dev, &mms->spi[3], 0x4020a000, 0x1000 },
-                { "spi4", make_unimp_dev, &mms->spi[4], 0x4020b000, 0x1000 },
+                { "spi0", make_spi, &mms->spi[0], 0x40205000, 0x1000 },
+                { "spi1", make_spi, &mms->spi[1], 0x40206000, 0x1000 },
+                { "spi2", make_spi, &mms->spi[2], 0x40209000, 0x1000 },
+                { "spi3", make_spi, &mms->spi[3], 0x4020a000, 0x1000 },
+                { "spi4", make_spi, &mms->spi[4], 0x4020b000, 0x1000 },
                 { "uart0", make_uart, &mms->uart[0], 0x40200000, 0x1000 },
                 { "uart1", make_uart, &mms->uart[1], 0x40201000, 0x1000 },
                 { "uart2", make_uart, &mms->uart[2], 0x40202000, 0x1000 },
-- 
2.18.0


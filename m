Received: by 10.25.227.6 with SMTP id a6csp1806777lfh;
        Sun, 2 Jul 2017 21:48:51 -0700 (PDT)
X-Received: by 10.55.103.194 with SMTP id b185mr36537373qkc.55.1499057331039;
        Sun, 02 Jul 2017 21:48:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499057331; cv=none;
        d=google.com; s=arc-20160816;
        b=UhSzFuJ3/Bcx+Ps3oOTTPvOE0Ug+CTrBaCFfuW05d61boZwsvMGBVb1fbYolboyDGc
         cm/WOVvXEy8EZ5cmjrzcY1PKnaeFTgGBhuWqmFKq03ExQc3Ievz453o8ctne1s5fmhGq
         KY9Hb4lz8/FcRDSQACazgGkgvAkYs6Gc5tHU/bGpqQVQVxLxv7lk1HrM+/fvEqSebCYm
         EeqUb6fKVSAchSaPwhKJmjiIVlG0sIhSe0pFyMUMy4qhrLiangL4aCKfjHful3G42Znl
         Sg0IRNjLe3et01o2JK4FkXRL40POAgx8igCiM5NDqklMx9n9Ac1nI5RCsDyLnPf1LXhJ
         pXzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=dqnjQ8lAXxCQdbAOx8Aexl6KCCYCMvkbxCtcjvaK1IE=;
        b=tXDWNMDs2SvvlDRPqlcQr1efte9O16U6x2GdNh4AJSdYx/KNQ/3m5N8xJ5rdzRg30Z
         BBJLPW+cce8mATYc65uQlN9pPjnKzoTR/q/khCjrxXEAlkZelLWknc8BpGBIVWD2Tsb/
         IzO3DiGcum+jMhwT6k61RGN1b+9tCHrUKwZDM8Z4/YUCzF6aaJhaX57S+nJXWhmf0Z3h
         /El+uEcoPEssHniGTjhy789vZcM4OoX8TjQh5wuqHlsFPsMd8yaSUL168YZw68IoFOCB
         cF4D3W9MLpYwtLpAs9bwLG2hIkb336OeIn3P3cR9w3ty70tKmik5JhH+s+zH5qiTRsEg
         NXsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FXEQ09CR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 66si14011562qkz.120.2017.07.02.21.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jul 2017 21:48:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=FXEQ09CR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRtI0-00026s-FD
	for alex.bennee@linaro.org; Mon, 03 Jul 2017 00:48:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtFP-000899-QI
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 00:46:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRtFO-0008R8-DF
	for qemu-arm@nongnu.org; Mon, 03 Jul 2017 00:46:07 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:33781)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dRtFK-0008HQ-8H; Mon, 03 Jul 2017 00:46:02 -0400
Received: by mail-pg0-x244.google.com with SMTP id u62so21812368pgb.0;
	Sun, 02 Jul 2017 21:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dqnjQ8lAXxCQdbAOx8Aexl6KCCYCMvkbxCtcjvaK1IE=;
	b=FXEQ09CRrmeI0FAZLprl5drGysTelxqT6B3HN4Sr6/r+Iofk02e+ojb4zczw+b553i
	oucD4kXNQOFZiTvn6AoG4IPdtpa6qXPTujHaosfR+8LZCmmXfROo5v4qg5B//CsoXspS
	S9yGSwUgs1n9mRZG3unSk1wFKqbSAtklHWSJ0W4Om/xerBSlYANedNvOO8rsVv549b1r
	2I9UzTr3UpdCuDbA0hpiIpEd46tDTIt8G7ngEgdhFer2ZKYra7wjji7Lr3ttqUInd7aK
	eX0nGDOp3wpG/SyYW2PDW88Gi3w1LBXccJhKmyJIud1EUQvTj8UcTEZ+azDbn3z4Ol0L
	tUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dqnjQ8lAXxCQdbAOx8Aexl6KCCYCMvkbxCtcjvaK1IE=;
	b=qwrrlvwqGmcwxXE6oeTxD7jhkGAFDfjYEj9JNudnP9HpY4w1MxjYhz4z5l+tGxWsK+
	FjIhkhCcnSklqUHg6+99vflemvMCQvkkDxuU2caGc9RPfB5HaNZSqZoEBy1BVptFqXeV
	nU60yR5kA3+moeiJuV6zSl4PBm4Wu20DtccLhHmTxHr8aZVlZOu2+quzhwF4abz+8Y38
	IJpOKAKXKuvMEwkDS7438zdKTMjZm+qKH3AajCDXAflvuN2tenC5n0hyYG7ymk+hyVxd
	7uJojc9iGaTGMbbXBCgtv1xA/Ofe5LykSSOrpoQut+0FW9f+z0Kg8NcBP+NAAlIfdpR1
	dFDw==
X-Gm-Message-State: AIVw113Mfxl9S1AJ5bKmYgQQSsC455tVqe69zBAGvkl5hmGbkxGb7ZxQ
	eTVLpVdrGu3JB4CB
X-Received: by 10.99.39.69 with SMTP id n66mr3370246pgn.94.1499057161221;
	Sun, 02 Jul 2017 21:46:01 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	v70sm9324145pfi.110.2017.07.02.21.45.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Jul 2017 21:46:00 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon,  3 Jul 2017 10:15:15 +0530
Message-Id: <1499057115-6773-6-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [Qemu devel v6 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aMsQk+3rghfv

Emulated Emcraft's Smartfusion2 System On Module starter
kit.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/arm/Makefile.objs |  1 +
 hw/arm/msf2-som.c    | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 hw/arm/msf2-som.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index c828061..2073934 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
 obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
 obj-y += netduino2.o
+obj-$(CONFIG_MSF2) += msf2-som.o
 obj-y += sysbus-fdt.o
 
 obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
new file mode 100644
index 0000000..ea945b1
--- /dev/null
+++ b/hw/arm/msf2-som.c
@@ -0,0 +1,94 @@
+/*
+ * SmartFusion2 SOM starter kit(from Emcraft) emulation.
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/arm/msf2-soc.h"
+#include "hw/arm/arm.h"
+#include "exec/address-spaces.h"
+
+#define DDR_BASE_ADDRESS      0xA0000000
+#define DDR_SIZE              (64 * M_BYTE)
+
+#define M2S010_ENVM_SIZE      (256 * K_BYTE)
+#define M2S010_ESRAM_SIZE     (64 * K_BYTE)
+
+static void emcraft_sf2_init(MachineState *machine)
+{
+    DeviceState *dev;
+    DeviceState *spi_flash;
+    MSF2State *soc;
+    DriveInfo *dinfo = drive_get_next(IF_MTD);
+    qemu_irq cs_line;
+    SSIBus *spi_bus;
+    MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *ddr = g_new(MemoryRegion, 1);
+
+    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
+                           &error_fatal);
+    vmstate_register_ram_global(ddr);
+    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
+
+    dev = qdev_create(NULL, TYPE_MSF2_SOC);
+    qdev_prop_set_string(dev, "part-name", "M2S010");
+    qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
+    qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
+
+    /*
+     * CPU clock and peripheral clocks(APB0, APB1)are configurable
+     * in Libero. CPU clock is divided by APB0 and APB1 divisors for
+     * peripherals. Emcraft's SoM kit comes with these settings by default.
+     */
+    qdev_prop_set_uint32(dev, "m3clk", 142 * 1000000);
+    qdev_prop_set_uint32(dev, "apb0div", 2);
+    qdev_prop_set_uint32(dev, "apb1div", 2);
+
+    object_property_set_bool(OBJECT(dev), true, "realized", &error_fatal);
+
+    soc = MSF2_SOC(dev);
+
+    /* Attach SPI flash to SPI0 controller */
+    spi_bus = (SSIBus *)qdev_get_child_bus(dev, "spi0");
+    spi_flash = ssi_create_slave_no_init(spi_bus, "s25sl12801");
+    qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
+    if (dinfo) {
+        qdev_prop_set_drive(spi_flash, "drive", blk_by_legacy_dinfo(dinfo),
+                                    &error_fatal);
+    }
+    qdev_init_nofail(spi_flash);
+    cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                       soc->envm_size);
+}
+
+static void emcraft_sf2_machine_init(MachineClass *mc)
+{
+    mc->desc = "SmartFusion2 SOM kit from Emcraft";
+    mc->init = emcraft_sf2_init;
+}
+
+DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
-- 
2.5.0


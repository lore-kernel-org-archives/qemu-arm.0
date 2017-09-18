Received: by 10.223.172.38 with SMTP id v35csp4115122wrc;
        Mon, 18 Sep 2017 12:26:54 -0700 (PDT)
X-Received: by 10.55.33.216 with SMTP id f85mr22213025qki.176.1505762814809;
        Mon, 18 Sep 2017 12:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505762814; cv=none;
        d=google.com; s=arc-20160816;
        b=tcVcz6DOy95PL+Fs+2LR6cElIUYwknkU2yyPjVxpAG4hiK/6VRl3y1VFEW0yumoi8w
         2qNaQoxy1No0iWpf+rNInDXHY2brpg+ckryhzwjHSFLaHtWWtOZxXfe5fHm67aXKHlYT
         PXmEoCGmVv5q0yLp1nnrVTH7CNdKcdHSXyCUysHWrfWB/+Jizn58/MRdojqGD9J+qHqi
         MOYDphcfRwiiB4kjlXfYKj8OI67u4eKtY+Z/eBtzAYCqvciTmlIGNH5yI9TkaFFuj3G2
         qyHoc8Ld6I5IWWJ0BOtGLCVAjIUApQduaDTHjm/JkzbIUJmeAVhA5jLWghSyEsTq7olT
         DsWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aQl392cWCEi2nT/QhfVZ+i96ejdVhQXrTnUxc5g8ukw=;
        b=WJ+OpEji1hXDntDDgOqO76uCs8POTB9doiG1yOCYsl641mHkYHEI+iiRuYrp4HxPEK
         9vIaFjohRmhi/neJRd3F9epBErS0Cmsnpen+1Rx+pLLclANwOx/QEudgXJw9/qZPMGih
         +PBjwF8COIOsLKxFkSbsaMjo0gt9Y6zmacTpzZbl8mDsnmxUbUlY01Hd8evurBCgXBGM
         Lm+b7WxiVYw9u0AfOuD6iesiEGEILPUinySHiWZGbCUvJDKP4JgG4MfIRjm18q3bS0ht
         6GV3BKbgIaWZF/Yy27B2lnekISA//jenwkBFGShEjoTPAivfca0mJihL+FDGsjGtsMXi
         3qSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=juJzTfXu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m73si7855487qkm.553.2017.09.18.12.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=juJzTfXu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du1gy-0007OI-En
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:26:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1e4-0004he-Mu
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:23:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1e3-0002EI-IS
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:23:52 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:38887)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1du1dy-0002B7-VI; Mon, 18 Sep 2017 15:23:47 -0400
Received: by mail-pf0-x242.google.com with SMTP id q76so557692pfq.5;
	Mon, 18 Sep 2017 12:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aQl392cWCEi2nT/QhfVZ+i96ejdVhQXrTnUxc5g8ukw=;
	b=juJzTfXukxK32PhsHATd6x4Z73rmClOXuX0stvOowSbEVm3X5mESFRwnphRr+XvFaX
	xnSnVdylVGQ9MRvJBSZCdlIoagwFy/OvY8u/hYH8QU+lOa8ma8NQqBdL7ynFZEL+Iwf2
	HvGaZyeVanefrgzXkfsG0Wg6DnS7UuDTkiBzZU5GCI9BMMHKycOlvfGtbb8M3rzTwSZn
	Vj2ppykLx3YsgDmcllW+E9sh4n8qan+ZyMHWqFL83rWPYt78NmOzPrlW7r2OA0DOlrTB
	oqnBEPPxLHYx5uitMrAw2+yy0L6RLOCysT4Sq1jVsj9Syju27NAlkqxhlC/g4R22HJXJ
	yRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aQl392cWCEi2nT/QhfVZ+i96ejdVhQXrTnUxc5g8ukw=;
	b=JHQw3TQUI9Vz6x+0FEy/Ksxdnu3rsKaMwUrjQHP384j+4DricSCkmdAnygH3Zke4xY
	2rAIjlcTkXL6IUTpWkhiUwM/BY2bU5H+Bh68VNqLtx5F87kbmszuhd1aUvW5HF+0xVLs
	DxAHesYHSnQ8TDIizNsp++4F+O4qufgDhXxoVmf3fLKafuhyanQJfwz8rA7QtcnHQ8dC
	v7eCc/AUTT1O3C8uOZ/dJNelQTZJ1GYYjXhxAZLekegJubwQ86w9svIxVuvqLIGO2Fgl
	Ux4VLQ+1jzlJM/uXHYj/c2rlN5CZX872GLY1Nl9GlkOvQLvxzmhTDDe2JXx0FTYH75Sl
	MzFg==
X-Gm-Message-State: AHPjjUi9HOJXsVSnd5ak0S6RwM7lRF7z3k09T4MA246ylsRycLOqBsg/
	s17iaSWjisiiDrC2
X-Google-Smtp-Source: AOwi7QCnwuXMEbzUqdvc0YoulOBr5BwwwvhV+UUwgEHTibjOoIl4HJzfE8VYkCTD/zDwBxMc4NXtaA==
X-Received: by 10.99.180.65 with SMTP id n1mr6048883pgu.313.1505762626019;
	Mon, 18 Sep 2017 12:23:46 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id w12sm169701pfk.83.2017.09.18.12.23.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 12:23:45 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 19 Sep 2017 00:53:21 +0530
Message-Id: <1505762601-27143-6-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
References: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::242
Subject: [Qemu-arm] [Qemu devel v10 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit
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
X-TUID: M30So681UyU3

Emulated Emcraft's Smartfusion2 System On Module starter
kit.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Makefile.objs |  2 +-
 hw/arm/msf2-som.c    | 94 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/msf2-som.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index a6cf24f..2794e08 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -19,4 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
-obj-$(CONFIG_MSF2) += msf2-soc.o
+obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
new file mode 100644
index 0000000..d395696
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
+#include "hw/arm/arm.h"
+#include "exec/address-spaces.h"
+#include "qemu/cutils.h"
+#include "hw/arm/msf2-soc.h"
+
+#define DDR_BASE_ADDRESS      0xA0000000
+#define DDR_SIZE              (64 * M_BYTE)
+
+#define M2S010_ENVM_SIZE      (256 * K_BYTE)
+#define M2S010_ESRAM_SIZE     (64 * K_BYTE)
+
+static void emcraft_sf2_s2s010_init(MachineState *machine)
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
+    mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
+    mc->init = emcraft_sf2_s2s010_init;
+}
+
+DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
-- 
2.5.0


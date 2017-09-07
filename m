Received: by 10.223.172.38 with SMTP id v35csp620778wrc;
        Thu, 7 Sep 2017 12:27:41 -0700 (PDT)
X-Received: by 10.200.39.24 with SMTP id g24mr651543qtg.230.1504812461141;
        Thu, 07 Sep 2017 12:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504812461; cv=none;
        d=google.com; s=arc-20160816;
        b=GB/f/rhAaIgBTnZS7xJ8yVH3X9mwbhYHVcDPFwEDT1OvakZBjhlU+oKoHWQnpXtD/N
         sMDZLvWTBacKDx8jDRLxSAFseVNph1FZmkRLkX3+2rPQD4bnuo2z5iHIwqI6K5TSAlNx
         BbZsb1hl/M7dp5AeA6jWmv2u31E1wjkwu+IXXjGqlkdnbkZkeqq8NB9kNj1Iu9Mxfa2V
         Tko63odcfubc9bueeFIO/ROUu1/o+hhtYbk/LAwqmIvCyEYh8FOwxnPNjyCMhtw8Ku8K
         tOENpWST+p2iHxPFV7mkwCzewTvNc4aQIvbjAN70AinZ01jAoqiVu3RrTYkN4RixVfvR
         mFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fwsbHPUlpVGkFVIspwHf5ZrUlsm/1d3I0k4bF0yk8Y4=;
        b=MmolCANHWRnR4naGfPMaZxcaHHeK013hNdM/dvXZbclBLh+IaWa+SKyCxc8dZWEJo0
         Qaoan4X/S5KzvNlR3xJGmtXITd1/gGRI3NOpDCVZwNZvOtxkxsih0ft/cHyY3YIyUB2V
         s+ViVT/1TZIsMuaw6BxFp1d3s1GwVfD71AS3dVE4ji79/KlMRGIk12+4z+ry967Gf/Gz
         FFFv58epV3NfDF2H28dXXqJIzDJjiJdSTOLwMOiHYHHWqkEP0+HUaeyNRDINhqSOKAnn
         acGeN9E5OSeWYShDVvCusQwaAXOEtTP1iDDgQOlhq5L4fKOezBvvIQaTZ2J8aGglSONw
         w7ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Bhji4evI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i83si96798qke.83.2017.09.07.12.27.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 12:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Bhji4evI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq2Sg-0000vl-PL
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 15:27:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dq2Q7-0006ph-II
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 15:25:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dq2Q2-0004Qn-J3
	for qemu-arm@nongnu.org; Thu, 07 Sep 2017 15:24:59 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36815)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dq2Pq-0004II-Cn; Thu, 07 Sep 2017 15:24:42 -0400
Received: by mail-pf0-x241.google.com with SMTP id f84so287778pfj.3;
	Thu, 07 Sep 2017 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fwsbHPUlpVGkFVIspwHf5ZrUlsm/1d3I0k4bF0yk8Y4=;
	b=Bhji4evITElZnoEJXYEP+SeNyV1Jy8bWDb+uWG+d/ucEs56n+hacrd/yIgxA+wiQve
	jocySB0Dfn8DcpfvxKccs6GCQe7W9nSxKWsXY/ByuUVq5QKhkSS8iEwd5HwlfTj5QCkW
	C0dyjnaVDR4NAFhgzCY2O7R+det79GxN3+cXGQNu0GC2rkaFucDsqop68b+6YB9m+51u
	JNTw7XSt3q/hWrkNH3SwywQjpp62L6D3S3eSFqiO49Ipx4rjVUJ+aOU9poWWXMMJ4+OT
	8MXhyPdJapazlWEYbaTuuylRrksANtjLVhbzvYueCJYacwxMoyndPmQxVYduLpU93CvG
	Ry+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fwsbHPUlpVGkFVIspwHf5ZrUlsm/1d3I0k4bF0yk8Y4=;
	b=eIULFmeBXbAGZNm4kwZonF4sO9Vc/kP/KMy62ACs1qMKcix94MhLjXz/Df5uk1NWV3
	+gkLP7eizUX+IEue4Noj0M/fsJMUu/yxpWF6emeDsdq9Q/a9vVoRwnHb1KQz/cBH7P81
	VwqYCu3QwvRHgAknSrzMr8qpChPQdtsPvPrc5xciMqnrqsmOH0tZQWMEy9dpOcbIGSN5
	U1+BhgfdzMRK94+Me23rsagw358dZROyHTwYuT5YI5LyVlESe404WOdxi7mL7SJfyg3S
	DxWlFcf9rN71Gc/weWypgm/A/cHDE4d9eUA928VE5JwpFOfq2NlfPkPO1yLbjDDiHplP
	TNnQ==
X-Gm-Message-State: AHPjjUisjXoQ8HLejZJyTg3hE7+BAJ21B3In0kFBqLGikq8eys+z0kWe
	6R0ULUGi0rFVwfM6
X-Google-Smtp-Source: ADKCNb6/2jA2eEsjY+X0lq2GhZCbGhQNK76du4K/ps7bdfb1NqoOyxPw63scvtYx8Idb4a0dEQZLKg==
X-Received: by 10.84.193.131 with SMTP id f3mr486161pld.92.1504812281408;
	Thu, 07 Sep 2017 12:24:41 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	y74sm462919pfa.164.2017.09.07.12.24.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Sep 2017 12:24:40 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri,  8 Sep 2017 00:54:11 +0530
Message-Id: <1504812251-23438-6-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [Qemu devel v8 PATCH 5/5] msf2: Add Emcraft's
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
X-TUID: vpHn3Ae3oNot

Emulated Emcraft's Smartfusion2 System On Module starter
kit.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/Makefile.objs |  2 +-
 hw/arm/msf2-som.c    | 95 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/msf2-som.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index df36a03..e81a7dc 100644
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
index 0000000..bc917db
--- /dev/null
+++ b/hw/arm/msf2-som.c
@@ -0,0 +1,95 @@
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
+    mc->ignore_memory_transaction_failures = true;
+}
+
+DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
-- 
2.5.0


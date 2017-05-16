Received: by 10.25.0.6 with SMTP id 6csp1934726lfa;
        Tue, 16 May 2017 08:41:42 -0700 (PDT)
X-Received: by 10.55.217.93 with SMTP id u90mr10306929qki.277.1494949302689;
        Tue, 16 May 2017 08:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494949302; cv=none;
        d=google.com; s=arc-20160816;
        b=smFHu0ActimOZg5SYXh/JV+pVQjusWhShUzhPIrsMOy29iq7zeiNjNyBaL0tJOGD5V
         Dd6HLVhM3IE98+AZLpxXsJlaV3MVe91+/ZARsnHqP2fsHC7lrYNVWId0ygu95jUs1CNA
         KodVdYu5kXnc9SmJKJpU3tMtkwj23bVfLcGhFcw9QI7RIwvnaLN64fbJIAUeXoH5y+/b
         WfLNH3+zDojY/MPU2eCeV2ysyxTCkeaY72iv+YQLEWNmJr7wx8qODO+tgyZAudryzPbu
         3KVIPW321+TLdsY06nN7xz8oQhSkdCE3/v1qj7kZOy8T5wvqM0/mHAn4UBJ7sNzgye1E
         N6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=aywxKvK/yIN6/uD5W+MJ5laPhT1Atki/l/dyC9AM01M=;
        b=j+UDaTz7gIfFgpchKP1wu9N32FFwnVTmuHXI8b0OiY5VRyYqYFNLNJOpyPQc206wm3
         3q8OkAfSEtHk9wufHFWPjhNtU/HU8IH3sGjL4/VkzGKA2v27aS2rQlh0nPqWOWB5gPeY
         4udZQg3bIxbNGjb8NbCHOnumtvvBaIn3u31f3Dxve5j9m26gEJ4y/IWnOwHo1teEZAzz
         BWS6rkAWJ3LfmqI0STZvNCrX6o7Ed605anjsZvvWgh8jcgN7CYauegEqBixbi2XUQbeh
         ltIHXS1agloQUCslIbDFqeT9JtFT4CN6E6v5p6wewZOIvOrNQXTMGEYMgcArVJiCzdmp
         uMjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 44si13709566qtn.173.2017.05.16.08.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 08:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAebW-00040g-0H
	for alex.bennee@linaro.org; Tue, 16 May 2017 11:41:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAeZZ-0002ch-AT
	for qemu-devel@nongnu.org; Tue, 16 May 2017 11:39:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAeZW-0001bu-5Y
	for qemu-devel@nongnu.org; Tue, 16 May 2017 11:39:41 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:35585)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dAeZV-0001bB-U1; Tue, 16 May 2017 11:39:38 -0400
Received: by mail-pg0-x243.google.com with SMTP id i63so21845124pgd.2;
	Tue, 16 May 2017 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aywxKvK/yIN6/uD5W+MJ5laPhT1Atki/l/dyC9AM01M=;
	b=kIOYkmQJ9ZMU0uEELBJDdNU4DIJFxwGWcX3jHRGAFM5xUMTDhA5AZ1u79T0JkQnXgn
	NP525+TTIh80tMx5iPRt+ca9koUvgJeVLsjbJ2VTSUwkX4cVcYPUPBEXkTalTw6yBdWq
	1FVD6/pVwXfUgkVRImWM5QpmPJGnhiyRb3YdvZ0bbv/DeAwGatmz73Ee844A8FgSlOrn
	eGQA1ZVZK9HZ9jWKNeGQt0sST6tXG7KLCZihtxA/02njADCx14imYyIpgTX0T+Byy4R1
	woot0HGXyBm57Kz9nv8iDxUQNEjkOqPp/xJJ8TkEdlXtYV6rr6Zvt8IViNBrx21BOIts
	6HwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aywxKvK/yIN6/uD5W+MJ5laPhT1Atki/l/dyC9AM01M=;
	b=dB22MQZjKFdbmZvXa7o+ZLBewy9nq0o1U41mW3pzX0o9Ghdup0xO/2kWqSqDJs7ek0
	JZ1V1VWjlBhVfCvLJj6tDRC6yCM+rNDNMveE/wwNV0BqBdkhtDlOp/R1Z8w2RX/RS0C1
	K/VvXl5Wc5yj5ikCDOvgrzNaf/cMk5i2QfIv905pIo/VRDmPANHZVM1mfQkFoZYFCQRN
	UmpN1rqHKWZvSkdxrIbaemvYYzPRvjI/k6Q8xk+GVmLMzI99fVdK809XksGDeHoq6aal
	nwV0u+vY1cTavTrFHCWyl/2qepATFW6fM36xIqucJWaX6huSOpknt3cmesrqSAI/CWal
	1UYA==
X-Gm-Message-State: AODbwcARzRJrjh8A0HnR3X6M+vzI2WXabiQeqUetp3PQ/hacXRDvY4Kc
	dNIIpOtBu9Eb4g==
X-Received: by 10.98.65.216 with SMTP id g85mr13205260pfd.187.1494949177022;
	Tue, 16 May 2017 08:39:37 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	d86sm27874895pfj.75.2017.05.16.08.39.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 08:39:36 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 16 May 2017 21:08:53 +0530
Message-Id: <1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [Qemu devel v5 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit.
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
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	f4bug@amsat.org, alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MVCaFl/9ou14

Emulated Emcraft's Smartfusion2 System On Module starter
kit.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/arm/Makefile.objs |  1 +
 hw/arm/msf2-som.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 hw/arm/msf2-som.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index c828061..4b02093 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
 obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
 obj-y += netduino2.o
+obj-y += msf2-som.o
 obj-y += sysbus-fdt.o
 
 obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
new file mode 100644
index 0000000..cd2b759
--- /dev/null
+++ b/hw/arm/msf2-som.c
@@ -0,0 +1,89 @@
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
+     * pclk0 and pclk1 are configurable in Libero.
+     * Emcraft's SoM kit comes with these settings by default.
+     */
+    qdev_prop_set_uint32(dev, "pclk0", 71 * 1000000);
+    qdev_prop_set_uint32(dev, "pclk1", 71 * 1000000);
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
+DEFINE_MACHINE("smartfusion2-som", emcraft_sf2_machine_init)
-- 
2.5.0


Received: by 10.223.172.38 with SMTP id v35csp1112447wrc;
        Wed, 20 Sep 2017 13:21:49 -0700 (PDT)
X-Received: by 10.233.221.3 with SMTP id r3mr8714318qkf.219.1505938909059;
        Wed, 20 Sep 2017 13:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505938909; cv=none;
        d=google.com; s=arc-20160816;
        b=DOvKxI/Z5x8b5iA3QZ2mLlr/CTzKYdfDDvZlIiL9ESQI9dyPFeXefXQCcXkJZVmBnE
         GznlTGFbV2RmaZhF9e0PRDgK0ta7uEoiL1Zb3DI++Yt0fzpLyKZo4UI3QXwvxZRZke8Q
         /zPpJjdOCJGXLICL7NqdvvfmhtnMdpKfKLSO2kgyuiUYNHdN5LFyOy/ARabJqBHqg1F6
         fe2EVmvLhpfBb2RrjdHoWNnodl11WzREDsOAxqKviEdLt1M+Xzzlkq/MYrzyfbbUqQRK
         ICIhK6JsBs3oWRqyNaqiUAlnt2Izdx+C2N1HV80wx51TtGDiul85LkHLfIdrvXDaSU+h
         +MsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=NSB4Ej7TPqedakjNn6xhZSGLsjgJlGs65dFNfPJaMBs=;
        b=qn9BZkVxDkPeBxO2CcwP+beASD25thf1JzDMnwQ08+kCJ9aK2I1rb7aMWvqAJxsNLG
         iCX9OO36BW0b796Mzb3iNkWuMmjrP0D5QEVV3wldWmvCJUQyt/zNWBfMP4a1zJJL2qdj
         nLblHZjMjYfJpB+X7uDZ/aek6uJt0aq3CsqJ+NG6TAUjtsqjfu1k1TUfjHqaOiN7iUOU
         BKF4q0yPdiQlX1sf5+dfYv8PhdfKRFL17Tyvt5QxiggxNuZnA8hIW8riA+lR2fbbyPz4
         b79kn/yxuaEoKZVs/KaeruS3Q2bz0OzYo1Gkgr88RN1Vd8FJC7z3PiaxOXDgN4KrYnEn
         K9HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H/Zz7rji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y10si2483898qkl.269.2017.09.20.13.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 13:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H/Zz7rji;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dulVC-0002J9-Om
	for alex.bennee@linaro.org; Wed, 20 Sep 2017 16:21:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRl-0007yl-6t
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 16:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRj-0002kw-TX
	for qemu-arm@nongnu.org; Wed, 20 Sep 2017 16:18:13 -0400
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:50843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dulRe-0002gy-LZ; Wed, 20 Sep 2017 16:18:06 -0400
Received: by mail-qk0-x22d.google.com with SMTP id s132so3891332qke.7;
	Wed, 20 Sep 2017 13:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NSB4Ej7TPqedakjNn6xhZSGLsjgJlGs65dFNfPJaMBs=;
	b=H/Zz7rjik0274TkuoEdXLVgVF+dPNFojZPqTwsvqNs+vre48AQvZfKu0ZO/MIvItF1
	f5hvHE0jCV3916/xcGiQok1FcvaJ/1N38TB20NZdOfJYNz0XeKXudEb6/Rv4R2yBwkOD
	obWomnFcO8R5qGkwTwRCM96Okg454uXAierYtnXdvQv+dy1hQBoM29584uXzAkhtOHHb
	fTepOkeS4ViN6RYnQgms38RZI94c24dAPwlT7twbzfavb1qCZIm4LJcil8m0hoc+sEEr
	BCPhhy6R9kVDf6heL82LfFiCWJJLXrt0BDKAx6t8YNdXncLGrC9GxIcvKYzeYx5co683
	24Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NSB4Ej7TPqedakjNn6xhZSGLsjgJlGs65dFNfPJaMBs=;
	b=cQuY3eJX5sW3YWkVYgES8TbOPPlPkkIGdCM111IorBP/Vq1VxTnqzgXQUkwQ0ixXd2
	qMI7wXAyHZHOB5bqRxlV/QYKqD0x2vJxkt47AZDLMwyS5kUFawL2HUYCLqunip4aBmSF
	0IKosvX5+kWwUFIg7pAwWx59DmNfdW9LUTYXdiVT8HeW3dkvYLLRaFNX9U71P19xj7hw
	TYLSthx2SH2N+dG03orfU9lVcReMRCJCWil1BB4rT7bQ+DwQGAopgpxMX1/uEU/lB3km
	RC6xBSnhCYj6F/Pu8nD64pdkbXcU2cY+DL9cqDESJNaT9H5G8Xko9GgQcELlwmCstcYf
	Y+Lw==
X-Gm-Message-State: AHPjjUgZmyjbJqbmUrtJ6fqGjysH7KmGRhNrWOzT30DFr+hsnbyXNp9b
	Z7O6/x9/Zij+2omsyv/a+7g=
X-Google-Smtp-Source: AOwi7QCtwIs6MmcCb3Osgvdkw3jiXkwqxbfh+YX1WPNFVGW/8XjhDsfALlGT5wAEeUDk4Act7sFkLQ==
X-Received: by 10.55.209.79 with SMTP id s76mr9290600qki.238.1505938686119;
	Wed, 20 Sep 2017 13:18:06 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u52sm1953092qtb.34.2017.09.20.13.18.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 13:18:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 20 Sep 2017 17:17:37 -0300
Message-Id: <20170920201737.25723-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170920201737.25723-1-f4bug@amsat.org>
References: <20170920201737.25723-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22d
Subject: [Qemu-arm] [PATCH v11 5/5] msf2: Add Emcraft's Smartfusion2 SOM kit
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r4EZE/EoUGA9

From: Subbaraya Sundeep <sundeep.lkml@gmail.com>

Emulated Emcraft's Smartfusion2 System On Module starter
kit.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: drop cpu_model to directly use cpu type]
---
 hw/arm/msf2-som.c    | 105 +++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/Makefile.objs |   2 +-
 2 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/msf2-som.c

diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
new file mode 100644
index 0000000000..0795a3a3a1
--- /dev/null
+++ b/hw/arm/msf2-som.c
@@ -0,0 +1,105 @@
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
+#include "qemu/error-report.h"
+#include "hw/boards.h"
+#include "hw/arm/arm.h"
+#include "exec/address-spaces.h"
+#include "qemu/cutils.h"
+#include "hw/arm/msf2-soc.h"
+#include "cpu.h"
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
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    DriveInfo *dinfo = drive_get_next(IF_MTD);
+    qemu_irq cs_line;
+    SSIBus *spi_bus;
+    MemoryRegion *sysmem = get_system_memory();
+    MemoryRegion *ddr = g_new(MemoryRegion, 1);
+
+    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
+        error_report("This board can only be used with CPU %s",
+                     mc->default_cpu_type);
+    }
+
+    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
+                           &error_fatal);
+    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
+
+    dev = qdev_create(NULL, TYPE_MSF2_SOC);
+    qdev_prop_set_string(dev, "part-name", "M2S010");
+    qdev_prop_set_string(dev, "cpu-type", mc->default_cpu_type);
+
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
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m3");
+}
+
+DEFINE_MACHINE("emcraft-sf2", emcraft_sf2_machine_init)
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index a6cf24f6ac..2794e086d6 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -19,4 +19,4 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
-obj-$(CONFIG_MSF2) += msf2-soc.o
+obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
-- 
2.14.1


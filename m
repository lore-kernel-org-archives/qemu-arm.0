Received: by 10.25.0.144 with SMTP id 138csp289477lfa;
        Fri, 28 Apr 2017 09:56:04 -0700 (PDT)
X-Received: by 10.200.51.70 with SMTP id u6mr10746553qta.122.1493398564198;
        Fri, 28 Apr 2017 09:56:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q3si6656196qte.107.2017.04.28.09.56.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 09:56:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d49Bb-0006QB-JZ
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 12:56:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498V-0003zY-JV
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 12:52:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498U-0006ED-CN
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 12:52:51 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:33244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d498R-0006C4-O6; Fri, 28 Apr 2017 12:52:47 -0400
Received: by mail-pg0-x242.google.com with SMTP id v20so3743076pgn.0;
	Fri, 28 Apr 2017 09:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/ZGleY/AklM7AW1THFbc8eJzJwhHSGrXZZNywEWEZ14=;
	b=jtRzLF+NF1HXx7sBeyy3YYpzU1EZrq/hRvPSZIprhq9vdQmBIdZEvJEWndizqd2xxb
	K7YlbXff37MnXLphjt9wwcWZtLHXYrxc1SuiT2Bk29aPFz1mek7x5h78D1VcX/djD3xs
	qMo+N4Dhjt49oZX4Rh//S0b442TGQB/mJZDx6OZI61HaoikvgwQuy+7K3gM8d+dX4Ji8
	zKC1jYLfhsTRFbP+ET7ufYgZsmnCfJ3LYBFAvs+5ioYw5hlEwT+2yv4RJelAo/+H8BSf
	byqg9GUSizM9DnRbCqxF9+VaUEMANj6RI/Wg4w4fwy/ZmMP9exqGCEX+k069ZPUF2xsp
	yDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/ZGleY/AklM7AW1THFbc8eJzJwhHSGrXZZNywEWEZ14=;
	b=ZaFcHno2kZr2jQmpuGQwcxNhG9X5GxBXH7Tmauewb8Ayis1oC53BTHdI9d4GPwCDcK
	zD608yF1n0x1gZN44sG4vZAw2jXbwnQMX2HXzHBNLQPOmxWP8rAAdcKcPep7k9/UxlGK
	rzySAri5yL9H1XHJxg+nZVRKjvD6M2o6wMtDVzzTwFFvAP1/Z2zNYyjAXBmEW0CsbuST
	7rZF40hLZ2xRtna8K51Nw6BC66q4ZIajgaWV/0zj/QiFiBE/sFBfz7xnUnDuumDm+Ry5
	4qO9m27KldZhS7T00z2kVGKwsW5LQy+QlonEEQC3oyaiZ2U3w3ZOIl5RPAxe8BnLN9ws
	sfCw==
X-Gm-Message-State: AN3rC/55JlT8EbfMuJyC84CbHMJsd2bFYylile3nrJgYwJwGsid9AjCa
	Xn79Mgxo5UVniw==
X-Received: by 10.84.224.70 with SMTP id a6mr16438618plt.25.1493398366838;
	Fri, 28 Apr 2017 09:52:46 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	r86sm11383528pfb.24.2017.04.28.09.52.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Apr 2017 09:52:46 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 28 Apr 2017 22:21:53 +0530
Message-Id: <1493398313-6673-6-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
References: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [Qemu-devel RFC v3 5/5] msf2: Add Emcraft's Smartfusion2
 SOM kit.
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
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d60pUTJSdRzI

Emulated Emcraft's Smartfusion2 System On Module starter
kit.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/arm/Makefile.objs |  1 +
 hw/arm/msf2_som.c    | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 hw/arm/msf2_som.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index cce2759..d0b7093 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2_soc.o
 obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
 obj-y += netduino2.o
+obj-y += msf2_som.o
 obj-y += sysbus-fdt.o
 
 obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
diff --git a/hw/arm/msf2_som.c b/hw/arm/msf2_som.c
new file mode 100644
index 0000000..c41edd5
--- /dev/null
+++ b/hw/arm/msf2_som.c
@@ -0,0 +1,68 @@
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
+#include "hw/arm/msf2_soc.h"
+#include "hw/arm/arm.h"
+
+static void msf2_init(MachineState *machine)
+{
+    DeviceState *dev;
+    DeviceState *spi_flash;
+    MSF2State *soc;
+    DriveInfo *dinfo = drive_get_next(IF_MTD);
+    qemu_irq cs_line;
+    SSIBus *spi_bus;
+
+    dev = qdev_create(NULL, TYPE_MSF2_SOC);
+    qdev_prop_set_string(dev, "cpu-model", "cortex-m3");
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
+                       ENVM_SIZE);
+}
+
+static void msf2_machine_init(MachineClass *mc)
+{
+    mc->desc = "SmartFusion2 SOM kit from Emcraft";
+    mc->init = msf2_init;
+}
+
+DEFINE_MACHINE("smartfusion2-som", msf2_machine_init)
-- 
2.5.0


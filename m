Received: by 10.25.0.6 with SMTP id 6csp228867lfa;
        Tue, 9 May 2017 09:50:43 -0700 (PDT)
X-Received: by 10.55.139.130 with SMTP id n124mr1026653qkd.299.1494348643713;
        Tue, 09 May 2017 09:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494348643; cv=none;
        d=google.com; s=arc-20160816;
        b=zLAIfzZfv6go8D8ErFqsU6NdrCtj/5g5brGL6Te3NizYGi0naf9/Oj7jYwffg6uQwU
         TJv6Frf3ZBkLaIpmLc8/L/VpLIEg6lsymyedFdnjPbvV905SE3+iGBa+TDfJSOMdr3c7
         5hUK5asWqC9ZtUXK+absPJ8mZwjfmxF3JHYi5/gY4d6tDNxEHAF4Vmft2gxCt5wKk1sQ
         j8bsFuowc/DsDE8xx7vrch2DFFXr45zVOksEXtF9Um7h3VRzAsDEBuwvhyWzZ25XYbiJ
         Ex5p3vs+Hq2oQmJ7jWmk6ESwthAH8c406o1GXhUDDLRnG4VvDH3Mw4bJuhYcKKtgrMiY
         ND2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=M6c8j8PJaWzbXcwzB83WsWJ2TQ4a9xttGRlxjYOPyC8=;
        b=H5RMIIrC02IVWgGjYfqDpvE4kAR/DGWV8F/u+8CrX5b7BjjTg1iYjQeil2fMVklcN7
         klwyauhk583jr4rtJMjnGUUYdQ77gNWNvoTxUXGLtJPCce27l8vrQO7EO/jqmrAFrPRV
         Buh6ZazK+WMr7LeVWcJwrggHFdmBKX9yKkViXcHmDZlhQeprJm2tGTVOlP+/RJM8Bz8d
         E77k+WcuNmJtzG/CSo7t92k8H53MHE7NJvJaG+nbcE03GHj8cvRbhz8/UVRh12NXVkOj
         l2nVGjxtslWxkkLjQJaPMGmjlrFl0QiTbJYocodvwIHcIuULES2wNlFtWCLcEIxHFTRK
         30gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s123si530027qkh.294.2017.05.09.09.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 May 2017 09:50:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38224 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d88LT-0003ho-62
	for alex.bennee@linaro.org; Tue, 09 May 2017 12:50:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56449)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d88Gf-0008AL-Ul
	for qemu-devel@nongnu.org; Tue, 09 May 2017 12:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d88Gd-0005Ju-Pu
	for qemu-devel@nongnu.org; Tue, 09 May 2017 12:45:45 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34115)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d88Gd-0005Jf-Jj; Tue, 09 May 2017 12:45:43 -0400
Received: by mail-pg0-x244.google.com with SMTP id u187so607395pgb.1;
	Tue, 09 May 2017 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M6c8j8PJaWzbXcwzB83WsWJ2TQ4a9xttGRlxjYOPyC8=;
	b=MR37wIt8Cpt44P4lISx+NkJ0jp/r26hYeS7r7BeVpAmTvcFp91eZdOvL7giqPQPaY9
	X+eLCcBxtgCyB+ZE5sVhfQ3RoMI4YVyrlHnE8ugHhhx4ARS+NiKzanJ7RJdjneAbjBQN
	Y0PT9OsjHaH2e9xOx479plNfV06C/BIDXREPmceXsSZi28LOE76R8JiuB1wMDi8zD8K7
	XuhqxbiA8TTdi/e6GTol5uo0bYJZXn5sZqdHbRChXR58IoNozb9iXGt88h17kWwDSCKI
	T/7AKa7/2HLQi0v0DMV44ePuQUsGXt1WWjSUwagQgMpHDCwiYOU5mG9bokrgEcKg0FRh
	dEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M6c8j8PJaWzbXcwzB83WsWJ2TQ4a9xttGRlxjYOPyC8=;
	b=dfBcmR8682M19pQVLKOPkLkFnfygFR2b78Fs0kFG83uILeseOY0onj8gIrpJNppK9O
	nM8FWc87oqlTUgn6zyHEzzXvqI/ma7SAPUihEGleBWMQY5RB7QA97tdrkrIgbMNOuWRg
	MQ14chqNss95ZNQ1mQWYc0X6dGxOXro5cJjKu3nwfsx60VvHV489UdeUl/FizeuI442x
	1h5cjkLJmiKuxEN4JFm53u8JvBWoS31sshZAL2FnJU6O/QrkMMrFnhTOpjbowQr4Xm3S
	X1Gfl4qjA2n2C8Q0PM/dolSPJUBz04cYjeTLQSnvdAXoRIMKNk71Saa8o8qawFQ1cN/t
	v0Fg==
X-Gm-Message-State: AODbwcA5lPX5XZNyZwpSeTCKccdpXvJBy1JhBWcecJ8Fou+ncnCbahbX
	pQepClbdsseqz9RM
X-Received: by 10.99.38.5 with SMTP id m5mr1149544pgm.203.1494348342408;
	Tue, 09 May 2017 09:45:42 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	o194sm833320pfg.117.2017.05.09.09.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 May 2017 09:45:41 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue,  9 May 2017 22:14:46 +0530
Message-Id: <1494348286-10253-6-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-devel] [Qemu-devel PATCH 5/5] msf2: Add Emcraft's
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
	alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FdS7VBigvxkr

Emulated Emcraft's Smartfusion2 System On Module starter
kit.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/arm/Makefile.objs |  1 +
 hw/arm/msf2-som.c    | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 hw/arm/msf2-som.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index ae5e4a3..b626a43 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2-soc.o
 obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
 obj-y += netduino2.o
+obj-y += msf2-som.o
 obj-y += sysbus-fdt.o
 
 obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
new file mode 100644
index 0000000..bc44169
--- /dev/null
+++ b/hw/arm/msf2-som.c
@@ -0,0 +1,67 @@
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


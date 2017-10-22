Received: by 10.223.197.9 with SMTP id q9csp9820372wrf;
        Sun, 22 Oct 2017 10:09:56 -0700 (PDT)
X-Received: by 10.55.59.131 with SMTP id i125mr15148445qka.93.1508692195962;
        Sun, 22 Oct 2017 10:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508692195; cv=none;
        d=google.com; s=arc-20160816;
        b=O8fAR+gr28eji7m5l/CamqUP17+Vxi2QzTucO2xNXPQUKemjX+c8hFiVe/NWJa02qz
         BwAfLKGlvXvcqWGOGe/NoQnrtCaisi1PSjG3pFGM6IA3q6FoF5vkdyw91qokwE+O3RgX
         7eXTy1eL9u9QDGw++UlIkN3SLC/KDWLSp7cLFWT1Hhr+lKOuD8cMnM/jsMnckNOYTd4s
         6lZQgRvU5/KWndJzkonelUYyI2isRepryaDiCFokbT1tgGL2DIBtCl3w8NrcoMZ/IwUq
         uIU6EVAY0h5IHz8Z0TkW6MhM38bEQdbqKAnvga2EyF2E94MGEmoyiW+qx9Vrpe+L8LWz
         gJOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=9Em8S9n2hw+4j2+NfAFILyr7oDIjLcHiZYHaArh19UE=;
        b=mfQ6Y/XENhR0p0Mwxk6x43ZfiPOsAPMxI34tLBCBlm0GU5leWgZLD21PJCkuFfgrXJ
         zZHLVj8DYy4RgJxz3LU5XzaZHWh6un5dFfYtfk2diUFth1HFqCLzrwp9+lwZAuuV053d
         QHnAqI4ftO+CDgZMt2Qj7hu3Si53mxc5NcgZgqz1AUNTRwmx7+SIFQB2ytTXz9ddIXqL
         oY8/k9Y3nIx/IUq6uH2VzVCNENtcxecnZPdMff3E34AHomGalbDEI9doUAfdJwl43m9d
         TrsLu+UYoFOfd5zRvmKKLaE7z6jQpVysLKPFvuJVBaP0BWX01LLnKwfIIXEHQ/OHO4HM
         m7IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=Fjbp5lIG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z187si30468qke.51.2017.10.22.10.09.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 22 Oct 2017 10:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=Fjbp5lIG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6Jl3-0002nG-Hb
	for alex.bennee@linaro.org; Sun, 22 Oct 2017 13:09:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1e6H6d-0005FP-CX
	for qemu-devel@nongnu.org; Sun, 22 Oct 2017 10:20:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1e6H6Z-0001xu-7Q
	for qemu-devel@nongnu.org; Sun, 22 Oct 2017 10:19:59 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:45401)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1e6H6Y-0001xG-QO; Sun, 22 Oct 2017 10:19:55 -0400
Received: by mail-pf0-x241.google.com with SMTP id d28so15274178pfe.2;
	Sun, 22 Oct 2017 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=A57gk7lGMCdKt5UNDJv+kzOtjg7HAEe1JaB8z8HQh7A=;
	b=Fjbp5lIGcorVWXXVTzqzMnJn33IxP5KVr2Da8AKp9bMNqvec0xsFh5iBtzuUGMxOaH
	JMdHty0bG9km+Bdx4n0of/B1Mi3XoYAGygG257rZPLOWvUkZAwV6+vYKTPD/vWFO4Njq
	daajvIbdyWitkqHLv51tjcClsP/rwP9o6Fd84sP16m0ZOo/4KOYz3Sdk3X8w3GtpH3XT
	NdVScWa0fpn6+zrJ5QKs5G/070NZ5VvLRvkX5SSUiaAJ/O+dq+AK8+8H2sSUfYN/jyuD
	ri60jX/q5uPYKekM2jNgIUc3TqeBOE97PywYrEQVmemrk4lnikhoJqXns6nJMI4Xl72S
	zUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=A57gk7lGMCdKt5UNDJv+kzOtjg7HAEe1JaB8z8HQh7A=;
	b=d3Z8HMGM6WBjR9JThx5QKIKcwKbtyPWGtjH6+H2+AUwQ/U91PJyJPIZj9k7ybfH2zd
	xy/BL3o8ljsc8dvjAoo907PNPBE5O2sDi2agzP2PoLc2ET2woVnZ1RBalyuzMyYPY2Kr
	xD0LzaJdFfa35/psOS3JFZ//MdRFyLbKfp9UgKfyqFm7Qq+kpdCiSQwhbeMU4HhMDSIL
	ahsTiN3wKhFX0I2qCdtIdtdNVG0K6pC4ZE9y1pIukEzBM8H/s3Kd3I9tpH5Pop9f7V7m
	RtOF4BlAtWLa/B9FBZsll/r1mosBgbVpi6LKE3NK+xtiL3cFoD14ccQEw/Uk1CdKeE8h
	HM0w==
X-Gm-Message-State: AMCzsaVKtkvmh6TjepAw4tQAIgZx0V+WNIEkFsGUu1vP55Lnd7gLtdor
	7O1Tc80HvaRff/58tlVwhkRbHuntukZft0n7kiOYmA==
X-Google-Smtp-Source: ABhQp+QFlMnxBQVEo/j4eH8lMSWB4qZCLd3AUKG5zFXXNHAhfR4E9Qyj6iSsuFxwl1sIWc1jja0hU4Mhg/273f0NA7M=
X-Received: by 10.98.163.2 with SMTP id s2mr10461384pfe.242.1508678437506;
	Sun, 22 Oct 2017 06:20:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.155.102 with HTTP; Sun, 22 Oct 2017 06:20:37 -0700 (PDT)
From: bzt bzt <bztemail@gmail.com>
Date: Sun, 22 Oct 2017 15:20:37 +0200
Message-ID: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
X-Mailman-Approved-At: Sun, 22 Oct 2017 13:08:14 -0400
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cSDjqBnBmZx1

Dear All,

I've added support for "-M raspi3" to qemu. This is my first patch, I hope
it's okay. The github repo is here: https://github.com/bztsrc/qemu-raspi3
in case my patch does not work for some reason.

From 1f10f957b57f336728097803bf8339a5577dd3c2 Mon Sep 17 00:00:00 2001
From: bzt <bztemail@gmail.com>
Date: Sun, 22 Oct 2017 14:59:20 +0200
Subject: [PATCH] BCM2837 and machine raspi3

Signed-off-by: bzt <bztemail@gmail.com>
---
 hw/arm/Makefile.objs            |   2 +-
 hw/arm/bcm2835_peripherals.c    |  10 ++-
 hw/arm/bcm2836.c                |   6 --
 hw/arm/bcm2837.c                | 179
++++++++++++++++++++++++++++++++++++++++
 hw/arm/raspi.c                  |  79 ++++++++++++++++--
 include/hw/arm/bcm2836.h        |   6 ++
 include/hw/arm/bcm2837.h        |  19 +++++
 include/hw/arm/raspi_platform.h |   2 +-
 8 files changed, 287 insertions(+), 16 deletions(-)
 create mode 100644 hw/arm/bcm2837.c
 create mode 100644 include/hw/arm/bcm2837.h

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2794e08..72b60e1 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -11,7 +11,7 @@ obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o
pxa2xx_pic.o
 obj-$(CONFIG_DIGIC) += digic.o
 obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
-obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
+obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o bcm2837.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-zcu102.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd1..f79ce36 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -212,7 +212,15 @@ static void bcm2835_peripherals_realize(DeviceState
*dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
-
+    // check if parameters are valid
+    if (ram_size < vcram_size + 64*1024*1024) {
+        error_setg(errp, "%s: not enough ram for VideoCore",
+                   __func__);
+        return;
+    }
+    // if vcram_size is bigger than ram_size, this will silently overflow
+    // and generate a not very informative "Parameter 'vcram-base' expects
+    // uint32_t" message...
     object_property_set_uint(OBJECT(&s->fb), ram_size - vcram_size,
                              "vcram-base", &err);
     if (err) {
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index 8c43291..db40c8e 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -17,12 +17,6 @@
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"

-/* Peripheral base address seen by the CPU */
-#define BCM2836_PERI_BASE       0x3F000000
-
-/* "QA7" (Pi2) interrupt controller and mailboxes etc. */
-#define BCM2836_CONTROL_BASE    0x40000000
-
 static void bcm2836_init(Object *obj)
 {
     BCM2836State *s = BCM2836(obj);
diff --git a/hw/arm/bcm2837.c b/hw/arm/bcm2837.c
new file mode 100644
index 0000000..1bab93b
--- /dev/null
+++ b/hw/arm/bcm2837.c
@@ -0,0 +1,179 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
+ *
+ * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * Raspberry Pi 3 emulation 2017 by bzt
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "hw/arm/bcm2836.h"
+#include "hw/arm/bcm2837.h"
+#include "hw/arm/raspi_platform.h"
+#include "hw/sysbus.h"
+#include "exec/address-spaces.h"
+
+/* According to
https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2837/README.md
+ * The underlying architecture of the BCM2837 is identical to the BCM2836.
The only significant
+ * difference is the replacement of the ARMv7 quad core cluster with a
quad-core ARM Cortex A53
+ * (ARMv8) cluster. So we use cortex-a53- here. */
+
+static void bcm2837_init(Object *obj)
+{
+    BCM2836State *s = BCM2837(obj);
+    int n;
+
+    for (n = 0; n < BCM2836_NCPUS; n++) {
+        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
+                          "cortex-a53-" TYPE_ARM_CPU);
+        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
+                                  &error_abort);
+    }
+
+    object_initialize(&s->control, sizeof(s->control),
TYPE_BCM2836_CONTROL);
+    object_property_add_child(obj, "control", OBJECT(&s->control), NULL);
+    qdev_set_parent_bus(DEVICE(&s->control), sysbus_get_default());
+
+    object_initialize(&s->peripherals, sizeof(s->peripherals),
+                      TYPE_BCM2835_PERIPHERALS);
+    object_property_add_child(obj, "peripherals", OBJECT(&s->peripherals),
+                              &error_abort);
+    object_property_add_alias(obj, "board-rev", OBJECT(&s->peripherals),
+                              "board-rev", &error_abort);
+    object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
+                              "vcram-size", &error_abort);
+    qdev_set_parent_bus(DEVICE(&s->peripherals), sysbus_get_default());
+}
+
+static void bcm2837_realize(DeviceState *dev, Error **errp)
+{
+    BCM2836State *s = BCM2837(dev);
+    Object *obj;
+    Error *err = NULL;
+    int n;
+
+    /* common peripherals from bcm2835 */
+
+    obj = object_property_get_link(OBJECT(dev), "ram", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required ram link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    object_property_add_const_link(OBJECT(&s->peripherals), "ram", obj,
&err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_bool(OBJECT(&s->peripherals), true, "realized",
&err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->peripherals),
+                              "sd-bus", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 0,
+                            BCM2836_PERI_BASE, 1);
+
+    /* bcm2836 interrupt controller (and mailboxes, etc.) */
+    object_property_set_bool(OBJECT(&s->control), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->control), 0, BCM2836_CONTROL_BASE);
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-irq", 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
+        qdev_get_gpio_in_named(DEVICE(&s->control), "gpu-fiq", 0));
+
+    for (n = 0; n < BCM2836_NCPUS; n++) {
+        /* Mirror bcm2836, which has clusterid set to 0xf
+         * TODO: this should be converted to a property of ARM_CPU
+         */
+        s->cpus[n].mp_affinity = 0xF00 | n;
+
+        /* set periphbase/CBAR value for CPU-local registers */
+        object_property_set_int(OBJECT(&s->cpus[n]),
+                                BCM2836_PERI_BASE + MCORE_OFFSET,
+                                "reset-cbar", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+
+        /* start powered off if not enabled */
+        object_property_set_bool(OBJECT(&s->cpus[n]), n >= s->enabled_cpus,
+                                 "start-powered-off", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+
+        object_property_set_bool(OBJECT(&s->cpus[n]), true, "realized",
&err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+
+        /* Connect irq/fiq outputs from the interrupt controller. */
+        qdev_connect_gpio_out_named(DEVICE(&s->control), "irq", n,
+                qdev_get_gpio_in(DEVICE(&s->cpus[n]), ARM_CPU_IRQ));
+        qdev_connect_gpio_out_named(DEVICE(&s->control), "fiq", n,
+                qdev_get_gpio_in(DEVICE(&s->cpus[n]), ARM_CPU_FIQ));
+
+        /* Connect timers from the CPU to the interrupt controller */
+        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_PHYS,
+                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpnsirq",
n));
+        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_VIRT,
+                qdev_get_gpio_in_named(DEVICE(&s->control), "cntvirq", n));
+        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_HYP,
+                qdev_get_gpio_in_named(DEVICE(&s->control), "cnthpirq",
n));
+        qdev_connect_gpio_out(DEVICE(&s->cpus[n]), GTIMER_SEC,
+                qdev_get_gpio_in_named(DEVICE(&s->control), "cntpsirq",
n));
+    }
+}
+
+static Property bcm2837_props[] = {
+    DEFINE_PROP_UINT32("enabled-cpus", BCM2836State, enabled_cpus,
BCM2836_NCPUS),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static void bcm2837_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    dc->props = bcm2837_props;
+    dc->realize = bcm2837_realize;
+}
+
+static const TypeInfo bcm2837_type_info = {
+    .name = TYPE_BCM2837,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2836State),
+    .instance_init = bcm2837_init,
+    .class_init = bcm2837_class_init,
+};
+
+static void bcm2837_register_types(void)
+{
+    type_register_static(&bcm2837_type_info);
+}
+
+type_init(bcm2837_register_types)
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 5941c9f..726a426 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -5,6 +5,8 @@
  * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
+ * Raspberry Pi 3 emulation 2017 by bzt
+ *
  * This code is licensed under the GNU GPLv2 and later.
  */

@@ -13,6 +15,7 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/arm/bcm2836.h"
+#include "hw/arm/bcm2837.h"
 #include "qemu/error-report.h"
 #include "hw/boards.h"
 #include "hw/loader.h"
@@ -22,10 +25,11 @@
 #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS
*/
 #define MVBAR_ADDR      0x400 /* secure vectors */
 #define BOARDSETUP_ADDR (MVBAR_ADDR + 0x20) /* board setup code */
-#define FIRMWARE_ADDR   0x8000 /* Pi loads kernel.img here by default */
+#define FIRMWARE_ADDR_2    0x8000 /* Pi 2 loads kernel.img here by default
*/
+#define FIRMWARE_ADDR_3   0x80000 /* Pi 3 loads kernel8.img here by
default */

 /* Table of Linux board IDs for different Pi versions */
-static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
+static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43, [3] = 0xc44};

 typedef struct RasPiState {
     BCM2836State soc;
@@ -73,6 +77,7 @@ static void reset_secondary(ARMCPU *cpu, const struct
arm_boot_info *info)
 static void setup_boot(MachineState *machine, int version, size_t ram_size)
 {
     static struct arm_boot_info binfo;
+    hwaddr entry;
     int r;

     binfo.board_id = raspi_boardid[version];
@@ -83,11 +88,12 @@ static void setup_boot(MachineState *machine, int
version, size_t ram_size)
     binfo.secure_board_setup = true;
     binfo.secure_boot = true;

-    /* Pi2 requires SMP setup */
-    if (version == 2) {
+    /* Pi2 and Pi3 requires SMP setup */
+    if (version == 2 || version == 3) {
         binfo.smp_loader_start = SMPBOOT_ADDR;
         binfo.write_secondary_boot = write_smpboot;
         binfo.secondary_cpu_reset_hook = reset_secondary;
+        entry = version == 2 ? FIRMWARE_ADDR_2 : FIRMWARE_ADDR_3;
     }

     /* If the user specified a "firmware" image (e.g. UEFI), we bypass
@@ -95,14 +101,14 @@ static void setup_boot(MachineState *machine, int
version, size_t ram_size)
      */
     if (machine->firmware) {
         /* load the firmware image (typically kernel.img) */
-        r = load_image_targphys(machine->firmware, FIRMWARE_ADDR,
-                                ram_size - FIRMWARE_ADDR);
+        r = load_image_targphys(machine->firmware, entry,
+                                ram_size - entry);
         if (r < 0) {
             error_report("Failed to load firmware from %s",
machine->firmware);
             exit(1);
         }

-        binfo.entry = FIRMWARE_ADDR;
+        binfo.entry = entry;
         binfo.firmware_loaded = true;
     } else {
         binfo.kernel_filename = machine->kernel_filename;
@@ -171,3 +177,62 @@ static void raspi2_machine_init(MachineClass *mc)
     mc->ignore_memory_transaction_failures = true;
 };
 DEFINE_MACHINE("raspi2", raspi2_machine_init)
+
+static void raspi3_init(MachineState *machine)
+{
+    RasPiState *s = g_new0(RasPiState, 1);
+    uint32_t vcram_size;
+    DriveInfo *di;
+    BlockBackend *blk;
+    BusState *bus;
+    DeviceState *carddev;
+
+    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2837);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
+                              &error_abort);
+
+    /* Allocate and map RAM */
+    memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
+                                         machine->ram_size);
+    /* FIXME: Remove when we have custom CPU address space support */
+    memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram,
0);
+
+    /* Setup the SOC */
+    object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
+                                   &error_abort);
+    object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
+                            &error_abort);
+    object_property_set_int(OBJECT(&s->soc), 0xa02082, "board-rev",
+                            &error_abort);
+    object_property_set_bool(OBJECT(&s->soc), true, "realized",
&error_abort);
+
+    /* Create and plug in the SD cards */
+    di = drive_get_next(IF_SD);
+    blk = di ? blk_by_legacy_dinfo(di) : NULL;
+    bus = qdev_get_child_bus(DEVICE(&s->soc), "sd-bus");
+    if (bus == NULL) {
+        error_report("No SD bus found in SOC object");
+        exit(1);
+    }
+    carddev = qdev_create(bus, TYPE_SD_CARD);
+    qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+    object_property_set_bool(OBJECT(carddev), true, "realized",
&error_fatal);
+
+    vcram_size = object_property_get_uint(OBJECT(&s->soc), "vcram-size",
+                                          &error_abort);
+    setup_boot(machine, 3, machine->ram_size - vcram_size);
+}
+
+static void raspi3_machine_init(MachineClass *mc)
+{
+    mc->desc = "Raspberry Pi 3";
+    mc->init = raspi3_init;
+    mc->block_default_type = IF_SD;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->max_cpus = BCM2836_NCPUS;
+    mc->default_ram_size = 1024 * 1024 * 1024;
+    mc->ignore_memory_transaction_failures = true;
+};
+DEFINE_MACHINE("raspi3", raspi3_machine_init)
diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
index 76de199..ee6b9dc 100644
--- a/include/hw/arm/bcm2836.h
+++ b/include/hw/arm/bcm2836.h
@@ -20,6 +20,12 @@

 #define BCM2836_NCPUS 4

+/* Peripheral base address seen by the CPU */
+#define BCM2836_PERI_BASE       0x3F000000
+
+/* "QA7" (Pi2/Pi8) interrupt controller and mailboxes etc. */
+#define BCM2836_CONTROL_BASE    0x40000000
+
 typedef struct BCM2836State {
     /*< private >*/
     DeviceState parent_obj;
diff --git a/include/hw/arm/bcm2837.h b/include/hw/arm/bcm2837.h
new file mode 100644
index 0000000..5c7be8a
--- /dev/null
+++ b/include/hw/arm/bcm2837.h
@@ -0,0 +1,19 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
+ *
+ * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2837_H
+#define BCM2837_H
+
+#include "hw/arm/bcm2836.h"
+
+#define TYPE_BCM2837 "bcm2837"
+#define BCM2837(obj) OBJECT_CHECK(BCM2836State, (obj), TYPE_BCM2837)
+
+#endif /* BCM2837_H */
diff --git a/include/hw/arm/raspi_platform.h
b/include/hw/arm/raspi_platform.h
index 6467e88..9e6910b 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -1,5 +1,5 @@
 /*
- * bcm2708 aka bcm2835/2836 aka Raspberry Pi/Pi2 SoC platform defines
+ * bcm2708 aka bcm2835/2836/2837 aka Raspberry Pi/Pi2 SoC platform defines
  *
  * These definitions are derived from those in Raspbian Linux at
  * arch/arm/mach-{bcm2708,bcm2709}/include/mach/platform.h
-- 
2.14.2

Received: by 10.25.0.144 with SMTP id 138csp104286lfa;
        Sat, 8 Apr 2017 00:08:08 -0700 (PDT)
X-Received: by 10.237.34.212 with SMTP id q20mr44189353qtc.5.1491635288372;
        Sat, 08 Apr 2017 00:08:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c144si7595244qkb.319.2017.04.08.00.08.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 08 Apr 2017 00:08:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53773 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cwkTf-0005eB-On
	for alex.bennee@linaro.org; Sat, 08 Apr 2017 03:08:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <omar.rizwan@gmail.com>) id 1cwjA0-00063B-8L
	for qemu-arm@nongnu.org; Sat, 08 Apr 2017 01:43:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <omar.rizwan@gmail.com>) id 1cwj9y-0001t1-KP
	for qemu-arm@nongnu.org; Sat, 08 Apr 2017 01:43:44 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:32960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <omar.rizwan@gmail.com>)
	id 1cwj9s-0001nS-VB; Sat, 08 Apr 2017 01:43:37 -0400
Received: by mail-pg0-x241.google.com with SMTP id 79so19330806pgf.0;
	Fri, 07 Apr 2017 22:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=T1WraSu+gBGBA5n2/fhkoG6OQ8d+U2g1styT7Sd9Rpk=;
	b=Wme4atN+EJKHmNsb8nSFtXSJsdiES0bjOSQr91TEKYhPV6E4Ye9nxyaIjzv5hClTsO
	m8EFtv+DWaHmSI2Q86751CJE6+zpum5qVEdSPbggGwJTnlYMUnyS+roSLCAmx3BcjTbl
	jRj72GQ6NgTaL0esmO/I5xH/7mbcu69oQ+zOnAa1iQggrmmN5TrHqbf5N+Mm1YMHMPHD
	jAhgQoeSJhPtD4WGPLke0tnMnT3a08N7sJOeV4GgkoKjkiDsH/G/WZzIcNgjE44Vnm83
	nMiHz4QhTWY2gDH5uKpoYZ0cM4tqXRcgF4jFDxD2RG9LPXZzmdb1GqzMrTrfPsdmjsQh
	gZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T1WraSu+gBGBA5n2/fhkoG6OQ8d+U2g1styT7Sd9Rpk=;
	b=oEdH9N0gjRgKU6fFrRG2WfGhHs/BId8PwDjusByB+ZVuY4E+MG+5DUMFmMGd+yKmGR
	X70801BR9kl0KwEVzeJ9DrIS0ca/nvPhbtTtCb6iWHqPIqP1PEoqfD9yAADqJ1ufj6Oe
	cinYUl6FHUzq7PyeJzU2ULSdIMOwwrUT6ysticyozQ8B0eabb+EsDpPOFKESxJ3Ree+h
	Q3ADedkk5UsONxCJj7+GXsOJNHE9tA4ev4nEfPCqCDVJ0xxwHM0eCkM0Pk+q+UWeyEe9
	HlvK/T/3EdLA1LT/ZcapEk7iVofUbQMiGjEg7TBrOMhAMgm4P/8OjISRAj6hGt6W+kZA
	03pA==
X-Gm-Message-State: AFeK/H38yJCZEjOSC9bTJZZ03mttXPxNZ0t93pFWWEWEgLWelfDLStwaQIgThrxbABr/bA==
X-Received: by 10.99.109.67 with SMTP id i64mr44600225pgc.56.1491630215564;
	Fri, 07 Apr 2017 22:43:35 -0700 (PDT)
Received: from DN0a22697f.SUNet (DN2lk5k05.stanford.edu. [171.66.208.5])
	by smtp.gmail.com with ESMTPSA id
	s17sm12589528pgo.27.2017.04.07.22.43.34
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Fri, 07 Apr 2017 22:43:34 -0700 (PDT)
From: Omar Rizwan <omar.rizwan@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri,  7 Apr 2017 22:43:18 -0700
Message-Id: <20170408054318.19830-1-omar.rizwan@gmail.com>
X-Mailer: git-send-email 2.10.1 (Apple Git-78)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::241
X-Mailman-Approved-At: Sat, 08 Apr 2017 03:07:58 -0400
Subject: [Qemu-arm] [PATCH] raspi: Add Raspberry Pi 1 support
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
	Omar Rizwan <omar.rizwan@gmail.com>, Andrew.Baumann@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HzvBM7EwV1HJ

Signed-off-by: Omar Rizwan <omar.rizwan@gmail.com>
---
 hw/arm/Makefile.objs         |   2 +-
 hw/arm/bcm2835.c             | 119 +++++++++++++++++++++++++++++++++++++++++++
 hw/arm/bcm2835_peripherals.c |   1 +
 hw/arm/raspi.c               |  47 ++++++++++++++---
 include/hw/arm/bcm2835.h     |  31 +++++++++++
 5 files changed, 191 insertions(+), 9 deletions(-)
 create mode 100644 hw/arm/bcm2835.c
 create mode 100644 include/hw/arm/bcm2835.h

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 4c5c4ee..77ef47f 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -11,7 +11,7 @@ obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
 obj-$(CONFIG_DIGIC) += digic.o
 obj-y += omap1.o omap2.o strongarm.o
 obj-$(CONFIG_ALLWINNER_A10) += allwinner-a10.o cubieboard.o
-obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2836.o raspi.o
+obj-$(CONFIG_RASPI) += bcm2835_peripherals.o bcm2835.o bcm2836.o raspi.o
 obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
diff --git a/hw/arm/bcm2835.c b/hw/arm/bcm2835.c
new file mode 100644
index 0000000..b19b86c
--- /dev/null
+++ b/hw/arm/bcm2835.c
@@ -0,0 +1,119 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
+ *
+ * Raspberry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * Rebase onto master (c) 2017 Omar Rizwan
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "hw/arm/bcm2835.h"
+#include "hw/arm/raspi_platform.h"
+#include "hw/sysbus.h"
+#include "exec/address-spaces.h"
+
+/* Peripheral base address seen by the CPU */
+#define BCM2835_PERI_BASE       0x20000000
+
+static void bcm2835_init(Object *obj)
+{
+    BCM2835State *s = BCM2835(obj);
+
+    object_initialize(&s->cpu, sizeof(s->cpu), "arm1176-" TYPE_ARM_CPU);
+    object_property_add_child(obj, "cpu", OBJECT(&s->cpu), &error_abort);
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
+static void bcm2835_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835State *s = BCM2835(dev);
+    Object *obj;
+    Error *err = NULL;
+
+    /* common peripherals from bcm2835 */
+    obj = object_property_get_link(OBJECT(dev), "ram", &err);
+    if (obj == NULL) {
+        error_setg(errp, "%s: required ram link not found: %s",
+                   __func__, error_get_pretty(err));
+        return;
+    }
+
+    object_property_add_const_link(OBJECT(&s->peripherals), "ram", obj, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_bool(OBJECT(&s->peripherals), true, "realized", &err);
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
+                            BCM2835_PERI_BASE, 1);
+
+    sysbus_mmio_map_overlap(SYS_BUS_DEVICE(&s->peripherals), 1,
+                            0x40000000, 1);
+
+    object_property_set_bool(OBJECT(&s->cpu), true, "realized", &err);
+    if (err) {
+        error_report_err(err);
+        exit(1);
+    }
+
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 0,
+                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_IRQ));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->peripherals), 1,
+                       qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
+
+}
+
+static void bcm2835_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = bcm2835_realize;
+
+    /*
+     * Reason: creates an ARM CPU, thus use after free(), see
+     * arm_cpu_class_init()
+     */
+    dc->cannot_destroy_with_object_finalize_yet = true;
+}
+
+static const TypeInfo bcm2835_type_info = {
+    .name = TYPE_BCM2835,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835State),
+    .instance_init = bcm2835_init,
+    .class_init = bcm2835_class_init,
+};
+
+static void bcm2835_register_types(void)
+{
+    type_register_static(&bcm2835_type_info);
+}
+
+type_init(bcm2835_register_types)
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 369ef1e..a6cd54a 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -34,6 +34,7 @@ static void bcm2835_peripherals_init(Object *obj)
     /* Internal memory region for peripheral bus addresses (not exported) */
     memory_region_init(&s->gpu_bus_mr, obj, "bcm2835-gpu", (uint64_t)1 << 32);
     object_property_add_child(obj, "gpu-bus", OBJECT(&s->gpu_bus_mr), NULL);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->gpu_bus_mr);
 
     /* Internal memory region for request/response communication with
      * mailbox-addressable peripherals (not exported)
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 2b295f1..dca6077 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -2,9 +2,11 @@
  * Raspberry Pi emulation (c) 2012 Gregory Estrade
  * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
  *
- * Rasperry Pi 2 emulation Copyright (c) 2015, Microsoft
+ * Raspberry Pi 2 emulation Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
+ * Raspberry Pi 1 rebase onto master (c) 2017, Omar Rizwan
+ *
  * This code is licensed under the GNU GPLv2 and later.
  */
 
@@ -12,6 +14,7 @@
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
+#include "hw/arm/bcm2835.h"
 #include "hw/arm/bcm2836.h"
 #include "qemu/error-report.h"
 #include "hw/boards.h"
@@ -27,6 +30,11 @@
 /* Table of Linux board IDs for different Pi versions */
 static const int raspi_boardid[] = {[1] = 0xc42, [2] = 0xc43};
 
+/* Table of board revisions:
+ * https://github.com/AndrewFromMelbourne/raspberry_pi_revision/blob/2764c19983fb7b1ef8cb21031e94c293703afa2e/README.md
+ */
+static const uint32_t raspi_boardrev[] = {[1] = 0x10, [2] = 0xa21041};
+
 typedef struct RasPiState {
     BCM2836State soc;
     MemoryRegion ram;
@@ -113,7 +121,8 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     arm_load_kernel(ARM_CPU(first_cpu), &binfo);
 }
 
-static void raspi2_init(MachineState *machine)
+static void raspi_machine_init(MachineState *machine, int version,
+                               const char *soc_type)
 {
     RasPiState *s = g_new0(RasPiState, 1);
     uint32_t vcram_size;
@@ -122,7 +131,7 @@ static void raspi2_init(MachineState *machine)
     BusState *bus;
     DeviceState *carddev;
 
-    object_initialize(&s->soc, sizeof(s->soc), TYPE_BCM2836);
+    object_initialize(&s->soc, sizeof(s->soc), soc_type);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&s->soc),
                               &error_abort);
 
@@ -135,10 +144,12 @@ static void raspi2_init(MachineState *machine)
     /* Setup the SOC */
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
                                    &error_abort);
-    object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
-                            &error_abort);
-    object_property_set_int(OBJECT(&s->soc), 0xa21041, "board-rev",
-                            &error_abort);
+    if (version == 2) {
+        object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
+                                &error_abort);
+    }
+    object_property_set_int(OBJECT(&s->soc), raspi_boardrev[version],
+                            "board-rev", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), true, "realized", &error_abort);
 
     /* Create and plug in the SD cards */
@@ -155,9 +166,29 @@ static void raspi2_init(MachineState *machine)
 
     vcram_size = object_property_get_int(OBJECT(&s->soc), "vcram-size",
                                          &error_abort);
-    setup_boot(machine, 2, machine->ram_size - vcram_size);
+    setup_boot(machine, version, machine->ram_size - vcram_size);
+}
+
+static void raspi1_init(MachineState *machine)
+{
+    raspi_machine_init(machine, 1, TYPE_BCM2835);
 }
+static void raspi1_machine_init(MachineClass *mc)
+{
+    mc->desc = "Raspberry Pi";
+    mc->init = raspi1_init;
+    mc->block_default_type = IF_SD;
+    mc->no_parallel = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->default_ram_size = 512 * 1024 * 1024;
+};
+DEFINE_MACHINE("raspi", raspi1_machine_init)
 
+static void raspi2_init(MachineState *machine)
+{
+    raspi_machine_init(machine, 2, TYPE_BCM2836);
+}
 static void raspi2_machine_init(MachineClass *mc)
 {
     mc->desc = "Raspberry Pi 2";
diff --git a/include/hw/arm/bcm2835.h b/include/hw/arm/bcm2835.h
new file mode 100644
index 0000000..c93c4ef
--- /dev/null
+++ b/include/hw/arm/bcm2835.h
@@ -0,0 +1,31 @@
+/*
+ * Raspberry Pi emulation (c) 2012 Gregory Estrade
+ * Upstreaming code cleanup [including bcm2835_*] (c) 2013 Jan Petrous
+ *
+ * Raspberry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
+ * Written by Andrew Baumann
+ *
+ * Rebase onto master (c) 2017 Omar Rizwan
+ *
+ * This code is licensed under the GNU GPLv2 and later.
+ */
+
+#ifndef BCM2835_H
+#define BCM2835_H
+
+#include "hw/arm/arm.h"
+#include "hw/arm/bcm2835_peripherals.h"
+
+#define TYPE_BCM2835 "bcm2835"
+#define BCM2835(obj) OBJECT_CHECK(BCM2835State, (obj), TYPE_BCM2835)
+
+typedef struct BCM2835State {
+    /*< private >*/
+    DeviceState parent_obj;
+    /*< public >*/
+
+    ARMCPU cpu;
+    BCM2835PeripheralState peripherals;
+} BCM2835State;
+
+#endif /* BCM2835_H */
-- 
2.10.1 (Apple Git-78)


Received: by 10.25.0.144 with SMTP id 138csp289115lfa;
        Fri, 28 Apr 2017 09:55:15 -0700 (PDT)
X-Received: by 10.55.18.91 with SMTP id c88mr11410090qkh.143.1493398515247;
        Fri, 28 Apr 2017 09:55:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d25si6887941qtd.169.2017.04.28.09.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 09:55:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d49Ao-0005kO-NW
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 12:55:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498V-0003zH-CM
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 12:52:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498T-0006Dh-LP
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 12:52:51 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:33312)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d498P-0006AU-Fo; Fri, 28 Apr 2017 12:52:45 -0400
Received: by mail-pf0-x241.google.com with SMTP id b23so2367147pfc.0;
	Fri, 28 Apr 2017 09:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a138xLenPja2vNar/DEDBgHVpUoWZ2TJADIs0f5vdrk=;
	b=e28Lo7pKw3ll8zdrk0p7CdEn4n9FEHZhFybrdbR0oX/s9Et4TnxcbgbybaA/yO+WEu
	aER633wR0aoHAttd9kNxO07djZea0wxmGQ2GaVYiWFkrli2lc5O78PXljAz/w88CJnk9
	w/iI+3RzDscDgpbIVJXcje+iH/j5BjO2LwRIv5ry1r2lNFevrVCnW0Kn59faiJDF/z5L
	ldq8Pd+IWHfgv+4/lwiADRiNkzCFf8k//btmw2BMF9+PxmPSDWhk0IuN0lzFFdz+LQfT
	h3H77dGLQkpuJNl+Pk7BTk5ElM+y8H7SDzf8aChKCHkgtWfqh0CnAR2/pg/4ETXmq+20
	46tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a138xLenPja2vNar/DEDBgHVpUoWZ2TJADIs0f5vdrk=;
	b=jaBmsRDKKhOq8CA7W0CrB1Ui0tJpoJ1FIQ+ICRhBBfJyssIC6kGhtnwxEiEvAa1yWy
	T4Qmwhdwp2HL4ocw6G4Q8xcgxpYZX+7t2lD3+AYGseg9hCParagyLZWQJ7vPtXeeAXZY
	77r4zwep5PZqn186Eb7N01X2hpSIybvYM75Czf4tmTTNCeZpD1xnQ6BVuiURFd2aZT19
	ci0YfDC+wOiQWvu+n5zXJ+3Mx5J1NO7xs6+j1EXHbbshEvCmygcKr0faAHshy6KA8ZNi
	NAbjyzZmTF3cd2AEyu9JKHTZawXdW3QAwT94cVOE386x406ftafOcJ9L2HGLcSiZEaxa
	l2TQ==
X-Gm-Message-State: AN3rC/6FaxI5+n2yAhvSVuEGOSORgKk4sNet4Jy/UqHPqjjQFc1K5TPL
	QiYjTXY8IsB4OQ==
X-Received: by 10.99.143.69 with SMTP id r5mr12755647pgn.77.1493398364308;
	Fri, 28 Apr 2017 09:52:44 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	r86sm11383528pfb.24.2017.04.28.09.52.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Apr 2017 09:52:43 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 28 Apr 2017 22:21:52 +0530
Message-Id: <1493398313-6673-5-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
References: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [Qemu-devel RFC v3 4/5] msf2: Add Smartfusion2 SoC.
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
X-TUID: BuY8l6cOtyX8

Smartfusion2 SoC has hardened Microcontroller subsystem
and flash based FPGA fabric. This patch adds support for
Microcontroller subsystem in the SoC.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   2 +-
 hw/arm/msf2_soc.c               | 194 ++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/msf2_soc.h       |  62 +++++++++++++
 4 files changed, 258 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/msf2_soc.c
 create mode 100644 include/hw/arm/msf2_soc.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 78d7af0..7062512 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -122,3 +122,4 @@ CONFIG_ACPI=y
 CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
 CONFIG_GPIO_KEY=y
+CONFIG_MSF2=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 4c5c4ee..cce2759 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -1,7 +1,7 @@
 obj-y += boot.o collie.o exynos4_boards.o gumstix.o highbank.o
 obj-$(CONFIG_DIGIC) += digic_boards.o
 obj-y += integratorcp.o mainstone.o musicpal.o nseries.o
-obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
+obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2_soc.o
 obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
 obj-y += netduino2.o
diff --git a/hw/arm/msf2_soc.c b/hw/arm/msf2_soc.c
new file mode 100644
index 0000000..a470872
--- /dev/null
+++ b/hw/arm/msf2_soc.c
@@ -0,0 +1,194 @@
+/*
+ * SmartFusion2 SoC emulation.
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
+#include "qemu-common.h"
+#include "hw/arm/arm.h"
+#include "exec/address-spaces.h"
+#include "hw/char/serial.h"
+#include "hw/boards.h"
+#include "sysemu/block-backend.h"
+#include "hw/arm/msf2_soc.h"
+
+#define MSF2_TIMER_BASE       0x40004000
+#define MSF2_SYSREG_BASE      0x40038000
+
+#define MSF2_TIMER_IRQ0       14
+#define MSF2_TIMER_IRQ1       15
+
+static const uint32_t spi_addr[MSF2_NUM_SPIS] = { 0x40001000 , 0x40011000 };
+static const uint32_t uart_addr[MSF2_NUM_UARTS] = { 0x40000000 , 0x40010000 };
+
+static const int spi_irq[MSF2_NUM_SPIS] = { 2, 3 };
+static const int uart_irq[MSF2_NUM_UARTS] = { 10, 11 };
+
+static void msf2_soc_initfn(Object *obj)
+{
+    MSF2State *s = MSF2_SOC(obj);
+    int i;
+
+    object_initialize(&s->armv7m, sizeof(s->armv7m), TYPE_ARMV7M);
+    qdev_set_parent_bus(DEVICE(&s->armv7m), sysbus_get_default());
+
+    object_initialize(&s->sysreg, sizeof(s->sysreg), TYPE_MSF2_SYSREG);
+    qdev_set_parent_bus(DEVICE(&s->sysreg), sysbus_get_default());
+
+    object_initialize(&s->timer, sizeof(s->timer), TYPE_MSF2_TIMER);
+    qdev_set_parent_bus(DEVICE(&s->timer), sysbus_get_default());
+
+    for (i = 0; i < MSF2_NUM_SPIS; i++) {
+        object_initialize(&s->spi[i], sizeof(s->spi[i]),
+                          TYPE_MSF2_SPI);
+        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
+    }
+}
+
+static void msf2_soc_realize(DeviceState *dev_soc, Error **errp)
+{
+    MSF2State *s = MSF2_SOC(dev_soc);
+    DeviceState *dev, *armv7m;
+    SysBusDevice *busdev;
+    Error *err = NULL;
+    int i;
+
+    MemoryRegion *system_memory = get_system_memory();
+    MemoryRegion *nvm = g_new(MemoryRegion, 1);
+    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
+    MemoryRegion *sram = g_new(MemoryRegion, 1);
+    MemoryRegion *ddr = g_new(MemoryRegion, 1);
+
+    memory_region_init_ram(nvm, NULL, "MSF2.envm", ENVM_SIZE,
+                           &error_fatal);
+    memory_region_init_alias(nvm_alias, NULL, "MSF2.flash.alias",
+                             nvm, 0, ENVM_SIZE);
+    vmstate_register_ram_global(nvm);
+
+    memory_region_set_readonly(nvm, true);
+    memory_region_set_readonly(nvm_alias, true);
+
+    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
+    memory_region_add_subregion(system_memory, 0, nvm_alias);
+
+    memory_region_init_ram(ddr, NULL, "MSF2.ddr", DDR_SIZE,
+                           &error_fatal);
+    vmstate_register_ram_global(ddr);
+    memory_region_add_subregion(system_memory, DDR_BASE_ADDRESS, ddr);
+
+    memory_region_init_ram(sram, NULL, "MSF2.sram", SRAM_SIZE,
+                           &error_fatal);
+    vmstate_register_ram_global(sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+
+    armv7m = DEVICE(&s->armv7m);
+    qdev_prop_set_uint32(armv7m, "num-irq", 96);
+    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
+    object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memory()),
+                                     "memory", &error_abort);
+    object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    for (i = 0; i < MSF2_NUM_UARTS; i++) {
+        if (serial_hds[i]) {
+            serial_mm_init(get_system_memory(), uart_addr[i], 2,
+                           qdev_get_gpio_in(armv7m, uart_irq[i]),
+                           115200, serial_hds[i], DEVICE_NATIVE_ENDIAN);
+        }
+    }
+
+    dev = DEVICE(&s->timer);
+    qdev_prop_set_uint32(dev, "clock-frequency", 83 * 1000000);
+    object_property_set_bool(OBJECT(&s->timer), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, MSF2_TIMER_BASE);
+    sysbus_connect_irq(busdev, 0,
+                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ0));
+    sysbus_connect_irq(busdev, 1,
+                           qdev_get_gpio_in(armv7m, MSF2_TIMER_IRQ1));
+
+    dev = DEVICE(&s->sysreg);
+    object_property_set_bool(OBJECT(&s->sysreg), true, "realized", &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    busdev = SYS_BUS_DEVICE(dev);
+    sysbus_mmio_map(busdev, 0, MSF2_SYSREG_BASE);
+
+    for (i = 0; i < MSF2_NUM_SPIS; i++) {
+        gchar *bus_name = g_strdup_printf("spi%d", i);
+
+        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &err);
+        if (err != NULL) {
+            g_free(bus_name);
+            error_propagate(errp, err);
+            return;
+        }
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, spi_addr[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->spi[i]), 0,
+                           qdev_get_gpio_in(armv7m, spi_irq[i]));
+
+        /* Alias controller SPI bus to the SoC itself */
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->spi[i]), "spi0",
+                                  &error_abort);
+        g_free(bus_name);
+    }
+}
+
+static Property msf2_soc_properties[] = {
+    DEFINE_PROP_STRING("cpu-model", MSF2State, cpu_model),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void msf2_soc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = msf2_soc_realize;
+    dc->props = msf2_soc_properties;
+}
+
+static const TypeInfo msf2_soc_info = {
+    .name          = TYPE_MSF2_SOC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MSF2State),
+    .instance_init = msf2_soc_initfn,
+    .class_init    = msf2_soc_class_init,
+};
+
+static void msf2_soc_types(void)
+{
+    type_register_static(&msf2_soc_info);
+}
+
+type_init(msf2_soc_types)
diff --git a/include/hw/arm/msf2_soc.h b/include/hw/arm/msf2_soc.h
new file mode 100644
index 0000000..1184d9a
--- /dev/null
+++ b/include/hw/arm/msf2_soc.h
@@ -0,0 +1,62 @@
+/*
+ * Microsemi Smartfusion2 SoC
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
+#ifndef HW_ARM_MSF2_SOC_H
+#define HW_ARM_MSF2_SOC_H
+
+#include "hw/misc/msf2_sysreg.h"
+#include "hw/timer/msf2_timer.h"
+#include "hw/ssi/msf2_spi.h"
+#include "hw/arm/armv7m.h"
+
+#define TYPE_MSF2_SOC     "msf2-soc"
+#define MSF2_SOC(obj)     OBJECT_CHECK(MSF2State, (obj), TYPE_MSF2_SOC)
+
+#define MSF2_NUM_SPIS         2
+#define MSF2_NUM_UARTS        2
+
+#define ENVM_BASE_ADDRESS     0x60000000
+#define ENVM_SIZE             (128 * 1024)
+
+#define DDR_BASE_ADDRESS      0xA0000000
+#define DDR_SIZE              (64 * 1024 * 1024)
+
+#define SRAM_BASE_ADDRESS     0x20000000
+#define SRAM_SIZE             (64 * 1024)
+
+typedef struct MSF2State {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    char *cpu_model;
+
+    ARMv7MState armv7m;
+
+    MSF2SysregState sysreg;
+    MSF2TimerState timer;
+    MSF2SpiState spi[MSF2_NUM_SPIS];
+} MSF2State;
+
+#endif
-- 
2.5.0


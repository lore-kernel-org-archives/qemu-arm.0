Received: by 10.25.208.211 with SMTP id h202csp393204lfg;
        Fri, 4 Mar 2016 20:30:17 -0800 (PST)
X-Received: by 10.140.25.206 with SMTP id 72mr14807227qgt.49.1457152210099;
        Fri, 04 Mar 2016 20:30:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7si6577686qgb.59.2016.03.04.20.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Mar 2016 20:30:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:44662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ac3qz-0008Ee-Hk
	for alex.bennee@linaro.org; Fri, 04 Mar 2016 23:30:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1ac3qv-00088A-1j
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 23:30:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1ac3qt-00080Q-HV
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 23:30:04 -0500
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:33936
	helo=homiemail-a12.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1ac3qt-00080H-9R; Fri, 04 Mar 2016 23:30:03 -0500
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id CC8DA1030063; 
	Fri,  4 Mar 2016 20:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
	q4SPezDH8P27Hkzhlvfhjx/v6uc=; b=lr8BF+jRZmgcvEEZ9xPd5QTvSXOHunrH
	O4c0qKoAdH4OSJTMIqSX6lIpC0jrnqRPDMU5S6q8/cVLnKu1yJ3ay+tLbZjgJrY7
	5l3FJUufQGsFTXhEefmSOvyJ0l9elE8DM7xB3/Vx93Dmd3tk4gHgUk61AxmvZK57
	7q7fbM8SHZw=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id 350A91030062;
	Fri,  4 Mar 2016 20:30:00 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  5 Mar 2016 14:59:37 +1030
Message-Id: <1457152177-19550-4-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457152177-19550-1-git-send-email-andrew@aj.id.au>
References: <1457152177-19550-1-git-send-email-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Subject: [Qemu-arm] [PATCH v3 3/3] hw/arm: Add ASPEED AST2400 machine model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bd2z1bvvGemj

Adds an AST2400 ARM machine[1], based around an AST2400 SOC containing an
ARM926 processor, ASPEED VIC and timer devices, and a 8250 UART. The new
machine type is functional enough to boot an aspeed_defconfig Linux
kernel to userspace.

[1] http://www.aspeedtech.com/products.php?fPath=20&rId=376

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Since v2:
  * Implement a SOC model to move code out from the machine definition
  * Rework the machine to better use QOM
  * Include qemu/osdep.h
  * Revert back to qemu_log_mask(LOG_UNIMP, ...) in IO handlers

Since v1:

 hw/arm/Makefile.objs |   1 +
 hw/arm/ast2400.c     | 208 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 hw/arm/ast2400.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index a711e4d..f333b7f 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -16,3 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
+obj-$(CONFIG_ASPEED_SOC) += ast2400.o
diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
new file mode 100644
index 0000000..74aca49
--- /dev/null
+++ b/hw/arm/ast2400.c
@@ -0,0 +1,208 @@
+/*
+ * ASPEED AST2400
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ * Jeremy Kerr <jk@ozlabs.org>
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "exec/address-spaces.h"
+#include "hw/arm/arm.h"
+#include "hw/boards.h"
+#include "hw/char/serial.h"
+#include "hw/sysbus.h"
+#include "hw/intc/aspeed_vic.h"
+#include "hw/timer/aspeed_timer.h"
+#include "target-arm/cpu.h"
+#include "trace.h"
+
+#define AST2400_UART_5_BASE      0x00184000
+#define AST2400_IOMEM_SIZE       0x00200000
+#define AST2400_IOMEM_BASE       0x1E600000
+#define AST2400_VIC_BASE         0x1E6C0000
+#define AST2400_TIMER_BASE       0x1E782000
+#define AST2400_SDRAM_BASE       0x40000000
+
+static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
+static const int timer_irqs[] = { 16, 17, 18, 35, 36, 37, 38, 39, };
+
+static struct arm_boot_info ast2400_binfo = {
+    .loader_start = AST2400_SDRAM_BASE,
+    .board_id = 0,
+    .nb_cpus = 1,
+};
+
+/*
+ * IO handlers: simply catch any reads/writes to IO addresses that aren't
+ * handled by a device mapping.
+ */
+
+static uint64_t ast2400_soc_io_read(void *p, hwaddr offset, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
+                  __func__, offset, size);
+    return 0;
+}
+
+static void ast2400_soc_io_write(void *opaque, hwaddr offset, uint64_t value,
+                unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
+                  __func__, offset, value, size);
+}
+
+static const MemoryRegionOps ast2400_soc_io_ops = {
+    .read = ast2400_soc_io_read,
+    .write = ast2400_soc_io_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+typedef struct AST2400SOCState {
+    /*< private >*/
+    DeviceState parent;
+
+    /*< public >*/
+    ARMCPU *cpu;
+    MemoryRegion iomem;
+    AspeedVICState vic;
+    AspeedTimerCtrlState timerctrl;
+} AST2400SOCState;
+
+#define TYPE_AST2400_SOC "ast2400-soc"
+#define AST2400_SOC(obj) OBJECT_CHECK(AST2400SOCState, (obj), TYPE_AST2400_SOC)
+
+static void ast2400_soc_init(Object *obj)
+{
+    AST2400SOCState *s = AST2400_SOC(obj);
+
+    s->cpu = cpu_arm_init("arm926");
+
+    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
+    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
+    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
+
+    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
+    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), NULL);
+    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
+}
+
+static void ast2400_soc_realize(DeviceState *dev, Error **errp)
+{
+    int i;
+    AST2400SOCState *s = AST2400_SOC(dev);
+    Error *err = NULL;
+
+    /* IO space */
+    memory_region_init_io(&s->iomem, NULL, &ast2400_soc_io_ops, NULL,
+            "ast2400.io", AST2400_IOMEM_SIZE);
+    memory_region_add_subregion(get_system_memory(), AST2400_IOMEM_BASE,
+            &s->iomem);
+
+    /* VIC */
+    object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, AST2400_VIC_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
+                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
+
+    /* Timer */
+    object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0, AST2400_TIMER_BASE);
+    for (i = 0; i < ARRAY_SIZE(timer_irqs); i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->vic), timer_irqs[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
+    }
+
+    /* UART - attach an 8250 to the IO space as our UART5 */
+    if (serial_hds[0]) {
+        qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
+        serial_mm_init(&s->iomem, AST2400_UART_5_BASE, 2,
+                uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN);
+    }
+}
+
+static void ast2400_soc_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ast2400_soc_realize;
+
+    /*
+     * Reason: creates an ARM CPU, thus use after free(), see
+     * arm_cpu_class_init()
+     */
+    dc->cannot_destroy_with_object_finalize_yet = true;
+}
+
+static const TypeInfo ast2400_soc_type_info = {
+    .name = TYPE_AST2400_SOC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AST2400SOCState),
+    .instance_init = ast2400_soc_init,
+    .class_init = ast2400_soc_class_init,
+};
+
+static void ast2400_soc_register_types(void)
+{
+    type_register_static(&ast2400_soc_type_info);
+}
+
+type_init(ast2400_soc_register_types)
+
+typedef struct AST2400State {
+    AST2400SOCState soc;
+    MemoryRegion ram;
+} AST2400State;
+
+static void ast2400_init(MachineState *machine)
+{
+    AST2400State *ast2400;
+
+    ast2400 = g_new0(AST2400State, 1);
+    object_initialize(&ast2400->soc, (sizeof(ast2400->soc)), TYPE_AST2400_SOC);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(&ast2400->soc),
+                              &error_abort);
+
+    memory_region_allocate_system_memory(&ast2400->ram, NULL, "ram",
+                                         ram_size);
+    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
+                                &ast2400->ram);
+    object_property_add_const_link(OBJECT(&ast2400->soc), "ram",
+                                   OBJECT(&ast2400->ram), &error_abort);
+    object_property_set_bool(OBJECT(&ast2400->soc), true, "realized",
+                             &error_abort);
+
+    ast2400_binfo.kernel_filename = machine->kernel_filename;
+    ast2400_binfo.initrd_filename = machine->initrd_filename;
+    ast2400_binfo.kernel_cmdline = machine->kernel_cmdline;
+    ast2400_binfo.ram_size = ram_size;
+    arm_load_kernel(ARM_CPU(first_cpu), &ast2400_binfo);
+}
+
+static void ast2400_machine_init(MachineClass *mc)
+{
+    mc->desc = "ASPEED AST2400 BMC (ARM926EJ-S)";
+    mc->init = ast2400_init;
+    mc->max_cpus = 1;
+    mc->no_sdcard = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_sdcard = 1;
+    mc->no_parallel = 1;
+}
+
+DEFINE_MACHINE("ast2400", ast2400_machine_init);
-- 
2.5.0


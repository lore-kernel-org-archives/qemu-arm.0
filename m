Received: by 10.25.208.211 with SMTP id h202csp2182797lfg;
        Sun, 13 Mar 2016 21:14:19 -0700 (PDT)
X-Received: by 10.140.168.85 with SMTP id o82mr28883258qho.75.1457928857069;
        Sun, 13 Mar 2016 21:14:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si19989632qkx.21.2016.03.13.21.14.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Mar 2016 21:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:38928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afJtY-0002Dg-Cd
	for alex.bennee@linaro.org; Mon, 14 Mar 2016 00:14:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afJtU-0002Ay-VK
	for qemu-arm@nongnu.org; Mon, 14 Mar 2016 00:14:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afJtT-0000VO-8l
	for qemu-arm@nongnu.org; Mon, 14 Mar 2016 00:14:12 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:35512
	helo=homiemail-a17.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1afJtT-0000VI-0A; Mon, 14 Mar 2016 00:14:11 -0400
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 946B02B206A;
	Sun, 13 Mar 2016 21:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
	nk2GlPuVU/Z/SY0idjwcBX+d2F8=; b=k0zX17HOdbxuVMYxSAWUUepmYvZhXMGu
	BrDQqDZPzKnMC1U0UFv2G4Ow9JjNQKwBICU4wWiiQmcnEzapVbL52nKqFn3MdlZl
	UBSjuasx5Lat/keYJEsx6AfPV2JXE7y9XIWCcSnnFOMqAogYUk/3M1CcBHmw21IT
	1mNEPP+0cPc=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id E2BBC2B2065; 
	Sun, 13 Mar 2016 21:14:08 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2016 14:43:51 +1030
Message-Id: <1457928832-31026-4-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
References: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jeremy Kerr <jk@ozlabs.org>
Subject: [Qemu-arm] [PATCH v4 3/4] hw/arm: Add ASPEED AST2400 SoC model
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
X-TUID: F6prUN66UXA7

While the ASPEED AST2400 SoC[1] has a broad range of capabilities this
implementation is minimal, comprising an ARM926 processor, ASPEED VIC
and timer devices, and a 8250 UART.

[1] http://www.aspeedtech.com/products.php?fPath=20&rId=376

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Since v3:

  * Split the SoC from the machine implementation

Since v2:
  * Implement a SOC model to move code out from the machine definition
  * Rework the machine to better use QOM
  * Include qemu/osdep.h
  * Revert back to qemu_log_mask(LOG_UNIMP, ...) in IO handlers

 hw/arm/Makefile.objs     |   1 +
 hw/arm/ast2400.c         | 137 +++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2400.h |  35 ++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 hw/arm/ast2400.c
 create mode 100644 include/hw/arm/ast2400.h

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
index 0000000..ecd9e1e
--- /dev/null
+++ b/hw/arm/ast2400.c
@@ -0,0 +1,137 @@
+/*
+ * AST2400 SoC
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
+#include "hw/arm/ast2400.h"
+#include "hw/char/serial.h"
+
+#define AST2400_UART_5_BASE      0x00184000
+#define AST2400_IOMEM_SIZE       0x00200000
+#define AST2400_IOMEM_BASE       0x1E600000
+#define AST2400_VIC_BASE         0x1E6C0000
+#define AST2400_TIMER_BASE       0x1E782000
+
+static const int uart_irqs[] = { 9, 32, 33, 34, 10 };
+static const int timer_irqs[] = { 16, 17, 18, 35, 36, 37, 38, 39, };
+
+/*
+ * IO handlers: simply catch any reads/writes to IO addresses that aren't
+ * handled by a device mapping.
+ */
+
+static uint64_t ast2400_io_read(void *p, hwaddr offset, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
+                  __func__, offset, size);
+    return 0;
+}
+
+static void ast2400_io_write(void *opaque, hwaddr offset, uint64_t value,
+                unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
+                  __func__, offset, value, size);
+}
+
+static const MemoryRegionOps ast2400_io_ops = {
+    .read = ast2400_io_read,
+    .write = ast2400_io_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+};
+
+static void ast2400_init(Object *obj)
+{
+    AST2400State *s = AST2400(obj);
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
+static void ast2400_realize(DeviceState *dev, Error **errp)
+{
+    int i;
+    AST2400State *s = AST2400(dev);
+    Error *err = NULL;
+
+    /* IO space */
+    memory_region_init_io(&s->iomem, NULL, &ast2400_io_ops, NULL,
+            "ast2400.io", AST2400_IOMEM_SIZE);
+    memory_region_add_subregion_overlap(get_system_memory(), AST2400_IOMEM_BASE,
+            &s->iomem, -1);
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
+                       uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN);
+    }
+}
+
+static void ast2400_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->realize = ast2400_realize;
+
+    /*
+     * Reason: creates an ARM CPU, thus use after free(), see
+     * arm_cpu_class_init()
+     */
+    dc->cannot_destroy_with_object_finalize_yet = true;
+}
+
+static const TypeInfo ast2400_type_info = {
+    .name = TYPE_AST2400,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AST2400State),
+    .instance_init = ast2400_init,
+    .class_init = ast2400_class_init,
+};
+
+static void ast2400_register_types(void)
+{
+    type_register_static(&ast2400_type_info);
+}
+
+type_init(ast2400_register_types)
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
new file mode 100644
index 0000000..f16a1ed
--- /dev/null
+++ b/include/hw/arm/ast2400.h
@@ -0,0 +1,35 @@
+/*
+ * ASPEED AST2400 SoC
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef AST2400_H
+#define AST2400_H
+
+#include "hw/arm/arm.h"
+#include "hw/intc/aspeed_vic.h"
+#include "hw/timer/aspeed_timer.h"
+
+typedef struct AST2400State {
+    /*< private >*/
+    DeviceState parent;
+
+    /*< public >*/
+    ARMCPU *cpu;
+    MemoryRegion iomem;
+    AspeedVICState vic;
+    AspeedTimerCtrlState timerctrl;
+} AST2400State;
+
+#define TYPE_AST2400 "ast2400"
+#define AST2400(obj) OBJECT_CHECK(AST2400State, (obj), TYPE_AST2400)
+
+#define AST2400_SDRAM_BASE       0x40000000
+
+#endif /* AST2400_H */
-- 
2.5.0


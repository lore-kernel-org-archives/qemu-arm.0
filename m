Received: by 10.25.21.156 with SMTP id 28csp314882lfv;
        Tue, 2 Aug 2016 10:16:18 -0700 (PDT)
X-Received: by 10.37.219.81 with SMTP id g78mr31433015ybf.140.1470158178264;
        Tue, 02 Aug 2016 10:16:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q184si2069365qke.142.2016.08.02.10.16.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 10:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57870 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUdIf-000667-JO
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 13:16:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIY-00063k-M0
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 13:16:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIU-00078R-Kx
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 13:16:10 -0400
Received: from 2.mo179.mail-out.ovh.net ([178.33.250.45]:45116)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bUdIU-00078K-70
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 13:16:06 -0400
Received: from player732.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 5FFDF1000C65
	for <qemu-arm@nongnu.org>; Tue,  2 Aug 2016 19:16:05 +0200 (CEST)
Received: from localhost.localdomain.com (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: clg@kaod.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id 3B8D21000A0;
	Tue,  2 Aug 2016 19:16:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  2 Aug 2016 19:15:38 +0200
Message-Id: <1470158147-16378-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1470158147-16378-1-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15372192904726547217
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrjeekgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.250.45
Subject: [Qemu-arm] [PATCH v3 01/10] ast2400: rename the Aspeed SoC files to
 aspeed_soc
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pXCUQ3Cwb0ij

Let's prepare for new Aspeed SoCs and rename the ast2400 file to a
more generic one. There are no changes in the code apart from the
header file include.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/Makefile.objs        |   2 +-
 hw/arm/aspeed_soc.c         | 229 ++++++++++++++++++++++++++++++++++++++=
++++++
 hw/arm/ast2400.c            | 229 --------------------------------------=
------
 hw/arm/palmetto-bmc.c       |   2 +-
 include/hw/arm/aspeed_soc.h |  44 +++++++++
 include/hw/arm/ast2400.h    |  44 ---------
 6 files changed, 275 insertions(+), 275 deletions(-)
 create mode 100644 hw/arm/aspeed_soc.c
 delete mode 100644 hw/arm/ast2400.c
 create mode 100644 include/hw/arm/aspeed_soc.h
 delete mode 100644 include/hw/arm/ast2400.h

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 12764ef2b719..7901294630b1 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -17,4 +17,4 @@ obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp.o xlnx-ep108=
.o
 obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
-obj-$(CONFIG_ASPEED_SOC) +=3D ast2400.o palmetto-bmc.o
+obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o palmetto-bmc.o
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
new file mode 100644
index 000000000000..b272f4e48cfc
--- /dev/null
+++ b/hw/arm/aspeed_soc.c
@@ -0,0 +1,229 @@
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
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "exec/address-spaces.h"
+#include "hw/arm/aspeed_soc.h"
+#include "hw/char/serial.h"
+#include "qemu/log.h"
+#include "hw/i2c/aspeed_i2c.h"
+
+#define AST2400_UART_5_BASE      0x00184000
+#define AST2400_IOMEM_SIZE       0x00200000
+#define AST2400_IOMEM_BASE       0x1E600000
+#define AST2400_SMC_BASE         AST2400_IOMEM_BASE /* Legacy SMC */
+#define AST2400_FMC_BASE         0X1E620000
+#define AST2400_SPI_BASE         0X1E630000
+#define AST2400_VIC_BASE         0x1E6C0000
+#define AST2400_SDMC_BASE        0x1E6E0000
+#define AST2400_SCU_BASE         0x1E6E2000
+#define AST2400_TIMER_BASE       0x1E782000
+#define AST2400_I2C_BASE         0x1E78A000
+
+#define AST2400_FMC_FLASH_BASE   0x20000000
+#define AST2400_SPI_FLASH_BASE   0x30000000
+
+static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
+static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39, };
+
+/*
+ * IO handlers: simply catch any reads/writes to IO addresses that aren'=
t
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
+static void ast2400_io_write(void *opaque, hwaddr offset, uint64_t value=
,
+                unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
+                  __func__, offset, value, size);
+}
+
+static const MemoryRegionOps ast2400_io_ops =3D {
+    .read =3D ast2400_io_read,
+    .write =3D ast2400_io_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+};
+
+static void ast2400_init(Object *obj)
+{
+    AST2400State *s =3D AST2400(obj);
+
+    s->cpu =3D cpu_arm_init("arm926");
+
+    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
+    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
+    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
+
+    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
+    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
+    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
+
+    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
+    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
+    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
+
+    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
+    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
+    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
+    qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
+                         AST2400_A0_SILICON_REV);
+    object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
+                              "hw-strap1", &error_abort);
+    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
+                              "hw-strap2", &error_abort);
+
+    object_initialize(&s->smc, sizeof(s->smc), "aspeed.smc.fmc");
+    object_property_add_child(obj, "smc", OBJECT(&s->smc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_default());
+
+    object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
+    object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
+    qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
+
+    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
+    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
+    qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
+                         AST2400_A0_SILICON_REV);
+}
+
+static void ast2400_realize(DeviceState *dev, Error **errp)
+{
+    int i;
+    AST2400State *s =3D AST2400(dev);
+    Error *err =3D NULL, *local_err =3D NULL;
+
+    /* IO space */
+    memory_region_init_io(&s->iomem, NULL, &ast2400_io_ops, NULL,
+            "ast2400.io", AST2400_IOMEM_SIZE);
+    memory_region_add_subregion_overlap(get_system_memory(), AST2400_IOM=
EM_BASE,
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
+    object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &e=
rr);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0, AST2400_TIMER_BASE=
);
+    for (i =3D 0; i < ARRAY_SIZE(timer_irqs); i++) {
+        qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->vic), timer_irqs[i]=
);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
+    }
+
+    /* SCU */
+    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, AST2400_SCU_BASE);
+
+    /* UART - attach an 8250 to the IO space as our UART5 */
+    if (serial_hds[0]) {
+        qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4=
]);
+        serial_mm_init(&s->iomem, AST2400_UART_5_BASE, 2,
+                       uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN=
);
+    }
+
+    /* I2C */
+    object_property_set_bool(OBJECT(&s->i2c), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
+                       qdev_get_gpio_in(DEVICE(&s->vic), 12));
+
+    /* SMC */
+    object_property_set_int(OBJECT(&s->smc), 1, "num-cs", &err);
+    object_property_set_bool(OBJECT(&s->smc), true, "realized", &local_e=
rr);
+    error_propagate(&err, local_err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 1, AST2400_FMC_FLASH_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
+                       qdev_get_gpio_in(DEVICE(&s->vic), 19));
+
+    /* SPI */
+    object_property_set_int(OBJECT(&s->spi), 1, "num-cs", &err);
+    object_property_set_bool(OBJECT(&s->spi), true, "realized", &local_e=
rr);
+    error_propagate(&err, local_err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, AST2400_SPI_FLASH_BASE);
+
+    /* SDMC - SDRAM Memory Controller */
+    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, AST2400_SDMC_BASE);
+}
+
+static void ast2400_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+
+    dc->realize =3D ast2400_realize;
+
+    /*
+     * Reason: creates an ARM CPU, thus use after free(), see
+     * arm_cpu_class_init()
+     */
+    dc->cannot_destroy_with_object_finalize_yet =3D true;
+}
+
+static const TypeInfo ast2400_type_info =3D {
+    .name =3D TYPE_AST2400,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AST2400State),
+    .instance_init =3D ast2400_init,
+    .class_init =3D ast2400_class_init,
+};
+
+static void ast2400_register_types(void)
+{
+    type_register_static(&ast2400_type_info);
+}
+
+type_init(ast2400_register_types)
diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
deleted file mode 100644
index 136bf6464e1d..000000000000
--- a/hw/arm/ast2400.c
+++ /dev/null
@@ -1,229 +0,0 @@
-/*
- * AST2400 SoC
- *
- * Andrew Jeffery <andrew@aj.id.au>
- * Jeremy Kerr <jk@ozlabs.org>
- *
- * Copyright 2016 IBM Corp.
- *
- * This code is licensed under the GPL version 2 or later.  See
- * the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qemu-common.h"
-#include "cpu.h"
-#include "exec/address-spaces.h"
-#include "hw/arm/ast2400.h"
-#include "hw/char/serial.h"
-#include "qemu/log.h"
-#include "hw/i2c/aspeed_i2c.h"
-
-#define AST2400_UART_5_BASE      0x00184000
-#define AST2400_IOMEM_SIZE       0x00200000
-#define AST2400_IOMEM_BASE       0x1E600000
-#define AST2400_SMC_BASE         AST2400_IOMEM_BASE /* Legacy SMC */
-#define AST2400_FMC_BASE         0X1E620000
-#define AST2400_SPI_BASE         0X1E630000
-#define AST2400_VIC_BASE         0x1E6C0000
-#define AST2400_SDMC_BASE        0x1E6E0000
-#define AST2400_SCU_BASE         0x1E6E2000
-#define AST2400_TIMER_BASE       0x1E782000
-#define AST2400_I2C_BASE         0x1E78A000
-
-#define AST2400_FMC_FLASH_BASE   0x20000000
-#define AST2400_SPI_FLASH_BASE   0x30000000
-
-static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
-static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39, };
-
-/*
- * IO handlers: simply catch any reads/writes to IO addresses that aren'=
t
- * handled by a device mapping.
- */
-
-static uint64_t ast2400_io_read(void *p, hwaddr offset, unsigned size)
-{
-    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
-                  __func__, offset, size);
-    return 0;
-}
-
-static void ast2400_io_write(void *opaque, hwaddr offset, uint64_t value=
,
-                unsigned size)
-{
-    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
-                  __func__, offset, value, size);
-}
-
-static const MemoryRegionOps ast2400_io_ops =3D {
-    .read =3D ast2400_io_read,
-    .write =3D ast2400_io_write,
-    .endianness =3D DEVICE_LITTLE_ENDIAN,
-};
-
-static void ast2400_init(Object *obj)
-{
-    AST2400State *s =3D AST2400(obj);
-
-    s->cpu =3D cpu_arm_init("arm926");
-
-    object_initialize(&s->vic, sizeof(s->vic), TYPE_ASPEED_VIC);
-    object_property_add_child(obj, "vic", OBJECT(&s->vic), NULL);
-    qdev_set_parent_bus(DEVICE(&s->vic), sysbus_get_default());
-
-    object_initialize(&s->timerctrl, sizeof(s->timerctrl), TYPE_ASPEED_T=
IMER);
-    object_property_add_child(obj, "timerctrl", OBJECT(&s->timerctrl), N=
ULL);
-    qdev_set_parent_bus(DEVICE(&s->timerctrl), sysbus_get_default());
-
-    object_initialize(&s->i2c, sizeof(s->i2c), TYPE_ASPEED_I2C);
-    object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
-    qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
-
-    object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
-    object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
-    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
-    qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
-                         AST2400_A0_SILICON_REV);
-    object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
-                              "hw-strap1", &error_abort);
-    object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
-                              "hw-strap2", &error_abort);
-
-    object_initialize(&s->smc, sizeof(s->smc), "aspeed.smc.fmc");
-    object_property_add_child(obj, "smc", OBJECT(&s->smc), NULL);
-    qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_default());
-
-    object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
-    object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
-    qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
-
-    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
-    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
-    qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
-    qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
-                         AST2400_A0_SILICON_REV);
-}
-
-static void ast2400_realize(DeviceState *dev, Error **errp)
-{
-    int i;
-    AST2400State *s =3D AST2400(dev);
-    Error *err =3D NULL, *local_err =3D NULL;
-
-    /* IO space */
-    memory_region_init_io(&s->iomem, NULL, &ast2400_io_ops, NULL,
-            "ast2400.io", AST2400_IOMEM_SIZE);
-    memory_region_add_subregion_overlap(get_system_memory(), AST2400_IOM=
EM_BASE,
-            &s->iomem, -1);
-
-    /* VIC */
-    object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, AST2400_VIC_BASE);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
-                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
-                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ));
-
-    /* Timer */
-    object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &e=
rr);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0, AST2400_TIMER_BASE=
);
-    for (i =3D 0; i < ARRAY_SIZE(timer_irqs); i++) {
-        qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->vic), timer_irqs[i]=
);
-        sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
-    }
-
-    /* SCU */
-    object_property_set_bool(OBJECT(&s->scu), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, AST2400_SCU_BASE);
-
-    /* UART - attach an 8250 to the IO space as our UART5 */
-    if (serial_hds[0]) {
-        qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4=
]);
-        serial_mm_init(&s->iomem, AST2400_UART_5_BASE, 2,
-                       uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN=
);
-    }
-
-    /* I2C */
-    object_property_set_bool(OBJECT(&s->i2c), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
-                       qdev_get_gpio_in(DEVICE(&s->vic), 12));
-
-    /* SMC */
-    object_property_set_int(OBJECT(&s->smc), 1, "num-cs", &err);
-    object_property_set_bool(OBJECT(&s->smc), true, "realized", &local_e=
rr);
-    error_propagate(&err, local_err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 1, AST2400_FMC_FLASH_BASE);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
-                       qdev_get_gpio_in(DEVICE(&s->vic), 19));
-
-    /* SPI */
-    object_property_set_int(OBJECT(&s->spi), 1, "num-cs", &err);
-    object_property_set_bool(OBJECT(&s->spi), true, "realized", &local_e=
rr);
-    error_propagate(&err, local_err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, AST2400_SPI_FLASH_BASE);
-
-    /* SDMC - SDRAM Memory Controller */
-    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, AST2400_SDMC_BASE);
-}
-
-static void ast2400_class_init(ObjectClass *oc, void *data)
-{
-    DeviceClass *dc =3D DEVICE_CLASS(oc);
-
-    dc->realize =3D ast2400_realize;
-
-    /*
-     * Reason: creates an ARM CPU, thus use after free(), see
-     * arm_cpu_class_init()
-     */
-    dc->cannot_destroy_with_object_finalize_yet =3D true;
-}
-
-static const TypeInfo ast2400_type_info =3D {
-    .name =3D TYPE_AST2400,
-    .parent =3D TYPE_SYS_BUS_DEVICE,
-    .instance_size =3D sizeof(AST2400State),
-    .instance_init =3D ast2400_init,
-    .class_init =3D ast2400_class_init,
-};
-
-static void ast2400_register_types(void)
-{
-    type_register_static(&ast2400_type_info);
-}
-
-type_init(ast2400_register_types)
diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 54e29a865d88..67676a8a8042 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -15,7 +15,7 @@
 #include "cpu.h"
 #include "exec/address-spaces.h"
 #include "hw/arm/arm.h"
-#include "hw/arm/ast2400.h"
+#include "hw/arm/aspeed_soc.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
new file mode 100644
index 000000000000..e68807d475b7
--- /dev/null
+++ b/include/hw/arm/aspeed_soc.h
@@ -0,0 +1,44 @@
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
+#include "hw/misc/aspeed_scu.h"
+#include "hw/misc/aspeed_sdmc.h"
+#include "hw/timer/aspeed_timer.h"
+#include "hw/i2c/aspeed_i2c.h"
+#include "hw/ssi/aspeed_smc.h"
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
+    AspeedI2CState i2c;
+    AspeedSCUState scu;
+    AspeedSMCState smc;
+    AspeedSMCState spi;
+    AspeedSDMCState sdmc;
+} AST2400State;
+
+#define TYPE_AST2400 "ast2400"
+#define AST2400(obj) OBJECT_CHECK(AST2400State, (obj), TYPE_AST2400)
+
+#define AST2400_SDRAM_BASE       0x40000000
+
+#endif /* AST2400_H */
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
deleted file mode 100644
index e68807d475b7..000000000000
--- a/include/hw/arm/ast2400.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/*
- * ASPEED AST2400 SoC
- *
- * Andrew Jeffery <andrew@aj.id.au>
- *
- * Copyright 2016 IBM Corp.
- *
- * This code is licensed under the GPL version 2 or later.  See
- * the COPYING file in the top-level directory.
- */
-
-#ifndef AST2400_H
-#define AST2400_H
-
-#include "hw/arm/arm.h"
-#include "hw/intc/aspeed_vic.h"
-#include "hw/misc/aspeed_scu.h"
-#include "hw/misc/aspeed_sdmc.h"
-#include "hw/timer/aspeed_timer.h"
-#include "hw/i2c/aspeed_i2c.h"
-#include "hw/ssi/aspeed_smc.h"
-
-typedef struct AST2400State {
-    /*< private >*/
-    DeviceState parent;
-
-    /*< public >*/
-    ARMCPU *cpu;
-    MemoryRegion iomem;
-    AspeedVICState vic;
-    AspeedTimerCtrlState timerctrl;
-    AspeedI2CState i2c;
-    AspeedSCUState scu;
-    AspeedSMCState smc;
-    AspeedSMCState spi;
-    AspeedSDMCState sdmc;
-} AST2400State;
-
-#define TYPE_AST2400 "ast2400"
-#define AST2400(obj) OBJECT_CHECK(AST2400State, (obj), TYPE_AST2400)
-
-#define AST2400_SDRAM_BASE       0x40000000
-
-#endif /* AST2400_H */
--=20
2.7.4


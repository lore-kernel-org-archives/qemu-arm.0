Received: by 10.80.163.71 with SMTP id 65csp198436edn;
        Fri, 9 Sep 2016 09:23:48 -0700 (PDT)
X-Received: by 10.200.44.213 with SMTP id 21mr4942756qtx.91.1473438228853;
        Fri, 09 Sep 2016 09:23:48 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si2538061qkj.71.2016.09.09.09.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58974 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOai-0002Vp-5w
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:23:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOaZ-0002P3-LZ
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOaV-0005lL-9i
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:39 -0400
Received: from 9.mo178.mail-out.ovh.net ([46.105.75.45]:33289)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biOaU-0005kv-T6
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:35 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 27446FFC8E6
	for <qemu-arm@nongnu.org>; Fri,  9 Sep 2016 18:23:34 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 9A36B3C0066;
	Fri,  9 Sep 2016 18:23:28 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:45 +0200
Message-Id: <1473438177-26079-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16286705104835676945
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.75.45
Subject: [Qemu-arm] [PATCH v5 02/14] ast2400: replace ast2400 with aspeed_soc
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
X-TUID: R58HBOpAcgqj

This is a name replacement to prepare ground for other SoCs.

Let's also remove the AST2400_SMC_BASE definition from the address
space mappings, as it is not used. This controller was removed from
the Aspeed SoC AST2500, so this provides us a better common base for
the address space mapping on both SoCs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed_soc.c         | 95 ++++++++++++++++++++++-----------------=
------
 hw/arm/palmetto-bmc.c       |  4 +-
 include/hw/arm/aspeed_soc.h | 16 ++++----
 3 files changed, 57 insertions(+), 58 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index b272f4e48cfc..1bec478fef68 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -1,5 +1,5 @@
 /*
- * AST2400 SoC
+ * ASPEED SoC family
  *
  * Andrew Jeffery <andrew@aj.id.au>
  * Jeremy Kerr <jk@ozlabs.org>
@@ -20,20 +20,19 @@
 #include "qemu/log.h"
 #include "hw/i2c/aspeed_i2c.h"
=20
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
+#define ASPEED_SOC_UART_5_BASE      0x00184000
+#define ASPEED_SOC_IOMEM_SIZE       0x00200000
+#define ASPEED_SOC_IOMEM_BASE       0x1E600000
+#define ASPEED_SOC_FMC_BASE         0x1E620000
+#define ASPEED_SOC_SPI_BASE         0x1E630000
+#define ASPEED_SOC_VIC_BASE         0x1E6C0000
+#define ASPEED_SOC_SDMC_BASE        0x1E6E0000
+#define ASPEED_SOC_SCU_BASE         0x1E6E2000
+#define ASPEED_SOC_TIMER_BASE       0x1E782000
+#define ASPEED_SOC_I2C_BASE         0x1E78A000
+
+#define ASPEED_SOC_FMC_FLASH_BASE   0x20000000
+#define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
=20
 static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
 static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39, };
@@ -43,29 +42,29 @@ static const int timer_irqs[] =3D { 16, 17, 18, 35, 3=
6, 37, 38, 39, };
  * handled by a device mapping.
  */
=20
-static uint64_t ast2400_io_read(void *p, hwaddr offset, unsigned size)
+static uint64_t aspeed_soc_io_read(void *p, hwaddr offset, unsigned size=
)
 {
     qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
                   __func__, offset, size);
     return 0;
 }
=20
-static void ast2400_io_write(void *opaque, hwaddr offset, uint64_t value=
,
+static void aspeed_soc_io_write(void *opaque, hwaddr offset, uint64_t va=
lue,
                 unsigned size)
 {
     qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%=
u]\n",
                   __func__, offset, value, size);
 }
=20
-static const MemoryRegionOps ast2400_io_ops =3D {
-    .read =3D ast2400_io_read,
-    .write =3D ast2400_io_write,
+static const MemoryRegionOps aspeed_soc_io_ops =3D {
+    .read =3D aspeed_soc_io_read,
+    .write =3D aspeed_soc_io_write,
     .endianness =3D DEVICE_LITTLE_ENDIAN,
 };
=20
-static void ast2400_init(Object *obj)
+static void aspeed_soc_init(Object *obj)
 {
-    AST2400State *s =3D AST2400(obj);
+    AspeedSoCState *s =3D ASPEED_SOC(obj);
=20
     s->cpu =3D cpu_arm_init("arm926");
=20
@@ -106,17 +105,17 @@ static void ast2400_init(Object *obj)
                          AST2400_A0_SILICON_REV);
 }
=20
-static void ast2400_realize(DeviceState *dev, Error **errp)
+static void aspeed_soc_realize(DeviceState *dev, Error **errp)
 {
     int i;
-    AST2400State *s =3D AST2400(dev);
+    AspeedSoCState *s =3D ASPEED_SOC(dev);
     Error *err =3D NULL, *local_err =3D NULL;
=20
     /* IO space */
-    memory_region_init_io(&s->iomem, NULL, &ast2400_io_ops, NULL,
-            "ast2400.io", AST2400_IOMEM_SIZE);
-    memory_region_add_subregion_overlap(get_system_memory(), AST2400_IOM=
EM_BASE,
-            &s->iomem, -1);
+    memory_region_init_io(&s->iomem, NULL, &aspeed_soc_io_ops, NULL,
+            "aspeed_soc.io", ASPEED_SOC_IOMEM_SIZE);
+    memory_region_add_subregion_overlap(get_system_memory(),
+                                        ASPEED_SOC_IOMEM_BASE, &s->iomem=
, -1);
=20
     /* VIC */
     object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
@@ -124,7 +123,7 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
         error_propagate(errp, err);
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, AST2400_VIC_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->vic), 0, ASPEED_SOC_VIC_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 0,
                        qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
@@ -136,7 +135,7 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
         error_propagate(errp, err);
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0, AST2400_TIMER_BASE=
);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->timerctrl), 0, ASPEED_SOC_TIMER_B=
ASE);
     for (i =3D 0; i < ARRAY_SIZE(timer_irqs); i++) {
         qemu_irq irq =3D qdev_get_gpio_in(DEVICE(&s->vic), timer_irqs[i]=
);
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
@@ -148,12 +147,12 @@ static void ast2400_realize(DeviceState *dev, Error=
 **errp)
         error_propagate(errp, err);
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, AST2400_SCU_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
=20
     /* UART - attach an 8250 to the IO space as our UART5 */
     if (serial_hds[0]) {
         qemu_irq uart5 =3D qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4=
]);
-        serial_mm_init(&s->iomem, AST2400_UART_5_BASE, 2,
+        serial_mm_init(&s->iomem, ASPEED_SOC_UART_5_BASE, 2,
                        uart5, 38400, serial_hds[0], DEVICE_LITTLE_ENDIAN=
);
     }
=20
@@ -163,7 +162,7 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
         error_propagate(errp, err);
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, AST2400_I2C_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i2c), 0, ASPEED_SOC_I2C_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
=20
@@ -175,8 +174,8 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
         error_propagate(errp, err);
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 1, AST2400_FMC_FLASH_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, ASPEED_SOC_FMC_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 1, ASPEED_SOC_FMC_FLASH_BAS=
E);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 19));
=20
@@ -188,8 +187,8 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
         error_propagate(errp, err);
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, AST2400_SPI_FLASH_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, ASPEED_SOC_SPI_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, ASPEED_SOC_SPI_FLASH_BAS=
E);
=20
     /* SDMC - SDRAM Memory Controller */
     object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
@@ -197,14 +196,14 @@ static void ast2400_realize(DeviceState *dev, Error=
 **errp)
         error_propagate(errp, err);
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, AST2400_SDMC_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
 }
=20
-static void ast2400_class_init(ObjectClass *oc, void *data)
+static void aspeed_soc_class_init(ObjectClass *oc, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(oc);
=20
-    dc->realize =3D ast2400_realize;
+    dc->realize =3D aspeed_soc_realize;
=20
     /*
      * Reason: creates an ARM CPU, thus use after free(), see
@@ -213,17 +212,17 @@ static void ast2400_class_init(ObjectClass *oc, voi=
d *data)
     dc->cannot_destroy_with_object_finalize_yet =3D true;
 }
=20
-static const TypeInfo ast2400_type_info =3D {
-    .name =3D TYPE_AST2400,
+static const TypeInfo aspeed_soc_type_info =3D {
+    .name =3D TYPE_ASPEED_SOC,
     .parent =3D TYPE_SYS_BUS_DEVICE,
-    .instance_size =3D sizeof(AST2400State),
-    .instance_init =3D ast2400_init,
-    .class_init =3D ast2400_class_init,
+    .instance_size =3D sizeof(AspeedSoCState),
+    .instance_init =3D aspeed_soc_init,
+    .class_init =3D aspeed_soc_class_init,
 };
=20
-static void ast2400_register_types(void)
+static void aspeed_soc_register_types(void)
 {
-    type_register_static(&ast2400_type_info);
+    type_register_static(&aspeed_soc_type_info);
 }
=20
-type_init(ast2400_register_types)
+type_init(aspeed_soc_register_types)
diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 67676a8a8042..4d11905cfb18 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -28,7 +28,7 @@ static struct arm_boot_info palmetto_bmc_binfo =3D {
 };
=20
 typedef struct PalmettoBMCState {
-    AST2400State soc;
+    AspeedSoCState soc;
     MemoryRegion ram;
 } PalmettoBMCState;
=20
@@ -63,7 +63,7 @@ static void palmetto_bmc_init(MachineState *machine)
     PalmettoBMCState *bmc;
=20
     bmc =3D g_new0(PalmettoBMCState, 1);
-    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
+    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_ASPEED_SOC);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
                               &error_abort);
=20
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index e68807d475b7..bf63ae90cabe 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -1,5 +1,5 @@
 /*
- * ASPEED AST2400 SoC
+ * ASPEED SoC family
  *
  * Andrew Jeffery <andrew@aj.id.au>
  *
@@ -9,8 +9,8 @@
  * the COPYING file in the top-level directory.
  */
=20
-#ifndef AST2400_H
-#define AST2400_H
+#ifndef ASPEED_SOC_H
+#define ASPEED_SOC_H
=20
 #include "hw/arm/arm.h"
 #include "hw/intc/aspeed_vic.h"
@@ -20,7 +20,7 @@
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
=20
-typedef struct AST2400State {
+typedef struct AspeedSoCState {
     /*< private >*/
     DeviceState parent;
=20
@@ -34,11 +34,11 @@ typedef struct AST2400State {
     AspeedSMCState smc;
     AspeedSMCState spi;
     AspeedSDMCState sdmc;
-} AST2400State;
+} AspeedSoCState;
=20
-#define TYPE_AST2400 "ast2400"
-#define AST2400(obj) OBJECT_CHECK(AST2400State, (obj), TYPE_AST2400)
+#define TYPE_ASPEED_SOC "aspeed-soc"
+#define ASPEED_SOC(obj) OBJECT_CHECK(AspeedSoCState, (obj), TYPE_ASPEED_=
SOC)
=20
 #define AST2400_SDRAM_BASE       0x40000000
=20
-#endif /* AST2400_H */
+#endif /* ASPEED_SOC_H */
--=20
2.7.4


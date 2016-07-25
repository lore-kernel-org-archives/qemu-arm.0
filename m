Received: by 10.25.21.156 with SMTP id 28csp1280140lfv;
        Mon, 25 Jul 2016 10:09:58 -0700 (PDT)
X-Received: by 10.55.99.213 with SMTP id x204mr24138011qkb.70.1469466598196;
        Mon, 25 Jul 2016 10:09:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n23si18495234qtc.70.2016.07.25.10.09.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 10:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRjO9-0005si-HW
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 13:09:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bRjO3-0005sN-UW
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 13:09:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bRjO0-0005QE-Im
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 13:09:51 -0400
Received: from 6.mo1.mail-out.ovh.net ([46.105.43.205]:39295)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bRjO0-0005Pt-5d
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 13:09:48 -0400
Received: from player726.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4447AFF9243
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 19:09:42 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player726.ha.ovh.net (Postfix) with ESMTPSA id AB5DD2A0073;
	Mon, 25 Jul 2016 19:09:37 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 19:09:18 +0200
Message-Id: <1469466558-10964-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 5176324823131327249
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddriedugddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.43.205
Subject: [Qemu-arm] [PATCH v3] ast2400: add a memory controller device model
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
X-TUID: UUlRRl2aVZIY

The uboot in the previous release of the SDK was using a hardcoded
value for memory size. This is not true anymore, the value is now
retrieved from the memory controller.

Below is a model for this device, only supporting unlock and
configuration. Without it, we endup running a guest with 64MB, which
is a bit low nowdays. It uses a 'silicon-rev' property and ram_size to
build a default value. Some bits should be linked to SCU strapping
registers but it seems a bit complex to add for the current need.

The model is ready for the AST2500 SOC.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 Changes since v2:
=20
 - added readonly mask
 - fixed french typo in comment
 - reworked alignments in switch statement
 - added missing break in aspeed_sdmc_reset()
=20
 Changes since v1:
=20
 - fixed compile issue (missing header hw/arm/ast2400.h)
 - added bit definitions, for AST2400 and AST2500
 - added default configuration depending on the silicon revision
 - calculated ram bits using ram_size instead of using a property

 hw/arm/ast2400.c              |   15 ++
 hw/misc/Makefile.objs         |    2=20
 hw/misc/aspeed_sdmc.c         |  263 +++++++++++++++++++++++++++++++++++=
+++++++
 include/hw/arm/ast2400.h      |    2=20
 include/hw/misc/aspeed_sdmc.h |   31 ++++
 5 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_sdmc.c
 create mode 100644 include/hw/misc/aspeed_sdmc.h

Index: qemu-aspeed.git/hw/arm/ast2400.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-aspeed.git.orig/hw/arm/ast2400.c
+++ qemu-aspeed.git/hw/arm/ast2400.c
@@ -27,6 +27,7 @@
 #define AST2400_FMC_BASE         0X1E620000
 #define AST2400_SPI_BASE         0X1E630000
 #define AST2400_VIC_BASE         0x1E6C0000
+#define AST2400_SDMC_BASE        0x1E6E0000
 #define AST2400_SCU_BASE         0x1E6E2000
 #define AST2400_TIMER_BASE       0x1E782000
 #define AST2400_I2C_BASE         0x1E78A000
@@ -97,6 +98,12 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
     object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
     qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
+
+    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
+    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
+    qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
+                         AST2400_A0_SILICON_REV);
 }
=20
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -183,6 +190,14 @@ static void ast2400_realize(DeviceState
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, AST2400_SPI_FLASH_BASE);
+
+    /* SDMC - SDRAM Memory Controller */
+    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, AST2400_SDMC_BASE);
 }
=20
 static void ast2400_class_init(ObjectClass *oc, void *data)
Index: qemu-aspeed.git/hw/misc/Makefile.objs
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-aspeed.git.orig/hw/misc/Makefile.objs
+++ qemu-aspeed.git/hw/misc/Makefile.objs
@@ -52,4 +52,4 @@ obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
 obj-$(CONFIG_EDU) +=3D edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
 obj-$(CONFIG_AUX) +=3D auxbus.o
-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o
+obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
Index: qemu-aspeed.git/hw/misc/aspeed_sdmc.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null
+++ qemu-aspeed.git/hw/misc/aspeed_sdmc.c
@@ -0,0 +1,263 @@
+/*
+ * ASPEED SDRAM Memory Controller
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "hw/misc/aspeed_sdmc.h"
+#include "hw/misc/aspeed_scu.h"
+#include "hw/qdev-properties.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+/* Protection Key Register */
+#define R_PROT            (0x00 / 4)
+#define   PROT_KEY_UNLOCK     0xFC600309
+
+/* Configuration Register */
+#define R_CONF            (0x04 / 4)
+
+/*
+ * Configuration register Ox4 (for Aspeed AST2400 SOC)
+ *
+ * These are for the record and future use. ASPEED_SDMC_DRAM_SIZE is
+ * what we care about right now as it is checked by U-Boot to
+ * determine the RAM size.
+ */
+
+#define ASPEED_SDMC_RESERVED            0xFFFFF800 /* 31:11 reserved */
+#define ASPEED_SDMC_AST2300_COMPAT      (1 << 10)
+#define ASPEED_SDMC_SCRAMBLE_PATTERN    (1 << 9)
+#define ASPEED_SDMC_DATA_SCRAMBLE       (1 << 8)
+#define ASPEED_SDMC_ECC_ENABLE          (1 << 7)
+#define ASPEED_SDMC_VGA_COMPAT          (1 << 6) /* readonly */
+#define ASPEED_SDMC_DRAM_BANK           (1 << 5)
+#define ASPEED_SDMC_DRAM_BURST          (1 << 4)
+#define ASPEED_SDMC_VGA_APERTURE(x)     ((x & 0x3) << 2) /* readonly */
+#define     ASPEED_SDMC_VGA_8MB             0x0
+#define     ASPEED_SDMC_VGA_16MB            0x1
+#define     ASPEED_SDMC_VGA_32MB            0x2
+#define     ASPEED_SDMC_VGA_64MB            0x3
+#define ASPEED_SDMC_DRAM_SIZE(x)        (x & 0x3)
+#define     ASPEED_SDMC_DRAM_64MB           0x0
+#define     ASPEED_SDMC_DRAM_128MB          0x1
+#define     ASPEED_SDMC_DRAM_256MB          0x2
+#define     ASPEED_SDMC_DRAM_512MB          0x3
+
+#define ASPEED_SDMC_READONLY_MASK                       \
+    (ASPEED_SDMC_RESERVED | ASPEED_SDMC_VGA_COMPAT |    \
+     ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB))
+/*
+ * Configuration register Ox4 (for Aspeed AST2500 SOC and higher)
+ *
+ * Incompatibilities are annotated in the list. ASPEED_SDMC_HW_VERSION
+ * should be set to 1 for the AST2500 SOC.
+ */
+#define ASPEED_SDMC_HW_VERSION(x)       ((x & 0xf) << 28) /* readonly */
+#define ASPEED_SDMC_SW_VERSION          ((x & 0xff) << 20)
+#define ASPEED_SDMC_CACHE_INITIAL_DONE  (1 << 19)  /* readonly */
+#define ASPEED_SDMC_AST2500_RESERVED    0x7C000 /* 18:14 reserved */
+#define ASPEED_SDMC_CACHE_DDR4_CONF     (1 << 13)
+#define ASPEED_SDMC_CACHE_INITIAL       (1 << 12)
+#define ASPEED_SDMC_CACHE_RANGE_CTRL    (1 << 11)
+#define ASPEED_SDMC_CACHE_ENABLE        (1 << 10) /* differs from AST240=
0 */
+#define ASPEED_SDMC_DRAM_TYPE           (1 << 4)  /* differs from AST240=
0 */
+
+/* DRAM size definitions differs */
+#define     ASPEED_SDMC_AST2500_128MB       0x0
+#define     ASPEED_SDMC_AST2500_256MB       0x1
+#define     ASPEED_SDMC_AST2500_512MB       0x2
+#define     ASPEED_SDMC_AST2500_1024MB      0x3
+
+#define ASPEED_SDMC_AST2500_READONLY_MASK                               =
\
+    (ASPEED_SDMC_HW_VERSION(0xf) | ASPEED_SDMC_CACHE_INITIAL_DONE |     =
\
+     ASPEED_SDMC_AST2500_RESERVED | ASPEED_SDMC_VGA_COMPAT |            =
\
+     ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB))
+
+static uint64_t aspeed_sdmc_read(void *opaque, hwaddr addr, unsigned siz=
e)
+{
+    AspeedSDMCState *s =3D ASPEED_SDMC(opaque);
+
+    addr >>=3D 2;
+
+    if (addr >=3D ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds read at offset 0x%" HWADDR_PRIx=
 "\n",
+                      __func__, addr);
+        return 0;
+    }
+
+    return s->regs[addr];
+}
+
+static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
+                             unsigned int size)
+{
+    AspeedSDMCState *s =3D ASPEED_SDMC(opaque);
+
+    addr >>=3D 2;
+
+    if (addr >=3D ARRAY_SIZE(s->regs)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRI=
x "\n",
+                      __func__, addr);
+        return;
+    }
+
+    if (addr !=3D R_PROT && s->regs[R_PROT] !=3D PROT_KEY_UNLOCK) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: SDMC is locked!\n", __func__=
);
+        return;
+    }
+
+    if (addr =3D=3D R_CONF) {
+        /* Make sure readonly bits are kept */
+        switch (s->silicon_rev) {
+        case AST2400_A0_SILICON_REV:
+            data &=3D ~ASPEED_SDMC_READONLY_MASK;
+            break;
+        case AST2500_A0_SILICON_REV:
+            data &=3D ~ASPEED_SDMC_AST2500_READONLY_MASK;
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    s->regs[addr] =3D data;
+}
+
+static const MemoryRegionOps aspeed_sdmc_ops =3D {
+    .read =3D aspeed_sdmc_read,
+    .write =3D aspeed_sdmc_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size =3D 4,
+    .valid.max_access_size =3D 4,
+};
+
+static int ast2400_rambits(void)
+{
+    switch (ram_size >> 20) {
+    case 64:
+        return ASPEED_SDMC_DRAM_64MB;
+    case 128:
+        return ASPEED_SDMC_DRAM_128MB;
+    case 256:
+        return ASPEED_SDMC_DRAM_256MB;
+    case 512:
+        return ASPEED_SDMC_DRAM_512MB;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid RAM size: 0x%"
+                      HWADDR_PRIx "\n", __func__, ram_size);
+        break;
+    }
+
+    /* set a minimum default */
+    return ASPEED_SDMC_DRAM_64MB;
+}
+
+static int ast2500_rambits(void)
+{
+    switch (ram_size >> 20) {
+    case 128:
+        return ASPEED_SDMC_AST2500_128MB;
+    case 256:
+        return ASPEED_SDMC_AST2500_256MB;
+    case 512:
+        return ASPEED_SDMC_AST2500_512MB;
+    case 1024:
+        return ASPEED_SDMC_AST2500_1024MB;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid RAM size: 0x%"
+                      HWADDR_PRIx "\n", __func__, ram_size);
+        break;
+    }
+
+    /* set a minimum default */
+    return ASPEED_SDMC_AST2500_128MB;
+}
+
+static void aspeed_sdmc_reset(DeviceState *dev)
+{
+    AspeedSDMCState *s =3D ASPEED_SDMC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+
+    /* Set ram size bit and defaults values */
+    switch (s->silicon_rev) {
+    case AST2400_A0_SILICON_REV:
+        s->regs[R_CONF] |=3D
+            ASPEED_SDMC_VGA_COMPAT |
+            ASPEED_SDMC_DRAM_SIZE(ast2400_rambits());
+        break;
+
+    case AST2500_A0_SILICON_REV:
+        s->regs[R_CONF] |=3D
+            ASPEED_SDMC_HW_VERSION(1) |
+            ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
+            ASPEED_SDMC_DRAM_SIZE(ast2500_rambits());
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    AspeedSDMCState *s =3D ASPEED_SDMC(dev);
+
+    if (!is_supported_silicon_rev(s->silicon_rev)) {
+        error_setg(errp, "Unknown silicon revision: 0x%" PRIx32,
+                s->silicon_rev);
+        return;
+    }
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_sdmc_ops, s,
+                          TYPE_ASPEED_SDMC, 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_aspeed_sdmc =3D {
+    .name =3D "aspeed.sdmc",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AspeedSDMCState, ASPEED_SDMC_NR_REGS)=
,
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property aspeed_sdmc_properties[] =3D {
+    DEFINE_PROP_UINT32("silicon-rev", AspeedSDMCState, silicon_rev, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void aspeed_sdmc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    dc->realize =3D aspeed_sdmc_realize;
+    dc->reset =3D aspeed_sdmc_reset;
+    dc->desc =3D "ASPEED SDRAM Memory Controller";
+    dc->vmsd =3D &vmstate_aspeed_sdmc;
+    dc->props =3D aspeed_sdmc_properties;
+}
+
+static const TypeInfo aspeed_sdmc_info =3D {
+    .name =3D TYPE_ASPEED_SDMC,
+    .parent =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AspeedSDMCState),
+    .class_init =3D aspeed_sdmc_class_init,
+};
+
+static void aspeed_sdmc_register_types(void)
+{
+    type_register_static(&aspeed_sdmc_info);
+}
+
+type_init(aspeed_sdmc_register_types);
Index: qemu-aspeed.git/include/hw/arm/ast2400.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- qemu-aspeed.git.orig/include/hw/arm/ast2400.h
+++ qemu-aspeed.git/include/hw/arm/ast2400.h
@@ -15,6 +15,7 @@
 #include "hw/arm/arm.h"
 #include "hw/intc/aspeed_vic.h"
 #include "hw/misc/aspeed_scu.h"
+#include "hw/misc/aspeed_sdmc.h"
 #include "hw/timer/aspeed_timer.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
@@ -32,6 +33,7 @@ typedef struct AST2400State {
     AspeedSCUState scu;
     AspeedSMCState smc;
     AspeedSMCState spi;
+    AspeedSDMCState sdmc;
 } AST2400State;
=20
 #define TYPE_AST2400 "ast2400"
Index: qemu-aspeed.git/include/hw/misc/aspeed_sdmc.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- /dev/null
+++ qemu-aspeed.git/include/hw/misc/aspeed_sdmc.h
@@ -0,0 +1,31 @@
+/*
+ * ASPEED SDRAM Memory Controller
+ *
+ * Copyright (C) 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later. See the
+ * COPYING file in the top-level directory.
+ */
+#ifndef ASPEED_SDMC_H
+#define ASPEED_SDMC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_ASPEED_SDMC "aspeed.sdmc"
+#define ASPEED_SDMC(obj) OBJECT_CHECK(AspeedSDMCState, (obj), TYPE_ASPEE=
D_SDMC)
+
+#define ASPEED_SDMC_NR_REGS (0x8 >> 2)
+
+typedef struct AspeedSDMCState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+
+    uint32_t regs[ASPEED_SDMC_NR_REGS];
+    uint32_t silicon_rev;
+
+} AspeedSDMCState;
+
+#endif /* ASPEED_SDMC_H */

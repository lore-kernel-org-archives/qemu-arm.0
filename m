Received: by 10.25.21.96 with SMTP id l93csp1496248lfi;
        Mon, 4 Jul 2016 05:30:53 -0700 (PDT)
X-Received: by 10.55.181.1 with SMTP id e1mr14387442qkf.99.1467635453132;
        Mon, 04 Jul 2016 05:30:53 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g65si1842340qtd.118.2016.07.04.05.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 05:30:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK31Y-0003yU-Db
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 08:30:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2rZ-0007dj-Fi
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:20:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bK2rT-0003yH-Nf
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:20:32 -0400
Received: from 6.mo3.mail-out.ovh.net ([188.165.43.173]:34474)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bK2rT-0003xv-E8
	for qemu-devel@nongnu.org; Mon, 04 Jul 2016 08:20:27 -0400
Received: from player761.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id 841DCFFAD05
	for <qemu-devel@nongnu.org>; Mon,  4 Jul 2016 14:20:26 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player761.ha.ovh.net (Postfix) with ESMTPSA id 0FB1848009E;
	Mon,  4 Jul 2016 14:20:19 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon,  4 Jul 2016 14:18:58 +0200
Message-Id: <1467634738-28642-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467634738-28642-1-git-send-email-clg@kaod.org>
References: <1467634738-28642-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6091681448347208465
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrvddvgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.43.173
Subject: [Qemu-devel] [PATCH 7/7] ast2400: add a memory controller device
 model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, mar.krzeminski@gmail.com,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bn5UzlXRLMYv

The uboot in the previous release of the SDK was using a hardcoded
value for memory size. This is not true anymore, the value is now
retrieved from the memory controller.

Below is a model for this device, only supporting unlock and
configuration. Without it, we endup running a guest with 64MB, which
is a bit low for Linux nowdays.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/ast2400.c              |  13 +++++
 hw/misc/Makefile.objs         |   2 +-
 hw/misc/aspeed_sdmc.c         | 126 ++++++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/ast2400.h      |   1 +
 include/hw/misc/aspeed_sdmc.h |  49 ++++++++++++++++
 5 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/aspeed_sdmc.c
 create mode 100644 include/hw/misc/aspeed_sdmc.h

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 9c30b45f87a9..fb0156ba8bc1 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -27,6 +27,7 @@
 #define AST2400_FMC_BASE         0X1E620000
 #define AST2400_SPI_BASE         0X1E630000
 #define AST2400_VIC_BASE         0x1E6C0000
+#define AST2400_SDMC_BASE        0x1E6E0000
 #define AST2400_SCU_BASE         0x1E6E2000
 #define AST2400_TIMER_BASE       0x1E782000
 #define AST2400_I2C_BASE         0x1E78A000
@@ -99,6 +100,10 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
     object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
     qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
+
+    object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
+    object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
 }
=20
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -184,6 +189,14 @@ static void ast2400_realize(DeviceState *dev, Error =
**errp)
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
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 54020aa06c00..d488b748c789 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -52,4 +52,4 @@ obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
 obj-$(CONFIG_EDU) +=3D edu.o
 obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
 obj-$(CONFIG_AUX) +=3D aux.o
-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o
+obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
new file mode 100644
index 000000000000..52b6393b3f0b
--- /dev/null
+++ b/hw/misc/aspeed_sdmc.c
@@ -0,0 +1,126 @@
+/*
+ * ASPEED SDRAM Memory Controller
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/aspeed_sdmc.h"
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
+    s->regs[addr] =3D data;
+}
+
+static const MemoryRegionOps aspeed_sdmc_ops =3D {
+    .read =3D aspeed_sdmc_read,
+    .write =3D aspeed_sdmc_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size =3D 4,
+    .valid.max_access_size =3D 4,
+    .valid.unaligned =3D false,
+};
+
+static void aspeed_sdmc_reset(DeviceState *dev)
+{
+    AspeedSDMCState *s =3D ASPEED_SDMC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    s->regs[R_CONF] =3D s->config;
+}
+
+static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    AspeedSDMCState *s =3D ASPEED_SDMC(dev);
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
+    DEFINE_PROP_UINT32("configuration", AspeedSDMCState, config,
+                       ASPEED_SDMC_256MB),
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
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
index 7833bc716cd8..d549cceb121c 100644
--- a/include/hw/arm/ast2400.h
+++ b/include/hw/arm/ast2400.h
@@ -32,6 +32,7 @@ typedef struct AST2400State {
     AspeedSCUState scu;
     AspeedSMCState smc;
     AspeedSMCState spi;
+    AspeedSDMCState sdmc;
 } AST2400State;
=20
 #define TYPE_AST2400 "ast2400"
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.=
h
new file mode 100644
index 000000000000..65fefebdb2cd
--- /dev/null
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -0,0 +1,49 @@
+/*
+ * ASPEED SDRAM Memory Controller
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
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
+    uint32_t config;
+
+} AspeedSDMCState;
+
+/*
+ * For Aspeed AST2400 SOC
+ */
+#define ASPEED_SDMC_64MB    0x0
+#define ASPEED_SDMC_128MB   0x1
+#define ASPEED_SDMC_256MB   0x2
+#define ASPEED_SDMC_512MB   0x3
+
+/*
+ * For Aspeed AST2500 SOC and higher revision number
+ */
+#define ASPEED_SDMC_NEW_VERSION  (1 << 28)
+
+#define ASPEED_SDMC_NEW_128MB   (0x0 | ASPEED_SDMC_NEW_VERSION)
+#define ASPEED_SDMC_NEW_256MB   (0x1 | ASPEED_SDMC_NEW_VERSION)
+#define ASPEED_SDMC_NEW_512MB   (0x2 | ASPEED_SDMC_NEW_VERSION)
+#define ASPEED_SDMC_NEW_1024MB  (0x3 | ASPEED_SDMC_NEW_VERSION)
+
+#endif /* ASPEED_SDMC_H */
--=20
2.1.4


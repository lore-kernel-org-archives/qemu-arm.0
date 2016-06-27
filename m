Received: by 10.25.21.96 with SMTP id l93csp1212104lfi;
        Mon, 27 Jun 2016 09:51:43 -0700 (PDT)
X-Received: by 10.237.40.99 with SMTP id r90mr25210793qtd.0.1467046303179;
        Mon, 27 Jun 2016 09:51:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r3si17940280qkc.200.2016.06.27.09.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jun 2016 09:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHZl8-0003Gl-JB
	for alex.bennee@linaro.org; Mon, 27 Jun 2016 12:51:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZe0-0002Ff-7e
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 12:44:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bHZdv-0008Iz-5q
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 12:44:19 -0400
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:33512)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bHZdu-0008Ii-S3
	for qemu-arm@nongnu.org; Mon, 27 Jun 2016 12:44:15 -0400
Received: from player728.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id DC243FFA2D0
	for <qemu-arm@nongnu.org>; Mon, 27 Jun 2016 18:44:13 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player728.ha.ovh.net (Postfix) with ESMTPSA id 648A1540076;
	Mon, 27 Jun 2016 18:44:05 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Mon, 27 Jun 2016 18:43:31 +0200
Message-Id: <1467045813-18144-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1467045813-18144-1-git-send-email-clg@kaod.org>
References: <1467045813-18144-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6331216651885185809
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddruddugdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.172.75
Subject: [Qemu-arm] [PATCH v4 3/5] ast2400: add SPI flash slaves
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /sxT7dNhaooh

Each controller on the ast2400 has a memory range on which it maps its
flash module slaves. Each slave is assigned a memory segment for its
mapping that can be changed at bootime with the Segment Address
Register. This is not supported in the current implementation so we
are using the defaults provided by the specs.

Each SPI flash slave can then be accessed in two modes: Command and
User. When in User mode, accesses to the memory segment of the slaves
are translated in SPI transfers. When in Command mode, the HW
generates the SPI commands automatically and the memory segment is
accessed as if doing a MMIO. Other SPI controllers call that mode
linear addressing mode.

For this purpose, we are adding below each crontoller an array of
structs gathering for each SPI flash module, a segment rank, a
MemoryRegion to handle the memory accesses and the associated SPI
slave device, which should be a m25p80.

Only the User mode is supported for now but we are preparing ground
for the Command mode. The framework is sufficient to support Linux.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v3:

 - Fixed error logging
 - Constantified a couple of routine arguments
 - Sorted out what was need for migration (nothing apriori, but flash
   module object will need some care)
 - Reworked the structures handling the IOs on the flash modules :
   . Replaced the SysBusDevice object with a simple struct
   . Added a global memory region for the flash memory address space
   . Added sub regions for each segment
   . Moved mapping in SOC initialization  =20
 - Rephrased commit log

 hw/arm/ast2400.c            |   5 ++
 hw/ssi/aspeed_smc.c         | 150 ++++++++++++++++++++++++++++++++++++++=
+++++-
 include/hw/ssi/aspeed_smc.h |  21 +++++++
 3 files changed, 173 insertions(+), 3 deletions(-)

diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index b16ba2d0c516..9c30b45f87a9 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -31,6 +31,9 @@
 #define AST2400_TIMER_BASE       0x1E782000
 #define AST2400_I2C_BASE         0x1E78A000
=20
+#define AST2400_FMC_FLASH_BASE   0x20000000
+#define AST2400_SPI_FLASH_BASE   0x30000000
+
 #define AST2400_A0_SILICON_REV   0x02000303
=20
 static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
@@ -167,6 +170,7 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, AST2400_FMC_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 1, AST2400_FMC_FLASH_BASE);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 19));
=20
@@ -179,6 +183,7 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, AST2400_SPI_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, AST2400_SPI_FLASH_BASE);
 }
=20
 static void ast2400_class_init(ObjectClass *oc, void *data)
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 537635e18d64..cb0b23750bcf 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -127,13 +127,129 @@
 #define R_SPI_MISC_CTRL   (0x10 / 4)
 #define R_SPI_TIMINGS     (0x14 / 4)
=20
+/*
+ * Default segments mapping addresses and size for each slave per
+ * controller. These can be changed when board is initialized with the
+ * Segment Address Registers but they don't seem do be used on the
+ * field.
+ */
+static const AspeedSegments aspeed_segments_legacy[] =3D {
+    { 0x10000000, 32 * 1024 * 1024 },
+};
+
+static const AspeedSegments aspeed_segments_fmc[] =3D {
+    { 0x20000000, 64 * 1024 * 1024 },
+    { 0x24000000, 32 * 1024 * 1024 },
+    { 0x26000000, 32 * 1024 * 1024 },
+    { 0x28000000, 32 * 1024 * 1024 },
+    { 0x2A000000, 32 * 1024 * 1024 }
+};
+
+static const AspeedSegments aspeed_segments_spi[] =3D {
+    { 0x30000000, 64 * 1024 * 1024 },
+};
+
 static const AspeedSMCController controllers[] =3D {
     { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5 },
+      CONF_ENABLE_W0, 5, aspeed_segments_legacy, 0x6000000 },
     { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5 },
+      CONF_ENABLE_W0, 5, aspeed_segments_fmc, 0x10000000 },
     { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
-      SPI_CONF_ENABLE_W0, 1 },
+      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi, 0x10000000 },
+};
+
+static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
+                                              unsigned size)
+{
+    qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of size %u=
"
+                  PRIx64 "\n", __func__, addr, size);
+    return 0;
+}
+
+static void aspeed_smc_flash_default_write(void *opaque, hwaddr addr,
+                                           uint64_t data, unsigned size)
+{
+   qemu_log_mask(LOG_GUEST_ERROR, "%s: To 0x%" HWADDR_PRIx " of size %u:=
 0x%"
+                 PRIx64 "\n", __func__, addr, size, data);
+}
+
+static const MemoryRegionOps aspeed_smc_flash_default_ops =3D {
+    .read =3D aspeed_smc_flash_default_read,
+    .write =3D aspeed_smc_flash_default_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 4,
+    },
+};
+
+static inline int aspeed_smc_flash_mode(const AspeedSMCState *s, int cs)
+{
+    return s->regs[s->r_ctrl0 + cs] & CTRL_CMD_MODE_MASK;
+}
+
+static inline bool aspeed_smc_is_usermode(const AspeedSMCState *s, int c=
s)
+{
+    return aspeed_smc_flash_mode(s, cs) =3D=3D CTRL_USERMODE;
+}
+
+static inline bool aspeed_smc_is_writable(const AspeedSMCState *s, int c=
s)
+{
+    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
+}
+
+static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigne=
d size)
+{
+    AspeedSMCFlash *fl =3D opaque;
+    const AspeedSMCState *s =3D fl->controller;
+    uint64_t ret =3D 0;
+    int i;
+
+    if (aspeed_smc_is_usermode(s, fl->id)) {
+        for (i =3D 0; i < size; i++) {
+            ret |=3D ssi_transfer(s->spi, 0x0) << (8 * i);
+        }
+    } else {
+        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
+                      __func__);
+        ret =3D -1;
+    }
+
+    return ret;
+}
+
+static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t d=
ata,
+                           unsigned size)
+{
+    AspeedSMCFlash *fl =3D opaque;
+    const AspeedSMCState *s =3D fl->controller;
+    int i;
+
+    if (!aspeed_smc_is_writable(s, fl->id)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: flash is not writable at 0x%=
"
+                      HWADDR_PRIx "\n", __func__, addr);
+        return;
+    }
+
+    if (!aspeed_smc_is_usermode(s, fl->id)) {
+        qemu_log_mask(LOG_UNIMP, "%s: usermode not implemented\n",
+                      __func__);
+        return;
+    }
+
+    for (i =3D 0; i < size; i++) {
+        ssi_transfer(s->spi, (data >> (8 * i)) & 0xff);
+    }
+}
+
+static const MemoryRegionOps aspeed_smc_flash_ops =3D {
+    .read =3D aspeed_smc_flash_read,
+    .write =3D aspeed_smc_flash_write,
+    .endianness =3D DEVICE_LITTLE_ENDIAN,
+    .valid =3D {
+        .min_access_size =3D 1,
+        .max_access_size =3D 4,
+    },
 };
=20
 static bool aspeed_smc_is_ce_stop_active(const AspeedSMCState *s, int cs=
)
@@ -237,6 +353,8 @@ static void aspeed_smc_realize(DeviceState *dev, Erro=
r **errp)
     AspeedSMCState *s =3D ASPEED_SMC(dev);
     AspeedSMCClass *mc =3D ASPEED_SMC_GET_CLASS(s);
     int i;
+    char name[32];
+    hwaddr offset =3D 0;
=20
     s->ctrl =3D mc->ctrl;
=20
@@ -270,6 +388,32 @@ static void aspeed_smc_realize(DeviceState *dev, Err=
or **errp)
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
                           s->ctrl->name, ASPEED_SMC_R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
+
+    /*
+     * Memory region where flash modules are remapped
+     */
+    snprintf(name, sizeof(name), "%s.flash", s->ctrl->name);
+
+    memory_region_init_io(&s->mmio_flash, OBJECT(s),
+                          &aspeed_smc_flash_default_ops, s, name,
+                          s->ctrl->mapping_window_size);
+    sysbus_init_mmio(sbd, &s->mmio_flash);
+
+    s->flashes =3D g_malloc0(sizeof(AspeedSMCFlash) * s->num_cs);
+
+    for (i =3D 0; i < s->num_cs; ++i) {
+        AspeedSMCFlash *fl =3D &s->flashes[i];
+
+        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
+
+        fl->id =3D i;
+        fl->controller =3D s;
+        fl->size =3D s->ctrl->segments[i].size;
+        memory_region_init_io(&fl->mmio, OBJECT(s), &aspeed_smc_flash_op=
s,
+                              fl, name, fl->size);
+        memory_region_add_subregion(&s->mmio_flash, offset, &fl->mmio);
+        offset +=3D fl->size;
+    }
 }
=20
 static const VMStateDescription vmstate_aspeed_smc =3D {
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index c4a4960cd880..def3b4507e75 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -27,6 +27,12 @@
=20
 #include "hw/ssi/ssi.h"
=20
+typedef struct AspeedSegments {
+    hwaddr addr;
+    uint32_t size;
+} AspeedSegments;
+
+struct AspeedSMCState;
 typedef struct AspeedSMCController {
     const char *name;
     uint8_t r_conf;
@@ -35,8 +41,20 @@ typedef struct AspeedSMCController {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
     uint8_t max_slaves;
+    const AspeedSegments *segments;
+    uint32_t mapping_window_size;
 } AspeedSMCController;
=20
+typedef struct AspeedSMCFlash {
+    const struct AspeedSMCState *controller;
+
+    uint8_t id;
+    uint32_t size;
+
+    MemoryRegion mmio;
+    DeviceState *flash;
+} AspeedSMCFlash;
+
 #define TYPE_ASPEED_SMC "aspeed.smc"
 #define ASPEED_SMC(obj) OBJECT_CHECK(AspeedSMCState, (obj), TYPE_ASPEED_=
SMC)
 #define ASPEED_SMC_CLASS(klass) \
@@ -57,6 +75,7 @@ typedef struct AspeedSMCState {
     const AspeedSMCController *ctrl;
=20
     MemoryRegion mmio;
+    MemoryRegion mmio_flash;
=20
     qemu_irq irq;
     int irqline;
@@ -74,6 +93,8 @@ typedef struct AspeedSMCState {
     uint8_t r_ctrl0;
     uint8_t r_timings;
     uint8_t conf_enable_w0;
+
+    AspeedSMCFlash *flashes;
 } AspeedSMCState;
=20
 #endif /* ASPEED_SMC_H */
--=20
2.1.4


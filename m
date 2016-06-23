Received: by 10.25.21.96 with SMTP id l93csp616390lfi;
        Thu, 23 Jun 2016 09:41:05 -0700 (PDT)
X-Received: by 10.55.75.82 with SMTP id y79mr44041257qka.57.1466700065506;
        Thu, 23 Jun 2016 09:41:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z188si891894qka.194.2016.06.23.09.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 09:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG7ge-0005T8-PW
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 12:41:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bG7aF-0005sf-6P
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bG7a6-0001by-Jj
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:34:26 -0400
Received: from mo1.mail-out.ovh.net ([178.32.228.1]:33539)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bG7a6-0001bQ-A4
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 12:34:18 -0400
Received: from player758.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id A04FFFF8D33
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 18:34:13 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player758.ha.ovh.net (Postfix) with ESMTPSA id 253C32C0087;
	Thu, 23 Jun 2016 18:34:05 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Thu, 23 Jun 2016 18:33:26 +0200
Message-Id: <1466699607-30406-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466699607-30406-1-git-send-email-clg@kaod.org>
References: <1466699607-30406-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1118300083696667409
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrtdeigdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.228.1
Subject: [Qemu-arm] [PATCH v3 4/5] ast2400: create SPI flash slaves
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
X-TUID: TYrcnFxX2WR5

A set of SPI flash slaves is attached under the flash controllers of
the palmetto platform. "n25q256a" flash modules are used for the BMC
and "mx25l25635e" for the host. These types are common in the
OpenPower ecosystem.

The segment addresses used for the memory mappings are the defaults
provided by the specs. They can be changed with the Segment Address
Register but this is not supported in the current implementation.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v2 :

 - moved the initialization of the flash modules under the palmetto
   platform
=20
 hw/arm/palmetto-bmc.c       | 28 ++++++++++++++++++++++++++
 hw/ssi/aspeed_smc.c         | 48 +++++++++++++++++++++++++++++++++++++++=
+++---
 include/hw/ssi/aspeed_smc.h |  8 ++++++++
 3 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index b8eed21348d8..d4abf3ca61ab 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -18,6 +18,8 @@
 #include "hw/arm/ast2400.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/blockdev.h"
=20
 static struct arm_boot_info palmetto_bmc_binfo =3D {
     .loader_start =3D AST2400_SDRAM_BASE,
@@ -30,6 +32,29 @@ typedef struct PalmettoBMCState {
     MemoryRegion ram;
 } PalmettoBMCState;
=20
+static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
+                                      Error **errp)
+{
+    int i ;
+
+    for (i =3D 0; i < s->num_cs; ++i) {
+        AspeedSMCFlashState *fl =3D s->flashes[i];
+        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
+        qemu_irq cs_line;
+
+        /* SPI Flash module */
+        fl->flash =3D ssi_create_slave_no_init(s->spi, flashtype);
+        if (dinfo) {
+            qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinfo(=
dinfo),
+                                errp);
+        }
+        qdev_init_nofail(fl->flash);
+
+        cs_line =3D qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
+    }
+}
+
 static void palmetto_bmc_init(MachineState *machine)
 {
     PalmettoBMCState *bmc;
@@ -49,6 +74,9 @@ static void palmetto_bmc_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
+    palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
+    palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
+
     palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
     palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
     palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index d97c077565c3..6be911ed36d0 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -98,13 +98,32 @@
 #define R_SPI_MISC_CRTL   (0x10 / 4)
 #define R_SPI_TIMINGS     (0x14 / 4)
=20
+/*
+ * Default segments mappings and size for each slave
+ */
+static const AspeedSegments aspeed_segments_legacy[] =3D {
+    { 0x14000000, 32 * 1024 * 1024 },
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
+      CONF_ENABLE_W0, 5, aspeed_segments_legacy },
     { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5 },
+      CONF_ENABLE_W0, 5, aspeed_segments_fmc },
     { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
-      SPI_CONF_ENABLE_W0, 1 },
+      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi },
 };
=20
 static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
@@ -217,6 +236,8 @@ static const MemoryRegionOps aspeed_smc_ops =3D {
     .valid.unaligned =3D true,
 };
=20
+static const MemoryRegionOps aspeed_smc_flash_ops;
+
 static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
@@ -254,6 +275,27 @@ static void aspeed_smc_realize(DeviceState *dev, Err=
or **errp)
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
                           s->ctrl->name, ASPEED_SMC_R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
+
+    s->flashes =3D g_new0(AspeedSMCFlashState *, s->num_cs);
+
+    for (i =3D 0; i < s->num_cs; ++i) {
+        Object *obj =3D object_new(TYPE_ASPEED_SMC_FLASH);
+        AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(obj);
+        char name[32];
+
+        s->flashes[i] =3D fl;
+
+        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
+
+        fl->id =3D i;
+        fl->controller =3D s;
+        fl->size =3D s->ctrl->segments[i].size;
+
+        memory_region_init_io(&fl->mmio, obj, &aspeed_smc_flash_ops, fl,=
 name,
+                              fl->size);
+        sysbus_init_mmio(SYS_BUS_DEVICE(fl), &fl->mmio);
+        sysbus_mmio_map(SYS_BUS_DEVICE(fl), 0, s->ctrl->segments[i].addr=
);
+    }
 }
=20
 static const VMStateDescription vmstate_aspeed_smc =3D {
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index abd0005b01c2..10b4083952cf 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -43,6 +43,11 @@ typedef struct AspeedSMCFlashState {
 #define ASPEED_SMC_FLASH(obj) \
     OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
=20
+typedef struct AspeedSegments {
+    hwaddr addr;
+    uint32_t size;
+} AspeedSegments;
+
 typedef struct AspeedSMCController {
     const char *name;
     uint8_t r_conf;
@@ -51,6 +56,7 @@ typedef struct AspeedSMCController {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
     uint8_t max_slaves;
+    const AspeedSegments *segments;
 } AspeedSMCController;
=20
 #define TYPE_ASPEED_SMC "aspeed.smc"
@@ -90,6 +96,8 @@ typedef struct AspeedSMCState {
     uint8_t r_ctrl0;
     uint8_t r_timings;
     uint8_t conf_enable_w0;
+
+    AspeedSMCFlashState **flashes;
 } AspeedSMCState;
=20
 #endif /* ASPEED_SMC_H */
--=20
2.1.4


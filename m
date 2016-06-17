Received: by 10.25.21.96 with SMTP id l93csp234979lfi;
        Fri, 17 Jun 2016 05:20:12 -0700 (PDT)
X-Received: by 10.55.31.140 with SMTP id n12mr1891965qkh.4.1466166012535;
        Fri, 17 Jun 2016 05:20:12 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s69si31293778qgd.2.2016.06.17.05.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 05:20:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDskt-0005m6-NA
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 08:20:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDshJ-0002Ew-FC
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 08:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bDshE-0003Dk-D0
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 08:16:28 -0400
Received: from 3.mo53.mail-out.ovh.net ([178.33.44.239]:50161)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bDshE-0003Da-3X
	for qemu-devel@nongnu.org; Fri, 17 Jun 2016 08:16:24 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 485D9FF946B
	for <qemu-devel@nongnu.org>; Fri, 17 Jun 2016 14:16:23 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id BB122620094;
	Fri, 17 Jun 2016 14:16:13 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 17 Jun 2016 14:15:23 +0200
Message-Id: <1466165724-7620-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466165724-7620-1-git-send-email-clg@kaod.org>
References: <1466165724-7620-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16867950931150342929
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrledtgdeglecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.33.44.239
Subject: [Qemu-devel] [PATCH v2 4/5] ast2400: create SPI flash slaves
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
Cc: kwolf@redhat.com, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
	armbru@redhat.com, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O/UDEA/DRCUv

A set of SPI flash slaves is attached under the flash controllers of
the palmetto platform. "n25q256a" flash modules are used for the BMC
and "mx25l25635e" for the host. These types are common in the
OpenPower ecosystem.

The segment addresses used for the memory mappings are the defaults
provided by the specs. They can be changed with the Segment Address
Register but this is not supported in the current implementation.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v1:
=20
 - use the "drive" property to define the flash backend=20

 hw/arm/palmetto-bmc.c       |  3 ++
 hw/ssi/aspeed_smc.c         | 69 +++++++++++++++++++++++++++++++++++++++=
++++--
 include/hw/ssi/aspeed_smc.h | 10 +++++++
 3 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index a51d960510ee..0aed97a7d9cf 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -47,6 +47,9 @@ static void palmetto_bmc_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
+    aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
+    aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort);
+
     palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
     palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
     palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6a02906c8f97..a8337eb81975 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -28,6 +28,8 @@
 #include "qemu/log.h"
 #include "include/qemu/error-report.h"
 #include "exec/address-spaces.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/blockdev.h"
=20
 #include "hw/ssi/aspeed_smc.h"
=20
@@ -98,13 +100,32 @@
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
@@ -254,6 +275,8 @@ static int aspeed_smc_init(SysBusDevice *sbd)
     memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
                           s->ctrl->name, ASPEED_SMC_R_MAX * 4);
     sysbus_init_mmio(sbd, &s->mmio);
+
+    s->flashes =3D g_new0(AspeedSMCFlashState *, s->num_cs);
     return 0;
 }
=20
@@ -395,3 +418,43 @@ static void aspeed_smc_flash_register_types(void)
 }
=20
 type_init(aspeed_smc_flash_register_types)
+
+void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype,
+                             Error **errp)
+{
+    int i ;
+    char name[32];
+
+    for (i =3D 0; i < s->num_cs; ++i) {
+        Object *obj =3D object_new(TYPE_ASPEED_SMC_FLASH);
+        AspeedSMCFlashState *fl =3D ASPEED_SMC_FLASH(obj);
+        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
+        qemu_irq cs_line;
+
+        s->flashes[i] =3D fl;
+
+        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
+
+        fl->id =3D i;
+        fl->controller =3D s;
+        fl->size =3D s->ctrl->segments[i].size;
+
+        /* backing region */
+        memory_region_init_io(&fl->mmio, obj, &aspeed_smc_flash_ops, fl,=
 name,
+                              fl->size);
+        sysbus_init_mmio(SYS_BUS_DEVICE(fl), &fl->mmio);
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
+
+        sysbus_mmio_map(SYS_BUS_DEVICE(fl), 0, s->ctrl->segments[i].addr=
);
+    }
+}
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index abd0005b01c2..2636c775c90f 100644
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
@@ -90,6 +96,10 @@ typedef struct AspeedSMCState {
     uint8_t r_ctrl0;
     uint8_t r_timings;
     uint8_t conf_enable_w0;
+
+    AspeedSMCFlashState **flashes;
 } AspeedSMCState;
=20
+extern void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flash=
type,
+                                    Error **errp);
 #endif /* ASPEED_SMC_H */
--=20
2.1.4


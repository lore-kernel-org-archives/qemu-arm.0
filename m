Received: by 10.80.163.71 with SMTP id 65csp1919524edn;
        Tue, 27 Sep 2016 05:18:04 -0700 (PDT)
X-Received: by 10.13.196.135 with SMTP id g129mr20424626ywd.16.1474978684025;
        Tue, 27 Sep 2016 05:18:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b18si671866ywh.208.2016.09.27.05.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Sep 2016 05:18:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1borKl-0005pN-Ak
	for alex.bennee@linaro.org; Tue, 27 Sep 2016 08:18:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6q-0001Gt-V3
	for qemu-devel@nongnu.org; Tue, 27 Sep 2016 08:03:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6l-0002r6-4y
	for qemu-devel@nongnu.org; Tue, 27 Sep 2016 08:03:39 -0400
Received: from 9.mo178.mail-out.ovh.net ([46.105.75.45]:34091)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bor6k-0002qs-Si
	for qemu-devel@nongnu.org; Tue, 27 Sep 2016 08:03:35 -0400
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 0D181FFA237
	for <qemu-devel@nongnu.org>; Tue, 27 Sep 2016 14:03:34 +0200 (CEST)
Received: from hermes.kaod.org.com (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id 95DE4580097;
	Tue, 27 Sep 2016 14:03:27 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 27 Sep 2016 13:57:39 +0200
Message-Id: <1474977462-28032-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474977462-28032-1-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6923721477168663313
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrudehgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.75.45
Subject: [Qemu-devel] [PATCH 3/6] aspeed: extend the number of host SPI
 controllers
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
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yVue8vTzgbi3

The AST2500 SoC has two. Let's prepare ground for the next changes
which will add the required definitions for the second host SPI
controller.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c             |  2 +-
 hw/arm/aspeed_soc.c         | 44 +++++++++++++++++++++++++++++----------=
-----
 include/hw/arm/aspeed_soc.h |  6 +++++-
 3 files changed, 35 insertions(+), 17 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 4bb33cbb5e70..c7206fda6d85 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -129,7 +129,7 @@ static void aspeed_board_init(MachineState *machine,
                                    &error_abort);
=20
     aspeed_board_init_flashes(&bmc->soc.fmc, "n25q256a", &error_abort);
-    aspeed_board_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
+    aspeed_board_init_flashes(&bmc->soc.spi[0], "mx25l25635e", &error_ab=
ort);
=20
     aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
     aspeed_board_binfo.initrd_filename =3D machine->initrd_filename;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 80ad7322bde2..b3103f337374 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -37,10 +37,17 @@ static const int timer_irqs[] =3D { 16, 17, 18, 35, 3=
6, 37, 38, 39, };
 #define AST2400_SDRAM_BASE       0x40000000
 #define AST2500_SDRAM_BASE       0x80000000
=20
+static const hwaddr aspeed_soc_ast2400_spi_bases[] =3D { ASPEED_SOC_SPI_=
BASE };
+
+static const hwaddr aspeed_soc_ast2500_spi_bases[] =3D { ASPEED_SOC_SPI_=
BASE };
+
 static const AspeedSoCInfo aspeed_socs[] =3D {
-    { "ast2400-a0", "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
 },
-    { "ast2400",    "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
 },
-    { "ast2500-a1", "arm1176", AST2500_A1_SILICON_REV, AST2500_SDRAM_BAS=
E },
+    { "ast2400-a0", "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
,
+      1, aspeed_soc_ast2400_spi_bases },
+    { "ast2400",    "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
,
+      1, aspeed_soc_ast2400_spi_bases },
+    { "ast2500-a1", "arm1176", AST2500_A1_SILICON_REV, AST2500_SDRAM_BAS=
E,
+      1, aspeed_soc_ast2500_spi_bases },
 };
=20
 /*
@@ -72,6 +79,7 @@ static void aspeed_soc_init(Object *obj)
 {
     AspeedSoCState *s =3D ASPEED_SOC(obj);
     AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
+    int i;
=20
     s->cpu =3D cpu_arm_init(sc->info->cpu_model);
=20
@@ -101,9 +109,11 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
     qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
=20
-    object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
-    object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
-    qdev_set_parent_bus(DEVICE(&s->spi), sysbus_get_default());
+    for (i =3D 0; i < sc->info->spis_num; i++) {
+        object_initialize(&s->spi[i], sizeof(s->spi[i]), "aspeed.smc.spi=
");
+        object_property_add_child(obj, "spi", OBJECT(&s->spi[i]), NULL);
+        qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
+    }
=20
     object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
     object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
@@ -118,6 +128,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
 {
     int i;
     AspeedSoCState *s =3D ASPEED_SOC(dev);
+    AspeedSoCClass *sc =3D ASPEED_SOC_GET_CLASS(s);
     Error *err =3D NULL, *local_err =3D NULL;
=20
     /* IO space */
@@ -190,16 +201,19 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
                        qdev_get_gpio_in(DEVICE(&s->vic), 19));
=20
     /* SPI */
-    object_property_set_int(OBJECT(&s->spi), 1, "num-cs", &err);
-    object_property_set_bool(OBJECT(&s->spi), true, "realized", &local_e=
rr);
-    error_propagate(&err, local_err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
+    for (i =3D 0; i < sc->info->spis_num; i++) {
+        object_property_set_int(OBJECT(&s->spi[i]), 1, "num-cs", &err);
+        object_property_set_bool(OBJECT(&s->spi[i]), true, "realized",
+                                 &local_err);
+        error_propagate(&err, local_err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 0, sc->info->spi_bas=
es[i]);
+        sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi[i]), 1,
+                        s->spi[i].ctrl->flash_window_base);
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, ASPEED_SOC_SPI_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1,
-                    s->spi.ctrl->flash_window_base);
=20
     /* SDMC - SDRAM Memory Controller */
     object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 7359e25fce49..f26a9f043983 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -20,6 +20,8 @@
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
=20
+#define ASPEED_SPIS_NUM  2
+
 typedef struct AspeedSoCState {
     /*< private >*/
     DeviceState parent;
@@ -32,7 +34,7 @@ typedef struct AspeedSoCState {
     AspeedI2CState i2c;
     AspeedSCUState scu;
     AspeedSMCState fmc;
-    AspeedSMCState spi;
+    AspeedSMCState spi[ASPEED_SPIS_NUM];
     AspeedSDMCState sdmc;
 } AspeedSoCState;
=20
@@ -44,6 +46,8 @@ typedef struct AspeedSoCInfo {
     const char *cpu_model;
     uint32_t silicon_rev;
     hwaddr sdram_base;
+    int spis_num;
+    const hwaddr *spi_bases;
 } AspeedSoCInfo;
=20
 typedef struct AspeedSoCClass {
--=20
2.7.4


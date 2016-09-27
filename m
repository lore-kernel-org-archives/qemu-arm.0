Received: by 10.80.163.71 with SMTP id 65csp1920619edn;
        Tue, 27 Sep 2016 05:20:36 -0700 (PDT)
X-Received: by 10.200.56.72 with SMTP id r8mr27963030qtb.120.1474978836357;
        Tue, 27 Sep 2016 05:20:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c123si1367987qka.301.2016.09.27.05.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Sep 2016 05:20:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50393 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1borND-0000Ta-ML
	for alex.bennee@linaro.org; Tue, 27 Sep 2016 08:20:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6w-0001Li-FN
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6r-0002u6-DD
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:46 -0400
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:35143)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bor6r-0002tv-5H
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:41 -0400
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 8E48AFFA1F0
	for <qemu-arm@nongnu.org>; Tue, 27 Sep 2016 14:03:40 +0200 (CEST)
Received: from hermes.kaod.org.com (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id 220D1580089;
	Tue, 27 Sep 2016 14:03:34 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 27 Sep 2016 13:57:40 +0200
Message-Id: <1474977462-28032-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474977462-28032-1-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6925410330772343569
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrudehgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.39.61
Subject: [Qemu-arm] [PATCH 4/6] aspeed: add support for the AST2500 SoC SMC
 controllers
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
X-TUID: IpaJ3WMbAsDP

The SMC controllers on the Aspeed AST2500 SoC are very similar to the
ones found on the AST2400. The differences are on the number of
supported flash modules and their default mappings in the SoC address
space.

The Aspeed AST2500 has one SPI controller for the BMC firmware and two
for the host firmware. All controllers have now the same set of
registers compatible with the AST2400 FMC controller and the legacy
'SMC' controller is fully gone.

We keep the FMC object to act as the BMC SPI controller and add a new
SPI controller for the host. We also have to introduce new type names
to handle the differences in the flash modules memory mappping.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c         | 21 +++++++++++++++------
 hw/ssi/aspeed_smc.c         | 28 +++++++++++++++++++++++++++-
 include/hw/arm/aspeed_soc.h |  2 ++
 3 files changed, 44 insertions(+), 7 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index b3103f337374..e14f5c217eab 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -25,6 +25,7 @@
 #define ASPEED_SOC_IOMEM_BASE       0x1E600000
 #define ASPEED_SOC_FMC_BASE         0x1E620000
 #define ASPEED_SOC_SPI_BASE         0x1E630000
+#define ASPEED_SOC_SPI2_BASE        0x1E631000
 #define ASPEED_SOC_VIC_BASE         0x1E6C0000
 #define ASPEED_SOC_SDMC_BASE        0x1E6E0000
 #define ASPEED_SOC_SCU_BASE         0x1E6E2000
@@ -38,16 +39,23 @@ static const int timer_irqs[] =3D { 16, 17, 18, 35, 3=
6, 37, 38, 39, };
 #define AST2500_SDRAM_BASE       0x80000000
=20
 static const hwaddr aspeed_soc_ast2400_spi_bases[] =3D { ASPEED_SOC_SPI_=
BASE };
+static const char *aspeed_soc_ast2400_typenames[] =3D { "aspeed.smc.spi"=
 };
=20
-static const hwaddr aspeed_soc_ast2500_spi_bases[] =3D { ASPEED_SOC_SPI_=
BASE };
+static const hwaddr aspeed_soc_ast2500_spi_bases[] =3D { ASPEED_SOC_SPI_=
BASE,
+                                                       ASPEED_SOC_SPI2_B=
ASE};
+static const char *aspeed_soc_ast2500_typenames[] =3D {
+    "aspeed.smc.ast2500-spi1", "aspeed.smc.ast2500-spi2" };
=20
 static const AspeedSoCInfo aspeed_socs[] =3D {
     { "ast2400-a0", "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
,
-      1, aspeed_soc_ast2400_spi_bases },
+      1, aspeed_soc_ast2400_spi_bases,
+      "aspeed.smc.fmc", aspeed_soc_ast2400_typenames },
     { "ast2400",    "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
,
-      1, aspeed_soc_ast2400_spi_bases },
+      1, aspeed_soc_ast2400_spi_bases,
+     "aspeed.smc.fmc", aspeed_soc_ast2400_typenames },
     { "ast2500-a1", "arm1176", AST2500_A1_SILICON_REV, AST2500_SDRAM_BAS=
E,
-      1, aspeed_soc_ast2500_spi_bases },
+      2, aspeed_soc_ast2500_spi_bases,
+      "aspeed.smc.ast2500-fmc", aspeed_soc_ast2500_typenames },
 };
=20
 /*
@@ -105,12 +113,13 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
                               "hw-strap2", &error_abort);
=20
-    object_initialize(&s->fmc, sizeof(s->fmc), "aspeed.smc.fmc");
+    object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
     qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
=20
     for (i =3D 0; i < sc->info->spis_num; i++) {
-        object_initialize(&s->spi[i], sizeof(s->spi[i]), "aspeed.smc.spi=
");
+        object_initialize(&s->spi[i], sizeof(s->spi[i]),
+                          sc->info->spi_typename[i]);
         object_property_add_child(obj, "spi", OBJECT(&s->spi[i]), NULL);
         qdev_set_parent_bus(DEVICE(&s->spi[i]), sysbus_get_default());
     }
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 84c18299de11..21943f4e5dfa 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -130,6 +130,7 @@
 #define ASPEED_SOC_SMC_FLASH_BASE   0x10000000
 #define ASPEED_SOC_FMC_FLASH_BASE   0x20000000
 #define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
+#define ASPEED_SOC_SPI2_FLASH_BASE  0x38000000
=20
 /*
  * Default segments mapping addresses and size for each slave per
@@ -142,7 +143,7 @@ static const AspeedSegments aspeed_segments_legacy[] =
=3D {
 };
=20
 static const AspeedSegments aspeed_segments_fmc[] =3D {
-    { 0x20000000, 64 * 1024 * 1024 },
+    { 0x20000000, 64 * 1024 * 1024 }, /* start address is readonly */
     { 0x24000000, 32 * 1024 * 1024 },
     { 0x26000000, 32 * 1024 * 1024 },
     { 0x28000000, 32 * 1024 * 1024 },
@@ -153,6 +154,22 @@ static const AspeedSegments aspeed_segments_spi[] =3D=
 {
     { 0x30000000, 64 * 1024 * 1024 },
 };
=20
+static const AspeedSegments aspeed_segments_ast2500_fmc[] =3D {
+    { 0x20000000, 128 * 1024 * 1024 }, /* start address is readonly */
+    { 0x28000000,  32 * 1024 * 1024 },
+    { 0x2A000000,  32 * 1024 * 1024 },
+};
+
+static const AspeedSegments aspeed_segments_ast2500_spi1[] =3D {
+    { 0x30000000, 32 * 1024 * 1024 }, /* start address is readonly */
+    { 0x32000000, 96 * 1024 * 1024 }, /* end address is readonly */
+};
+
+static const AspeedSegments aspeed_segments_ast2500_spi2[] =3D {
+    { 0x38000000, 32 * 1024 * 1024 }, /* start address is readonly */
+    { 0x3A000000, 96 * 1024 * 1024 }, /* end address is readonly */
+};
+
 static const AspeedSMCController controllers[] =3D {
     { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
       CONF_ENABLE_W0, 5, aspeed_segments_legacy,
@@ -163,6 +180,15 @@ static const AspeedSMCController controllers[] =3D {
     { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
       SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi,
       ASPEED_SOC_SPI_FLASH_BASE, 0x10000000 },
+    { "aspeed.smc.ast2500-fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
+      CONF_ENABLE_W0, 3, aspeed_segments_ast2500_fmc,
+      ASPEED_SOC_FMC_FLASH_BASE, 0x10000000 },
+    { "aspeed.smc.ast2500-spi1", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
+      CONF_ENABLE_W0, 2, aspeed_segments_ast2500_spi1,
+      ASPEED_SOC_SPI_FLASH_BASE, 0x8000000 },
+    { "aspeed.smc.ast2500-spi2", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
+      CONF_ENABLE_W0, 2, aspeed_segments_ast2500_spi2,
+      ASPEED_SOC_SPI2_FLASH_BASE, 0x8000000 },
 };
=20
 static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index f26a9f043983..5406b498d7ef 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -48,6 +48,8 @@ typedef struct AspeedSoCInfo {
     hwaddr sdram_base;
     int spis_num;
     const hwaddr *spi_bases;
+    const char *fmc_typename;
+    const char **spi_typename;
 } AspeedSoCInfo;
=20
 typedef struct AspeedSoCClass {
--=20
2.7.4


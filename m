Received: by 10.25.150.194 with SMTP id y185csp2415539lfd;
        Tue, 29 Nov 2016 07:52:55 -0800 (PST)
X-Received: by 10.55.149.134 with SMTP id x128mr23121472qkd.263.1480434775059;
        Tue, 29 Nov 2016 07:52:55 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r11si27848709qte.235.2016.11.29.07.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:52:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkiD-0003mr-Lp
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:52:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbc-0006yj-4p
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:46:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbX-0004z8-DW
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:46:04 -0500
Received: from 14.mo1.mail-out.ovh.net ([178.32.97.215]:51711)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkbX-0004ya-7O
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:45:59 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id EB4711F90E
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 16:45:57 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 3D55A120094;
	Tue, 29 Nov 2016 16:45:50 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:46 +0100
Message-Id: <1480434248-27138-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11724277205754678033
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.97.215
Subject: [Qemu-devel] [PATCH for-2.9 08/30] aspeed: add a memory region for
 SRAM
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aLIw8aVSwMYY

The size of the SRAM depends on the SoC model, so use a per-soc
definition when creating the region.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed_soc.c         | 52 +++++++++++++++++++++++++++++++++++++--=
------
 include/hw/arm/aspeed_soc.h |  2 ++
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 82e27129a900..233a6b9bf59f 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -29,6 +29,7 @@
 #define ASPEED_SOC_VIC_BASE         0x1E6C0000
 #define ASPEED_SOC_SDMC_BASE        0x1E6E0000
 #define ASPEED_SOC_SCU_BASE         0x1E6E2000
+#define ASPEED_SOC_SRAM_BASE        0x1E720000
 #define ASPEED_SOC_TIMER_BASE       0x1E782000
 #define ASPEED_SOC_I2C_BASE         0x1E78A000
=20
@@ -47,15 +48,37 @@ static const char *aspeed_soc_ast2500_typenames[] =3D=
 {
     "aspeed.smc.ast2500-spi1", "aspeed.smc.ast2500-spi2" };
=20
 static const AspeedSoCInfo aspeed_socs[] =3D {
-    { "ast2400-a0", "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
,
-      1, aspeed_soc_ast2400_spi_bases,
-      "aspeed.smc.fmc", aspeed_soc_ast2400_typenames },
-    { "ast2400",    "arm926", AST2400_A0_SILICON_REV, AST2400_SDRAM_BASE=
,
-      1, aspeed_soc_ast2400_spi_bases,
-     "aspeed.smc.fmc", aspeed_soc_ast2400_typenames },
-    { "ast2500-a1", "arm1176", AST2500_A1_SILICON_REV, AST2500_SDRAM_BAS=
E,
-      2, aspeed_soc_ast2500_spi_bases,
-      "aspeed.smc.ast2500-fmc", aspeed_soc_ast2500_typenames },
+    {
+        .name         =3D "ast2400-a0",
+        .cpu_model    =3D "arm926",
+        .silicon_rev  =3D AST2400_A0_SILICON_REV,
+        .sdram_base   =3D AST2400_SDRAM_BASE,
+        .sram_size    =3D 0x8000,
+        .spis_num     =3D 1,
+        .spi_bases    =3D aspeed_soc_ast2400_spi_bases,
+        .fmc_typename =3D "aspeed.smc.fmc",
+        .spi_typename =3D aspeed_soc_ast2400_typenames,
+    }, {
+        .name         =3D "ast2400",
+        .cpu_model    =3D "arm926",
+        .silicon_rev  =3D AST2400_A0_SILICON_REV,
+        .sdram_base   =3D AST2400_SDRAM_BASE,
+        .sram_size    =3D 0x8000,
+        .spis_num     =3D 1,
+        .spi_bases    =3D aspeed_soc_ast2400_spi_bases,
+        .fmc_typename =3D "aspeed.smc.fmc",
+        .spi_typename =3D aspeed_soc_ast2400_typenames,
+    }, {
+        .name         =3D "ast2500-a1",
+        .cpu_model    =3D "arm1176",
+        .silicon_rev  =3D AST2500_A1_SILICON_REV,
+        .sdram_base   =3D AST2500_SDRAM_BASE,
+        .sram_size    =3D 0x9000,
+        .spis_num     =3D 2,
+        .spi_bases    =3D aspeed_soc_ast2500_spi_bases,
+        .fmc_typename =3D "aspeed.smc.ast2500-fmc",
+        .spi_typename =3D aspeed_soc_ast2500_typenames,
+    },
 };
=20
 /*
@@ -157,6 +180,17 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
         return;
     }
=20
+    /* SRAM */
+    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
+                           sc->info->sram_size, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    vmstate_register_ram_global(&s->sram);
+    memory_region_add_subregion(get_system_memory(), ASPEED_SOC_SRAM_BAS=
E,
+                                &s->sram);
+
     /* VIC */
     object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
     if (err) {
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 6f1b679c97b1..1ab5deaa0813 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -29,6 +29,7 @@ typedef struct AspeedSoCState {
     /*< public >*/
     ARMCPU cpu;
     MemoryRegion iomem;
+    MemoryRegion sram;
     AspeedVICState vic;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
@@ -46,6 +47,7 @@ typedef struct AspeedSoCInfo {
     const char *cpu_model;
     uint32_t silicon_rev;
     hwaddr sdram_base;
+    uint64_t sram_size;
     int spis_num;
     const hwaddr *spi_bases;
     const char *fmc_typename;
--=20
2.7.4


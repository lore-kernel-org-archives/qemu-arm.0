Received: by 10.80.163.71 with SMTP id 65csp1916623edn;
        Tue, 27 Sep 2016 05:11:53 -0700 (PDT)
X-Received: by 10.200.48.74 with SMTP id g10mr27345346qte.123.1474978313633;
        Tue, 27 Sep 2016 05:11:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si1389226qte.45.2016.09.27.05.11.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Sep 2016 05:11:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50262 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1borEn-0000VU-1k
	for alex.bennee@linaro.org; Tue, 27 Sep 2016 08:11:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53967)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6i-00019z-NX
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6e-0002pG-M7
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:32 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:59724)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bor6e-0002ob-DL
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:28 -0400
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 8716BFFA280
	for <qemu-arm@nongnu.org>; Tue, 27 Sep 2016 14:03:27 +0200 (CEST)
Received: from hermes.kaod.org.com (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id 02980580089;
	Tue, 27 Sep 2016 14:03:20 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 27 Sep 2016 13:57:38 +0200
Message-Id: <1474977462-28032-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474977462-28032-1-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6921751153997417233
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrudehgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.44.197
Subject: [Qemu-arm] [PATCH 2/6] aspeed: move the flash module mapping
 address under the controller definition
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
X-TUID: BLYIC9Q0GV76

This will ease the definition of the new controllers for the AST2500
SoC and also ease the support of the segment registers, which provide
a way to reconfigure the mapping window of each slave.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c         |  9 ++++-----
 hw/ssi/aspeed_smc.c         | 15 +++++++++++----
 include/hw/ssi/aspeed_smc.h |  3 ++-
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 479c0d2039d9..80ad7322bde2 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -31,9 +31,6 @@
 #define ASPEED_SOC_TIMER_BASE       0x1E782000
 #define ASPEED_SOC_I2C_BASE         0x1E78A000
=20
-#define ASPEED_SOC_FMC_FLASH_BASE   0x20000000
-#define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
-
 static const int uart_irqs[] =3D { 9, 32, 33, 34, 10 };
 static const int timer_irqs[] =3D { 16, 17, 18, 35, 36, 37, 38, 39, };
=20
@@ -187,7 +184,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, ASPEED_SOC_FMC_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1, ASPEED_SOC_FMC_FLASH_BAS=
E);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1,
+                    s->fmc.ctrl->flash_window_base);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 19));
=20
@@ -200,7 +198,8 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
         return;
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 0, ASPEED_SOC_SPI_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, ASPEED_SOC_SPI_FLASH_BAS=
E);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1,
+                    s->spi.ctrl->flash_window_base);
=20
     /* SDMC - SDRAM Memory Controller */
     object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index d319e04a27f0..84c18299de11 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -127,6 +127,10 @@
 #define R_SPI_MISC_CTRL   (0x10 / 4)
 #define R_SPI_TIMINGS     (0x14 / 4)
=20
+#define ASPEED_SOC_SMC_FLASH_BASE   0x10000000
+#define ASPEED_SOC_FMC_FLASH_BASE   0x20000000
+#define ASPEED_SOC_SPI_FLASH_BASE   0x30000000
+
 /*
  * Default segments mapping addresses and size for each slave per
  * controller. These can be changed when board is initialized with the
@@ -151,11 +155,14 @@ static const AspeedSegments aspeed_segments_spi[] =3D=
 {
=20
 static const AspeedSMCController controllers[] =3D {
     { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5, aspeed_segments_legacy, 0x6000000 },
+      CONF_ENABLE_W0, 5, aspeed_segments_legacy,
+      ASPEED_SOC_SMC_FLASH_BASE, 0x6000000 },
     { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
-      CONF_ENABLE_W0, 5, aspeed_segments_fmc, 0x10000000 },
+      CONF_ENABLE_W0, 5, aspeed_segments_fmc,
+      ASPEED_SOC_FMC_FLASH_BASE, 0x10000000 },
     { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
-      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi, 0x10000000 },
+      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi,
+      ASPEED_SOC_SPI_FLASH_BASE, 0x10000000 },
 };
=20
 static uint64_t aspeed_smc_flash_default_read(void *opaque, hwaddr addr,
@@ -395,7 +402,7 @@ static void aspeed_smc_realize(DeviceState *dev, Erro=
r **errp)
=20
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
                           &aspeed_smc_flash_default_ops, s, name,
-                          s->ctrl->mapping_window_size);
+                          s->ctrl->flash_window_size);
     sysbus_init_mmio(sbd, &s->mmio_flash);
=20
     s->flashes =3D g_new0(AspeedSMCFlash, s->num_cs);
diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index def3b4507e75..bdfbcc0ffa7d 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -42,7 +42,8 @@ typedef struct AspeedSMCController {
     uint8_t conf_enable_w0;
     uint8_t max_slaves;
     const AspeedSegments *segments;
-    uint32_t mapping_window_size;
+    hwaddr flash_window_base;
+    uint32_t flash_window_size;
 } AspeedSMCController;
=20
 typedef struct AspeedSMCFlash {
--=20
2.7.4


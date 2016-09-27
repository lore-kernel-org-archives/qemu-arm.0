Received: by 10.80.163.71 with SMTP id 65csp1916800edn;
        Tue, 27 Sep 2016 05:12:14 -0700 (PDT)
X-Received: by 10.55.78.75 with SMTP id c72mr27006000qkb.168.1474978334224;
        Tue, 27 Sep 2016 05:12:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s29si1328470qki.333.2016.09.27.05.12.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Sep 2016 05:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1borF7-0000qz-Kd
	for alex.bennee@linaro.org; Tue, 27 Sep 2016 08:12:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6d-00014b-Bg
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bor6Y-0002mZ-8n
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:26 -0400
Received: from 10.mo178.mail-out.ovh.net ([46.105.76.150]:60318)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bor6X-0002mC-V6
	for qemu-arm@nongnu.org; Tue, 27 Sep 2016 08:03:22 -0400
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 1CCC2FFA295
	for <qemu-arm@nongnu.org>; Tue, 27 Sep 2016 14:03:20 +0200 (CEST)
Received: from hermes.kaod.org.com (deibp9eh1--blueice2n7.emea.ibm.com
	[195.212.29.169]) (Authenticated sender: clg@kaod.org)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id 7B02A58008C;
	Tue, 27 Sep 2016 14:03:14 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Tue, 27 Sep 2016 13:57:37 +0200
Message-Id: <1474977462-28032-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1474977462-28032-1-git-send-email-clg@kaod.org>
References: <1474977462-28032-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6919780829443820305
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelvddrudehgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.76.150
Subject: [Qemu-arm] [PATCH 1/6] aspeed: rename the smc object to fmc
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
X-TUID: WYMEODxAcouj

The Aspeed SoC has three different types of SMC (Static Memory
Controller) controllers: the SMC (legacy), the FMC (the new one) and
the SPI for the host PNOR. The FMC and the SPI models are now
converging on the AST2500 SoC and the SMC, which was still available
on the AST2400 SoC, was removed.

The Aspeed SoC does not provide support for the legacy SMC
controller. So, let's rename the 'smc' object to 'fmc' to clarify its
nature.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c             |  2 +-
 hw/arm/aspeed_soc.c         | 18 +++++++++---------
 include/hw/arm/aspeed_soc.h |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 6b18c7f1727c..4bb33cbb5e70 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -128,7 +128,7 @@ static void aspeed_board_init(MachineState *machine,
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
                                    &error_abort);
=20
-    aspeed_board_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
+    aspeed_board_init_flashes(&bmc->soc.fmc, "n25q256a", &error_abort);
     aspeed_board_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
=20
     aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c0a310205842..479c0d2039d9 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -100,9 +100,9 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
                               "hw-strap2", &error_abort);
=20
-    object_initialize(&s->smc, sizeof(s->smc), "aspeed.smc.fmc");
-    object_property_add_child(obj, "smc", OBJECT(&s->smc), NULL);
-    qdev_set_parent_bus(DEVICE(&s->smc), sysbus_get_default());
+    object_initialize(&s->fmc, sizeof(s->fmc), "aspeed.smc.fmc");
+    object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
=20
     object_initialize(&s->spi, sizeof(s->spi), "aspeed.smc.spi");
     object_property_add_child(obj, "spi", OBJECT(&s->spi), NULL);
@@ -178,17 +178,17 @@ static void aspeed_soc_realize(DeviceState *dev, Er=
ror **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
=20
-    /* SMC */
-    object_property_set_int(OBJECT(&s->smc), 1, "num-cs", &err);
-    object_property_set_bool(OBJECT(&s->smc), true, "realized", &local_e=
rr);
+    /* FMC */
+    object_property_set_int(OBJECT(&s->fmc), 1, "num-cs", &err);
+    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &local_e=
rr);
     error_propagate(&err, local_err);
     if (err) {
         error_propagate(errp, err);
         return;
     }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 0, ASPEED_SOC_FMC_BASE);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->smc), 1, ASPEED_SOC_FMC_FLASH_BAS=
E);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->smc), 0,
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 0, ASPEED_SOC_FMC_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->fmc), 1, ASPEED_SOC_FMC_FLASH_BAS=
E);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->fmc), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 19));
=20
     /* SPI */
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 932704c380f2..7359e25fce49 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -31,7 +31,7 @@ typedef struct AspeedSoCState {
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
     AspeedSCUState scu;
-    AspeedSMCState smc;
+    AspeedSMCState fmc;
     AspeedSMCState spi;
     AspeedSDMCState sdmc;
 } AspeedSoCState;
--=20
2.7.4


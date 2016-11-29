Received: by 10.25.150.194 with SMTP id y185csp2421199lfd;
        Tue, 29 Nov 2016 08:03:57 -0800 (PST)
X-Received: by 10.55.158.199 with SMTP id h190mr27370163qke.202.1480435437782;
        Tue, 29 Nov 2016 08:03:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a16si27828780qtb.121.2016.11.29.08.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:03:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBksu-0005EG-Hj
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:03:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkcE-0007VK-6O
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkc9-0005K6-As
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:42 -0500
Received: from 7.mo1.mail-out.ovh.net ([87.98.158.110]:41825)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkc9-0005Je-5S
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:46:37 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id D1D681F93D
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:46:35 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 4456A120094;
	Tue, 29 Nov 2016 16:46:28 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:51 +0100
Message-Id: <1480434248-27138-14-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11734973257941093137
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.158.110
Subject: [Qemu-arm] [PATCH for-2.9 13/30] aspeed/smc: set the number of
 flash modules for the FMC controller
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zl9X///Sx9a7

Add a new configuration field at the board level and propagate the
value using the "num-cs" property of the FMC controller model.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c     | 6 ++++++
 hw/arm/aspeed_soc.c | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bc70b387890c..40c13838fb2d 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -36,6 +36,7 @@ typedef struct AspeedBoardConfig {
     uint32_t hw_strap1;
     const char *fmc_model;
     const char *spi_model;
+    uint32_t num_cs;
 } AspeedBoardConfig;
=20
 enum {
@@ -85,18 +86,21 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .hw_strap1 =3D PALMETTO_BMC_HW_STRAP1,
         .fmc_model =3D "n25q256a",
         .spi_model =3D "mx25l25635e",
+        .num_cs    =3D 1,
     },
     [AST2500_EVB]  =3D {
         .soc_name  =3D "ast2500-a1",
         .hw_strap1 =3D AST2500_EVB_HW_STRAP1,
         .fmc_model =3D "n25q256a",
         .spi_model =3D "mx25l25635e",
+        .num_cs    =3D 1,
     },
     [ROMULUS_BMC]  =3D {
         .soc_name  =3D "ast2500-a1",
         .hw_strap1 =3D ROMULUS_BMC_HW_STRAP1,
         .fmc_model =3D "n25q256a",
         .spi_model =3D "mx66l1g45g",
+        .num_cs    =3D 2,
     },
 };
=20
@@ -143,6 +147,8 @@ static void aspeed_board_init(MachineState *machine,
                            &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap1, "hw-strap=
1",
                             &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
+                            &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index d111d2e1feca..b3e7f07b615d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -153,6 +153,8 @@ static void aspeed_soc_init(Object *obj)
     object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
     qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
+    object_property_add_alias(obj, "num-cs", OBJECT(&s->fmc), "num-cs",
+                              &error_abort);
=20
     for (i =3D 0; i < sc->info->spis_num; i++) {
         object_initialize(&s->spi[i], sizeof(s->spi[i]),
@@ -250,10 +252,8 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
=20
-    /* FMC */
-    object_property_set_int(OBJECT(&s->fmc), 1, "num-cs", &err);
-    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &local_e=
rr);
-    error_propagate(&err, local_err);
+    /* FMC, The number of CS is set at the board level */
+    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
         return;
--=20
2.7.4


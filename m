Received: by 10.25.21.156 with SMTP id 28csp838038lfv;
        Thu, 28 Jul 2016 07:32:45 -0700 (PDT)
X-Received: by 10.55.209.5 with SMTP id s5mr41804822qki.179.1469716365719;
        Thu, 28 Jul 2016 07:32:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p41si8148741qtp.140.2016.07.28.07.32.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:32:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmMf-00028m-3j
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:32:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmIz-0007ZO-0J
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmIt-0005r7-0Y
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:55 -0400
Received: from 8.mo7.mail-out.ovh.net ([46.105.77.114]:51189)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmIs-0005qn-MA
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:50 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id C90151000CEA
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 16:28:49 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 90D1B5C006E;
	Thu, 28 Jul 2016 16:28:44 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 16:28:12 +0200
Message-Id: <1469716099-8975-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469716099-8975-1-git-send-email-clg@kaod.org>
References: <1469716099-8975-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1630584542648765201
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.77.114
Subject: [Qemu-arm] [PATCH v2 2/9] palmetto-bmc: add a "silicon-rev"
 property at the soc level
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
X-TUID: 3bhL5K8o8uUB

The SCU controler holds the board revision number in its 0x7C
register. Let's use an alias to link a "silicon-rev" property of the
soc to the "silicon-rev" property of the SCU controler.

The SDMC controler "silicon-rev" property is derived from the SCU one
at realize time. I did not find a better way to handle this part.
Links and aliases being a one-to-one relation, I could not use one of
them. I might wrong though.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c  |  2 ++
 hw/arm/ast2400.c | 18 +++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 54e29a865d88..1ee13d578899 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -74,6 +74,8 @@ static void palmetto_bmc_init(MachineState *machine)
                                    &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
                             &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), AST2400_A0_SILICON_REV,
+                            "silicon-rev", &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
diff --git a/hw/arm/ast2400.c b/hw/arm/ast2400.c
index 136bf6464e1d..fa535065f765 100644
--- a/hw/arm/ast2400.c
+++ b/hw/arm/ast2400.c
@@ -84,8 +84,8 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->scu, sizeof(s->scu), TYPE_ASPEED_SCU);
     object_property_add_child(obj, "scu", OBJECT(&s->scu), NULL);
     qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
-    qdev_prop_set_uint32(DEVICE(&s->scu), "silicon-rev",
-                         AST2400_A0_SILICON_REV);
+    object_property_add_alias(obj, "silicon-rev", OBJECT(&s->scu),
+                              "silicon-rev", &error_abort);
     object_property_add_alias(obj, "hw-strap1", OBJECT(&s->scu),
                               "hw-strap1", &error_abort);
     object_property_add_alias(obj, "hw-strap2", OBJECT(&s->scu),
@@ -102,8 +102,6 @@ static void ast2400_init(Object *obj)
     object_initialize(&s->sdmc, sizeof(s->sdmc), TYPE_ASPEED_SDMC);
     object_property_add_child(obj, "sdmc", OBJECT(&s->sdmc), NULL);
     qdev_set_parent_bus(DEVICE(&s->sdmc), sysbus_get_default());
-    qdev_prop_set_uint32(DEVICE(&s->sdmc), "silicon-rev",
-                         AST2400_A0_SILICON_REV);
 }
=20
 static void ast2400_realize(DeviceState *dev, Error **errp)
@@ -111,6 +109,7 @@ static void ast2400_realize(DeviceState *dev, Error *=
*errp)
     int i;
     AST2400State *s =3D AST2400(dev);
     Error *err =3D NULL, *local_err =3D NULL;
+    uint32_t silicon_rev;
=20
     /* IO space */
     memory_region_init_io(&s->iomem, NULL, &ast2400_io_ops, NULL,
@@ -192,7 +191,16 @@ static void ast2400_realize(DeviceState *dev, Error =
**errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->spi), 1, AST2400_SPI_FLASH_BASE);
=20
     /* SDMC - SDRAM Memory Controller */
-    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
+    silicon_rev =3D (uint32_t)
+        object_property_get_int(OBJECT(&s->scu), "silicon-rev", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    object_property_set_int(OBJECT(&s->sdmc), silicon_rev, "silicon-rev"=
, &err);
+    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &local_=
err);
+    error_propagate(&err, local_err);
     if (err) {
         error_propagate(errp, err);
         return;
--=20
2.1.4


Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24318810lff;
        Mon, 6 Jan 2020 23:36:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqyO/A5vQqgrj54Gg5xvAVsxMIjJzAWj3ZBdRhCxF90CdpZp0fPMRap4Pt+OZgIOEwj2gBdK
X-Received: by 2002:ac8:7648:: with SMTP id i8mr77464517qtr.389.1578382606579;
        Mon, 06 Jan 2020 23:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578382606; cv=none;
        d=google.com; s=arc-20160816;
        b=XF/RfhzisrtpYl2LzIlLR5uXi/8QmiupgyDxx7YB1mdvZGCSGnr/D84m9xIqAxrxW9
         mkEcun+Jm6Vq6q0lou77WkF/fSOz3hHlFWqu+/ecK1t/Tu3rN/OYQO8fcEpuanoZJGOA
         pmlH4TQW/FtP/sg37LB7uzdMl3N+nUuhys29d5IpYlQbjL0uUxn7/Lq8I4PHyl+ROPxU
         3Z29v1D2brsi+Yt8YikXAyKbvruAd3UpToEFyOP6McI7cTiVgIPg/Ka2vjA3lbWINltZ
         vUUq3mBjLq5TvehfSNYi7r2zo/1PlLrsnwF8MkoMAroYLH2hT+y749qlvHkD6m7HBFcp
         MaNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=SQr9shXWOqUnlDKwaezagg5sCOFiFAwXkHImBUkGMJA=;
        b=lokrs4v2G3v4b7w5/AZuFOV91CnntJW5MdtMRnrZDH08Ncwa39FdoISW/tdicn8Wcd
         VjxPqdUgjnntUhlf46BzztjPbcC9UevZCas/aug+SGrrZ09H2XTJUNqsPlKoIr4ciPLP
         OcTfNFmdYelZR0sSjG9FVEB10UYg37uQ1SkjoMAqXXcTHXUy+v9foDzK/1+wHrD/pIp+
         tGzcDc8JHTK46GLNF2xB9dh0uHNYL/dvvg/d9v2mhv2zsZ98PsKQDnU6Ww5T20HpQ7DT
         F9aJKRkFBSUDmKnrc/169YZnKE0ACIW5tMGN2Xz4BFNaRy+CI9LTT8hHE+Ocs4u24X0U
         UuBg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si28426823qti.48.2020.01.06.23.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 23:36:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iojPt-0004W2-Ja
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 02:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iojO1-00023u-Bw
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 02:34:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iojNz-0006ig-HN
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 02:34:44 -0500
Received: from 10.mo69.mail-out.ovh.net ([46.105.73.241]:43456)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iojNz-0006hb-AW
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 02:34:43 -0500
Received: from player755.ha.ovh.net (unknown [10.108.1.121])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 57D287B105
 for <qemu-arm@nongnu.org>; Tue,  7 Jan 2020 08:34:41 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player755.ha.ovh.net (Postfix) with ESMTPSA id A925ADFE0C27;
 Tue,  7 Jan 2020 07:34:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/5] hw/sd: Configure number of slots exposed by the ASPEED
 SDHCI model
Date: Tue,  7 Jan 2020 08:34:19 +0100
Message-Id: <20200107073423.30043-2-clg@kaod.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200107073423.30043-1-clg@kaod.org>
References: <20200107073423.30043-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3787808764389329681
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehuddguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeehhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.73.241
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kBxLMW4q5yG0

From: Andrew Jeffery <andrew@aj.id.au>

The AST2600 includes a second cut-down version of the SD/MMC controller
found in the AST2500, named the eMMC controller. It's cut down in the
sense that it only supports one slot rather than two, but it brings the
total number of slots supported by the AST2600 to three.

The existing code assumed that the SD controller always provided two
slots. Rework the SDHCI object to expose the number of slots as a
property to be set by the SoC configuration.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/sd/aspeed_sdhci.h |  1 +
 hw/arm/aspeed.c              |  2 +-
 hw/arm/aspeed_ast2600.c      |  2 ++
 hw/arm/aspeed_soc.c          |  2 ++
 hw/sd/aspeed_sdhci.c         | 11 +++++++++--
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/hw/sd/aspeed_sdhci.h b/include/hw/sd/aspeed_sdhci.h
index dfdab4379021..dffbb46946b9 100644
--- a/include/hw/sd/aspeed_sdhci.h
+++ b/include/hw/sd/aspeed_sdhci.h
@@ -24,6 +24,7 @@ typedef struct AspeedSDHCIState {
     SysBusDevice parent;
=20
     SDHCIState slots[ASPEED_SDHCI_NUM_SLOTS];
+    uint8_t num_slots;
=20
     MemoryRegion iomem;
     qemu_irq irq;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index cc06af4fbb3e..4174e313cae5 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -263,7 +263,7 @@ static void aspeed_machine_init(MachineState *machine=
)
         amc->i2c_init(bmc);
     }
=20
-    for (i =3D 0; i < ARRAY_SIZE(bmc->soc.sdhci.slots); i++) {
+    for (i =3D 0; i < bmc->soc.sdhci.num_slots; i++) {
         SDHCIState *sdhci =3D &bmc->soc.sdhci.slots[i];
         DriveInfo *dinfo =3D drive_get_next(IF_SD);
         BlockBackend *blk;
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 89e4b0095041..fb73c4043ea3 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -199,6 +199,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
     sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdhci=
),
                           TYPE_ASPEED_SDHCI);
=20
+    object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_ab=
ort);
+
     /* Init sd card slot class here so that they're under the correct pa=
rent */
     for (i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
         sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]=
),
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a6237e594017..c15ceb683950 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -209,6 +209,8 @@ static void aspeed_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "sdc", OBJECT(&s->sdhci), sizeof(s->sdhci=
),
                           TYPE_ASPEED_SDHCI);
=20
+    object_property_set_int(OBJECT(&s->sdhci), 2, "num-slots", &error_ab=
ort);
+
     /* Init sd card slot class here so that they're under the correct pa=
rent */
     for (i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
         sysbus_init_child_obj(obj, "sdhci[*]", OBJECT(&s->sdhci.slots[i]=
),
diff --git a/hw/sd/aspeed_sdhci.c b/hw/sd/aspeed_sdhci.c
index cff3eb7dd21e..939d1510dedb 100644
--- a/hw/sd/aspeed_sdhci.c
+++ b/hw/sd/aspeed_sdhci.c
@@ -13,6 +13,7 @@
 #include "qapi/error.h"
 #include "hw/irq.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
=20
 #define ASPEED_SDHCI_INFO            0x00
 #define  ASPEED_SDHCI_INFO_RESET     0x00030000
@@ -120,14 +121,14 @@ static void aspeed_sdhci_realize(DeviceState *dev, =
Error **errp)
=20
     /* Create input irqs for the slots */
     qdev_init_gpio_in_named_with_opaque(DEVICE(sbd), aspeed_sdhci_set_ir=
q,
-                                        sdhci, NULL, ASPEED_SDHCI_NUM_SL=
OTS);
+                                        sdhci, NULL, sdhci->num_slots);
=20
     sysbus_init_irq(sbd, &sdhci->irq);
     memory_region_init_io(&sdhci->iomem, OBJECT(sdhci), &aspeed_sdhci_op=
s,
                           sdhci, TYPE_ASPEED_SDHCI, 0x1000);
     sysbus_init_mmio(sbd, &sdhci->iomem);
=20
-    for (int i =3D 0; i < ASPEED_SDHCI_NUM_SLOTS; ++i) {
+    for (int i =3D 0; i < sdhci->num_slots; ++i) {
         Object *sdhci_slot =3D OBJECT(&sdhci->slots[i]);
         SysBusDevice *sbd_slot =3D SYS_BUS_DEVICE(&sdhci->slots[i]);
=20
@@ -174,6 +175,11 @@ static const VMStateDescription vmstate_aspeed_sdhci=
 =3D {
     },
 };
=20
+static Property aspeed_sdhci_properties[] =3D {
+    DEFINE_PROP_UINT8("num-slots", AspeedSDHCIState, num_slots, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void aspeed_sdhci_class_init(ObjectClass *classp, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(classp);
@@ -181,6 +187,7 @@ static void aspeed_sdhci_class_init(ObjectClass *clas=
sp, void *data)
     dc->realize =3D aspeed_sdhci_realize;
     dc->reset =3D aspeed_sdhci_reset;
     dc->vmsd =3D &vmstate_aspeed_sdhci;
+    dc->props =3D aspeed_sdhci_properties;
 }
=20
 static TypeInfo aspeed_sdhci_info =3D {
--=20
2.21.1


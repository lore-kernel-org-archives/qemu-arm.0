Received: by 10.25.21.156 with SMTP id 28csp841671lfv;
        Thu, 28 Jul 2016 07:40:13 -0700 (PDT)
X-Received: by 10.55.97.80 with SMTP id v77mr45427692qkb.41.1469716813728;
        Thu, 28 Jul 2016 07:40:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d64si8171760qkc.301.2016.07.28.07.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmTt-0000zq-3l
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:40:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJY-0008Cf-Nr
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJT-00060y-5q
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:31 -0400
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216]:34658)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmJS-00060p-WE
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:27 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 7FB621010444
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 16:29:21 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 435855C0098;
	Thu, 28 Jul 2016 16:29:16 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 16:28:18 +0200
Message-Id: <1469716099-8975-9-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469716099-8975-1-git-send-email-clg@kaod.org>
References: <1469716099-8975-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1639591741863201553
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.72.216
Subject: [Qemu-arm] [PATCH v2 8/9] arm: add support for an ast2500
 evaluation board
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
X-TUID: gP5LNpSUi5jY

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v1:

 - changed AST2500_EDK to AST2500_EVB
 - fixed white space issues
 - added AST2500_HW_STRAP1=20

 hw/arm/aspeed.c          | 31 ++++++++++++++++++++++++++++++-
 include/hw/arm/ast2400.h |  5 +++++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index b5d34a3a0367..c8812cc358bb 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -37,12 +37,15 @@ typedef struct AspeedBoardConfig {
 } AspeedBoardConfig;
=20
 enum {
-    PALMETTO_BMC
+    PALMETTO_BMC,
+    AST2500_EVB
 };
=20
 static const AspeedBoardConfig aspeed_boards[] =3D {
     [PALMETTO_BMC] =3D { AST2400_HW_STRAP1, AST2400_A0_SILICON_REV,
                        AST2400_SDRAM_BASE },
+    [AST2500_EVB]  =3D { AST2500_HW_STRAP1, AST2500_A1_SILICON_REV,
+                       AST2500_SDRAM_BASE },
 };
=20
 static void aspeed_init_flashes(AspeedSMCState *s, const char *flashtype=
,
@@ -130,9 +133,35 @@ static const TypeInfo palmetto_bmc_type =3D {
     .class_init =3D palmetto_bmc_class_init,
 };
=20
+static void ast2500_evb_init(MachineState *machine)
+{
+    machine->cpu_model =3D "arm1176";
+    aspeed_init(machine, &aspeed_boards[AST2500_EVB]);
+}
+
+static void ast2500_evb_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+
+    mc->desc =3D "Aspeed AST2500 EVB (ARM1176)";
+    mc->init =3D ast2500_evb_init;
+    mc->max_cpus =3D 1;
+    mc->no_sdcard =3D 1;
+    mc->no_floppy =3D 1;
+    mc->no_cdrom =3D 1;
+    mc->no_parallel =3D 1;
+}
+
+static const TypeInfo ast2500_evb_type =3D {
+    .name =3D MACHINE_TYPE_NAME("ast2500-evb"),
+    .parent =3D TYPE_MACHINE,
+    .class_init =3D ast2500_evb_class_init,
+};
+
 static void aspeed_machine_init(void)
 {
     type_register_static(&palmetto_bmc_type);
+    type_register_static(&ast2500_evb_type);
 }
=20
 type_init(aspeed_machine_init)
diff --git a/include/hw/arm/ast2400.h b/include/hw/arm/ast2400.h
index e68807d475b7..2e6864f88790 100644
--- a/include/hw/arm/ast2400.h
+++ b/include/hw/arm/ast2400.h
@@ -41,4 +41,9 @@ typedef struct AST2400State {
=20
 #define AST2400_SDRAM_BASE       0x40000000
=20
+/*
+ * for Aspeed AST2500 SOC and higher
+ */
+#define AST2500_SDRAM_BASE       0x80000000
+
 #endif /* AST2400_H */
--=20
2.1.4


Received: by 10.25.21.156 with SMTP id 28csp353785lfv;
        Wed, 27 Jul 2016 10:01:31 -0700 (PDT)
X-Received: by 10.55.134.3 with SMTP id i3mr35819819qkd.74.1469638891492;
        Wed, 27 Jul 2016 10:01:31 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n83si4890058qkn.201.2016.07.27.10.01.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 10:01:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSSD5-0001of-0i
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 13:01:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzx-0007ak-Rq
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzu-00023r-1Z
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:56 -0400
Received: from 13.mo7.mail-out.ovh.net ([87.98.150.175]:40046)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSRzt-00023X-Re
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:53 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id DE246FF8E35
	for <qemu-devel@nongnu.org>; Wed, 27 Jul 2016 18:47:52 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 87D425C0088;
	Wed, 27 Jul 2016 18:47:47 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2016 18:46:58 +0200
Message-Id: <1469638018-17590-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469638018-17590-1-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16552980431490353937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieehgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.150.175
Subject: [Qemu-devel] [PATCH 6/6] arm: add support for an ast2500 evaluation
 board
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
X-TUID: 0forTmuQuYkH

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/palmetto-bmc.c    | 32 +++++++++++++++++++++++++++++++-
 include/hw/arm/ast2400.h |  5 +++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index cd8aa59756b9..8d8bfeb571e2 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -37,12 +37,15 @@ typedef struct AspeedBoardConfig {
 } AspeedBoardConfig;
=20
 enum {
-    PALMETTO_BMC
+    PALMETTO_BMC,
+    AST2500_EDK
 };
=20
 static const AspeedBoardConfig aspeed_boards[] =3D {
     [ PALMETTO_BMC ] =3D { 0x120CE416, AST2400_A0_SILICON_REV,
                          AST2400_SDRAM_BASE },
+    [ AST2500_EDK ]  =3D { 0x00000200, AST2500_A1_SILICON_REV,
+                         AST2500_SDRAM_BASE },
 };
=20
 static void aspeed_init_flashes(AspeedSMCState *s, const char *flashtype=
,
@@ -133,9 +136,36 @@ static const TypeInfo palmetto_bmc_type =3D {
     .class_init =3D palmetto_bmc_class_init,
 };
=20
+static void ast2500_edk_init(MachineState *machine)
+{
+    machine->cpu_model =3D "arm1176";
+    aspeed_init(machine, AST2500_EDK);
+}
+
+static void ast2500_edk_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+
+    mc->desc =3D "Aspeed AST2500 EDK (ARM1176)";
+    mc->init =3D ast2500_edk_init;
+    mc->max_cpus =3D 1;
+    mc->no_sdcard =3D 1;
+    mc->no_floppy =3D 1;
+    mc->no_cdrom =3D 1;
+    mc->no_sdcard =3D 1;
+    mc->no_parallel =3D 1;
+}
+
+static const TypeInfo ast2500_edk_type =3D {
+    .name =3D MACHINE_TYPE_NAME("ast2500-edk"),
+    .parent =3D TYPE_MACHINE,
+    .class_init =3D ast2500_edk_class_init,
+};
+
 static void aspeed_machine_init(void)
 {
     type_register_static(&palmetto_bmc_type);
+    type_register_static(&ast2500_edk_type);
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


Received: by 10.25.21.156 with SMTP id 28csp319403lfv;
        Tue, 2 Aug 2016 10:27:20 -0700 (PDT)
X-Received: by 10.129.152.88 with SMTP id p85mr32384113ywg.261.1470158837174;
        Tue, 02 Aug 2016 10:27:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e21si2115372qkj.20.2016.08.02.10.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 10:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUdTI-0007Lo-G9
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 13:27:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdJE-0006Z5-KG
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdJ9-0007IY-Iu
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:51 -0400
Received: from 4.mo179.mail-out.ovh.net ([46.105.36.149]:43865)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bUdJ9-0007ID-7i
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:47 -0400
Received: from player732.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 611001000C73
	for <qemu-devel@nongnu.org>; Tue,  2 Aug 2016 19:16:46 +0200 (CEST)
Received: from localhost.localdomain.com (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: clg@kaod.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id 43CE21000A0;
	Tue,  2 Aug 2016 19:16:41 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  2 Aug 2016 19:15:46 +0200
Message-Id: <1470158147-16378-10-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1470158147-16378-1-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15383733380997548817
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrjeekgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.36.149
Subject: [Qemu-devel] [PATCH v3 09/10] arm: add support for an ast2500
 evaluation board
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
X-TUID: FtJ3Pt85iH3A

The ast2500 eval board has a hardware strapping register value of
0xF100C2E6 which we use for a definition of AST2500_EVB_HW_STRAP1
below.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v2:

 - removed silicon-rev and cpu-model. This is now in the SoC.

 Changes since v1:

 - changed AST2500_EDK to AST2500_EVB
 - fixed white space issues
 - added AST2500_HW_STRAP1=20

 hw/arm/aspeed.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 80907b4244ea..e71500c64bd3 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -36,7 +36,8 @@ typedef struct AspeedBoardConfig {
 } AspeedBoardConfig;
=20
 enum {
-    PALMETTO_BMC
+    PALMETTO_BMC,
+    AST2500_EVB
 };
=20
 #define PALMETTO_BMC_HW_STRAP1 (                                        =
\
@@ -52,8 +53,19 @@ enum {
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
         SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
=20
+#define AST2500_EVB_HW_STRAP1 ((                                        =
\
+        AST2500_HW_STRAP1_DEFAULTS |                                    =
\
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        =
\
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               =
\
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              =
\
+        SCU_HW_STRAP_MAC1_RGMII |                                       =
\
+        SCU_HW_STRAP_MAC0_RGMII) &                                      =
\
+        ~SCU_HW_STRAP_2ND_BOOT_WDT)
+
 static const AspeedBoardConfig aspeed_boards[] =3D {
     [PALMETTO_BMC] =3D { "ast2400-a0", PALMETTO_BMC_HW_STRAP1 },
+    [AST2500_EVB]  =3D { "ast2500-a1", AST2500_EVB_HW_STRAP1 },
 };
=20
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
@@ -143,9 +155,34 @@ static const TypeInfo palmetto_bmc_type =3D {
     .class_init =3D palmetto_bmc_class_init,
 };
=20
+static void ast2500_evb_init(MachineState *machine)
+{
+    aspeed_board_init(machine, &aspeed_boards[AST2500_EVB]);
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
--=20
2.7.4


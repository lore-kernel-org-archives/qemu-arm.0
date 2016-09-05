Received: by 10.25.87.130 with SMTP id l124csp1793435lfb;
        Sun, 4 Sep 2016 23:09:43 -0700 (PDT)
X-Received: by 10.55.17.71 with SMTP id b68mr13915013qkh.141.1473055782965;
        Sun, 04 Sep 2016 23:09:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u65si16690668qkb.94.2016.09.04.23.09.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Sep 2016 23:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgn6E-000805-Bb
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 02:09:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmy1-0001cT-8Q
	for qemu-devel@nongnu.org; Mon, 05 Sep 2016 02:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxv-0001tx-Gl
	for qemu-devel@nongnu.org; Mon, 05 Sep 2016 02:01:12 -0400
Received: from 15.mo7.mail-out.ovh.net ([87.98.180.21]:40925)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bgmxv-0001ti-79
	for qemu-devel@nongnu.org; Mon, 05 Sep 2016 02:01:07 -0400
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id A35C91000250
	for <qemu-devel@nongnu.org>; Mon,  5 Sep 2016 08:01:06 +0200 (CEST)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id 5C3B0640072;
	Mon,  5 Sep 2016 08:01:02 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  5 Sep 2016 08:00:08 +0200
Message-Id: <1473055209-18864-10-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473055209-18864-1-git-send-email-clg@kaod.org>
References: <1473055209-18864-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 730146090556164881
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrheejgddutdejucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.180.21
Subject: [Qemu-devel] [PATCH v4 09/10] arm: add support for an ast2500
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fXXLUwIy+uBa

The ast2500 eval board has a hardware strapping register value of
0xF100C2E6 which we use for a definition of AST2500_EVB_HW_STRAP1
below.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 Changes since v3:

 - fixed trailing comma.

 hw/arm/aspeed.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c08213c04e3f..2af9fe934441 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -38,6 +38,7 @@ typedef struct AspeedBoardConfig {
=20
 enum {
     PALMETTO_BMC,
+    AST2500_EVB,
 };
=20
 #define PALMETTO_BMC_HW_STRAP1 (                                        =
\
@@ -53,8 +54,19 @@ enum {
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


Received: by 10.25.150.194 with SMTP id y185csp2415165lfd;
        Tue, 29 Nov 2016 07:52:07 -0800 (PST)
X-Received: by 10.55.86.70 with SMTP id k67mr27378292qkb.280.1480434727223;
        Tue, 29 Nov 2016 07:52:07 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 63si35157923qke.298.2016.11.29.07.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:52:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkhR-0002zh-R1
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:52:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbU-0006sC-0P
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:45:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbP-0004uV-Ux
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:45:56 -0500
Received: from 14.mo1.mail-out.ovh.net ([178.32.97.215]:47704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkbP-0004tg-Oi
	for qemu-devel@nongnu.org; Tue, 29 Nov 2016 10:45:51 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 3D8F41F810
	for <qemu-devel@nongnu.org>; Tue, 29 Nov 2016 16:45:50 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id A466512008F;
	Tue, 29 Nov 2016 16:45:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:45 +0100
Message-Id: <1480434248-27138-8-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11722306883252620049
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.97.215
Subject: [Qemu-devel] [PATCH for-2.9 07/30] aspeed: add support for the
 romulus-bmc board
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
X-TUID: 65nY6n8pq9E8

The Romulus machine is an OpenPOWER system with an AST2500 SoC for
the BMC and a POWER9 chip for the host. It does not make much
difference for qemu a part from the fact that the FMC controller has
two SPI flash module.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 159d562e8912..3509011ae979 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -41,8 +41,10 @@ typedef struct AspeedBoardConfig {
 enum {
     PALMETTO_BMC,
     AST2500_EVB,
+    ROMULUS_BMC,
 };
=20
+/* Palmetto hardware value: 0x120CE416 */
 #define PALMETTO_BMC_HW_STRAP1 (                                        =
\
         SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_256MB) |               =
\
         SCU_AST2400_HW_STRAP_DRAM_CONFIG(2 /* DDR3 with CL=3D6, CWL=3D5 =
*/) | \
@@ -56,6 +58,7 @@ enum {
         SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       =
\
         SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
=20
+/* AST2500 evb hardware value: 0xF100C2E6 */
 #define AST2500_EVB_HW_STRAP1 ((                                        =
\
         AST2500_HW_STRAP1_DEFAULTS |                                    =
\
         SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     =
\
@@ -66,6 +69,16 @@ enum {
         SCU_HW_STRAP_MAC0_RGMII) &                                      =
\
         ~SCU_HW_STRAP_2ND_BOOT_WDT)
=20
+/* Romulus hardware value: 0xF10AD206 */
+#define ROMULUS_BMC_HW_STRAP1 (                                         =
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
+        SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              =
\
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
+
 static const AspeedBoardConfig aspeed_boards[] =3D {
     [PALMETTO_BMC] =3D {
         .soc_name  =3D "ast2400-a0",
@@ -79,6 +92,12 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .fmc_model =3D "n25q256a",
         .spi_model =3D "mx25l25635e",
     },
+    [ROMULUS_BMC]  =3D {
+        .soc_name  =3D "ast2500-a1",
+        .hw_strap1 =3D ROMULUS_BMC_HW_STRAP1,
+        .fmc_model =3D "n25q256a",
+        .spi_model =3D "mx66l1g45g",
+    },
 };
=20
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
@@ -200,10 +219,35 @@ static const TypeInfo ast2500_evb_type =3D {
     .class_init =3D ast2500_evb_class_init,
 };
=20
+static void romulus_bmc_init(MachineState *machine)
+{
+    aspeed_board_init(machine, &aspeed_boards[ROMULUS_BMC]);
+}
+
+static void romulus_bmc_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+
+    mc->desc =3D "OpenPOWER Romulus BMC (ARM1176)";
+    mc->init =3D romulus_bmc_init;
+    mc->max_cpus =3D 1;
+    mc->no_sdcard =3D 1;
+    mc->no_floppy =3D 1;
+    mc->no_cdrom =3D 1;
+    mc->no_parallel =3D 1;
+}
+
+static const TypeInfo romulus_bmc_type =3D {
+    .name =3D MACHINE_TYPE_NAME("romulus-bmc"),
+    .parent =3D TYPE_MACHINE,
+    .class_init =3D romulus_bmc_class_init,
+};
+
 static void aspeed_machine_init(void)
 {
     type_register_static(&palmetto_bmc_type);
     type_register_static(&ast2500_evb_type);
+    type_register_static(&romulus_bmc_type);
 }
=20
 type_init(aspeed_machine_init)
--=20
2.7.4


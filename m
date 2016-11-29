Received: by 10.25.150.194 with SMTP id y185csp2412221lfd;
        Tue, 29 Nov 2016 07:46:04 -0800 (PST)
X-Received: by 10.55.93.68 with SMTP id r65mr23282731qkb.84.1480434364321;
        Tue, 29 Nov 2016 07:46:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 21si35161561qkj.43.2016.11.29.07.46.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 07:46:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37690 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBkbb-0006qH-3n
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 10:46:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbM-0006lZ-8m
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkbI-0004qW-An
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:48 -0500
Received: from 8.mo1.mail-out.ovh.net ([178.33.110.239]:55229)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkbI-0004pL-4c
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:45:44 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 9492D1F775
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:45:42 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 1836B120079;
	Tue, 29 Nov 2016 16:45:35 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:43:44 +0100
Message-Id: <1480434248-27138-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11720055082852453137
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.110.239
Subject: [Qemu-arm] [PATCH for-2.9 06/30] aspeed: extend the board
 configuration with flash models
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
X-TUID: cqSvgS3CqDAo

Future machine will use different flash models for the FMC and the SPI
controllers.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c7206fda6d85..159d562e8912 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -34,6 +34,8 @@ typedef struct AspeedBoardState {
 typedef struct AspeedBoardConfig {
     const char *soc_name;
     uint32_t hw_strap1;
+    const char *fmc_model;
+    const char *spi_model;
 } AspeedBoardConfig;
=20
 enum {
@@ -65,8 +67,18 @@ enum {
         ~SCU_HW_STRAP_2ND_BOOT_WDT)
=20
 static const AspeedBoardConfig aspeed_boards[] =3D {
-    [PALMETTO_BMC] =3D { "ast2400-a0", PALMETTO_BMC_HW_STRAP1 },
-    [AST2500_EVB]  =3D { "ast2500-a1", AST2500_EVB_HW_STRAP1 },
+    [PALMETTO_BMC] =3D {
+        .soc_name  =3D "ast2400-a0",
+        .hw_strap1 =3D PALMETTO_BMC_HW_STRAP1,
+        .fmc_model =3D "n25q256a",
+        .spi_model =3D "mx25l25635e",
+    },
+    [AST2500_EVB]  =3D {
+        .soc_name  =3D "ast2500-a1",
+        .hw_strap1 =3D AST2500_EVB_HW_STRAP1,
+        .fmc_model =3D "n25q256a",
+        .spi_model =3D "mx25l25635e",
+    },
 };
=20
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
@@ -128,8 +140,8 @@ static void aspeed_board_init(MachineState *machine,
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
                                    &error_abort);
=20
-    aspeed_board_init_flashes(&bmc->soc.fmc, "n25q256a", &error_abort);
-    aspeed_board_init_flashes(&bmc->soc.spi[0], "mx25l25635e", &error_ab=
ort);
+    aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model, &error_abor=
t);
+    aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model, &error_a=
bort);
=20
     aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
     aspeed_board_binfo.initrd_filename =3D machine->initrd_filename;
--=20
2.7.4


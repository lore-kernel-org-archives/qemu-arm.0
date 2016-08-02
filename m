Received: by 10.25.21.156 with SMTP id 28csp316858lfv;
        Tue, 2 Aug 2016 10:21:04 -0700 (PDT)
X-Received: by 10.37.197.1 with SMTP id v1mr47233853ybe.46.1470158464591;
        Tue, 02 Aug 2016 10:21:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x128si2071767qkd.192.2016.08.02.10.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 10:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUdNI-0001ty-0I
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 13:21:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdJ0-0006Nd-FV
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 13:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIv-0007F2-EQ
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 13:16:37 -0400
Received: from mo179.mail-out.ovh.net ([178.32.228.179]:44498)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bUdIv-0007Ek-7m
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 13:16:33 -0400
Received: from player732.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 020C31000C65
	for <qemu-arm@nongnu.org>; Tue,  2 Aug 2016 19:16:31 +0200 (CEST)
Received: from localhost.localdomain.com (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: clg@kaod.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id D91D910009F;
	Tue,  2 Aug 2016 19:16:25 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  2 Aug 2016 19:15:43 +0200
Message-Id: <1470158147-16378-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1470158147-16378-1-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15379229777859742481
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrjeekgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.228.179
Subject: [Qemu-arm] [PATCH v3 06/10] palmetto-bmc: add board specific
 configuration
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
X-TUID: hCT5RGOBsTaA

aspeed_board_init() now uses a board identifier to customize some values
specific to the board.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v2:

 - removed silicon-rev and cpu-model. This is now in the SoC.

 Changes since v1:

 - changed aspeed_init() prototype to use a 'const AspeedBoardConfig *'
 - fixed white space issues

 hw/arm/aspeed.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ad0a062b5624..4226b8dcd95c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -30,6 +30,19 @@ typedef struct AspeedBoardState {
     MemoryRegion ram;
 } AspeedBoardState;
=20
+typedef struct AspeedBoardConfig {
+    const char *soc_name;
+    uint32_t hw_strap1;
+} AspeedBoardConfig;
+
+enum {
+    PALMETTO_BMC
+};
+
+static const AspeedBoardConfig aspeed_boards[] =3D {
+    [PALMETTO_BMC] =3D { "ast2400-a0", 0x120CE416 },
+};
+
 static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
                                       Error **errp)
 {
@@ -56,13 +69,14 @@ static void aspeed_board_init_flashes(AspeedSMCState =
*s, const char *flashtype,
     }
 }
=20
-static void aspeed_board_init(MachineState *machine)
+static void aspeed_board_init(MachineState *machine,
+                              const AspeedBoardConfig *cfg)
 {
     AspeedBoardState *bmc;
     AspeedSoCClass *sc;
=20
     bmc =3D g_new0(AspeedBoardState, 1);
-    object_initialize(&bmc->soc, (sizeof(bmc->soc)), "ast2400-a0");
+    object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
                               &error_abort);
=20
@@ -73,7 +87,7 @@ static void aspeed_board_init(MachineState *machine)
                                 &bmc->ram);
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
                                    &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
+    object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap1, "hw-strap=
1",
                             &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
@@ -93,7 +107,7 @@ static void aspeed_board_init(MachineState *machine)
=20
 static void palmetto_bmc_init(MachineState *machine)
 {
-    aspeed_board_init(machine);
+    aspeed_board_init(machine, &aspeed_boards[PALMETTO_BMC]);
 }
=20
 static void palmetto_bmc_class_init(ObjectClass *oc, void *data)
--=20
2.7.4


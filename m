Received: by 10.25.87.130 with SMTP id l124csp1793058lfb;
        Sun, 4 Sep 2016 23:08:21 -0700 (PDT)
X-Received: by 10.55.92.193 with SMTP id q184mr35276569qkb.139.1473055701268;
        Sun, 04 Sep 2016 23:08:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id u123si16647870qkh.321.2016.09.04.23.08.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Sep 2016 23:08:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52428 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgn4u-0007HA-Kz
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 02:08:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxn-0001Ov-6f
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:01:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxj-0001rq-3O
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:00:58 -0400
Received: from 13.mo7.mail-out.ovh.net ([87.98.150.175]:43244)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bgmxi-0001rd-QV
	for qemu-arm@nongnu.org; Mon, 05 Sep 2016 02:00:55 -0400
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id B07841000248
	for <qemu-arm@nongnu.org>; Mon,  5 Sep 2016 08:00:53 +0200 (CEST)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id 6C5AE640074;
	Mon,  5 Sep 2016 08:00:49 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  5 Sep 2016 08:00:05 +0200
Message-Id: <1473055209-18864-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473055209-18864-1-git-send-email-clg@kaod.org>
References: <1473055209-18864-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 726486915715730193
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrheejgddutdejucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.150.175
Subject: [Qemu-arm] [PATCH v4 06/10] palmetto-bmc: add board specific
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hcdn8KX3Jdbq

aspeed_board_init() now uses a board identifier to customize some values
specific to the board.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

 Changes since v3:

 - added trailing comma to enum

 Changes since v2:

 - removed silicon-rev and cpu-model. This is now in the SoC.

 Changes since v1:

 - changed aspeed_init() prototype to use a 'const AspeedBoardConfig *'
 - fixed white space issues

 hw/arm/aspeed.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 3b901eaa6fb6..b4eb8049af97 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -31,6 +31,19 @@ typedef struct AspeedBoardState {
     MemoryRegion ram;
 } AspeedBoardState;
=20
+typedef struct AspeedBoardConfig {
+    const char *soc_name;
+    uint32_t hw_strap1;
+} AspeedBoardConfig;
+
+enum {
+    PALMETTO_BMC,
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
@@ -57,13 +70,14 @@ static void aspeed_board_init_flashes(AspeedSMCState =
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
@@ -74,7 +88,7 @@ static void aspeed_board_init(MachineState *machine)
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


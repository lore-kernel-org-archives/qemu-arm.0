Received: by 10.80.163.71 with SMTP id 65csp198528edn;
        Fri, 9 Sep 2016 09:24:15 -0700 (PDT)
X-Received: by 10.55.10.143 with SMTP id 137mr4839334qkk.250.1473438255620;
        Fri, 09 Sep 2016 09:24:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g186si2526114qkc.121.2016.09.09.09.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58978 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOb9-0002v0-3G
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:24:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOaw-0002kA-2D
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOaq-0005ql-VD
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:00 -0400
Received: from 5.mo178.mail-out.ovh.net ([46.105.51.53]:54075)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biOaq-0005qR-LY
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:56 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id E7B7FFFC913
	for <qemu-arm@nongnu.org>; Fri,  9 Sep 2016 18:23:55 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 800B73C0065;
	Fri,  9 Sep 2016 18:23:50 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:49 +0200
Message-Id: <1473438177-26079-7-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16292616077516245777
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.51.53
Subject: [Qemu-arm] [PATCH v5 06/14] palmetto-bmc: add board specific
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
X-TUID: GKblGTUFxtLL

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


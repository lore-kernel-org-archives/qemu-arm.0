Received: by 10.25.21.156 with SMTP id 28csp317652lfv;
        Tue, 2 Aug 2016 10:23:07 -0700 (PDT)
X-Received: by 10.37.201.71 with SMTP id z68mr48996120ybf.168.1470158586955;
        Tue, 02 Aug 2016 10:23:06 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o142si2100111qke.46.2016.08.02.10.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 10:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUdPG-00037l-8Q
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 13:23:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIu-0006Hx-3o
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIp-0007DB-2l
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:32 -0400
Received: from 10.mo179.mail-out.ovh.net ([46.105.79.46]:54527)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bUdIo-0007Cn-Ns
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:27 -0400
Received: from player732.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id D45211000C88
	for <qemu-devel@nongnu.org>; Tue,  2 Aug 2016 19:16:25 +0200 (CEST)
Received: from localhost.localdomain.com (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: clg@kaod.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id BB15C1000A0;
	Tue,  2 Aug 2016 19:16:20 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  2 Aug 2016 19:15:42 +0200
Message-Id: <1470158147-16378-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1470158147-16378-1-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15377822403908766481
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrjeekgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.79.46
Subject: [Qemu-devel] [PATCH v3 05/10] palmetto-bmc: replace palmetto_bmc
 with aspeed
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
X-TUID: RUC0Z7tijInB

This is mostly a name replacement to prepare ground for other SoCs
specificities. It also adds a TypeInfo struct for the palmetto-bmc
board with a custom initialization for the same reason.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 56 +++++++++++++++++++++++++++++++++++++--------------=
-----
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 531c266d9449..ad0a062b5624 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -21,16 +21,16 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
=20
-static struct arm_boot_info palmetto_bmc_binfo =3D {
+static struct arm_boot_info aspeed_board_binfo =3D {
     .nb_cpus =3D 1,
 };
=20
-typedef struct PalmettoBMCState {
+typedef struct AspeedBoardState {
     AspeedSoCState soc;
     MemoryRegion ram;
-} PalmettoBMCState;
+} AspeedBoardState;
=20
-static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
+static void aspeed_board_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
                                       Error **errp)
 {
     int i ;
@@ -56,12 +56,12 @@ static void palmetto_bmc_init_flashes(AspeedSMCState =
*s, const char *flashtype,
     }
 }
=20
-static void palmetto_bmc_init(MachineState *machine)
+static void aspeed_board_init(MachineState *machine)
 {
-    PalmettoBMCState *bmc;
+    AspeedBoardState *bmc;
     AspeedSoCClass *sc;
=20
-    bmc =3D g_new0(PalmettoBMCState, 1);
+    bmc =3D g_new0(AspeedBoardState, 1);
     object_initialize(&bmc->soc, (sizeof(bmc->soc)), "ast2400-a0");
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
                               &error_abort);
@@ -78,22 +78,29 @@ static void palmetto_bmc_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
-    palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
-    palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
+    aspeed_board_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
+    aspeed_board_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
+
+    aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
+    aspeed_board_binfo.initrd_filename =3D machine->initrd_filename;
+    aspeed_board_binfo.kernel_cmdline =3D machine->kernel_cmdline;
+    aspeed_board_binfo.ram_size =3D ram_size;
+    aspeed_board_binfo.board_id =3D sc->info->silicon_rev;
+    aspeed_board_binfo.loader_start =3D sc->info->sdram_base;
=20
-    palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
-    palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
-    palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
-    palmetto_bmc_binfo.ram_size =3D ram_size;
-    palmetto_bmc_binfo.board_id =3D sc->info->silicon_rev;
-    palmetto_bmc_binfo.loader_start =3D sc->info->sdram_base;
+    arm_load_kernel(ARM_CPU(first_cpu), &aspeed_board_binfo);
+}
=20
-    arm_load_kernel(ARM_CPU(first_cpu), &palmetto_bmc_binfo);
+static void palmetto_bmc_init(MachineState *machine)
+{
+    aspeed_board_init(machine);
 }
=20
-static void palmetto_bmc_machine_init(MachineClass *mc)
+static void palmetto_bmc_class_init(ObjectClass *oc, void *data)
 {
-    mc->desc =3D "OpenPOWER Palmetto BMC";
+    MachineClass *mc =3D MACHINE_CLASS(oc);
+
+    mc->desc =3D "OpenPOWER Palmetto BMC (ARM926EJ-S)";
     mc->init =3D palmetto_bmc_init;
     mc->max_cpus =3D 1;
     mc->no_sdcard =3D 1;
@@ -103,4 +110,15 @@ static void palmetto_bmc_machine_init(MachineClass *=
mc)
     mc->no_parallel =3D 1;
 }
=20
-DEFINE_MACHINE("palmetto-bmc", palmetto_bmc_machine_init);
+static const TypeInfo palmetto_bmc_type =3D {
+    .name =3D MACHINE_TYPE_NAME("palmetto-bmc"),
+    .parent =3D TYPE_MACHINE,
+    .class_init =3D palmetto_bmc_class_init,
+};
+
+static void aspeed_machine_init(void)
+{
+    type_register_static(&palmetto_bmc_type);
+}
+
+type_init(aspeed_machine_init)
--=20
2.7.4


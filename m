Received: by 10.25.87.130 with SMTP id l124csp1792420lfb;
        Sun, 4 Sep 2016 23:06:19 -0700 (PDT)
X-Received: by 10.55.26.75 with SMTP id a72mr21854389qka.242.1473055579467;
        Sun, 04 Sep 2016 23:06:19 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id x34si2859260qtb.32.2016.09.04.23.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Sep 2016 23:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52413 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bgn2x-0005O9-03
	for alex.bennee@linaro.org; Mon, 05 Sep 2016 02:06:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxk-0001Mv-GC
	for qemu-devel@nongnu.org; Mon, 05 Sep 2016 02:00:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bgmxe-0001qu-IS
	for qemu-devel@nongnu.org; Mon, 05 Sep 2016 02:00:56 -0400
Received: from 18.mo7.mail-out.ovh.net ([188.165.56.163]:35370)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bgmxe-0001qd-8u
	for qemu-devel@nongnu.org; Mon, 05 Sep 2016 02:00:50 -0400
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 5E1F61000246
	for <qemu-devel@nongnu.org>; Mon,  5 Sep 2016 08:00:49 +0200 (CEST)
Received: from hermes.kaod.org (alter.tetaneutral.net [91.224.149.189])
	(Authenticated sender: clg@kaod.org)
	by player759.ha.ovh.net (Postfix) with ESMTPSA id 204BF640072;
	Mon,  5 Sep 2016 08:00:45 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon,  5 Sep 2016 08:00:04 +0200
Message-Id: <1473055209-18864-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473055209-18864-1-git-send-email-clg@kaod.org>
References: <1473055209-18864-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 725361015166110481
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrheejgddutdejucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 188.165.56.163
Subject: [Qemu-devel] [PATCH v4 05/10] palmetto-bmc: replace palmetto_bmc
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w2URR+gHwFjl

This is mostly a name replacement to prepare ground for other SoCs
specificities. It also adds a TypeInfo struct for the palmetto-bmc
board with a custom initialization for the same reason.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/aspeed.c | 54 ++++++++++++++++++++++++++++++++++++---------------=
---
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 43191210f3ee..3b901eaa6fb6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -21,17 +21,17 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
=20
-static struct arm_boot_info palmetto_bmc_binfo =3D {
+static struct arm_boot_info aspeed_board_binfo =3D {
     .board_id =3D -1, /* device-tree-only board */
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
@@ -57,12 +57,12 @@ static void palmetto_bmc_init_flashes(AspeedSMCState =
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
@@ -79,21 +79,28 @@ static void palmetto_bmc_init(MachineState *machine)
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
+    aspeed_board_binfo.loader_start =3D sc->info->sdram_base;
=20
-    palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
-    palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
-    palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
-    palmetto_bmc_binfo.ram_size =3D ram_size;
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


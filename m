Received: by 10.80.163.71 with SMTP id 65csp198517edn;
        Fri, 9 Sep 2016 09:24:13 -0700 (PDT)
X-Received: by 10.55.76.13 with SMTP id z13mr4856525qka.194.1473438246371;
        Fri, 09 Sep 2016 09:24:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m5si2536716qkd.87.2016.09.09.09.24.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 09:24:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biOaz-0002mF-MN
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 12:24:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOaq-0002fl-8A
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:24:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1biOal-0005pE-6e
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:56 -0400
Received: from 2.mo178.mail-out.ovh.net ([46.105.39.61]:60300)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1biOak-0005p5-TF
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 12:23:51 -0400
Received: from player714.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo178.mail-out.ovh.net (Postfix) with ESMTP id 73E6AFFC938
	for <qemu-arm@nongnu.org>; Fri,  9 Sep 2016 18:23:50 +0200 (CEST)
Received: from hermes.kaod.org.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 294263C0066;
	Fri,  9 Sep 2016 18:23:45 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  9 Sep 2016 18:22:48 +0200
Message-Id: <1473438177-26079-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473438177-26079-1-git-send-email-clg@kaod.org>
References: <1473438177-26079-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16291208705792183057
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeluddrieeggddutddvucdltddurdefledtrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.39.61
Subject: [Qemu-arm] [PATCH v5 05/14] palmetto-bmc: replace palmetto_bmc with
 aspeed
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
X-TUID: AZ5cCdMJybf4

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


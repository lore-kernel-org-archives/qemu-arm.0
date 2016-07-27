Received: by 10.25.21.156 with SMTP id 28csp349236lfv;
        Wed, 27 Jul 2016 09:50:55 -0700 (PDT)
X-Received: by 10.37.89.8 with SMTP id n8mr16036372ybb.164.1469638255821;
        Wed, 27 Jul 2016 09:50:55 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s90si4874330qtd.71.2016.07.27.09.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 09:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSS2p-0001jv-6U
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 12:50:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzc-0007Iu-Fl
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzZ-0001yM-Kz
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:36 -0400
Received: from 20.mo7.mail-out.ovh.net ([46.105.49.208]:46337)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSRzZ-0001y9-9N
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:33 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 5ACBDFFCFCB
	for <qemu-devel@nongnu.org>; Wed, 27 Jul 2016 18:47:31 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 0B9F95C0088;
	Wed, 27 Jul 2016 18:47:26 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2016 18:46:54 +0200
Message-Id: <1469638018-17590-3-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469638018-17590-1-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16547069456685107985
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieehgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.49.208
Subject: [Qemu-devel] [PATCH 2/6] palmetto-bmc: replace palmetto_bmc with
 aspeed
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
X-TUID: ZSXxKaOU31tG

This is mostly a name replacement to prepare ground for other socs
specificities. It also adds a specific TypeInfo struct for the
palmetto_bmc board with a custom initialization for the same reason.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Should we change the name of the file to aspeed.c ? I am not found of
 such renames as it is then difficult to track code changes.

 hw/arm/palmetto-bmc.c | 54 ++++++++++++++++++++++++++++++++++-----------=
------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 1ee13d578899..f80a15733864 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -21,19 +21,19 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
=20
-static struct arm_boot_info palmetto_bmc_binfo =3D {
+static struct arm_boot_info aspeed_binfo =3D {
     .loader_start =3D AST2400_SDRAM_BASE,
     .board_id =3D 0,
     .nb_cpus =3D 1,
 };
=20
-typedef struct PalmettoBMCState {
+typedef struct AspeedBoardState {
     AST2400State soc;
     MemoryRegion ram;
-} PalmettoBMCState;
+} AspeedBoardState;
=20
-static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
-                                      Error **errp)
+static void aspeed_init_flashes(AspeedSMCState *s, const char *flashtype=
,
+                                Error **errp)
 {
     int i ;
=20
@@ -58,11 +58,11 @@ static void palmetto_bmc_init_flashes(AspeedSMCState =
*s, const char *flashtype,
     }
 }
=20
-static void palmetto_bmc_init(MachineState *machine)
+static void aspeed_init(MachineState *machine)
 {
-    PalmettoBMCState *bmc;
+    AspeedBoardState *bmc;
=20
-    bmc =3D g_new0(PalmettoBMCState, 1);
+    bmc =3D g_new0(AspeedBoardState, 1);
     object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
     object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
                               &error_abort);
@@ -79,19 +79,26 @@ static void palmetto_bmc_init(MachineState *machine)
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
=20
-    palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
-    palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
+    aspeed_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
+    aspeed_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort);
+
+    aspeed_binfo.kernel_filename =3D machine->kernel_filename;
+    aspeed_binfo.initrd_filename =3D machine->initrd_filename;
+    aspeed_binfo.kernel_cmdline =3D machine->kernel_cmdline;
+    aspeed_binfo.ram_size =3D ram_size;
+    arm_load_kernel(ARM_CPU(first_cpu), &aspeed_binfo);
+}
=20
-    palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
-    palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
-    palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
-    palmetto_bmc_binfo.ram_size =3D ram_size;
-    arm_load_kernel(ARM_CPU(first_cpu), &palmetto_bmc_binfo);
+static void palmetto_bmc_init(MachineState *machine)
+{
+    aspeed_init(machine);
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
@@ -101,4 +108,15 @@ static void palmetto_bmc_machine_init(MachineClass *=
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
2.1.4


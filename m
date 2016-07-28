Received: by 10.25.21.156 with SMTP id 28csp836268lfv;
        Thu, 28 Jul 2016 07:29:19 -0700 (PDT)
X-Received: by 10.55.42.24 with SMTP id q24mr1153678qkh.161.1469716158494;
        Thu, 28 Jul 2016 07:29:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 88si8165580qtb.9.2016.07.28.07.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53609 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmJJ-0007rB-P9
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:29:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJ7-0007i2-Ef
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJ1-0005sg-Qk
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:04 -0400
Received: from 7.mo7.mail-out.ovh.net ([46.105.43.131]:36914)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmJ1-0005sV-Gb
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:59 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 17DC71000D75
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 16:28:55 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id CEBD85C0088;
	Thu, 28 Jul 2016 16:28:49 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 16:28:13 +0200
Message-Id: <1469716099-8975-4-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469716099-8975-1-git-send-email-clg@kaod.org>
References: <1469716099-8975-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1632273390916963089
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.43.131
Subject: [Qemu-arm] [PATCH v2 3/9] palmetto-bmc: replace palmetto_bmc with
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
X-TUID: luBXm9NyXLRC

This is mostly a name replacement to prepare ground for other socs
specificities. It also adds a specific TypeInfo struct for the
palmetto_bmc board with a custom initialization for the same reason.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 54 ++++++++++++++++++++++++++++++++++++---------------=
---
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 1ee13d578899..f80a15733864 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
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


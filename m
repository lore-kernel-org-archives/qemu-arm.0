Received: by 10.25.21.156 with SMTP id 28csp349381lfv;
        Wed, 27 Jul 2016 09:51:15 -0700 (PDT)
X-Received: by 10.13.209.129 with SMTP id t123mr26992246ywd.93.1469638275566;
        Wed, 27 Jul 2016 09:51:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o72si4871284qko.183.2016.07.27.09.51.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jul 2016 09:51:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSS39-000208-1T
	for alex.bennee@linaro.org; Wed, 27 Jul 2016 12:51:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzn-0007QC-OU
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSRzj-00021f-UI
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:46 -0400
Received: from 5.mo7.mail-out.ovh.net ([178.32.120.239]:57114)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSRzj-00021R-KR
	for qemu-devel@nongnu.org; Wed, 27 Jul 2016 12:47:43 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 7CFF6FFD010
	for <qemu-devel@nongnu.org>; Wed, 27 Jul 2016 18:47:42 +0200 (CEST)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id B71255C008A;
	Wed, 27 Jul 2016 18:47:36 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Jul 2016 18:46:56 +0200
Message-Id: <1469638018-17590-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469638018-17590-1-git-send-email-clg@kaod.org>
References: <1469638018-17590-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 16550165682376641297
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieehgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 178.32.120.239
Subject: [Qemu-devel] [PATCH 4/6] palmetto-bmc: add board specific
 configuration
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
X-TUID: eF7vZhtCJTUs

aspeed_init() now uses a board identifier to customize some values
specific to the board, ram base, board revision number, etc.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/palmetto-bmc.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index 8a3ff5568575..cd8aa59756b9 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -22,8 +22,6 @@
 #include "sysemu/blockdev.h"
=20
 static struct arm_boot_info aspeed_binfo =3D {
-    .loader_start =3D AST2400_SDRAM_BASE,
-    .board_id =3D 0,
     .nb_cpus =3D 1,
 };
=20
@@ -32,6 +30,21 @@ typedef struct AspeedBoardState {
     MemoryRegion ram;
 } AspeedBoardState;
=20
+typedef struct AspeedBoardConfig {
+    uint32_t hw_strap1;
+    uint32_t silicon_rev;
+    hwaddr sdram_base;
+} AspeedBoardConfig;
+
+enum {
+    PALMETTO_BMC
+};
+
+static const AspeedBoardConfig aspeed_boards[] =3D {
+    [ PALMETTO_BMC ] =3D { 0x120CE416, AST2400_A0_SILICON_REV,
+                         AST2400_SDRAM_BASE },
+};
+
 static void aspeed_init_flashes(AspeedSMCState *s, const char *flashtype=
,
                                 Error **errp)
 {
@@ -58,7 +71,7 @@ static void aspeed_init_flashes(AspeedSMCState *s, cons=
t char *flashtype,
     }
 }
=20
-static void aspeed_init(MachineState *machine)
+static void aspeed_init(MachineState *machine, int board_model)
 {
     AspeedBoardState *bmc;
=20
@@ -68,13 +81,16 @@ static void aspeed_init(MachineState *machine)
                               &error_abort);
=20
     memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
-    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
+    memory_region_add_subregion(get_system_memory(),
+                                aspeed_boards[board_model].sdram_base,
                                 &bmc->ram);
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
                                    &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
-                            &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), AST2400_A0_SILICON_REV,
+    object_property_set_int(OBJECT(&bmc->soc),
+                            aspeed_boards[board_model].hw_strap1,
+                            "hw-strap1", &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc),
+                            aspeed_boards[board_model].silicon_rev,
                             "silicon-rev", &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
@@ -86,13 +102,15 @@ static void aspeed_init(MachineState *machine)
     aspeed_binfo.initrd_filename =3D machine->initrd_filename;
     aspeed_binfo.kernel_cmdline =3D machine->kernel_cmdline;
     aspeed_binfo.ram_size =3D ram_size;
+    aspeed_binfo.loader_start =3D aspeed_boards[board_model].sdram_base,
+    aspeed_binfo.board_id =3D aspeed_boards[board_model].silicon_rev,
     arm_load_kernel(ARM_CPU(first_cpu), &aspeed_binfo);
 }
=20
 static void palmetto_bmc_init(MachineState *machine)
 {
     machine->cpu_model =3D "arm926";
-    aspeed_init(machine);
+    aspeed_init(machine, PALMETTO_BMC);
 }
=20
 static void palmetto_bmc_class_init(ObjectClass *oc, void *data)
--=20
2.1.4


Received: by 10.25.21.156 with SMTP id 28csp836262lfv;
        Thu, 28 Jul 2016 07:29:18 -0700 (PDT)
X-Received: by 10.13.235.143 with SMTP id u137mr29762373ywe.121.1469716157960;
        Thu, 28 Jul 2016 07:29:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si8142748qkc.162.2016.07.28.07.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmJJ-0007t2-BB
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:29:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38274)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJD-0007qK-06
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmJ8-0005vD-D0
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:10 -0400
Received: from 2.mo7.mail-out.ovh.net ([87.98.143.68]:39639)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmJ8-0005uk-3K
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:29:06 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 8A944101044C
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 16:29:05 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 59FCE5C006E;
	Thu, 28 Jul 2016 16:29:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 16:28:15 +0200
Message-Id: <1469716099-8975-6-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469716099-8975-1-git-send-email-clg@kaod.org>
References: <1469716099-8975-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1635088142606371601
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.143.68
Subject: [Qemu-arm] [PATCH v2 5/9] palmetto-bmc: add board specific
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
X-TUID: 18RGtDZEk5zH

aspeed_init() now uses a board identifier to customize some values
specific to the board, ram base, board revision number, etc.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes since v1:

 - changed aspeed_init() prototype to use a 'const AspeedBoardConfig *'
 - fixed white space issues
=20
 hw/arm/aspeed.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 8a3ff5568575..80be55ab293f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
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
+    [PALMETTO_BMC] =3D { 0x120CE416, AST2400_A0_SILICON_REV,
+                       AST2400_SDRAM_BASE },
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
+static void aspeed_init(MachineState *machine, const AspeedBoardConfig *=
cfg)
 {
     AspeedBoardState *bmc;
=20
@@ -68,13 +81,13 @@ static void aspeed_init(MachineState *machine)
                               &error_abort);
=20
     memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
-    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
+    memory_region_add_subregion(get_system_memory(), cfg->sdram_base,
                                 &bmc->ram);
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
                                    &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
-                            &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), AST2400_A0_SILICON_REV,
+    object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap1,
+                            "hw-strap1", &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), cfg->silicon_rev,
                             "silicon-rev", &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
@@ -86,13 +99,15 @@ static void aspeed_init(MachineState *machine)
     aspeed_binfo.initrd_filename =3D machine->initrd_filename;
     aspeed_binfo.kernel_cmdline =3D machine->kernel_cmdline;
     aspeed_binfo.ram_size =3D ram_size;
+    aspeed_binfo.loader_start =3D cfg->sdram_base,
+    aspeed_binfo.board_id =3D cfg->silicon_rev,
     arm_load_kernel(ARM_CPU(first_cpu), &aspeed_binfo);
 }
=20
 static void palmetto_bmc_init(MachineState *machine)
 {
     machine->cpu_model =3D "arm926";
-    aspeed_init(machine);
+    aspeed_init(machine, &aspeed_boards[PALMETTO_BMC]);
 }
=20
 static void palmetto_bmc_class_init(ObjectClass *oc, void *data)
--=20
2.1.4


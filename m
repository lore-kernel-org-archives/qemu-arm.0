Received: by 10.25.21.156 with SMTP id 28csp836082lfv;
        Thu, 28 Jul 2016 07:28:58 -0700 (PDT)
X-Received: by 10.55.148.67 with SMTP id w64mr42385906qkd.137.1469716138488;
        Thu, 28 Jul 2016 07:28:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p195si1204154qke.290.2016.07.28.07.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 07:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSmIz-0007XN-Ri
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 10:28:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmIs-0007M3-30
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bSmIn-0005nT-P6
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:50 -0400
Received: from 2.mo7.mail-out.ovh.net ([87.98.143.68]:50531)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bSmIn-0005n9-FJ
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 10:28:45 -0400
Received: from player796.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 89123100053E
	for <qemu-arm@nongnu.org>; Thu, 28 Jul 2016 16:28:44 +0200 (CEST)
Received: from hermes.ibm.com (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player796.ha.ovh.net (Postfix) with ESMTPSA id 3852D5C0092;
	Thu, 28 Jul 2016 16:28:39 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2016 16:28:11 +0200
Message-Id: <1469716099-8975-2-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1469716099-8975-1-git-send-email-clg@kaod.org>
References: <1469716099-8975-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1629177165619170065
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrieejgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 87.98.143.68
Subject: [Qemu-arm] [PATCH v2 1/9] palmetto-bmc: rename file to aspeed.c
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
X-TUID: BpqrRG6krHGN

We plan to add more Aspeed platform to this file. Let's rename it to a
more generic name. There are no changes in the code.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/Makefile.objs  |   2 +-
 hw/arm/aspeed.c       | 102 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
 hw/arm/palmetto-bmc.c | 102 --------------------------------------------=
------
 3 files changed, 103 insertions(+), 103 deletions(-)
 create mode 100644 hw/arm/aspeed.c
 delete mode 100644 hw/arm/palmetto-bmc.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 12764ef2b719..8cc700231b30 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -17,4 +17,4 @@ obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp.o xlnx-ep108=
.o
 obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
-obj-$(CONFIG_ASPEED_SOC) +=3D ast2400.o palmetto-bmc.o
+obj-$(CONFIG_ASPEED_SOC) +=3D ast2400.o aspeed.o
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
new file mode 100644
index 000000000000..54e29a865d88
--- /dev/null
+++ b/hw/arm/aspeed.c
@@ -0,0 +1,102 @@
+/*
+ * OpenPOWER Palmetto BMC
+ *
+ * Andrew Jeffery <andrew@aj.id.au>
+ *
+ * Copyright 2016 IBM Corp.
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "exec/address-spaces.h"
+#include "hw/arm/arm.h"
+#include "hw/arm/ast2400.h"
+#include "hw/boards.h"
+#include "qemu/log.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/blockdev.h"
+
+static struct arm_boot_info palmetto_bmc_binfo =3D {
+    .loader_start =3D AST2400_SDRAM_BASE,
+    .board_id =3D 0,
+    .nb_cpus =3D 1,
+};
+
+typedef struct PalmettoBMCState {
+    AST2400State soc;
+    MemoryRegion ram;
+} PalmettoBMCState;
+
+static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
+                                      Error **errp)
+{
+    int i ;
+
+    for (i =3D 0; i < s->num_cs; ++i) {
+        AspeedSMCFlash *fl =3D &s->flashes[i];
+        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
+        qemu_irq cs_line;
+
+        /*
+         * FIXME: check that we are not using a flash module exceeding
+         * the controller segment size
+         */
+        fl->flash =3D ssi_create_slave_no_init(s->spi, flashtype);
+        if (dinfo) {
+            qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinfo(=
dinfo),
+                                errp);
+        }
+        qdev_init_nofail(fl->flash);
+
+        cs_line =3D qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
+    }
+}
+
+static void palmetto_bmc_init(MachineState *machine)
+{
+    PalmettoBMCState *bmc;
+
+    bmc =3D g_new0(PalmettoBMCState, 1);
+    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
+                              &error_abort);
+
+    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
+    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
+                                &bmc->ram);
+    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
+                                   &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
+                            &error_abort);
+    object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
+                             &error_abort);
+
+    palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
+    palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
+
+    palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
+    palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
+    palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
+    palmetto_bmc_binfo.ram_size =3D ram_size;
+    arm_load_kernel(ARM_CPU(first_cpu), &palmetto_bmc_binfo);
+}
+
+static void palmetto_bmc_machine_init(MachineClass *mc)
+{
+    mc->desc =3D "OpenPOWER Palmetto BMC";
+    mc->init =3D palmetto_bmc_init;
+    mc->max_cpus =3D 1;
+    mc->no_sdcard =3D 1;
+    mc->no_floppy =3D 1;
+    mc->no_cdrom =3D 1;
+    mc->no_sdcard =3D 1;
+    mc->no_parallel =3D 1;
+}
+
+DEFINE_MACHINE("palmetto-bmc", palmetto_bmc_machine_init);
diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
deleted file mode 100644
index 54e29a865d88..000000000000
--- a/hw/arm/palmetto-bmc.c
+++ /dev/null
@@ -1,102 +0,0 @@
-/*
- * OpenPOWER Palmetto BMC
- *
- * Andrew Jeffery <andrew@aj.id.au>
- *
- * Copyright 2016 IBM Corp.
- *
- * This code is licensed under the GPL version 2 or later.  See
- * the COPYING file in the top-level directory.
- */
-
-#include "qemu/osdep.h"
-#include "qapi/error.h"
-#include "qemu-common.h"
-#include "cpu.h"
-#include "exec/address-spaces.h"
-#include "hw/arm/arm.h"
-#include "hw/arm/ast2400.h"
-#include "hw/boards.h"
-#include "qemu/log.h"
-#include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
-
-static struct arm_boot_info palmetto_bmc_binfo =3D {
-    .loader_start =3D AST2400_SDRAM_BASE,
-    .board_id =3D 0,
-    .nb_cpus =3D 1,
-};
-
-typedef struct PalmettoBMCState {
-    AST2400State soc;
-    MemoryRegion ram;
-} PalmettoBMCState;
-
-static void palmetto_bmc_init_flashes(AspeedSMCState *s, const char *fla=
shtype,
-                                      Error **errp)
-{
-    int i ;
-
-    for (i =3D 0; i < s->num_cs; ++i) {
-        AspeedSMCFlash *fl =3D &s->flashes[i];
-        DriveInfo *dinfo =3D drive_get_next(IF_MTD);
-        qemu_irq cs_line;
-
-        /*
-         * FIXME: check that we are not using a flash module exceeding
-         * the controller segment size
-         */
-        fl->flash =3D ssi_create_slave_no_init(s->spi, flashtype);
-        if (dinfo) {
-            qdev_prop_set_drive(fl->flash, "drive", blk_by_legacy_dinfo(=
dinfo),
-                                errp);
-        }
-        qdev_init_nofail(fl->flash);
-
-        cs_line =3D qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
-        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
-    }
-}
-
-static void palmetto_bmc_init(MachineState *machine)
-{
-    PalmettoBMCState *bmc;
-
-    bmc =3D g_new0(PalmettoBMCState, 1);
-    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
-                              &error_abort);
-
-    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
-    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
-                                &bmc->ram);
-    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
-                                   &error_abort);
-    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
-                            &error_abort);
-    object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
-                             &error_abort);
-
-    palmetto_bmc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
-    palmetto_bmc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort=
);
-
-    palmetto_bmc_binfo.kernel_filename =3D machine->kernel_filename;
-    palmetto_bmc_binfo.initrd_filename =3D machine->initrd_filename;
-    palmetto_bmc_binfo.kernel_cmdline =3D machine->kernel_cmdline;
-    palmetto_bmc_binfo.ram_size =3D ram_size;
-    arm_load_kernel(ARM_CPU(first_cpu), &palmetto_bmc_binfo);
-}
-
-static void palmetto_bmc_machine_init(MachineClass *mc)
-{
-    mc->desc =3D "OpenPOWER Palmetto BMC";
-    mc->init =3D palmetto_bmc_init;
-    mc->max_cpus =3D 1;
-    mc->no_sdcard =3D 1;
-    mc->no_floppy =3D 1;
-    mc->no_cdrom =3D 1;
-    mc->no_sdcard =3D 1;
-    mc->no_parallel =3D 1;
-}
-
-DEFINE_MACHINE("palmetto-bmc", palmetto_bmc_machine_init);
--=20
2.1.4


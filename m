Received: by 10.25.21.156 with SMTP id 28csp315846lfv;
        Tue, 2 Aug 2016 10:18:43 -0700 (PDT)
X-Received: by 10.237.45.34 with SMTP id h31mr103467415qtd.101.1470158323212;
        Tue, 02 Aug 2016 10:18:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z88si2090725qtc.23.2016.08.02.10.18.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 10:18:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57878 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUdL0-0007Zf-Gq
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 13:18:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIt-0006Gp-Fs
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bUdIo-0007Cs-F0
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:30 -0400
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:52015)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bUdIo-0007Cj-4r
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 13:16:26 -0400
Received: from player732.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id BA8501000C6C
	for <qemu-devel@nongnu.org>; Tue,  2 Aug 2016 19:16:20 +0200 (CEST)
Received: from localhost.localdomain.com (bad36-1-78-202-132-1.fbx.proxad.net
	[78.202.132.1]) (Authenticated sender: clg@kaod.org)
	by player732.ha.ovh.net (Postfix) with ESMTPSA id 9C50910009F;
	Tue,  2 Aug 2016 19:16:15 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  2 Aug 2016 19:15:41 +0200
Message-Id: <1470158147-16378-5-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1470158147-16378-1-git-send-email-clg@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15376415030643559185
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrjeekgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.75.26
Subject: [Qemu-devel] [PATCH v3 04/10] palmetto-bmc: rename the Aspeed board
 file to aspeed.c
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
X-TUID: Ii2xAur8EdGO

We plan to add more Aspeed boards to this file. There are no changes
in the code.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/Makefile.objs  |   2 +-
 hw/arm/aspeed.c       | 106 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
 hw/arm/palmetto-bmc.c | 106 --------------------------------------------=
------
 3 files changed, 107 insertions(+), 107 deletions(-)
 create mode 100644 hw/arm/aspeed.c
 delete mode 100644 hw/arm/palmetto-bmc.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 7901294630b1..4c5c4ee76c12 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -17,4 +17,4 @@ obj-$(CONFIG_XLNX_ZYNQMP) +=3D xlnx-zynqmp.o xlnx-ep108=
.o
 obj-$(CONFIG_FSL_IMX25) +=3D fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) +=3D fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o sabrelite.o
-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o palmetto-bmc.o
+obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
new file mode 100644
index 000000000000..531c266d9449
--- /dev/null
+++ b/hw/arm/aspeed.c
@@ -0,0 +1,106 @@
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
+#include "hw/arm/aspeed_soc.h"
+#include "hw/boards.h"
+#include "qemu/log.h"
+#include "sysemu/block-backend.h"
+#include "sysemu/blockdev.h"
+
+static struct arm_boot_info palmetto_bmc_binfo =3D {
+    .nb_cpus =3D 1,
+};
+
+typedef struct PalmettoBMCState {
+    AspeedSoCState soc;
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
+    AspeedSoCClass *sc;
+
+    bmc =3D g_new0(PalmettoBMCState, 1);
+    object_initialize(&bmc->soc, (sizeof(bmc->soc)), "ast2400-a0");
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
+                              &error_abort);
+
+    sc =3D ASPEED_SOC_GET_CLASS(&bmc->soc);
+
+    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
+    memory_region_add_subregion(get_system_memory(), sc->info->sdram_bas=
e,
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
+    palmetto_bmc_binfo.board_id =3D sc->info->silicon_rev;
+    palmetto_bmc_binfo.loader_start =3D sc->info->sdram_base;
+
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
index 531c266d9449..000000000000
--- a/hw/arm/palmetto-bmc.c
+++ /dev/null
@@ -1,106 +0,0 @@
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
-#include "hw/arm/aspeed_soc.h"
-#include "hw/boards.h"
-#include "qemu/log.h"
-#include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
-
-static struct arm_boot_info palmetto_bmc_binfo =3D {
-    .nb_cpus =3D 1,
-};
-
-typedef struct PalmettoBMCState {
-    AspeedSoCState soc;
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
-    AspeedSoCClass *sc;
-
-    bmc =3D g_new0(PalmettoBMCState, 1);
-    object_initialize(&bmc->soc, (sizeof(bmc->soc)), "ast2400-a0");
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
-                              &error_abort);
-
-    sc =3D ASPEED_SOC_GET_CLASS(&bmc->soc);
-
-    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
-    memory_region_add_subregion(get_system_memory(), sc->info->sdram_bas=
e,
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
-    palmetto_bmc_binfo.board_id =3D sc->info->silicon_rev;
-    palmetto_bmc_binfo.loader_start =3D sc->info->sdram_base;
-
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
2.7.4


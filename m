Received: by 10.25.208.211 with SMTP id h202csp925827lfg;
        Tue, 15 Mar 2016 19:45:46 -0700 (PDT)
X-Received: by 10.140.201.130 with SMTP id w124mr1948874qha.57.1458096346745;
        Tue, 15 Mar 2016 19:45:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v82si1241173qkv.63.2016.03.15.19.45.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 19:45:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:52731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag1T0-0007YV-BP
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 22:45:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1ag1St-0007Ul-LG
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 22:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1ag1Ss-0005uQ-8o
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 22:45:39 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:50101
	helo=homiemail-a20.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1ag1Sr-0005tw-Ul; Tue, 15 Mar 2016 22:45:38 -0400
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 638657EC063;
	Tue, 15 Mar 2016 19:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
	TcxHVOmtE3Yh+CMLWERTP/2DJSo=; b=sUji9PbYe7Q0Xx1zSvKlqKvQx0vDvSis
	4DPH/ECirg69nEFHg6/h0IW6G5Wb3RnuysEJnL55Z1/Ta2UsaVClgZkTqqj/aZoP
	dxf5+dclV68HiPOGxx7AkRva6PpoiHYcfyeOBI9hFFrDYREP8V5dnRyH6A/lDjav
	RqyMrHgsBpc=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id A1F4D7EC061; 
	Tue, 15 Mar 2016 19:45:35 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Mar 2016 13:15:17 +1030
Message-Id: <1458096317-25223-5-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458096317-25223-1-git-send-email-andrew@aj.id.au>
References: <1458096317-25223-1-git-send-email-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Dmitry Osipenko <digetx@gmail.com>, Jeremy Kerr <jk@ozlabs.org>
Subject: [Qemu-arm] [PATCH v5 4/4] hw/arm: Add palmetto-bmc machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DPjsU4kEOx8s

The new machine is a thin layer over the AST2400 ARM926-based SoC[1].
Between the minimal machine and the current SoC implementation there is
enough functionality to boot an aspeed_defconfig Linux kernel to
userspace. Nothing yet is specific to the Palmetto's BMC (other than
using an AST2400 SoC), but creating specific machine types is preferable
to a generic machine that doesn't match any particular hardware.

[1] http://www.aspeedtech.com/products.php?fPath=20&rId=376

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Since v4:
  * Rename to hw/arm/palmetto-bmc.c, update functions, structs and strings

Since v3:
  * Split the machine from the SoC implementation

Since v2:
  * Implement a SOC model to move code out from the machine definition
  * Rework the machine to better use QOM
  * Include qemu/osdep.h
  * Revert back to qemu_log_mask(LOG_UNIMP, ...) in IO handlers

 hw/arm/Makefile.objs  |  2 +-
 hw/arm/palmetto-bmc.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/palmetto-bmc.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index f333b7f..954c9fe 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -16,4 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
-obj-$(CONFIG_ASPEED_SOC) += ast2400.o
+obj-$(CONFIG_ASPEED_SOC) += ast2400.o palmetto-bmc.o
diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
new file mode 100644
index 0000000..55d7419
--- /dev/null
+++ b/hw/arm/palmetto-bmc.c
@@ -0,0 +1,65 @@
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
+#include "exec/address-spaces.h"
+#include "hw/arm/arm.h"
+#include "hw/arm/ast2400.h"
+#include "hw/boards.h"
+
+static struct arm_boot_info palmetto_bmc_binfo = {
+    .loader_start = AST2400_SDRAM_BASE,
+    .board_id = 0,
+    .nb_cpus = 1,
+};
+
+typedef struct PalmettoBMCState {
+    AST2400State soc;
+    MemoryRegion ram;
+} PalmettoBMCState;
+
+static void palmetto_bmc_init(MachineState *machine)
+{
+    PalmettoBMCState *bmc;
+
+    bmc = g_new0(PalmettoBMCState, 1);
+    object_initialize(&bmc->soc, (sizeof(bmc->soc)), TYPE_AST2400);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(&bmc->soc),
+                              &error_abort);
+
+    memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_size);
+    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
+                                &bmc->ram);
+    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
+                                   &error_abort);
+    object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
+                             &error_abort);
+
+    palmetto_bmc_binfo.kernel_filename = machine->kernel_filename;
+    palmetto_bmc_binfo.initrd_filename = machine->initrd_filename;
+    palmetto_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
+    palmetto_bmc_binfo.ram_size = ram_size;
+    arm_load_kernel(ARM_CPU(first_cpu), &palmetto_bmc_binfo);
+}
+
+static void palmetto_bmc_machine_init(MachineClass *mc)
+{
+    mc->desc = "OpenPOWER Palmetto BMC";
+    mc->init = palmetto_bmc_init;
+    mc->max_cpus = 1;
+    mc->no_sdcard = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_sdcard = 1;
+    mc->no_parallel = 1;
+}
+
+DEFINE_MACHINE("palmetto-bmc", palmetto_bmc_machine_init);
-- 
2.5.0


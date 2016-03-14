Received: by 10.25.208.211 with SMTP id h202csp2182821lfg;
        Sun, 13 Mar 2016 21:14:25 -0700 (PDT)
X-Received: by 10.55.197.76 with SMTP id p73mr27579933qki.75.1457928859971;
        Sun, 13 Mar 2016 21:14:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p62si19893877qhp.103.2016.03.13.21.14.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Mar 2016 21:14:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:38931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afJtb-0002I2-9J
	for alex.bennee@linaro.org; Mon, 14 Mar 2016 00:14:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afJtX-0002CW-0i
	for qemu-arm@nongnu.org; Mon, 14 Mar 2016 00:14:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afJtV-0000W3-Cp
	for qemu-arm@nongnu.org; Mon, 14 Mar 2016 00:14:14 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:35519
	helo=homiemail-a17.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1afJtV-0000Vu-3J; Mon, 14 Mar 2016 00:14:13 -0400
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id AC7612B206A;
	Sun, 13 Mar 2016 21:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=aj.id.au; bh=
	qix8eGimlGhlaADc4GHUIxVOjI8=; b=YsAA4iPTu0CgaYBv9Hh/f0PYBOS5un+B
	rObAGws5L5EvgTV/neiSHsY2+qiNnNkb2gE4bxqp7gtj7qCKY/qz3XnRSl4qhR6K
	/ZJIrVn3D4YH+41FA1oiZPRKJxqlNMeg6ykZx0h7GJ8n6oy7Ab+phtoLO6/l/IXx
	JDVWhJ7C5y8=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 0D7262B2065; 
	Sun, 13 Mar 2016 21:14:10 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2016 14:43:52 +1030
Message-Id: <1457928832-31026-5-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
References: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jeremy Kerr <jk@ozlabs.org>
Subject: [Qemu-arm] [PATCH v4 4/4] hw/arm: Add opbmc2400,
	an AST2400 OpenPOWER BMC machine
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
X-TUID: nyGPDQLNNDV4

The new machine, opbmc2400, is a thin layer over the AST2400
ARM926-based SoC[1]. Between the minimal machine and the current SoC
implementation there is enough functionality to boot an aspeed_defconfig
Linux kernel to userspace.

The machine name is a pragmatic choice, as there doesn't appear to be a
common, formal name for the hardware configuration that isn't generic
(e.g. 'BMC' or 'AST2400').

[1] http://www.aspeedtech.com/products.php?fPath=20&rId=376

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Since v3:

  * Split the machine from the SoC implementation

I've gone the route of inventing a machine name as it seemed there are very few
cases of appending _soc to the chip name or beginning a machine name with mach_
as an outlet for a lack of creativity. It seems only fair to leave the 'ast2400'
namespace to the SoC itself, as it's unlikely that the OpenPOWER BMC is the
SoC's only consumer. I feel that 'opbmc2400' is a reasonable choice; it's not
overly long, and appending the SoC's marketing number leaves the door open to
future OpenPOWER BMC machines with e.g. the AST2500 series SoC.

Since v2:
  * Implement a SOC model to move code out from the machine definition
  * Rework the machine to better use QOM
  * Include qemu/osdep.h
  * Revert back to qemu_log_mask(LOG_UNIMP, ...) in IO handlers

 hw/arm/Makefile.objs |  2 +-
 hw/arm/opbmc2400.c   | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/opbmc2400.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index f333b7f..7b80460 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -16,4 +16,4 @@ obj-$(CONFIG_STM32F205_SOC) += stm32f205_soc.o
 obj-$(CONFIG_XLNX_ZYNQMP) += xlnx-zynqmp.o xlnx-ep108.o
 obj-$(CONFIG_FSL_IMX25) += fsl-imx25.o imx25_pdk.o
 obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
-obj-$(CONFIG_ASPEED_SOC) += ast2400.o
+obj-$(CONFIG_ASPEED_SOC) += ast2400.o opbmc2400.o
diff --git a/hw/arm/opbmc2400.c b/hw/arm/opbmc2400.c
new file mode 100644
index 0000000..a428364
--- /dev/null
+++ b/hw/arm/opbmc2400.c
@@ -0,0 +1,66 @@
+/*
+ * OpenPOWER BMC with AST2400 SoC
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
+static struct arm_boot_info opbmc2400_binfo = {
+    .loader_start = AST2400_SDRAM_BASE,
+    .board_id = 0,
+    .nb_cpus = 1,
+};
+
+typedef struct OPBMC2400State {
+    AST2400State soc;
+    MemoryRegion ram;
+} OPBMC2400State;
+
+static void opbmc2400_init(MachineState *machine)
+{
+    OPBMC2400State *opbmc2400;
+
+    opbmc2400 = g_new0(OPBMC2400State, 1);
+    object_initialize(&opbmc2400->soc, (sizeof(opbmc2400->soc)), TYPE_AST2400);
+    object_property_add_child(OBJECT(machine), "soc", OBJECT(&opbmc2400->soc),
+                              &error_abort);
+
+    memory_region_allocate_system_memory(&opbmc2400->ram, NULL, "ram",
+                                         ram_size);
+    memory_region_add_subregion(get_system_memory(), AST2400_SDRAM_BASE,
+                                &opbmc2400->ram);
+    object_property_add_const_link(OBJECT(&opbmc2400->soc), "ram",
+                                   OBJECT(&opbmc2400->ram), &error_abort);
+    object_property_set_bool(OBJECT(&opbmc2400->soc), true, "realized",
+                             &error_abort);
+
+    opbmc2400_binfo.kernel_filename = machine->kernel_filename;
+    opbmc2400_binfo.initrd_filename = machine->initrd_filename;
+    opbmc2400_binfo.kernel_cmdline = machine->kernel_cmdline;
+    opbmc2400_binfo.ram_size = ram_size;
+    arm_load_kernel(ARM_CPU(first_cpu), &opbmc2400_binfo);
+}
+
+static void opbmc2400_machine_init(MachineClass *mc)
+{
+    mc->desc = "OpenPOWER AST2400 BMC (ARM926EJ-S)";
+    mc->init = opbmc2400_init;
+    mc->max_cpus = 1;
+    mc->no_sdcard = 1;
+    mc->no_floppy = 1;
+    mc->no_cdrom = 1;
+    mc->no_sdcard = 1;
+    mc->no_parallel = 1;
+}
+
+DEFINE_MACHINE("opbmc2400", opbmc2400_machine_init);
-- 
2.5.0


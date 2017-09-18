Received: by 10.223.172.38 with SMTP id v35csp4142575wrc;
        Mon, 18 Sep 2017 12:57:53 -0700 (PDT)
X-Received: by 10.200.55.234 with SMTP id e39mr49344303qtc.73.1505764673091;
        Mon, 18 Sep 2017 12:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764673; cv=none;
        d=google.com; s=arc-20160816;
        b=maQSIlFqpGYtRBMDr270gpASs8IVbik10GgflUiWnlqHClqQjpofAfj1LywXHZAYcA
         I+EmfdDP+d69FO4lsDfrB/JcIKkmQ79P7X2n/RZL7JhkT8e5rYnmNf9CMgp7FokNPrYp
         /afLKDeVcPyRE3s4KIer5yJ648w+bXlQK9tYXV6qLn6cHo2BUVrdBdCbUxjt28A/RIjg
         OagxacP9LmtGs09JutN0OyRPzGRFY580JM6TJ+jHF1AgRCMvWCsvbII2idGgMEwVVifk
         7MnncRW5IxuXTBz7lGHKELOcn1Q/VIGkKtIFX0E6uhVvMacJWrO/fM0BSbsSgMS0gJst
         cjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=N9QB2DN+EchfJsJbXlsKbcMgz3nhojo1joW5GYmvljw=;
        b=LquSXjargfxMzcDq2frueqXDolwRH7xkg0G0sEuUCOmJAQQd3mUnQCBcIGqu6efXJw
         jHBAQScsLx3UlxQFtRhKACG3RSN610B+LOFen47eDK9OFvQ/qpCFYZA+YazYLDZEwsv6
         QtRBGW6BdSWZXjQe0G0yCQlWn355kWDNWTXHBFnz4g94ZPSAW4aZ6tdB1jZSOCok2IYE
         sCKG7wMCV51HfOx76lAPrVWYwLuI39vETYHkMo0O6XM8V98EpW+q/CHNTs/M4b5iqPrp
         ZD8X0HtHdB43efSYqWWgJ9R/Ve2H4tbeWAl8IBddmzbKoWFhUrKMk3YaOUOXvT67XHE3
         RQdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pNN2Pz6e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8si7778837qkm.214.2017.09.18.12.57.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pNN2Pz6e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du2Aw-0003vS-OS
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:57:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du251-00072e-Q9
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du250-0006Pe-Nm
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:43 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:33830)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du250-0006Oo-GF; Mon, 18 Sep 2017 15:51:42 -0400
Received: by mail-pg0-x243.google.com with SMTP id u18so658895pgo.1;
	Mon, 18 Sep 2017 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N9QB2DN+EchfJsJbXlsKbcMgz3nhojo1joW5GYmvljw=;
	b=pNN2Pz6eBhFo5dnTKDBacvMdW9pyBeCD7lfFR499jdJZJBclOmYgVxWO/m+nZM88Ak
	2CO8nVqD+PXFil/SL3pMLazkNXqPrqJh8BqAgBNtabUqvkUT8UPn3eW+kKo1sNcXZ5fL
	CM6Vigw6V/sGJitEB+z95JyayWC7CaX0KhzNuhsASCbQhc4AguuSMViD8N2u6DDzbuTM
	JawI4cTREKvbviu+mTQvDHjY6XzUyWHZHsSVL9ktZ/xhnqchY4EerjOd97pqAkaSm308
	SZrZvlCksR6YxVmFvGwTD6u4Md+JCPH8smK4uDh7e80TC8g2kEDqFi421TlYXTdsr9Kc
	cP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N9QB2DN+EchfJsJbXlsKbcMgz3nhojo1joW5GYmvljw=;
	b=mu5nsCdNQj+j0xTQ6EYbmSOBaXhP4rq06coXyhld0lyJCpkAxjloGJ/JC7Aw/b4oyw
	y/vGZx8tDenIUQB6JXJ4X5C4dvI5gRa+J94INiJP+j4x5TdW6lV8HumIYrN0gW9h+jhe
	JbYBbkimvounhk8CkvGkmSzaynzCzfS0pNaJMI6wJd0XdxmRuO2eWO9zHz9Us4QeTswE
	GMYZYHiWKhvQ71v2iAobox2RFjcNGK0T79ItFGryXQrfl1lbH1AhmHPAkNs46iyPbDba
	4WEbLUgtXjadWA1ofLouk5ODt4Rx6pUE7nKGRxGdRLFawLxDfVgG71uDkKu3qnm9W9op
	4HKQ==
X-Gm-Message-State: AHPjjUjvLpKUK/klLKXAnS8NzQWfQ8pRx/ljifQJ58Y4CwnJ5Y7qQHiX
	5b6sgbPvq5ws5Vw5wsA=
X-Google-Smtp-Source: ADKCNb71/N8mEGUIss7vGWJiC8l7fsoA99/eCHBbM1Hiwyh8Fl38sH/DRGfxTBj+/kdrvcEw/h8ESg==
X-Received: by 10.101.86.79 with SMTP id m15mr32906450pgs.157.1505764301248;
	Mon, 18 Sep 2017 12:51:41 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:40 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:51:00 -0700
Message-Id: <20170918195100.17593-18-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH 17/17] Implement support for i.MX7 Sabre board
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0y+J/aSz1TsS

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/arm/Makefile.objs   |   2 +-
 hw/arm/mcimx7d-sabre.c | 100 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/mcimx7d-sabre.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 33f6051ae3..fc4a963de8 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -19,5 +19,5 @@ obj-$(CONFIG_FSL_IMX31) += fsl-imx31.o kzm.o
 obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
-obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o
+obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 
diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
new file mode 100644
index 0000000000..34e3933db8
--- /dev/null
+++ b/hw/arm/mcimx7d-sabre.c
@@ -0,0 +1,100 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * MCIMX7D_SABRE Board System emulation.
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This code is licensed under the GPL, version 2 or later.
+ * See the file `COPYING' in the top level directory.
+ *
+ * It (partially) emulates a mcimx7d_sabre board, with a Freescale
+ * i.MX7 SoC
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/arm/fsl-imx7.h"
+#include "hw/boards.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/device_tree.h"
+#include "qemu/error-report.h"
+#include "sysemu/qtest.h"
+#include "net/net.h"
+
+typedef struct {
+    FslIMX7State soc;
+    MemoryRegion ram;
+} MCIMX7Sabre;
+
+static void mcimx7d_add_psci_node(const struct arm_boot_info *boot_info, void *fdt)
+{
+    const char comp[] = "arm,psci-0.2\0arm,psci";
+
+    qemu_fdt_add_subnode(fdt, "/psci");
+    qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
+    qemu_fdt_setprop_string(fdt, "/psci", "method", "smc");
+}
+
+static void mcimx7d_sabre_init(MachineState *machine)
+{
+    static struct arm_boot_info boot_info;
+    MCIMX7Sabre *s = g_new0(MCIMX7Sabre, 1);
+    Object *soc;
+    int i;
+
+    if (machine->ram_size > FSL_IMX7_MMDC_SIZE) {
+        error_report("RAM size " RAM_ADDR_FMT " above max supported (%08x)",
+                     machine->ram_size, FSL_IMX7_MMDC_SIZE);
+        exit(1);
+    }
+
+    boot_info = (struct arm_boot_info) {
+        .loader_start = FSL_IMX7_MMDC_ADDR,
+        .board_id = -1,
+        .ram_size = machine->ram_size,
+        .kernel_filename = machine->kernel_filename,
+        .kernel_cmdline = machine->kernel_cmdline,
+        .initrd_filename = machine->initrd_filename,
+        .nb_cpus = smp_cpus,
+        .modify_dtb = mcimx7d_add_psci_node,
+    };
+
+    object_initialize(&s->soc, sizeof(s->soc), TYPE_FSL_IMX7);
+    soc = OBJECT(&s->soc);
+    object_property_add_child(OBJECT(machine), "soc", soc, &error_fatal);
+    object_property_set_bool(soc, true, "realized", &error_fatal);
+
+    memory_region_allocate_system_memory(&s->ram, NULL, "mcimx7d-sabre.ram",
+                                         machine->ram_size);
+    memory_region_add_subregion(get_system_memory(),
+                                FSL_IMX7_MMDC_ADDR, &s->ram);
+
+    for (i = 0; i < FSL_IMX7_NUM_USDHCS; i++) {
+        BusState *bus;
+        DeviceState *carddev;
+        DriveInfo *di;
+        BlockBackend *blk;
+
+        di = drive_get_next(IF_SD);
+        blk = di ? blk_by_legacy_dinfo(di) : NULL;
+        bus = qdev_get_child_bus(DEVICE(&s->soc.usdhc[i]), "sd-bus");
+        carddev = qdev_create(bus, TYPE_SD_CARD);
+        qdev_prop_set_drive(carddev, "drive", blk, &error_fatal);
+        object_property_set_bool(OBJECT(carddev), true, "realized", &error_fatal);
+    }
+
+    if (!qtest_enabled()) {
+        arm_load_kernel(&s->soc.cpu[0], &boot_info);
+    }
+}
+
+static void mcimx7d_sabre_machine_init(MachineClass *mc)
+{
+    mc->desc = "Freescale i.MX7 DUAL SABRE (Cortex A7)";
+    mc->init = mcimx7d_sabre_init;
+    mc->max_cpus = FSL_IMX7_NUM_CPUS;
+    mc->ignore_memory_transaction_failures = true;
+}
+DEFINE_MACHINE("mcimx7d-sabre", mcimx7d_sabre_machine_init)
-- 
2.13.5


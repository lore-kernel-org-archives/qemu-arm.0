Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4588939wrx;
        Tue, 16 Apr 2019 18:44:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw84G0IoNcOf2ZhFRwKWjqP3JYfaOp13TqlzTTDmHOYeV0+dtxKzvExrOhpcUFAK7oupygP
X-Received: by 2002:a05:600c:20d:: with SMTP id 13mr29967415wmi.60.1555465478563;
        Tue, 16 Apr 2019 18:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555465478; cv=none;
        d=google.com; s=arc-20160816;
        b=xJmB3GKSQDjFaGtL+J6bluKYfhdjl5p8L1kdr3QpiiMsVlMu4q81xt0GB58AXKoTjG
         t6wCLuHw/1aCCQ11Stner2K67zPjp0csPmiNtwk/8jgmL75vjfBtAfQ/x+pfALpNtSvm
         SmeJvFoDIrsp7ldncgyo9u/EtYu6ljB2/Xj5jldxyr7d9m5MyNwRcfAhAhsnYyhjSmPo
         Bv0BxrK5cBE6Ut8b56lY/cY5FH99iXoaoTdmaLusGIRwgFbtTpgXJK8Yj/JD85g9MajK
         zH9Gg6mpnu0vyCVhX82oSuvmj1zV3HNpYVWy177L5ZJPn02Ij1fDFUcpFP1xVNhaQsTY
         EmTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UgwGS11n6YeEumsrDuBRIQvnfL4M+nzQrdz5SXEI364=;
        b=FaTmSXEuZ80cOrGrk9g8gyNrsU2SFb924i8oZsNnuBpdTp9NiWKbWC4FLfuhgVcMCN
         DqfqbbXm6qFLy+h5H/7yAhuaiVv8qH2tB+FTBj0izlLcdEJcWlZ9fM8OoVXyWhAijtRt
         KtBsxCFBUb4hH9ZcP5qL4NCBeKw41Lz+4TcU6mTkMxRD3175x1/sk4GyhAIFMHw38763
         qcoTcMRM86xUWXQEWpnxb69Gyjdu10H0DPUzpmI91ts1GFLWJM97PoI9HtLKddyfQSz0
         gMiGcVbUYeyHcAdB/oZj9cqzc/jBCDMe1lh40lJTo1Kcda3Lm+/n2mRjVm/gfat0kpaL
         adMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si720278wmc.49.2019.04.16.18.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 18:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGZcr-0000QO-IJ
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 21:44:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZp-0006VB-4T
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:41:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZn-0006Lm-JO
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:41:29 -0400
Received: from mga01.intel.com ([192.55.52.88]:47710)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hGZZn-0006LW-7L; Tue, 16 Apr 2019 21:41:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Apr 2019 18:41:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; d="scan'208";a="338161189"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 16 Apr 2019 18:41:24 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 17 Apr 2019 09:40:37 +0800
Message-Id: <20190417014038.26018-6-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190417014038.26018-1-richardw.yang@linux.intel.com>
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-arm] [PATCH v3 5/6] hw/acpi: Consolidate build_mcfg to pci.c
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U8qiKaeZn7NK

Now we have two identical build_mcfg functions.

Consolidate them in acpi/pci.c.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v3:
  * adjust changelog based on Igor's suggestion
---
 default-configs/arm-softmmu.mak  |  1 +
 default-configs/i386-softmmu.mak |  1 +
 hw/acpi/Kconfig                  |  4 +++
 hw/acpi/Makefile.objs            |  1 +
 hw/acpi/pci.c                    | 46 ++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c         | 17 ------------
 hw/i386/acpi-build.c             | 18 +------------
 include/hw/acpi/pci.h            |  1 +
 8 files changed, 55 insertions(+), 34 deletions(-)
 create mode 100644 hw/acpi/pci.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 613d19a06d..8f2796e195 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -144,6 +144,7 @@ CONFIG_XIO3130=y
 CONFIG_IOH3420=y
 CONFIG_I82801B11=y
 CONFIG_ACPI=y
+CONFIG_ACPI_PCI=y
 CONFIG_ARM_VIRT=y
 CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
index ba3fb3ff50..cd5ea391e8 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -25,3 +25,4 @@
 CONFIG_ISAPC=y
 CONFIG_I440FX=y
 CONFIG_Q35=y
+CONFIG_ACPI_PCI=y
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index eca3beed75..7265843cc3 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -23,6 +23,10 @@ config ACPI_NVDIMM
     bool
     depends on ACPI
 
+config ACPI_PCI
+    bool
+    depends on ACPI
+
 config ACPI_VMGENID
     bool
     default y
diff --git a/hw/acpi/Makefile.objs b/hw/acpi/Makefile.objs
index ba93c5b64a..9bb2101e3b 100644
--- a/hw/acpi/Makefile.objs
+++ b/hw/acpi/Makefile.objs
@@ -11,6 +11,7 @@ common-obj-$(call lnot,$(CONFIG_ACPI_X86)) += acpi-stub.o
 common-obj-y += acpi_interface.o
 common-obj-y += bios-linker-loader.o
 common-obj-y += aml-build.o utils.o
+common-obj-$(CONFIG_ACPI_PCI) += pci.o
 common-obj-$(CONFIG_TPM) += tpm.o
 
 common-obj-$(CONFIG_IPMI) += ipmi.o
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
new file mode 100644
index 0000000000..fa0fa30bb9
--- /dev/null
+++ b/hw/acpi/pci.c
@@ -0,0 +1,46 @@
+/*
+ * Support for generating PCI related ACPI tables and passing them to Guests
+ *
+ * Copyright (C) 2006 Fabrice Bellard
+ * Copyright (C) 2008-2010  Kevin O'Connor <kevin@koconnor.net>
+ * Copyright (C) 2013-2019 Red Hat Inc
+ * Copyright (C) 2019 Intel Corporation
+ *
+ * Author: Wei Yang <richardw.yang@linux.intel.com>
+ * Author: Michael S. Tsirkin <mst@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/pci.h"
+#include "hw/pci/pcie_host.h"
+
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
+{
+    AcpiTableMcfg *mcfg;
+    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
+
+    mcfg = acpi_data_push(table_data, len);
+    mcfg->allocation[0].address = cpu_to_le64(info->base);
+
+    /* Only a single allocation so no need to play with segments */
+    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
+    mcfg->allocation[0].start_bus_number = 0;
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
+
+    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
+}
+
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ebddcde596..e3353de9e4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -546,23 +546,6 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
 
-static void
-build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
-{
-    AcpiTableMcfg *mcfg;
-    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
-
-    mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->base);
-
-    /* Only a single allocation so no need to play with segments */
-    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
-    mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
-
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
-}
-
 /* GTDT */
 static void
 build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c2de7f4b01..29980bb3f4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2393,22 +2393,6 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                  table_data->len - srat_start, 1, NULL, NULL);
 }
 
-static void
-build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
-{
-    AcpiTableMcfg *mcfg;
-    int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
-
-    mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->base);
-    /* Only a single allocation so no need to play with segments */
-    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
-    mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
-
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
-}
-
 /*
  * VT-d spec 8.1 DMA Remapping Reporting Structure
  * (version Oct. 2014 or later)
@@ -2678,7 +2662,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     }
     if (acpi_get_mcfg(&mcfg)) {
         acpi_add_table(table_offsets, tables_blob);
-        build_mcfg_q35(tables_blob, tables->linker, &mcfg);
+        build_mcfg(tables_blob, tables->linker, &mcfg);
     }
     if (x86_iommu_get_default()) {
         IommuType IOMMUType = x86_iommu_get_type();
diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index 124af7d32a..8bbd32cf45 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -30,4 +30,5 @@ typedef struct AcpiMcfgInfo {
     uint32_t size;
 } AcpiMcfgInfo;
 
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
 #endif
-- 
2.19.1


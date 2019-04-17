Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4587122wrx;
        Tue, 16 Apr 2019 18:41:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjMhaSBdq9aQbIQRg3t1UoUz7VMr2zfBIEJXx52zbITsDpGT8Lr7FE28OTf2aRiZdl6hEi
X-Received: by 2002:adf:f04e:: with SMTP id t14mr19111834wro.263.1555465306035;
        Tue, 16 Apr 2019 18:41:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555465306; cv=none;
        d=google.com; s=arc-20160816;
        b=Pue4qns3Pka6R4NXtkZQPTr1BBAQdxJp0WKLEaEUSyxYzqhhDeE4b8eRL52RBzUwGQ
         cWyRKXhIlNwES340DyWv9iD0oKF1qECb/SZ/BTNlQUG7n14YE6vpkn/wPObPRxmIRgXz
         esBfGfQPIWqnlOQDzmO8IYYcgGkInhrHIWe59yfZzTSCoA3j9CoPdoryWDhie7so86yx
         P1d0s7RxsdZeGrAMSERlEsyuZ0/d53kaaIL7yefz9fihFzTPq3eunGaTkVMU8ACKJqEV
         qQRWXzDutMDM3SpIj2EQh7rp+0/5+zlbwmXxIh5FgB3HFbk3HRjFUPq7CIVAcZPgFMSV
         YRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=8nLaRmMebCvr9qTjnwd4LjsEs6OFPG23eiYPvicni3k=;
        b=WAjMnHgZb2IwIjoFX9uMuVD32XnEmn4zVB2SQk8RmeLZeXzhwVigpJPmnoKAP0ZvmN
         J7t3mJcsF3+o+TcAyqfCABNIYnM5dWav4RVKUkGQSTOJF8w7d4EKFOk/NAK+xwxGSE+y
         6jjiLgXpvGDlFgj9OjAk/vy7zGzqY7p3vV1AcUQBd3x/3tY9/T4d2+CN4WSeYtd125kV
         wxGlO80Z85gkIY0VUiZ476e8FJbBEVBcWs0O2ZgiNBnw6OGVUFcU2KrVRkOE0Fo+YlQ3
         8n+uYooyxP8te3lqrZ1VnH+pc9W5KktvIUF/mz3+rMSVOpnqECjk7hBoKW5JJqLfV/hE
         IUPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w129si728061wmb.180.2019.04.16.18.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 18:41:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45239 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGZa5-0006UR-43
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 21:41:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZm-0006Se-Bk
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZZl-0006Km-10
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:41:26 -0400
Received: from mga01.intel.com ([192.55.52.88]:47707)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hGZZk-0006KG-NY; Tue, 16 Apr 2019 21:41:24 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Apr 2019 18:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; d="scan'208";a="338161183"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga006.fm.intel.com with ESMTP; 16 Apr 2019 18:41:21 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 17 Apr 2019 09:40:36 +0800
Message-Id: <20190417014038.26018-5-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190417014038.26018-1-richardw.yang@linux.intel.com>
References: <20190417014038.26018-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-arm] [PATCH v3 4/6] hw/arm/virt-acpi-build: pass AcpiMcfgInfo
 to build_mcfg()
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
X-TUID: 4aFWy+MKrkUp

To build MCFG, two information is necessary:

    * bus number
    * base address

Abstract these two information to AcpiMcfgInfo so that build_mcfg and
build_mcfg_q35 will have the same declaration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---
v3:
  * move AcpiMcfgInfo to pci.h
v2:
  * for arm platform, construct a AcpiMcfgInfo directly
---
 hw/arm/virt-acpi-build.c | 18 +++++++++++-------
 hw/i386/acpi-build.c     |  6 +-----
 include/hw/acpi/pci.h    | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 12 deletions(-)
 create mode 100644 include/hw/acpi/pci.h

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e09e7eff8d..ebddcde596 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -40,6 +40,7 @@
 #include "hw/hw.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
+#include "hw/acpi/pci.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "hw/arm/virt.h"
@@ -546,21 +547,18 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 static void
-build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
     AcpiTableMcfg *mcfg;
-    const MemMapEntry *memmap = vms->memmap;
-    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
     int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
 
     mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
+    mcfg->allocation[0].address = cpu_to_le64(info->base);
 
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number =
-        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
 
     build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
@@ -801,7 +799,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_gtdt(tables_blob, tables->linker, vms);
 
     acpi_add_table(table_offsets, tables_blob);
-    build_mcfg(tables_blob, tables->linker, vms);
+    {
+        AcpiMcfgInfo mcfg = {
+           .base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
+           .size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg);
+    }
 
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f0d27bffd6..c2de7f4b01 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -58,6 +58,7 @@
 
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
+#include "hw/acpi/pci.h"
 
 #include "qom/qom-qobject.h"
 #include "hw/i386/amd_iommu.h"
@@ -86,11 +87,6 @@
 /* Default IOAPIC ID */
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
-typedef struct AcpiMcfgInfo {
-    uint64_t base;
-    uint32_t size;
-} AcpiMcfgInfo;
-
 typedef struct AcpiPmInfo {
     bool s3_disabled;
     bool s4_disabled;
diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
new file mode 100644
index 0000000000..124af7d32a
--- /dev/null
+++ b/include/hw/acpi/pci.h
@@ -0,0 +1,33 @@
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
+#ifndef HW_ACPI_PCI_H
+#define HW_ACPI_PCI_H
+
+typedef struct AcpiMcfgInfo {
+    uint64_t base;
+    uint32_t size;
+} AcpiMcfgInfo;
+
+#endif
-- 
2.19.1


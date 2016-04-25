Received: by 10.25.208.194 with SMTP id h185csp768426lfg;
        Mon, 25 Apr 2016 01:08:48 -0700 (PDT)
X-Received: by 10.140.171.65 with SMTP id r62mr15766296qhr.45.1461571728388;
        Mon, 25 Apr 2016 01:08:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 78si10081808qhz.100.2016.04.25.01.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 01:08:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aubZW-0007mK-DO
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 04:08:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubYk-0006eg-A4
	for qemu-devel@nongnu.org; Mon, 25 Apr 2016 04:07:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubYf-00057L-U8
	for qemu-devel@nongnu.org; Mon, 25 Apr 2016 04:07:57 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:44077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aubYf-00056k-9w; Mon, 25 Apr 2016 04:07:53 -0400
Received: from 172.24.1.47 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFY28062; Mon, 25 Apr 2016 16:07:38 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 25 Apr 2016 16:07:30 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 25 Apr 2016 16:05:47 +0800
Message-ID: <1461571547-13132-6-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.571DD04A.00FF, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: e1f64c00b52e0fb4383ab1109e19554e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-devel] [PATCH v7 5/5] ACPI: Virt: Generate SRAT table
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
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org, david.daney@cavium.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yxoE5jwMO8k/

From: Shannon Zhao <shannon.zhao@linaro.org>

To support NUMA, it needs to generate SRAT ACPI table.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt-acpi-build.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f51fe39..59b3c8f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -43,6 +43,7 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
+#include "sysemu/numa.h"
 
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
@@ -414,6 +415,52 @@ build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 }
 
 static void
+build_srat(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+{
+    AcpiSystemResourceAffinityTable *srat;
+    AcpiSratProcessorGiccAffinity *core;
+    AcpiSratMemoryAffinity *numamem;
+    int i, j, srat_start;
+    uint64_t mem_base;
+    uint32_t *cpu_node = g_malloc0(guest_info->smp_cpus * sizeof(uint32_t));
+
+    for (i = 0; i < guest_info->smp_cpus; i++) {
+        for (j = 0; j < nb_numa_nodes; j++) {
+            if (test_bit(i, numa_info[j].node_cpu)) {
+                cpu_node[i] = j;
+                break;
+            }
+        }
+    }
+
+    srat_start = table_data->len;
+    srat = acpi_data_push(table_data, sizeof(*srat));
+    srat->reserved1 = cpu_to_le32(1);
+
+    for (i = 0; i < guest_info->smp_cpus; ++i) {
+        core = acpi_data_push(table_data, sizeof(*core));
+        core->type = ACPI_SRAT_PROCESSOR_GICC;
+        core->length = sizeof(*core);
+        core->proximity = cpu_to_le32(cpu_node[i]);
+        core->acpi_processor_uid = cpu_to_le32(i);
+        core->flags = cpu_to_le32(1);
+    }
+    g_free(cpu_node);
+
+    mem_base = guest_info->memmap[VIRT_MEM].base;
+    for (i = 0; i < nb_numa_nodes; ++i) {
+        numamem = acpi_data_push(table_data, sizeof(*numamem));
+        build_acpi_srat_memory(numamem, mem_base, numa_info[i].node_mem, i,
+                               MEM_AFFINITY_ENABLED);
+        mem_base += numa_info[i].node_mem;
+    }
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + srat_start), "SRAT",
+                 table_data->len - srat_start, 3, NULL, NULL);
+}
+
+static void
 build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 {
     AcpiTableMcfg *mcfg;
@@ -638,6 +685,11 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, guest_info);
 
+    if (nb_numa_nodes > 0) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_srat(tables_blob, tables->linker, guest_info);
+    }
+
     /* RSDT is pointed to by RSDP */
     rsdt = tables_blob->len;
     build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
-- 
2.0.4



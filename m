Received: by 10.25.159.19 with SMTP id i19csp332694lfe;
        Sat, 23 Jan 2016 03:38:42 -0800 (PST)
X-Received: by 10.140.236.68 with SMTP id h65mr10253393qhc.13.1453549122672;
        Sat, 23 Jan 2016 03:38:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si12669906qhc.40.2016.01.23.03.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jan 2016 03:38:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMwWg-0004ia-6a
	for alex.bennee@linaro.org; Sat, 23 Jan 2016 06:38:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwW9-0003kg-2e
	for qemu-devel@nongnu.org; Sat, 23 Jan 2016 06:38:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwW5-000540-Qk
	for qemu-devel@nongnu.org; Sat, 23 Jan 2016 06:38:09 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:19799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aMwW4-00053o-UG; Sat, 23 Jan 2016 06:38:05 -0500
Received: from 172.24.1.49 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DDP88409; Sat, 23 Jan 2016 19:37:11 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Jan 2016 19:37:02 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2016 19:36:46 +0800
Message-ID: <1453549006-16044-6-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
References: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.56A365E8.00B8, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 404c929f34376102021be6bfdc8f3a93
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: hangaohuai@huawei.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org, Igor Mammedov <imammedo@redhat.com>,
	ganapatrao.kulkarni@caviumnetworks.com, hanjun.guo@linaro.org
Subject: [Qemu-devel] [PATCH v4 5/5] hw/arm/virt-acpi-build: Generate SRAT
	table
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HtyOdgUn5pqB

From: Shannon Zhao <shannon.zhao@linaro.org>

To support NUMA, it needs to generate SRAT ACPI table.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
CC: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 87fbe7c..8438028 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -42,6 +42,7 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
+#include "sysemu/numa.h"
 
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
@@ -412,6 +413,58 @@ build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 }
 
 static void
+build_srat(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+{
+    AcpiSystemResourceAffinityTable *srat;
+    AcpiSratProcessorGiccAffinity *core;
+    AcpiSratMemoryAffinity *numamem;
+    int i, j, srat_start;
+    uint64_t mem_len, mem_base;
+    uint32_t *cpu_node = g_malloc0(guest_info->smp_cpus * sizeof *cpu_node);
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
+    srat = acpi_data_push(table_data, sizeof *srat);
+    srat->reserved1 = cpu_to_le32(1);
+
+    for (i = 0; i < guest_info->smp_cpus; ++i) {
+        core = acpi_data_push(table_data, sizeof *core);
+        core->type = ACPI_SRAT_PROCESSOR_GICC;
+        core->length = sizeof(*core);
+        core->proximity = cpu_node[i];
+        core->acpi_processor_uid = i;
+        core->flags = cpu_to_le32(1);
+    }
+    g_free(cpu_node);
+
+    mem_base = guest_info->memmap[VIRT_MEM].base;
+    for (i = 0; i < nb_numa_nodes; ++i) {
+        mem_len = numa_info[i].node_mem;
+        numamem = acpi_data_push(table_data, sizeof *numamem);
+        numamem->type = ACPI_SRAT_MEMORY;
+        numamem->length = sizeof(*numamem);
+        memset(numamem->proximity, 0, 4);
+        numamem->proximity[0] = i;
+        numamem->flags = cpu_to_le32(1);
+        numamem->base_addr = cpu_to_le64(mem_base);
+        numamem->range_length = cpu_to_le64(mem_len);
+        mem_base += mem_len;
+    }
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + srat_start), "SRAT",
+                 table_data->len - srat_start, 3, NULL);
+}
+
+static void
 build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 {
     AcpiTableMcfg *mcfg;
@@ -641,6 +694,11 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, guest_info);
 
+    if (nb_numa_nodes > 0) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_srat(tables_blob, tables->linker, guest_info);
+    }
+
     /* RSDT is pointed to by RSDP */
     rsdt = tables_blob->len;
     build_rsdt(tables_blob, tables->linker, table_offsets);
-- 
2.0.4



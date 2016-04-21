Received: by 10.25.208.194 with SMTP id h185csp2717381lfg;
        Wed, 20 Apr 2016 23:29:45 -0700 (PDT)
X-Received: by 10.55.71.66 with SMTP id u63mr17474943qka.67.1461220185281;
        Wed, 20 Apr 2016 23:29:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p75si644840qha.97.2016.04.20.23.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Apr 2016 23:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1at87U-00030p-JT
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 02:29:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at87R-0002uy-7w
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 02:29:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1at87P-0002vi-MS
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 02:29:41 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:55028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1at87K-0002uN-8Z; Thu, 21 Apr 2016 02:29:35 -0400
Received: from 172.24.1.50 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAI18024; Thu, 21 Apr 2016 14:26:12 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.235.1; Thu, 21 Apr 2016 14:24:19 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2016 14:23:54 +0800
Message-ID: <1461219834-10416-6-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461219834-10416-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090201.57187285.003A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 44d0f94f6dcc08c47d730c2f3889e124
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH v5 5/5] hw/arm/virt-acpi-build: Generate SRAT
 table
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
Cc: peter.huangpeng@huawei.com, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org, david.daney@cavium.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Z7y0KS1DcQ8

From: Shannon Zhao <shannon.zhao@linaro.org>

To support NUMA, it needs to generate SRAT ACPI table.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt-acpi-build.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f51fe39..a618210 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -43,6 +43,7 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
+#include "sysemu/numa.h"
 
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
@@ -414,6 +415,58 @@ build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
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
+                 table_data->len - srat_start, 3, NULL, NULL);
+}
+
+static void
 build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 {
     AcpiTableMcfg *mcfg;
@@ -638,6 +691,11 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
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



Received: by 10.25.208.194 with SMTP id h185csp768885lfg;
        Mon, 25 Apr 2016 01:09:55 -0700 (PDT)
X-Received: by 10.55.170.69 with SMTP id t66mr37988341qke.100.1461571795047;
        Mon, 25 Apr 2016 01:09:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c91si1433406qga.104.2016.04.25.01.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 01:09:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aubab-00029i-6x
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 04:09:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubaO-0001p2-Qh
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 04:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubaN-0005PY-M8
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 04:09:40 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:45701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aubaI-0005MU-7J; Mon, 25 Apr 2016 04:09:35 -0400
Received: from 172.24.1.47 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFY28066; Mon, 25 Apr 2016 16:07:39 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 25 Apr 2016 16:07:29 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 25 Apr 2016 16:05:46 +0800
Message-ID: <1461571547-13132-5-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.571DD04B.0179, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f83e2e17d855f32b4ad4bb0551940343
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-arm] [PATCH v7 4/5] ACPI: move acpi_build_srat_memory to
 common place
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
Cc: drjones@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
	david.daney@cavium.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1cP31UEkxZx

From: Shannon Zhao <shannon.zhao@linaro.org>

Move acpi_build_srat_memory to common place so that it could be reused
by ARM. Rename it to build_acpi_srat_memory.

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/acpi/aml-build.c         | 11 +++++++++++
 hw/i386/acpi-build.c        | 29 +++++------------------------
 include/hw/acpi/aml-build.h | 10 ++++++++++
 3 files changed, 26 insertions(+), 24 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index ab89ca6..f945524 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1563,3 +1563,14 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
     build_header(linker, table_data,
                  (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
 }
+
+void build_acpi_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
+                            uint64_t len, int node, MemoryAffinityFlags flags)
+{
+    numamem->type = ACPI_SRAT_MEMORY;
+    numamem->length = sizeof(*numamem);
+    numamem->proximity = cpu_to_le32(node);
+    numamem->flags = cpu_to_le32(flags);
+    numamem->base_addr = cpu_to_le64(base);
+    numamem->range_length = cpu_to_le64(len);
+}
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 3c031aa..f939191 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2427,25 +2427,6 @@ build_tpm2(GArray *table_data, GArray *linker)
                  (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
 }
 
-typedef enum {
-    MEM_AFFINITY_NOFLAGS      = 0,
-    MEM_AFFINITY_ENABLED      = (1 << 0),
-    MEM_AFFINITY_HOTPLUGGABLE = (1 << 1),
-    MEM_AFFINITY_NON_VOLATILE = (1 << 2),
-} MemoryAffinityFlags;
-
-static void
-acpi_build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
-                       uint64_t len, int node, MemoryAffinityFlags flags)
-{
-    numamem->type = ACPI_SRAT_MEMORY;
-    numamem->length = sizeof(*numamem);
-    numamem->proximity = cpu_to_le32(node);
-    numamem->flags = cpu_to_le32(flags);
-    numamem->base_addr = cpu_to_le64(base);
-    numamem->range_length = cpu_to_le64(len);
-}
-
 static void
 build_srat(GArray *table_data, GArray *linker, MachineState *machine)
 {
@@ -2491,7 +2472,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
     numa_start = table_data->len;
 
     numamem = acpi_data_push(table_data, sizeof *numamem);
-    acpi_build_srat_memory(numamem, 0, 640*1024, 0, MEM_AFFINITY_ENABLED);
+    build_acpi_srat_memory(numamem, 0, 640*1024, 0, MEM_AFFINITY_ENABLED);
     next_base = 1024 * 1024;
     for (i = 1; i < pcms->numa_nodes + 1; ++i) {
         mem_base = next_base;
@@ -2507,7 +2488,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
             mem_len -= next_base - pcms->below_4g_mem_size;
             if (mem_len > 0) {
                 numamem = acpi_data_push(table_data, sizeof *numamem);
-                acpi_build_srat_memory(numamem, mem_base, mem_len, i - 1,
+                build_acpi_srat_memory(numamem, mem_base, mem_len, i - 1,
                                        MEM_AFFINITY_ENABLED);
             }
             mem_base = 1ULL << 32;
@@ -2515,13 +2496,13 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
             next_base += (1ULL << 32) - pcms->below_4g_mem_size;
         }
         numamem = acpi_data_push(table_data, sizeof *numamem);
-        acpi_build_srat_memory(numamem, mem_base, mem_len, i - 1,
+        build_acpi_srat_memory(numamem, mem_base, mem_len, i - 1,
                                MEM_AFFINITY_ENABLED);
     }
     slots = (table_data->len - numa_start) / sizeof *numamem;
     for (; slots < pcms->numa_nodes + 2; slots++) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
-        acpi_build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
+        build_acpi_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
     }
 
     /*
@@ -2531,7 +2512,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
      */
     if (hotplugabble_address_space_size) {
         numamem = acpi_data_push(table_data, sizeof *numamem);
-        acpi_build_srat_memory(numamem, pcms->hotplug_memory.base,
+        build_acpi_srat_memory(numamem, pcms->hotplug_memory.base,
                                hotplugabble_address_space_size, 0,
                                MEM_AFFINITY_HOTPLUGGABLE |
                                MEM_AFFINITY_ENABLED);
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 2c994b3..a9e8a04 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -198,6 +198,13 @@ typedef enum {
     AML_PULL_NONE = 3,
 } AmlPinConfig;
 
+typedef enum {
+    MEM_AFFINITY_NOFLAGS      = 0,
+    MEM_AFFINITY_ENABLED      = (1 << 0),
+    MEM_AFFINITY_HOTPLUGGABLE = (1 << 1),
+    MEM_AFFINITY_NON_VOLATILE = (1 << 2),
+} MemoryAffinityFlags;
+
 typedef
 struct AcpiBuildTables {
     GArray *table_data;
@@ -372,4 +379,7 @@ int
 build_append_named_dword(GArray *array, const char *name_format, ...)
 GCC_FMT_ATTR(2, 3);
 
+void build_acpi_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
+                            uint64_t len, int node, MemoryAffinityFlags flags);
+
 #endif
-- 
2.0.4



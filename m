Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4498141wro;
        Mon, 29 Oct 2018 10:24:44 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ev+X2zSBXTLWVr14zzCBZcB8NElPgUrdUmQoowVWadTChbZLJqRqbr7af/qBsHYrPKEOA8
X-Received: by 2002:aed:24e6:: with SMTP id u35-v6mr13313347qtc.230.1540833884443;
        Mon, 29 Oct 2018 10:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540833884; cv=none;
        d=google.com; s=arc-20160816;
        b=geOEHC2/CaUcg5PYhoooz105VMasnbjE+H0b6U1Mq17tmmQTXF+P55itM63hZkopGc
         /IHPuyVGX/cGxYPXBtf6JQD6e++1R3v+VDu/xcWe+Qtiy0+XPSAH6NMJ4gV8qSn/NAvU
         4KqFu4ghLpUigEOtC+CIpptHDNCyach668zlUsh61kUNmNnRTZj9Mu3Z+Glnz24sUd9l
         G1TX9dcQ5MrQh4fRcegHVfEwDuEnFvkVnLxFZmzfSxYsyv66AeVqfbNQs3YNNNbP7zSy
         xESYStYjJIlI0TPik6Z2URwA4OlaWh0PS6vugzS9meu5KN4JuhpBNgOc6er/I831n8PM
         tf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=gHFDgIE8qOmf9EenVQIDdkjzKf97fDun1kqoZGDx0U0=;
        b=vbGJettLu8afDnDsxDx/5pWv/c0XZDcrn75d8ULB1yp1G8whSQQTHFss2tj6Go0TyH
         lk/MLekYkXe4Qj80RPAaDtvpJsJKOdHljvA8tiYfnYWjC1EtYf/bLhMGvPgXy0V9zsIG
         hqD3T5nJ3yVm17Rw9wKct3RJlKGa8U2htxCeMCm/SRL/x68kH2EBZqEM7RJdFPNvAukm
         /GyxNorGj/MjFYtjgqRfRXYwBrgc9O5vEDRa0Y7wTZTH66CVduvokJ7Msz1ru2V5103r
         mT5VCoSdUl5ZatiEGZ0pdFc94oylvzpjgvDdqlVcWewJ3StHRH/KT858r9IfZw+Y1+ND
         l5QA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7-v6si3452931qto.215.2018.10.29.10.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 10:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:47360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHBHP-0002ME-V0
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 13:24:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHAxF-0002GT-F3
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 13:03:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gHAxD-0004qy-NU
	for qemu-devel@nongnu.org; Mon, 29 Oct 2018 13:03:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:15356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gHAx6-0004gt-Kl; Mon, 29 Oct 2018 13:03:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Oct 2018 10:03:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,441,1534834800"; d="scan'208";a="276599025"
Received: from mjadwisz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.7.64])
	by fmsmga006.fm.intel.com with ESMTP; 29 Oct 2018 10:03:30 -0700
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Oct 2018 18:01:53 +0100
Message-Id: <20181029170159.3801-14-sameo@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20181029170159.3801-1-sameo@linux.intel.com>
References: <20181029170159.3801-1-sameo@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH v3 13/19] hw: acpi: Export the SRAT AML build
 API
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
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b2iOvSgDyfoJ

From: Yang Zhong <yang.zhong@intel.com>

The SRAT ACPI table is not x86 specific and will be needed for the
Hardware-reduced ACPI implementation. So we should export it through the
architecture independent hw/acpi folder.

Also, now that the generic build_srat() API is exported, we have to
rename the ARM static one in order to avoid build time conflicts.

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/acpi/aml-build.c         | 130 ++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    |   4 +-
 hw/i386/acpi-build.c        | 129 -----------------------------------
 include/hw/acpi/aml-build.h |   3 +
 4 files changed, 135 insertions(+), 131 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 2110e18799..c3f652a68f 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -22,6 +22,7 @@
 #include "qemu/osdep.h"
 #include <glib/gprintf.h>
 #include "hw/acpi/aml-build.h"
+#include "hw/mem/memory-device.h"
 #include "qemu/bswap.h"
 #include "qemu/bitops.h"
 #include "sysemu/numa.h"
@@ -2459,6 +2460,135 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
     numamem->range_length = cpu_to_le64(len);
 }
 
+#define HOLE_640K_START  (640 * KiB)
+#define HOLE_640K_END   (1 * MiB)
+
+void
+build_srat(GArray *table_data, BIOSLinker *linker,
+           MachineState *machine, AcpiConfiguration *conf)
+{
+    AcpiSystemResourceAffinityTable *srat;
+    AcpiSratMemoryAffinity *numamem;
+
+    int i;
+    int srat_start, numa_start, slots;
+    uint64_t mem_len, mem_base, next_base;
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
+    ram_addr_t hotplugabble_address_space_size =
+        object_property_get_int(OBJECT(machine), MEMORY_DEVICE_REGION_SIZE,
+                                NULL);
+
+    srat_start = table_data->len;
+
+    srat = acpi_data_push(table_data, sizeof *srat);
+    srat->reserved1 = cpu_to_le32(1);
+
+    for (i = 0; i < apic_ids->len; i++) {
+        int node_id = apic_ids->cpus[i].props.node_id;
+        uint32_t apic_id = apic_ids->cpus[i].arch_id;
+
+        if (apic_id < 255) {
+            AcpiSratProcessorAffinity *core;
+
+            core = acpi_data_push(table_data, sizeof *core);
+            core->type = ACPI_SRAT_PROCESSOR_APIC;
+            core->length = sizeof(*core);
+            core->local_apic_id = apic_id;
+            core->proximity_lo = node_id;
+            memset(core->proximity_hi, 0, 3);
+            core->local_sapic_eid = 0;
+            core->flags = cpu_to_le32(1);
+        } else {
+            AcpiSratProcessorX2ApicAffinity *core;
+
+            core = acpi_data_push(table_data, sizeof *core);
+            core->type = ACPI_SRAT_PROCESSOR_x2APIC;
+            core->length = sizeof(*core);
+            core->x2apic_id = cpu_to_le32(apic_id);
+            core->proximity_domain = cpu_to_le32(node_id);
+            core->flags = cpu_to_le32(1);
+        }
+    }
+
+
+    /* the memory map is a bit tricky, it contains at least one hole
+     * from 640k-1M and possibly another one from 3.5G-4G.
+     */
+    next_base = 0;
+    numa_start = table_data->len;
+
+    for (i = 1; i < conf->numa_nodes + 1; ++i) {
+        mem_base = next_base;
+        mem_len = conf->node_mem[i - 1];
+        next_base = mem_base + mem_len;
+
+        /* Cut out the 640K hole */
+        if (mem_base <= HOLE_640K_START &&
+            next_base > HOLE_640K_START) {
+            mem_len -= next_base - HOLE_640K_START;
+            if (mem_len > 0) {
+                numamem = acpi_data_push(table_data, sizeof *numamem);
+                build_srat_memory(numamem, mem_base, mem_len, i - 1,
+                                  MEM_AFFINITY_ENABLED);
+            }
+
+            /* Check for the rare case: 640K < RAM < 1M */
+            if (next_base <= HOLE_640K_END) {
+                next_base = HOLE_640K_END;
+                continue;
+            }
+            mem_base = HOLE_640K_END;
+            mem_len = next_base - HOLE_640K_END;
+        }
+
+        /* Cut out the ACPI_PCI hole */
+        if (mem_base <= conf->below_4g_mem_size &&
+            next_base > conf->below_4g_mem_size) {
+            mem_len -= next_base - conf->below_4g_mem_size;
+            if (mem_len > 0) {
+                numamem = acpi_data_push(table_data, sizeof *numamem);
+                build_srat_memory(numamem, mem_base, mem_len, i - 1,
+                                  MEM_AFFINITY_ENABLED);
+            }
+            mem_base = 1ULL << 32;
+            mem_len = next_base - conf->below_4g_mem_size;
+            next_base = mem_base + mem_len;
+        }
+
+        if (mem_len > 0) {
+            numamem = acpi_data_push(table_data, sizeof *numamem);
+            build_srat_memory(numamem, mem_base, mem_len, i - 1,
+                              MEM_AFFINITY_ENABLED);
+        }
+    }
+    slots = (table_data->len - numa_start) / sizeof *numamem;
+    for (; slots < conf->numa_nodes + 2; slots++) {
+        numamem = acpi_data_push(table_data, sizeof *numamem);
+        build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
+    }
+
+    /*
+     * Entry is required for Windows to enable memory hotplug in OS
+     * and for Linux to enable SWIOTLB when booted with less than
+     * 4G of RAM. Windows works better if the entry sets proximity
+     * to the highest NUMA node in the machine.
+     * Memory devices may override proximity set by this entry,
+     * providing _PXM method if necessary.
+     */
+    if (hotplugabble_address_space_size) {
+        numamem = acpi_data_push(table_data, sizeof *numamem);
+        build_srat_memory(numamem, machine->device_memory->base,
+                          hotplugabble_address_space_size, conf->numa_nodes - 1,
+                          MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
+    }
+
+    build_header(linker, table_data,
+                 (void *)(table_data->data + srat_start),
+                 "SRAT",
+                 table_data->len - srat_start, 1, NULL, NULL);
+}
+
 /*
  * ACPI spec 5.2.17 System Locality Distance Information Table
  * (Revision 2.0 or later)
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f9a60907f1..353aa55357 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -469,7 +469,7 @@ build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 static void
-build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+virt_build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     AcpiSystemResourceAffinityTable *srat;
     AcpiSratProcessorGiccAffinity *core;
@@ -759,7 +759,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (nb_numa_nodes > 0) {
         acpi_add_table(table_offsets, tables_blob);
-        build_srat(tables_blob, tables->linker, vms);
+        virt_build_srat(tables_blob, tables->linker, vms);
         if (have_numa_distance) {
             acpi_add_table(table_offsets, tables_blob);
             build_slit(tables_blob, tables->linker);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index dfc02a8a85..5932dbe825 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1614,135 +1614,6 @@ build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
                  (void *)tpm2_ptr, "TPM2", sizeof(*tpm2_ptr), 4, NULL, NULL);
 }
 
-#define HOLE_640K_START  (640 * KiB)
-#define HOLE_640K_END   (1 * MiB)
-
-static void
-build_srat(GArray *table_data, BIOSLinker *linker,
-           MachineState *machine, AcpiConfiguration *conf)
-{
-    AcpiSystemResourceAffinityTable *srat;
-    AcpiSratMemoryAffinity *numamem;
-
-    int i;
-    int srat_start, numa_start, slots;
-    uint64_t mem_len, mem_base, next_base;
-    MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
-    ram_addr_t hotplugabble_address_space_size =
-        object_property_get_int(OBJECT(machine), MEMORY_DEVICE_REGION_SIZE,
-                                NULL);
-
-    srat_start = table_data->len;
-
-    srat = acpi_data_push(table_data, sizeof *srat);
-    srat->reserved1 = cpu_to_le32(1);
-
-    for (i = 0; i < apic_ids->len; i++) {
-        int node_id = apic_ids->cpus[i].props.node_id;
-        uint32_t apic_id = apic_ids->cpus[i].arch_id;
-
-        if (apic_id < 255) {
-            AcpiSratProcessorAffinity *core;
-
-            core = acpi_data_push(table_data, sizeof *core);
-            core->type = ACPI_SRAT_PROCESSOR_APIC;
-            core->length = sizeof(*core);
-            core->local_apic_id = apic_id;
-            core->proximity_lo = node_id;
-            memset(core->proximity_hi, 0, 3);
-            core->local_sapic_eid = 0;
-            core->flags = cpu_to_le32(1);
-        } else {
-            AcpiSratProcessorX2ApicAffinity *core;
-
-            core = acpi_data_push(table_data, sizeof *core);
-            core->type = ACPI_SRAT_PROCESSOR_x2APIC;
-            core->length = sizeof(*core);
-            core->x2apic_id = cpu_to_le32(apic_id);
-            core->proximity_domain = cpu_to_le32(node_id);
-            core->flags = cpu_to_le32(1);
-        }
-    }
-
-
-    /* the memory map is a bit tricky, it contains at least one hole
-     * from 640k-1M and possibly another one from 3.5G-4G.
-     */
-    next_base = 0;
-    numa_start = table_data->len;
-
-    for (i = 1; i < conf->numa_nodes + 1; ++i) {
-        mem_base = next_base;
-        mem_len = conf->node_mem[i - 1];
-        next_base = mem_base + mem_len;
-
-        /* Cut out the 640K hole */
-        if (mem_base <= HOLE_640K_START &&
-            next_base > HOLE_640K_START) {
-            mem_len -= next_base - HOLE_640K_START;
-            if (mem_len > 0) {
-                numamem = acpi_data_push(table_data, sizeof *numamem);
-                build_srat_memory(numamem, mem_base, mem_len, i - 1,
-                                  MEM_AFFINITY_ENABLED);
-            }
-
-            /* Check for the rare case: 640K < RAM < 1M */
-            if (next_base <= HOLE_640K_END) {
-                next_base = HOLE_640K_END;
-                continue;
-            }
-            mem_base = HOLE_640K_END;
-            mem_len = next_base - HOLE_640K_END;
-        }
-
-        /* Cut out the ACPI_PCI hole */
-        if (mem_base <= conf->below_4g_mem_size &&
-            next_base > conf->below_4g_mem_size) {
-            mem_len -= next_base - conf->below_4g_mem_size;
-            if (mem_len > 0) {
-                numamem = acpi_data_push(table_data, sizeof *numamem);
-                build_srat_memory(numamem, mem_base, mem_len, i - 1,
-                                  MEM_AFFINITY_ENABLED);
-            }
-            mem_base = 1ULL << 32;
-            mem_len = next_base - conf->below_4g_mem_size;
-            next_base = mem_base + mem_len;
-        }
-
-        if (mem_len > 0) {
-            numamem = acpi_data_push(table_data, sizeof *numamem);
-            build_srat_memory(numamem, mem_base, mem_len, i - 1,
-                              MEM_AFFINITY_ENABLED);
-        }
-    }
-    slots = (table_data->len - numa_start) / sizeof *numamem;
-    for (; slots < conf->numa_nodes + 2; slots++) {
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, 0, 0, 0, MEM_AFFINITY_NOFLAGS);
-    }
-
-    /*
-     * Entry is required for Windows to enable memory hotplug in OS
-     * and for Linux to enable SWIOTLB when booted with less than
-     * 4G of RAM. Windows works better if the entry sets proximity
-     * to the highest NUMA node in the machine.
-     * Memory devices may override proximity set by this entry,
-     * providing _PXM method if necessary.
-     */
-    if (hotplugabble_address_space_size) {
-        numamem = acpi_data_push(table_data, sizeof *numamem);
-        build_srat_memory(numamem, machine->device_memory->base,
-                          hotplugabble_address_space_size, conf->numa_nodes - 1,
-                          MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
-    }
-
-    build_header(linker, table_data,
-                 (void *)(table_data->data + srat_start),
-                 "SRAT",
-                 table_data->len - srat_start, 1, NULL, NULL);
-}
-
 /*
  * VT-d spec 8.1 DMA Remapping Reporting Structure
  * (version Oct. 2014 or later)
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 1fabf58df2..654ce2ec26 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -1,6 +1,7 @@
 #ifndef HW_ACPI_AML_BUILD_H
 #define HW_ACPI_AML_BUILD_H
 
+#include "hw/acpi/acpi.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/pci/pcie_host.h"
@@ -438,6 +439,8 @@ void
 build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
 
+void build_srat(GArray *table_data, BIOSLinker *linker,
+                MachineState *machine, AcpiConfiguration *conf);
 int
 build_append_named_dword(GArray *array, const char *name_format, ...)
 GCC_FMT_ATTR(2, 3);
-- 
2.17.2


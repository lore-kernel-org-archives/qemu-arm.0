Received: by 10.25.208.211 with SMTP id h202csp1439988lfg;
        Mon, 7 Mar 2016 07:19:34 -0800 (PST)
X-Received: by 10.140.107.74 with SMTP id g68mr28643037qgf.82.1457363974375;
        Mon, 07 Mar 2016 07:19:34 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 39si17249365qkp.31.2016.03.07.07.19.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 07:19:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acwwX-0004sV-QA
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 10:19:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33778)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1acwwN-0004pE-So
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:19:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1acwwI-0005BY-Nw
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:19:23 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1acwwI-0005Au-Ep; Mon, 07 Mar 2016 10:19:18 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 206E519CBEB;
	Mon,  7 Mar 2016 15:19:18 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u27FJBIu013702; Mon, 7 Mar 2016 10:19:15 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 16:19:03 +0100
Message-Id: <1457363948-71300-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
References: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, guangrong.xiao@linux.intel.com,
	ehabkost@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, pbonzini@redhat.com
Subject: [Qemu-arm] [PATCH 1/6] acpi: convert linker from GArray to
	BOISLinker structure
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
X-TUID: k0C7H6BXlmnA

Patch just changes type of of linker variables to
a structure, there aren't any functional changes.

Converting linker to a structure will allow to extend
it functionality in follow up patch adding sanity blob
checks.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build.c                  |  5 ++---
 hw/acpi/bios-linker-loader.c         | 40 +++++++++++++++++++++---------------
 hw/acpi/nvdimm.c                     |  6 +++---
 hw/arm/virt-acpi-build.c             | 19 +++++++++--------
 hw/i386/acpi-build.c                 | 29 +++++++++++++-------------
 include/hw/acpi/aml-build.h          |  7 ++++---
 include/hw/acpi/bios-linker-loader.h | 14 ++++++++-----
 include/hw/mem/nvdimm.h              |  3 ++-
 8 files changed, 68 insertions(+), 55 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6675535..07af4fa 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -24,7 +24,6 @@
 #include "hw/acpi/aml-build.h"
 #include "qemu/bswap.h"
 #include "qemu/bitops.h"
-#include "hw/acpi/bios-linker-loader.h"
 
 static GArray *build_alloc_array(void)
 {
@@ -1424,7 +1423,7 @@ Aml *aml_alias(const char *source_object, const char *alias_object)
 }
 
 void
-build_header(GArray *linker, GArray *table_data,
+build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
              const char *oem_id, const char *oem_table_id)
 {
@@ -1492,7 +1491,7 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
 
 /* Build rsdt table */
 void
-build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
+build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id)
 {
     AcpiRsdtDescriptorRev1 *rsdt;
diff --git a/hw/acpi/bios-linker-loader.c b/hw/acpi/bios-linker-loader.c
index ace9abb..9c89a48 100644
--- a/hw/acpi/bios-linker-loader.c
+++ b/hw/acpi/bios-linker-loader.c
@@ -96,33 +96,39 @@ enum {
 };
 
 /*
- * bios_linker_loader_init: allocate a new linker file blob array.
+ * bios_linker_loader_init: allocate a new linker object instance.
  *
  * After initialization, linker commands can be added, and will
- * be stored in the array.
+ * be stored in the linker.cmd_blob array.
  */
-GArray *bios_linker_loader_init(void)
+BIOSLinker *bios_linker_loader_init(void)
 {
-    return g_array_new(false, true /* clear */, 1);
+    BIOSLinker *linker = g_new(BIOSLinker, 1);
+
+    linker->cmd_blob = g_array_new(false, true /* clear */, 1);
+    return linker;
 }
 
-/* Free linker wrapper and return the linker array. */
-void *bios_linker_loader_cleanup(GArray *linker)
+/* Free linker wrapper and return the linker commands array. */
+void *bios_linker_loader_cleanup(BIOSLinker *linker)
 {
-    return g_array_free(linker, false);
+    void *cmd_blob = g_array_free(linker->cmd_blob, false);
+
+    g_free(linker);
+    return cmd_blob;
 }
 
 /*
  * bios_linker_loader_alloc: ask guest to load file into guest memory.
  *
- * @linker: linker file blob array
- * @file: file to be loaded
+ * @linker: linker object instance
+ * @file: name of the file blob to be loaded
  * @alloc_align: required minimal alignment in bytes. Must be a power of 2.
  * @alloc_fseg: request allocation in FSEG zone (useful for the RSDP ACPI table)
  *
  * Note: this command must precede any other linker command using this file.
  */
-void bios_linker_loader_alloc(GArray *linker,
+void bios_linker_loader_alloc(BIOSLinker *linker,
                               const char *file,
                               uint32_t alloc_align,
                               bool alloc_fseg)
@@ -140,7 +146,7 @@ void bios_linker_loader_alloc(GArray *linker,
                                     BIOS_LINKER_LOADER_ALLOC_ZONE_HIGH);
 
     /* Alloc entries must come first, so prepend them */
-    g_array_prepend_vals(linker, &entry, sizeof entry);
+    g_array_prepend_vals(linker->cmd_blob, &entry, sizeof entry);
 }
 
 /*
@@ -150,7 +156,7 @@ void bios_linker_loader_alloc(GArray *linker,
  * Checksum calculation simply sums -X for each byte X in the range
  * using 8-bit math (i.e. ACPI checksum).
  *
- * @linker: linker file blob array
+ * @linker: linker object instance
  * @file: file that includes the checksum to be calculated
  *        and the data to be checksummed
  * @table: @file blob contents
@@ -168,7 +174,7 @@ void bios_linker_loader_alloc(GArray *linker,
  * - To avoid confusion, caller must always put 0x0 at @checksum.
  * - @file must be loaded into Guest memory using bios_linker_loader_alloc
  */
-void bios_linker_loader_add_checksum(GArray *linker, const char *file,
+void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file,
                                      GArray *table,
                                      void *start, unsigned size,
                                      uint8_t *checksum)
@@ -190,14 +196,14 @@ void bios_linker_loader_add_checksum(GArray *linker, const char *file,
     entry.cksum.start = cpu_to_le32(start_offset);
     entry.cksum.length = cpu_to_le32(size);
 
-    g_array_append_vals(linker, &entry, sizeof entry);
+    g_array_append_vals(linker->cmd_blob, &entry, sizeof entry);
 }
 
 /*
  * bios_linker_loader_add_pointer: ask guest to add address of source file
  * into destination file at the specified pointer.
  *
- * @linker: linker file blob array
+ * @linker: linker object instance
  * @dest_file: destination file that must be changed
  * @src_file: source file who's address must be taken
  * @table: @dest_file blob contents array
@@ -214,7 +220,7 @@ void bios_linker_loader_add_checksum(GArray *linker, const char *file,
  * - Both @dest_file and @src_file must be
  *   loaded into Guest memory using bios_linker_loader_alloc
  */
-void bios_linker_loader_add_pointer(GArray *linker,
+void bios_linker_loader_add_pointer(BIOSLinker *linker,
                                     const char *dest_file,
                                     const char *src_file,
                                     GArray *table, void *pointer,
@@ -237,5 +243,5 @@ void bios_linker_loader_add_pointer(GArray *linker,
     assert(pointer_size == 1 || pointer_size == 2 ||
            pointer_size == 4 || pointer_size == 8);
 
-    g_array_append_vals(linker, &entry, sizeof entry);
+    g_array_append_vals(linker->cmd_blob, &entry, sizeof entry);
 }
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 49ee68e..fe5f7d1 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -351,7 +351,7 @@ static GArray *nvdimm_build_device_structure(GSList *device_list)
 }
 
 static void nvdimm_build_nfit(GSList *device_list, GArray *table_offsets,
-                              GArray *table_data, GArray *linker)
+                              GArray *table_data, BIOSLinker *linker)
 {
     GArray *structures = nvdimm_build_device_structure(device_list);
     unsigned int header;
@@ -433,7 +433,7 @@ static void nvdimm_build_nvdimm_devices(GSList *device_list, Aml *root_dev)
 }
 
 static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
-                              GArray *table_data, GArray *linker)
+                              GArray *table_data, BIOSLinker *linker)
 {
     Aml *ssdt, *sb_scope, *dev;
 
@@ -476,7 +476,7 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
 }
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       GArray *linker)
+                       BIOSLinker *linker)
 {
     GSList *device_list;
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b8b3ece..e6ea6db 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -337,7 +337,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
 /* RSDP */
 static GArray *
-build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
 
@@ -366,7 +366,7 @@ build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
 }
 
 static void
-build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     AcpiSerialPortConsoleRedirection *spcr;
     const MemMapEntry *uart_memmap = &guest_info->memmap[VIRT_UART];
@@ -399,7 +399,7 @@ build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 }
 
 static void
-build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+build_mcfg(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     AcpiTableMcfg *mcfg;
     const MemMapEntry *memmap = guest_info->memmap;
@@ -419,7 +419,7 @@ build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 
 /* GTDT */
 static void
-build_gtdt(GArray *table_data, GArray *linker)
+build_gtdt(GArray *table_data, BIOSLinker *linker)
 {
     int gtdt_start = table_data->len;
     AcpiGenericTimerTable *gtdt;
@@ -445,7 +445,7 @@ build_gtdt(GArray *table_data, GArray *linker)
 
 /* MADT */
 static void
-build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     int madt_start = table_data->len;
     const MemMapEntry *memmap = guest_info->memmap;
@@ -504,7 +504,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 
 /* FADT */
 static void
-build_fadt(GArray *table_data, GArray *linker, unsigned dsdt)
+build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt)
 {
     AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
 
@@ -529,7 +529,7 @@ build_fadt(GArray *table_data, GArray *linker, unsigned dsdt)
 
 /* DSDT */
 static void
-build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+build_dsdt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     Aml *scope, *dsdt;
     const MemMapEntry *memmap = guest_info->memmap;
@@ -662,7 +662,7 @@ static void virt_acpi_build_update(void *build_opaque)
 
     acpi_ram_update(build_state->table_mr, tables.table_data);
     acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
-    acpi_ram_update(build_state->linker_mr, tables.linker);
+    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
 
 
     acpi_build_tables_cleanup(&tables, true);
@@ -720,7 +720,8 @@ void virt_acpi_setup(VirtGuestInfo *guest_info)
     assert(build_state->table_mr != NULL);
 
     build_state->linker_mr =
-        acpi_add_rom_blob(build_state, tables.linker, "etc/table-loader", 0);
+        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
+                          "etc/table-loader", 0);
 
     fw_cfg_add_file(guest_info->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 52c9470..5db65a2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -290,7 +290,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
 
 /* FACS */
 static void
-build_facs(GArray *table_data, GArray *linker)
+build_facs(GArray *table_data, BIOSLinker *linker)
 {
     AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
     memcpy(&facs->signature, "FACS", 4);
@@ -335,7 +335,7 @@ static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
 
 /* FADT */
 static void
-build_fadt(GArray *table_data, GArray *linker, AcpiPmInfo *pm,
+build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
            unsigned facs, unsigned dsdt,
            const char *oem_id, const char *oem_table_id)
 {
@@ -362,7 +362,7 @@ build_fadt(GArray *table_data, GArray *linker, AcpiPmInfo *pm,
 }
 
 static void
-build_madt(GArray *table_data, GArray *linker, AcpiCpuInfo *cpu)
+build_madt(GArray *table_data, BIOSLinker *linker, AcpiCpuInfo *cpu)
 {
     PCMachineState *pcms = PC_MACHINE(qdev_get_machine());
     int madt_start = table_data->len;
@@ -1936,7 +1936,7 @@ static Aml *build_q35_osc_method(void)
 }
 
 static void
-build_dsdt(GArray *table_data, GArray *linker,
+build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiCpuInfo *cpu, AcpiPmInfo *pm, AcpiMiscInfo *misc,
            PcPciInfo *pci)
 {
@@ -2292,7 +2292,7 @@ build_dsdt(GArray *table_data, GArray *linker,
 }
 
 static void
-build_hpet(GArray *table_data, GArray *linker)
+build_hpet(GArray *table_data, BIOSLinker *linker)
 {
     Acpi20Hpet *hpet;
 
@@ -2307,7 +2307,7 @@ build_hpet(GArray *table_data, GArray *linker)
 }
 
 static void
-build_tpm_tcpa(GArray *table_data, GArray *linker, GArray *tcpalog)
+build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 {
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
     uint64_t log_area_start_address = acpi_data_len(tcpalog);
@@ -2332,7 +2332,7 @@ build_tpm_tcpa(GArray *table_data, GArray *linker, GArray *tcpalog)
 }
 
 static void
-build_tpm2(GArray *table_data, GArray *linker)
+build_tpm2(GArray *table_data, BIOSLinker *linker)
 {
     Acpi20TPM2 *tpm2_ptr;
 
@@ -2367,7 +2367,7 @@ acpi_build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 }
 
 static void
-build_srat(GArray *table_data, GArray *linker)
+build_srat(GArray *table_data, BIOSLinker *linker)
 {
     AcpiSystemResourceAffinityTable *srat;
     AcpiSratProcessorAffinity *core;
@@ -2461,7 +2461,7 @@ build_srat(GArray *table_data, GArray *linker)
 }
 
 static void
-build_mcfg_q35(GArray *table_data, GArray *linker, AcpiMcfgInfo *info)
+build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
     AcpiTableMcfg *mcfg;
     const char *sig;
@@ -2490,7 +2490,7 @@ build_mcfg_q35(GArray *table_data, GArray *linker, AcpiMcfgInfo *info)
 }
 
 static void
-build_dmar_q35(GArray *table_data, GArray *linker)
+build_dmar_q35(GArray *table_data, BIOSLinker *linker)
 {
     int dmar_start = table_data->len;
 
@@ -2514,7 +2514,7 @@ build_dmar_q35(GArray *table_data, GArray *linker)
 }
 
 static GArray *
-build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
 
@@ -2736,7 +2736,7 @@ void acpi_build(AcpiBuildTables *tables)
         acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
     }
 
-    acpi_align_size(tables->linker, ACPI_BUILD_ALIGN_SIZE);
+    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
 
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
@@ -2776,7 +2776,7 @@ static void acpi_build_update(void *build_opaque)
         acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
     }
 
-    acpi_ram_update(build_state->linker_mr, tables.linker);
+    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
     acpi_build_tables_cleanup(&tables, true);
 }
 
@@ -2840,7 +2840,8 @@ void acpi_setup(void)
     assert(build_state->table_mr != NULL);
 
     build_state->linker_mr =
-        acpi_add_rom_blob(build_state, tables.linker, "etc/table-loader", 0);
+        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
+                          "etc/table-loader", 0);
 
     fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index d3e0c8f..2f3eeaf 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -3,6 +3,7 @@
 
 #include <glib.h>
 #include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/bios-linker-loader.h"
 
 /* Reserve RAM space for tables: add another order of magnitude. */
 #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
@@ -203,7 +204,7 @@ struct AcpiBuildTables {
     GArray *table_data;
     GArray *rsdp;
     GArray *tcpalog;
-    GArray *linker;
+    BIOSLinker *linker;
 } AcpiBuildTables;
 
 /**
@@ -353,7 +354,7 @@ Aml *aml_derefof(Aml *arg);
 Aml *aml_sizeof(Aml *arg);
 
 void
-build_header(GArray *linker, GArray *table_data,
+build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
              const char *oem_id, const char *oem_table_id);
 void *acpi_data_push(GArray *table_data, unsigned size);
@@ -362,7 +363,7 @@ void acpi_add_table(GArray *table_offsets, GArray *table_data);
 void acpi_build_tables_init(AcpiBuildTables *tables);
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
 void
-build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
+build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
 
 #endif
diff --git a/include/hw/acpi/bios-linker-loader.h b/include/hw/acpi/bios-linker-loader.h
index 82f1af6..4145c56 100644
--- a/include/hw/acpi/bios-linker-loader.h
+++ b/include/hw/acpi/bios-linker-loader.h
@@ -3,23 +3,27 @@
 
 #include <glib.h>
 
-GArray *bios_linker_loader_init(void);
+typedef struct BIOSLinker {
+    GArray *cmd_blob;
+} BIOSLinker;
 
-void bios_linker_loader_alloc(GArray *linker,
+BIOSLinker *bios_linker_loader_init(void);
+
+void bios_linker_loader_alloc(BIOSLinker *linker,
                               const char *file,
                               uint32_t alloc_align,
                               bool alloc_fseg);
 
-void bios_linker_loader_add_checksum(GArray *linker, const char *file,
+void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file,
                                      GArray *table,
                                      void *start, unsigned size,
                                      uint8_t *checksum);
 
-void bios_linker_loader_add_pointer(GArray *linker,
+void bios_linker_loader_add_pointer(BIOSLinker *linker,
                                     const char *dest_file,
                                     const char *src_file,
                                     GArray *table, void *pointer,
                                     uint8_t pointer_size);
 
-void *bios_linker_loader_cleanup(GArray *linker);
+void *bios_linker_loader_cleanup(BIOSLinker *linker);
 #endif
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index 49183c1..bb9359d 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -24,9 +24,10 @@
 #define QEMU_NVDIMM_H
 
 #include "hw/mem/pc-dimm.h"
+#include "hw/acpi/bios-linker-loader.h"
 
 #define TYPE_NVDIMM      "nvdimm"
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       GArray *linker);
+                       BIOSLinker *linker);
 #endif
-- 
1.8.3.1


Received: by 10.25.27.66 with SMTP id b63csp1069292lfb;
        Sun, 5 Jun 2016 06:38:58 -0700 (PDT)
X-Received: by 10.55.109.135 with SMTP id i129mr12129645qkc.127.1465133938463;
        Sun, 05 Jun 2016 06:38:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h186si8219682qke.210.2016.06.05.06.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Jun 2016 06:38:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9YGX-0003IF-Oa
	for alex.bennee@linaro.org; Sun, 05 Jun 2016 09:38:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1b9Y01-00037S-BN
	for qemu-arm@nongnu.org; Sun, 05 Jun 2016 09:21:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1b9Xzx-0004z2-UO
	for qemu-arm@nongnu.org; Sun, 05 Jun 2016 09:21:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59490)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1b9Xzx-0004yx-Lt; Sun, 05 Jun 2016 09:21:49 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1DCB1FB05;
	Sun,  5 Jun 2016 13:21:48 +0000 (UTC)
Received: from redhat.com (vpn1-7-180.ams2.redhat.com [10.36.7.180])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u55DLixe015226; Sun, 5 Jun 2016 09:21:45 -0400
Date: Sun, 5 Jun 2016 16:21:44 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1465132825-14242-18-git-send-email-mst@redhat.com>
References: <1465132825-14242-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465132825-14242-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sun, 05 Jun 2016 13:21:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 17/25] acpi: convert linker from GArray to
 BIOSLinker structure
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aS0WUMPefU4Q

From: Igor Mammedov <imammedo@redhat.com>

Patch just changes type of of linker variables to
a structure, there aren't any functional changes.

Converting linker to a structure will allow to extend
it functionality in follow up patch adding sanity blob
checks.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h          |  7 ++++---
 include/hw/acpi/bios-linker-loader.h | 14 ++++++++-----
 include/hw/mem/nvdimm.h              |  3 ++-
 hw/acpi/aml-build.c                  |  5 ++---
 hw/acpi/bios-linker-loader.c         | 40 +++++++++++++++++++++---------------
 hw/acpi/nvdimm.c                     |  6 +++---
 hw/arm/virt-acpi-build.c             | 24 +++++++++++-----------
 hw/i386/acpi-build.c                 | 29 +++++++++++++-------------
 8 files changed, 70 insertions(+), 58 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index dd432d2..3952f85 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -3,6 +3,7 @@
 
 #include <glib.h>
 #include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/bios-linker-loader.h"
 
 /* Reserve RAM space for tables: add another order of magnitude. */
 #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
@@ -210,7 +211,7 @@ struct AcpiBuildTables {
     GArray *table_data;
     GArray *rsdp;
     GArray *tcpalog;
-    GArray *linker;
+    BIOSLinker *linker;
 } AcpiBuildTables;
 
 /**
@@ -365,7 +366,7 @@ Aml *aml_sizeof(Aml *arg);
 Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target);
 
 void
-build_header(GArray *linker, GArray *table_data,
+build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
              const char *oem_id, const char *oem_table_id);
 void *acpi_data_push(GArray *table_data, unsigned size);
@@ -374,7 +375,7 @@ void acpi_add_table(GArray *table_offsets, GArray *table_data);
 void acpi_build_tables_init(AcpiBuildTables *tables);
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
 void
-build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
+build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
 
 int
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
index 517de9c..32e1445 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -24,6 +24,7 @@
 #define QEMU_NVDIMM_H
 
 #include "hw/mem/pc-dimm.h"
+#include "hw/acpi/bios-linker-loader.h"
 
 #define NVDIMM_DEBUG 0
 #define nvdimm_debug(fmt, ...)                                \
@@ -58,5 +59,5 @@ typedef struct AcpiNVDIMMState AcpiNVDIMMState;
 void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
                             FWCfgState *fw_cfg, Object *owner);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       GArray *linker);
+                       BIOSLinker *linker);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 95f6021..a3fc93a 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -24,7 +24,6 @@
 #include "hw/acpi/aml-build.h"
 #include "qemu/bswap.h"
 #include "qemu/bitops.h"
-#include "hw/acpi/bios-linker-loader.h"
 
 static GArray *build_alloc_array(void)
 {
@@ -1490,7 +1489,7 @@ Aml *aml_concatenate(Aml *source1, Aml *source2, Aml *target)
 }
 
 void
-build_header(GArray *linker, GArray *table_data,
+build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
              const char *oem_id, const char *oem_table_id)
 {
@@ -1558,7 +1557,7 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
 
 /* Build rsdt table */
 void
-build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
+build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id)
 {
     AcpiRsdtDescriptorRev1 *rsdt;
diff --git a/hw/acpi/bios-linker-loader.c b/hw/acpi/bios-linker-loader.c
index 5153ab1..6b15a85 100644
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
@@ -139,7 +145,7 @@ void bios_linker_loader_alloc(GArray *linker,
                                     BIOS_LINKER_LOADER_ALLOC_ZONE_HIGH;
 
     /* Alloc entries must come first, so prepend them */
-    g_array_prepend_vals(linker, &entry, sizeof entry);
+    g_array_prepend_vals(linker->cmd_blob, &entry, sizeof entry);
 }
 
 /*
@@ -149,7 +155,7 @@ void bios_linker_loader_alloc(GArray *linker,
  * Checksum calculation simply sums -X for each byte X in the range
  * using 8-bit math (i.e. ACPI checksum).
  *
- * @linker: linker file blob array
+ * @linker: linker object instance
  * @file: file that includes the checksum to be calculated
  *        and the data to be checksummed
  * @table: @file blob contents
@@ -167,7 +173,7 @@ void bios_linker_loader_alloc(GArray *linker,
  * - To avoid confusion, caller must always put 0x0 at @checksum.
  * - @file must be loaded into Guest memory using bios_linker_loader_alloc
  */
-void bios_linker_loader_add_checksum(GArray *linker, const char *file,
+void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file,
                                      GArray *table,
                                      void *start, unsigned size,
                                      uint8_t *checksum)
@@ -189,14 +195,14 @@ void bios_linker_loader_add_checksum(GArray *linker, const char *file,
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
@@ -213,7 +219,7 @@ void bios_linker_loader_add_checksum(GArray *linker, const char *file,
  * - Both @dest_file and @src_file must be
  *   loaded into Guest memory using bios_linker_loader_alloc
  */
-void bios_linker_loader_add_pointer(GArray *linker,
+void bios_linker_loader_add_pointer(BIOSLinker *linker,
                                     const char *dest_file,
                                     const char *src_file,
                                     GArray *table, void *pointer,
@@ -236,5 +242,5 @@ void bios_linker_loader_add_pointer(GArray *linker,
     assert(pointer_size == 1 || pointer_size == 2 ||
            pointer_size == 4 || pointer_size == 8);
 
-    g_array_append_vals(linker, &entry, sizeof entry);
+    g_array_append_vals(linker->cmd_blob, &entry, sizeof entry);
 }
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index fb925dc..a2d20ea 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -353,7 +353,7 @@ static GArray *nvdimm_build_device_structure(GSList *device_list)
 }
 
 static void nvdimm_build_nfit(GSList *device_list, GArray *table_offsets,
-                              GArray *table_data, GArray *linker)
+                              GArray *table_data, BIOSLinker *linker)
 {
     GArray *structures = nvdimm_build_device_structure(device_list);
     unsigned int header;
@@ -579,7 +579,7 @@ static void nvdimm_build_nvdimm_devices(GSList *device_list, Aml *root_dev)
 }
 
 static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
-                              GArray *table_data, GArray *linker)
+                              GArray *table_data, BIOSLinker *linker)
 {
     Aml *ssdt, *sb_scope, *dev, *field;
     int mem_addr_offset, nvdimm_ssdt;
@@ -691,7 +691,7 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
 }
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       GArray *linker)
+                       BIOSLinker *linker)
 {
     GSList *device_list;
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 26a7bac..4fe150a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -353,7 +353,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
 /* RSDP */
 static GArray *
-build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
 
@@ -382,7 +382,7 @@ build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
 }
 
 static void
-build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+build_spcr(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     AcpiSerialPortConsoleRedirection *spcr;
     const MemMapEntry *uart_memmap = &guest_info->memmap[VIRT_UART];
@@ -415,7 +415,7 @@ build_spcr(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 }
 
 static void
-build_srat(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+build_srat(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     AcpiSystemResourceAffinityTable *srat;
     AcpiSratProcessorGiccAffinity *core;
@@ -455,13 +455,12 @@ build_srat(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
         mem_base += numa_info[i].node_mem;
     }
 
-    build_header(linker, table_data,
-                 (void *)(table_data->data + srat_start), "SRAT",
+    build_header(linker, table_data, (void *)srat, "SRAT",
                  table_data->len - srat_start, 3, NULL, NULL);
 }
 
 static void
-build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+build_mcfg(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     AcpiTableMcfg *mcfg;
     const MemMapEntry *memmap = guest_info->memmap;
@@ -481,7 +480,7 @@ build_mcfg(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 
 /* GTDT */
 static void
-build_gtdt(GArray *table_data, GArray *linker)
+build_gtdt(GArray *table_data, BIOSLinker *linker)
 {
     int gtdt_start = table_data->len;
     AcpiGenericTimerTable *gtdt;
@@ -507,7 +506,7 @@ build_gtdt(GArray *table_data, GArray *linker)
 
 /* MADT */
 static void
-build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     int madt_start = table_data->len;
     const MemMapEntry *memmap = guest_info->memmap;
@@ -566,7 +565,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
 
 /* FADT */
 static void
-build_fadt(GArray *table_data, GArray *linker, unsigned dsdt)
+build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt)
 {
     AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
 
@@ -591,7 +590,7 @@ build_fadt(GArray *table_data, GArray *linker, unsigned dsdt)
 
 /* DSDT */
 static void
-build_dsdt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info)
+build_dsdt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 {
     Aml *scope, *dsdt;
     const MemMapEntry *memmap = guest_info->memmap;
@@ -730,7 +729,7 @@ static void virt_acpi_build_update(void *build_opaque)
 
     acpi_ram_update(build_state->table_mr, tables.table_data);
     acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
-    acpi_ram_update(build_state->linker_mr, tables.linker);
+    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
 
 
     acpi_build_tables_cleanup(&tables, true);
@@ -788,7 +787,8 @@ void virt_acpi_setup(VirtGuestInfo *guest_info)
     assert(build_state->table_mr != NULL);
 
     build_state->linker_mr =
-        acpi_add_rom_blob(build_state, tables.linker, "etc/table-loader", 0);
+        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
+                          "etc/table-loader", 0);
 
     fw_cfg_add_file(guest_info->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 768918f..e6c390c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -260,7 +260,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
 
 /* FACS */
 static void
-build_facs(GArray *table_data, GArray *linker)
+build_facs(GArray *table_data, BIOSLinker *linker)
 {
     AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
     memcpy(&facs->signature, "FACS", 4);
@@ -305,7 +305,7 @@ static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
 
 /* FADT */
 static void
-build_fadt(GArray *table_data, GArray *linker, AcpiPmInfo *pm,
+build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
            unsigned facs, unsigned dsdt,
            const char *oem_id, const char *oem_table_id)
 {
@@ -332,7 +332,7 @@ build_fadt(GArray *table_data, GArray *linker, AcpiPmInfo *pm,
 }
 
 static void
-build_madt(GArray *table_data, GArray *linker, PCMachineState *pcms)
+build_madt(GArray *table_data, BIOSLinker *linker, PCMachineState *pcms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(pcms);
     CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(pcms));
@@ -1869,7 +1869,7 @@ static Aml *build_q35_osc_method(void)
 }
 
 static void
-build_dsdt(GArray *table_data, GArray *linker,
+build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
            PcPciInfo *pci, MachineState *machine)
 {
@@ -2240,7 +2240,7 @@ build_dsdt(GArray *table_data, GArray *linker,
 }
 
 static void
-build_hpet(GArray *table_data, GArray *linker)
+build_hpet(GArray *table_data, BIOSLinker *linker)
 {
     Acpi20Hpet *hpet;
 
@@ -2255,7 +2255,7 @@ build_hpet(GArray *table_data, GArray *linker)
 }
 
 static void
-build_tpm_tcpa(GArray *table_data, GArray *linker, GArray *tcpalog)
+build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 {
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
     uint64_t log_area_start_address = acpi_data_len(tcpalog);
@@ -2280,7 +2280,7 @@ build_tpm_tcpa(GArray *table_data, GArray *linker, GArray *tcpalog)
 }
 
 static void
-build_tpm2(GArray *table_data, GArray *linker)
+build_tpm2(GArray *table_data, BIOSLinker *linker)
 {
     Acpi20TPM2 *tpm2_ptr;
 
@@ -2295,7 +2295,7 @@ build_tpm2(GArray *table_data, GArray *linker)
 }
 
 static void
-build_srat(GArray *table_data, GArray *linker, MachineState *machine)
+build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
 {
     AcpiSystemResourceAffinityTable *srat;
     AcpiSratProcessorAffinity *core;
@@ -2392,7 +2392,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
 }
 
 static void
-build_mcfg_q35(GArray *table_data, GArray *linker, AcpiMcfgInfo *info)
+build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
     AcpiTableMcfg *mcfg;
     const char *sig;
@@ -2421,7 +2421,7 @@ build_mcfg_q35(GArray *table_data, GArray *linker, AcpiMcfgInfo *info)
 }
 
 static void
-build_dmar_q35(GArray *table_data, GArray *linker)
+build_dmar_q35(GArray *table_data, BIOSLinker *linker)
 {
     int dmar_start = table_data->len;
 
@@ -2445,7 +2445,7 @@ build_dmar_q35(GArray *table_data, GArray *linker)
 }
 
 static GArray *
-build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
 
@@ -2657,7 +2657,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
     }
 
-    acpi_align_size(tables->linker, ACPI_BUILD_ALIGN_SIZE);
+    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
 
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
@@ -2697,7 +2697,7 @@ static void acpi_build_update(void *build_opaque)
         acpi_ram_update(build_state->rsdp_mr, tables.rsdp);
     }
 
-    acpi_ram_update(build_state->linker_mr, tables.linker);
+    acpi_ram_update(build_state->linker_mr, tables.linker->cmd_blob);
     acpi_build_tables_cleanup(&tables, true);
 }
 
@@ -2761,7 +2761,8 @@ void acpi_setup(void)
     assert(build_state->table_mr != NULL);
 
     build_state->linker_mr =
-        acpi_add_rom_blob(build_state, tables.linker, "etc/table-loader", 0);
+        acpi_add_rom_blob(build_state, tables.linker->cmd_blob,
+                          "etc/table-loader", 0);
 
     fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
-- 
MST


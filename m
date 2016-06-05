Received: by 10.25.27.66 with SMTP id b63csp1069062lfb;
        Sun, 5 Jun 2016 06:38:07 -0700 (PDT)
X-Received: by 10.140.39.166 with SMTP id v35mr10620035qgv.93.1465133887678;
        Sun, 05 Jun 2016 06:38:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u30si9326785qtd.111.2016.06.05.06.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Jun 2016 06:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9YFi-0002Yz-Vf
	for alex.bennee@linaro.org; Sun, 05 Jun 2016 09:38:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1b9Y07-0003Dn-S1
	for qemu-arm@nongnu.org; Sun, 05 Jun 2016 09:22:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1b9Y01-00050F-K6
	for qemu-arm@nongnu.org; Sun, 05 Jun 2016 09:21:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39705)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1b9Y01-000509-B7; Sun, 05 Jun 2016 09:21:53 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E36FE3D2;
	Sun,  5 Jun 2016 13:21:52 +0000 (UTC)
Received: from redhat.com (vpn1-7-180.ams2.redhat.com [10.36.7.180])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u55DLnF6017246; Sun, 5 Jun 2016 09:21:50 -0400
Date: Sun, 5 Jun 2016 16:21:49 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1465132825-14242-19-git-send-email-mst@redhat.com>
References: <1465132825-14242-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465132825-14242-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 05 Jun 2016 13:21:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 18/25] acpi: simplify bios_linker API by removing
 redundant 'table' argument
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
X-TUID: HMb/Ia/VK3mq

From: Igor Mammedov <imammedo@redhat.com>

'table' argument in bios_linker_add_foo() commands is
a data blob of one of files also passed to the same API.
So instead of passing blob in every API call, add and keep
file name association with related blob at bios_linker_loader_alloc()
time.

And find blob by name looking up allocated file entries
inside of bios_linker_add_foo() commands.

It will:
 - make API less confusing,
 - enforce calling bios_linker_loader_alloc() before
   calling any bios_linker_add_foo()
 - make sure that blob is the correct one, i.e.
   associated with the right file name

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/bios-linker-loader.h |  7 +--
 include/hw/mem/nvdimm.h              |  2 +-
 hw/acpi/aml-build.c                  |  4 +-
 hw/acpi/bios-linker-loader.c         | 82 +++++++++++++++++++++++++++---------
 hw/acpi/nvdimm.c                     | 15 ++++---
 hw/arm/virt-acpi-build.c             | 11 ++---
 hw/i386/acpi-build.c                 | 20 +++++----
 7 files changed, 94 insertions(+), 47 deletions(-)

diff --git a/include/hw/acpi/bios-linker-loader.h b/include/hw/acpi/bios-linker-loader.h
index 4145c56..bee6dee 100644
--- a/include/hw/acpi/bios-linker-loader.h
+++ b/include/hw/acpi/bios-linker-loader.h
@@ -5,24 +5,25 @@
 
 typedef struct BIOSLinker {
     GArray *cmd_blob;
+    GArray *file_list;
 } BIOSLinker;
 
 BIOSLinker *bios_linker_loader_init(void);
 
 void bios_linker_loader_alloc(BIOSLinker *linker,
-                              const char *file,
+                              const char *file_name,
+                              GArray *file_blob,
                               uint32_t alloc_align,
                               bool alloc_fseg);
 
 void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file,
-                                     GArray *table,
                                      void *start, unsigned size,
                                      uint8_t *checksum);
 
 void bios_linker_loader_add_pointer(BIOSLinker *linker,
                                     const char *dest_file,
                                     const char *src_file,
-                                    GArray *table, void *pointer,
+                                    void *pointer,
                                     uint8_t pointer_size);
 
 void *bios_linker_loader_cleanup(BIOSLinker *linker);
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index 32e1445..60ee92b 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -59,5 +59,5 @@ typedef struct AcpiNVDIMMState AcpiNVDIMMState;
 void nvdimm_init_acpi_state(AcpiNVDIMMState *state, MemoryRegion *io,
                             FWCfgState *fw_cfg, Object *owner);
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       BIOSLinker *linker);
+                       BIOSLinker *linker, GArray *dsm_dma_arrea);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index a3fc93a..bff2599 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1516,7 +1516,7 @@ build_header(BIOSLinker *linker, GArray *table_data,
     h->checksum = 0;
     /* Checksum to be filled in by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
-                                    table_data, h, len, &h->checksum);
+                                    h, len, &h->checksum);
 }
 
 void *acpi_data_push(GArray *table_data, unsigned size)
@@ -1573,7 +1573,7 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
         bios_linker_loader_add_pointer(linker,
                                        ACPI_BUILD_TABLE_FILE,
                                        ACPI_BUILD_TABLE_FILE,
-                                       table_data, &rsdt->table_offset_entry[i],
+                                       &rsdt->table_offset_entry[i],
                                        sizeof(uint32_t));
     }
     build_header(linker, table_data,
diff --git a/hw/acpi/bios-linker-loader.c b/hw/acpi/bios-linker-loader.c
index 6b15a85..a2f20ec 100644
--- a/hw/acpi/bios-linker-loader.c
+++ b/hw/acpi/bios-linker-loader.c
@@ -96,6 +96,22 @@ enum {
 };
 
 /*
+ * BiosLinkerFileEntry:
+ *
+ * An internal type used for book-keeping file entries
+ */
+typedef struct BiosLinkerFileEntry {
+    char *name; /* file name */
+    GArray *blob; /* data accosiated with @name */
+} BiosLinkerFileEntry;
+
+static void bios_linker_free_file_entry(gpointer data)
+{
+    BiosLinkerFileEntry *entry = data;
+    g_free(entry->name);
+}
+
+/*
  * bios_linker_loader_init: allocate a new linker object instance.
  *
  * After initialization, linker commands can be added, and will
@@ -106,6 +122,9 @@ BIOSLinker *bios_linker_loader_init(void)
     BIOSLinker *linker = g_new(BIOSLinker, 1);
 
     linker->cmd_blob = g_array_new(false, true /* clear */, 1);
+    linker->file_list = g_array_new(false, true /* clear */,
+                                    sizeof(BiosLinkerFileEntry));
+    g_array_set_clear_func(linker->file_list, bios_linker_free_file_entry);
     return linker;
 }
 
@@ -114,31 +133,53 @@ void *bios_linker_loader_cleanup(BIOSLinker *linker)
 {
     void *cmd_blob = g_array_free(linker->cmd_blob, false);
 
+    g_array_free(linker->file_list, true);
     g_free(linker);
     return cmd_blob;
 }
 
+static const BiosLinkerFileEntry *
+bios_linker_find_file(const BIOSLinker *linker, const char *name)
+{
+    int i;
+    BiosLinkerFileEntry *entry;
+
+    for (i = 0; i < linker->file_list->len; i++) {
+        entry = &g_array_index(linker->file_list, BiosLinkerFileEntry, i);
+        if (!strcmp(entry->name, name)) {
+            return entry;
+        }
+    }
+    return NULL;
+}
+
 /*
  * bios_linker_loader_alloc: ask guest to load file into guest memory.
  *
  * @linker: linker object instance
- * @file: name of the file blob to be loaded
+ * @file_name: name of the file blob to be loaded
+ * @file_blob: pointer to blob corresponding to @file_name
  * @alloc_align: required minimal alignment in bytes. Must be a power of 2.
  * @alloc_fseg: request allocation in FSEG zone (useful for the RSDP ACPI table)
  *
  * Note: this command must precede any other linker command using this file.
  */
 void bios_linker_loader_alloc(BIOSLinker *linker,
-                              const char *file,
+                              const char *file_name,
+                              GArray *file_blob,
                               uint32_t alloc_align,
                               bool alloc_fseg)
 {
     BiosLinkerLoaderEntry entry;
+    BiosLinkerFileEntry file = { g_strdup(file_name), file_blob};
 
     assert(!(alloc_align & (alloc_align - 1)));
 
+    assert(!bios_linker_find_file(linker, file_name));
+    g_array_append_val(linker->file_list, file);
+
     memset(&entry, 0, sizeof entry);
-    strncpy(entry.alloc.file, file, sizeof entry.alloc.file - 1);
+    strncpy(entry.alloc.file, file_name, sizeof entry.alloc.file - 1);
     entry.command = cpu_to_le32(BIOS_LINKER_LOADER_COMMAND_ALLOCATE);
     entry.alloc.align = cpu_to_le32(alloc_align);
     entry.alloc.zone = alloc_fseg ? BIOS_LINKER_LOADER_ALLOC_ZONE_FSEG :
@@ -158,38 +199,37 @@ void bios_linker_loader_alloc(BIOSLinker *linker,
  * @linker: linker object instance
  * @file: file that includes the checksum to be calculated
  *        and the data to be checksummed
- * @table: @file blob contents
  * @start, @size: range of data to checksum
  * @checksum: location of the checksum to be patched within file blob
  *
  * Notes:
- * - checksum byte initial value must have been pushed into @table
- *   and reside at address @checksum.
- * - @size bytes must have been pushed into @table and reside at address
- *   @start.
+ * - checksum byte initial value must have been pushed into blob
+ *   associated with @file and reside at address @checksum.
+ * - @size bytes must have been pushed into blob associated wtih @file
+ *   and reside at address @start.
  * - Guest calculates checksum of specified range of data, result is added to
  *   initial value at @checksum into copy of @file in Guest memory.
  * - Range might include the checksum itself.
  * - To avoid confusion, caller must always put 0x0 at @checksum.
  * - @file must be loaded into Guest memory using bios_linker_loader_alloc
  */
-void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file,
-                                     GArray *table,
+void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file_name,
                                      void *start, unsigned size,
                                      uint8_t *checksum)
 {
     BiosLinkerLoaderEntry entry;
-    ptrdiff_t checksum_offset = (gchar *)checksum - table->data;
-    ptrdiff_t start_offset = (gchar *)start - table->data;
+    const BiosLinkerFileEntry *file = bios_linker_find_file(linker, file_name);
+    ptrdiff_t checksum_offset = (gchar *)checksum - file->blob->data;
+    ptrdiff_t start_offset = (gchar *)start - file->blob->data;
 
     assert(checksum_offset >= 0);
     assert(start_offset >= 0);
-    assert(checksum_offset + 1 <= table->len);
-    assert(start_offset + size <= table->len);
+    assert(checksum_offset + 1 <= file->blob->len);
+    assert(start_offset + size <= file->blob->len);
     assert(*checksum == 0x0);
 
     memset(&entry, 0, sizeof entry);
-    strncpy(entry.cksum.file, file, sizeof entry.cksum.file - 1);
+    strncpy(entry.cksum.file, file_name, sizeof entry.cksum.file - 1);
     entry.command = cpu_to_le32(BIOS_LINKER_LOADER_COMMAND_ADD_CHECKSUM);
     entry.cksum.offset = cpu_to_le32(checksum_offset);
     entry.cksum.start = cpu_to_le32(start_offset);
@@ -205,13 +245,12 @@ void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file,
  * @linker: linker object instance
  * @dest_file: destination file that must be changed
  * @src_file: source file who's address must be taken
- * @table: @dest_file blob contents array
  * @pointer: location of the pointer to be patched within destination file blob
  * @pointer_size: size of pointer to be patched, in bytes
  *
  * Notes:
- * - @pointer_size bytes must have been pushed into @table
- *   and reside at address @pointer.
+ * - @pointer_size bytes must have been pushed into blob associated with
+ *   @dest_file and reside at address @pointer.
  * - Guest address is added to initial value at @pointer
  *   into copy of @dest_file in Guest memory.
  *   e.g. to get start of src_file in guest memory, put 0x0 there
@@ -222,14 +261,15 @@ void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file,
 void bios_linker_loader_add_pointer(BIOSLinker *linker,
                                     const char *dest_file,
                                     const char *src_file,
-                                    GArray *table, void *pointer,
+                                    void *pointer,
                                     uint8_t pointer_size)
 {
     BiosLinkerLoaderEntry entry;
-    ptrdiff_t offset = (gchar *)pointer - table->data;
+    const BiosLinkerFileEntry *file = bios_linker_find_file(linker, dest_file);
+    ptrdiff_t offset = (gchar *)pointer - file->blob->data;
 
     assert(offset >= 0);
-    assert(offset + pointer_size <= table->len);
+    assert(offset + pointer_size <= file->blob->len);
 
     memset(&entry, 0, sizeof entry);
     strncpy(entry.pointer.dest_file, dest_file,
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index a2d20ea..9d95b1d 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -579,7 +579,8 @@ static void nvdimm_build_nvdimm_devices(GSList *device_list, Aml *root_dev)
 }
 
 static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
-                              GArray *table_data, BIOSLinker *linker)
+                              GArray *table_data, BIOSLinker *linker,
+                              GArray *dsm_dma_arrea)
 {
     Aml *ssdt, *sb_scope, *dev, *field;
     int mem_addr_offset, nvdimm_ssdt;
@@ -678,10 +679,11 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
     mem_addr_offset = build_append_named_dword(table_data,
                                                NVDIMM_ACPI_MEM_ADDR);
 
-    bios_linker_loader_alloc(linker, NVDIMM_DSM_MEM_FILE, sizeof(NvdimmDsmIn),
-                             false /* high memory */);
+    bios_linker_loader_alloc(linker,
+                             NVDIMM_DSM_MEM_FILE, dsm_dma_arrea,
+                             sizeof(NvdimmDsmIn), false /* high memory */);
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-                                   NVDIMM_DSM_MEM_FILE, table_data,
+                                   NVDIMM_DSM_MEM_FILE,
                                    table_data->data + mem_addr_offset,
                                    sizeof(uint32_t));
     build_header(linker, table_data,
@@ -691,7 +693,7 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
 }
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-                       BIOSLinker *linker)
+                       BIOSLinker *linker, GArray *dsm_dma_arrea)
 {
     GSList *device_list;
 
@@ -701,6 +703,7 @@ void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
         return;
     }
     nvdimm_build_nfit(device_list, table_offsets, table_data, linker);
-    nvdimm_build_ssdt(device_list, table_offsets, table_data, linker);
+    nvdimm_build_ssdt(device_list, table_offsets, table_data, linker,
+                      dsm_dma_arrea);
     g_slist_free(device_list);
 }
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4fe150a..2d85bc4 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -357,7 +357,7 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
 
-    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, 16,
+    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
                              true /* fseg memory */);
 
     memcpy(&rsdp->signature, "RSD PTR ", sizeof(rsdp->signature));
@@ -370,12 +370,12 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
     /* Address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
                                    ACPI_BUILD_TABLE_FILE,
-                                   rsdp_table, &rsdp->rsdt_physical_address,
+                                   &rsdp->rsdt_physical_address,
                                    sizeof rsdp->rsdt_physical_address);
     rsdp->checksum = 0;
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-                                    rsdp_table, rsdp, sizeof *rsdp,
+                                    rsdp, sizeof *rsdp,
                                     &rsdp->checksum);
 
     return rsdp_table;
@@ -581,7 +581,7 @@ build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt)
     /* DSDT address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    ACPI_BUILD_TABLE_FILE,
-                                   table_data, &fadt->dsdt,
+                                   &fadt->dsdt,
                                    sizeof fadt->dsdt);
 
     build_header(linker, table_data,
@@ -650,7 +650,8 @@ void virt_acpi_build(VirtGuestInfo *guest_info, AcpiBuildTables *tables)
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
 
-    bios_linker_loader_alloc(tables->linker, ACPI_BUILD_TABLE_FILE,
+    bios_linker_loader_alloc(tables->linker,
+                             ACPI_BUILD_TABLE_FILE, tables_blob,
                              64, false /* high memory */);
 
     /*
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e6c390c..5aa70c1 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -315,14 +315,14 @@ build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
     /* FACS address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    ACPI_BUILD_TABLE_FILE,
-                                   table_data, &fadt->firmware_ctrl,
+                                   &fadt->firmware_ctrl,
                                    sizeof fadt->firmware_ctrl);
 
     fadt->dsdt = cpu_to_le32(dsdt);
     /* DSDT address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    ACPI_BUILD_TABLE_FILE,
-                                   table_data, &fadt->dsdt,
+                                   &fadt->dsdt,
                                    sizeof fadt->dsdt);
 
     fadt_setup(fadt, pm);
@@ -2264,13 +2264,13 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
     tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
     tcpa->log_area_start_address = cpu_to_le64(log_area_start_address);
 
-    bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, 1,
+    bios_linker_loader_alloc(linker, ACPI_BUILD_TPMLOG_FILE, tcpalog, 1,
                              false /* high memory */);
 
     /* log area start address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
                                    ACPI_BUILD_TPMLOG_FILE,
-                                   table_data, &tcpa->log_area_start_address,
+                                   &tcpa->log_area_start_address,
                                    sizeof(tcpa->log_area_start_address));
 
     build_header(linker, table_data,
@@ -2449,7 +2449,7 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
 
-    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, 16,
+    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
                              true /* fseg memory */);
 
     memcpy(&rsdp->signature, "RSD PTR ", 8);
@@ -2458,12 +2458,12 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
     /* Address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
                                    ACPI_BUILD_TABLE_FILE,
-                                   rsdp_table, &rsdp->rsdt_physical_address,
+                                   &rsdp->rsdt_physical_address,
                                    sizeof rsdp->rsdt_physical_address);
     rsdp->checksum = 0;
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-                                    rsdp_table, rsdp, sizeof *rsdp,
+                                    rsdp, sizeof *rsdp,
                                     &rsdp->checksum);
 
     return rsdp_table;
@@ -2537,7 +2537,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                                         sizeof(uint32_t));
     ACPI_BUILD_DPRINTF("init ACPI tables\n");
 
-    bios_linker_loader_alloc(tables->linker, ACPI_BUILD_TABLE_FILE,
+    bios_linker_loader_alloc(tables->linker,
+                             ACPI_BUILD_TABLE_FILE, tables_blob,
                              64 /* Ensure FACS is aligned */,
                              false /* high memory */);
 
@@ -2594,7 +2595,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         build_dmar_q35(tables_blob, tables->linker);
     }
     if (pcms->acpi_nvdimm_state.is_enabled) {
-        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker);
+        nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
+                          pcms->acpi_nvdimm_state.dsm_mem);
     }
 
     /* Add tables supplied by user (if any) */
-- 
MST


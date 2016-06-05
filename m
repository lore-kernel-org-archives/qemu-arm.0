Received: by 10.25.27.66 with SMTP id b63csp1072407lfb;
        Sun, 5 Jun 2016 06:49:43 -0700 (PDT)
X-Received: by 10.55.161.204 with SMTP id k195mr11995106qke.193.1465134583616;
        Sun, 05 Jun 2016 06:49:43 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3si4348599qtv.128.2016.06.05.06.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Jun 2016 06:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37253 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9YQw-0005Hb-OB
	for alex.bennee@linaro.org; Sun, 05 Jun 2016 09:49:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52664)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1b9Y0O-0003TU-6H
	for qemu-devel@nongnu.org; Sun, 05 Jun 2016 09:22:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1b9Y0L-00052y-4q
	for qemu-devel@nongnu.org; Sun, 05 Jun 2016 09:22:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1b9Y0A-00051c-TF; Sun, 05 Jun 2016 09:22:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8243983F46;
	Sun,  5 Jun 2016 13:22:02 +0000 (UTC)
Received: from redhat.com (vpn1-7-180.ams2.redhat.com [10.36.7.180])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u55DLwsB017267; Sun, 5 Jun 2016 09:21:59 -0400
Date: Sun, 5 Jun 2016 16:21:58 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1465132825-14242-22-git-send-email-mst@redhat.com>
References: <1465132825-14242-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465132825-14242-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sun, 05 Jun 2016 13:22:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 21/25] acpi: make
 bios_linker_loader_add_pointer() API offset based
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rTXXw9fycPrC

From: Igor Mammedov <imammedo@redhat.com>

cleanup bios_linker_loader_add_pointer() API by switching
arguments to taking offsets relative to corresponding files
instead of doing pointer arithmetic on behalf of user which
were confusing.

Also make offset inside of source file explicit in API
so that user won't have to manually set it in
destination file blob and while at it add additional
boundary checks.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/bios-linker-loader.h |  5 ++--
 hw/acpi/aml-build.c                  | 20 ++++++++------
 hw/acpi/bios-linker-loader.c         | 53 ++++++++++++++++++++----------------
 hw/acpi/nvdimm.c                     |  7 ++---
 hw/arm/virt-acpi-build.c             | 26 +++++++++---------
 hw/i386/acpi-build.c                 | 45 +++++++++++++++---------------
 6 files changed, 82 insertions(+), 74 deletions(-)

diff --git a/include/hw/acpi/bios-linker-loader.h b/include/hw/acpi/bios-linker-loader.h
index 564e192..f666b7c 100644
--- a/include/hw/acpi/bios-linker-loader.h
+++ b/include/hw/acpi/bios-linker-loader.h
@@ -22,9 +22,10 @@ void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file,
 
 void bios_linker_loader_add_pointer(BIOSLinker *linker,
                                     const char *dest_file,
+                                    uint32_t dst_patched_offset,
+                                    uint8_t dst_patched_size,
                                     const char *src_file,
-                                    void *pointer,
-                                    uint8_t pointer_size);
+                                    uint32_t src_offset);
 
 void bios_linker_loader_cleanup(BIOSLinker *linker);
 #endif
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 66e9bf8..a17bf7c 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1559,21 +1559,23 @@ void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id)
 {
-    AcpiRsdtDescriptorRev1 *rsdt;
-    size_t rsdt_len;
     int i;
-    const int table_data_len = (sizeof(uint32_t) * table_offsets->len);
+    unsigned rsdt_entries_offset;
+    AcpiRsdtDescriptorRev1 *rsdt;
+    const unsigned table_data_len = (sizeof(uint32_t) * table_offsets->len);
+    const unsigned rsdt_entry_size = sizeof(rsdt->table_offset_entry[0]);
+    const size_t rsdt_len = sizeof(*rsdt) + table_data_len;
 
-    rsdt_len = sizeof(*rsdt) + table_data_len;
     rsdt = acpi_data_push(table_data, rsdt_len);
-    memcpy(rsdt->table_offset_entry, table_offsets->data, table_data_len);
+    rsdt_entries_offset = (char *)rsdt->table_offset_entry - table_data->data;
     for (i = 0; i < table_offsets->len; ++i) {
+        uint32_t ref_tbl_offset = g_array_index(table_offsets, uint32_t, i);
+        uint32_t rsdt_entry_offset = rsdt_entries_offset + rsdt_entry_size * i;
+
         /* rsdt->table_offset_entry to be filled by Guest linker */
         bios_linker_loader_add_pointer(linker,
-                                       ACPI_BUILD_TABLE_FILE,
-                                       ACPI_BUILD_TABLE_FILE,
-                                       &rsdt->table_offset_entry[i],
-                                       sizeof(uint32_t));
+            ACPI_BUILD_TABLE_FILE, rsdt_entry_offset, rsdt_entry_size,
+            ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
     }
     build_header(linker, table_data,
                  (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
diff --git a/hw/acpi/bios-linker-loader.c b/hw/acpi/bios-linker-loader.c
index 7a2e4d2..4551c3a 100644
--- a/hw/acpi/bios-linker-loader.c
+++ b/hw/acpi/bios-linker-loader.c
@@ -237,37 +237,38 @@ void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file_name,
 }
 
 /*
- * bios_linker_loader_add_pointer: ask guest to add address of source file
- * into destination file at the specified pointer.
+ * bios_linker_loader_add_pointer: ask guest to patch address in
+ * destination file with a pointer to source file
  *
  * @linker: linker object instance
  * @dest_file: destination file that must be changed
+ * @dst_patched_offset: location within destination file blob to be patched
+ *                      with the pointer to @src_file+@src_offset (i.e. source
+ *                      blob allocated in guest memory + @src_offset), in bytes
+ * @dst_patched_offset_size: size of the pointer to be patched
+ *                      at @dst_patched_offset in @dest_file blob, in bytes
  * @src_file: source file who's address must be taken
- * @pointer: location of the pointer to be patched within destination file blob
- * @pointer_size: size of pointer to be patched, in bytes
- *
- * Notes:
- * - @pointer_size bytes must have been pushed into blob associated with
- *   @dest_file and reside at address @pointer.
- * - Guest address is added to initial value at @pointer
- *   into copy of @dest_file in Guest memory.
- *   e.g. to get start of src_file in guest memory, put 0x0 there
- *   to get address of a field at offset 0x10 in src_file, put 0x10 there
- * - Both @dest_file and @src_file must be
- *   loaded into Guest memory using bios_linker_loader_alloc
+ * @src_offset: location within source file blob to which
+ *              @dest_file+@dst_patched_offset will point to after
+ *              firmware's executed ADD_POINTER command
  */
 void bios_linker_loader_add_pointer(BIOSLinker *linker,
                                     const char *dest_file,
+                                    uint32_t dst_patched_offset,
+                                    uint8_t dst_patched_size,
                                     const char *src_file,
-                                    void *pointer,
-                                    uint8_t pointer_size)
+                                    uint32_t src_offset)
 {
+    uint64_t le_src_offset;
     BiosLinkerLoaderEntry entry;
-    const BiosLinkerFileEntry *file = bios_linker_find_file(linker, dest_file);
-    ptrdiff_t offset = (gchar *)pointer - file->blob->data;
+    const BiosLinkerFileEntry *dst_file =
+        bios_linker_find_file(linker, dest_file);
+    const BiosLinkerFileEntry *source_file =
+        bios_linker_find_file(linker, src_file);
 
-    assert(offset >= 0);
-    assert(offset + pointer_size <= file->blob->len);
+    assert(dst_patched_offset < dst_file->blob->len);
+    assert(dst_patched_offset + dst_patched_size <= dst_file->blob->len);
+    assert(src_offset < source_file->blob->len);
 
     memset(&entry, 0, sizeof entry);
     strncpy(entry.pointer.dest_file, dest_file,
@@ -275,10 +276,14 @@ void bios_linker_loader_add_pointer(BIOSLinker *linker,
     strncpy(entry.pointer.src_file, src_file,
             sizeof entry.pointer.src_file - 1);
     entry.command = cpu_to_le32(BIOS_LINKER_LOADER_COMMAND_ADD_POINTER);
-    entry.pointer.offset = cpu_to_le32(offset);
-    entry.pointer.size = pointer_size;
-    assert(pointer_size == 1 || pointer_size == 2 ||
-           pointer_size == 4 || pointer_size == 8);
+    entry.pointer.offset = cpu_to_le32(dst_patched_offset);
+    entry.pointer.size = dst_patched_size;
+    assert(dst_patched_size == 1 || dst_patched_size == 2 ||
+           dst_patched_size == 4 || dst_patched_size == 8);
+
+    le_src_offset = cpu_to_le64(src_offset);
+    memcpy(dst_file->blob->data + dst_patched_offset,
+           &le_src_offset, dst_patched_size);
 
     g_array_append_vals(linker->cmd_blob, &entry, sizeof entry);
 }
diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index 9d95b1d..b4c2262 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -682,10 +682,9 @@ static void nvdimm_build_ssdt(GSList *device_list, GArray *table_offsets,
     bios_linker_loader_alloc(linker,
                              NVDIMM_DSM_MEM_FILE, dsm_dma_arrea,
                              sizeof(NvdimmDsmIn), false /* high memory */);
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-                                   NVDIMM_DSM_MEM_FILE,
-                                   table_data->data + mem_addr_offset,
-                                   sizeof(uint32_t));
+    bios_linker_loader_add_pointer(linker,
+        ACPI_BUILD_TABLE_FILE, mem_addr_offset, sizeof(uint32_t),
+        NVDIMM_DSM_MEM_FILE, 0);
     build_header(linker, table_data,
         (void *)(table_data->data + nvdimm_ssdt),
         "SSDT", table_data->len - nvdimm_ssdt, 1, NULL, "NVDIMM");
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 2d85bc4..1e37681 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -353,9 +353,12 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
 /* RSDP */
 static GArray *
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
+    unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
+    unsigned rsdt_pa_offset =
+        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
 
     bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
                              true /* fseg memory */);
@@ -365,13 +368,11 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
     rsdp->length = cpu_to_le32(sizeof(*rsdp));
     rsdp->revision = 0x02;
 
-    /* Point to RSDT */
-    rsdp->rsdt_physical_address = cpu_to_le32(rsdt);
     /* Address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
-                                   ACPI_BUILD_TABLE_FILE,
-                                   &rsdp->rsdt_physical_address,
-                                   sizeof rsdp->rsdt_physical_address);
+    bios_linker_loader_add_pointer(linker,
+        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
+        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
+
     rsdp->checksum = 0;
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
@@ -565,9 +566,10 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 
 /* FADT */
 static void
-build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt)
+build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt_tbl_offset)
 {
     AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
+    unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
 
     /* Hardware Reduced = 1 and use PSCI 0.2+ and with HVC */
     fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
@@ -577,12 +579,10 @@ build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt)
     /* ACPI v5.1 (fadt->revision.fadt->minor_revision) */
     fadt->minor_revision = 0x1;
 
-    fadt->dsdt = cpu_to_le32(dsdt);
     /* DSDT address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-                                   ACPI_BUILD_TABLE_FILE,
-                                   &fadt->dsdt,
-                                   sizeof fadt->dsdt);
+    bios_linker_loader_add_pointer(linker,
+        ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->dsdt),
+        ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
 
     build_header(linker, table_data,
                  (void *)fadt, "FACP", sizeof(*fadt), 5, NULL, NULL);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1e8364a..b3ce5be 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -306,26 +306,23 @@ static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
 /* FADT */
 static void
 build_fadt(GArray *table_data, BIOSLinker *linker, AcpiPmInfo *pm,
-           unsigned facs, unsigned dsdt,
+           unsigned facs_tbl_offset, unsigned dsdt_tbl_offset,
            const char *oem_id, const char *oem_table_id)
 {
     AcpiFadtDescriptorRev1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
+    unsigned fw_ctrl_offset = (char *)&fadt->firmware_ctrl - table_data->data;
+    unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
 
-    fadt->firmware_ctrl = cpu_to_le32(facs);
     /* FACS address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-                                   ACPI_BUILD_TABLE_FILE,
-                                   &fadt->firmware_ctrl,
-                                   sizeof fadt->firmware_ctrl);
+    bios_linker_loader_add_pointer(linker,
+        ACPI_BUILD_TABLE_FILE, fw_ctrl_offset, sizeof(fadt->firmware_ctrl),
+        ACPI_BUILD_TABLE_FILE, facs_tbl_offset);
 
-    fadt->dsdt = cpu_to_le32(dsdt);
     /* DSDT address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-                                   ACPI_BUILD_TABLE_FILE,
-                                   &fadt->dsdt,
-                                   sizeof fadt->dsdt);
-
     fadt_setup(fadt, pm);
+    bios_linker_loader_add_pointer(linker,
+        ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->dsdt),
+        ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
 
     build_header(linker, table_data,
                  (void *)fadt, "FACP", sizeof(*fadt), 1, oem_id, oem_table_id);
@@ -2258,6 +2255,9 @@ static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 {
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
+    unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
+    unsigned log_addr_offset =
+        (char *)&tcpa->log_area_start_address - table_data->data;
 
     tcpa->platform_class = cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
     tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
@@ -2267,10 +2267,9 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
                              false /* high memory */);
 
     /* log area start address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_TABLE_FILE,
-                                   ACPI_BUILD_TPMLOG_FILE,
-                                   &tcpa->log_area_start_address,
-                                   sizeof(tcpa->log_area_start_address));
+    bios_linker_loader_add_pointer(linker,
+        ACPI_BUILD_TABLE_FILE, log_addr_offset, log_addr_size,
+        ACPI_BUILD_TPMLOG_FILE, 0);
 
     build_header(linker, table_data,
                  (void *)tcpa, "TCPA", sizeof(*tcpa), 2, NULL, NULL);
@@ -2442,21 +2441,23 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker)
 }
 
 static GArray *
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
+    unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
+    unsigned rsdt_pa_offset =
+        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
 
     bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
                              true /* fseg memory */);
 
     memcpy(&rsdp->signature, "RSD PTR ", 8);
     memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
-    rsdp->rsdt_physical_address = cpu_to_le32(rsdt);
     /* Address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
-                                   ACPI_BUILD_TABLE_FILE,
-                                   &rsdp->rsdt_physical_address,
-                                   sizeof rsdp->rsdt_physical_address);
+    bios_linker_loader_add_pointer(linker,
+        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
+        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
+
     rsdp->checksum = 0;
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-- 
MST


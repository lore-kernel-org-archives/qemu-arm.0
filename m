Received: by 10.25.208.211 with SMTP id h202csp1440153lfg;
        Mon, 7 Mar 2016 07:19:54 -0800 (PST)
X-Received: by 10.140.194.205 with SMTP id p196mr30961198qha.30.1457363990896;
        Mon, 07 Mar 2016 07:19:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j201si17130792qhc.131.2016.03.07.07.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 07:19:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acwwo-000586-8s
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 10:19:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1acwwd-0004ut-IR
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:19:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1acwwT-0005OP-61
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 10:19:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55835)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1acwwS-0005Nr-Rx; Mon, 07 Mar 2016 10:19:29 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 799D28E221;
	Mon,  7 Mar 2016 15:19:28 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u27FJBJ0013702; Mon, 7 Mar 2016 10:19:26 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 16:19:07 +0100
Message-Id: <1457363948-71300-6-git-send-email-imammedo@redhat.com>
In-Reply-To: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
References: <1457363948-71300-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, guangrong.xiao@linux.intel.com,
	ehabkost@redhat.com, mst@redhat.com, qemu-arm@nongnu.org,
	zhaoshenglong@huawei.com, pbonzini@redhat.com
Subject: [Qemu-arm] [PATCH 5/6] acpi: make bios_linker_loader_add_pointer()
	API offset based
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
X-TUID: wH22cPIeY3XT

cleanup bios_linker_loader_add_pointer() API by switching
arguments to taking offsets relative to corresponding files
instead of doing pointer arithmetic on behalf of user which
were confusing.

Also make offset inside of source file explicit in API
so that user won't have to manually set it in
destination file blob and while at it add additional
boundary checks.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/aml-build.c                  | 20 ++++++++------
 hw/acpi/bios-linker-loader.c         | 53 ++++++++++++++++++++----------------
 hw/arm/virt-acpi-build.c             | 26 +++++++++---------
 hw/i386/acpi-build.c                 | 45 +++++++++++++++---------------
 include/hw/acpi/bios-linker-loader.h |  5 ++--
 5 files changed, 79 insertions(+), 70 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index f72b5ef..8fc1ed1 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1493,21 +1493,23 @@ void
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
index a2aeb66..d567362 100644
--- a/hw/acpi/bios-linker-loader.c
+++ b/hw/acpi/bios-linker-loader.c
@@ -238,37 +238,38 @@ void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file_name,
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
@@ -276,10 +277,14 @@ void bios_linker_loader_add_pointer(BIOSLinker *linker,
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
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b0ac70d..e51a06a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -337,9 +337,12 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
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
@@ -349,13 +352,11 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt)
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
@@ -504,9 +505,10 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
 
 /* FADT */
 static void
-build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt)
+build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt_tbl_offset)
 {
     AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
+    unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
 
     /* Hardware Reduced = 1 and use PSCI 0.2+ and with HVC */
     fadt->flags = cpu_to_le32(1 << ACPI_FADT_F_HW_REDUCED_ACPI);
@@ -516,12 +518,10 @@ build_fadt(GArray *table_data, BIOSLinker *linker, unsigned dsdt)
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
index 3540815..ec9f9ae 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -336,26 +336,23 @@ static void fadt_setup(AcpiFadtDescriptorRev1 *fadt, AcpiPmInfo *pm)
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
@@ -2310,6 +2307,9 @@ static void
 build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 {
     Acpi20Tcpa *tcpa = acpi_data_push(table_data, sizeof *tcpa);
+    unsigned log_addr_size = sizeof(tcpa->log_area_start_address);
+    unsigned log_addr_offset =
+        (char *)&tcpa->log_area_start_address - table_data->data;
 
     tcpa->platform_class = cpu_to_le16(TPM_TCPA_ACPI_CLASS_CLIENT);
     tcpa->log_area_minimum_length = cpu_to_le32(TPM_LOG_AREA_MINIMUM_SIZE);
@@ -2319,10 +2319,9 @@ build_tpm_tcpa(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
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
@@ -2511,21 +2510,23 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker)
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
-- 
1.8.3.1


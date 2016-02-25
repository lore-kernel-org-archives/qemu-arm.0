Received: by 10.25.208.211 with SMTP id h202csp2747906lfg;
        Thu, 25 Feb 2016 03:20:33 -0800 (PST)
X-Received: by 10.140.181.130 with SMTP id c124mr58077751qha.75.1456399233475;
        Thu, 25 Feb 2016 03:20:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69si7610587qhp.41.2016.02.25.03.20.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 03:20:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYtyC-0004oE-T7
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 06:20:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aYty5-0004eC-K2
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 06:20:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1aYty4-0005UU-IZ
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 06:20:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1aYty4-0005UM-BN; Thu, 25 Feb 2016 06:20:24 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 06FCF168A06;
	Thu, 25 Feb 2016 11:20:24 +0000 (UTC)
Received: from redhat.com (vpn1-6-57.ams2.redhat.com [10.36.6.57])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u1PBKG5Z003625; Thu, 25 Feb 2016 06:20:18 -0500
Date: Thu, 25 Feb 2016 13:20:16 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1456399032-6172-2-git-send-email-mst@redhat.com>
References: <1456399032-6172-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456399032-6172-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 25 Feb 2016 11:20:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-arm] [PULL v3 01/21] bios-linker-loader: document+validate
	input
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
X-TUID: b2OLnyi1k0RH

While guest/host ABI is documented in hw/acpi/bios-linker-loader.c,
the API was left undocumented.

This adds documentation for all API functions.

Additionally, input is validated to make sure all
pointers fall within range of provided files.

To allow this validation for checksum commands,
bios_linker_loader_add_checksum is changed to accept GArray * in place
of void *.

Reported-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/bios-linker-loader.h |  2 +-
 hw/acpi/aml-build.c                  |  2 +-
 hw/acpi/bios-linker-loader.c         | 91 ++++++++++++++++++++++++++++++++++--
 hw/arm/virt-acpi-build.c             |  3 +-
 hw/i386/acpi-build.c                 |  3 +-
 5 files changed, 92 insertions(+), 9 deletions(-)

diff --git a/include/hw/acpi/bios-linker-loader.h b/include/hw/acpi/bios-linker-loader.h
index 498c0af..e54b6b4 100644
--- a/include/hw/acpi/bios-linker-loader.h
+++ b/include/hw/acpi/bios-linker-loader.h
@@ -13,7 +13,7 @@ void bios_linker_loader_alloc(GArray *linker,
                               bool alloc_fseg);
 
 void bios_linker_loader_add_checksum(GArray *linker, const char *file,
-                                     void *table,
+                                     GArray *table,
                                      void *start, unsigned size,
                                      uint8_t *checksum);
 
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 603068b..6675535 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1451,7 +1451,7 @@ build_header(GArray *linker, GArray *table_data,
     h->checksum = 0;
     /* Checksum to be filled in by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
-                                    table_data->data, h, len, &h->checksum);
+                                    table_data, h, len, &h->checksum);
 }
 
 void *acpi_data_push(GArray *table_data, unsigned size)
diff --git a/hw/acpi/bios-linker-loader.c b/hw/acpi/bios-linker-loader.c
index e04d60a..ace9abb 100644
--- a/hw/acpi/bios-linker-loader.c
+++ b/hw/acpi/bios-linker-loader.c
@@ -25,6 +25,13 @@
 
 #include "qemu/bswap.h"
 
+/*
+ * Linker/loader is a paravirtualized interface that passes commands to guest.
+ * The commands can be used to request guest to
+ * - allocate memory chunks and initialize them from QEMU FW CFG files
+ * - link allocated chunks by storing pointer to one chunk into another
+ * - calculate ACPI checksum of part of the chunk and store into same chunk
+ */
 #define BIOS_LINKER_LOADER_FILESZ FW_CFG_MAX_FILE_PATH
 
 struct BiosLinkerLoaderEntry {
@@ -88,6 +95,12 @@ enum {
     BIOS_LINKER_LOADER_ALLOC_ZONE_FSEG = 0x2,
 };
 
+/*
+ * bios_linker_loader_init: allocate a new linker file blob array.
+ *
+ * After initialization, linker commands can be added, and will
+ * be stored in the array.
+ */
 GArray *bios_linker_loader_init(void)
 {
     return g_array_new(false, true /* clear */, 1);
@@ -99,6 +112,16 @@ void *bios_linker_loader_cleanup(GArray *linker)
     return g_array_free(linker, false);
 }
 
+/*
+ * bios_linker_loader_alloc: ask guest to load file into guest memory.
+ *
+ * @linker: linker file blob array
+ * @file: file to be loaded
+ * @alloc_align: required minimal alignment in bytes. Must be a power of 2.
+ * @alloc_fseg: request allocation in FSEG zone (useful for the RSDP ACPI table)
+ *
+ * Note: this command must precede any other linker command using this file.
+ */
 void bios_linker_loader_alloc(GArray *linker,
                               const char *file,
                               uint32_t alloc_align,
@@ -106,6 +129,8 @@ void bios_linker_loader_alloc(GArray *linker,
 {
     BiosLinkerLoaderEntry entry;
 
+    assert(!(alloc_align & (alloc_align - 1)));
+
     memset(&entry, 0, sizeof entry);
     strncpy(entry.alloc.file, file, sizeof entry.alloc.file - 1);
     entry.command = cpu_to_le32(BIOS_LINKER_LOADER_COMMAND_ALLOCATE);
@@ -118,23 +143,77 @@ void bios_linker_loader_alloc(GArray *linker,
     g_array_prepend_vals(linker, &entry, sizeof entry);
 }
 
+/*
+ * bios_linker_loader_add_checksum: ask guest to add checksum of file data
+ * into (same) file at the specified pointer.
+ *
+ * Checksum calculation simply sums -X for each byte X in the range
+ * using 8-bit math (i.e. ACPI checksum).
+ *
+ * @linker: linker file blob array
+ * @file: file that includes the checksum to be calculated
+ *        and the data to be checksummed
+ * @table: @file blob contents
+ * @start, @size: range of data to checksum
+ * @checksum: location of the checksum to be patched within file blob
+ *
+ * Notes:
+ * - checksum byte initial value must have been pushed into @table
+ *   and reside at address @checksum.
+ * - @size bytes must have been pushed into @table and reside at address
+ *   @start.
+ * - Guest calculates checksum of specified range of data, result is added to
+ *   initial value at @checksum into copy of @file in Guest memory.
+ * - Range might include the checksum itself.
+ * - To avoid confusion, caller must always put 0x0 at @checksum.
+ * - @file must be loaded into Guest memory using bios_linker_loader_alloc
+ */
 void bios_linker_loader_add_checksum(GArray *linker, const char *file,
-                                     void *table,
+                                     GArray *table,
                                      void *start, unsigned size,
                                      uint8_t *checksum)
 {
     BiosLinkerLoaderEntry entry;
+    ptrdiff_t checksum_offset = (gchar *)checksum - table->data;
+    ptrdiff_t start_offset = (gchar *)start - table->data;
+
+    assert(checksum_offset >= 0);
+    assert(start_offset >= 0);
+    assert(checksum_offset + 1 <= table->len);
+    assert(start_offset + size <= table->len);
+    assert(*checksum == 0x0);
 
     memset(&entry, 0, sizeof entry);
     strncpy(entry.cksum.file, file, sizeof entry.cksum.file - 1);
     entry.command = cpu_to_le32(BIOS_LINKER_LOADER_COMMAND_ADD_CHECKSUM);
-    entry.cksum.offset = cpu_to_le32(checksum - (uint8_t *)table);
-    entry.cksum.start = cpu_to_le32((uint8_t *)start - (uint8_t *)table);
+    entry.cksum.offset = cpu_to_le32(checksum_offset);
+    entry.cksum.start = cpu_to_le32(start_offset);
     entry.cksum.length = cpu_to_le32(size);
 
     g_array_append_vals(linker, &entry, sizeof entry);
 }
 
+/*
+ * bios_linker_loader_add_pointer: ask guest to add address of source file
+ * into destination file at the specified pointer.
+ *
+ * @linker: linker file blob array
+ * @dest_file: destination file that must be changed
+ * @src_file: source file who's address must be taken
+ * @table: @dest_file blob contents array
+ * @pointer: location of the pointer to be patched within destination file blob
+ * @pointer_size: size of pointer to be patched, in bytes
+ *
+ * Notes:
+ * - @pointer_size bytes must have been pushed into @table
+ *   and reside at address @pointer.
+ * - Guest address is added to initial value at @pointer
+ *   into copy of @dest_file in Guest memory.
+ *   e.g. to get start of src_file in guest memory, put 0x0 there
+ *   to get address of a field at offset 0x10 in src_file, put 0x10 there
+ * - Both @dest_file and @src_file must be
+ *   loaded into Guest memory using bios_linker_loader_alloc
+ */
 void bios_linker_loader_add_pointer(GArray *linker,
                                     const char *dest_file,
                                     const char *src_file,
@@ -142,7 +221,10 @@ void bios_linker_loader_add_pointer(GArray *linker,
                                     uint8_t pointer_size)
 {
     BiosLinkerLoaderEntry entry;
-    size_t offset = (gchar *)pointer - table->data;
+    ptrdiff_t offset = (gchar *)pointer - table->data;
+
+    assert(offset >= 0);
+    assert(offset + pointer_size <= table->len);
 
     memset(&entry, 0, sizeof entry);
     strncpy(entry.pointer.dest_file, dest_file,
@@ -150,7 +232,6 @@ void bios_linker_loader_add_pointer(GArray *linker,
     strncpy(entry.pointer.src_file, src_file,
             sizeof entry.pointer.src_file - 1);
     entry.command = cpu_to_le32(BIOS_LINKER_LOADER_COMMAND_ADD_POINTER);
-    assert(table->len >= offset + pointer_size);
     entry.pointer.offset = cpu_to_le32(offset);
     entry.pointer.size = pointer_size;
     assert(pointer_size == 1 || pointer_size == 2 ||
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 8cf9a21..b8b3ece 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -359,7 +359,8 @@ build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
     rsdp->checksum = 0;
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-                                    rsdp, rsdp, sizeof *rsdp, &rsdp->checksum);
+                                    rsdp_table, rsdp, sizeof *rsdp,
+                                    &rsdp->checksum);
 
     return rsdp_table;
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4554eb8..52c9470 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2532,7 +2532,8 @@ build_rsdp(GArray *rsdp_table, GArray *linker, unsigned rsdt)
     rsdp->checksum = 0;
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-                                    rsdp, rsdp, sizeof *rsdp, &rsdp->checksum);
+                                    rsdp_table, rsdp, sizeof *rsdp,
+                                    &rsdp->checksum);
 
     return rsdp_table;
 }
-- 
MST


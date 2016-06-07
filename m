Received: by 10.25.27.66 with SMTP id b63csp2011568lfb;
        Tue, 7 Jun 2016 06:34:14 -0700 (PDT)
X-Received: by 10.200.51.89 with SMTP id u25mr21697693qta.58.1465306454585;
        Tue, 07 Jun 2016 06:34:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i207si14007984qke.191.2016.06.07.06.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 06:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAH94-0006wC-1F
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 09:34:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bAGaI-0007mY-Kc
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 08:58:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bAGaF-0003Ep-HY
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 08:58:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1bAGaF-0003Ek-8S; Tue, 07 Jun 2016 08:58:15 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BDE37F6B1;
	Tue,  7 Jun 2016 12:58:14 +0000 (UTC)
Received: from redhat.com (ovpn-116-19.ams2.redhat.com [10.36.116.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u57CwAVa001188; Tue, 7 Jun 2016 08:58:11 -0400
Date: Tue, 7 Jun 2016 15:58:10 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20160607155810-mutt-send-email-mst@redhat.com>
References: <1465304171-10874-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465304171-10874-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 07 Jun 2016 12:58:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 22/25] acpi: make
 bios_linker_loader_add_checksum() API offset based
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3bElkbBnDYaz

From: Igor Mammedov <imammedo@redhat.com>

It should help to make clear that bios_linker works in terms
of offsets within a file. Also it should prevent mistakes
where user passes as arguments pointers to unrelated to file blobs.

While at it, considering that it's a ACPI checksum and
it's initial value must be 0, move checksum field zeroing
into bios_linker_loader_add_checksum() instead of doing it
at every call site manually before bios_linker_loader_add_checksum()
is called.

In addition add extra boundary checks.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/bios-linker-loader.h |  4 ++--
 hw/acpi/aml-build.c                  |  5 +++--
 hw/acpi/bios-linker-loader.c         | 36 +++++++++++++-----------------------
 hw/arm/virt-acpi-build.c             |  5 ++---
 hw/i386/acpi-build.c                 |  5 ++---
 5 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/include/hw/acpi/bios-linker-loader.h b/include/hw/acpi/bios-linker-loader.h
index f666b7c..a05227e 100644
--- a/include/hw/acpi/bios-linker-loader.h
+++ b/include/hw/acpi/bios-linker-loader.h
@@ -17,8 +17,8 @@ void bios_linker_loader_alloc(BIOSLinker *linker,
                               bool alloc_fseg);
 
 void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file,
-                                     void *start, unsigned size,
-                                     uint8_t *checksum);
+                                     unsigned start_offset, unsigned size,
+                                     unsigned checksum_offset);
 
 void bios_linker_loader_add_pointer(BIOSLinker *linker,
                                     const char *dest_file,
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d025837..123160a 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1493,6 +1493,8 @@ build_header(BIOSLinker *linker, GArray *table_data,
              AcpiTableHeader *h, const char *sig, int len, uint8_t rev,
              const char *oem_id, const char *oem_table_id)
 {
+    unsigned tbl_offset = (char *)h - table_data->data;
+    unsigned checksum_offset = (char *)&h->checksum - table_data->data;
     memcpy(&h->signature, sig, 4);
     h->length = cpu_to_le32(len);
     h->revision = rev;
@@ -1513,10 +1515,9 @@ build_header(BIOSLinker *linker, GArray *table_data,
     h->oem_revision = cpu_to_le32(1);
     memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME4, 4);
     h->asl_compiler_revision = cpu_to_le32(1);
-    h->checksum = 0;
     /* Checksum to be filled in by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_TABLE_FILE,
-                                    h, len, &h->checksum);
+        tbl_offset, len, checksum_offset);
 }
 
 void *acpi_data_push(GArray *table_data, unsigned size)
diff --git a/hw/acpi/bios-linker-loader.c b/hw/acpi/bios-linker-loader.c
index 3fb54dc..d963ebe 100644
--- a/hw/acpi/bios-linker-loader.c
+++ b/hw/acpi/bios-linker-loader.c
@@ -189,8 +189,8 @@ void bios_linker_loader_alloc(BIOSLinker *linker,
 }
 
 /*
- * bios_linker_loader_add_checksum: ask guest to add checksum of file data
- * into (same) file at the specified pointer.
+ * bios_linker_loader_add_checksum: ask guest to add checksum of ACPI
+ * table in the specified file at the specified offset.
  *
  * Checksum calculation simply sums -X for each byte X in the range
  * using 8-bit math (i.e. ACPI checksum).
@@ -198,35 +198,25 @@ void bios_linker_loader_alloc(BIOSLinker *linker,
  * @linker: linker object instance
  * @file: file that includes the checksum to be calculated
  *        and the data to be checksummed
- * @start, @size: range of data to checksum
- * @checksum: location of the checksum to be patched within file blob
- *
- * Notes:
- * - checksum byte initial value must have been pushed into blob
- *   associated with @file and reside at address @checksum.
- * - @size bytes must have been pushed into blob associated wtih @file
- *   and reside at address @start.
- * - Guest calculates checksum of specified range of data, result is added to
- *   initial value at @checksum into copy of @file in Guest memory.
- * - Range might include the checksum itself.
- * - To avoid confusion, caller must always put 0x0 at @checksum.
- * - @file must be loaded into Guest memory using bios_linker_loader_alloc
+ * @start_offset, @size: range of data in the file to checksum,
+ *                       relative to the start of file blob
+ * @checksum_offset: location of the checksum to be patched within file blob,
+ *                   relative to the start of file blob
  */
 void bios_linker_loader_add_checksum(BIOSLinker *linker, const char *file_name,
-                                     void *start, unsigned size,
-                                     uint8_t *checksum)
+                                     unsigned start_offset, unsigned size,
+                                     unsigned checksum_offset)
 {
     BiosLinkerLoaderEntry entry;
     const BiosLinkerFileEntry *file = bios_linker_find_file(linker, file_name);
-    ptrdiff_t checksum_offset = (gchar *)checksum - file->blob->data;
-    ptrdiff_t start_offset = (gchar *)start - file->blob->data;
 
-    assert(checksum_offset >= 0);
-    assert(start_offset >= 0);
-    assert(checksum_offset + 1 <= file->blob->len);
+    assert(file);
+    assert(start_offset < file->blob->len);
     assert(start_offset + size <= file->blob->len);
-    assert(*checksum == 0x0);
+    assert(checksum_offset >= start_offset);
+    assert(checksum_offset + 1 <= start_offset + size);
 
+    *(file->blob->data + checksum_offset) = 0;
     memset(&entry, 0, sizeof entry);
     strncpy(entry.cksum.file, file_name, sizeof entry.cksum.file - 1);
     entry.command = cpu_to_le32(BIOS_LINKER_LOADER_COMMAND_ADD_CHECKSUM);
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1cbb496..735ab86 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -374,11 +374,10 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
         ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
         ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
 
-    rsdp->checksum = 0;
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-                                    rsdp, sizeof *rsdp,
-                                    &rsdp->checksum);
+        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
+        (char *)&rsdp->checksum - rsdp_table->data);
 
     return rsdp_table;
 }
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b3ce5be..06d6204 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2458,11 +2458,10 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
         ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
         ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
 
-    rsdp->checksum = 0;
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-                                    rsdp, sizeof *rsdp,
-                                    &rsdp->checksum);
+        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
+        (char *)&rsdp->checksum - rsdp_table->data);
 
     return rsdp_table;
 }
-- 
MST


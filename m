Received: by 10.25.0.6 with SMTP id 6csp446343lfa;
        Wed, 10 May 2017 12:08:23 -0700 (PDT)
X-Received: by 10.55.150.71 with SMTP id y68mr6849380qkd.193.1494443302945;
        Wed, 10 May 2017 12:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494443302; cv=none;
        d=google.com; s=arc-20160816;
        b=JEPUOzpC7mafkJZB6Te4XQJnmxyAHrVhAAeX7WghAIjKc5Y6BbG6b0E5VeU3BXp9fQ
         1LWCcFlk7s4RhQK6w4X+92nWX5/XFHO8zyoB+Qj5x0QiMRd6poH/SMqddVTYq04P+4JB
         yYD5eReDuVKx99xsDe9fSPsj4JpWvrYuapYvxcNwwJJr9ytdEJWQ9a3jqqbjxfT1+4Fs
         PfLERaijxu4Yg7hJ6s934h5LJOxBFEnkSzU+N91Uya/e3jXV/g3d1y7itqFrS+RwvzoH
         0+4F17nRy154UWdZn0Vvj8LsGFs8AfI9Bcn1j0B7rH6v/ygPkkhv+4SoSqvi5d9nk0tu
         l9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=KoegGsTEtRY3DlO7Ej1u0s03H29pxkRTOuAI6NosMKg=;
        b=COJKfZr+LQJ5s6fITHaFxK3sAC4ZNOBqgYxyCnIFNd746YxwoyC5M5ti8/JgGWvdaX
         qYPmla/Vncx5PINsB94syAK54R0GL6JNG4SQTLdQr/Vz6lKe5qFXM9aFiwj4etSPp1DQ
         GfzxjtUrT7PlgVvFAlKWpE1GpULfn1IeyeIjHpMDGlXyh4idhqGjmgV6tbhrnHMIEy5N
         aFLU43ATQKuJ7Br7Dy+09okNkWCrrlnvh6eNC3dTcqwmbhrIdTD8OAVSJtQPcDScnj/O
         OutJqJWzmHKwDCJyQII2uEA1toSUU3LsBa85qgaVrL+em5XNBikOXk2h5N20jv5OpGUd
         5cKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h47si18411qta.167.2017.05.10.12.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 12:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44310 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8WyE-0005NY-8U
	for alex.bennee@linaro.org; Wed, 10 May 2017 15:08:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1d8Wy5-0005Jk-4O
	for qemu-arm@nongnu.org; Wed, 10 May 2017 15:08:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1d8Wy0-0004fO-8m
	for qemu-arm@nongnu.org; Wed, 10 May 2017 15:08:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48420)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1d8Wxz-0004er-WC; Wed, 10 May 2017 15:08:08 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B9BE80C1C;
	Wed, 10 May 2017 19:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0B9BE80C1C
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 0B9BE80C1C
Received: from redhat.com (ovpn-125-116.rdu2.redhat.com [10.10.125.116])
	by smtp.corp.redhat.com (Postfix) with SMTP id 2FA017843E;
	Wed, 10 May 2017 19:08:05 +0000 (UTC)
Date: Wed, 10 May 2017 22:08:04 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1494443192-17177-3-git-send-email-mst@redhat.com>
References: <1494443192-17177-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1494443192-17177-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 10 May 2017 19:08:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 2/9] hw/arm/virt: generate 64-bit addressable ACPI
 objects
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZH3qPLdQq/7H

From: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Our current ACPI table generation code limits the placement of ACPI
tables to 32-bit addressable memory, in order to be able to emit the
root pointer (RSDP) and root table (RSDT) using table types from the
ACPI 1.0 days.

Since ARM was not supported by ACPI before version 5.0, it makes sense
to lift this restriction. This is not crucial for mach-virt, which is
guaranteed to have some memory available below the 4 GB mark, but it
is a nice to have for QEMU machines that do not have any 32-bit
addressable memory, which is not uncommon for real world 64-bit ARM
systems.

Since we already emit a version of the RSDP root pointer that has a
secondary 64-bit wide address field for the 64-bit root table (XSDT),
all we need to do is replace the RSDT generation with the generation
of an XSDT table, and use a different slot in the FADT table to refer
to the DSDT.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Acked-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/acpi/acpi-defs.h | 11 +++++++++++
 include/hw/acpi/aml-build.h |  3 +++
 hw/acpi/aml-build.c         | 27 +++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 26 +++++++++++++-------------
 4 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 93e1eba..91bae7f 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -233,6 +233,17 @@ struct AcpiRsdtDescriptorRev1
 typedef struct AcpiRsdtDescriptorRev1 AcpiRsdtDescriptorRev1;
 
 /*
+ * ACPI 2.0 eXtended System Description Table (XSDT)
+ */
+struct AcpiXsdtDescriptorRev2
+{
+    ACPI_TABLE_HEADER_DEF       /* ACPI common table header */
+    uint64_t table_offset_entry[0];  /* Array of pointers to other */
+    /* ACPI tables */
+} QEMU_PACKED;
+typedef struct AcpiXsdtDescriptorRev2 AcpiXsdtDescriptorRev2;
+
+/*
  * ACPI 1.0 Firmware ACPI Control Structure (FACS)
  */
 struct AcpiFacsDescriptorRev1
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 00c21f1..eb07c2d 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -381,6 +381,9 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
 void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
+void
+build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
+           const char *oem_id, const char *oem_table_id);
 
 int
 build_append_named_dword(GArray *array, const char *name_format, ...)
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index c6f2032..4ddfb68 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1599,6 +1599,33 @@ build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
                  (void *)rsdt, "RSDT", rsdt_len, 1, oem_id, oem_table_id);
 }
 
+/* Build xsdt table */
+void
+build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
+           const char *oem_id, const char *oem_table_id)
+{
+    int i;
+    unsigned xsdt_entries_offset;
+    AcpiXsdtDescriptorRev2 *xsdt;
+    const unsigned table_data_len = (sizeof(uint64_t) * table_offsets->len);
+    const unsigned xsdt_entry_size = sizeof(xsdt->table_offset_entry[0]);
+    const size_t xsdt_len = sizeof(*xsdt) + table_data_len;
+
+    xsdt = acpi_data_push(table_data, xsdt_len);
+    xsdt_entries_offset = (char *)xsdt->table_offset_entry - table_data->data;
+    for (i = 0; i < table_offsets->len; ++i) {
+        uint64_t ref_tbl_offset = g_array_index(table_offsets, uint32_t, i);
+        uint64_t xsdt_entry_offset = xsdt_entries_offset + xsdt_entry_size * i;
+
+        /* xsdt->table_offset_entry to be filled by Guest linker */
+        bios_linker_loader_add_pointer(linker,
+            ACPI_BUILD_TABLE_FILE, xsdt_entry_offset, xsdt_entry_size,
+            ACPI_BUILD_TABLE_FILE, ref_tbl_offset);
+    }
+    build_header(linker, table_data,
+                 (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
+}
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags)
 {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 0835e59..6e5f339 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -364,12 +364,12 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 
 /* RSDP */
 static GArray *
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
-    unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
-    unsigned rsdt_pa_offset =
-        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
+    unsigned xsdt_pa_size = sizeof(rsdp->xsdt_physical_address);
+    unsigned xsdt_pa_offset =
+        (char *)&rsdp->xsdt_physical_address - rsdp_table->data;
 
     bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
                              true /* fseg memory */);
@@ -381,8 +381,8 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
 
     /* Address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
-        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
+        ACPI_BUILD_RSDP_FILE, xsdt_pa_offset, xsdt_pa_size,
+        ACPI_BUILD_TABLE_FILE, xsdt_tbl_offset);
 
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
@@ -659,7 +659,7 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
                        VirtMachineState *vms, unsigned dsdt_tbl_offset)
 {
     AcpiFadtDescriptorRev5_1 *fadt = acpi_data_push(table_data, sizeof(*fadt));
-    unsigned dsdt_entry_offset = (char *)&fadt->dsdt - table_data->data;
+    unsigned xdsdt_entry_offset = (char *)&fadt->x_dsdt - table_data->data;
     uint16_t bootflags;
 
     switch (vms->psci_conduit) {
@@ -685,7 +685,7 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
 
     /* DSDT address to be filled by Guest linker */
     bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_TABLE_FILE, dsdt_entry_offset, sizeof(fadt->dsdt),
+        ACPI_BUILD_TABLE_FILE, xdsdt_entry_offset, sizeof(fadt->x_dsdt),
         ACPI_BUILD_TABLE_FILE, dsdt_tbl_offset);
 
     build_header(linker, table_data,
@@ -748,7 +748,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     GArray *table_offsets;
-    unsigned dsdt, rsdt;
+    unsigned dsdt, xsdt;
     GArray *tables_blob = tables->table_data;
 
     table_offsets = g_array_new(false, true /* clear */,
@@ -788,12 +788,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_iort(tables_blob, tables->linker);
     }
 
-    /* RSDT is pointed to by RSDP */
-    rsdt = tables_blob->len;
-    build_rsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
+    /* XSDT is pointed to by RSDP */
+    xsdt = tables_blob->len;
+    build_xsdt(tables_blob, tables->linker, table_offsets, NULL, NULL);
 
     /* RSDP is in FSEG memory, so allocate it separately */
-    build_rsdp(tables->rsdp, tables->linker, rsdt);
+    build_rsdp(tables->rsdp, tables->linker, xsdt);
 
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
-- 
MST


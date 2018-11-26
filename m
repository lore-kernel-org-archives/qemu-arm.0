Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5810004wrt;
        Mon, 26 Nov 2018 08:37:18 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Xgv7GdW/b5UC4/oGdpP7HoDrT+mmHPyVvoC5lU/FohFDYpYhaN0o5HidUANXPvLA5sUSg1
X-Received: by 2002:ac8:fb4:: with SMTP id b49mr26745787qtk.2.1543250238651;
        Mon, 26 Nov 2018 08:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543250238; cv=none;
        d=google.com; s=arc-20160816;
        b=J0vF6Gak7X6TpTXdtAqB5ZUmA55QWcjWCUrkR3LFN9Y4QGTGLJgv/U+n+M7xBnLFRK
         lHt6o74DbpREaPaJ86u6loywwhlKZ1e8fbbBR2YDRipWXDw3klN8xJeRo2luDyg3KMTO
         SRKdaKv15Hu/VAwBptFJ6546O5n12NTMhZpkKRuRTTioslU4y+EU+5Xy/bwB14+PNAbq
         r/7tcGdijXzujqiGD0r/UVEERkbbkwQLos8bW3+GYOoDSYjpFKe+Ajmw2MWQZfXkBJ/p
         9KAjMkXELA4istvwmfS0XG2MzFlPYIVd54vKczuwRKrHEcF/mmWI966fGTxIq+YUt/F+
         ELmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=sNrdt+giiGB2Dd5joVf1eg7/WR8Zc7R5eKBDlyr+yBw=;
        b=MPzEKMg2yH3KlcfYVfD6F/VCetPBhpaaN+FkCRLNDb3ibn9LdiaayYyV+1AQ5lGOkh
         P+9CO/QuXhr4YZ88GKl6a2tPNbb+RSED73dc9WmB5+FMiZkwPLnt1t3ZhRhsNotzj1LH
         RNg5k/im08mi+STcZk/bAADNyRmwamPhwmZRqtDSGhzN5MRd0udYYQpyaKFYWY9oS8hy
         4/UiDHC1PVinHqToa2t1uHneFSOv44+FsvuD66r/qnKaesx/u3ZcXIQLVC1FoPdZxxfL
         Drpfm+AJGKeCGGh8T60EtbFJ9z3QjrHPgn93XD3wKkvrnnuuBLrM9t5E4/oydImgEWKg
         A9eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si629436qtk.203.2018.11.26.08.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 08:37:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:37546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRJss-0005k6-0k
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 11:37:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJmm-00014E-SC
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 11:31:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gRJmj-0004cn-6f
	for qemu-devel@nongnu.org; Mon, 26 Nov 2018 11:31:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:54537)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gRJmi-0004YC-SS; Mon, 26 Nov 2018 11:30:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Nov 2018 08:30:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,283,1539673200"; d="scan'208";a="90955517"
Received: from sunandos-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.82.176])
	by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2018 08:30:52 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Nov 2018 17:29:40 +0100
Message-Id: <20181126162942.21258-8-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126162942.21258-1-sameo@linux.intel.com>
References: <20181126162942.21258-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: [Qemu-devel] [PATCH 7/8] hw: acpi: Export and share the ARM RSDP
 build
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RdS7e09tN2Cu

Now that build_rsdp() supports building both legacy and current RSDP
tables, we can move it to a generic folder (hw/acpi) and have the i386
ACPI code reuse it in order to reduce code duplication.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/aml-build.h |  5 +++
 hw/acpi/aml-build.c         | 81 +++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 81 -------------------------------------
 hw/i386/acpi-build.c        | 34 ++--------------
 4 files changed, 90 insertions(+), 111 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 6c36903c0a..1bbe496e32 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -388,6 +388,11 @@ void acpi_add_table(GArray *table_offsets, GArray *table_data);
 void acpi_build_tables_init(AcpiBuildTables *tables);
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
 void
+build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data);
+void
+init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
+               unsigned *rsdt_offset, unsigned *xsdt_offset);
+void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
 void
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 1e43cd736d..d4e15980f1 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1589,6 +1589,87 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
     g_array_free(tables->vmgenid, mfre);
 }
 
+/* RSDP */
+void
+build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
+{
+    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
+                             true /* fseg memory */);
+
+    /* RSDP signature */
+    g_array_append_vals(tbl, ACPI_RSDP_SIGNATURE, ACPI_RSDP_SIG_LEN);
+
+    /* Space for the checksum */
+    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
+
+    /* OEM ID */
+    g_array_append_vals(tbl, rsdp_data->oem_id, ACPI_RSDP_OEMID_LEN);
+
+    /* Revision */
+    build_append_int_noprefix(tbl, rsdp_data->revision,
+                              ACPI_RSDP_REVISION_LEN);
+
+    /* Space for the RSDT address (32 bit) */
+    build_append_int_noprefix(tbl, 0, 4);
+
+    if (rsdp_data->rsdt_tbl_offset) {
+        /* RSDT address to be filled by guest linker */
+        bios_linker_loader_add_pointer(linker,
+                                       ACPI_BUILD_RSDP_FILE, 16, 4,
+                                       ACPI_BUILD_TABLE_FILE,
+                                       *rsdp_data->rsdt_tbl_offset);
+    }
+
+    /* Checksum to be filled by guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
+                                    ACPI_RSDP_REV_1_LEN,
+                                    ACPI_RSDP_CHECKSUM_OFFSET);
+
+    if (rsdp_data->revision == ACPI_RSDP_REV_1) {
+        /* Legacy RSDP, we're done */
+        return;
+    }
+
+    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
+    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
+
+    /* Length */
+    build_append_int_noprefix(tbl, ACPI_RSDP_REV_2_LEN, ACPI_RSDP_LEN_LEN);
+
+    /* XSDT address to be filled by guest linker */
+    build_append_int_noprefix(tbl, 0, 8); /* XSDT address (64 bit) */
+    bios_linker_loader_add_pointer(linker,
+                                   ACPI_BUILD_RSDP_FILE,
+                                   ACPI_RSDP_XSDT_OFFSET, 8,
+                                   ACPI_BUILD_TABLE_FILE,
+                                   *rsdp_data->xsdt_tbl_offset);
+
+    /* Space for the extended checksum */
+    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
+
+    /* Space for the reserved bytes */
+    build_append_int_noprefix(tbl, 0, ACPI_RSDP_RESERVED_LEN);
+
+    /* Extended checksum to be filled by Guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
+                                    ACPI_RSDP_REV_2_LEN,
+                                    ACPI_RSDP_EXT_CHECKSUM_OFFSET);
+}
+
+void
+init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
+               unsigned *rsdt_offset, unsigned *xsdt_offset)
+{
+    /* Caller must provide an OEM ID */
+    g_assert(oem_id);
+    g_assert(strlen(oem_id) >= 6);
+
+    memcpy(data->oem_id, oem_id, 6);
+    data->revision = revision;
+    data->rsdt_tbl_offset = rsdt_offset;
+    data->xsdt_tbl_offset = xsdt_offset;
+}
+
 /* Build rsdt table */
 void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 10f8388b63..3fe86fd33e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -366,87 +366,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
     aml_append(scope, dev);
 }
 
-/* RSDP */
-static void
-build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
-{
-    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
-                             true /* fseg memory */);
-
-    /* RSDP signature */
-    g_array_append_vals(tbl, ACPI_RSDP_SIGNATURE, ACPI_RSDP_SIG_LEN);
-
-    /* Space for the checksum */
-    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
-
-    /* OEM ID */
-    g_array_append_vals(tbl, rsdp_data->oem_id, ACPI_RSDP_OEMID_LEN);
-
-    /* Revision */
-    build_append_int_noprefix(tbl, rsdp_data->revision,
-                              ACPI_RSDP_REVISION_LEN);
-
-    /* Space for the RSDT address (32 bit) */
-    build_append_int_noprefix(tbl, 0, 4);
-
-    if (rsdp_data->rsdt_tbl_offset) {
-        /* RSDT address to be filled by guest linker */
-        bios_linker_loader_add_pointer(linker,
-                                       ACPI_BUILD_RSDP_FILE, 16, 4,
-                                       ACPI_BUILD_TABLE_FILE,
-                                       *rsdp_data->rsdt_tbl_offset);
-    }
-
-    /* Checksum to be filled by guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
-                                    ACPI_RSDP_REV_1_LEN,
-                                    ACPI_RSDP_CHECKSUM_OFFSET);
-
-    if (rsdp_data->revision == ACPI_RSDP_REV_1) {
-        /* Legacy RSDP, we're done */
-        return;
-    }
-
-    /* The RSDP revision is 2 and later, we must have an XSDT pointer */
-    g_assert(rsdp_data->xsdt_tbl_offset != NULL);
-
-    /* Length */
-    build_append_int_noprefix(tbl, ACPI_RSDP_REV_2_LEN, ACPI_RSDP_LEN_LEN);
-
-    /* XSDT address to be filled by guest linker */
-    build_append_int_noprefix(tbl, 0, 8); /* XSDT address (64 bit) */
-    bios_linker_loader_add_pointer(linker,
-                                   ACPI_BUILD_RSDP_FILE,
-                                   ACPI_RSDP_XSDT_OFFSET, 8,
-                                   ACPI_BUILD_TABLE_FILE,
-                                   *rsdp_data->xsdt_tbl_offset);
-
-    /* Space for the extended checksum */
-    build_append_int_noprefix(tbl, 0, ACPI_RSDP_CHECKSUM_LEN);
-
-    /* Space for the reserved bytes */
-    build_append_int_noprefix(tbl, 0, ACPI_RSDP_RESERVED_LEN);
-
-    /* Extended checksum to be filled by Guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE, 0,
-                                    ACPI_RSDP_REV_2_LEN,
-                                    ACPI_RSDP_EXT_CHECKSUM_OFFSET);
-}
-
-static void
-init_rsdp_data(AcpiRsdpData *data, const char *oem_id, uint8_t revision,
-               unsigned *rsdt_offset, unsigned *xsdt_offset)
-{
-    /* Caller must provide an OEM ID */
-    g_assert(oem_id);
-    g_assert(strlen(oem_id) >= 6);
-
-    memcpy(data->oem_id, oem_id, 6);
-    data->revision = revision;
-    data->rsdt_tbl_offset = rsdt_offset;
-    data->xsdt_tbl_offset = xsdt_offset;
-}
-
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fb877648ac..f7ab112599 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2547,35 +2547,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
                  "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
 }
 
-static void
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
-{
-    /* AcpiRsdpDescriptor describes revision 2 RSDP table and as result we
-     * allocate extra 16 bytes for pc/q35 RSDP rev1 as well. Keep extra 16 bytes
-     * wasted to make sure we won't breake migration for machine types older
-     * than 2.3 due to size mismatch.
-     */
-    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
-    unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
-    unsigned rsdt_pa_offset =
-        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
-
-    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
-                             true /* fseg memory */);
-
-    memcpy(&rsdp->signature, "RSD PTR ", 8);
-    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
-    /* Address to be filled by Guest linker */
-    bios_linker_loader_add_pointer(linker,
-        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
-        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
-
-    /* Checksum to be filled by Guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
-        (char *)&rsdp->checksum - rsdp_table->data);
-}
-
 typedef
 struct AcpiBuildState {
     /* Copy of table in RAM (for patching). */
@@ -2625,6 +2596,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     GArray *tables_blob = tables->table_data;
     AcpiSlicOem slic_oem = { .id = NULL, .table_id = NULL };
     Object *vmgenid_dev;
+    AcpiRsdpData rsdp;
 
     acpi_get_pm_info(&pm);
     acpi_get_misc_info(&misc);
@@ -2732,7 +2704,9 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                slic_oem.id, slic_oem.table_id);
 
     /* RSDP is in FSEG memory, so allocate it separately */
-    build_rsdp(tables->rsdp, tables->linker, rsdt);
+    init_rsdp_data(&rsdp, ACPI_BUILD_APPNAME6, ACPI_RSDP_REV_1,
+                   &rsdt, NULL);
+    build_rsdp(tables->rsdp, tables->linker, &rsdp);
 
     /* We'll expose it all to Guest so we want to reduce
      * chance of size changes.
-- 
2.19.1


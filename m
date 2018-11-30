Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3557852wrt;
        Fri, 30 Nov 2018 05:10:43 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U74QDVcDBmIQ/g8rKTdjlzZJ9D7Cz45Fv88e8whtAvizGlPj9bZkQqPRar4oYBwWB0ic4C
X-Received: by 2002:a25:2e4b:: with SMTP id b11-v6mr5205047ybn.207.1543583443577;
        Fri, 30 Nov 2018 05:10:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543583443; cv=none;
        d=google.com; s=arc-20160816;
        b=NHbv/JivRa4svGfdruHDFyLKDQm0X4h02jyjDtKjeS6DrC/4tcvLgTFbCAAhlyxANQ
         SwQHqUfiv5COjJkmuORDQtII32trggiuAGhJAWK47OXYKL3MrcVvZBSUAZb3H+dKXlyt
         28v2pL+7FlI/UIsDVpIxR5Y2hk5Xqnxk7bXNt68ryoHrbKBWH2tpFdpGnZQ+xK+G3lHY
         BIxdu7jDOrdSFv9w1fJER22jOSIDFuMJyyQVXPgCOZg5NBFICFsedvEHrsPz5uyrE6ox
         cxtVI0H8oUQXiXeINJzGMEq/nFIJlPVD41KjkMrqw3K+uIujin93FtK3vAEFKcqtWY02
         UR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5SfvQstefcX9iTWKWu3UMedrh8mOVnm0O5Y11MMMc90=;
        b=npVA+YOXp+6/cwbCZEsUCMWYWBM8xk2A+iu/Q0msBEi8HCmWGeIvuNIcpQnpAkqiVr
         Cc2DMrEQI7XTbcVVCA2EtgX6y4oF5NhfLfN6kWI6ERkRocOFb05Zn/2mL+TTCuLi2Q4C
         9x4dJIkP77wqSpqE25YIh3HxZfOXjXg5zh8R8dceWUzcSwNZNgP19wWRRpP+krYEBLdK
         KsQnoW2O1b8uzSQ29RXzAsWEnOax/FFhlt/f1Ov7EWrPpu27OyeuiXZvEaVviM7lXhFX
         SmxmHHBmdlFedwkvAyMe6aR7OtXcF5F61aMQaIvWp6jgKoKjlo8dHypunPFrC7jxKhvM
         TndQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f63si3153524ywd.420.2018.11.30.05.10.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 05:10:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:59950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSiZ8-00040s-UW
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 08:10:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQY-0004Jy-PU
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQT-0005LZ-BV
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:48 -0500
Received: from mga09.intel.com ([134.134.136.24]:51026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSiQR-0004nX-CO; Fri, 30 Nov 2018 08:01:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2018 05:01:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,298,1539673200"; d="scan'208";a="293510229"
Received: from ppkrause-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.84.55])
	by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2018 05:01:37 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 14:00:31 +0100
Message-Id: <20181130130032.11835-8-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181130130032.11835-1-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH v3 7/8] hw: acpi: Export and share the ARM RSDP
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
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oNRSvUOT4EOr

Now that build_rsdp() supports building both legacy and current RSDP
tables, we can move it to a generic folder (hw/acpi) and have the i386
ACPI code reuse it in order to reduce code duplication.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/aml-build.h |  2 ++
 hw/acpi/aml-build.c         | 68 +++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 66 -----------------------------------
 hw/i386/acpi-build.c        | 39 +++++----------------
 4 files changed, 79 insertions(+), 96 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 6c36903c0a..1a563ad756 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -388,6 +388,8 @@ void acpi_add_table(GArray *table_offsets, GArray *table_data);
 void acpi_build_tables_init(AcpiBuildTables *tables);
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
 void
+build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data);
+void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
 void
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 1e43cd736d..555c24f21d 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1589,6 +1589,74 @@ void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre)
     g_array_free(tables->vmgenid, mfre);
 }
 
+/*
+ * ACPI spec 5.2.5.3 Root System Description Pointer (RSDP).
+ * (Revision 1.0 or later)
+ */
+void
+build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
+{
+    int tbl_off = tbl->len; /* Table offset in the RSDP file */
+
+    switch (rsdp_data->revision) {
+    case 0:
+        /* With ACPI 1.0, we must have an RSDT pointer */
+        g_assert(rsdp_data->rsdt_tbl_offset);
+        break;
+    case 2:
+        /* With ACPI 2.0+, we must have an XSDT pointer */
+        g_assert(rsdp_data->xsdt_tbl_offset);
+        break;
+    default:
+        /* Only revisions 0 (ACPI 1.0) and 2 (ACPI 2.0+) are valid for RSDP */
+        g_assert_not_reached();
+    }
+
+    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
+                             true /* fseg memory */);
+
+    g_array_append_vals(tbl, "RSD PTR ", 8); /* Signature */
+    build_append_int_noprefix(tbl, 0, 1); /* Checksum */
+    g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
+    build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
+    build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
+    if (rsdp_data->rsdt_tbl_offset) {
+        /* RSDT address to be filled by guest linker */
+        bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
+                                       tbl_off + 16, 4,
+                                       ACPI_BUILD_TABLE_FILE,
+                                       *rsdp_data->rsdt_tbl_offset);
+    }
+
+    /* Checksum to be filled by guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
+                                    tbl_off, 20, /* ACPI rev 1.0 RSDP size */
+                                    8);
+
+    if (rsdp_data->revision == 0) {
+        /* ACPI 1.0 RSDP, we're done */
+        return;
+    }
+
+    build_append_int_noprefix(tbl, 36, 4); /* Length */
+
+    /* XSDT address to be filled by guest linker */
+    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
+    /* We already validated our xsdt pointer */
+    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
+                                   tbl_off + 24, 8,
+                                   ACPI_BUILD_TABLE_FILE,
+                                   *rsdp_data->xsdt_tbl_offset);
+
+    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
+    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
+
+    /* Extended checksum to be filled by Guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
+                                    tbl_off, 36, /* ACPI rev 2.0 RSDP size */
+                                    32);
+}
+
 /* Build rsdt table */
 void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4b212fa44c..95fad6f0ce 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -366,72 +366,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
     aml_append(scope, dev);
 }
 
-/* RSDP */
-static void
-build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
-{
-
-    int tbl_off = tbl->len; /* Table offset in the RSDP file */
-
-    switch (rsdp_data->revision) {
-    case 0:
-        /* With ACPI 1.0, we must have an RSDT pointer */
-        g_assert(rsdp_data->rsdt_tbl_offset);
-        break;
-    case 2:
-        /* With ACPI 2.0+, we must have an XSDT pointer */
-        g_assert(rsdp_data->xsdt_tbl_offset);
-        break;
-    default:
-        /* Only revisions 0 (ACPI 1.0) and 2 (ACPI 2.0+) are valid for RSDP */
-        g_assert_not_reached();
-    }
-
-    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, tbl, 16,
-                             true /* fseg memory */);
-
-    g_array_append_vals(tbl, "RSD PTR ", 8); /* Signature */
-    build_append_int_noprefix(tbl, 0, 1); /* Checksum */
-    g_array_append_vals(tbl, rsdp_data->oem_id, 6); /* OEMID */
-    build_append_int_noprefix(tbl, rsdp_data->revision, 1); /* Revision */
-    build_append_int_noprefix(tbl, 0, 4); /* RsdtAddress */
-    if (rsdp_data->rsdt_tbl_offset) {
-        /* RSDT address to be filled by guest linker */
-        bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
-                                       tbl_off + 16, 4,
-                                       ACPI_BUILD_TABLE_FILE,
-                                       *rsdp_data->rsdt_tbl_offset);
-    }
-
-    /* Checksum to be filled by guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-                                    tbl_off, 20, /* ACPI rev 1.0 RSDP size */
-                                    8);
-
-    if (rsdp_data->revision == 0) {
-        /* ACPI 1.0 RSDP, we're done */
-        return;
-    }
-
-    build_append_int_noprefix(tbl, 36, 4); /* Length */
-
-    /* XSDT address to be filled by guest linker */
-    build_append_int_noprefix(tbl, 0, 8); /* XsdtAddress */
-    /* We already validated our xsdt pointer */
-    bios_linker_loader_add_pointer(linker, ACPI_BUILD_RSDP_FILE,
-                                   tbl_off + 24, 8,
-                                   ACPI_BUILD_TABLE_FILE,
-                                   *rsdp_data->xsdt_tbl_offset);
-
-    build_append_int_noprefix(tbl, 0, 1); /* Extended Checksum */
-    build_append_int_noprefix(tbl, 0, 3); /* Reserved */
-
-    /* Extended checksum to be filled by Guest linker */
-    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-                                    tbl_off, 36, /* ACPI rev 2.0 RSDP size */
-                                    32);
-}
-
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fb877648ac..528a5fd4ed 100644
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
@@ -2732,7 +2703,15 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
                slic_oem.id, slic_oem.table_id);
 
     /* RSDP is in FSEG memory, so allocate it separately */
-    build_rsdp(tables->rsdp, tables->linker, rsdt);
+    {
+        AcpiRsdpData rsdp_data = {
+            .revision = 0,
+            .oem_id = ACPI_BUILD_APPNAME6,
+            .xsdt_tbl_offset = NULL,
+            .rsdt_tbl_offset = &rsdt,
+        };
+        build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
+    }
 
     /* We'll expose it all to Guest so we want to reduce
      * chance of size changes.
-- 
2.19.2


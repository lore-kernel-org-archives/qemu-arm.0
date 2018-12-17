Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2344949wrt;
        Mon, 17 Dec 2018 03:03:58 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XAUloe5VQnuGuAaF0WsHC1ooVfKU0ro8drmG8+DHGIQ2RLZqO66FrFdFGtViOnJyAoFnpa
X-Received: by 2002:ac8:1102:: with SMTP id c2mr13020721qtj.195.1545044638053;
        Mon, 17 Dec 2018 03:03:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545044638; cv=none;
        d=google.com; s=arc-20160816;
        b=xCko+ArhJOe/vDttnanh43TceIu/DgZ148IG4JJVykxBA+lSMWacDXOFRtsJw8II/o
         7UoHSg7usgNkzC94abuRZfs+PR3UWezTevkfHAOyGQqcoyJNuZN3lGH57bijjz7w2oYr
         TrjqpTA71EU0CrzaOFcn0YgtdPGeodRiqXivdVST/fEXWHHgphpnBQlVI+RlBBtEI/Cw
         t+7bpN0Ka+L0jfvrzQljFps7vqRPxh9Etx8IcmNk3TNvSMThZNlyEbTNDurw4oLdzj3e
         PJcDGISRQuvpEdYFoLBAQZfZQaubRsEQ0aWiybU83vkGqC7DDO5KtnRpL8/LoHmwP4JM
         5Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=K4Jt4jGOnNIqEXjK9XhiIVS+0oFbBItBi1eqNJfi4dQ=;
        b=kFIjUpkY0RTdihLNU/8a+i6HajY4rA2xQWFoVpafkH7GZNQDaP8UocSMXTyZRlC5Dj
         P07/Zr3rnmBPK4HKbduszCYOrwVbEwWmYHnYcu4iU2wcrSFuKpxnmes+Uy9xrk8KzKaJ
         XCvq4hG6l+y65ecYdWxJv0goezJTE2qxCrIW7gHNhJNpoFyUe938DkZPD1sjQX7fDu78
         +VsNjAWxvH6nxDiccrC108voI8NcGmAVdzNHiWFuKwRxfDakbXpVRWgupKdJrtg/3AgE
         Z9wBLdiwpyTpjRwBYs7x8fW+IulEVLYlMPZb8e6hoPYh5ocSFaevsx8fVKTveoPP1c43
         5VSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b10si2736163qvt.55.2018.12.17.03.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 03:03:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:45924 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYqgn-0006cP-9t
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 06:03:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqcM-0003HF-GX
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 05:59:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqT2-0003Zg-1X
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 05:49:45 -0500
Received: from mga06.intel.com ([134.134.136.31]:26425)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gYqSz-0003JM-Qv; Mon, 17 Dec 2018 05:49:42 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2018 02:49:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,365,1539673200"; d="scan'208";a="130583688"
Received: from apeskov-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.185])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2018 02:49:37 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Dec 2018 11:48:37 +0100
Message-Id: <20181217104838.18957-8-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181217104838.18957-1-sameo@linux.intel.com>
References: <20181217104838.18957-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH v4 7/8] hw: acpi: Export and share the ARM RSDP
 build
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ewGQXAwgT+IU

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
 hw/arm/virt-acpi-build.c    | 65 -----------------------------------
 hw/i386/acpi-build.c        | 49 +++++++++++---------------
 4 files changed, 89 insertions(+), 95 deletions(-)

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
index 05f6654371..95fad6f0ce 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -366,71 +366,6 @@ static void acpi_dsdt_add_power_button(Aml *scope)
     aml_append(scope, dev);
 }
 
-/* RSDP */
-static void
-build_rsdp(GArray *tbl, BIOSLinker *linker, AcpiRsdpData *rsdp_data)
-{
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
index fb877648ac..846cb6d755 100644
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
@@ -2732,7 +2703,25 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
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
+        if (!pcmc->rsdp_in_ram) {
+            /*
+             * Legacy machine types (2.2 and older) expect to get a complete
+             * revision 2 RSDP table, even though they only look at the
+             * revision 0 fields (xsdt pointer is not set). So in order to
+             * not break migration to those machine types we waste 16 bytes
+             * that we amend to the RSDP revision 0 structure.
+             */
+            build_append_int_noprefix(tables->rsdp, 0, 16);
+        }
+    }
 
     /* We'll expose it all to Guest so we want to reduce
      * chance of size changes.
-- 
2.19.2


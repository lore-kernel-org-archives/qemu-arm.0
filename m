Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp623159wro;
        Thu, 1 Nov 2018 03:27:17 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fzUEbTY/cAAsbgbMTj5tstS/HLY56mEZsFF1jznr2bXvaexkUHkUf1ZVcZGyTqO3JhIyZ1
X-Received: by 2002:aed:20e7:: with SMTP id 94-v6mr6034801qtb.296.1541068037700;
        Thu, 01 Nov 2018 03:27:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541068037; cv=none;
        d=google.com; s=arc-20160816;
        b=WImkDhEcUMYuaLZ9LP61znBGIbonWZeBwvRDLOheIRYhsrG7AwWrY0v/r23c/Tdh3H
         tVcrAt4d/7j10kqk8+aKEYcvawe+FIC6X1jTNCspiYoiVuW4A8jrCdoWRHGn3sN+l5PR
         yVSczQRL6yeet27ciRveO1dKtaw8yHHy0xdllk+HXT4HAlZfcwOl+9RTxBlpSVOJn/Lb
         punwfwvEJt0+y/kTn1axuKZZC3gtfXx9TOcBIgeM0gJbUZ5VQ1/Aa9l0tSC4nZ6ARHzP
         FAuElN2r/d1Zak4bWx3RHI3Nr2w+7CQsPkuWgcpuNUK3DxqThmaiSwIzSnuci/9mtgAh
         FQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=VgaNjJFc2BeB2PyaBFmk4vPuMIYdeqIjTAyZb+B2moE=;
        b=wDdASZRVfh70jhEopDIqML7TUVEFMmkH9tK6T6ABtx/sRVU7Gtl8HrAPnjSjKwqvAE
         E5BKPBk010iCUisgcs+bXWWkRizvv7Uw1xNzieiGE+4PIfFX5775EMFlAaKBrCx+k1VH
         WfyiJqj67p6rQG+HdPtpgl5gx46BmtqKnEafJzLozDUVrATmXwBFR4UcYRCebDzu9kmy
         y07AblCbOeiLdAlXZTRvrYuKPw8Qn7deHjTv6RNoq8/ALAApzT9t8TPmhv7Ud+je5Tp9
         zSpPg/kLh0J77nVz9B0I0yoBorjsYIm1y5PvYd/vt0HV6jsRYVH2El7+NK7Y+fbkh4Ev
         VwQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18si3621331qvk.157.2018.11.01.03.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 03:27:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:41076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIAC5-0006os-3k
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 06:27:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gIA8z-00047A-I9
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 06:24:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gIA8y-0002up-Hd
	for qemu-devel@nongnu.org; Thu, 01 Nov 2018 06:24:05 -0400
Received: from mga17.intel.com ([192.55.52.151]:61500)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gIA8y-0002qQ-5O; Thu, 01 Nov 2018 06:24:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2018 03:24:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,451,1534834800"; d="scan'208";a="87785914"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.9.87])
	by orsmga006.jf.intel.com with ESMTP; 01 Nov 2018 03:23:58 -0700
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Nov 2018 11:22:43 +0100
Message-Id: <20181101102303.16439-4-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181101102303.16439-1-sameo@linux.intel.com>
References: <20181101102303.16439-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-devel] [PATCH v4 03/23] hw: acpi: Export the RSDP build API
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>,
	"open list:ARM ACPI Subsystem" <qemu-arm@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oce/ZcdTJ/Ka

The hardware-reduced API will need to build RSDP as well, so we should
export this routine. While doing so, we also slightly change the
function prototype. Since no caller needs it, and to make it more
consistent with the rest of the AML build API, the function no longer
returns its RSDP table.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/acpi/aml-build.c         | 24 ++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    |  2 +-
 hw/i386/acpi-build.c        | 26 --------------------------
 include/hw/acpi/aml-build.h |  3 +++
 4 files changed, 28 insertions(+), 27 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 51b608432f..2d6f538f9d 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1651,6 +1651,30 @@ build_xsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
                  (void *)xsdt, "XSDT", xsdt_len, 1, oem_id, oem_table_id);
 }
 
+void
+build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
+{
+    AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
+    unsigned rsdt_pa_size = sizeof(rsdp->rsdt_physical_address);
+    unsigned rsdt_pa_offset =
+        (char *)&rsdp->rsdt_physical_address - rsdp_table->data;
+
+    bios_linker_loader_alloc(linker, ACPI_BUILD_RSDP_FILE, rsdp_table, 16,
+                             true /* fseg memory */);
+
+    memcpy(&rsdp->signature, "RSD PTR ", 8);
+    memcpy(rsdp->oem_id, ACPI_BUILD_APPNAME6, 6);
+    /* Address to be filled by Guest linker */
+    bios_linker_loader_add_pointer(linker,
+        ACPI_BUILD_RSDP_FILE, rsdt_pa_offset, rsdt_pa_size,
+        ACPI_BUILD_TABLE_FILE, rsdt_tbl_offset);
+
+    /* Checksum to be filled by Guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
+        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
+        (char *)&rsdp->checksum - rsdp_table->data);
+}
+
 void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
                        uint64_t len, int node, MemoryAffinityFlags flags)
 {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f28a2faa53..0ed132b79b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -367,7 +367,7 @@ static void acpi_dsdt_add_power_button(Aml *scope)
 }
 
 /* RSDP */
-static GArray *
+static void
 build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
 {
     AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 81d98fa34f..d7b47e05b5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2513,32 +2513,6 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker)
                  "IVRS", table_data->len - iommu_start, 1, NULL, NULL);
 }
 
-static GArray *
-build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned rsdt_tbl_offset)
-{
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
-        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
-        (char *)&rsdp->checksum - rsdp_table->data);
-
-    return rsdp_table;
-}
-
 static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
 {
     Object *pci_host;
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 73fc6659f2..c9bcb32d81 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -390,6 +390,9 @@ void acpi_add_table(GArray *table_offsets, GArray *table_data);
 void acpi_build_tables_init(AcpiBuildTables *tables);
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
 void
+build_rsdp(GArray *table_data,
+           BIOSLinker *linker, unsigned rsdt_tbl_offset);
+void
 build_rsdt(GArray *table_data, BIOSLinker *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
 void
-- 
2.19.1


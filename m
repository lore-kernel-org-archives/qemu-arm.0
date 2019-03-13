Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1224507wrs;
        Tue, 12 Mar 2019 21:48:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxv9OB6JN3yCEdO0o/6nhRxXacsBRWOFbKrsh088isnRqxFkyCItnLXXoO6Zi0IIlcVQM2Y
X-Received: by 2002:a5b:344:: with SMTP id q4mr8677091ybp.248.1552452495509;
        Tue, 12 Mar 2019 21:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552452495; cv=none;
        d=google.com; s=arc-20160816;
        b=rObgTfH5zizI9VnOqlgFo+jjoxEajHpY3Mkb40o7gUzKANBZLEcpuhdyEAlouksO9H
         vtFP9MZqHh8tRFJblJTs7iuX/DzpWgfAYWpfQxZttu7LxjXhufCl+1RHLDt17QwYNJaB
         9XKQKiTNqq5oXQBT2GYx0hQ1HKhlghMcvw7gf8sWrhj48h1gLCNpVFI/TP0eGQolk7Ew
         VCHAn3TeQ1CdItY18RQHHH+Mwuem2gQ7Cg6ya2J4iy7KGz678RwfGd5p2y3z0YHIXQMi
         drM2ZgpWHmut4Nze0/AU90rWR1IURoi7zCg2HLI5BRZAvBGP01Clhrpundwa/49m0DHN
         gQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=CkZjvPpCidol2NUBZ55cxFMf0g3s7EI0q+vERVC3QaY=;
        b=NkmLfwUe6QPIPTHcwrzP23tm+DTSidqVdkORxB3KgZCB2dw660dH+g0QlKGNj1y7MT
         zn7S7+BPQ8Qa4V5kZSO2wnmSOl0sKJOFLSLP1inH0DT21vv8qAUyvH13fRdadig6PwIU
         54YtGR2acB5JjnSxB/JLB4z8dzC4xcLd3U3R62Z838gV/WR9EJLXGaMInOvUlQFzv97m
         LvHIx8HLWqaPcusdTPYt9etPE4ngffSY11S3cYIA//hYr4RWZe1xkrmLmuZmuQYqHRjB
         Qni30+ktolXpVW3SpIMNl0LfZ27BIscQqtCpQ9png6rCVQiFerlrNOYF2CKh5Hjb2nUy
         Z93g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62si5827977ybv.364.2019.03.12.21.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 21:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:38264 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3voM-0006Is-TU
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 00:48:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3vkG-0003Ny-PD
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 00:44:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3vkF-0003cI-3n
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 00:44:00 -0400
Received: from mga17.intel.com ([192.55.52.151]:13008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h3vkE-0003as-PP; Wed, 13 Mar 2019 00:43:59 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2019 21:43:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,473,1544515200"; d="scan'208";a="131180366"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2019 21:43:56 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 13 Mar 2019 12:42:53 +0800
Message-Id: <20190313044253.31988-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190313044253.31988-1-richardw.yang@linux.intel.com>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-devel] [RFC PATCH 3/3] hw/acpi: Extract build_mcfg
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
Cc: peter.maydell@linaro.org, mst@redhat.com, shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NCIltdo3Htpe

Now we have two identical build_mcfg function.

Extract them to aml-build.c.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 16 ----------------
 hw/i386/acpi-build.c        | 31 +------------------------------
 include/hw/acpi/aml-build.h |  1 +
 4 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 555c24f21d..58d3b8f31d 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -25,6 +25,7 @@
 #include "qemu/bswap.h"
 #include "qemu/bitops.h"
 #include "sysemu/numa.h"
+#include "hw/pci/pcie_host.h"
 
 static GArray *build_alloc_array(void)
 {
@@ -1870,3 +1871,32 @@ build_hdr:
     build_header(linker, tbl, (void *)(tbl->data + fadt_start),
                  "FACP", tbl->len - fadt_start, f->rev, oem_id, oem_table_id);
 }
+
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
+{
+    AcpiTableMcfg *mcfg;
+    const char *sig;
+    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
+
+    mcfg = acpi_data_push(table_data, len);
+    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
+    /* Only a single allocation so no need to play with segments */
+    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
+    mcfg->allocation[0].start_bus_number = 0;
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
+
+    /*
+     * MCFG is used for ECAM which can be enabled or disabled by guest.
+     * To avoid table size changes (which create migration issues),
+     * always create the table even if there are no allocations,
+     * but set the signature to a reserved value in this case.
+     * ACPI spec requires OSPMs to ignore such tables.
+     */
+    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
+        /* Reserved signature: ignored by OSPM */
+        sig = "QEMU";
+    } else {
+        sig = "MCFG";
+    }
+    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
+}
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ae7858a79a..92d8fccb00 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -557,22 +557,6 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
     return true;
 }
 
-static void
-build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
-{
-    AcpiTableMcfg *mcfg;
-    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
-
-    mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
-    /* Only a single allocation so no need to play with segments */
-    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
-    mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
-
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
-}
-
 /* GTDT */
 static void
 build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c5b1c3be99..b537a39d42 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2392,35 +2392,6 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
                  table_data->len - srat_start, 1, NULL, NULL);
 }
 
-static void
-build_mcfg_q35(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
-{
-    AcpiTableMcfg *mcfg;
-    const char *sig;
-    int len = sizeof(*mcfg) + 1 * sizeof(mcfg->allocation[0]);
-
-    mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
-    /* Only a single allocation so no need to play with segments */
-    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
-    mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
-
-    /* MCFG is used for ECAM which can be enabled or disabled by guest.
-     * To avoid table size changes (which create migration issues),
-     * always create the table even if there are no allocations,
-     * but set the signature to a reserved value in this case.
-     * ACPI spec requires OSPMs to ignore such tables.
-     */
-    if (info->mcfg_base == PCIE_BASE_ADDR_UNMAPPED) {
-        /* Reserved signature: ignored by OSPM */
-        sig = "QEMU";
-    } else {
-        sig = "MCFG";
-    }
-    build_header(linker, table_data, (void *)mcfg, sig, len, 1, NULL, NULL);
-}
-
 /*
  * VT-d spec 8.1 DMA Remapping Reporting Structure
  * (version Oct. 2014 or later)
@@ -2687,7 +2658,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     }
     if (acpi_get_mcfg(&mcfg)) {
         acpi_add_table(table_offsets, tables_blob);
-        build_mcfg_q35(tables_blob, tables->linker, &mcfg);
+        build_mcfg(tables_blob, tables->linker, &mcfg);
     }
     if (x86_iommu_get_default()) {
         IommuType IOMMUType = x86_iommu_get_type();
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index b63b85d67c..8f2ea3679f 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -423,4 +423,5 @@ void build_slit(GArray *table_data, BIOSLinker *linker);
 
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
+void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
 #endif
-- 
2.19.1


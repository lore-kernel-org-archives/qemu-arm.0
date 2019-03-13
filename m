Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1222163wrs;
        Tue, 12 Mar 2019 21:44:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeXutfE4NzMN/6yn5Tf2c81Ze9lmDuP2LqghH3RwArwzOs96vq5+u4MqCTQHMDbFt0jFg1
X-Received: by 2002:a81:5288:: with SMTP id g130mr8738727ywb.375.1552452295994;
        Tue, 12 Mar 2019 21:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552452295; cv=none;
        d=google.com; s=arc-20160816;
        b=AHuNpVxI/7sH/xq9v8gcAEjfencrlQL+LOHYvI1HUYl6+TzY/+UiCeZh3sfoIf23/b
         EPeY4A10bLheC7UV3KyMPotWHZwTz4XE1URDfKX05Ym6t2S9uQWgzc52igRpAfloOoU4
         KFa1XARBSbzbwQ6HBBznT8rqZapcEmsqCOjauAW2v5XU7Ij+08Z2KeEma8VlWQ9vFlkD
         AX8xNPl5AXeRY7B/pGgVG34wCpdJltxOoddgDYXOWB5sd6i+mdYzGkMai8StMq0HLcs0
         RC7svyCmdkZmFGhZ32TUuVHdt4k+TvHVNMXkvJWjAytgnQAcEeiX7V8i2kBo1T9Xa6Ec
         Jy9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=TrKzDDK8ugAsrRbWtbZtPg6fF+kXPe8wvdBs79ccLnA=;
        b=INM9tvArguh6tZvh4v9wSMYoMVeq3b2JUtOrlrI0gVMJIks16N83BxHYjkzVK5VxVr
         G4iPnViPhrWZYDtr29x/iDu+FEhIWZ3HNz47h1LqsukCf7Cj2Hm40e8HMQAq0AR72IoO
         NtoFa3iN0/FAlqCs+4mAumPjRFpbyGogO76Z0Jww2/W5HBso4gE+Gp9633YLMVjepdxM
         mFJg8D94IA07Q1/8vrKTnTL3mD9I8XZax5E6I0NZHskfOgLKatWJhdZvT8tSH+MkwE9i
         9zZSoOVCYts4SrO7H9Xe0mnArNT4O6TBF7u111au0zdlDX/9hHd366gSsn9IucHAodda
         qW2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f196si4866745yba.442.2019.03.12.21.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 21:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:38200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3vl9-0003Nt-Dl
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 00:44:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3vkC-0003Ka-Qg
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 00:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3vkB-0003Yr-LK
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 00:43:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:13002)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h3vkB-0003X3-9e; Wed, 13 Mar 2019 00:43:55 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2019 21:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,473,1544515200"; d="scan'208";a="131180343"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga008.fm.intel.com with ESMTP; 12 Mar 2019 21:43:52 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 13 Mar 2019 12:42:51 +0800
Message-Id: <20190313044253.31988-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190313044253.31988-1-richardw.yang@linux.intel.com>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-devel] [RFC PATCH 1/3] hw/arm/virt-acpi-build: use
 acpi_get_mcfg() to calculate bus number
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
X-TUID: ztdSvAtRwS3k

To build MCFG, two information is necessary:

    * bus number
    * base address

Abstract these two information to AcpiMcfgInfo so that build_mcfg and
build_mcfg_q35 will have the same declaration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/arm/virt-acpi-build.c    | 28 ++++++++++++++++++++--------
 hw/i386/acpi-build.c        |  5 -----
 include/hw/acpi/aml-build.h |  5 +++++
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 57679a89bf..7713c2d809 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -545,23 +545,32 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                  "SRAT", table_data->len - srat_start, 3, NULL, NULL);
 }
 
-static void
-build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
 {
-    AcpiTableMcfg *mcfg;
+    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
     const MemMapEntry *memmap = vms->memmap;
     int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
+
+    mcfg->mcfg_base = memmap[ecam_id].base;
+    mcfg->mcfg_size = memmap[ecam_id].size;
+
+    return true;
+}
+
+static void
+build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
+{
+    AcpiTableMcfg *mcfg;
     int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
     int mcfg_start = table_data->len;
 
     mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
+    mcfg->allocation[0].address = cpu_to_le64(info->mcfg_base);
 
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number =
-        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->mcfg_size - 1);
 
     build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
                  "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
@@ -779,6 +788,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     GArray *table_offsets;
     unsigned dsdt, xsdt;
+    AcpiMcfgInfo mcfg;
     GArray *tables_blob = tables->table_data;
 
     table_offsets = g_array_new(false, true /* clear */,
@@ -802,8 +812,10 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker, vms);
 
-    acpi_add_table(table_offsets, tables_blob);
-    build_mcfg(tables_blob, tables->linker, vms);
+    if (acpi_get_mcfg(&mcfg)) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_mcfg(tables_blob, tables->linker, &mcfg);
+    }
 
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9ecc96dcc7..c5b1c3be99 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -86,11 +86,6 @@
 /* Default IOAPIC ID */
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
-typedef struct AcpiMcfgInfo {
-    uint64_t mcfg_base;
-    uint32_t mcfg_size;
-} AcpiMcfgInfo;
-
 typedef struct AcpiPmInfo {
     bool s3_disabled;
     bool s4_disabled;
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 1a563ad756..b63b85d67c 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -223,6 +223,11 @@ struct AcpiBuildTables {
     BIOSLinker *linker;
 } AcpiBuildTables;
 
+typedef struct AcpiMcfgInfo {
+    uint64_t mcfg_base;
+    uint32_t mcfg_size;
+} AcpiMcfgInfo;
+
 /**
  * init_aml_allocator:
  *
-- 
2.19.1


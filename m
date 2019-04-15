Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2349613wrx;
        Mon, 15 Apr 2019 00:04:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwr93/+m5AA5cUv/iL3kjGw3j90d0WYdjoIdsR0CzjjbHjFtfkB5FfdfYAyQf1bPwcWqq/W
X-Received: by 2002:adf:f90c:: with SMTP id b12mr21902652wrr.63.1555311864269;
        Mon, 15 Apr 2019 00:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555311864; cv=none;
        d=google.com; s=arc-20160816;
        b=BtIDUoNoYel7YDt3dWKdo1yyrCXi3/uG+6o4SBtN6RVcAYcJI7NwGElC4GrAnr4RN6
         lQuOpqodb5IXPLmCdim5JCRjp/a56Jaw8u6tjhrGA7548HK87m3kL0RXJ48etwpfJSpP
         rtk+29pC+X3HYB8Ta3rKyzKgzcFVQxS/nFn+boOgFI2HnP1HLP1Lj1vI7WMYg2g06fvY
         +h1urpejzzG32pufFe1yuGZyUK75KQlsX3E6HQvkiQSnKaJvMQWFrNmnjQiWs2RpIrEJ
         slKLpoLN5HLGtjZ7RaKDEzjeOlBd1P0tVO1JE7936h0UKrl2QtDv2MBScAs7nd5xF596
         GWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EaNRxyxe/T81bSdHItuVksGAA9zAKEkmw8QGM/6nfhg=;
        b=kfmtuwXOmw574qtSj6uHitDiGqSCN8m7ATLG4BN6vcXLn/5XAox/0G/v04Fjacy4m0
         Ph9Hg2YKpAF8JZfOvnTFtt5ICFdPmUWNIMTjecIqvec5UBMQSeA0TPrAlmPqdJEWDKqp
         Lftu0SBbY0142mSH+sJ7S6qOWoXzKo8pI4g6UbwGlEg+71xxFPgHA0f5SxEBvLAGPD2V
         z8KK6FcVQXgy9LpZAjqj8CcvsiiEdOZ61Yu/G9SbtLKBdf/ohfOi9NEktDrdhbN0nPbG
         847Q0NNSCuLWKVM+txawws0LkPPvBAe2rgMIOCudsbUATBHM2Ham1d/21nB7Pyl34uRL
         5N/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si31579070wrq.166.2019.04.15.00.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 00:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFvfD-0008EH-AA
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 03:04:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hFveq-0008D9-15
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 03:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hFveo-0004FD-1F
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 03:03:59 -0400
Received: from mga06.intel.com ([134.134.136.31]:30998)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hFvek-0004AN-69; Mon, 15 Apr 2019 03:03:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Apr 2019 00:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,352,1549958400"; d="scan'208";a="164783117"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2019 00:03:48 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 15:03:06 +0800
Message-Id: <20190415070307.13668-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190415070307.13668-1-richardw.yang@linux.intel.com>
References: <20190415070307.13668-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH v2 3/4] hw/arm/virt-acpi-build: pass AcpiMcfgInfo
 to build_mcfg()
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qq3fmj/v2hsK

To build MCFG, two information is necessary:

    * bus number
    * base address

Abstract these two information to AcpiMcfgInfo so that build_mcfg and
build_mcfg_q35 will have the same declaration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

---
v2:
  * for arm platform, construct a AcpiMcfgInfo directly
---
 hw/arm/virt-acpi-build.c    | 17 ++++++++++-------
 hw/i386/acpi-build.c        |  5 -----
 include/hw/acpi/aml-build.h |  5 +++++
 3 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index e09e7eff8d..7350f207b5 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -546,21 +546,18 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 }
 
 static void
-build_mcfg(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
+build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
     AcpiTableMcfg *mcfg;
-    const MemMapEntry *memmap = vms->memmap;
-    int ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
     int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
 
     mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(memmap[ecam_id].base);
+    mcfg->allocation[0].address = cpu_to_le64(info->base);
 
     /* Only a single allocation so no need to play with segments */
     mcfg->allocation[0].pci_segment = cpu_to_le16(0);
     mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number =
-        PCIE_MMCFG_BUS(memmap[ecam_id].size - 1);
+    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
 
     build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
 }
@@ -801,7 +798,13 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_gtdt(tables_blob, tables->linker, vms);
 
     acpi_add_table(table_offsets, tables_blob);
-    build_mcfg(tables_blob, tables->linker, vms);
+    {
+        AcpiMcfgInfo mcfg = {
+           .base = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].base,
+           .size = vms->memmap[VIRT_ECAM_ID(vms->highmem_ecam)].size,
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg);
+    }
 
     acpi_add_table(table_offsets, tables_blob);
     build_spcr(tables_blob, tables->linker, vms);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index f0d27bffd6..7613b245cf 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -86,11 +86,6 @@
 /* Default IOAPIC ID */
 #define ACPI_BUILD_IOAPIC_ID 0x0
 
-typedef struct AcpiMcfgInfo {
-    uint64_t base;
-    uint32_t size;
-} AcpiMcfgInfo;
-
 typedef struct AcpiPmInfo {
     bool s3_disabled;
     bool s4_disabled;
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 1a563ad756..22dd593068 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -223,6 +223,11 @@ struct AcpiBuildTables {
     BIOSLinker *linker;
 } AcpiBuildTables;
 
+typedef struct AcpiMcfgInfo {
+    uint64_t base;
+    uint32_t size;
+} AcpiMcfgInfo;
+
 /**
  * init_aml_allocator:
  *
-- 
2.19.1


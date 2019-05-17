Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1262190wrg;
        Thu, 16 May 2019 17:45:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrzXsAnbKkirgxXPWMA7cZmbmNfHB0gDHUfhzuJ1CkeX7M3ImCyyJtnIu++MOPdxrMPvgb
X-Received: by 2002:a50:885b:: with SMTP id c27mr53702799edc.155.1558053952703;
        Thu, 16 May 2019 17:45:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558053952; cv=none;
        d=google.com; s=arc-20160816;
        b=aBqTl3N+z121wWUdBlyD8omEADzPMskef2ALH8uWsUIHKeQfFdJczrgRNOx3YbIQtV
         o3rhjZPOCgVKnHhIurFNTWJS+Lsdo6Nip32FRDRG4HyBmeugD+wh1J14p3H3ZLcIxOtO
         B2A8gWXSr8icE4py/X8+Z1bAzHLuqRp2f8J8XfQgayxlhO41aQK/hwDS9nJtwdx8NFn8
         noQ0UHfml4FgZ3VmXvwLFuYExRnzwBMzus3c96wts27qcPyMXSCEyda/00L4B76DYeUY
         CCUOdyJuGEpYUy1akKgQLz+OOqILeWVqSMvTpBQ7t4TlwP3R8EF1063ZP/tzhnWM5lXK
         9rzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=42vn0liozv1wljVvZYRf0Qb5GrazSegqJKRUct1gqvc=;
        b=jskV2BYhgsn5HZ47ORYgxNmPsqQ8o0mZrgHFjswASE9fOiwPR5lVJrZsM51dzQs39T
         71pVP5hMKPGMu5MhcJsoLQSoo2G1zg34XI7DDM6n1LPpxNSAiXM/HAqkVqCiTr6JzDCg
         VrXYQRXkiNVg5khK7iqYfT4wCXDgO422UX8wpWnHYJiQP6FtYbEurzYH/Ogm02ywxOGG
         B6nKZfJvS8chnjNG6eKxNpOlE+NgiCUQVXEMwAaFluftfqCNaRRIuu7m1vaTDN/7Cf8L
         rPKsPFtSc5XjYiCdt0DtJ5t8jObBfOzjwhBCO8Gk8cUluKm3c1t+a3SYYUpx4u1XYXkX
         ZOXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si185752eds.136.2019.05.16.17.45.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 17:45:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:39019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRR0R-0003aI-Qi
	for alex.bennee@linaro.org; Thu, 16 May 2019 20:45:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRR0D-0003a0-Jz
	for qemu-arm@nongnu.org; Thu, 16 May 2019 20:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hRR0C-0008Sn-Gz
	for qemu-arm@nongnu.org; Thu, 16 May 2019 20:45:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:18973)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hRR0C-0008OP-8X; Thu, 16 May 2019 20:45:36 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2019 17:45:34 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga007.fm.intel.com with ESMTP; 16 May 2019 17:45:32 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 17 May 2019 08:43:24 +0800
Message-Id: <20190517004324.17306-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-arm] [PATCH v2] acpi: pci: use build_append_foo() API to
 construct MCFG
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
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gd/jj7/kqazR

build_append_foo() API doesn't need explicit endianness conversions
which eliminates a source of errors and it makes build_mcfg() look like
declarative definition of MCFG table in ACPI spec, which makes it easy
to review.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Suggested-by: Igor Mammedov <imammedo@redhat.com>

---
v2:
   * miss the reserved[8] of MCFG in last version, add it back
   * drop SOBs and make sure bios-tables-test all OK
---
 hw/acpi/pci.c               | 35 +++++++++++++++++++++++------------
 include/hw/acpi/acpi-defs.h | 18 ------------------
 2 files changed, 23 insertions(+), 30 deletions(-)

diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index fa0fa30bb9..49df7b7d54 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -30,17 +30,28 @@
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info)
 {
-    AcpiTableMcfg *mcfg;
-    int len = sizeof(*mcfg) + sizeof(mcfg->allocation[0]);
-
-    mcfg = acpi_data_push(table_data, len);
-    mcfg->allocation[0].address = cpu_to_le64(info->base);
-
-    /* Only a single allocation so no need to play with segments */
-    mcfg->allocation[0].pci_segment = cpu_to_le16(0);
-    mcfg->allocation[0].start_bus_number = 0;
-    mcfg->allocation[0].end_bus_number = PCIE_MMCFG_BUS(info->size - 1);
-
-    build_header(linker, table_data, (void *)mcfg, "MCFG", len, 1, NULL, NULL);
+    int mcfg_start = table_data->len;
+
+    acpi_data_push(table_data, sizeof(AcpiTableHeader));
+
+    /*
+     * PCI Firmware Specification, Revision 3.0
+     * 4.1.2 MCFG Table Description.
+     */
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 8);
+    /* Base address, processor-relative */
+    build_append_int_noprefix(table_data, info->base, 8);
+    /* PCI segment group number */
+    build_append_int_noprefix(table_data, 0, 2);
+    /* Starting PCI Bus number */
+    build_append_int_noprefix(table_data, 0, 1);
+    /* Final PCI Bus number */
+    build_append_int_noprefix(table_data, PCIE_MMCFG_BUS(info->size - 1), 1);
+    /* Reserved */
+    build_append_int_noprefix(table_data, 0, 4);
+
+    build_header(linker, table_data, (void *)(table_data->data + mcfg_start),
+                 "MCFG", table_data->len - mcfg_start, 1, NULL, NULL);
 }
 
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index f9aa4bd398..57a3f58b0c 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -449,24 +449,6 @@ struct AcpiSratProcessorGiccAffinity {
 
 typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
 
-/* PCI fw r3.0 MCFG table. */
-/* Subtable */
-struct AcpiMcfgAllocation {
-    uint64_t address;                /* Base address, processor-relative */
-    uint16_t pci_segment;            /* PCI segment group number */
-    uint8_t start_bus_number;       /* Starting PCI Bus number */
-    uint8_t end_bus_number;         /* Final PCI Bus number */
-    uint32_t reserved;
-} QEMU_PACKED;
-typedef struct AcpiMcfgAllocation AcpiMcfgAllocation;
-
-struct AcpiTableMcfg {
-    ACPI_TABLE_HEADER_DEF;
-    uint8_t reserved[8];
-    AcpiMcfgAllocation allocation[0];
-} QEMU_PACKED;
-typedef struct AcpiTableMcfg AcpiTableMcfg;
-
 /*
  * TCPA Description Table
  *
-- 
2.19.1


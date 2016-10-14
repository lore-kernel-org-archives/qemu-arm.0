Received: by 10.80.166.35 with SMTP id d32csp166527edc;
        Fri, 14 Oct 2016 01:55:14 -0700 (PDT)
X-Received: by 10.55.75.145 with SMTP id y139mr10352786qka.26.1476435314060;
        Fri, 14 Oct 2016 01:55:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d73si9042566qkc.232.2016.10.14.01.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 14 Oct 2016 01:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46068 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buyGn-0006Cp-J7
	for alex.bennee@linaro.org; Fri, 14 Oct 2016 04:55:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1buyGh-00065a-8O
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 04:55:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1buyGf-0004fy-0r
	for qemu-arm@nongnu.org; Fri, 14 Oct 2016 04:55:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1buyGe-0004fu-NM; Fri, 14 Oct 2016 04:55:04 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BED507DD34;
	Fri, 14 Oct 2016 08:55:03 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-131.ams2.redhat.com
	[10.36.4.131])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9E8svlp031637; Fri, 14 Oct 2016 04:55:01 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	prem.mallappa@broadcom.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Date: Fri, 14 Oct 2016 10:54:54 +0200
Message-Id: <1476435295-21885-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
References: <1476435295-21885-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 14 Oct 2016 08:55:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 1/2] ACPI: Add IORT Structure definition
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
Cc: tn@semihalf.com, drjones@redhat.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YwQL5CInbGfX

From: Prem Mallappa <prem.mallappa@broadcom.com>

ACPI Spec 6.0 introduces IO Remapping Table Structure. This patch
introduces the definitions required to describe the IO relationship
between the PCIe root complex and the ITS.

This conforms to:
"IO Remapping Table System Software on ARM Platforms",
Document number: ARM DEN 0049B, October 2015.

Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- took into account Drew's comments:
  cleanup comments, remove most defines, add ACPI_IORT_NODE_HEADER_DEF
---
 include/hw/acpi/acpi-defs.h | 68 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 9c1b7cb..1cd1e69 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -609,4 +609,72 @@ typedef struct AcpiDmarHardwareUnit AcpiDmarHardwareUnit;
 /* Masks for Flags field above */
 #define ACPI_DMAR_INCLUDE_PCI_ALL   1
 
+/*
+ * Input Output Remapping Table (IORT)
+ * Conforms to "IO Remapping Table System Software on ARM Platforms",
+ * Document number: ARM DEN 0049B, October 2015
+ */
+
+struct AcpiIortTable {
+    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
+    uint32_t node_count;
+    uint32_t node_offset;
+    uint32_t reserved;
+} QEMU_PACKED;
+typedef struct AcpiIortTable AcpiIortTable;
+
+/*
+ * IORT node types
+ */
+
+#define ACPI_IORT_NODE_HEADER_DEF   /* Node format common fields */ \
+    uint8_t  type;          \
+    uint16_t length;        \
+    uint8_t  revision;      \
+    uint32_t reserved;      \
+    uint32_t mapping_count; \
+    uint32_t mapping_offset;\
+
+/* Values for node Type above */
+enum {
+        ACPI_IORT_NODE_ITS_GROUP = 0x00,
+        ACPI_IORT_NODE_NAMED_COMPONENT = 0x01,
+        ACPI_IORT_NODE_PCI_ROOT_COMPLEX = 0x02,
+        ACPI_IORT_NODE_SMMU = 0x03,
+        ACPI_IORT_NODE_SMMU_V3 = 0x04
+};
+
+struct AcpiIortIdMapping {
+    uint32_t input_base;
+    uint32_t id_count;
+    uint32_t output_base;
+    uint32_t output_reference;
+    uint32_t flags;
+} QEMU_PACKED;
+typedef struct AcpiIortIdMapping AcpiIortIdMapping;
+
+struct AcpiIortMemoryAccess {
+    uint32_t cache_coherency;
+    uint8_t  hints;
+    uint16_t reserved;
+    uint8_t  memory_flags;
+} QEMU_PACKED;
+typedef struct AcpiIortMemoryAccess AcpiIortMemoryAccess;
+
+struct AcpiIortItsGroup {
+    ACPI_IORT_NODE_HEADER_DEF
+    uint32_t its_count;
+    uint32_t identifiers[0];
+} QEMU_PACKED;
+typedef struct AcpiIortItsGroup AcpiIortItsGroup;
+
+struct AcpiIortRC {
+    ACPI_IORT_NODE_HEADER_DEF
+    AcpiIortMemoryAccess memory_properties;
+    uint32_t ats_attribute;
+    uint32_t pci_segment_number;
+    AcpiIortIdMapping id_mapping_array[0];
+} QEMU_PACKED;
+typedef struct AcpiIortRC AcpiIortRC;
+
 #endif
-- 
2.5.5


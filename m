Received: by 10.80.166.35 with SMTP id d32csp316605edc;
        Thu, 13 Oct 2016 03:56:03 -0700 (PDT)
X-Received: by 10.55.31.31 with SMTP id f31mr5502700qkf.245.1476356163683;
        Thu, 13 Oct 2016 03:56:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 97si6081641qtg.153.2016.10.13.03.56.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 03:56:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39341 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1budgB-0006Vu-3S
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 06:56:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1budg1-0006R7-K5
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 06:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1budfz-0000fs-OD
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 06:55:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37266)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1budfz-0000fY-EM; Thu, 13 Oct 2016 06:55:51 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6E924DD4A;
	Thu, 13 Oct 2016 10:55:50 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-197.ams2.redhat.com
	[10.36.7.197])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9DAtjdH001541; Thu, 13 Oct 2016 06:55:48 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	prem.mallappa@broadcom.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, shannon.zhao@linaro.org
Date: Thu, 13 Oct 2016 12:55:42 +0200
Message-Id: <1476356143-10577-2-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1476356143-10577-1-git-send-email-eric.auger@redhat.com>
References: <1476356143-10577-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 13 Oct 2016 10:55:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/2] ACPI: Add IORT Structure definition
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
X-TUID: 0U2+nE/MCf1o

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
 include/hw/acpi/acpi-defs.h | 91 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 9c1b7cb..9ad3c01 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -609,4 +609,95 @@ typedef struct AcpiDmarHardwareUnit AcpiDmarHardwareUnit;
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
+ * IORT subtables
+ */
+
+struct AcpiIortNode {
+    uint8_t  type;
+    uint16_t length;
+    uint8_t  revision;
+    uint32_t reserved;
+    uint32_t mapping_count;
+    uint32_t mapping_offset;
+} QEMU_PACKED;
+typedef struct AcpiIortNode AcpiIortNode;
+
+/* Values for subtable Type above */
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
+/* Masks for Flags field above for IORT subtable */
+#define ACPI_IORT_ID_SINGLE_MAPPING (1)
+
+struct AcpiIortMemoryAccess {
+    uint32_t cache_coherency;
+    uint8_t  hints;
+    uint16_t reserved;
+    uint8_t  memory_flags;
+} QEMU_PACKED;
+typedef struct AcpiIortMemoryAccess AcpiIortMemoryAccess;
+
+/* Values for cache_coherency field above */
+#define ACPI_IORT_NODE_COHERENT         0x00000001
+#define ACPI_IORT_NODE_NOT_COHERENT     0x00000000
+
+/* Masks for Hints field above */
+#define ACPI_IORT_HT_TRANSIENT          (1)
+#define ACPI_IORT_HT_WRITE              (1 << 1)
+#define ACPI_IORT_HT_READ               (1 << 2)
+#define ACPI_IORT_HT_OVERRIDE           (1 << 3)
+
+/* Masks for memory_flags field above */
+#define ACPI_IORT_MF_COHERENCY          (1)
+#define ACPI_IORT_MF_ATTRIBUTES         (1 << 1)
+
+/*
+ * IORT node specific subtables
+ */
+
+struct AcpiIortItsGroup {
+    AcpiIortNode iort_node;
+    uint32_t its_count;
+    uint32_t identifiers[0];
+} QEMU_PACKED;
+typedef struct AcpiIortItsGroup AcpiIortItsGroup;
+
+struct AcpiIortRC {
+    AcpiIortNode iort_node;
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


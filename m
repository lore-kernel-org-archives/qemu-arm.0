Received: by 10.80.163.71 with SMTP id 65csp315631edn;
        Fri, 23 Sep 2016 01:42:27 -0700 (PDT)
X-Received: by 10.237.60.116 with SMTP id u49mr5479354qte.6.1474620147047;
        Fri, 23 Sep 2016 01:42:27 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2si4400804qkf.291.2016.09.23.01.42.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 01:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnM3u-0006gE-FP
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 04:42:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bnL9h-0000DU-Sd
	for qemu-devel@nongnu.org; Fri, 23 Sep 2016 03:44:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bnL9g-0000ba-Ul
	for qemu-devel@nongnu.org; Fri, 23 Sep 2016 03:44:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57746)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bnL9e-0000aE-Ak; Fri, 23 Sep 2016 03:44:18 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3E3C3D97E;
	Fri, 23 Sep 2016 07:44:17 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-6-207.ams2.redhat.com
	[10.36.6.207])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8N7hleh032551; Fri, 23 Sep 2016 03:44:14 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri, 23 Sep 2016 09:43:36 +0200
Message-Id: <1474616617-366-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
References: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 23 Sep 2016 07:44:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 7/8] ACPI: Add GIC Interrupt Translation
 Service Structure definition
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
Cc: drjones@redhat.com, tn@semihalf.com, shlomopongratz@gmail.com,
	shannon.zhao@linaro.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7fHiXIzoTopV

From: Shannon Zhao <shannon.zhao@linaro.org>

ACPI Spec 6.0 introduces GIC Interrupt Translation Service Structure.
Here we add the definition of the Structure.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v6 -> v7:
- added my Sob
---
 include/hw/acpi/acpi-defs.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 41c1d95..9c1b7cb 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -294,7 +294,8 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
 #define ACPI_APIC_GENERIC_DISTRIBUTOR   12
 #define ACPI_APIC_GENERIC_MSI_FRAME     13
 #define ACPI_APIC_GENERIC_REDISTRIBUTOR 14
-#define ACPI_APIC_RESERVED              15   /* 15 and greater are reserved */
+#define ACPI_APIC_GENERIC_TRANSLATOR    15
+#define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
 
 /*
  * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
@@ -395,6 +396,16 @@ struct AcpiMadtGenericRedistributor {
 
 typedef struct AcpiMadtGenericRedistributor AcpiMadtGenericRedistributor;
 
+struct AcpiMadtGenericTranslator {
+    ACPI_SUB_HEADER_DEF
+    uint16_t reserved;
+    uint32_t translation_id;
+    uint64_t base_address;
+    uint32_t reserved2;
+} QEMU_PACKED;
+
+typedef struct AcpiMadtGenericTranslator AcpiMadtGenericTranslator;
+
 /*
  * Generic Timer Description Table (GTDT)
  */
-- 
2.5.5


Received: by 10.80.163.71 with SMTP id 65csp213098edn;
        Fri, 9 Sep 2016 10:36:04 -0700 (PDT)
X-Received: by 10.55.153.68 with SMTP id b65mr5616000qke.10.1473442564315;
        Fri, 09 Sep 2016 10:36:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si2752532qtc.41.2016.09.09.10.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Sep 2016 10:36:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1biPid-0005eR-LB
	for alex.bennee@linaro.org; Fri, 09 Sep 2016 13:36:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPe2-0001hc-5D
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:31:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1biPdx-0005S1-FG
	for qemu-arm@nongnu.org; Fri, 09 Sep 2016 13:31:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1biPdx-0005Rw-9u; Fri, 09 Sep 2016 13:31:13 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8A9E28A49;
	Fri,  9 Sep 2016 17:31:12 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-170.ams2.redhat.com
	[10.36.7.170])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u89HUlQv024546; Fri, 9 Sep 2016 13:31:09 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri,  9 Sep 2016 19:30:36 +0200
Message-Id: <1473442237-3746-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 09 Sep 2016 17:31:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 7/8] ACPI: Add GIC Interrupt Translation
 Service Structure definition
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
Cc: drjones@redhat.com, tn@semihalf.com, shlomopongratz@gmail.com,
	shannon.zhao@linaro.org, diana.craciun@freescale.com,
	christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3AvQlI12DGxK

From: Shannon Zhao <shannon.zhao@linaro.org>

ACPI Spec 6.0 introduces GIC Interrupt Translation Service Structure.
Here we add the definition of the Structure.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
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


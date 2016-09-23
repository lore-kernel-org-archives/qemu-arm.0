Received: by 10.80.163.71 with SMTP id 65csp317709edn;
        Fri, 23 Sep 2016 01:49:51 -0700 (PDT)
X-Received: by 10.237.44.68 with SMTP id f62mr6370479qtd.154.1474620590978;
        Fri, 23 Sep 2016 01:49:50 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g48si4430539qtc.120.2016.09.23.01.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Sep 2016 01:49:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bnMB4-0004zD-AG
	for alex.bennee@linaro.org; Fri, 23 Sep 2016 04:49:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bnL9l-0000Gr-Ux
	for qemu-devel@nongnu.org; Fri, 23 Sep 2016 03:44:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bnL9k-0000cd-1l
	for qemu-devel@nongnu.org; Fri, 23 Sep 2016 03:44:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bnL9h-0000bl-TI; Fri, 23 Sep 2016 03:44:22 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5305AC00B6E9;
	Fri, 23 Sep 2016 07:44:21 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-6-207.ams2.redhat.com
	[10.36.6.207])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8N7hlei032551; Fri, 23 Sep 2016 03:44:18 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Fri, 23 Sep 2016 09:43:37 +0200
Message-Id: <1474616617-366-9-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
References: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 23 Sep 2016 07:44:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 8/8] ARM: Virt: ACPI: Add GIC ITS
 description in ACPI MADT table
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
X-TUID: loJ0sm4os9Kx

From: Shannon Zhao <shannon.zhao@linaro.org>

If GIC ITS is supported, add description in ACPI MADT table, then guest
could use ITS when booting with ACPI.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v6 -> v7:
- added my Sob
---
 hw/arm/virt-acpi-build.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 295ec86..7b39b1d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -44,6 +44,7 @@
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
 #include "sysemu/numa.h"
+#include "kvm_arm.h"
 
 #define ARM_SPI_BASE 32
 #define ACPI_POWER_BUTTON_DEVICE "PWRB"
@@ -546,6 +547,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
     }
 
     if (guest_info->gic_version == 3) {
+        AcpiMadtGenericTranslator *gic_its;
         AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
                                                          sizeof *gicr);
 
@@ -553,6 +555,16 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
         gicr->length = sizeof(*gicr);
         gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
         gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
+
+        if (!its_class_name()) {
+            return;
+        }
+
+        gic_its = acpi_data_push(table_data, sizeof *gic_its);
+        gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
+        gic_its->length = sizeof(*gic_its);
+        gic_its->translation_id = 0;
+        gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
     } else {
         gic_msi = acpi_data_push(table_data, sizeof *gic_msi);
         gic_msi->type = ACPI_APIC_GENERIC_MSI_FRAME;
-- 
2.5.5


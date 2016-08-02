Received: by 10.25.21.156 with SMTP id 28csp336227lfv;
        Tue, 2 Aug 2016 11:08:12 -0700 (PDT)
X-Received: by 10.13.252.132 with SMTP id m126mr37580883ywf.307.1470161289627;
        Tue, 02 Aug 2016 11:08:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r12si475769ywe.465.2016.08.02.11.08.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 11:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUe6q-0003rb-SQ
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 14:08:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUe6i-0003kC-Fi
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 14:08:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1bUe6e-00015l-5P
	for qemu-arm@nongnu.org; Tue, 02 Aug 2016 14:07:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1bUe6d-00015Z-U0; Tue, 02 Aug 2016 14:07:56 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82B5B4E022;
	Tue,  2 Aug 2016 18:07:55 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-58.ams2.redhat.com
	[10.36.7.58])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u72I7ULA024790; Tue, 2 Aug 2016 14:07:52 -0400
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, p.fedin@samsung.com
Date: Tue,  2 Aug 2016 20:07:27 +0200
Message-Id: <1470161247-10251-8-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
References: <1470161247-10251-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 02 Aug 2016 18:07:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v5 7/7] hw/arm/virt-acpi-build: Add ITS description
 in ACPI MADT table
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
X-TUID: i+N5E1Nl5OzP

This patch exposes the GICv3 ITS to the ACPI guest. The ITS structure
is added to the MADT table.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v5: new

Tested with Tomasz' kernel series on guest side:
- [PATCH V7 0/8] Introduce ACPI world to ITS,
  https://lkml.org/lkml/2016/6/20/321
- for running PCIe on the guest (virtio-pci-net or vhost-net)
  the following series is also needed, although not directly ITS:
  Support for ARM64 ACPI based PCI host controller,
  https://lwn.net/Articles/690995/
---
 hw/arm/virt-acpi-build.c    |  7 +++++++
 include/hw/acpi/acpi-defs.h | 13 ++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 28fc59c..6cfedff 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -546,6 +546,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
     }
 
     if (guest_info->gic_version == 3) {
+        AcpiMadtGicIts *gic_its;
         AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
                                                          sizeof *gicr);
 
@@ -553,6 +554,12 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
         gicr->length = sizeof(*gicr);
         gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
         gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
+
+        gic_its = acpi_data_push(table_data, sizeof *gic_its);
+        gic_its->type = ACPI_APIC_ITS_STRUCTURE;
+        gic_its->length = sizeof(*gic_its);
+        gic_its->gic_its_id = 0;
+        gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
     } else {
         gic_msi = acpi_data_push(table_data, sizeof *gic_msi);
         gic_msi->type = ACPI_APIC_GENERIC_MSI_FRAME;
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 41c1d95..ba3be1e 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -294,7 +294,8 @@ typedef struct AcpiMultipleApicTable AcpiMultipleApicTable;
 #define ACPI_APIC_GENERIC_DISTRIBUTOR   12
 #define ACPI_APIC_GENERIC_MSI_FRAME     13
 #define ACPI_APIC_GENERIC_REDISTRIBUTOR 14
-#define ACPI_APIC_RESERVED              15   /* 15 and greater are reserved */
+#define ACPI_APIC_ITS_STRUCTURE         15
+#define ACPI_APIC_RESERVED              16   /* 16 and greater are reserved */
 
 /*
  * MADT sub-structures (Follow MULTIPLE_APIC_DESCRIPTION_TABLE)
@@ -386,6 +387,16 @@ struct AcpiMadtGenericMsiFrame {
 
 typedef struct AcpiMadtGenericMsiFrame AcpiMadtGenericMsiFrame;
 
+struct AcpiMadtGicIts {
+    ACPI_SUB_HEADER_DEF
+    uint16_t reserved;
+    uint32_t gic_its_id;
+    uint64_t base_address;
+    uint32_t reserved2;
+} QEMU_PACKED;
+
+typedef struct AcpiMadtGicIts AcpiMadtGicIts;
+
 struct AcpiMadtGenericRedistributor {
     ACPI_SUB_HEADER_DEF
     uint16_t reserved;
-- 
2.5.5


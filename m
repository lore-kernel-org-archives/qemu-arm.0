Received: by 10.182.158.201 with SMTP id ww9csp876123obb;
        Sun, 29 Nov 2015 00:23:25 -0800 (PST)
X-Received: by 10.140.152.150 with SMTP id 144mr70550832qhy.8.1448785402936;
        Sun, 29 Nov 2015 00:23:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j133si39786088qhj.106.2015.11.29.00.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 29 Nov 2015 00:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2xGU-0008NL-Ip
	for alex.bennee@linaro.org; Sun, 29 Nov 2015 03:23:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a2xGR-0008MG-Vi
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:23:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a2xGO-0003qz-SC
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:23:19 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:10822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a2xGO-0003qr-8O; Sun, 29 Nov 2015 03:23:16 -0500
Received: from 172.24.1.50 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BRU76657; Sun, 29 Nov 2015 16:23:14 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.235.1; Sun, 29 Nov 2015 16:23:04 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <p.fedin@samsung.com>
Date: Sun, 29 Nov 2015 16:22:50 +0800
Message-ID: <1448785370-12176-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1448785370-12176-1-git-send-email-zhaoshenglong@huawei.com>
References: <1448785370-12176-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.565AB5F2.00A3, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2a2a0c5e8249a46e6f4ddc8175594a3b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: hangaohuai@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-arm] [RFC PATCH 2/2] ARM: Virt: ACPI: Add GIC ITS description
	in ACPI MADT table
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z86B7UA6mNfM

From: Shannon Zhao <shannon.zhao@linaro.org>

If GIC ITS is supported, add description in ACPI MADT table, then guest
could use ITS when booting with ACPI.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt-acpi-build.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3c2c5d6..f200086 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -41,6 +41,7 @@
 #include "hw/acpi/aml-build.h"
 #include "hw/pci/pcie_host.h"
 #include "hw/pci/pci.h"
+#include "kvm_arm.h"
 
 #define ARM_SPI_BASE 32
 
@@ -440,6 +441,7 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
     AcpiMultipleApicTable *madt;
     AcpiMadtGenericDistributor *gicd;
     AcpiMadtGenericMsiFrame *gic_msi;
+    AcpiMadtGenericTranslator *gic_its;
     int i;
 
     madt = acpi_data_push(table_data, sizeof *madt);
@@ -475,6 +477,15 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
         gicr->length = sizeof(*gicr);
         gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
         gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
+
+        if (!its_class_name()) {
+            return;
+        }
+        gic_its = acpi_data_push(table_data, sizeof *gic_its);
+        gic_its->type =  ACPI_APIC_GENERIC_TRANSLATOR;
+        gic_its->length = sizeof(*gic_its);
+        gic_its->translation_id = 0;
+        gic_its->base_address = cpu_to_le64(memmap[VIRT_GIC_ITS].base);
     } else {
         gic_msi = acpi_data_push(table_data, sizeof *gic_msi);
         gic_msi->type = ACPI_APIC_GENERIC_MSI_FRAME;
-- 
2.0.4



Received: by 10.25.21.96 with SMTP id l93csp351574lfi;
        Tue, 14 Jun 2016 20:23:39 -0700 (PDT)
X-Received: by 10.141.40.195 with SMTP id r186mr24274281qhe.51.1465961019494;
        Tue, 14 Jun 2016 20:23:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p67si20609047qkc.258.2016.06.14.20.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 20:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bD1QY-0001NC-V1
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 23:23:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bD1QV-0001Mb-Ns
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 23:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bD1QU-00083k-Ps
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 23:23:35 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:28222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bD1QO-00081A-VX; Tue, 14 Jun 2016 23:23:29 -0400
Received: from 172.24.1.36 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.1.36])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CDI00525; Wed, 15 Jun 2016 11:23:08 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml422-hub.china.huawei.com (10.82.67.152) with Microsoft SMTP
	Server id 14.3.235.1; Wed, 15 Jun 2016 11:22:55 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Wed, 15 Jun 2016 11:22:35 +0800
Message-ID: <1465960955-17388-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090201.5760CA1E.0056, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d3f64a939f1a55c256bd885785eceb0e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH] ACPI: ARM: Present GIC version in MADT table
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
Cc: imammedo@redhat.com, peter.huangpeng@huawei.com, zhaoshenglong@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OHf2NfUrMBCM

From: Shannon Zhao <shannon.zhao@linaro.org>

In ACPI 5.1 Errata, it adds GIC version in GIC distributor structure.
This is useful for guest kernel to identify which version GIC hardware
is. Update GIC distributor structure and present GIC version in MADT
table.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/arm/virt-acpi-build.c    | 1 +
 include/hw/acpi/acpi-defs.h | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 1fa0581..28fc59c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -523,6 +523,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
     gicd->type = ACPI_APIC_GENERIC_DISTRIBUTOR;
     gicd->length = sizeof(*gicd);
     gicd->base_address = memmap[VIRT_GIC_DIST].base;
+    gicd->version = guest_info->gic_version;
 
     for (i = 0; i < guest_info->smp_cpus; i++) {
         AcpiMadtGenericInterrupt *gicc = acpi_data_push(table_data,
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 850a962..ea9be0b 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -367,7 +367,9 @@ struct AcpiMadtGenericDistributor {
     uint32_t gic_id;
     uint64_t base_address;
     uint32_t global_irq_base;
-    uint32_t reserved2;
+    /* ACPI 5.1 Errata 1228 Present GIC version in MADT table */
+    uint8_t version;
+    uint8_t reserved2[3];
 } QEMU_PACKED;
 
 typedef struct AcpiMadtGenericDistributor AcpiMadtGenericDistributor;
-- 
2.0.4



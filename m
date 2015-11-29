Received: by 10.182.158.201 with SMTP id ww9csp876112obb;
        Sun, 29 Nov 2015 00:23:22 -0800 (PST)
X-Received: by 10.140.34.204 with SMTP id l70mr32799991qgl.7.1448785402546;
        Sun, 29 Nov 2015 00:23:22 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 61si39890312qgz.37.2015.11.29.00.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 29 Nov 2015 00:23:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35311 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2xGU-0008MX-2V
	for alex.bennee@linaro.org; Sun, 29 Nov 2015 03:23:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a2xGR-0008ME-VV
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:23:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1a2xGO-0003r5-UH
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 03:23:19 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:10821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1a2xGO-0003qt-9w; Sun, 29 Nov 2015 03:23:16 -0500
Received: from 172.24.1.50 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.50])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BRU76655; Sun, 29 Nov 2015 16:23:13 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.235.1; Sun, 29 Nov 2015 16:23:03 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <p.fedin@samsung.com>
Date: Sun, 29 Nov 2015 16:22:49 +0800
Message-ID: <1448785370-12176-2-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1448785370-12176-1-git-send-email-zhaoshenglong@huawei.com>
References: <1448785370-12176-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.565AB5F2.008C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 5b0a9575960740500b5acae3b0516fa0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: hangaohuai@huawei.com, zhaoshenglong@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: [Qemu-arm] [RFC PATCH 1/2] ACPI: Add GIC Interrupt Translation
	Service Structure definition
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
X-TUID: 7UzfiIIbCkn9

From: Shannon Zhao <shannon.zhao@linaro.org>

ACPI Spec 6.0 introduces GIC Interrupt Translation Service Structure.
Here we add the definition of the Structure.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 include/hw/acpi/acpi-defs.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c7a03d4..fc273ce 100644
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
@@ -393,6 +394,16 @@ struct AcpiMadtGenericRedistributor {
 
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
2.0.4



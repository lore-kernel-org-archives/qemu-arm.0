Received: by 10.25.159.19 with SMTP id i19csp332425lfe;
        Sat, 23 Jan 2016 03:37:45 -0800 (PST)
X-Received: by 10.141.28.149 with SMTP id f143mr10146104qhe.66.1453549064773;
        Sat, 23 Jan 2016 03:37:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si12701836qka.23.2016.01.23.03.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jan 2016 03:37:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMwVk-0002qV-Ak
	for alex.bennee@linaro.org; Sat, 23 Jan 2016 06:37:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwVi-0002n1-Dg
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 06:37:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aMwVh-0004vl-H4
	for qemu-arm@nongnu.org; Sat, 23 Jan 2016 06:37:42 -0500
Received: from szxga01-in.huawei.com ([58.251.152.64]:19740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aMwVc-0004st-Ik; Sat, 23 Jan 2016 06:37:37 -0500
Received: from 172.24.1.49 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DDP88404; Sat, 23 Jan 2016 19:37:11 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Jan 2016 19:37:01 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Jan 2016 19:36:45 +0800
Message-ID: <1453549006-16044-5-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
References: <1453549006-16044-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.56A365E8.011F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 312e780367cc30d612f4279df874e49d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: hangaohuai@huawei.com, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org, Igor Mammedov <imammedo@redhat.com>,
	ganapatrao.kulkarni@caviumnetworks.com, hanjun.guo@linaro.org
Subject: [Qemu-arm] [PATCH v4 4/5] include/hw/acpi/acpi-defs: Add GICC
	Affinity Structure
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
X-TUID: j+WIXzTADou3

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
CC: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c        |  2 +-
 include/hw/acpi/acpi-defs.h | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 78758e2..0f0b88f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2300,7 +2300,7 @@ build_srat(GArray *table_data, GArray *linker, PcGuestInfo *guest_info)
 
     for (i = 0; i < guest_info->apic_id_limit; ++i) {
         core = acpi_data_push(table_data, sizeof *core);
-        core->type = ACPI_SRAT_PROCESSOR;
+        core->type = ACPI_SRAT_PROCESSOR_APIC;
         core->length = sizeof(*core);
         core->local_apic_id = i;
         curnode = guest_info->node_cpu[i];
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c7a03d4..bcf5c3f 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -455,8 +455,10 @@ struct AcpiSystemResourceAffinityTable
 } QEMU_PACKED;
 typedef struct AcpiSystemResourceAffinityTable AcpiSystemResourceAffinityTable;
 
-#define ACPI_SRAT_PROCESSOR          0
+#define ACPI_SRAT_PROCESSOR_APIC     0
 #define ACPI_SRAT_MEMORY             1
+#define ACPI_SRAT_PROCESSOR_x2APIC   2
+#define ACPI_SRAT_PROCESSOR_GICC     3
 
 struct AcpiSratProcessorAffinity
 {
@@ -483,6 +485,17 @@ struct AcpiSratMemoryAffinity
 } QEMU_PACKED;
 typedef struct AcpiSratMemoryAffinity AcpiSratMemoryAffinity;
 
+struct AcpiSratProcessorGiccAffinity
+{
+    ACPI_SUB_HEADER_DEF
+    uint32_t    proximity;
+    uint32_t    acpi_processor_uid;
+    uint32_t    flags;
+    uint32_t    clock_domain;
+} QEMU_PACKED;
+
+typedef struct AcpiSratProcessorGiccAffinity AcpiSratProcessorGiccAffinity;
+
 /* PCI fw r3.0 MCFG table. */
 /* Subtable */
 struct AcpiMcfgAllocation {
-- 
2.0.4



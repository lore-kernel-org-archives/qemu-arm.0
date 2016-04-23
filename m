Received: by 10.25.208.194 with SMTP id h185csp1189764lfg;
        Sat, 23 Apr 2016 02:11:27 -0700 (PDT)
X-Received: by 10.140.98.175 with SMTP id o44mr25378303qge.46.1461402687844;
        Sat, 23 Apr 2016 02:11:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n187si5216923qkd.285.2016.04.23.02.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Apr 2016 02:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50075 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1attb5-0001yh-7D
	for alex.bennee@linaro.org; Sat, 23 Apr 2016 05:11:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1attb2-0001tS-AZ
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 05:11:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1attay-0001XH-UH
	for qemu-arm@nongnu.org; Sat, 23 Apr 2016 05:11:24 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:18250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1attaw-0001WX-AB; Sat, 23 Apr 2016 05:11:19 -0400
Received: from 172.24.1.49 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.1.49])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CAK99778; Sat, 23 Apr 2016 17:07:03 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml434-hub.china.huawei.com (10.82.67.225) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 23 Apr 2016 17:06:52 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 23 Apr 2016 17:06:34 +0800
Message-ID: <1461402396-11776-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461402396-11776-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.571B3B37.0058, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 801f56bd87b385e0e7fab31f69ec6efb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: [Qemu-arm] [PATCH v6 3/5] ACPI: Add GICC Affinity Structure
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
Cc: drjones@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
	david.daney@cavium.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bea5epWr09pU

From: Shannon Zhao <shannon.zhao@linaro.org>

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/i386/acpi-build.c        |  2 +-
 include/hw/acpi/acpi-defs.h | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6477003..9ae4c0d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2474,7 +2474,7 @@ build_srat(GArray *table_data, GArray *linker, MachineState *machine)
         int apic_id = apic_ids->cpus[i].arch_id;
 
         core = acpi_data_push(table_data, sizeof *core);
-        core->type = ACPI_SRAT_PROCESSOR;
+        core->type = ACPI_SRAT_PROCESSOR_APIC;
         core->length = sizeof(*core);
         core->local_apic_id = apic_id;
         curnode = pcms->node_cpu[apic_id];
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



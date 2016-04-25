Received: by 10.25.208.194 with SMTP id h185csp768104lfg;
        Mon, 25 Apr 2016 01:08:04 -0700 (PDT)
X-Received: by 10.140.159.143 with SMTP id f137mr34876249qhf.61.1461571684045;
        Mon, 25 Apr 2016 01:08:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 133si9875645qkf.74.2016.04.25.01.08.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Apr 2016 01:08:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aubYo-0006kF-12
	for alex.bennee@linaro.org; Mon, 25 Apr 2016 04:08:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubYl-0006fq-4T
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 04:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1aubYk-00057w-67
	for qemu-arm@nongnu.org; Mon, 25 Apr 2016 04:07:59 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:44135)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1aubYf-00057B-Qk; Mon, 25 Apr 2016 04:07:54 -0400
Received: from 172.24.1.47 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DFY28064; Mon, 25 Apr 2016 16:07:38 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.235.1; Mon, 25 Apr 2016 16:07:27 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Mon, 25 Apr 2016 16:05:44 +0800
Message-ID: <1461571547-13132-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
References: <1461571547-13132-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.571DD04B.0065, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 05c4ca7618c743d3092ac4152b3b7302
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: [Qemu-arm] [PATCH v7 2/5] ACPI: Add GICC Affinity Structure
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
X-TUID: Xka7x3ur7QsX

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



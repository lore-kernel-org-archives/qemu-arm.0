Received: by 10.182.105.169 with SMTP id gn9csp327425obb;
        Sat, 31 Oct 2015 02:51:11 -0700 (PDT)
X-Received: by 10.55.53.136 with SMTP id c130mr15862940qka.63.1446285071064;
        Sat, 31 Oct 2015 02:51:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l136si9674136qhl.14.2015.10.31.02.51.10
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sat, 31 Oct 2015 02:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsSoY-0004j0-PE
	for alex.bennee@linaro.org; Sat, 31 Oct 2015 05:51:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZsSoW-0004gq-J2
	for qemu-arm@nongnu.org; Sat, 31 Oct 2015 05:51:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZsSoV-0002rs-It
	for qemu-arm@nongnu.org; Sat, 31 Oct 2015 05:51:08 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:8145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZsSoP-0002qO-JE; Sat, 31 Oct 2015 05:51:02 -0400
Received: from 172.24.1.49 (EHLO SZXEML424-HUB.china.huawei.com)
	([172.24.1.49])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CYE81980; Sat, 31 Oct 2015 17:50:20 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML424-HUB.china.huawei.com (10.82.67.153) with Microsoft SMTP
	Server id 14.3.235.1; Sat, 31 Oct 2015 17:50:10 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>
Date: Sat, 31 Oct 2015 17:50:01 +0800
Message-ID: <1446285001-7316-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: shannon.zhao@linaro.org, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-arm] [PATCH] ARM: ACPI: Fix MPIDR value in ACPI table
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
X-TUID: aj23BIZgeFMq

From: Shannon Zhao <shannon.zhao@linaro.org>

Use mp_affinity of ARMCPU as the CPU MPIDR instead of the CPU index.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
This patch is based on below patch.
http://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg06919.html

 hw/arm/virt-acpi-build.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 29a1980..1c621cb 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -451,13 +451,15 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
     for (i = 0; i < guest_info->smp_cpus; i++) {
         AcpiMadtGenericInterrupt *gicc = acpi_data_push(table_data,
                                                      sizeof *gicc);
+        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
+
         gicc->type = ACPI_APIC_GENERIC_INTERRUPT;
         gicc->length = sizeof(*gicc);
         if (guest_info->gic_version == 2) {
             gicc->base_address = memmap[VIRT_GIC_CPU].base;
         }
         gicc->cpu_interface_number = i;
-        gicc->arm_mpidr = i;
+        gicc->arm_mpidr = armcpu->mp_affinity;
         gicc->uid = i;
         if (test_bit(i, cpuinfo->found_cpus)) {
             gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
-- 
2.0.4



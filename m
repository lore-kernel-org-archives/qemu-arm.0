Received: by 10.182.105.169 with SMTP id gn9csp1866264obb;
        Tue, 3 Nov 2015 06:18:52 -0800 (PST)
X-Received: by 10.55.20.12 with SMTP id e12mr36586462qkh.1.1446560332282;
        Tue, 03 Nov 2015 06:18:52 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si17188428qgl.92.2015.11.03.06.18.52
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Tue, 03 Nov 2015 06:18:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZtcQG-0001oR-0J
	for alex.bennee@linaro.org; Tue, 03 Nov 2015 09:18:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ZtcL7-0001mk-Te
	for qemu-devel@nongnu.org; Tue, 03 Nov 2015 09:13:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ZtcL2-0007u8-1a
	for qemu-devel@nongnu.org; Tue, 03 Nov 2015 09:13:33 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:35243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ZtcL1-0007sB-S7
	for qemu-devel@nongnu.org; Tue, 03 Nov 2015 09:13:27 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>) id 1ZtcKt-0003Fl-TK
	for qemu-devel@nongnu.org; Tue, 03 Nov 2015 14:13:19 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  3 Nov 2015 14:13:19 +0000
Message-Id: <1446559999-12413-14-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446559999-12413-1-git-send-email-peter.maydell@linaro.org>
References: <1446559999-12413-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Subject: [Qemu-devel] [PULL 13/13] ARM: ACPI: Fix MPIDR value in ACPI table
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hoe/CaiVAJ5X

From: Shannon Zhao <shannon.zhao@linaro.org>

Use mp_affinity of ARMCPU as the CPU MPIDR instead of the CPU index.

Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Message-id: 1446285001-7316-1-git-send-email-zhaoshenglong@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt-acpi-build.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b170dfa..3c2c5d6 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -452,13 +452,15 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
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
1.9.1


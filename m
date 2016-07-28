Received: by 10.25.21.156 with SMTP id 28csp900366lfv;
        Thu, 28 Jul 2016 09:39:09 -0700 (PDT)
X-Received: by 10.37.202.145 with SMTP id a139mr21011024ybg.122.1469723948074;
        Thu, 28 Jul 2016 09:39:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r69si8523484qkl.90.2016.07.28.09.39.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jul 2016 09:39:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54612 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bSoKx-0004WT-Gu
	for alex.bennee@linaro.org; Thu, 28 Jul 2016 12:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bSoKF-0003zi-9F
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:38:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bSoKB-00053s-0u
	for qemu-arm@nongnu.org; Thu, 28 Jul 2016 12:38:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61998)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1bSoKA-00052S-Om; Thu, 28 Jul 2016 12:38:18 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B496D8122D;
	Thu, 28 Jul 2016 16:38:17 +0000 (UTC)
Received: from rhlaptop.redhat.com (vpn-61-195.rdu2.redhat.com [10.10.61.195])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u6SGcGPP009127; Thu, 28 Jul 2016 12:38:16 -0400
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Thu, 28 Jul 2016 11:38:16 -0500
Message-Id: <1469723896-28049-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 28 Jul 2016 16:38:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 1/1] arm64: add an option to turn on/off vpmu
 support
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, drjones@redhat.com,
	shannon.zhao@linaro.org, abologna@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vbaGQwU8BSKy

This patch adds a pmu=[on/off] option to enable/disable vpmu support
in guest vm. There are several reasons to justify this option. First
vpmu can be problematic for cross-migration between different SoC as
perf counters is architecture-dependent. It is more flexible to
have an option to turn it on/off. Secondly it matches the -cpu pmu
option in libivrt. This patch has been tested on both DT/ACPI modes.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt-acpi-build.c |  2 +-
 hw/arm/virt.c            |  2 +-
 target-arm/cpu.c         |  1 +
 target-arm/cpu.h         |  5 +++--
 target-arm/kvm64.c       | 10 +++++-----
 5 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 28fc59c..dc5f66d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -540,7 +540,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
         gicc->uid = i;
         gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
 
-        if (armcpu->has_pmu) {
+        if (armcpu->enable_pmu) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
         }
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a193b5a..6aea901 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -477,7 +477,7 @@ static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
 
     CPU_FOREACH(cpu) {
         armcpu = ARM_CPU(cpu);
-        if (!armcpu->has_pmu ||
+        if (!armcpu->enable_pmu ||
             !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
             return;
         }
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index ce8b8f4..f7daf81 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -1412,6 +1412,7 @@ static const ARMCPUInfo arm_cpus[] = {
 };
 
 static Property arm_cpu_properties[] = {
+    DEFINE_PROP_BOOL("pmu", ARMCPU, enable_pmu, true),
     DEFINE_PROP_BOOL("start-powered-off", ARMCPU, start_powered_off, false),
     DEFINE_PROP_UINT32("psci-conduit", ARMCPU, psci_conduit, 0),
     DEFINE_PROP_UINT32("midr", ARMCPU, midr, 0),
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 76d824d..f2341c0 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -579,8 +579,9 @@ struct ARMCPU {
     bool powered_off;
     /* CPU has security extension */
     bool has_el3;
-    /* CPU has PMU (Performance Monitor Unit) */
-    bool has_pmu;
+
+    /* CPU has vPMU (Performance Monitor Unit) support */
+    bool enable_pmu;
 
     /* CPU has memory protection unit */
     bool has_mpu;
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index 5faa76c..ca21670 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -501,11 +501,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
-    if (kvm_irqchip_in_kernel() &&
-        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
-        cpu->has_pmu = true;
-        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
-    }
+
+    /* enable vPMU based on KVM mode and hardware capability */
+    cpu->enable_pmu &= (kvm_irqchip_in_kernel() &&
+        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3));
+    cpu->kvm_init_features[0] |= cpu->enable_pmu << KVM_ARM_VCPU_PMU_V3;
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
     ret = kvm_arm_vcpu_init(cs);
-- 
2.4.11


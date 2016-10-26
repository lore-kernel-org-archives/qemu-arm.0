Received: by 10.80.166.35 with SMTP id d32csp202467edc;
        Tue, 25 Oct 2016 23:37:58 -0700 (PDT)
X-Received: by 10.55.104.68 with SMTP id d65mr6707802qkc.119.1477463878510;
        Tue, 25 Oct 2016 23:37:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n59si431148qtd.4.2016.10.25.23.37.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Oct 2016 23:37:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzHqX-0000vY-T4
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 02:37:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bzHhP-0002Ow-6P
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 02:28:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1bzHhO-0007S8-2W
	for qemu-devel@nongnu.org; Wed, 26 Oct 2016 02:28:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59416)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1bzHhJ-0007Qq-9s; Wed, 26 Oct 2016 02:28:25 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FC7E8FD08;
	Wed, 26 Oct 2016 06:28:24 +0000 (UTC)
Received: from apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-30.khw.lab.eng.bos.redhat.com [10.16.184.124])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9Q6SM5T009481; Wed, 26 Oct 2016 02:28:23 -0400
From: Wei Huang <wei@redhat.com>
To: qemu-arm@nongnu.org
Date: Wed, 26 Oct 2016 02:28:20 -0400
Message-Id: <1477463301-17175-2-git-send-email-wei@redhat.com>
In-Reply-To: <1477463301-17175-1-git-send-email-wei@redhat.com>
References: <1477463301-17175-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 26 Oct 2016 06:28:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH V8 1/2] arm: Add an option to turn on/off vPMU
 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-devel@nongnu.org,
	abologna@redhat.com, shannon.zhao@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ziBtywXJN6uJ

This patch adds a pmu=[on/off] option to enable/disable vPMU support
in guest vCPU. It allows virt tools, such as libvirt, to determine the
exsitence of vPMU and configure it. Note this option is only available
for cortex-a57/cortex-53/ host CPUs, but unavailable on ARMv7 and other
processors. Also even though "pmu=" option is available for TCG mode,
setting it doesn't turn PMU on.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt-acpi-build.c |  2 +-
 hw/arm/virt.c            |  2 +-
 target-arm/cpu.c         | 15 +++++++++++++++
 target-arm/cpu.h         |  1 +
 target-arm/cpu64.c       |  2 ++
 target-arm/kvm64.c       | 17 ++++++++++++++---
 6 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fa0655a..49898df 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -539,7 +539,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
         gicc->uid = i;
         gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
 
-        if (armcpu->has_pmu) {
+        if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
             gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
         }
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 895446f..074d11c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -490,7 +490,7 @@ static void fdt_add_pmu_nodes(const VirtBoardInfo *vbi, int gictype)
 
     CPU_FOREACH(cpu) {
         armcpu = ARM_CPU(cpu);
-        if (!armcpu->has_pmu ||
+        if (!arm_feature(&armcpu->env, ARM_FEATURE_PMU) ||
             !kvm_arm_pmu_create(cpu, PPI(VIRTUAL_PMU_IRQ))) {
             return;
         }
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 1b9540e..655a1f8 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "internals.h"
@@ -509,6 +510,10 @@ static Property arm_cpu_rvbar_property =
 static Property arm_cpu_has_el3_property =
             DEFINE_PROP_BOOL("has_el3", ARMCPU, has_el3, true);
 
+/* use property name "pmu" to match other archs and virt tools */
+static Property arm_cpu_has_pmu_property =
+            DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, true);
+
 static Property arm_cpu_has_mpu_property =
             DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
 
@@ -552,6 +557,11 @@ static void arm_cpu_post_init(Object *obj)
 #endif
     }
 
+    if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
+        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
+                                 &error_abort);
+    }
+
     if (arm_feature(&cpu->env, ARM_FEATURE_MPU)) {
         qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
                                  &error_abort);
@@ -648,6 +658,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->id_aa64pfr0 &= ~0xf000;
     }
 
+    if (!cpu->has_pmu || !kvm_enabled()) {
+        cpu->has_pmu = false;
+        unset_feature(env, ARM_FEATURE_PMU);
+    }
+
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
         /* Disable the hypervisor feature bits in the processor feature
          * registers if we don't have EL2. These are id_pfr1[15:12] and
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 2218c00..b97b93b 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1129,6 +1129,7 @@ enum arm_features {
     ARM_FEATURE_V8_SHA256, /* implements SHA256 part of v8 Crypto Extensions */
     ARM_FEATURE_V8_PMULL, /* implements PMULL part of v8 Crypto Extensions */
     ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
+    ARM_FEATURE_PMU, /* has PMU support */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
index 1635deb..549cb1e 100644
--- a/target-arm/cpu64.c
+++ b/target-arm/cpu64.c
@@ -111,6 +111,7 @@ static void aarch64_a57_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A57;
     cpu->midr = 0x411fd070;
     cpu->revidr = 0x00000000;
@@ -166,6 +167,7 @@ static void aarch64_a53_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
     set_feature(&cpu->env, ARM_FEATURE_CRC);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
     cpu->midr = 0x410fd034;
     cpu->revidr = 0x00000000;
diff --git a/target-arm/kvm64.c b/target-arm/kvm64.c
index 5faa76c..6111109 100644
--- a/target-arm/kvm64.c
+++ b/target-arm/kvm64.c
@@ -428,6 +428,11 @@ static inline void set_feature(uint64_t *features, int feature)
     *features |= 1ULL << feature;
 }
 
+static inline void unset_feature(uint64_t *features, int feature)
+{
+    *features &= ~(1ULL << feature);
+}
+
 bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
 {
     /* Identify the feature bits corresponding to the host CPU, and
@@ -469,6 +474,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUClass *ahcc)
     set_feature(&features, ARM_FEATURE_VFP4);
     set_feature(&features, ARM_FEATURE_NEON);
     set_feature(&features, ARM_FEATURE_AARCH64);
+    set_feature(&features, ARM_FEATURE_PMU);
 
     ahcc->features = features;
 
@@ -482,6 +488,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
     int ret;
     uint64_t mpidr;
     ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
 
     if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
         !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
@@ -501,10 +508,14 @@ int kvm_arch_init_vcpu(CPUState *cs)
     if (!arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
     }
-    if (kvm_irqchip_in_kernel() &&
-        kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
-        cpu->has_pmu = true;
+    if (!kvm_irqchip_in_kernel() ||
+        !kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
+            cpu->has_pmu = false;
+    }
+    if (cpu->has_pmu) {
         cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
+    } else {
+        unset_feature(&env->features, ARM_FEATURE_PMU);
     }
 
     /* Do KVM_ARM_VCPU_INIT ioctl */
-- 
1.8.3.1


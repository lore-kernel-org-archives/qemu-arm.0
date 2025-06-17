Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54d1fsm14265133f8f.2.2025.06.17.09.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:33:54 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 77B535F90B;
	Tue, 17 Jun 2025 17:33:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>,
	qemu-arm@nongnu.org,
	Mark Burton <mburton@qti.qualcomm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 06/11] kvm/arm: allow out-of kernel GICv3 to work with KVM
Date: Tue, 17 Jun 2025 17:33:46 +0100
Message-ID: <20250617163351.2640572-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250617163351.2640572-1-alex.bennee@linaro.org>
References: <20250617163351.2640572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: p3u4GfozeE7a

Previously we suppressed this option as KVM would get confused if it
started trapping GIC system registers without a GIC configured.
However if we know we are trapping harder we can allow it much like we
do for HVF.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm_arm.h       |  8 ++++++++
 hw/arm/virt.c              | 11 +++++++++--
 hw/intc/arm_gicv3_common.c |  4 ----
 target/arm/cpu.c           |  2 +-
 target/arm/kvm.c           |  6 ++++++
 hw/intc/Kconfig            |  2 +-
 6 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
index a4f68e14cb..008a72ccd4 100644
--- a/target/arm/kvm_arm.h
+++ b/target/arm/kvm_arm.h
@@ -200,6 +200,14 @@ bool kvm_arm_mte_supported(void);
  */
 int kvm_arm_get_type(MachineState *ms);
 
+/**
+ * kvm_arm_is_trapping_harder: return true if trapping harder
+ * @ms: Machine state handle
+ *
+ * return true if trapping harder
+ */
+bool kvm_arm_is_trapping_harder(MachineState *ms);
+
 /**
  * kvm_arm_get_max_vm_ipa_size:
  * @ms: Machine state handle
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 55433f8fce..e117433cc7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1998,9 +1998,16 @@ static void finalize_gic_version(VirtMachineState *vms)
             gics_supported |= VIRT_GIC_VERSION_3_MASK;
         }
     } else if (kvm_enabled() && !kvm_irqchip_in_kernel()) {
-        /* KVM w/o kernel irqchip can only deal with GICv2 */
+        MachineState *ms = MACHINE(vms);
         gics_supported |= VIRT_GIC_VERSION_2_MASK;
-        accel_name = "KVM with kernel-irqchip=off";
+        if (kvm_arm_is_trapping_harder(ms) &&
+            module_object_class_by_name("arm-gicv3")) {
+            gics_supported |= VIRT_GIC_VERSION_3_MASK;
+            accel_name = "TMH KVM with kernel-irqchip=off";
+        } else {
+            /* KVM w/o kernel irqchip can only deal with GICv2 */
+            accel_name = "KVM with kernel-irqchip=off";
+        }
     } else if (tcg_enabled() || hvf_enabled() || qtest_enabled())  {
         gics_supported |= VIRT_GIC_VERSION_2_MASK;
         if (module_object_class_by_name("arm-gicv3")) {
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 1cee68193c..9a46afaa0d 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -662,10 +662,6 @@ const char *gicv3_class_name(void)
     if (kvm_irqchip_in_kernel()) {
         return "kvm-arm-gicv3";
     } else {
-        if (kvm_enabled()) {
-            error_report("Userspace GICv3 is not supported with KVM");
-            exit(1);
-        }
         return "arm-gicv3";
     }
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e025e241ed..f7618a3038 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1463,7 +1463,7 @@ static void arm_cpu_initfn(Object *obj)
 # endif
 #else
     /* Our inbound IRQ and FIQ lines */
-    if (kvm_enabled()) {
+    if (kvm_enabled() && kvm_irqchip_in_kernel()) {
         /*
          * VIRQ, VFIQ, NMI, VINMI are unused with KVM but we add
          * them to maintain the same interface as non-KVM CPUs.
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index ed0f6024d6..c5374d12cf 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -522,6 +522,12 @@ int kvm_arm_get_type(MachineState *ms)
     return s->trap_harder ? KVM_VM_TYPE_ARM_TRAP_ALL : 0;
 }
 
+bool kvm_arm_is_trapping_harder(MachineState *ms)
+{
+    KVMState *s = KVM_STATE(ms->accelerator);
+    return s->trap_harder;
+}
+
 int kvm_arch_get_default_type(MachineState *ms)
 {
     bool fixed_ipa;
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 7547528f2c..0eb37364a7 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -23,7 +23,7 @@ config APIC
 
 config ARM_GIC
     bool
-    select ARM_GICV3 if TCG
+    select ARM_GICV3 # can be used by TCG, HVF or KVM
     select ARM_GIC_KVM if KVM
     select MSI_NONBROKEN
 
-- 
2.47.2

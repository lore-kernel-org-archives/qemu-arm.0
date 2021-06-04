Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k8sm4338274wrp.3.2021.06.04.09.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AEA5F1FFB5;
	Fri,  4 Jun 2021 16:53:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org (open list:Overall KVM CPUs)
Subject: [PATCH  v16 30/99] target/arm: only perform TCG cpu and machine inits if TCG enabled
Date: Fri,  4 Jun 2021 16:52:03 +0100
Message-Id: <20210604155312.15902-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2dC2nle6FRVU

From: Claudio Fontana <cfontana@suse.de>

of note, cpreg lists were previously initialized by TCG first,
and then thrown away and replaced with the data coming from KVM.

Now we just initialize once, either for TCG or for KVM.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c     | 32 ++++++++++++++++++--------------
 target/arm/kvm.c     | 18 +++++++++---------
 target/arm/machine.c | 20 +++++++++++++-------
 3 files changed, 40 insertions(+), 30 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 9e616a15e1..7bb406efd2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -435,9 +435,11 @@ static void arm_cpu_reset(DeviceState *dev)
     }
 #endif
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
-    arm_rebuild_hflags(env);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
+        arm_rebuild_hflags(env);
+    }
 }
 
 static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
@@ -1318,6 +1320,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
+#ifdef CONFIG_TCG
     {
         uint64_t scale;
 
@@ -1343,7 +1346,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
     }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* !CONFIG_USER_ONLY */
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -1646,17 +1650,16 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         unset_feature(env, ARM_FEATURE_PMU);
     }
     if (arm_feature(env, ARM_FEATURE_PMU)) {
-        pmu_init(cpu);
-
-        if (!kvm_enabled()) {
+        if (tcg_enabled()) {
+            pmu_init(cpu);
             arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
             arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
-        }
 
 #ifndef CONFIG_USER_ONLY
-        cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
-                cpu);
+            cpu->pmu_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, arm_pmu_timer_cb,
+                                          cpu);
 #endif
+        }
     } else {
         cpu->isar.id_aa64dfr0 =
             FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMUVER, 0);
@@ -1739,10 +1742,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         set_feature(env, ARM_FEATURE_VBAR);
     }
 
-    register_cp_regs_for_features(cpu);
-    arm_cpu_register_gdb_regs_for_features(cpu);
-
-    init_cpreg_list(cpu);
+    if (tcg_enabled()) {
+        register_cp_regs_for_features(cpu);
+        arm_cpu_register_gdb_regs_for_features(cpu);
+        init_cpreg_list(cpu);
+    }
 
 #ifndef CONFIG_USER_ONLY
     MachineState *ms = MACHINE(qdev_get_machine());
diff --git a/target/arm/kvm.c b/target/arm/kvm.c
index d8381ba224..1b093cc52f 100644
--- a/target/arm/kvm.c
+++ b/target/arm/kvm.c
@@ -431,9 +431,11 @@ static uint64_t *kvm_arm_get_cpreg_ptr(ARMCPU *cpu, uint64_t regidx)
     return &cpu->cpreg_values[res - cpu->cpreg_indexes];
 }
 
-/* Initialize the ARMCPU cpreg list according to the kernel's
- * definition of what CPU registers it knows about (and throw away
- * the previous TCG-created cpreg list).
+/*
+ * Initialize the ARMCPU cpreg list according to the kernel's
+ * definition of what CPU registers it knows about.
+ *
+ * The parallel for TCG is init_cpreg_list() in tcg/
  */
 int kvm_arm_init_cpreg_list(ARMCPU *cpu)
 {
@@ -475,12 +477,10 @@ int kvm_arm_init_cpreg_list(ARMCPU *cpu)
         arraylen++;
     }
 
-    cpu->cpreg_indexes = g_renew(uint64_t, cpu->cpreg_indexes, arraylen);
-    cpu->cpreg_values = g_renew(uint64_t, cpu->cpreg_values, arraylen);
-    cpu->cpreg_vmstate_indexes = g_renew(uint64_t, cpu->cpreg_vmstate_indexes,
-                                         arraylen);
-    cpu->cpreg_vmstate_values = g_renew(uint64_t, cpu->cpreg_vmstate_values,
-                                        arraylen);
+    cpu->cpreg_indexes = g_new(uint64_t, arraylen);
+    cpu->cpreg_values = g_new(uint64_t, arraylen);
+    cpu->cpreg_vmstate_indexes = g_new(uint64_t, arraylen);
+    cpu->cpreg_vmstate_values = g_new(uint64_t, arraylen);
     cpu->cpreg_array_len = arraylen;
     cpu->cpreg_vmstate_array_len = arraylen;
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index e568662cca..2982e8d7f4 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -2,6 +2,7 @@
 #include "cpu.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "internals.h"
 #include "migration/cpu.h"
@@ -635,7 +636,7 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
@@ -670,7 +671,7 @@ static int cpu_post_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_finish(&cpu->env);
     }
 
@@ -689,7 +690,7 @@ static int cpu_pre_load(void *opaque)
      */
     env->irq_line_state = UINT32_MAX;
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         pmu_op_start(&cpu->env);
     }
 
@@ -759,13 +760,13 @@ static int cpu_post_load(void *opaque, int version_id)
         }
     }
 
-    hw_breakpoint_update_all(cpu);
-    hw_watchpoint_update_all(cpu);
+    if (tcg_enabled()) {
+        hw_breakpoint_update_all(cpu);
+        hw_watchpoint_update_all(cpu);
 
-    if (!kvm_enabled()) {
         pmu_op_finish(&cpu->env);
+        arm_rebuild_hflags(&cpu->env);
     }
-    arm_rebuild_hflags(&cpu->env);
 
     return 0;
 }
@@ -815,8 +816,13 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
         VMSTATE_UINT32(env.exception.fsr, ARMCPU),
         VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
+#ifdef CONFIG_TCG
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
+#else
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+        VMSTATE_UNUSED(sizeof(QEMUTimer *)),
+#endif /* CONFIG_TCG */
         {
             .name = "power_state",
             .version_id = 0,
-- 
2.20.1

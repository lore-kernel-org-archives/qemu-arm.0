Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l10sm7144801wrm.2.2021.06.04.09.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1DE7B1FFDD;
	Fri,  4 Jun 2021 16:53:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 69/99] target/arm: add tcg cpu accel class
Date: Fri,  4 Jun 2021 16:52:42 +0100
Message-Id: <20210604155312.15902-70-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ti8zEpumT7PJ

From: Claudio Fontana <cfontana@suse.de>

move init, realizefn and reset code into it.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/tcg-cpu.h        |  4 ++-
 target/arm/cpu.c                | 44 ++------------------------
 target/arm/tcg/sysemu/tcg-cpu.c | 27 ++++++++++++++++
 target/arm/tcg/tcg-cpu-models.c | 10 +++---
 target/arm/tcg/tcg-cpu.c        | 55 +++++++++++++++++++++++++++++++--
 5 files changed, 92 insertions(+), 48 deletions(-)

diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
index d93c6a6749..dd08587949 100644
--- a/target/arm/tcg/tcg-cpu.h
+++ b/target/arm/tcg/tcg-cpu.h
@@ -22,15 +22,17 @@
 
 #include "cpu.h"
 #include "hw/core/tcg-cpu-ops.h"
+#include "hw/core/accel-cpu.h"
 
 void arm_cpu_synchronize_from_tb(CPUState *cs,
                                  const TranslationBlock *tb);
 
-extern struct TCGCPUOps arm_tcg_ops;
+void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);
 
 #ifndef CONFIG_USER_ONLY
 /* Do semihosting call and set the appropriate return value. */
 void tcg_handle_semihosting(CPUState *cs);
+bool tcg_cpu_realizefn(CPUState *cs, Error **errp);
 
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 003e58d8ee..945dfbbe9d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -410,12 +410,6 @@ static void arm_cpu_reset(DeviceState *dev)
                               &env->vfp.fp_status_f16);
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->vfp.standard_fp_status_f16);
-
-    if (tcg_enabled()) {
-        hw_breakpoint_update_all(cpu);
-        hw_watchpoint_update_all(cpu);
-        arm_rebuild_hflags(env);
-    }
 }
 
 void arm_cpu_update_virq(ARMCPU *cpu)
@@ -576,10 +570,6 @@ static void arm_cpu_initfn(Object *obj)
     cpu->dtb_compatible = "qemu,unknown";
     cpu->psci_version = 1; /* By default assume PSCI v0.1 */
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
-
-    if (tcg_enabled()) {
-        cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
-    }
 }
 
 static Property arm_cpu_gt_cntfrq_property =
@@ -868,34 +858,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     bool no_aa32 = false;
 
-    /*
-     * If we needed to query the host kernel for the CPU features
-     * then it's possible that might have failed in the initfn, but
-     * this is the first point where we can report it.
-     */
-    if (cpu->host_cpu_probe_failed) {
-        error_setg(errp, "The 'host' CPU type can only be used with KVM");
-        return;
-    }
-
-#ifndef CONFIG_USER_ONLY
-    /* The NVIC and M-profile CPU are two halves of a single piece of
-     * hardware; trying to use one without the other is a command line
-     * error and will result in segfaults if not caught here.
-     */
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        if (!env->nvic) {
-            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
-            return;
-        }
-    } else {
-        if (env->nvic) {
-            error_setg(errp, "This board can only be used with Cortex-M CPUs");
-            return;
-        }
-    }
-
-#ifdef CONFIG_TCG
+#if defined(CONFIG_TCG) && !defined(CONFIG_USER_ONLY)
     {
         uint64_t scale;
 
@@ -921,8 +884,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cpu->gt_timer[GTIMER_HYPVIRT] = timer_new(QEMU_CLOCK_VIRTUAL, scale,
                                                   arm_gt_hvtimer_cb, cpu);
     }
-#endif /* CONFIG_TCG */
-#endif /* !CONFIG_USER_ONLY */
+#endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 
     cpu_exec_realizefn(cs, &local_err);
     if (local_err != NULL) {
@@ -1467,7 +1429,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = arm_disas_set_info;
 
 #ifdef CONFIG_TCG
-    cc->tcg_ops = &arm_tcg_ops;
+    cc->init_accel_cpu = tcg_arm_init_accel_cpu;
 #endif /* CONFIG_TCG */
 
     arm32_cpu_class_init(oc, data);
diff --git a/target/arm/tcg/sysemu/tcg-cpu.c b/target/arm/tcg/sysemu/tcg-cpu.c
index 327b2a5073..115ac523dc 100644
--- a/target/arm/tcg/sysemu/tcg-cpu.c
+++ b/target/arm/tcg/sysemu/tcg-cpu.c
@@ -19,10 +19,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/timer.h"
 #include "cpu.h"
 #include "semihosting/common-semi.h"
 #include "qemu/log.h"
 #include "tcg/tcg-cpu.h"
+#include "internals.h"
 
 /*
  * Do semihosting call and set the appropriate return value. All the
@@ -50,3 +53,27 @@ void tcg_handle_semihosting(CPUState *cs)
         env->regs[15] += env->thumb ? 2 : 4;
     }
 }
+
+bool tcg_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * The NVIC and M-profile CPU are two halves of a single piece of
+     * hardware; trying to use one without the other is a command line
+     * error and will result in segfaults if not caught here.
+     */
+    if (arm_feature(env, ARM_FEATURE_M)) {
+        if (!env->nvic) {
+            error_setg(errp, "This board cannot be used with Cortex-M CPUs");
+            return false;
+        }
+    } else {
+        if (env->nvic) {
+            error_setg(errp, "This board can only be used with Cortex-M CPUs");
+            return false;
+        }
+    }
+    return true;
+}
diff --git a/target/arm/tcg/tcg-cpu-models.c b/target/arm/tcg/tcg-cpu-models.c
index 91af2174a1..975869f276 100644
--- a/target/arm/tcg/tcg-cpu-models.c
+++ b/target/arm/tcg/tcg-cpu-models.c
@@ -846,16 +846,18 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+static void arm_v7m_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc)
+{
+    cc->tcg_ops = &arm_v7m_tcg_ops;
+}
+
 static void arm_v7m_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
     CPUClass *cc = CPU_CLASS(oc);
 
     acc->info = data;
-#ifdef CONFIG_TCG
-    cc->tcg_ops = &arm_v7m_tcg_ops;
-#endif /* CONFIG_TCG */
-
+    cc->init_accel_cpu = arm_v7m_init_accel_cpu;
     cc->gdb_core_xml_file = "arm-m-profile.xml";
 }
 
diff --git a/target/arm/tcg/tcg-cpu.c b/target/arm/tcg/tcg-cpu.c
index 9fd996d908..db677bc71c 100644
--- a/target/arm/tcg/tcg-cpu.c
+++ b/target/arm/tcg/tcg-cpu.c
@@ -20,8 +20,8 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "qapi/error.h"
 #include "tcg-cpu.h"
-#include "hw/core/tcg-cpu-ops.h"
 #include "cpregs.h"
 #include "internals.h"
 #include "exec/exec-all.h"
@@ -212,7 +212,7 @@ static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return true;
 }
 
-struct TCGCPUOps arm_tcg_ops = {
+static struct TCGCPUOps arm_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = arm_cpu_exec_interrupt,
@@ -227,3 +227,54 @@ struct TCGCPUOps arm_tcg_ops = {
     .debug_check_watchpoint = arm_debug_check_watchpoint,
 #endif /* !CONFIG_USER_ONLY */
 };
+
+static void tcg_cpu_instance_init(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    /*
+     * this would be the place to move TCG-specific props
+     * in future refactoring of cpu properties.
+     */
+
+    cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
+}
+
+static void tcg_cpu_reset(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    hw_breakpoint_update_all(cpu);
+    hw_watchpoint_update_all(cpu);
+    arm_rebuild_hflags(env);
+}
+
+void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc)
+{
+    cc->tcg_ops = &arm_tcg_ops;
+}
+
+static void tcg_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+#ifndef CONFIG_USER_ONLY
+    acc->cpu_realizefn = tcg_cpu_realizefn;
+#endif /* CONFIG_USER_ONLY */
+
+    acc->cpu_instance_init = tcg_cpu_instance_init;
+    acc->cpu_reset = tcg_cpu_reset;
+}
+static const TypeInfo tcg_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("tcg"),
+
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = tcg_cpu_accel_class_init,
+    .abstract = true,
+};
+static void tcg_cpu_accel_register_types(void)
+{
+    type_register_static(&tcg_cpu_accel_type_info);
+}
+type_init(tcg_cpu_accel_register_types);
-- 
2.20.1

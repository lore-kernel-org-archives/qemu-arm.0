Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g21sm7987458wrb.46.2021.06.04.09.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DAD161FFD8;
	Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 67/99] target/arm: create kvm cpu accel class
Date: Fri,  4 Jun 2021 16:52:40 +0100
Message-Id: <20210604155312.15902-68-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZGQ83l2utSqF

From: Claudio Fontana <cfontana@suse.de>

move init, realizefn and reset code into it.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/internals.h     |   1 -
 target/arm/cpu-sysemu.c    |  32 ----------
 target/arm/cpu.c           |  49 +++-----------
 target/arm/kvm/kvm-cpu.c   | 128 +++++++++++++++++++++++++++++++++++++
 target/arm/kvm/meson.build |   1 +
 5 files changed, 137 insertions(+), 74 deletions(-)
 create mode 100644 target/arm/kvm/kvm-cpu.c

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 227a80ec21..522596d15f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1165,7 +1165,6 @@ static inline uint64_t useronly_maybe_clean_ptr(uint32_t desc, uint64_t ptr)
 
 #ifndef CONFIG_USER_ONLY
 void arm_cpu_set_irq(void *opaque, int irq, int level);
-void arm_cpu_kvm_set_irq(void *opaque, int irq, int level);
 bool arm_cpu_virtio_is_big_endian(CPUState *cs);
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index 26467c640b..fff55311f4 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -24,7 +24,6 @@
 #include "cpu.h"
 #include "internals.h"
 #include "sysemu/hw_accel.h"
-#include "kvm/kvm_arm.h"
 #include "sysemu/tcg.h"
 #include "tcg/tcg-cpu.h"
 
@@ -72,37 +71,6 @@ void arm_cpu_set_irq(void *opaque, int irq, int level)
     }
 }
 
-void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
-{
-#ifdef CONFIG_KVM
-    ARMCPU *cpu = opaque;
-    CPUARMState *env = &cpu->env;
-    CPUState *cs = CPU(cpu);
-    uint32_t linestate_bit;
-    int irq_id;
-
-    switch (irq) {
-    case ARM_CPU_IRQ:
-        irq_id = KVM_ARM_IRQ_CPU_IRQ;
-        linestate_bit = CPU_INTERRUPT_HARD;
-        break;
-    case ARM_CPU_FIQ:
-        irq_id = KVM_ARM_IRQ_CPU_FIQ;
-        linestate_bit = CPU_INTERRUPT_FIQ;
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (level) {
-        env->irq_line_state |= linestate_bit;
-    } else {
-        env->irq_line_state &= ~linestate_bit;
-    }
-    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
-#endif
-}
-
 bool arm_cpu_virtio_is_big_endian(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 57f975f5dc..0ecbfa060c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -42,6 +42,7 @@
 #include "disas/capstone.h"
 #include "fpu/softfloat.h"
 #include "cpu-mmu.h"
+#include "qemu/accel.h"
 
 static void arm_cpu_set_pc(CPUState *cs, vaddr value)
 {
@@ -409,11 +410,6 @@ static void arm_cpu_reset(DeviceState *dev)
                               &env->vfp.fp_status_f16);
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->vfp.standard_fp_status_f16);
-#ifndef CONFIG_USER_ONLY
-    if (kvm_enabled()) {
-        kvm_arm_reset_vcpu(cpu);
-    }
-#endif
 
     if (tcg_enabled()) {
         hw_breakpoint_update_all(cpu);
@@ -560,12 +556,7 @@ static void arm_cpu_initfn(Object *obj)
 
 #ifndef CONFIG_USER_ONLY
     /* Our inbound IRQ and FIQ lines */
-    if (kvm_enabled()) {
-        /* VIRQ and VFIQ are unused with KVM but we add them to maintain
-         * the same interface as non-KVM CPUs.
-         */
-        qdev_init_gpio_in(DEVICE(cpu), arm_cpu_kvm_set_irq, 4);
-    } else if (tcg_enabled() || qtest_enabled()) {
+    if (tcg_enabled() || qtest_enabled()) {
         qdev_init_gpio_in(DEVICE(cpu), arm_cpu_set_irq, 4);
     }
 
@@ -809,6 +800,9 @@ void arm_cpu_post_init(Object *obj)
         }
     }
 #endif
+
+    /* if required, do accelerator-specific cpu initializations */
+    accel_cpu_instance_init(CPU(obj));
 }
 
 static void arm_cpu_finalizefn(Object *obj)
@@ -878,16 +872,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     Error *local_err = NULL;
     bool no_aa32 = false;
 
-    /* If we needed to query the host kernel for the CPU features
+    /*
+     * If we needed to query the host kernel for the CPU features
      * then it's possible that might have failed in the initfn, but
      * this is the first point where we can report it.
      */
     if (cpu->host_cpu_probe_failed) {
-        if (!kvm_enabled()) {
-            error_setg(errp, "The 'host' CPU type can only be used with KVM");
-        } else {
-            error_setg(errp, "Failed to retrieve host CPU features");
-        }
+        error_setg(errp, "The 'host' CPU type can only be used with KVM");
         return;
     }
 
@@ -1486,26 +1477,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     arm32_cpu_class_init(oc, data);
 }
 
-#ifdef CONFIG_KVM
-static void arm_host_initfn(Object *obj)
-{
-    ARMCPU *cpu = ARM_CPU(obj);
-
-    kvm_arm_set_cpu_features_from_host(cpu);
-    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        aarch64_add_sve_properties(obj);
-    }
-    arm_cpu_post_init(obj);
-}
-
-static const TypeInfo host_arm_cpu_type_info = {
-    .name = TYPE_ARM_HOST_CPU,
-    .parent = TYPE_AARCH64_CPU,
-    .instance_init = arm_host_initfn,
-};
-
-#endif
-
 static const TypeInfo arm_cpu_type_info = {
     .name = TYPE_ARM_CPU,
     .parent = TYPE_CPU,
@@ -1521,10 +1492,6 @@ static const TypeInfo arm_cpu_type_info = {
 static void arm_cpu_register_types(void)
 {
     type_register_static(&arm_cpu_type_info);
-
-#ifdef CONFIG_KVM
-    type_register_static(&host_arm_cpu_type_info);
-#endif
 }
 
 type_init(arm_cpu_register_types)
diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
new file mode 100644
index 0000000000..5fbb127e61
--- /dev/null
+++ b/target/arm/kvm/kvm-cpu.c
@@ -0,0 +1,128 @@
+/*
+ * QEMU ARM CPU
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version 2
+ * of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see
+ * <http://www.gnu.org/licenses/gpl-2.0.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "cpu.h"
+#include "hw/core/accel-cpu.h"
+#include "qapi/error.h"
+
+#include "kvm/kvm_arm.h"
+#include "internals.h"
+
+static void arm_cpu_kvm_set_irq(void *opaque, int irq, int level)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    uint32_t linestate_bit;
+    int irq_id;
+
+    switch (irq) {
+    case ARM_CPU_IRQ:
+        irq_id = KVM_ARM_IRQ_CPU_IRQ;
+        linestate_bit = CPU_INTERRUPT_HARD;
+        break;
+    case ARM_CPU_FIQ:
+        irq_id = KVM_ARM_IRQ_CPU_FIQ;
+        linestate_bit = CPU_INTERRUPT_FIQ;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (level) {
+        env->irq_line_state |= linestate_bit;
+    } else {
+        env->irq_line_state &= ~linestate_bit;
+    }
+    kvm_arm_set_irq(cs->cpu_index, KVM_ARM_IRQ_TYPE_CPU, irq_id, !!level);
+}
+
+static void kvm_cpu_instance_init(CPUState *cs)
+{
+    /*
+     * VIRQ and VFIQ are unused with KVM but we add them to maintain
+     * the same interface as non-KVM CPUs.
+     */
+    qdev_init_gpio_in(DEVICE(cs), arm_cpu_kvm_set_irq, 4);
+}
+
+static bool kvm_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    /*
+     * If we needed to query the host kernel for the CPU features
+     * then it's possible that might have failed in the initfn, but
+     * this is the first point where we can report it.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+
+    if (cpu->host_cpu_probe_failed) {
+        error_setg(errp, "Failed to retrieve host CPU features");
+        return false;
+    }
+    return true;
+}
+
+static void host_cpu_instance_init(Object *obj)
+{
+    ARMCPU *cpu = ARM_CPU(obj);
+
+    kvm_arm_set_cpu_features_from_host(cpu);
+    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
+        aarch64_add_sve_properties(obj);
+    }
+    arm_cpu_post_init(obj);
+}
+
+static void kvm_cpu_reset(CPUState *cs)
+{
+    kvm_arm_reset_vcpu(ARM_CPU(cs));
+}
+
+static const TypeInfo host_cpu_type_info = {
+    .name = ARM_CPU_TYPE_NAME("host"),
+    .parent = TYPE_AARCH64_CPU,
+    .instance_init = host_cpu_instance_init,
+};
+
+static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+    acc->cpu_realizefn = kvm_cpu_realizefn;
+    acc->cpu_instance_init = kvm_cpu_instance_init;
+    acc->cpu_reset = kvm_cpu_reset;
+}
+
+static const TypeInfo kvm_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("kvm"),
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = kvm_cpu_accel_class_init,
+    .abstract = true,
+};
+
+static void kvm_cpu_accel_register_types(void)
+{
+    type_register_static(&host_cpu_type_info);
+    type_register_static(&kvm_cpu_accel_type_info);
+}
+
+type_init(kvm_cpu_accel_register_types);
diff --git a/target/arm/kvm/meson.build b/target/arm/kvm/meson.build
index e92010fa3f..ef58a29dd7 100644
--- a/target/arm/kvm/meson.build
+++ b/target/arm/kvm/meson.build
@@ -1,4 +1,5 @@
 arm_ss.add(when: 'CONFIG_KVM', if_true: files(
   'kvm.c',
   'kvm64.c',
+  'kvm-cpu.c',
 ))
-- 
2.20.1

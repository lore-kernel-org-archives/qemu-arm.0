Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q5sm6172567wmc.0.2021.06.04.10.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 10:12:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 744F01FFCD;
	Fri,  4 Jun 2021 16:53:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 54/99] target/arm: move TCGCPUOps to tcg/tcg-cpu.c
Date: Fri,  4 Jun 2021 16:52:27 +0100
Message-Id: <20210604155312.15902-55-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Na0rg6l9zb2p

From: Claudio Fontana <cfontana@suse.de>

move the TCGCPUOps interface to tcg/tcg-cpu.c
in preparation for the addition of the TCG accel-cpu class.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h           |   1 -
 target/arm/internals.h     |   5 -
 target/arm/tcg/tcg-cpu.h   |   6 +
 target/arm/cpu-sysemu.c    |   4 +
 target/arm/cpu.c           | 210 +---------------------------------
 target/arm/cpu_tcg.c       |   2 +-
 target/arm/tcg/helper.c    |   1 +
 target/arm/tcg/tcg-cpu.c   | 229 +++++++++++++++++++++++++++++++++++++
 target/arm/tcg/meson.build |   1 +
 9 files changed, 244 insertions(+), 215 deletions(-)
 create mode 100644 target/arm/tcg/tcg-cpu.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c5ead3365f..e528873ed3 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1031,7 +1031,6 @@ extern const VMStateDescription vmstate_arm_cpu;
 
 void arm_cpu_do_interrupt(CPUState *cpu);
 void arm_v7m_cpu_do_interrupt(CPUState *cpu);
-bool arm_cpu_exec_interrupt(CPUState *cpu, int int_req);
 
 int arm_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/arm/internals.h b/target/arm/internals.h
index c41f91f1c0..227a80ec21 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -173,11 +173,6 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
-#ifdef CONFIG_TCG
-void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
-#endif /* CONFIG_TCG */
-
-
 enum arm_fprounding {
     FPROUNDING_TIEEVEN,
     FPROUNDING_POSINF,
diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
index 7e62f92d16..d93c6a6749 100644
--- a/target/arm/tcg/tcg-cpu.h
+++ b/target/arm/tcg/tcg-cpu.h
@@ -21,6 +21,12 @@
 #define ARM_TCG_CPU_H
 
 #include "cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
+
+void arm_cpu_synchronize_from_tb(CPUState *cs,
+                                 const TranslationBlock *tb);
+
+extern struct TCGCPUOps arm_tcg_ops;
 
 #ifndef CONFIG_USER_ONLY
 /* Do semihosting call and set the appropriate return value. */
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index e83d55b9f7..c09c89eeac 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -28,6 +28,10 @@
 #include "sysemu/tcg.h"
 #include "tcg/tcg-cpu.h"
 
+#ifdef CONFIG_TCG
+#include "tcg/tcg-cpu.h"
+#endif /* CONFIG_TCG */
+
 void arm_cpu_set_irq(void *opaque, int irq, int level)
 {
     ARMCPU *cpu = opaque;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 97d562bbd5..192700fe8f 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -27,7 +27,7 @@
 #include "cpu.h"
 #include "cpregs.h"
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "tcg/tcg-cpu.h"
 #endif /* CONFIG_TCG */
 #include "cpu32.h"
 #include "internals.h"
@@ -58,25 +58,6 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
     }
 }
 
-#ifdef CONFIG_TCG
-void arm_cpu_synchronize_from_tb(CPUState *cs,
-                                 const TranslationBlock *tb)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-
-    /*
-     * It's OK to look at env for the current mode here, because it's
-     * never possible for an AArch64 TB to chain to an AArch32 TB.
-     */
-    if (is_a64(env)) {
-        env->pc = tb->pc;
-    } else {
-        env->regs[15] = tb->pc;
-    }
-}
-#endif /* CONFIG_TCG */
-
 static bool arm_cpu_has_work(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
@@ -442,175 +423,6 @@ static void arm_cpu_reset(DeviceState *dev)
     }
 }
 
-static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
-                                     unsigned int target_el,
-                                     unsigned int cur_el, bool secure,
-                                     uint64_t hcr_el2)
-{
-    CPUARMState *env = cs->env_ptr;
-    bool pstate_unmasked;
-    bool unmasked = false;
-
-    /*
-     * Don't take exceptions if they target a lower EL.
-     * This check should catch any exceptions that would not be taken
-     * but left pending.
-     */
-    if (cur_el > target_el) {
-        return false;
-    }
-
-    switch (excp_idx) {
-    case EXCP_FIQ:
-        pstate_unmasked = !(env->daif & PSTATE_F);
-        break;
-
-    case EXCP_IRQ:
-        pstate_unmasked = !(env->daif & PSTATE_I);
-        break;
-
-    case EXCP_VFIQ:
-        if (!(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
-            /* VFIQs are only taken when hypervized.  */
-            return false;
-        }
-        return !(env->daif & PSTATE_F);
-    case EXCP_VIRQ:
-        if (!(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
-            /* VIRQs are only taken when hypervized.  */
-            return false;
-        }
-        return !(env->daif & PSTATE_I);
-    default:
-        g_assert_not_reached();
-    }
-
-    /*
-     * Use the target EL, current execution state and SCR/HCR settings to
-     * determine whether the corresponding CPSR bit is used to mask the
-     * interrupt.
-     */
-    if ((target_el > cur_el) && (target_el != 1)) {
-        /* Exceptions targeting a higher EL may not be maskable */
-        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
-            /*
-             * 64-bit masking rules are simple: exceptions to EL3
-             * can't be masked, and exceptions to EL2 can only be
-             * masked from Secure state. The HCR and SCR settings
-             * don't affect the masking logic, only the interrupt routing.
-             */
-            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
-                unmasked = true;
-            }
-        } else {
-            /*
-             * The old 32-bit-only environment has a more complicated
-             * masking setup. HCR and SCR bits not only affect interrupt
-             * routing but also change the behaviour of masking.
-             */
-            bool hcr, scr;
-
-            switch (excp_idx) {
-            case EXCP_FIQ:
-                /*
-                 * If FIQs are routed to EL3 or EL2 then there are cases where
-                 * we override the CPSR.F in determining if the exception is
-                 * masked or not. If neither of these are set then we fall back
-                 * to the CPSR.F setting otherwise we further assess the state
-                 * below.
-                 */
-                hcr = hcr_el2 & HCR_FMO;
-                scr = (env->cp15.scr_el3 & SCR_FIQ);
-
-                /*
-                 * When EL3 is 32-bit, the SCR.FW bit controls whether the
-                 * CPSR.F bit masks FIQ interrupts when taken in non-secure
-                 * state. If SCR.FW is set then FIQs can be masked by CPSR.F
-                 * when non-secure but only when FIQs are only routed to EL3.
-                 */
-                scr = scr && !((env->cp15.scr_el3 & SCR_FW) && !hcr);
-                break;
-            case EXCP_IRQ:
-                /*
-                 * When EL3 execution state is 32-bit, if HCR.IMO is set then
-                 * we may override the CPSR.I masking when in non-secure state.
-                 * The SCR.IRQ setting has already been taken into consideration
-                 * when setting the target EL, so it does not have a further
-                 * affect here.
-                 */
-                hcr = hcr_el2 & HCR_IMO;
-                scr = false;
-                break;
-            default:
-                g_assert_not_reached();
-            }
-
-            if ((scr || hcr) && !secure) {
-                unmasked = true;
-            }
-        }
-    }
-
-    /*
-     * The PSTATE bits only mask the interrupt if we have not overriden the
-     * ability above.
-     */
-    return unmasked || pstate_unmasked;
-}
-
-bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
-{
-    CPUClass *cc = CPU_GET_CLASS(cs);
-    CPUARMState *env = cs->env_ptr;
-    uint32_t cur_el = arm_current_el(env);
-    bool secure = arm_is_secure(env);
-    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
-    uint32_t target_el;
-    uint32_t excp_idx;
-
-    /* The prioritization of interrupts is IMPLEMENTATION DEFINED. */
-
-    if (interrupt_request & CPU_INTERRUPT_FIQ) {
-        excp_idx = EXCP_FIQ;
-        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
-        if (arm_excp_unmasked(cs, excp_idx, target_el,
-                              cur_el, secure, hcr_el2)) {
-            goto found;
-        }
-    }
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
-        excp_idx = EXCP_IRQ;
-        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
-        if (arm_excp_unmasked(cs, excp_idx, target_el,
-                              cur_el, secure, hcr_el2)) {
-            goto found;
-        }
-    }
-    if (interrupt_request & CPU_INTERRUPT_VIRQ) {
-        excp_idx = EXCP_VIRQ;
-        target_el = 1;
-        if (arm_excp_unmasked(cs, excp_idx, target_el,
-                              cur_el, secure, hcr_el2)) {
-            goto found;
-        }
-    }
-    if (interrupt_request & CPU_INTERRUPT_VFIQ) {
-        excp_idx = EXCP_VFIQ;
-        target_el = 1;
-        if (arm_excp_unmasked(cs, excp_idx, target_el,
-                              cur_el, secure, hcr_el2)) {
-            goto found;
-        }
-    }
-    return false;
-
- found:
-    cs->exception_index = excp_idx;
-    env->exception.target_el = target_el;
-    cc->tcg_ops->do_interrupt(cs);
-    return true;
-}
-
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
     /*
@@ -1015,6 +827,7 @@ static void arm_cpu_finalizefn(Object *obj)
         QLIST_REMOVE(hook, node);
         g_free(hook);
     }
+
 #ifndef CONFIG_USER_ONLY
     if (cpu->pmu_timer) {
         timer_free(cpu->pmu_timer);
@@ -1644,25 +1457,6 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
     .legacy_vmsd = &vmstate_arm_cpu,
 };
 #endif
-
-#ifdef CONFIG_TCG
-static const struct TCGCPUOps arm_tcg_ops = {
-    .initialize = arm_translate_init,
-    .synchronize_from_tb = arm_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
-    .tlb_fill = arm_cpu_tlb_fill,
-    .debug_excp_handler = arm_debug_excp_handler,
-
-#if !defined(CONFIG_USER_ONLY)
-    .do_interrupt = arm_cpu_do_interrupt,
-    .do_transaction_failed = arm_cpu_do_transaction_failed,
-    .do_unaligned_access = arm_cpu_do_unaligned_access,
-    .adjust_watchpoint_address = arm_adjust_watchpoint_address,
-    .debug_check_watchpoint = arm_debug_check_watchpoint,
-#endif /* !CONFIG_USER_ONLY */
-};
-#endif /* CONFIG_TCG */
-
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index fe422498c7..4606ad8436 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -11,7 +11,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
+#include "tcg/tcg-cpu.h"
 #endif /* CONFIG_TCG */
 #include "internals.h"
 #include "target/arm/idau.h"
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index a8b1efdb36..38cc7c6a3d 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -16,6 +16,7 @@
 #include "arm_ldst.h"
 #include "cpu-mmu.h"
 #include "cpregs.h"
+#include "tcg-cpu.h"
 
 static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
diff --git a/target/arm/tcg/tcg-cpu.c b/target/arm/tcg/tcg-cpu.c
new file mode 100644
index 0000000000..9fd996d908
--- /dev/null
+++ b/target/arm/tcg/tcg-cpu.c
@@ -0,0 +1,229 @@
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
+#include "cpu.h"
+#include "tcg-cpu.h"
+#include "hw/core/tcg-cpu-ops.h"
+#include "cpregs.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+
+void arm_cpu_synchronize_from_tb(CPUState *cs,
+                                 const TranslationBlock *tb)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    /*
+     * It's OK to look at env for the current mode here, because it's
+     * never possible for an AArch64 TB to chain to an AArch32 TB.
+     */
+    if (is_a64(env)) {
+        env->pc = tb->pc;
+    } else {
+        env->regs[15] = tb->pc;
+    }
+}
+
+static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
+                                     unsigned int target_el,
+                                     unsigned int cur_el, bool secure,
+                                     uint64_t hcr_el2)
+{
+    CPUARMState *env = cs->env_ptr;
+    bool pstate_unmasked;
+    bool unmasked = false;
+
+    /*
+     * Don't take exceptions if they target a lower EL.
+     * This check should catch any exceptions that would not be taken
+     * but left pending.
+     */
+    if (cur_el > target_el) {
+        return false;
+    }
+
+    switch (excp_idx) {
+    case EXCP_FIQ:
+        pstate_unmasked = !(env->daif & PSTATE_F);
+        break;
+
+    case EXCP_IRQ:
+        pstate_unmasked = !(env->daif & PSTATE_I);
+        break;
+
+    case EXCP_VFIQ:
+        if (!(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
+            /* VFIQs are only taken when hypervized.  */
+            return false;
+        }
+        return !(env->daif & PSTATE_F);
+    case EXCP_VIRQ:
+        if (!(hcr_el2 & HCR_IMO) || (hcr_el2 & HCR_TGE)) {
+            /* VIRQs are only taken when hypervized.  */
+            return false;
+        }
+        return !(env->daif & PSTATE_I);
+    default:
+        g_assert_not_reached();
+    }
+
+    /*
+     * Use the target EL, current execution state and SCR/HCR settings to
+     * determine whether the corresponding CPSR bit is used to mask the
+     * interrupt.
+     */
+    if ((target_el > cur_el) && (target_el != 1)) {
+        /* Exceptions targeting a higher EL may not be maskable */
+        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
+            /*
+             * 64-bit masking rules are simple: exceptions to EL3
+             * can't be masked, and exceptions to EL2 can only be
+             * masked from Secure state. The HCR and SCR settings
+             * don't affect the masking logic, only the interrupt routing.
+             */
+            if (target_el == 3 || !secure || (env->cp15.scr_el3 & SCR_EEL2)) {
+                unmasked = true;
+            }
+        } else {
+            /*
+             * The old 32-bit-only environment has a more complicated
+             * masking setup. HCR and SCR bits not only affect interrupt
+             * routing but also change the behaviour of masking.
+             */
+            bool hcr, scr;
+
+            switch (excp_idx) {
+            case EXCP_FIQ:
+                /*
+                 * If FIQs are routed to EL3 or EL2 then there are cases where
+                 * we override the CPSR.F in determining if the exception is
+                 * masked or not. If neither of these are set then we fall back
+                 * to the CPSR.F setting otherwise we further assess the state
+                 * below.
+                 */
+                hcr = hcr_el2 & HCR_FMO;
+                scr = (env->cp15.scr_el3 & SCR_FIQ);
+
+                /*
+                 * When EL3 is 32-bit, the SCR.FW bit controls whether the
+                 * CPSR.F bit masks FIQ interrupts when taken in non-secure
+                 * state. If SCR.FW is set then FIQs can be masked by CPSR.F
+                 * when non-secure but only when FIQs are only routed to EL3.
+                 */
+                scr = scr && !((env->cp15.scr_el3 & SCR_FW) && !hcr);
+                break;
+            case EXCP_IRQ:
+                /*
+                 * When EL3 execution state is 32-bit, if HCR.IMO is set then
+                 * we may override the CPSR.I masking when in non-secure state.
+                 * The SCR.IRQ setting has already been taken into consideration
+                 * when setting the target EL, so it does not have a further
+                 * affect here.
+                 */
+                hcr = hcr_el2 & HCR_IMO;
+                scr = false;
+                break;
+            default:
+                g_assert_not_reached();
+            }
+
+            if ((scr || hcr) && !secure) {
+                unmasked = true;
+            }
+        }
+    }
+
+    /*
+     * The PSTATE bits only mask the interrupt if we have not overriden the
+     * ability above.
+     */
+    return unmasked || pstate_unmasked;
+}
+
+static bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    CPUClass *cc = CPU_GET_CLASS(cs);
+    CPUARMState *env = cs->env_ptr;
+    uint32_t cur_el = arm_current_el(env);
+    bool secure = arm_is_secure(env);
+    uint64_t hcr_el2 = arm_hcr_el2_eff(env);
+    uint32_t target_el;
+    uint32_t excp_idx;
+
+    /* The prioritization of interrupts is IMPLEMENTATION DEFINED. */
+
+    if (interrupt_request & CPU_INTERRUPT_FIQ) {
+        excp_idx = EXCP_FIQ;
+        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            goto found;
+        }
+    }
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        excp_idx = EXCP_IRQ;
+        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            goto found;
+        }
+    }
+    if (interrupt_request & CPU_INTERRUPT_VIRQ) {
+        excp_idx = EXCP_VIRQ;
+        target_el = 1;
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            goto found;
+        }
+    }
+    if (interrupt_request & CPU_INTERRUPT_VFIQ) {
+        excp_idx = EXCP_VFIQ;
+        target_el = 1;
+        if (arm_excp_unmasked(cs, excp_idx, target_el,
+                              cur_el, secure, hcr_el2)) {
+            goto found;
+        }
+    }
+    return false;
+
+ found:
+    cs->exception_index = excp_idx;
+    env->exception.target_el = target_el;
+    cc->tcg_ops->do_interrupt(cs);
+    return true;
+}
+
+struct TCGCPUOps arm_tcg_ops = {
+    .initialize = arm_translate_init,
+    .synchronize_from_tb = arm_cpu_synchronize_from_tb,
+    .cpu_exec_interrupt = arm_cpu_exec_interrupt,
+    .tlb_fill = arm_cpu_tlb_fill,
+    .debug_excp_handler = arm_debug_excp_handler,
+
+#if !defined(CONFIG_USER_ONLY)
+    .do_interrupt = arm_cpu_do_interrupt,
+    .do_transaction_failed = arm_cpu_do_transaction_failed,
+    .do_unaligned_access = arm_cpu_do_unaligned_access,
+    .adjust_watchpoint_address = arm_adjust_watchpoint_address,
+    .debug_check_watchpoint = arm_debug_check_watchpoint,
+#endif /* !CONFIG_USER_ONLY */
+};
diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 64a86fd94c..4e690eea6c 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -31,6 +31,7 @@ arm_ss.add(when: 'CONFIG_TCG', if_true: files(
   'vfp_helper.c',
   'crypto_helper.c',
   'debug_helper.c',
+  'tcg-cpu.c',
 
 ), if_false: files(
   'tcg-stubs.c',
-- 
2.20.1

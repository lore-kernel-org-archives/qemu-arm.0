Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z3sm7565593wrl.13.2021.06.04.09.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:02:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E95011FFB8;
	Fri,  4 Jun 2021 16:53:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 32/99] target/arm: move cpsr_read, cpsr_write to cpu_common
Date: Fri,  4 Jun 2021 16:52:05 +0100
Message-Id: <20210604155312.15902-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8ivLUWJxcioh

From: Claudio Fontana <cfontana@suse.de>

we need as a result to move switch_mode too,
so we put an implementation into cpu_user and cpu_sysemu.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h        |   2 +
 target/arm/cpu-common.c | 192 +++++++++++++++++++++++++++++++++++
 target/arm/cpu-sysemu.c |  30 ++++++
 target/arm/cpu-user.c   |  24 +++++
 target/arm/tcg/helper.c | 220 ----------------------------------------
 target/arm/meson.build  |   3 +
 6 files changed, 251 insertions(+), 220 deletions(-)
 create mode 100644 target/arm/cpu-user.c

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index adb9d2828d..c5ead3365f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1390,6 +1390,8 @@ typedef enum CPSRWriteType {
 void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
                 CPSRWriteType write_type);
 
+void switch_mode(CPUARMState *env, int mode);
+
 /* Return the current xPSR value.  */
 static inline uint32_t xpsr_read(CPUARMState *env)
 {
diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index 0f8ca94815..694e5d73f3 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -7,10 +7,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qom/object.h"
 #include "qapi/qapi-commands-machine-target.h"
 #include "qapi/error.h"
 #include "cpu.h"
+#include "internals.h"
 
 static void arm_cpu_add_definition(gpointer data, gpointer user_data)
 {
@@ -39,3 +41,193 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 
     return cpu_list;
 }
+
+uint32_t cpsr_read(CPUARMState *env)
+{
+    int ZF;
+    ZF = (env->ZF == 0);
+    return env->uncached_cpsr | (env->NF & 0x80000000) | (ZF << 30) |
+        (env->CF << 29) | ((env->VF & 0x80000000) >> 3) | (env->QF << 27)
+        | (env->thumb << 5) | ((env->condexec_bits & 3) << 25)
+        | ((env->condexec_bits & 0xfc) << 8)
+        | (env->GE << 16) | (env->daif & CPSR_AIF);
+}
+
+static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
+{
+    /*
+     * Return true if it is not valid for us to switch to
+     * this CPU mode (ie all the UNPREDICTABLE cases in
+     * the ARM ARM CPSRWriteByInstr pseudocode).
+     */
+
+    /* Changes to or from Hyp via MSR and CPS are illegal. */
+    if (write_type == CPSRWriteByInstr &&
+        ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_HYP ||
+         mode == ARM_CPU_MODE_HYP)) {
+        return 1;
+    }
+
+    switch (mode) {
+    case ARM_CPU_MODE_USR:
+        return 0;
+    case ARM_CPU_MODE_SYS:
+    case ARM_CPU_MODE_SVC:
+    case ARM_CPU_MODE_ABT:
+    case ARM_CPU_MODE_UND:
+    case ARM_CPU_MODE_IRQ:
+    case ARM_CPU_MODE_FIQ:
+        /*
+         * Note that we don't implement the IMPDEF NSACR.RFR which in v7
+         * allows FIQ mode to be Secure-only. (In v8 this doesn't exist.)
+         *
+         * If HCR.TGE is set then changes from Monitor to NS PL1 via MSR
+         * and CPS are treated as illegal mode changes.
+         */
+        if (write_type == CPSRWriteByInstr &&
+            (env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON &&
+            (arm_hcr_el2_eff(env) & HCR_TGE)) {
+            return 1;
+        }
+        return 0;
+    case ARM_CPU_MODE_HYP:
+        return !arm_is_el2_enabled(env) || arm_current_el(env) < 2;
+    case ARM_CPU_MODE_MON:
+        return arm_current_el(env) < 3;
+    default:
+        return 1;
+    }
+}
+
+void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
+                CPSRWriteType write_type)
+{
+    uint32_t changed_daif;
+
+    if (mask & CPSR_NZCV) {
+        env->ZF = (~val) & CPSR_Z;
+        env->NF = val;
+        env->CF = (val >> 29) & 1;
+        env->VF = (val << 3) & 0x80000000;
+    }
+    if (mask & CPSR_Q) {
+        env->QF = ((val & CPSR_Q) != 0);
+    }
+    if (mask & CPSR_T) {
+        env->thumb = ((val & CPSR_T) != 0);
+    }
+    if (mask & CPSR_IT_0_1) {
+        env->condexec_bits &= ~3;
+        env->condexec_bits |= (val >> 25) & 3;
+    }
+    if (mask & CPSR_IT_2_7) {
+        env->condexec_bits &= 3;
+        env->condexec_bits |= (val >> 8) & 0xfc;
+    }
+    if (mask & CPSR_GE) {
+        env->GE = (val >> 16) & 0xf;
+    }
+
+    /*
+     * In a V7 implementation that includes the security extensions but does
+     * not include Virtualization Extensions the SCR.FW and SCR.AW bits control
+     * whether non-secure software is allowed to change the CPSR_F and CPSR_A
+     * bits respectively.
+     *
+     * In a V8 implementation, it is permitted for privileged software to
+     * change the CPSR A/F bits regardless of the SCR.AW/FW bits.
+     */
+    if (write_type != CPSRWriteRaw && !arm_feature(env, ARM_FEATURE_V8) &&
+        arm_feature(env, ARM_FEATURE_EL3) &&
+        !arm_feature(env, ARM_FEATURE_EL2) &&
+        !arm_is_secure(env)) {
+
+        changed_daif = (env->daif ^ val) & mask;
+
+        if (changed_daif & CPSR_A) {
+            /*
+             * Check to see if we are allowed to change the masking of async
+             * abort exceptions from a non-secure state.
+             */
+            if (!(env->cp15.scr_el3 & SCR_AW)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Ignoring attempt to switch CPSR_A flag from "
+                              "non-secure world with SCR.AW bit clear\n");
+                mask &= ~CPSR_A;
+            }
+        }
+
+        if (changed_daif & CPSR_F) {
+            /*
+             * Check to see if we are allowed to change the masking of FIQ
+             * exceptions from a non-secure state.
+             */
+            if (!(env->cp15.scr_el3 & SCR_FW)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Ignoring attempt to switch CPSR_F flag from "
+                              "non-secure world with SCR.FW bit clear\n");
+                mask &= ~CPSR_F;
+            }
+
+            /*
+             * Check whether non-maskable FIQ (NMFI) support is enabled.
+             * If this bit is set software is not allowed to mask
+             * FIQs, but is allowed to set CPSR_F to 0.
+             */
+            if ((A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_NMFI) &&
+                (val & CPSR_F)) {
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Ignoring attempt to enable CPSR_F flag "
+                              "(non-maskable FIQ [NMFI] support enabled)\n");
+                mask &= ~CPSR_F;
+            }
+        }
+    }
+
+    env->daif &= ~(CPSR_AIF & mask);
+    env->daif |= val & CPSR_AIF & mask;
+
+    if (write_type != CPSRWriteRaw &&
+        ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
+        if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR) {
+            /*
+             * Note that we can only get here in USR mode if this is a
+             * gdb stub write; for this case we follow the architectural
+             * behaviour for guest writes in USR mode of ignoring an attempt
+             * to switch mode. (Those are caught by translate.c for writes
+             * triggered by guest instructions.)
+             */
+            mask &= ~CPSR_M;
+        } else if (bad_mode_switch(env, val & CPSR_M, write_type)) {
+            /*
+             * Attempt to switch to an invalid mode: this is UNPREDICTABLE in
+             * v7, and has defined behaviour in v8:
+             *  + leave CPSR.M untouched
+             *  + allow changes to the other CPSR fields
+             *  + set PSTATE.IL
+             * For user changes via the GDB stub, we don't set PSTATE.IL,
+             * as this would be unnecessarily harsh for a user error.
+             */
+            mask &= ~CPSR_M;
+            if (write_type != CPSRWriteByGDBStub &&
+                arm_feature(env, ARM_FEATURE_V8)) {
+                mask |= CPSR_IL;
+                val |= CPSR_IL;
+            }
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "Illegal AArch32 mode switch attempt from %s to %s\n",
+                          aarch32_mode_name(env->uncached_cpsr),
+                          aarch32_mode_name(val));
+        } else {
+            qemu_log_mask(CPU_LOG_INT, "%s %s to %s PC 0x%" PRIx32 "\n",
+                          write_type == CPSRWriteExceptionReturn ?
+                          "Exception return from AArch32" :
+                          "AArch32 mode switch from",
+                          aarch32_mode_name(env->uncached_cpsr),
+                          aarch32_mode_name(val), env->regs[15]);
+            switch_mode(env, val & CPSR_M);
+        }
+    }
+    mask &= ~CACHED_CPSR_BITS;
+    env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
+}
diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
index db1c8cb245..3add2c2439 100644
--- a/target/arm/cpu-sysemu.c
+++ b/target/arm/cpu-sysemu.c
@@ -103,3 +103,33 @@ bool arm_cpu_virtio_is_big_endian(CPUState *cs)
     cpu_synchronize_state(cs);
     return arm_cpu_data_is_big_endian(env);
 }
+
+void switch_mode(CPUARMState *env, int mode)
+{
+    int old_mode;
+    int i;
+
+    old_mode = env->uncached_cpsr & CPSR_M;
+    if (mode == old_mode) {
+        return;
+    }
+
+    if (old_mode == ARM_CPU_MODE_FIQ) {
+        memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
+    } else if (mode == ARM_CPU_MODE_FIQ) {
+        memcpy(env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
+    }
+
+    i = bank_number(old_mode);
+    env->banked_r13[i] = env->regs[13];
+    env->banked_spsr[i] = env->spsr;
+
+    i = bank_number(mode);
+    env->regs[13] = env->banked_r13[i];
+    env->spsr = env->banked_spsr[i];
+
+    env->banked_r14[r14_bank_number(old_mode)] = env->regs[14];
+    env->regs[14] = env->banked_r14[r14_bank_number(mode)];
+}
diff --git a/target/arm/cpu-user.c b/target/arm/cpu-user.c
new file mode 100644
index 0000000000..a72b7f5703
--- /dev/null
+++ b/target/arm/cpu-user.c
@@ -0,0 +1,24 @@
+/*
+ * ARM CPU user-mode only code
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+#include "qapi/qapi-commands-machine-target.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "internals.h"
+
+void switch_mode(CPUARMState *env, int mode)
+{
+    ARMCPU *cpu = env_archcpu(env);
+
+    if (mode != ARM_CPU_MODE_USR) {
+        cpu_abort(CPU(cpu), "Tried to switch out of user mode\n");
+    }
+}
diff --git a/target/arm/tcg/helper.c b/target/arm/tcg/helper.c
index f54ece9b42..d32f9659bc 100644
--- a/target/arm/tcg/helper.c
+++ b/target/arm/tcg/helper.c
@@ -38,8 +38,6 @@
 #include "cpu-mmu.h"
 #include "cpregs.h"
 
-static void switch_mode(CPUARMState *env, int mode);
-
 static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -696,186 +694,6 @@ void arm_cpu_list(void)
     g_slist_free(list);
 }
 
-static int bad_mode_switch(CPUARMState *env, int mode, CPSRWriteType write_type)
-{
-    /* Return true if it is not valid for us to switch to
-     * this CPU mode (ie all the UNPREDICTABLE cases in
-     * the ARM ARM CPSRWriteByInstr pseudocode).
-     */
-
-    /* Changes to or from Hyp via MSR and CPS are illegal. */
-    if (write_type == CPSRWriteByInstr &&
-        ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_HYP ||
-         mode == ARM_CPU_MODE_HYP)) {
-        return 1;
-    }
-
-    switch (mode) {
-    case ARM_CPU_MODE_USR:
-        return 0;
-    case ARM_CPU_MODE_SYS:
-    case ARM_CPU_MODE_SVC:
-    case ARM_CPU_MODE_ABT:
-    case ARM_CPU_MODE_UND:
-    case ARM_CPU_MODE_IRQ:
-    case ARM_CPU_MODE_FIQ:
-        /* Note that we don't implement the IMPDEF NSACR.RFR which in v7
-         * allows FIQ mode to be Secure-only. (In v8 this doesn't exist.)
-         */
-        /* If HCR.TGE is set then changes from Monitor to NS PL1 via MSR
-         * and CPS are treated as illegal mode changes.
-         */
-        if (write_type == CPSRWriteByInstr &&
-            (env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_MON &&
-            (arm_hcr_el2_eff(env) & HCR_TGE)) {
-            return 1;
-        }
-        return 0;
-    case ARM_CPU_MODE_HYP:
-        return !arm_is_el2_enabled(env) || arm_current_el(env) < 2;
-    case ARM_CPU_MODE_MON:
-        return arm_current_el(env) < 3;
-    default:
-        return 1;
-    }
-}
-
-uint32_t cpsr_read(CPUARMState *env)
-{
-    int ZF;
-    ZF = (env->ZF == 0);
-    return env->uncached_cpsr | (env->NF & 0x80000000) | (ZF << 30) |
-        (env->CF << 29) | ((env->VF & 0x80000000) >> 3) | (env->QF << 27)
-        | (env->thumb << 5) | ((env->condexec_bits & 3) << 25)
-        | ((env->condexec_bits & 0xfc) << 8)
-        | (env->GE << 16) | (env->daif & CPSR_AIF);
-}
-
-void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
-                CPSRWriteType write_type)
-{
-    uint32_t changed_daif;
-
-    if (mask & CPSR_NZCV) {
-        env->ZF = (~val) & CPSR_Z;
-        env->NF = val;
-        env->CF = (val >> 29) & 1;
-        env->VF = (val << 3) & 0x80000000;
-    }
-    if (mask & CPSR_Q)
-        env->QF = ((val & CPSR_Q) != 0);
-    if (mask & CPSR_T)
-        env->thumb = ((val & CPSR_T) != 0);
-    if (mask & CPSR_IT_0_1) {
-        env->condexec_bits &= ~3;
-        env->condexec_bits |= (val >> 25) & 3;
-    }
-    if (mask & CPSR_IT_2_7) {
-        env->condexec_bits &= 3;
-        env->condexec_bits |= (val >> 8) & 0xfc;
-    }
-    if (mask & CPSR_GE) {
-        env->GE = (val >> 16) & 0xf;
-    }
-
-    /* In a V7 implementation that includes the security extensions but does
-     * not include Virtualization Extensions the SCR.FW and SCR.AW bits control
-     * whether non-secure software is allowed to change the CPSR_F and CPSR_A
-     * bits respectively.
-     *
-     * In a V8 implementation, it is permitted for privileged software to
-     * change the CPSR A/F bits regardless of the SCR.AW/FW bits.
-     */
-    if (write_type != CPSRWriteRaw && !arm_feature(env, ARM_FEATURE_V8) &&
-        arm_feature(env, ARM_FEATURE_EL3) &&
-        !arm_feature(env, ARM_FEATURE_EL2) &&
-        !arm_is_secure(env)) {
-
-        changed_daif = (env->daif ^ val) & mask;
-
-        if (changed_daif & CPSR_A) {
-            /* Check to see if we are allowed to change the masking of async
-             * abort exceptions from a non-secure state.
-             */
-            if (!(env->cp15.scr_el3 & SCR_AW)) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "Ignoring attempt to switch CPSR_A flag from "
-                              "non-secure world with SCR.AW bit clear\n");
-                mask &= ~CPSR_A;
-            }
-        }
-
-        if (changed_daif & CPSR_F) {
-            /* Check to see if we are allowed to change the masking of FIQ
-             * exceptions from a non-secure state.
-             */
-            if (!(env->cp15.scr_el3 & SCR_FW)) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "Ignoring attempt to switch CPSR_F flag from "
-                              "non-secure world with SCR.FW bit clear\n");
-                mask &= ~CPSR_F;
-            }
-
-            /* Check whether non-maskable FIQ (NMFI) support is enabled.
-             * If this bit is set software is not allowed to mask
-             * FIQs, but is allowed to set CPSR_F to 0.
-             */
-            if ((A32_BANKED_CURRENT_REG_GET(env, sctlr) & SCTLR_NMFI) &&
-                (val & CPSR_F)) {
-                qemu_log_mask(LOG_GUEST_ERROR,
-                              "Ignoring attempt to enable CPSR_F flag "
-                              "(non-maskable FIQ [NMFI] support enabled)\n");
-                mask &= ~CPSR_F;
-            }
-        }
-    }
-
-    env->daif &= ~(CPSR_AIF & mask);
-    env->daif |= val & CPSR_AIF & mask;
-
-    if (write_type != CPSRWriteRaw &&
-        ((env->uncached_cpsr ^ val) & mask & CPSR_M)) {
-        if ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR) {
-            /* Note that we can only get here in USR mode if this is a
-             * gdb stub write; for this case we follow the architectural
-             * behaviour for guest writes in USR mode of ignoring an attempt
-             * to switch mode. (Those are caught by translate.c for writes
-             * triggered by guest instructions.)
-             */
-            mask &= ~CPSR_M;
-        } else if (bad_mode_switch(env, val & CPSR_M, write_type)) {
-            /* Attempt to switch to an invalid mode: this is UNPREDICTABLE in
-             * v7, and has defined behaviour in v8:
-             *  + leave CPSR.M untouched
-             *  + allow changes to the other CPSR fields
-             *  + set PSTATE.IL
-             * For user changes via the GDB stub, we don't set PSTATE.IL,
-             * as this would be unnecessarily harsh for a user error.
-             */
-            mask &= ~CPSR_M;
-            if (write_type != CPSRWriteByGDBStub &&
-                arm_feature(env, ARM_FEATURE_V8)) {
-                mask |= CPSR_IL;
-                val |= CPSR_IL;
-            }
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "Illegal AArch32 mode switch attempt from %s to %s\n",
-                          aarch32_mode_name(env->uncached_cpsr),
-                          aarch32_mode_name(val));
-        } else {
-            qemu_log_mask(CPU_LOG_INT, "%s %s to %s PC 0x%" PRIx32 "\n",
-                          write_type == CPSRWriteExceptionReturn ?
-                          "Exception return from AArch32" :
-                          "AArch32 mode switch from",
-                          aarch32_mode_name(env->uncached_cpsr),
-                          aarch32_mode_name(val), env->regs[15]);
-            switch_mode(env, val & CPSR_M);
-        }
-    }
-    mask &= ~CACHED_CPSR_BITS;
-    env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
-}
-
 /* Sign/zero extend */
 uint32_t HELPER(sxtb16)(uint32_t x)
 {
@@ -916,15 +734,6 @@ uint32_t HELPER(rbit)(uint32_t x)
 
 #ifdef CONFIG_USER_ONLY
 
-static void switch_mode(CPUARMState *env, int mode)
-{
-    ARMCPU *cpu = env_archcpu(env);
-
-    if (mode != ARM_CPU_MODE_USR) {
-        cpu_abort(CPU(cpu), "Tried to switch out of user mode\n");
-    }
-}
-
 uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure)
 {
@@ -938,35 +747,6 @@ void aarch64_sync_64_to_32(CPUARMState *env)
 
 #else
 
-static void switch_mode(CPUARMState *env, int mode)
-{
-    int old_mode;
-    int i;
-
-    old_mode = env->uncached_cpsr & CPSR_M;
-    if (mode == old_mode)
-        return;
-
-    if (old_mode == ARM_CPU_MODE_FIQ) {
-        memcpy (env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy (env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
-    } else if (mode == ARM_CPU_MODE_FIQ) {
-        memcpy (env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy (env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
-    }
-
-    i = bank_number(old_mode);
-    env->banked_r13[i] = env->regs[13];
-    env->banked_spsr[i] = env->spsr;
-
-    i = bank_number(mode);
-    env->regs[13] = env->banked_r13[i];
-    env->spsr = env->banked_spsr[i];
-
-    env->banked_r14[r14_bank_number(old_mode)] = env->regs[14];
-    env->regs[14] = env->banked_r14[r14_bank_number(mode)];
-}
-
 /* Physical Interrupt Target EL Lookup Table
  *
  * [ From ARM ARM section G1.13.4 (Table G1-15) ]
diff --git a/target/arm/meson.build b/target/arm/meson.build
index 8d6177c1fb..1f7375375e 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -32,6 +32,9 @@ arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
 ))
 
 arm_user_ss = ss.source_set()
+arm_user_ss.add(files(
+  'cpu-user.c',
+))
 
 subdir('tcg')
 
-- 
2.20.1

Received: by 10.25.159.19 with SMTP id i19csp1948777lfe;
        Thu, 14 Jan 2016 10:34:14 -0800 (PST)
X-Received: by 10.194.119.232 with SMTP id kx8mr6528293wjb.94.1452796454294;
        Thu, 14 Jan 2016 10:34:14 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id hc6si11358943wjc.43.2016.01.14.10.34.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:34:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJmip-0000m7-AI; Thu, 14 Jan 2016 18:34:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/8] target-arm: Move aarch64_cpu_do_interrupt() to helper.c
Date: Thu, 14 Jan 2016 18:34:05 +0000
Message-Id: <1452796451-2946-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
X-TUID: lUHj20bfeMPa

Move the aarch64_cpu_do_interrupt() function to helper.c. We want
to be able to call this from code that isn't AArch64-only, and
the move allows us to avoid awkward #ifdeffery at the callsite.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu-qom.h    |   2 +-
 target-arm/helper-a64.c | 104 ------------------------------------------------
 target-arm/helper.c     | 100 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+), 105 deletions(-)

diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index e4d4270..bda2af8 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -247,8 +247,8 @@ void arm_gt_stimer_cb(void *opaque);
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+#endif
 
 void aarch64_cpu_do_interrupt(CPUState *cs);
-#endif
 
 #endif
diff --git a/target-arm/helper-a64.c b/target-arm/helper-a64.c
index fc3ccdf..a322e7b 100644
--- a/target-arm/helper-a64.c
+++ b/target-arm/helper-a64.c
@@ -25,7 +25,6 @@
 #include "qemu/bitops.h"
 #include "internals.h"
 #include "qemu/crc32c.h"
-#include "sysemu/kvm.h"
 #include <zlib.h> /* For crc32 */
 
 /* C2.4.7 Multiply and divide */
@@ -443,106 +442,3 @@ uint64_t HELPER(crc32c_64)(uint64_t acc, uint64_t val, uint32_t bytes)
     /* Linux crc32c converts the output to one's complement.  */
     return crc32c(acc, buf, bytes) ^ 0xffffffff;
 }
-
-#if !defined(CONFIG_USER_ONLY)
-
-/* Handle a CPU exception.  */
-void aarch64_cpu_do_interrupt(CPUState *cs)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    unsigned int new_el = env->exception.target_el;
-    target_ulong addr = env->cp15.vbar_el[new_el];
-    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
-
-    if (arm_current_el(env) < new_el) {
-        if (env->aarch64) {
-            addr += 0x400;
-        } else {
-            addr += 0x600;
-        }
-    } else if (pstate_read(env) & PSTATE_SP) {
-        addr += 0x200;
-    }
-
-    arm_log_exception(cs->exception_index);
-    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
-                  new_el);
-    if (qemu_loglevel_mask(CPU_LOG_INT)
-        && !excp_is_internal(cs->exception_index)) {
-        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
-                      env->exception.syndrome >> ARM_EL_EC_SHIFT,
-                      env->exception.syndrome);
-    }
-
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
-        arm_handle_psci_call(cpu);
-        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
-        return;
-    }
-
-    switch (cs->exception_index) {
-    case EXCP_PREFETCH_ABORT:
-    case EXCP_DATA_ABORT:
-        env->cp15.far_el[new_el] = env->exception.vaddress;
-        qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
-                      env->cp15.far_el[new_el]);
-        /* fall through */
-    case EXCP_BKPT:
-    case EXCP_UDEF:
-    case EXCP_SWI:
-    case EXCP_HVC:
-    case EXCP_HYP_TRAP:
-    case EXCP_SMC:
-        env->cp15.esr_el[new_el] = env->exception.syndrome;
-        break;
-    case EXCP_IRQ:
-    case EXCP_VIRQ:
-        addr += 0x80;
-        break;
-    case EXCP_FIQ:
-    case EXCP_VFIQ:
-        addr += 0x100;
-        break;
-    case EXCP_SEMIHOST:
-        qemu_log_mask(CPU_LOG_INT,
-                      "...handling as semihosting call 0x%" PRIx64 "\n",
-                      env->xregs[0]);
-        env->xregs[0] = do_arm_semihosting(env);
-        return;
-    default:
-        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
-    }
-
-    if (is_a64(env)) {
-        env->banked_spsr[aarch64_banked_spsr_index(new_el)] = pstate_read(env);
-        aarch64_save_sp(env, arm_current_el(env));
-        env->elr_el[new_el] = env->pc;
-    } else {
-        env->banked_spsr[aarch64_banked_spsr_index(new_el)] = cpsr_read(env);
-        if (!env->thumb) {
-            env->cp15.esr_el[new_el] |= 1 << 25;
-        }
-        env->elr_el[new_el] = env->regs[15];
-
-        aarch64_sync_32_to_64(env);
-
-        env->condexec_bits = 0;
-    }
-    qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
-                  env->elr_el[new_el]);
-
-    pstate_write(env, PSTATE_DAIF | new_mode);
-    env->aarch64 = 1;
-    aarch64_restore_sp(env, new_el);
-
-    env->pc = addr;
-
-    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
-                  new_el, env->pc, pstate_read(env));
-
-    if (!kvm_enabled()) {
-        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
-    }
-}
-#endif
diff --git a/target-arm/helper.c b/target-arm/helper.c
index a06bfaf..519f066 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -11,6 +11,7 @@
 #include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
+#include "sysemu/kvm.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -5901,6 +5902,105 @@ void arm_cpu_do_interrupt(CPUState *cs)
     cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
 }
 
+/* Handle a CPU exception.  */
+void aarch64_cpu_do_interrupt(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    unsigned int new_el = env->exception.target_el;
+    target_ulong addr = env->cp15.vbar_el[new_el];
+    unsigned int new_mode = aarch64_pstate_mode(new_el, true);
+
+    if (arm_current_el(env) < new_el) {
+        if (env->aarch64) {
+            addr += 0x400;
+        } else {
+            addr += 0x600;
+        }
+    } else if (pstate_read(env) & PSTATE_SP) {
+        addr += 0x200;
+    }
+
+    arm_log_exception(cs->exception_index);
+    qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),
+                  new_el);
+    if (qemu_loglevel_mask(CPU_LOG_INT)
+        && !excp_is_internal(cs->exception_index)) {
+        qemu_log_mask(CPU_LOG_INT, "...with ESR %x/0x%" PRIx32 "\n",
+                      env->exception.syndrome >> ARM_EL_EC_SHIFT,
+                      env->exception.syndrome);
+    }
+
+    if (arm_is_psci_call(cpu, cs->exception_index)) {
+        arm_handle_psci_call(cpu);
+        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+        return;
+    }
+
+    switch (cs->exception_index) {
+    case EXCP_PREFETCH_ABORT:
+    case EXCP_DATA_ABORT:
+        env->cp15.far_el[new_el] = env->exception.vaddress;
+        qemu_log_mask(CPU_LOG_INT, "...with FAR 0x%" PRIx64 "\n",
+                      env->cp15.far_el[new_el]);
+        /* fall through */
+    case EXCP_BKPT:
+    case EXCP_UDEF:
+    case EXCP_SWI:
+    case EXCP_HVC:
+    case EXCP_HYP_TRAP:
+    case EXCP_SMC:
+        env->cp15.esr_el[new_el] = env->exception.syndrome;
+        break;
+    case EXCP_IRQ:
+    case EXCP_VIRQ:
+        addr += 0x80;
+        break;
+    case EXCP_FIQ:
+    case EXCP_VFIQ:
+        addr += 0x100;
+        break;
+    case EXCP_SEMIHOST:
+        qemu_log_mask(CPU_LOG_INT,
+                      "...handling as semihosting call 0x%" PRIx64 "\n",
+                      env->xregs[0]);
+        env->xregs[0] = do_arm_semihosting(env);
+        return;
+    default:
+        cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
+    }
+
+    if (is_a64(env)) {
+        env->banked_spsr[aarch64_banked_spsr_index(new_el)] = pstate_read(env);
+        aarch64_save_sp(env, arm_current_el(env));
+        env->elr_el[new_el] = env->pc;
+    } else {
+        env->banked_spsr[aarch64_banked_spsr_index(new_el)] = cpsr_read(env);
+        if (!env->thumb) {
+            env->cp15.esr_el[new_el] |= 1 << 25;
+        }
+        env->elr_el[new_el] = env->regs[15];
+
+        aarch64_sync_32_to_64(env);
+
+        env->condexec_bits = 0;
+    }
+    qemu_log_mask(CPU_LOG_INT, "...with ELR 0x%" PRIx64 "\n",
+                  env->elr_el[new_el]);
+
+    pstate_write(env, PSTATE_DAIF | new_mode);
+    env->aarch64 = 1;
+    aarch64_restore_sp(env, new_el);
+
+    env->pc = addr;
+
+    qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
+                  new_el, env->pc, pstate_read(env));
+
+    if (!kvm_enabled()) {
+        cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+    }
+}
 
 /* Return the exception level which controls this address translation regime */
 static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
-- 
1.9.1

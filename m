Received: by 10.25.159.19 with SMTP id i19csp1948928lfe;
        Thu, 14 Jan 2016 10:34:29 -0800 (PST)
X-Received: by 10.194.86.71 with SMTP id n7mr5572922wjz.107.1452796455078;
        Thu, 14 Jan 2016 10:34:15 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id ay10si11306789wjb.181.2016.01.14.10.34.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:34:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJmip-0000mB-BV; Thu, 14 Jan 2016 18:34:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 3/8] target-arm: Use a single entry point for AArch64 and AArch32 exceptions
Date: Thu, 14 Jan 2016 18:34:06 +0000
Message-Id: <1452796451-2946-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
X-TUID: DIXy90PQYF9P

If EL2 or EL3 is present on an AArch64 CPU, then exceptions can be
taken to an exception level which is running AArch32 (if only EL0
and EL1 are present then EL1 must be AArch64 and all exceptions are
taken to AArch64). To support this we need to have a single
implementation of the CPU do_interrupt() method which can handle both
32 and 64 bit exception entry.

Pull the common parts of aarch64_cpu_do_interrupt() and
arm_cpu_do_interrupt() out into a new function which calls
either the AArch32 or AArch64 specific entry code once it has
worked out which one is needed.

We temporarily special-case the handling of EXCP_SEMIHOST to
avoid an assertion in arm_el_is_aa64(); the next patch will
pull all the semihosting handling out to the arm_cpu_do_interrupt()
level (since semihosting semantics depend on the register width
of the calling code, not on that of any higher EL).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu-qom.h |  2 --
 target-arm/cpu64.c   |  3 ---
 target-arm/helper.c  | 75 ++++++++++++++++++++++++++++++----------------------
 3 files changed, 44 insertions(+), 36 deletions(-)

diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index bda2af8..eae6cd1 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -249,6 +249,4 @@ int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 #endif
 
-void aarch64_cpu_do_interrupt(CPUState *cs);
-
 #endif
diff --git a/target-arm/cpu64.c b/target-arm/cpu64.c
index 63c8b1c..edb41f7 100644
--- a/target-arm/cpu64.c
+++ b/target-arm/cpu64.c
@@ -290,9 +290,6 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
 {
     CPUClass *cc = CPU_CLASS(oc);
 
-#if !defined(CONFIG_USER_ONLY)
-    cc->do_interrupt = aarch64_cpu_do_interrupt;
-#endif
     cc->cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->set_pc = aarch64_cpu_set_pc;
     cc->gdb_read_register = aarch64_cpu_gdb_read_register;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 519f066..962bb3c 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5707,8 +5707,7 @@ void aarch64_sync_64_to_32(CPUARMState *env)
     env->regs[15] = env->pc;
 }
 
-/* Handle a CPU exception.  */
-void arm_cpu_do_interrupt(CPUState *cs)
+static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -5718,16 +5717,6 @@ void arm_cpu_do_interrupt(CPUState *cs)
     uint32_t offset;
     uint32_t moe;
 
-    assert(!IS_M(env));
-
-    arm_log_exception(cs->exception_index);
-
-    if (arm_is_psci_call(cpu, cs->exception_index)) {
-        arm_handle_psci_call(cpu);
-        qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
-        return;
-    }
-
     /* If this is a debug exception we must update the DBGDSCR.MOE bits */
     switch (env->exception.syndrome >> ARM_EL_EC_SHIFT) {
     case EC_BREAKPOINT:
@@ -5899,11 +5888,10 @@ void arm_cpu_do_interrupt(CPUState *cs)
     }
     env->regs[14] = env->regs[15] + offset;
     env->regs[15] = addr;
-    cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
 }
 
-/* Handle a CPU exception.  */
-void aarch64_cpu_do_interrupt(CPUState *cs)
+/* Handle exception entry to a target EL which is using AArch64 */
+static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
@@ -5921,22 +5909,6 @@ void aarch64_cpu_do_interrupt(CPUState *cs)
         addr += 0x200;
     }
 
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
     switch (cs->exception_index) {
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
@@ -5996,6 +5968,47 @@ void aarch64_cpu_do_interrupt(CPUState *cs)
 
     qemu_log_mask(CPU_LOG_INT, "...to EL%d PC 0x%" PRIx64 " PSTATE 0x%x\n",
                   new_el, env->pc, pstate_read(env));
+}
+
+/* Handle a CPU exception for A and R profile CPUs.
+ * Do any appropriate logging, handle PSCI calls, and then hand off
+ * to the AArch64-entry or AArch32-entry function depending on the
+ * target exception level's register width.
+ */
+void arm_cpu_do_interrupt(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    unsigned int new_el = env->exception.target_el;
+
+    assert(!IS_M(env));
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
+    /* Temporary special case for EXCP_SEMIHOST, which is used only
+     * for 64-bit semihosting calls -- as this is an internal exception
+     * it has no specified target level and arm_el_is_aa64() would
+     * assert because new_el could be 0.
+     */
+    if (cs->exception_index == EXCP_SEMIHOST || arm_el_is_aa64(env, new_el)) {
+        arm_cpu_do_interrupt_aarch64(cs);
+    } else {
+        arm_cpu_do_interrupt_aarch32(cs);
+    }
 
     if (!kvm_enabled()) {
         cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
-- 
1.9.1

Received: by 10.25.159.19 with SMTP id i19csp1948953lfe;
        Thu, 14 Jan 2016 10:34:33 -0800 (PST)
X-Received: by 10.98.75.22 with SMTP id y22mr8297896pfa.147.1452796457402;
        Thu, 14 Jan 2016 10:34:17 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id 77si6224386pfn.148.2016.01.14.10.34.16
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 10:34:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJmip-0000mF-Ci; Thu, 14 Jan 2016 18:34:11 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 4/8] target-arm: Pull semihosting handling out to arm_cpu_do_interrupt()
Date: Thu, 14 Jan 2016 18:34:07 +0000
Message-Id: <1452796451-2946-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
References: <1452796451-2946-1-git-send-email-peter.maydell@linaro.org>
X-TUID: amwiJ278iQG9

Handling of semihosting calls should depend on the register width
of the calling code, not on that of any higher exception level,
so we need to identify and handle semihosting calls before we
decide whether to deliver the exception as an entry to AArch32
or AArch64. (EXCP_SEMIHOST is also an "internal exception" so
it has no target exception level in the first place.)

This will allow AArch32 EL1 code to use semihosting calls when
running under an AArch64 EL3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 120 +++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 81 insertions(+), 39 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 962bb3c..d37c82c 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5754,27 +5754,6 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
             offset = 4;
         break;
     case EXCP_SWI:
-        if (semihosting_enabled()) {
-            /* Check for semihosting interrupt.  */
-            if (env->thumb) {
-                mask = arm_lduw_code(env, env->regs[15] - 2, env->bswap_code)
-                    & 0xff;
-            } else {
-                mask = arm_ldl_code(env, env->regs[15] - 4, env->bswap_code)
-                    & 0xffffff;
-            }
-            /* Only intercept calls from privileged modes, to provide some
-               semblance of security.  */
-            if (((mask == 0x123456 && !env->thumb)
-                    || (mask == 0xab && env->thumb))
-                  && (env->uncached_cpsr & CPSR_M) != ARM_CPU_MODE_USR) {
-                qemu_log_mask(CPU_LOG_INT,
-                              "...handling as semihosting call 0x%x\n",
-                              env->regs[0]);
-                env->regs[0] = do_arm_semihosting(env);
-                return;
-            }
-        }
         new_mode = ARM_CPU_MODE_SVC;
         addr = 0x08;
         mask = CPSR_I;
@@ -5782,19 +5761,6 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         offset = 0;
         break;
     case EXCP_BKPT:
-        /* See if this is a semihosting syscall.  */
-        if (env->thumb && semihosting_enabled()) {
-            mask = arm_lduw_code(env, env->regs[15], env->bswap_code) & 0xff;
-            if (mask == 0xab
-                  && (env->uncached_cpsr & CPSR_M) != ARM_CPU_MODE_USR) {
-                env->regs[15] += 2;
-                qemu_log_mask(CPU_LOG_INT,
-                              "...handling as semihosting call 0x%x\n",
-                              env->regs[0]);
-                env->regs[0] = do_arm_semihosting(env);
-                return;
-            }
-        }
         env->exception.fsr = 2;
         /* Fall through to prefetch abort.  */
     case EXCP_PREFETCH_ABORT:
@@ -5970,6 +5936,78 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
                   new_el, env->pc, pstate_read(env));
 }
 
+static inline bool check_for_semihosting(CPUState *cs)
+{
+    /* Check whether this exception is a semihosting call; if so
+     * then handle it and return true; otherwise return false.
+     */
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+
+    if (is_a64(env)) {
+        if (cs->exception_index == EXCP_SEMIHOST) {
+            /* This is always the 64-bit semihosting exception.
+             * The "is this usermode" and "is semihosting enabled"
+             * checks have been done at translate time.
+             */
+            qemu_log_mask(CPU_LOG_INT,
+                          "...handling as semihosting call 0x%" PRIx64 "\n",
+                          env->xregs[0]);
+            env->xregs[0] = do_arm_semihosting(env);
+            return true;
+        }
+        return false;
+    } else {
+        uint32_t imm;
+
+        /* Only intercept calls from privileged modes, to provide some
+         * semblance of security.
+         */
+        if (!semihosting_enabled() ||
+            ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR)) {
+            return false;
+        }
+
+        switch (cs->exception_index) {
+        case EXCP_SWI:
+            /* Check for semihosting interrupt.  */
+            if (env->thumb) {
+                imm = arm_lduw_code(env, env->regs[15] - 2, env->bswap_code)
+                    & 0xff;
+                if (imm == 0xab) {
+                    break;
+                }
+            } else {
+                imm = arm_ldl_code(env, env->regs[15] - 4, env->bswap_code)
+                    & 0xffffff;
+                if (imm == 0x123456) {
+                    break;
+                }
+            }
+            return false;
+        case EXCP_BKPT:
+            /* See if this is a semihosting syscall.  */
+            if (env->thumb) {
+                imm = arm_lduw_code(env, env->regs[15], env->bswap_code)
+                    & 0xff;
+                if (imm == 0xab) {
+                    env->regs[15] += 2;
+                    break;
+                }
+            }
+            return false;
+        default:
+            return false;
+        }
+
+        qemu_log_mask(CPU_LOG_INT,
+                      "...handling as semihosting call 0x%x\n",
+                      env->regs[0]);
+        env->regs[0] = do_arm_semihosting(env);
+        return true;
+    }
+}
+
 /* Handle a CPU exception for A and R profile CPUs.
  * Do any appropriate logging, handle PSCI calls, and then hand off
  * to the AArch64-entry or AArch32-entry function depending on the
@@ -5999,12 +6037,16 @@ void arm_cpu_do_interrupt(CPUState *cs)
         return;
     }
 
-    /* Temporary special case for EXCP_SEMIHOST, which is used only
-     * for 64-bit semihosting calls -- as this is an internal exception
-     * it has no specified target level and arm_el_is_aa64() would
-     * assert because new_el could be 0.
+    /* Semihosting semantics depend on the register width of the
+     * code that caused the exception, not the target exception level,
+     * so must be handled here.
      */
-    if (cs->exception_index == EXCP_SEMIHOST || arm_el_is_aa64(env, new_el)) {
+    if (check_for_semihosting(cs)) {
+        return;
+    }
+
+    assert(!excp_is_internal(cs->exception_index));
+    if (arm_el_is_aa64(env, new_el)) {
         arm_cpu_do_interrupt_aarch64(cs);
     } else {
         arm_cpu_do_interrupt_aarch32(cs);
-- 
1.9.1

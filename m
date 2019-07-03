Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id p140sm1806472wme.31.2019.07.03.08.52.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 08:52:45 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A17A71FF91;
	Wed,  3 Jul 2019 16:52:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v1 4/4] target/arm: remove run time semihosting checks
Date: Wed,  3 Jul 2019 16:52:44 +0100
Message-Id: <20190703155244.28166-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703155244.28166-1-alex.bennee@linaro.org>
References: <20190703155244.28166-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IBSZJbbhkv4v

Now we do all our checking and use a common EXCP_SEMIHOST for
semihosting operations we can make helper code a lot simpler.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 84 +++++++++------------------------------------
 1 file changed, 17 insertions(+), 67 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ad29dc4072..5c1f741380 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10364,83 +10364,33 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
                   new_el, env->pc, pstate_read(env));
 }
 
-static inline bool check_for_semihosting(CPUState *cs)
+/*
+ * Check whether this exception is a semihosting call; if so
+ * then handle it and return true; otherwise return false.
+ *
+ * All the permission and validity checks are done at translate time.
+ */
+static inline bool handle_semihosting(CPUState *cs)
 {
-    /* Check whether this exception is a semihosting call; if so
-     * then handle it and return true; otherwise return false.
-     */
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
 
-    if (is_a64(env)) {
-        if (cs->exception_index == EXCP_SEMIHOST) {
-            /* This is always the 64-bit semihosting exception.
-             * The "is this usermode" and "is semihosting enabled"
-             * checks have been done at translate time.
-             */
+    if (cs->exception_index == EXCP_SEMIHOST) {
+        if (is_a64(env)) {
             qemu_log_mask(CPU_LOG_INT,
                           "...handling as semihosting call 0x%" PRIx64 "\n",
                           env->xregs[0]);
             env->xregs[0] = do_arm_semihosting(env);
-            return true;
-        }
-        return false;
-    } else {
-        uint32_t imm;
-
-        /* Only intercept calls from privileged modes, to provide some
-         * semblance of security.
-         */
-        if (cs->exception_index != EXCP_SEMIHOST &&
-            (!semihosting_enabled() ||
-             ((env->uncached_cpsr & CPSR_M) == ARM_CPU_MODE_USR))) {
-            return false;
-        }
-
-        switch (cs->exception_index) {
-        case EXCP_SEMIHOST:
-            /* This is always a semihosting call; the "is this usermode"
-             * and "is semihosting enabled" checks have been done at
-             * translate time.
-             */
-            break;
-        case EXCP_SWI:
-            /* Check for semihosting interrupt.  */
-            if (env->thumb) {
-                imm = arm_lduw_code(env, env->regs[15] - 2, arm_sctlr_b(env))
-                    & 0xff;
-                if (imm == 0xab) {
-                    break;
-                }
-            } else {
-                imm = arm_ldl_code(env, env->regs[15] - 4, arm_sctlr_b(env))
-                    & 0xffffff;
-                if (imm == 0x123456) {
-                    break;
-                }
-            }
-            return false;
-        case EXCP_BKPT:
-            /* See if this is a semihosting syscall.  */
-            if (env->thumb) {
-                imm = arm_lduw_code(env, env->regs[15], arm_sctlr_b(env))
-                    & 0xff;
-                if (imm == 0xab) {
-                    env->regs[15] += 2;
-                    break;
-                }
-            }
-            return false;
-        default:
-            return false;
+        } else {
+            qemu_log_mask(CPU_LOG_INT,
+                          "...handling as semihosting call 0x%x\n",
+                          env->regs[0]);
+            env->regs[0] = do_arm_semihosting(env);
         }
-
-        qemu_log_mask(CPU_LOG_INT,
-                      "...handling as semihosting call 0x%x\n",
-                      env->regs[0]);
-        env->regs[0] = do_arm_semihosting(env);
         return true;
     }
+
+    return false;
 }
 
 /* Handle a CPU exception for A and R profile CPUs.
@@ -10476,7 +10426,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
      * code that caused the exception, not the target exception level,
      * so must be handled here.
      */
-    if (check_for_semihosting(cs)) {
+    if (handle_semihosting(cs)) {
         return;
     }
 
-- 
2.20.1

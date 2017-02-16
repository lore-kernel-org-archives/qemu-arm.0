Received: by 10.25.77.65 with SMTP id a62csp2552571lfb;
        Thu, 16 Feb 2017 08:36:09 -0800 (PST)
X-Received: by 10.25.25.8 with SMTP id 8mr1076527lfz.164.1487262969589;
        Thu, 16 Feb 2017 08:36:09 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id e81si1115783lff.67.2017.02.16.08.36.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Feb 2017 08:36:09 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ceP2O-00035c-PL; Thu, 16 Feb 2017 16:36:08 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 10/13] armv7m: Extract "exception taken" code into functions
Date: Thu, 16 Feb 2017 16:36:00 +0000
Message-Id: <1487262963-11519-11-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 5rAFaaZ45p02

Extract the code from the tail end of arm_v7m_do_interrupt() which
enters the exception handler into a pair of utility functions
v7m_exception_taken() and v7m_push_stack(), which correspond roughly
to the pseudocode PushStack() and ExceptionTaken().

This also requires us to move the arm_v7m_load_vector() utility
routine up so we can call it.

Handling illegal exception returns has some cases where we want to
take a UsageFault either on an existing stack frame or with a new
stack frame but with a specific LR value, so we want to be able to
call these without having to go via arm_v7m_cpu_do_interrupt().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 118 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 68 insertions(+), 50 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1844852..f94d1c7 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6001,6 +6001,72 @@ static void switch_v7m_sp(CPUARMState *env, bool new_spsel)
     }
 }
 
+static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    CPUARMState *env = &cpu->env;
+    MemTxResult result;
+    hwaddr vec = env->v7m.vecbase + env->v7m.exception * 4;
+    uint32_t addr;
+
+    addr = address_space_ldl(cs->as, vec,
+                             MEMTXATTRS_UNSPECIFIED, &result);
+    if (result != MEMTX_OK) {
+        /* Architecturally this should cause a HardFault setting HSFR.VECTTBL,
+         * which would then be immediately followed by our failing to load
+         * the entry vector for that HardFault, which is a Lockup case.
+         * Since we don't model Lockup, we just report this guest error
+         * via cpu_abort().
+         */
+        cpu_abort(cs, "Failed to read from exception vector table "
+                  "entry %08x\n", (unsigned)vec);
+    }
+    return addr;
+}
+
+static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr)
+{
+    /* Do the "take the exception" parts of exception entry,
+     * but not the pushing of state to the stack. This is
+     * similar to the pseudocode ExceptionTaken() function.
+     */
+    CPUARMState *env = &cpu->env;
+    uint32_t addr;
+
+    armv7m_nvic_acknowledge_irq(env->nvic);
+    switch_v7m_sp(env, 0);
+    /* Clear IT bits */
+    env->condexec_bits = 0;
+    env->regs[14] = lr;
+    addr = arm_v7m_load_vector(cpu);
+    env->regs[15] = addr & 0xfffffffe;
+    env->thumb = addr & 1;
+}
+
+static void v7m_push_stack(ARMCPU *cpu)
+{
+    /* Do the "set up stack frame" part of exception entry,
+     * similar to pseudocode PushStack().
+     */
+    CPUARMState *env = &cpu->env;
+    uint32_t xpsr = xpsr_read(env);
+
+    /* Align stack pointer if the guest wants that */
+    if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
+        env->regs[13] -= 4;
+        xpsr |= 0x200;
+    }
+    /* Switch to the handler mode.  */
+    v7m_push(env, xpsr);
+    v7m_push(env, env->regs[15]);
+    v7m_push(env, env->regs[14]);
+    v7m_push(env, env->regs[12]);
+    v7m_push(env, env->regs[3]);
+    v7m_push(env, env->regs[2]);
+    v7m_push(env, env->regs[1]);
+    v7m_push(env, env->regs[0]);
+}
+
 static void do_v7m_exception_exit(CPUARMState *env)
 {
     uint32_t type;
@@ -6062,37 +6128,11 @@ static void arm_log_exception(int idx)
     }
 }
 
-static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
-
-{
-    CPUState *cs = CPU(cpu);
-    CPUARMState *env = &cpu->env;
-    MemTxResult result;
-    hwaddr vec = env->v7m.vecbase + env->v7m.exception * 4;
-    uint32_t addr;
-
-    addr = address_space_ldl(cs->as, vec,
-                             MEMTXATTRS_UNSPECIFIED, &result);
-    if (result != MEMTX_OK) {
-        /* Architecturally this should cause a HardFault setting HSFR.VECTTBL,
-         * which would then be immediately followed by our failing to load
-         * the entry vector for that HardFault, which is a Lockup case.
-         * Since we don't model Lockup, we just report this guest error
-         * via cpu_abort().
-         */
-        cpu_abort(cs, "Failed to read from exception vector table "
-                  "entry %08x\n", (unsigned)vec);
-    }
-    return addr;
-}
-
 void arm_v7m_cpu_do_interrupt(CPUState *cs)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
-    uint32_t xpsr = xpsr_read(env);
     uint32_t lr;
-    uint32_t addr;
 
     arm_log_exception(cs->exception_index);
 
@@ -6150,31 +6190,9 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         return; /* Never happens.  Keep compiler happy.  */
     }
 
-    armv7m_nvic_acknowledge_irq(env->nvic);
-
+    v7m_push_stack(cpu);
+    v7m_exception_taken(cpu, lr);
     qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
-
-    /* Align stack pointer if the guest wants that */
-    if ((env->regs[13] & 4) && (env->v7m.ccr & R_V7M_CCR_STKALIGN_MASK)) {
-        env->regs[13] -= 4;
-        xpsr |= 0x200;
-    }
-    /* Switch to the handler mode.  */
-    v7m_push(env, xpsr);
-    v7m_push(env, env->regs[15]);
-    v7m_push(env, env->regs[14]);
-    v7m_push(env, env->regs[12]);
-    v7m_push(env, env->regs[3]);
-    v7m_push(env, env->regs[2]);
-    v7m_push(env, env->regs[1]);
-    v7m_push(env, env->regs[0]);
-    switch_v7m_sp(env, 0);
-    /* Clear IT bits */
-    env->condexec_bits = 0;
-    env->regs[14] = lr;
-    addr = arm_v7m_load_vector(cpu);
-    env->regs[15] = addr & 0xfffffffe;
-    env->thumb = addr & 1;
 }
 
 /* Function used to synchronize QEMU's AArch64 register set with AArch32
-- 
2.7.4

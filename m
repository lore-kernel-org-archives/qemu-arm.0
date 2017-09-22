Received: by 10.223.172.38 with SMTP id v35csp3220327wrc;
        Fri, 22 Sep 2017 08:10:37 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBHOqrghWTxMjHUvD/+GVOnhyGv/ZuFms6STloEW2V4EJruWEL/Y7Goi6F7MEp/Y7xYgOui
X-Received: by 10.55.209.140 with SMTP id o12mr8070696qkl.319.1506093037368;
        Fri, 22 Sep 2017 08:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506093037; cv=none;
        d=google.com; s=arc-20160816;
        b=kNcsuqt3cTL35pEPrY3LmB6cA6VFQLHcccOQR4DhEWxIfK6kUmc3LN1tdZbS0RLEHy
         WuT1X918hEoySWhebSlWodyeb09eS9sMlVwHpuMScsg98KgqhmLOqVp/ZHoNyTOMY1dS
         aUJpTh5R12wchltXO259+2V1v1XfS5bzdlQifkM7GBEGcxFnGRlDAq4oGjjPbajElSmj
         ISWaHnQCNF+4YUcQo5Lo3izPuUsw0hNBxtdPKgMVeYTzIISjgGWQ4shVQ4TSRWQ5QRM/
         UbB6Ci1G4iGxT1qde+g418Dhy9EJVrMe4HCtuEWjhA7g445H7i8KZB7+ImoSwoXU5ITa
         /xIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Sm6Bw8Y4XjNK/KZ8VohivUy7aPVbPvq/jdDIEFnyZts=;
        b=eJawI36ret1FnD2dPloGw3I+mffghA9f8s1OmPQLTcyZoH611visVSNu9mU3kBpboA
         7uFfDXueftSQyB077gQFFCKU4LPRPdbKhDhOEFcV0pL5zFXh+B5xV9zSQWvPMpQxowjZ
         DW1ZA38ZGKjiypkAXYu/VvRhtkzvam7NSgzTllKPD+Wh9BFzESyY875gOVgCtgEvYCAs
         ArvUkUwpPqmViyrfu/dRSqGubn/F14MP/aN5pFZYldRbuUP0+8qwv0Kd+wVfQtoqN2Qh
         iIX/P8gwaeqq4CqcjzA9E7uDgWgPzxf1PKMPXeWDrH7v5rCZtsDsWFAwUJ8flNaSWxWs
         LTGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j9si30419qtb.396.2017.09.22.08.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:10:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59379 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPb8-0000kp-VW
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:10:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQb-00080D-Hw
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQZ-00048R-JE
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37568)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQZ-00046S-59; Fri, 22 Sep 2017 10:59:39 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQY-0007Cx-1Y; Fri, 22 Sep 2017 15:59:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:59 +0100
Message-Id: <1506092407-26985-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 12/20] target/arm: Add v8M support to exception
 entry code
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DGrK65b05IsL

Add support for v8M and in particular the security extension
to the exception entry code. This requires changes to:
 * calculation of the exception-return magic LR value
 * push the callee-saves registers in certain cases
 * clear registers when taking non-secure exceptions to avoid
   leaking information from the interrupted secure code
 * switch to the correct security state on entry
 * use the vector table for the security state we're targeting

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 165 +++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 145 insertions(+), 20 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 25f5675..7511566 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6200,12 +6200,12 @@ static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
     }
 }
 
-static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
+static uint32_t arm_v7m_load_vector(ARMCPU *cpu, bool targets_secure)
 {
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult result;
-    hwaddr vec = env->v7m.vecbase[env->v7m.secure] + env->v7m.exception * 4;
+    hwaddr vec = env->v7m.vecbase[targets_secure] + env->v7m.exception * 4;
     uint32_t addr;
 
     addr = address_space_ldl(cs->as, vec,
@@ -6217,13 +6217,48 @@ static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
          * Since we don't model Lockup, we just report this guest error
          * via cpu_abort().
          */
-        cpu_abort(cs, "Failed to read from exception vector table "
-                  "entry %08x\n", (unsigned)vec);
+        cpu_abort(cs, "Failed to read from %s exception vector table "
+                  "entry %08x\n", targets_secure ? "secure" : "nonsecure",
+                  (unsigned)vec);
     }
     return addr;
 }
 
-static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr)
+static void v7m_push_callee_stack(ARMCPU *cpu, uint32_t lr, bool dotailchain)
+{
+    /* For v8M, push the callee-saves register part of the stack frame.
+     * Compare the v8M pseudocode PushCalleeStack().
+     * In the tailchaining case this may not be the current stack.
+     */
+    CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+    uint32_t *frame_sp_p;
+    uint32_t frameptr;
+
+    if (dotailchain) {
+        frame_sp_p = get_v7m_sp_ptr(env, true,
+                                    lr & R_V7M_EXCRET_MODE_MASK,
+                                    lr & R_V7M_EXCRET_SPSEL_MASK);
+    } else {
+        frame_sp_p = &env->regs[13];
+    }
+
+    frameptr = *frame_sp_p - 0x28;
+
+    stl_phys(cs->as, frameptr, 0xfefa125b);
+    stl_phys(cs->as, frameptr + 0x8, env->regs[4]);
+    stl_phys(cs->as, frameptr + 0xc, env->regs[5]);
+    stl_phys(cs->as, frameptr + 0x10, env->regs[6]);
+    stl_phys(cs->as, frameptr + 0x14, env->regs[7]);
+    stl_phys(cs->as, frameptr + 0x18, env->regs[8]);
+    stl_phys(cs->as, frameptr + 0x1c, env->regs[9]);
+    stl_phys(cs->as, frameptr + 0x20, env->regs[10]);
+    stl_phys(cs->as, frameptr + 0x24, env->regs[11]);
+
+    *frame_sp_p = frameptr;
+}
+
+static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain)
 {
     /* Do the "take the exception" parts of exception entry,
      * but not the pushing of state to the stack. This is
@@ -6231,14 +6266,84 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr)
      */
     CPUARMState *env = &cpu->env;
     uint32_t addr;
+    bool targets_secure;
+
+    targets_secure = armv7m_nvic_acknowledge_irq(env->nvic);
 
-    armv7m_nvic_acknowledge_irq(env->nvic);
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+            (lr & R_V7M_EXCRET_S_MASK)) {
+            /* The background code (the owner of the registers in the
+             * exception frame) is Secure. This means it may either already
+             * have or now needs to push callee-saves registers.
+             */
+            if (targets_secure) {
+                if (dotailchain && !(lr & R_V7M_EXCRET_ES_MASK)) {
+                    /* We took an exception from Secure to NonSecure
+                     * (which means the callee-saved registers got stacked)
+                     * and are now tailchaining to a Secure exception.
+                     * Clear DCRS so eventual return from this Secure
+                     * exception unstacks the callee-saved registers.
+                     */
+                    lr &= ~R_V7M_EXCRET_DCRS_MASK;
+                }
+            } else {
+                /* We're going to a non-secure exception; push the
+                 * callee-saves registers to the stack now, if they're
+                 * not already saved.
+                 */
+                if (lr & R_V7M_EXCRET_DCRS_MASK &&
+                    !(dotailchain && (lr & R_V7M_EXCRET_ES_MASK))) {
+                    v7m_push_callee_stack(cpu, lr, dotailchain);
+                }
+                lr |= R_V7M_EXCRET_DCRS_MASK;
+            }
+        }
+
+        lr &= ~R_V7M_EXCRET_ES_MASK;
+        if (targets_secure || !arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            lr |= R_V7M_EXCRET_ES_MASK;
+        }
+        lr &= ~R_V7M_EXCRET_SPSEL_MASK;
+        if (env->v7m.control[targets_secure] & R_V7M_CONTROL_SPSEL_MASK) {
+            lr |= R_V7M_EXCRET_SPSEL_MASK;
+        }
+
+        /* Clear registers if necessary to prevent non-secure exception
+         * code being able to see register values from secure code.
+         * Where register values become architecturally UNKNOWN we leave
+         * them with their previous values.
+         */
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            if (!targets_secure) {
+                /* Always clear the caller-saved registers (they have been
+                 * pushed to the stack earlier in v7m_push_stack()).
+                 * Clear callee-saved registers if the background code is
+                 * Secure (in which case these regs were saved in
+                 * v7m_push_callee_stack()).
+                 */
+                int i;
+
+                for (i = 0; i < 13; i++) {
+                    /* r4..r11 are callee-saves, zero only if EXCRET.S == 1 */
+                    if (i < 4 || i > 11 || (lr & R_V7M_EXCRET_S_MASK)) {
+                        env->regs[i] = 0;
+                    }
+                }
+                /* Clear EAPSR */
+                xpsr_write(env, 0, XPSR_NZCV | XPSR_Q | XPSR_GE | XPSR_IT);
+            }
+        }
+    }
+
+    /* Switch to target security state -- must do this before writing SPSEL */
+    switch_v7m_security_state(env, targets_secure);
     write_v7m_control_spsel(env, 0);
     arm_clear_exclusive(env);
     /* Clear IT bits */
     env->condexec_bits = 0;
     env->regs[14] = lr;
-    addr = arm_v7m_load_vector(cpu);
+    addr = arm_v7m_load_vector(cpu, targets_secure);
     env->regs[15] = addr & 0xfffffffe;
     env->thumb = addr & 1;
 }
@@ -6404,7 +6509,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     if (sfault) {
         env->v7m.sfsr |= R_V7M_SFSR_INVER_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-        v7m_exception_taken(cpu, excret);
+        v7m_exception_taken(cpu, excret, true);
         qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
                       "stackframe: failed EXC_RETURN.ES validity check\n");
         return;
@@ -6416,7 +6521,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
          */
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, env->v7m.secure);
-        v7m_exception_taken(cpu, excret);
+        v7m_exception_taken(cpu, excret, true);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                       "stackframe: failed exception return integrity check\n");
         return;
@@ -6464,7 +6569,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 /* Take a SecureFault on the current stack */
                 env->v7m.sfsr |= R_V7M_SFSR_INVIS_MASK;
                 armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SECURE, false);
-                v7m_exception_taken(cpu, excret);
+                v7m_exception_taken(cpu, excret, true);
                 qemu_log_mask(CPU_LOG_INT, "...taking SecureFault on existing "
                               "stackframe: failed exception return integrity "
                               "signature check\n");
@@ -6527,7 +6632,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
                 armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE,
                                         env->v7m.secure);
                 env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
-                v7m_exception_taken(cpu, excret);
+                v7m_exception_taken(cpu, excret, true);
                 qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on existing "
                               "stackframe: failed exception return integrity "
                               "check\n");
@@ -6564,7 +6669,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE, false);
         env->v7m.cfsr[env->v7m.secure] |= R_V7M_CFSR_INVPC_MASK;
         v7m_push_stack(cpu);
-        v7m_exception_taken(cpu, excret);
+        v7m_exception_taken(cpu, excret, false);
         qemu_log_mask(CPU_LOG_INT, "...taking UsageFault on new stackframe: "
                       "failed exception return integrity check\n");
         return;
@@ -6708,20 +6813,40 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         return; /* Never happens.  Keep compiler happy.  */
     }
 
-    lr = R_V7M_EXCRET_RES1_MASK |
-        R_V7M_EXCRET_S_MASK |
-        R_V7M_EXCRET_DCRS_MASK |
-        R_V7M_EXCRET_FTYPE_MASK |
-        R_V7M_EXCRET_ES_MASK;
-    if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK) {
-        lr |= R_V7M_EXCRET_SPSEL_MASK;
+    if (arm_feature(env, ARM_FEATURE_V8)) {
+        lr = R_V7M_EXCRET_RES1_MASK |
+            R_V7M_EXCRET_DCRS_MASK |
+            R_V7M_EXCRET_FTYPE_MASK;
+        /* The S bit indicates whether we should return to Secure
+         * or NonSecure (ie our current state).
+         * The ES bit indicates whether we're taking this exception
+         * to Secure or NonSecure (ie our target state). We set it
+         * later, in v7m_exception_taken().
+         * The SPSEL bit is also set in v7m_exception_taken() for v8M.
+         * This corresponds to the ARM ARM pseudocode for v8M setting
+         * some LR bits in PushStack() and some in ExceptionTaken();
+         * the distinction matters for the tailchain cases where we
+         * can take an exception without pushing the stack.
+         */
+        if (env->v7m.secure) {
+            lr |= R_V7M_EXCRET_S_MASK;
+        }
+    } else {
+        lr = R_V7M_EXCRET_RES1_MASK |
+            R_V7M_EXCRET_S_MASK |
+            R_V7M_EXCRET_DCRS_MASK |
+            R_V7M_EXCRET_FTYPE_MASK |
+            R_V7M_EXCRET_ES_MASK;
+        if (env->v7m.control[M_REG_NS] & R_V7M_CONTROL_SPSEL_MASK) {
+            lr |= R_V7M_EXCRET_SPSEL_MASK;
+        }
     }
     if (!arm_v7m_is_handler_mode(env)) {
         lr |= R_V7M_EXCRET_MODE_MASK;
     }
 
     v7m_push_stack(cpu);
-    v7m_exception_taken(cpu, lr);
+    v7m_exception_taken(cpu, lr, false);
     qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
 }
 
-- 
2.7.4


Received: by 10.223.172.38 with SMTP id v35csp3218088wrc;
        Fri, 22 Sep 2017 08:08:20 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB0HYLMIozt5uhxSQ7yybYqgnRprGOQKtZx+W9OIhVDLtSxk7r7CWTFEEB641GdDIR1JewL
X-Received: by 10.55.180.193 with SMTP id d184mr8268295qkf.87.1506092900234;
        Fri, 22 Sep 2017 08:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092900; cv=none;
        d=google.com; s=arc-20160816;
        b=vwcqb3ieCZFNAm9jJrhYBv0U4RqzwKQs42nxstwinaevDoztMrPz3/Li1tuoueVehH
         6nIolPUjw97A8AVcUWsQTDKP4uPb1CtPIEUA+ARuLtpeKKRAgxRjWygoNktYexMx+ufY
         MDGSB6KnAvqDxxKQFdnMmD1OdgoNEvdFnDX3Jrhfbo+qFPwTtOk+OthPFWwRJC3sEX4e
         kykgIcu6FomQG6AkHQ7NPMlureEBOlZG/9wZgsA/NAVKouOZbnIWXKrYgsssIj4kCmzz
         +2dHjD6NkFMhxm7J3sBx6nyEcnzxFgEIQg+DCG/DpRuzKIGQB4F/vS8YA0ZAAmiCRru9
         qEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=Fx37YsEywhqylNENqWWTJEik+WvjkclDdFLnKW84MWA=;
        b=GhqQn5dJSdNAFQ5M17LPaNZYHEOE04Ju14wtGj6kkEwdjOTFxm+I9orQSpcCUCKRik
         keX6tO2DD0TOjXBpTH7bqFtq6lOLKJeB4tny7dno23SKqM022V2TosK372tyXibfRCxh
         AqS6kRIILFjZKtmOnnW7WviFt4MvNoeU0MYVDresClNW/QGTcoIjLzb8YPCa5XbBMHm9
         mFW20Za/cIDBkfEEztpuH0jzrgHMhlj+69CG/FadNVGMt29ekJwXeeLGmA4Ys6q04ZCQ
         y3zmcI4TbA+0HgMgKmJ3EdxacYednZLPN4/DCtdVENNW9fjLF6+5MUBmJ4t1c7jlUDNV
         EpCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n34si34285qtb.277.2017.09.22.08.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:08:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPYw-0006ry-0V
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:08:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQe-00083x-H0
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 10:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQc-0004DR-Sj
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 10:59:44 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37562)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQY-00044o-RV; Fri, 22 Sep 2017 10:59:39 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQR-00078E-6k; Fri, 22 Sep 2017 15:59:31 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:49 +0100
Message-Id: <1506092407-26985-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 02/20] target/arm: Don't switch to target stack
 early in v7M exception return
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EKnf67CTk1JF

Currently our M profile exception return code switches to the
target stack pointer relatively early in the process, before
it tries to pop the exception frame off the stack. This is
awkward for v8M for two reasons:
 * in v8M the process vs main stack pointer is not selected
   purely by the value of CONTROL.SPSEL, so updating SPSEL
   and relying on that to switch to the right stack pointer
   won't work
 * the stack we should be reading the stack frame from and
   the stack we will eventually switch to might not be the
   same if the guest is doing strange things

Change our exception return code to use a 'frame pointer'
to read the exception frame rather than assuming that we
can switch the live stack pointer this early.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 127 +++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 95 insertions(+), 32 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8be78ea..f13b99d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6040,16 +6040,6 @@ static void v7m_push(CPUARMState *env, uint32_t val)
     stl_phys(cs->as, env->regs[13], val);
 }
 
-static uint32_t v7m_pop(CPUARMState *env)
-{
-    CPUState *cs = CPU(arm_env_get_cpu(env));
-    uint32_t val;
-
-    val = ldl_phys(cs->as, env->regs[13]);
-    env->regs[13] += 4;
-    return val;
-}
-
 /* Return true if we're using the process stack pointer (not the MSP) */
 static bool v7m_using_psp(CPUARMState *env)
 {
@@ -6141,6 +6131,40 @@ void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
     env->regs[15] = dest & ~1;
 }
 
+static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
+                                bool spsel)
+{
+    /* Return a pointer to the location where we currently store the
+     * stack pointer for the requested security state and thread mode.
+     * This pointer will become invalid if the CPU state is updated
+     * such that the stack pointers are switched around (eg changing
+     * the SPSEL control bit).
+     * Compare the v8M ARM ARM pseudocode LookUpSP_with_security_mode().
+     * Unlike that pseudocode, we require the caller to pass us in the
+     * SPSEL control bit value; this is because we also use this
+     * function in handling of pushing of the callee-saves registers
+     * part of the v8M stack frame, and in that case the SPSEL bit
+     * comes from the exception return magic LR value.
+     */
+    bool want_psp = threadmode && spsel;
+
+    if (secure == env->v7m.secure) {
+        /* Currently switch_v7m_sp switches SP as it updates SPSEL,
+         * so the SP we want is always in regs[13].
+         * When we decouple SPSEL from the actually selected SP
+         * we need to check want_psp against v7m_using_psp()
+         * to see whether we need regs[13] or v7m.other_sp.
+         */
+        return &env->regs[13];
+    } else {
+        if (want_psp) {
+            return &env->v7m.other_ss_psp;
+        } else {
+            return &env->v7m.other_ss_msp;
+        }
+    }
+}
+
 static uint32_t arm_v7m_load_vector(ARMCPU *cpu)
 {
     CPUState *cs = CPU(cpu);
@@ -6212,6 +6236,7 @@ static void v7m_push_stack(ARMCPU *cpu)
 static void do_v7m_exception_exit(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
     uint32_t excret;
     uint32_t xpsr;
     bool ufault = false;
@@ -6219,6 +6244,7 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
     bool return_to_handler = false;
     bool rettobase = false;
     bool exc_secure = false;
+    bool return_to_secure;
 
     /* We can only get here from an EXCP_EXCEPTION_EXIT, and
      * gen_bx_excret() enforces the architectural rule
@@ -6286,6 +6312,9 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         g_assert_not_reached();
     }
 
+    return_to_secure = arm_feature(env, ARM_FEATURE_M_SECURITY) &&
+        (excret & R_V7M_EXCRET_S_MASK);
+
     switch (excret & 0xf) {
     case 1: /* Return to Handler */
         return_to_handler = true;
@@ -6315,32 +6344,66 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         return;
     }
 
-    /* Switch to the target stack.  */
+    /* Set CONTROL.SPSEL from excret.SPSEL. For QEMU this currently
+     * causes us to switch the active SP, but we will change this
+     * later to not do that so we can support v8M.
+     */
     switch_v7m_sp(env, return_to_sp_process);
-    /* Pop registers.  */
-    env->regs[0] = v7m_pop(env);
-    env->regs[1] = v7m_pop(env);
-    env->regs[2] = v7m_pop(env);
-    env->regs[3] = v7m_pop(env);
-    env->regs[12] = v7m_pop(env);
-    env->regs[14] = v7m_pop(env);
-    env->regs[15] = v7m_pop(env);
-    if (env->regs[15] & 1) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "M profile return from interrupt with misaligned "
-                      "PC is UNPREDICTABLE\n");
-        /* Actual hardware seems to ignore the lsbit, and there are several
-         * RTOSes out there which incorrectly assume the r15 in the stack
-         * frame should be a Thumb-style "lsbit indicates ARM/Thumb" value.
+
+    {
+        /* The stack pointer we should be reading the exception frame from
+         * depends on bits in the magic exception return type value (and
+         * for v8M isn't necessarily the stack pointer we will eventually
+         * end up resuming execution with). Get a pointer to the location
+         * in the CPU state struct where the SP we need is currently being
+         * stored; we will use and modify it in place.
+         * We use this limited C variable scope so we don't accidentally
+         * use 'frame_sp_p' after we do something that makes it invalid.
+         */
+        uint32_t *frame_sp_p = get_v7m_sp_ptr(env,
+                                              return_to_secure,
+                                              !return_to_handler,
+                                              return_to_sp_process);
+        uint32_t frameptr = *frame_sp_p;
+
+        /* Pop registers. TODO: make these accesses use the correct
+         * attributes and address space (S/NS, priv/unpriv) and handle
+         * memory transaction failures.
          */
-        env->regs[15] &= ~1U;
+        env->regs[0] = ldl_phys(cs->as, frameptr);
+        env->regs[1] = ldl_phys(cs->as, frameptr + 0x4);
+        env->regs[2] = ldl_phys(cs->as, frameptr + 0x8);
+        env->regs[3] = ldl_phys(cs->as, frameptr + 0xc);
+        env->regs[12] = ldl_phys(cs->as, frameptr + 0x10);
+        env->regs[14] = ldl_phys(cs->as, frameptr + 0x14);
+        env->regs[15] = ldl_phys(cs->as, frameptr + 0x18);
+        if (env->regs[15] & 1) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "M profile return from interrupt with misaligned "
+                          "PC is UNPREDICTABLE\n");
+            /* Actual hardware seems to ignore the lsbit, and there are several
+             * RTOSes out there which incorrectly assume the r15 in the stack
+             * frame should be a Thumb-style "lsbit indicates ARM/Thumb" value.
+             */
+            env->regs[15] &= ~1U;
+        }
+        xpsr = ldl_phys(cs->as, frameptr + 0x1c);
+
+        /* Commit to consuming the stack frame */
+        frameptr += 0x20;
+        /* Undo stack alignment (the SPREALIGN bit indicates that the original
+         * pre-exception SP was not 8-aligned and we added a padding word to
+         * align it, so we undo this by ORing in the bit that increases it
+         * from the current 8-aligned value to the 8-unaligned value. (Adding 4
+         * would work too but a logical OR is how the pseudocode specifies it.)
+         */
+        if (xpsr & XPSR_SPREALIGN) {
+            frameptr |= 4;
+        }
+        *frame_sp_p = frameptr;
     }
-    xpsr = v7m_pop(env);
+    /* This xpsr_write() will invalidate frame_sp_p as it may switch stack */
     xpsr_write(env, xpsr, ~XPSR_SPREALIGN);
-    /* Undo stack alignment.  */
-    if (xpsr & XPSR_SPREALIGN) {
-        env->regs[13] |= 4;
-    }
 
     /* The restored xPSR exception field will be zero if we're
      * resuming in Thread mode. If that doesn't match what the
-- 
2.7.4


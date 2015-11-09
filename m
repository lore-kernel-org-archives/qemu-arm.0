Received: by 10.182.105.169 with SMTP id gn9csp903232obb;
        Sun, 8 Nov 2015 17:22:42 -0800 (PST)
X-Received: by 10.140.97.34 with SMTP id l31mr9822292qge.30.1447032162549;
        Sun, 08 Nov 2015 17:22:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a6si9311069qha.81.2015.11.08.17.22.42
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvbAQ-0001B4-7M
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:22:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1U-0001UZ-Q9
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1S-00081H-DF
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:28 -0500
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e]:33225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1S-00080m-6R; Sun, 08 Nov 2015 20:13:26 -0500
Received: by qkas77 with SMTP id s77so61963233qka.0;
	Sun, 08 Nov 2015 17:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fedzU9aTX7yXa9FVEXpE+o/ir0ujvagSFE++5z7DGCU=;
	b=nA2xNjeakyH2yYH/kPNddHX+587ZJb5cFFnUCw/gJc5H7nSmbUTy4oRrE4TddTii4Z
	CoWLtFWtmYpQp3E+6VIZBYOpnjUx6+v0G6ognl9FenOQeGy2hdklt6LCSA4J1v31AvSA
	f1eqhwY1e5lxtjtoQsUMeoYuzkFALzP8MQRGB0QgZaqYkRnTqKN2HzKgoyzk7Fe2Kuy+
	VclVjQNEgKkScpmGvbVGMwOntjQ5x42XgBijPh/RRqjH0IvGVQcmX6l9mUPekNDHarCK
	Hzp3jT4YzBcCuoGf0boRw88N4LpHDAEf3FG9jvdujqcCvCDyBLrW2I9LLAwieXjR/I1o
	ai8A==
X-Received: by 10.55.51.200 with SMTP id z191mr26989377qkz.21.1447031605793;
	Sun, 08 Nov 2015 17:13:25 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:25 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:43 -0500
Message-Id: <1447031505-12477-17-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::22e
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 16/18] armv7m: check exception return
	consistency
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q3R6TlBmrgHT

Detect use of reserved exception return codes
and return to thread mode from nested
exception handler.

Also check consistency between NVIC and CPU
wrt. the active exception.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c |  7 +++-
 target-arm/cpu.h      |  2 +-
 target-arm/helper.c   | 97 ++++++++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 96 insertions(+), 10 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 734f6f8..a75dd3c 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -342,7 +342,7 @@ void armv7m_nvic_acknowledge_irq(void *opaque)
     assert(env->v7m.exception > 0); /* spurious exception? */
 }
 
-void armv7m_nvic_complete_irq(void *opaque, int irq)
+bool armv7m_nvic_complete_irq(void *opaque, int irq)
 {
     nvic_state *s = (nvic_state *)opaque;
     vec_info *I;
@@ -352,12 +352,17 @@ void armv7m_nvic_complete_irq(void *opaque, int irq)
 
     I = &s->vectors[irq];
 
+    if (!I->active) {
+        return true;
+    }
+
     I->active = 0;
     I->pending = I->level;
     assert(!I->level || irq >= 16);
 
     nvic_irq_update(s, 1);
     DPRINTF(0, "EOI %d\n", irq);
+    return false;
 }
 
 /* Only called for external interrupt (vector>=16) */
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index e98bca0..72b0b32 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1063,7 +1063,7 @@ int armv7m_excp_unmasked(ARMCPU *cpu)
 /* Interface between CPU and Interrupt controller.  */
 void armv7m_nvic_set_pending(void *opaque, int irq);
 void armv7m_nvic_acknowledge_irq(void *opaque);
-void armv7m_nvic_complete_irq(void *opaque, int irq);
+bool armv7m_nvic_complete_irq(void *opaque, int irq);
 
 /* Interface for defining coprocessor registers.
  * Registers are defined in tables of arm_cp_reginfo structs
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 83af528..3993f77 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5375,18 +5375,65 @@ static void switch_v7m_sp(CPUARMState *env, int process)
 
 static void do_v7m_exception_exit(CPUARMState *env)
 {
+    unsigned ufault = 0;
     uint32_t type;
     uint32_t xpsr;
+    uint32_t nvic_active;
+
+    if (env->v7m.exception == 0) {
+        hw_error("Return from exception w/o active exception.  Logic error.");
+    }
 
-    type = env->regs[15];
     if (env->v7m.exception != ARMV7M_EXCP_NMI) {
         /* Auto-clear FAULTMASK on return from other than NMI */
         env->daif &= ~PSTATE_F;
     }
-    if (env->v7m.exception != 0) {
-        armv7m_nvic_complete_irq(env->nvic, env->v7m.exception);
+
+    if (armv7m_nvic_complete_irq(env->nvic, env->v7m.exception)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "Requesting return from exception "
+                      "from inactive exception %d\n",
+                      env->v7m.exception);
+        ufault = 1;
+    }
+    /* env->v7m.exception and friends updated by armv7m_nvic_complete_irq() */
+
+    type = env->regs[15]&0xf;
+    /* QEMU seems to clear the LSB at some point. */
+    type |= 1;
+
+    switch (type) {
+    case 0x1: /* Return to Handler mode */
+        if (env->v7m.exception == 0) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Requesting return from exception "
+                          "to Handler mode not allowed at base level of "
+                          "activation");
+            ufault = 1;
+        }
+        break;
+    case 0x9: /* Return to Thread mode w/ Main stack */
+    case 0xd: /* Return to Thread mode w/ Process stack */
+        if (env->v7m.exception != 0) {
+            /* Attempt to return to Thread mode
+             * from nested handler while NONBASETHRDENA not set.
+             */
+            qemu_log_mask(LOG_GUEST_ERROR, "Nested exception return to %d w/"
+                          " Thread mode while NONBASETHRDENA not set\n",
+                          env->v7m.exception);
+            ufault = 1;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "Exception return w/ reserved code"
+                                       " %02x\n", (unsigned)type);
+        ufault = 1;
     }
 
+    /* TODO? if ufault==1 ARM calls for entering exception handler
+     * directly w/o popping stack.
+     * We pop anyway since the active UsageFault will push on entry
+     * which should happen before execution resumes?
+     */
+
     /* Switch to the target stack.  */
     switch_v7m_sp(env, (type & 4) != 0);
     /* Pop registers.  */
@@ -5409,15 +5456,49 @@ static void do_v7m_exception_exit(CPUARMState *env)
         env->regs[15] &= ~1U;
     }
     xpsr = v7m_pop(env);
+    nvic_active = env->v7m.exception;
     xpsr_write(env, xpsr, 0xfffffdff);
+
     /* Undo stack alignment.  */
     if (xpsr & 0x200)
         env->regs[13] |= 4;
-    /* ??? The exception return type specifies Thread/Handler mode.  However
-       this is also implied by the xPSR value. Not sure what to do
-       if there is a mismatch.  */
-    /* ??? Likewise for mismatches between the CONTROL register and the stack
-       pointer.  */
+
+    /* TODO? if v7m.exception>0 && nvic_active != v7m.exception
+     * Adjust v7m.exception_prio for the exception being returned to?
+     * This could be different now that v7m.exception is restored
+     * from the guest stack.
+     * This can happen if the guest adjusts exception priorities
+     * while in a handler.
+     * At present retain the priority of the highest active
+     * exception.
+     */
+
+    if (!ufault) {
+        if (nvic_active != 0 && env->v7m.exception == 0) {
+            ufault = 1;
+        } else if (nvic_active == 0 && env->v7m.exception != 0) {
+            ufault = 1;
+        }
+        if (ufault) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Return from exception with "
+                          "inconsistency between Exception return code "
+                          "and stacked xPSR\n");
+        }
+        /* ARM calls for PushStack() here, which should happen
+         * went we return with a pending exception
+         */
+    }
+
+    if (ufault) {
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
+        env->v7m.cfsr |= 1<<18; /* INVPC */
+    }
+
+    /* Ensure that priority is consistent.  Clear for Thread mode
+     * and set for Handler mode
+     */
+    assert((env->v7m.exception == 0 && env->v7m.exception_prio > 0xff)
+           || (env->v7m.exception != 0 && env->v7m.exception_prio <= 0xff));
 }
 
 void arm_v7m_cpu_do_interrupt(CPUState *cs)
-- 
2.1.4


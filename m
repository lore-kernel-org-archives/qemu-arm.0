Received: by 10.182.158.201 with SMTP id ww9csp3414143obb;
        Wed, 2 Dec 2015 16:23:56 -0800 (PST)
X-Received: by 10.140.19.172 with SMTP id 41mr7855839qgh.89.1449102236825;
        Wed, 02 Dec 2015 16:23:56 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si5828966qgt.95.2015.12.02.16.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:23:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60959 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hgi-0004Se-CW
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:23:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc6-0004IK-AM
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc5-00020m-2u
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:10 -0500
Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d]:36364)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc4-00020a-O6; Wed, 02 Dec 2015 19:19:08 -0500
Received: by qkda6 with SMTP id a6so23875625qkd.3;
	Wed, 02 Dec 2015 16:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HH8cMYKoTWNxTKU6qLER2zwJwTJ+SApubpgpiuEcAO8=;
	b=tFWk3W6FD3JxlkI7fEisflN0VobXMFbduF5BF2dORYlhvsRT4gmEhJkHk/F0Q2QhNN
	QXCyNyY/yQPG04CfAVfuThJmsZ5jIVfdULiHpWDlB+l5r4/0Qy7mZatmGxs63x6HWQte
	e5Jj8AtQZTP7+tjD3hFJaFqqRAEfAMUYaNJ61ZRGEXcFRLjunGcntDQbTP715vSmcKip
	Q5oef5zxVa8QzscFv9jVvnlPx8i4GNxHEzMbOoDUK9+Mz1nnPxVEwi122BFWbOMGbu+5
	ywBt/Hl0revQ4kRsHBNb3G5xZgiorL+thzToalwlG+nvgTvvV/+1EAjhIz8qqK4rgyPn
	jfJA==
X-Received: by 10.55.76.137 with SMTP id z131mr7356031qka.29.1449101948344;
	Wed, 02 Dec 2015 16:19:08 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:08 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:39 -0500
Message-Id: <1449101933-24928-13-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::22d
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 12/26] armv7m: check exception return
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
X-TUID: 0Fwl/k24sFeY

Detect use of reserved exception return codes
and return to thread mode from nested
exception handler.

Also check consistency between NVIC and CPU
wrt. the active exception.
---
 hw/intc/armv7m_nvic.c |  7 +++-
 target-arm/cpu.h      |  2 +-
 target-arm/helper.c   | 95 ++++++++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 94 insertions(+), 10 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 619c320..7d261ae 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -396,7 +396,7 @@ void armv7m_nvic_acknowledge_irq(void *opaque)
     assert(env->v7m.exception > 0); /* spurious exception? */
 }
 
-void armv7m_nvic_complete_irq(void *opaque, int irq)
+bool armv7m_nvic_complete_irq(void *opaque, int irq)
 {
     NVICState *s = (NVICState *)opaque;
     VecInfo *vec;
@@ -406,12 +406,17 @@ void armv7m_nvic_complete_irq(void *opaque, int irq)
 
     vec = &s->vectors[irq];
 
+    if (!vec->active) {
+        return true;
+    }
+
     vec->active = 0;
     vec->pending = vec->level;
     assert(!vec->level || irq >= 16);
 
     nvic_irq_update(s);
     DPRINTF(0, "EOI %d\n", irq);
+    return false;
 }
 
 /* Only called for external interrupt (vector>=16) */
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 4262efc..b98ef89 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1043,7 +1043,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq);
 bool armv7m_nvic_is_active(void *opaque, int irq);
 int armv7m_nvic_get_active_prio(void *opaque);
 void armv7m_nvic_acknowledge_irq(void *opaque);
-void armv7m_nvic_complete_irq(void *opaque, int irq);
+bool armv7m_nvic_complete_irq(void *opaque, int irq);
 
 /* Interface for defining coprocessor registers.
  * Registers are defined in tables of arm_cp_reginfo structs
diff --git a/target-arm/helper.c b/target-arm/helper.c
index b6ec761..f7e496d 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5375,18 +5375,65 @@ static void switch_v7m_sp(CPUARMState *env, int process)
 
 static void do_v7m_exception_exit(CPUARMState *env)
 {
+    unsigned ufault = 0;
     uint32_t type;
     uint32_t xpsr;
 
-    type = env->regs[15];
+    if (env->v7m.exception == 0) {
+        hw_error("Return from exception w/o active exception.  Logic error.");
+    }
+
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
+    env->v7m.exception = -42; /* spoil, will be unstacked below */
+    env->v7m.exception_prio = armv7m_nvic_get_active_prio(env->nvic);
+
+    type = env->regs[15] & 0xf;
+    /* QEMU seems to clear the LSB at some point. */
+    type |= 1;
+
+    switch (type) {
+    case 0x1: /* Return to Handler mode */
+        if (env->v7m.exception_prio == 0x100) {
+            qemu_log_mask(LOG_GUEST_ERROR, "Requesting return from exception "
+                          "to Handler mode not allowed at base level of "
+                          "activation");
+            ufault = 1;
+        }
+        break;
+    case 0x9: /* Return to Thread mode w/ Main stack */
+    case 0xd: /* Return to Thread mode w/ Process stack */
+        if (env->v7m.exception_prio != 0x100) {
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
@@ -5409,14 +5456,46 @@ static void do_v7m_exception_exit(CPUARMState *env)
     }
     xpsr = v7m_pop(env);
     xpsr_write(env, xpsr, 0xfffffdff);
+
+    assert(env->v7m.exception!=-42);
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
+    if (!ufault) {
+        /* consistency check between NVIC and guest stack */
+        if (env->v7m.exception == 0 && env->v7m.exception_prio != 0x100) {
+            ufault = 1;
+            qemu_log_mask(LOG_GUEST_ERROR, "Can't Unstacked to thread mode "
+                          "with active exception\n");
+            env->v7m.exception_prio = 0x100;
+
+        } else if (env->v7m.exception != 0 &&
+                   !armv7m_nvic_is_active(env->nvic, env->v7m.exception))
+        {
+            ufault = 1;
+            qemu_log_mask(LOG_GUEST_ERROR, "Unstacked exception %d is not "
+                          "active\n", env->v7m.exception);
+        } else  if (env->v7m.exception != 0
+                    && env->v7m.exception_prio == 0x100) {
+            hw_error("logic error at exception exit\n");
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
 
 static
-- 
2.1.4


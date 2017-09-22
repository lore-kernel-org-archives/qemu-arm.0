Received: by 10.223.172.38 with SMTP id v35csp3212707wrc;
        Fri, 22 Sep 2017 08:03:09 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCPHQ8sdEXd4dHc/wF+vzxn0q/Kz/7azBtQOkF39TzAY27QItzo1OEv+NkIpyDtUNt/sPsx
X-Received: by 10.55.42.5 with SMTP id q5mr8544478qkh.71.1506092588994;
        Fri, 22 Sep 2017 08:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506092588; cv=none;
        d=google.com; s=arc-20160816;
        b=GdMpg2tv8o4gM/2LDeWDAZvjZIEPJgHaTqFSTsi6/u0W39aW+tS9rmlygtPAU6zQCF
         a8wnhNMSd5MDmEoC+/5rSQUdEZzryOz2D+lqMA5c5+0Pnq3RhlsYfTAtiVU9U9mFliQ8
         ig0HxWgkUzfw2ny5WqnrAYX9CPt8EbdSu8Xb8zWhKuKmCMtmb5Fbm/BZ383SLsP16o/4
         ExQ/gQcsMQgXzvjqrgPYyo4KeQ33z8ZjujjGZZ76ZAGH8YUmC/9uVo64a/zLk/M8++Rk
         QxNIlRCH9jczsaZ1m3wX3ScS7Hjw013GSR3vd3pI1fQvPKLrlG0ZpREFRCbrPGpXOjDV
         k+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=sPxUO8QkNQEaFr91yw3IroTAzLpq/Yayy5FMDNAo8hQ=;
        b=BTE2jUlzhzauXdJKrclEtyJE5oL1AyvYowzct5MkhGkMF1gXPeh0ZGuVrIETxIbS/M
         bRjL1Go7/gqDUY8aSBq1iwu68TRKYRu7AXrmSjWrC2vHaxdU8CmbGLx0GSGOc7li+nWE
         xHvoS0EB1/uzR8ACDs1axKT9xiwrPrjaDQVqkFvZaGKiE9TzSkiI4pz2o641831tEdqK
         tufyWtSOzcqd/u5AsVcG+zKbujzSMv8BhINplOLlG4x5vKX93ZaabjGJ+sAFEb5scCVS
         G6TancRo0skAQTu2DwRR4xDeXUhfizeST6DM8lZ821MvzmeSTspCK2LdlJrFbTllHI3V
         /34g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k67si24724qkh.168.2017.09.22.08.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 08:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvPTu-0002K5-Ho
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 11:03:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQV-0007sz-Jx
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dvPQU-00041A-BL
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 10:59:35 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dvPQU-0003yz-3t; Fri, 22 Sep 2017 10:59:34 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dvPQR-00078T-S7; Fri, 22 Sep 2017 15:59:31 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 15:59:50 +0100
Message-Id: <1506092407-26985-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
References: <1506092407-26985-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 03/20] target/arm: Prepare for CONTROL.SPSEL
 being nonzero in Handler mode
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
X-TUID: /nwlUzvS0TTW

In the v7M architecture, there is an invariant that if the CPU is
in Handler mode then the CONTROL.SPSEL bit cannot be nonzero.
This in turn means that the current stack pointer is always
indicated by CONTROL.SPSEL, even though Handler mode always uses
the Main stack pointer.

In v8M, this invariant is removed, and CONTROL.SPSEL may now
be nonzero in Handler mode (though Handler mode still always
uses the Main stack pointer). In preparation for this change,
change how we handle this bit: rename switch_v7m_sp() to
the now more accurate write_v7m_control_spsel(), and make it
check both the handler mode state and the SPSEL bit.

Note that this implicitly changes the point at which we switch
active SP on exception exit from before we pop the exception
frame to after it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      |  8 ++++++-
 hw/intc/armv7m_nvic.c |  2 +-
 target/arm/helper.c   | 65 ++++++++++++++++++++++++++++++++++-----------------
 3 files changed, 51 insertions(+), 24 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8afceca..ad6eff4 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -991,6 +991,11 @@ void pmccntr_sync(CPUARMState *env);
 #define PSTATE_MODE_EL1t 4
 #define PSTATE_MODE_EL0t 0
 
+/* Write a new value to v7m.exception, thus transitioning into or out
+ * of Handler mode; this may result in a change of active stack pointer.
+ */
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc);
+
 /* Map EL and handler into a PSTATE_MODE.  */
 static inline unsigned int aarch64_pstate_mode(unsigned int el, bool handler)
 {
@@ -1071,7 +1076,8 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
         env->condexec_bits |= (val >> 8) & 0xfc;
     }
     if (mask & XPSR_EXCP) {
-        env->v7m.exception = val & XPSR_EXCP;
+        /* Note that this only happens on exception exit */
+        write_v7m_exception(env, val & XPSR_EXCP);
     }
 }
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index bc7b66d..a1041c2 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -616,7 +616,7 @@ bool armv7m_nvic_acknowledge_irq(void *opaque)
     vec->active = 1;
     vec->pending = 0;
 
-    env->v7m.exception = s->vectpending;
+    write_v7m_exception(env, s->vectpending);
 
     nvic_irq_update(s);
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f13b99d..509a1aa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6052,21 +6052,44 @@ static bool v7m_using_psp(CPUARMState *env)
         env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_SPSEL_MASK;
 }
 
-/* Switch to V7M main or process stack pointer.  */
-static void switch_v7m_sp(CPUARMState *env, bool new_spsel)
+/* Write to v7M CONTROL.SPSEL bit. This may change the current
+ * stack pointer between Main and Process stack pointers.
+ */
+static void write_v7m_control_spsel(CPUARMState *env, bool new_spsel)
 {
     uint32_t tmp;
-    uint32_t old_control = env->v7m.control[env->v7m.secure];
-    bool old_spsel = old_control & R_V7M_CONTROL_SPSEL_MASK;
+    bool new_is_psp, old_is_psp = v7m_using_psp(env);
+
+    env->v7m.control[env->v7m.secure] =
+        deposit32(env->v7m.control[env->v7m.secure],
+                  R_V7M_CONTROL_SPSEL_SHIFT,
+                  R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
+
+    new_is_psp = v7m_using_psp(env);
 
-    if (old_spsel != new_spsel) {
+    if (old_is_psp != new_is_psp) {
         tmp = env->v7m.other_sp;
         env->v7m.other_sp = env->regs[13];
         env->regs[13] = tmp;
+    }
+}
+
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    /* Write a new value to v7m.exception, thus transitioning into or out
+     * of Handler mode; this may result in a change of active stack pointer.
+     */
+    bool new_is_psp, old_is_psp = v7m_using_psp(env);
+    uint32_t tmp;
 
-        env->v7m.control[env->v7m.secure] = deposit32(old_control,
-                                     R_V7M_CONTROL_SPSEL_SHIFT,
-                                     R_V7M_CONTROL_SPSEL_LENGTH, new_spsel);
+    env->v7m.exception = new_exc;
+
+    new_is_psp = v7m_using_psp(env);
+
+    if (old_is_psp != new_is_psp) {
+        tmp = env->v7m.other_sp;
+        env->v7m.other_sp = env->regs[13];
+        env->regs[13] = tmp;
     }
 }
 
@@ -6149,13 +6172,11 @@ static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
     bool want_psp = threadmode && spsel;
 
     if (secure == env->v7m.secure) {
-        /* Currently switch_v7m_sp switches SP as it updates SPSEL,
-         * so the SP we want is always in regs[13].
-         * When we decouple SPSEL from the actually selected SP
-         * we need to check want_psp against v7m_using_psp()
-         * to see whether we need regs[13] or v7m.other_sp.
-         */
-        return &env->regs[13];
+        if (want_psp == v7m_using_psp(env)) {
+            return &env->regs[13];
+        } else {
+            return &env->v7m.other_sp;
+        }
     } else {
         if (want_psp) {
             return &env->v7m.other_ss_psp;
@@ -6198,7 +6219,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr)
     uint32_t addr;
 
     armv7m_nvic_acknowledge_irq(env->nvic);
-    switch_v7m_sp(env, 0);
+    write_v7m_control_spsel(env, 0);
     arm_clear_exclusive(env);
     /* Clear IT bits */
     env->condexec_bits = 0;
@@ -6344,11 +6365,11 @@ static void do_v7m_exception_exit(ARMCPU *cpu)
         return;
     }
 
-    /* Set CONTROL.SPSEL from excret.SPSEL. For QEMU this currently
-     * causes us to switch the active SP, but we will change this
-     * later to not do that so we can support v8M.
+    /* Set CONTROL.SPSEL from excret.SPSEL. Since we're still in
+     * Handler mode (and will be until we write the new XPSR.Interrupt
+     * field) this does not switch around the current stack pointer.
      */
-    switch_v7m_sp(env, return_to_sp_process);
+    write_v7m_control_spsel(env, return_to_sp_process);
 
     {
         /* The stack pointer we should be reading the exception frame from
@@ -9163,11 +9184,11 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
     case 20: /* CONTROL */
         /* Writing to the SPSEL bit only has an effect if we are in
          * thread mode; other bits can be updated by any privileged code.
-         * switch_v7m_sp() deals with updating the SPSEL bit in
+         * write_v7m_control_spsel() deals with updating the SPSEL bit in
          * env->v7m.control, so we only need update the others.
          */
         if (!arm_v7m_is_handler_mode(env)) {
-            switch_v7m_sp(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
+            write_v7m_control_spsel(env, (val & R_V7M_CONTROL_SPSEL_MASK) != 0);
         }
         env->v7m.control[env->v7m.secure] &= ~R_V7M_CONTROL_NPRIV_MASK;
         env->v7m.control[env->v7m.secure] |= val & R_V7M_CONTROL_NPRIV_MASK;
-- 
2.7.4


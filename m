Received: by 10.25.77.65 with SMTP id a62csp303151lfb;
        Thu, 2 Feb 2017 12:02:26 -0800 (PST)
X-Received: by 10.25.195.76 with SMTP id t73mr3060696lff.40.1486065746681;
        Thu, 02 Feb 2017 12:02:26 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id h89si14926078lji.51.2017.02.02.12.02.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2017 12:02:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cZNaL-0001vE-H0; Thu, 02 Feb 2017 20:02:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 4/9] armv7m: Fix condition check for taking exceptions
Date: Thu,  2 Feb 2017 20:02:17 +0000
Message-Id: <1486065742-28639-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
X-TUID: TxgzNEZ1kVBP

The M profile condition for when we can take a pending exception or
interrupt is not the same as that for A/R profile.  The code
originally copied from the A/R profile version of the
cpu_exec_interrupt function only worked by chance for the
very simple case of exceptions being masked by PRIMASK.
Replace it with a call to a function in the NVIC code that
correctly compares the priority of the pending exception
against the current execution priority of the CPU.

[Michael Davidsaver's patchset had a patch to do something
similar but the implementation ended up being a rewrite.]

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      |  8 ++++++++
 hw/intc/armv7m_nvic.c |  7 +++++++
 target/arm/cpu.c      | 16 ++++++++--------
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39bff86..ac20a56 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1335,6 +1335,14 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
                                  uint32_t cur_el, bool secure);
 
 /* Interface between CPU and Interrupt controller.  */
+#ifndef CONFIG_USER_ONLY
+bool armv7m_nvic_can_take_pending_exception(void *opaque);
+#else
+static inline bool armv7m_nvic_can_take_pending_exception(void *opaque)
+{
+    return true;
+}
+#endif
 void armv7m_nvic_set_pending(void *opaque, int irq);
 int armv7m_nvic_acknowledge_irq(void *opaque);
 void armv7m_nvic_complete_irq(void *opaque, int irq);
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index e319077..3d77cbf 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -268,6 +268,13 @@ static inline int nvic_exec_prio(NVICState *s)
     return MIN(running, s->exception_prio);
 }
 
+bool armv7m_nvic_can_take_pending_exception(void *opaque)
+{
+    NVICState *s = opaque;
+
+    return nvic_exec_prio(s) > nvic_pending_prio(s);
+}
+
 /* caller must call nvic_irq_update() after this */
 static void set_prio(NVICState *s, unsigned irq, uint8_t prio)
 {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e9f10f7..7713d88 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -338,13 +338,6 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     CPUARMState *env = &cpu->env;
     bool ret = false;
 
-
-    if (interrupt_request & CPU_INTERRUPT_FIQ
-        && !(env->daif & PSTATE_F)) {
-        cs->exception_index = EXCP_FIQ;
-        cc->do_interrupt(cs);
-        ret = true;
-    }
     /* ARMv7-M interrupt return works by loading a magic value
      * into the PC.  On real hardware the load causes the
      * return to occur.  The qemu implementation performs the
@@ -354,9 +347,16 @@ static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
      * the stack if an interrupt occurred at the wrong time.
      * We avoid this by disabling interrupts when
      * pc contains a magic address.
+     *
+     * ARMv7-M interrupt masking works differently than -A or -R.
+     * There is no FIQ/IRQ distinction. Instead of I and F bits
+     * masking FIQ and IRQ interrupts, an exception is taken only
+     * if it is higher priority than the current execution priority
+     * (which depends on state like BASEPRI, FAULTMASK and the
+     * currently active exception).
      */
     if (interrupt_request & CPU_INTERRUPT_HARD
-        && !(env->daif & PSTATE_I)
+        && (armv7m_nvic_can_take_pending_exception(env->nvic))
         && (env->regs[15] < 0xfffffff0)) {
         cs->exception_index = EXCP_IRQ;
         cc->do_interrupt(cs);
-- 
2.7.4

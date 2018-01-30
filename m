Received: by 10.28.71.27 with SMTP id u27csp1473628wma;
        Tue, 30 Jan 2018 07:02:49 -0800 (PST)
X-Google-Smtp-Source: AH8x224Bak0cnVqmLNjKTfgpMQCm5iFKblFlgKo9mOlkmArBcssIwLysnhwJydOo08lCP18hjiov
X-Received: by 10.37.131.130 with SMTP id t2mr20309513ybk.87.1517324569870;
        Tue, 30 Jan 2018 07:02:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517324569; cv=none;
        d=google.com; s=arc-20160816;
        b=rlCGRavmjS30RJLy5jQfEq/2JwftLiKqx+wER66qk0PDsuELDyc3oRY7o5iC8CBUXv
         MJc4so+9591jMWP3BZpadtHjn3ljqvKNj3Bd89dEnwXnwQepOt6mBijzD8GqvtL7WynV
         +EEy5IBz9MtMJJUtHs7eqltmONE3fyQGsXxXgZ6VVGI/bqeHxavi36ERjkrX0+JueUN2
         Cn1AchHUJ3ZXextB5kewjWsGui7Ug8jGBc7u3k52c99DMXvcJ/H+NS3B5YH+l5XxrHS3
         c0BGctcM43CaX/UuZWwqNipsAcxzHcnRQz+Ng3etut2QJfxk9Y0+TFyKbZ+XBUI/et3N
         Zalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=/lhdF6WTviHg3tSEwN6S/CfjROEOF8pZbwFYybMo9dE=;
        b=HPzRIlcDDovsJhk6yKPVTkA93IBWrjIZM9rntyGf3DqB6ayZU1/FJdWku9L22wJyeN
         3kfYlTKptRDzSY1zzEKOeYUBS69mpjC21xUsq8vLC/g3jiiUtFpE5WhakdMf2VwhG0YI
         AgJXVdT1bTrJMQo0iXDXwGaRdZBpqjYeqQRbYA/91S6v5CJNJ0nZDHYnuuF5GWlofbLq
         MDsdeRWHSLXMRgfYy7WYkWKNGMIZjEUftvEtnPIuPyZWMbt25uI8maBibpzgGTDX7oC5
         SS3hyD4aZNP0bx2PgnL/eAvkIB2wmo6K0LeDhcG2XH7F/XqvrvrR91WvYJ9fq27Ytewi
         5AwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d64si5487152ybi.596.2018.01.30.07.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Jan 2018 07:02:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1egXQv-0000CD-80
	for alex.bennee@linaro.org; Tue, 30 Jan 2018 10:02:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQa-00009A-L2
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1egXQZ-0005U7-4m
	for qemu-arm@nongnu.org; Tue, 30 Jan 2018 10:02:28 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1egXQY-0005SC-SW; Tue, 30 Jan 2018 10:02:27 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1egXQX-0005sa-57; Tue, 30 Jan 2018 15:02:25 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 30 Jan 2018 15:02:17 +0000
Message-Id: <1517324542-6607-3-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
References: <1517324542-6607-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/7] target/arm: Split "get pending exception
 info" from "acknowledge it"
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
X-TUID: 4qhBN9/kEL9g

Currently armv7m_nvic_acknowledge_irq() does three things:
 * make the current highest priority pending interrupt active
 * return a bool indicating whether that interrupt is targeting
   Secure or NonSecure state
 * implicitly tell the caller which is the highest priority
   pending interrupt by setting env->v7m.exception

We need to split these jobs, because v7m_exception_taken()
needs to know whether the pending interrupt targets Secure so
it can choose to stack callee-saves registers or not, but it
must not make the interrupt active until after it has done
that stacking, in case the stacking causes a derived exception.
Similarly, it needs to know the number of the pending interrupt
so it can read the correct vector table entry before the
interrupt is made active, because vector table reads might
also cause a derived exception.

Create a new armv7m_nvic_get_pending_irq_info() function which simply
returns information about the highest priority pending interrupt, and
use it to rearrange the v7m_exception_taken() code so we don't
acknowledge the exception until we've done all the things which could
possibly cause a derived exception.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 19 ++++++++++++++++---
 hw/intc/armv7m_nvic.c | 30 +++++++++++++++++++++++-------
 target/arm/helper.c   | 16 ++++++++++++----
 hw/intc/trace-events  |  3 ++-
 4 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 9ed03e6..f21f68e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1519,16 +1519,29 @@ void armv7m_nvic_set_pending(void *opaque, int irq, bool secure);
  */
 void armv7m_nvic_set_pending_derived(void *opaque, int irq, bool secure);
 /**
+ * armv7m_nvic_get_pending_irq_info: return highest priority pending
+ *    exception, and whether it targets Secure state
+ * @opaque: the NVIC
+ * @pirq: set to pending exception number
+ * @ptargets_secure: set to whether pending exception targets Secure
+ *
+ * This function writes the number of the highest priority pending
+ * exception (the one which would be made active by
+ * armv7m_nvic_acknowledge_irq()) to @pirq, and sets @ptargets_secure
+ * to true if the current highest priority pending exception should
+ * be taken to Secure state, false for NS.
+ */
+void armv7m_nvic_get_pending_irq_info(void *opaque, int *pirq,
+                                      bool *ptargets_secure);
+/**
  * armv7m_nvic_acknowledge_irq: make highest priority pending exception active
  * @opaque: the NVIC
  *
  * Move the current highest priority pending exception from the pending
  * state to the active state, and update v7m.exception to indicate that
  * it is the exception currently being handled.
- *
- * Returns: true if exception should be taken to Secure state, false for NS
  */
-bool armv7m_nvic_acknowledge_irq(void *opaque);
+void armv7m_nvic_acknowledge_irq(void *opaque);
 /**
  * armv7m_nvic_complete_irq: complete specified interrupt or exception
  * @opaque: the NVIC
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index b4a6e7c..360889d 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -650,24 +650,20 @@ void armv7m_nvic_set_pending_derived(void *opaque, int irq, bool secure)
 }
 
 /* Make pending IRQ active.  */
-bool armv7m_nvic_acknowledge_irq(void *opaque)
+void armv7m_nvic_acknowledge_irq(void *opaque)
 {
     NVICState *s = (NVICState *)opaque;
     CPUARMState *env = &s->cpu->env;
     const int pending = s->vectpending;
     const int running = nvic_exec_prio(s);
     VecInfo *vec;
-    bool targets_secure;
 
     assert(pending > ARMV7M_EXCP_RESET && pending < s->num_irq);
 
     if (s->vectpending_is_s_banked) {
         vec = &s->sec_vectors[pending];
-        targets_secure = true;
     } else {
         vec = &s->vectors[pending];
-        targets_secure = !exc_is_banked(s->vectpending) &&
-            exc_targets_secure(s, s->vectpending);
     }
 
     assert(vec->enabled);
@@ -675,7 +671,7 @@ bool armv7m_nvic_acknowledge_irq(void *opaque)
 
     assert(s->vectpending_prio < running);
 
-    trace_nvic_acknowledge_irq(pending, s->vectpending_prio, targets_secure);
+    trace_nvic_acknowledge_irq(pending, s->vectpending_prio);
 
     vec->active = 1;
     vec->pending = 0;
@@ -683,8 +679,28 @@ bool armv7m_nvic_acknowledge_irq(void *opaque)
     write_v7m_exception(env, s->vectpending);
 
     nvic_irq_update(s);
+}
+
+void armv7m_nvic_get_pending_irq_info(void *opaque,
+                                      int *pirq, bool *ptargets_secure)
+{
+    NVICState *s = (NVICState *)opaque;
+    const int pending = s->vectpending;
+    bool targets_secure;
+
+    assert(pending > ARMV7M_EXCP_RESET && pending < s->num_irq);
+
+    if (s->vectpending_is_s_banked) {
+        targets_secure = true;
+    } else {
+        targets_secure = !exc_is_banked(pending) &&
+            exc_targets_secure(s, pending);
+    }
+
+    trace_nvic_get_pending_irq_info(pending, targets_secure);
 
-    return targets_secure;
+    *ptargets_secure = targets_secure;
+    *pirq = pending;
 }
 
 int armv7m_nvic_complete_irq(void *opaque, int irq, bool secure)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index bfce096..6062f38 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6395,12 +6395,12 @@ static uint32_t *get_v7m_sp_ptr(CPUARMState *env, bool secure, bool threadmode,
     }
 }
 
-static uint32_t arm_v7m_load_vector(ARMCPU *cpu, bool targets_secure)
+static uint32_t arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure)
 {
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult result;
-    hwaddr vec = env->v7m.vecbase[targets_secure] + env->v7m.exception * 4;
+    hwaddr vec = env->v7m.vecbase[targets_secure] + exc * 4;
     uint32_t addr;
 
     addr = address_space_ldl(cs->as, vec,
@@ -6462,8 +6462,9 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain)
     CPUARMState *env = &cpu->env;
     uint32_t addr;
     bool targets_secure;
+    int exc;
 
-    targets_secure = armv7m_nvic_acknowledge_irq(env->nvic);
+    armv7m_nvic_get_pending_irq_info(env->nvic, &exc, &targets_secure);
 
     if (arm_feature(env, ARM_FEATURE_V8)) {
         if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
@@ -6531,6 +6532,14 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain)
         }
     }
 
+    addr = arm_v7m_load_vector(cpu, exc, targets_secure);
+
+    /* Now we've done everything that might cause a derived exception
+     * we can go ahead and activate whichever exception we're going to
+     * take (which might now be the derived exception).
+     */
+    armv7m_nvic_acknowledge_irq(env->nvic);
+
     /* Switch to target security state -- must do this before writing SPSEL */
     switch_v7m_security_state(env, targets_secure);
     write_v7m_control_spsel(env, 0);
@@ -6538,7 +6547,6 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain)
     /* Clear IT bits */
     env->condexec_bits = 0;
     env->regs[14] = lr;
-    addr = arm_v7m_load_vector(cpu, targets_secure);
     env->regs[15] = addr & 0xfffffffe;
     env->thumb = addr & 1;
 }
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 09e87d1..4092d28 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -180,7 +180,8 @@ nvic_escalate_disabled(int irq) "NVIC escalating irq %d to HardFault: disabled"
 nvic_set_pending(int irq, bool secure, bool derived, int en, int prio) "NVIC set pending irq %d secure-bank %d derived %d (enabled: %d priority %d)"
 nvic_clear_pending(int irq, bool secure, int en, int prio) "NVIC clear pending irq %d secure-bank %d (enabled: %d priority %d)"
 nvic_set_pending_level(int irq) "NVIC set pending: irq %d higher prio than vectpending: setting irq line to 1"
-nvic_acknowledge_irq(int irq, int prio, bool targets_secure) "NVIC acknowledge IRQ: %d now active (prio %d targets_secure %d)"
+nvic_acknowledge_irq(int irq, int prio) "NVIC acknowledge IRQ: %d now active (prio %d)"
+nvic_get_pending_irq_info(int irq, bool secure) "NVIC next IRQ %d: targets_secure: %d"
 nvic_complete_irq(int irq, bool secure) "NVIC complete IRQ %d (secure %d)"
 nvic_set_irq_level(int irq, int level) "NVIC external irq %d level set to %d"
 nvic_sysreg_read(uint64_t addr, uint32_t value, unsigned size) "NVIC sysreg read addr 0x%" PRIx64 " data 0x%" PRIx32 " size %u"
-- 
2.7.4


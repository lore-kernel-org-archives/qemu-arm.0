Received: by 10.182.158.201 with SMTP id ww9csp3414846obb;
        Wed, 2 Dec 2015 16:25:59 -0800 (PST)
X-Received: by 10.55.54.139 with SMTP id d133mr7697824qka.6.1449102359776;
        Wed, 02 Dec 2015 16:25:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n10si4081197qhb.84.2015.12.02.16.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:25:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hih-0008Bh-AS
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:25:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc6-0004IL-A2
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc2-0001yq-AL
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:10 -0500
Received: from mail-qg0-x22f.google.com ([2607:f8b0:400d:c04::22f]:36245)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc1-0001yZ-SJ; Wed, 02 Dec 2015 19:19:05 -0500
Received: by qgcc31 with SMTP id c31so48113964qgc.3;
	Wed, 02 Dec 2015 16:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jCZKFp8s8WHKtEGFvY9tD5kRPYE38fLWucTnBgZgA/k=;
	b=HmUfp6YD7J2b+pjzlcSvG5Fb2eBqT4SA3AxxkBhd/WuZm3v9/UAF6CDks3uBcme6vD
	2TqyBPp2xC0KTbE5Q+nyOXULSvaBGGsgQsVhRvhYVnaDIXEVmBJDVy7G+0vPxqR5L8Cm
	/q0SxwCMm3srcK/NEurTtcGrzZwHW/etQ3pJL2npPgrsjpVmy8CHeSgpe3Mgy14a9UQW
	dDldTNWO/kylzZIzXia4F9Ku/blmFx/wybDtso9Cvb9GkIZxbedrrAmOseCeMRfaWUKI
	V/lrzjpKhwrhjdLgFmpjQU+kyzJuUE0HBaWw7LThCc88QXcz2mL49hpFDR1mX8QtfUoq
	Ir1A==
X-Received: by 10.140.254.69 with SMTP id z66mr8188098qhc.5.1449101945510;
	Wed, 02 Dec 2015 16:19:05 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:05 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:35 -0500
Message-Id: <1449101933-24928-9-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::22f
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 08/26] armv7m: rewrite NVIC
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
X-TUID: Fy5ii69M+fBq

Expand the NVIC to fully support -M priorities and masking.
Doesn't use GIC code.

Use PRIGROUP to configure group/sub-group split.
Track group and sub-group in separate fields for quick comparison.
Mix in vector # with sub-group as per tie breaking rules.

NVIC now derives directly from SysBusDevice, and
struct NVICClass is eliminated.

Also add DPRINTF() macro.

Internal functions for operations previously done
by GIC internals.

nvic_irq_update() recalculates highest pending exception.
Update ARMCPU state.

armv7m_nvic_set_pending() include exception escalation logic.

Replace use of GIC state/functions with new NVIC.

Fix RETTOBASE.  The polarity is reversed, and it should include
internal exceptions.  Should be set when # of active exceptions == 1.
---
 hw/intc/armv7m_nvic.c | 805 ++++++++++++++++++++++++++++++++++++++------------
 target-arm/cpu.h      |   4 +-
 2 files changed, 622 insertions(+), 187 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 0145ca7..ca9bd4c 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -13,11 +13,48 @@
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/arm/arm.h"
+#include "target-arm/cpu.h"
 #include "exec/address-spaces.h"
-#include "gic_internal.h"
 
-typedef struct {
-    GICState gic;
+/*#define DEBUG_NVIC 0
+ */
+#ifdef DEBUG_NVIC
+#define DPRINTF(LVL, fmt, ...) \
+do { if ((LVL) <= DEBUG_NVIC) { \
+    fprintf(stderr, "armv7m_nvic: " fmt , ## __VA_ARGS__); \
+} } while (0)
+#else
+#define DPRINTF(LVL, fmt, ...) do {} while (0)
+#endif
+
+/* the number of IRQ lines in addition to the 16 internal
+ * exception vectors.
+ */
+#define NVIC_MAX_IRQ 496
+
+#define NVIC_MAX_VECTORS 512
+
+struct VecInfo {
+    uint16_t prio_sub; /* sub-group priority*512 + exception# */
+    int8_t prio_group; /* group priority [-2, 0x7f] */
+    uint8_t raw_prio; /* value writen by guest */
+    uint8_t enabled;
+    uint8_t pending;
+    uint8_t active;
+    uint8_t level;
+    /* exceptions <=15 never set level */
+};
+typedef struct VecInfo VecInfo;
+
+struct NVICState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    ARMCPU *cpu; /* NVIC is so closely tied to the CPU, just keep a ref */
+
+    VecInfo vectors[NVIC_MAX_VECTORS];
+
     uint8_t prigroup;
 
     struct {
@@ -26,34 +63,19 @@ typedef struct {
         int64_t tick;
         QEMUTimer *timer;
     } systick;
-    MemoryRegion sysregmem;
-    MemoryRegion gic_iomem_alias;
-    MemoryRegion container;
+
+    MemoryRegion iomem; /* system control space and NVIC */
+
     uint32_t num_irq;
+    qemu_irq excpout;
     qemu_irq sysresetreq;
-} nvic_state;
+};
+typedef struct NVICState NVICState;
 
 #define TYPE_NVIC "armv7m_nvic"
-/**
- * NVICClass:
- * @parent_reset: the parent class' reset handler.
- *
- * A model of the v7M NVIC and System Controller
- */
-typedef struct NVICClass {
-    /*< private >*/
-    ARMGICClass parent_class;
-    /*< public >*/
-    DeviceRealize parent_realize;
-    void (*parent_reset)(DeviceState *dev);
-} NVICClass;
-
-#define NVIC_CLASS(klass) \
-    OBJECT_CLASS_CHECK(NVICClass, (klass), TYPE_NVIC)
-#define NVIC_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(NVICClass, (obj), TYPE_NVIC)
+
 #define NVIC(obj) \
-    OBJECT_CHECK(nvic_state, (obj), TYPE_NVIC)
+    OBJECT_CHECK(NVICState, (obj), TYPE_NVIC)
 
 static const uint8_t nvic_id[] = {
     0x00, 0xb0, 0x1b, 0x00, 0x0d, 0xe0, 0x05, 0xb1
@@ -70,7 +92,7 @@ static const uint8_t nvic_id[] = {
 int system_clock_scale;
 
 /* Conversion factor from qemu timer to SysTick frequencies.  */
-static inline int64_t systick_scale(nvic_state *s)
+static inline int64_t systick_scale(NVICState *s)
 {
     if (s->systick.control & SYSTICK_CLKSOURCE)
         return system_clock_scale;
@@ -78,7 +100,7 @@ static inline int64_t systick_scale(nvic_state *s)
         return 1000;
 }
 
-static void systick_reload(nvic_state *s, int reset)
+static void systick_reload(NVICState *s, int reset)
 {
     /* The Cortex-M3 Devices Generic User Guide says that "When the
      * ENABLE bit is set to 1, the counter loads the RELOAD value from the
@@ -97,7 +119,7 @@ static void systick_reload(nvic_state *s, int reset)
 
 static void systick_timer_tick(void * opaque)
 {
-    nvic_state *s = (nvic_state *)opaque;
+    NVICState *s = (NVICState *)opaque;
     s->systick.control |= SYSTICK_COUNTFLAG;
     if (s->systick.control & SYSTICK_TICKINT) {
         /* Trigger the interrupt.  */
@@ -110,7 +132,7 @@ static void systick_timer_tick(void * opaque)
     }
 }
 
-static void systick_reset(nvic_state *s)
+static void systick_reset(NVICState *s)
 {
     s->systick.control = 0;
     s->systick.reload = 0;
@@ -118,13 +140,120 @@ static void systick_reset(nvic_state *s)
     timer_del(s->systick.timer);
 }
 
+/* caller must call nvic_irq_update() after this */
+static
+void set_prio(NVICState *s, unsigned irq, uint8_t prio)
+{
+    unsigned submask = (1<<(s->prigroup+1))-1;
+
+    assert(irq > 3); /* only use for configurable prios */
+    assert(irq < NVIC_MAX_VECTORS);
+
+    s->vectors[irq].raw_prio = prio;
+    s->vectors[irq].prio_group = (prio>>(s->prigroup+1));
+    s->vectors[irq].prio_sub = irq + (prio & submask) * NVIC_MAX_VECTORS;
+
+    DPRINTF(0, "Set %u priority grp %d sub %u (prigroup = %u)\n", irq,
+            s->vectors[irq].prio_group, s->vectors[irq].prio_sub,
+            (unsigned)s->prigroup);
+}
+
+/* recompute highest pending */
+static
+void nvic_irq_update(NVICState *s)
+{
+    unsigned i;
+    int lvl;
+    CPUARMState *env = &s->cpu->env;
+    int16_t pend_group = 0x100;
+    uint16_t pend_sub = 0, pend_irq = 0;
+
+    /* find highest priority */
+    for (i = 1; i < s->num_irq; i++) {
+        VecInfo *vec = &s->vectors[i];
+
+        DPRINTF(2, " VECT %d %d:%u\n", i, vec->prio_group, vec->prio_sub);
+
+        if (vec->enabled && vec->pending && ((vec->prio_group < pend_group)
+                || (vec->prio_group == pend_group
+                    && vec->prio_sub < pend_sub)))
+        {
+            pend_group = vec->prio_group;
+            pend_sub = vec->prio_sub;
+            pend_irq = i;
+        }
+    }
+
+    env->v7m.pending = pend_irq;
+    env->v7m.pending_prio = pend_group;
+
+    /* Raise NVIC output even if pend_group is masked.
+     * This is necessary as we get no notification
+     * when PRIMASK et al. are changed.
+     * As long as our output is high cpu_exec() will call
+     * into arm_v7m_cpu_exec_interrupt() frequently, which
+     * then tests to see if the pending exception
+     * is permitted.
+     */
+    lvl = pend_irq > 0;
+    DPRINTF(0, "IRQ %c highest pending %d %d:%u\n",
+            lvl ? 'X' : '_',
+            pend_irq, pend_group, pend_sub);
+
+    qemu_set_irq(s->excpout, lvl);
+}
+
+static
+void armv7m_nvic_clear_pending(void *opaque, int irq)
+{
+    NVICState *s = (NVICState *)opaque;
+    VecInfo *vec;
+
+    assert(irq >= 0);
+    assert(irq < NVIC_MAX_VECTORS);
+
+    vec = &s->vectors[irq];
+    if (vec->pending) {
+        vec->pending = 0;
+        nvic_irq_update(s);
+    }
+}
+
+int armv7m_nvic_get_active_prio(void *opaque)
+{
+    NVICState *s = (NVICState *)opaque;
+    unsigned i;
+    int16_t group = 0x100;
+    uint16_t sub = 0xff;
+
+    /* don't consider env->v7m.exception
+     * as we are called while it is inconsistent
+     */
+
+    for (i = 1; i < s->num_irq; i++) {
+        VecInfo *vec = &s->vectors[i];
+        if (!vec->active) {
+            continue;
+        }
+        if (vec->prio_group < group ||
+                (vec->prio_group == group &&
+                 vec->prio_sub < sub))
+        {
+            group = vec->prio_group;
+            sub = vec->prio_sub;
+        }
+    }
+
+    return group;
+}
+
 /* @returns the active (running) exception priority.
  *    only a higher (numerically lower) priority can preempt.
  */
 int armv7m_excp_running_prio(ARMCPU *cpu)
 {
     CPUARMState *env = &cpu->env;
-    nvic_state *s = env->nvic;
+    NVICState *s = env->nvic;
     int running;
 
     if (env->daif & PSTATE_F) { /* FAULTMASK */
@@ -141,47 +270,191 @@ int armv7m_excp_running_prio(ARMCPU *cpu)
     return MIN(running, env->v7m.exception_prio);
 }
 
-/* The external routines use the hardware vector numbering, ie. the first
-   IRQ is #16.  The internal GIC routines use #32 as the first IRQ.  */
 void armv7m_nvic_set_pending(void *opaque, int irq)
 {
-    nvic_state *s = (nvic_state *)opaque;
-    if (irq >= 16)
-        irq += 16;
-    gic_set_pending_private(&s->gic, 0, irq);
+    NVICState *s = (NVICState *)opaque;
+    CPUARMState *env = &s->cpu->env;
+    VecInfo *vec;
+    int active = s->cpu->env.v7m.exception;
+
+    assert(irq > 1); /* don't pend reset */
+    assert(irq < s->num_irq);
+
+    vec = &s->vectors[irq];
+
+    if (irq < ARMV7M_EXCP_PENDSV
+            && irq != ARMV7M_EXCP_DEBUG
+            && irq != ARMV7M_EXCP_NMI)
+    {
+        int running = armv7m_excp_running_prio(s->cpu);
+        /* test for exception escalation for vectors other than:
+         * NMI (2), Debug (12), PendSV (14), SysTick (15),
+         * and all external IRQs (>=16).
+         * This assumes that all such exceptions are precise (sync.)
+         * and that we don't simulate imprecise (async.) faults.
+         * Some Debug exceptions should be escalated, however
+         * this exception is presently unused.
+         */
+        unsigned escalate = 0;
+        if (vec->prio_group >= running) {
+            /* Trying to pend a fault which is not immediately
+             * runnable due to masking by PRIMASK, FAULTMASK, BASEPRI,
+             * or the priority of an active exception
+             */
+            DPRINTF(0, " Escalate, insufficient priority %d >= %d\n",
+                    vec->prio_group, running);
+            escalate = 1;
+
+        } else if (!vec->enabled) {
+            /* trying to pend a disabled fault
+             * eg. UsageFault while USGFAULTENA in SHCSR is clear.
+             */
+            escalate = 1;
+            DPRINTF(0, " Escalate, not enabled\n");
+
+        } else if (vec->active) {
+            /* This case should only be reached if some logic error
+             * has caused env->exception_prio to get out of sync with
+             * the active exception priorities.
+             */
+            hw_error("exception priorities are out of sync\n");
+        }
+
+        if (escalate) {
+#ifdef DEBUG_NVIC
+            int oldirq = irq;
+#endif
+            if (running < 0) {
+                /* TODO: actual unrecoverable exception actions */
+                cpu_abort(&s->cpu->parent_obj,
+                          "%d in %d escalates to unrecoverable exception\n",
+                          irq, active);
+            }
+            irq = ARMV7M_EXCP_HARD;
+            vec = &s->vectors[irq];
+
+            DPRINTF(0, "Escalate %d to HardFault\n", oldirq);
+        }
+    }
+
+    vec->pending = 1;
+    if (vec->enabled && (vec->prio_group < env->v7m.pending_prio)) {
+        env->v7m.pending_prio = vec->prio_group;
+        env->v7m.pending = irq;
+        qemu_set_irq(s->excpout, irq > 0);
+    }
+    DPRINTF(0, "Pending %d at %d%s running %d\n",
+            irq, vec->prio_group,
+            env->v7m.pending == irq ? " (highest)" : "",
+            armv7m_excp_running_prio(s->cpu));
+}
+
+bool armv7m_nvic_is_active(void *opaque, int irq)
+{
+    NVICState *s = (NVICState *)opaque;
+
+    assert(irq > 0 && irq < s->num_irq);
+    return s->vectors[irq].active;
 }
 
 /* Make pending IRQ active.  */
-int armv7m_nvic_acknowledge_irq(void *opaque)
+void armv7m_nvic_acknowledge_irq(void *opaque)
 {
-    nvic_state *s = (nvic_state *)opaque;
-    uint32_t irq;
+    NVICState *s = (NVICState *)opaque;
+    CPUARMState *env = &s->cpu->env;
+    const int pending = env->v7m.pending;
+    const int running = armv7m_excp_running_prio(s->cpu);
+    VecInfo *vec;
 
-    irq = gic_acknowledge_irq(&s->gic, 0, MEMTXATTRS_UNSPECIFIED);
-    if (irq == 1023)
+    if (!pending) {
         hw_error("Interrupt but no vector\n");
-    if (irq >= 32)
-        irq -= 16;
-    return irq;
+    }
+
+    assert(pending < s->num_irq);
+    vec = &s->vectors[pending];
+
+    assert(vec->enabled);
+
+    assert(env->v7m.pending_prio == vec->prio_group);
+    if (env->v7m.pending_prio >= running) {
+        hw_error("Interrupt ack. while masked %d >= %d",
+                 env->v7m.pending_prio, running);
+    }
+
+    DPRINTF(0, "ACT %d at %d\n", pending, vec->prio_group);
+
+    assert(vec->pending);
+    vec->active = 1;
+    vec->pending = 0;
+
+    env->v7m.exception = env->v7m.pending;
+    env->v7m.exception_prio = env->v7m.pending_prio;
+
+    nvic_irq_update(s); /* recalc pending */
+
+    assert(env->v7m.exception > 0); /* spurious exception? */
 }
 
 void armv7m_nvic_complete_irq(void *opaque, int irq)
 {
-    nvic_state *s = (nvic_state *)opaque;
-    if (irq >= 16)
-        irq += 16;
-    gic_complete_irq(&s->gic, 0, irq, MEMTXATTRS_UNSPECIFIED);
+    NVICState *s = (NVICState *)opaque;
+    VecInfo *vec;
+
+    assert(irq > 0);
+    assert(irq < NVIC_MAX_VECTORS);
+
+    vec = &s->vectors[irq];
+
+    vec->active = 0;
+    vec->pending = vec->level;
+    assert(!vec->level || irq >= 16);
+
+    nvic_irq_update(s);
+    DPRINTF(0, "EOI %d\n", irq);
+}
+
+/* Only called for external interrupt (vector>=16) */
+static
+void set_irq_level(void *opaque, int n, int level)
+{
+    NVICState *s = opaque;
+    VecInfo *vec;
+
+    assert(n >= 0);
+    assert(n < NVIC_MAX_IRQ);
+
+    n += 16;
+
+    if (n >= s->num_irq) {
+        return;
+    }
+
+    /* The pending status of an external interrupt is
+     * latched on rising edge and exception handler return.
+     *
+     * Pulsing the IRQ will always run the handler
+     * once, and the handler will re-run until the
+     * level is low when the handler completes.
+     */
+    vec = &s->vectors[n];
+    vec->level = level;
+    if (level) {
+        DPRINTF(1, "assert IRQ %d\n", n-16);
+        armv7m_nvic_set_pending(s, n-16);
+    } else {
+        DPRINTF(2, "deassert IRQ %d\n", n-16);
+    }
 }
 
-static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
+static uint32_t nvic_readl(NVICState *s, uint32_t offset)
 {
-    ARMCPU *cpu;
+    ARMCPU *cpu = s->cpu;
     uint32_t val;
     int irq;
 
     switch (offset) {
     case 4: /* Interrupt Control Type.  */
-        return (s->num_irq / 32) - 1;
+        return ((s->num_irq - 16) / 32) - 1;
     case 0x10: /* SysTick Control and Status.  */
         val = s->systick.control;
         s->systick.control &= ~SYSTICK_COUNTFLAG;
@@ -207,45 +480,50 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
     case 0x1c: /* SysTick Calibration Value.  */
         return 10000;
     case 0xd00: /* CPUID Base.  */
-        cpu = ARM_CPU(current_cpu);
         return cpu->midr;
     case 0xd04: /* Interrupt Control State.  */
         /* VECTACTIVE */
-        cpu = ARM_CPU(current_cpu);
         val = cpu->env.v7m.exception;
-        if (val == 1023) {
-            val = 0;
-        } else if (val >= 32) {
-            val -= 16;
-        }
         /* VECTPENDING */
-        if (s->gic.current_pending[0] != 1023)
-            val |= (s->gic.current_pending[0] << 12);
-        /* ISRPENDING and RETTOBASE */
-        for (irq = 32; irq < s->num_irq; irq++) {
-            if (s->gic.irq_state[irq].pending) {
+        val |= (cpu->env.v7m.pending & 0xff) << 12;
+        /* ISRPENDING - Set it any externel IRQ pending (vector>=16) */
+        for (irq = 16; irq < s->num_irq; irq++) {
+            if (s->vectors[irq].pending) {
                 val |= (1 << 22);
                 break;
             }
-            if (irq != cpu->env.v7m.exception && s->gic.irq_state[irq].active) {
-                val |= (1 << 11);
+        }
+        /* RETTOBASE - Set if only one handler is active */
+    {
+        unsigned nhand = 0;
+        for (irq = 1; irq < s->num_irq; irq++) {
+            if (s->vectors[irq].active) {
+                nhand++;
+                if (nhand == 2) {
+                    break;
+                }
             }
         }
+        val |= nhand == 1 ? (1<<11) : 0;
+    }
         /* PENDSTSET */
-        if (s->gic.irq_state[ARMV7M_EXCP_SYSTICK].pending)
+        if (s->vectors[ARMV7M_EXCP_SYSTICK].pending) {
             val |= (1 << 26);
+        }
         /* PENDSVSET */
-        if (s->gic.irq_state[ARMV7M_EXCP_PENDSV].pending)
+        if (s->vectors[ARMV7M_EXCP_PENDSV].pending) {
             val |= (1 << 28);
+        }
         /* NMIPENDSET */
-        if (s->gic.irq_state[ARMV7M_EXCP_NMI].pending)
+        if (s->vectors[ARMV7M_EXCP_NMI].pending) {
             val |= (1 << 31);
+        }
+        /* ISRPREEMPT not implemented */
         return val;
     case 0xd08: /* Vector Table Offset.  */
-        cpu = ARM_CPU(current_cpu);
         return cpu->env.v7m.vecbase;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
-        return 0xfa050000;
+        return 0xfa050000 | (s->prigroup<<8);
     case 0xd10: /* System Control.  */
         /* TODO: Implement SLEEPONEXIT.  */
         return 0;
@@ -254,20 +532,20 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
         return 0;
     case 0xd24: /* System Handler Status.  */
         val = 0;
-        if (s->gic.irq_state[ARMV7M_EXCP_MEM].active) val |= (1 << 0);
-        if (s->gic.irq_state[ARMV7M_EXCP_BUS].active) val |= (1 << 1);
-        if (s->gic.irq_state[ARMV7M_EXCP_USAGE].active) val |= (1 << 3);
-        if (s->gic.irq_state[ARMV7M_EXCP_SVC].active) val |= (1 << 7);
-        if (s->gic.irq_state[ARMV7M_EXCP_DEBUG].active) val |= (1 << 8);
-        if (s->gic.irq_state[ARMV7M_EXCP_PENDSV].active) val |= (1 << 10);
-        if (s->gic.irq_state[ARMV7M_EXCP_SYSTICK].active) val |= (1 << 11);
-        if (s->gic.irq_state[ARMV7M_EXCP_USAGE].pending) val |= (1 << 12);
-        if (s->gic.irq_state[ARMV7M_EXCP_MEM].pending) val |= (1 << 13);
-        if (s->gic.irq_state[ARMV7M_EXCP_BUS].pending) val |= (1 << 14);
-        if (s->gic.irq_state[ARMV7M_EXCP_SVC].pending) val |= (1 << 15);
-        if (s->gic.irq_state[ARMV7M_EXCP_MEM].enabled) val |= (1 << 16);
-        if (s->gic.irq_state[ARMV7M_EXCP_BUS].enabled) val |= (1 << 17);
-        if (s->gic.irq_state[ARMV7M_EXCP_USAGE].enabled) val |= (1 << 18);
+        if (s->vectors[ARMV7M_EXCP_MEM].active) val |= (1 << 0);
+        if (s->vectors[ARMV7M_EXCP_BUS].active) val |= (1 << 1);
+        if (s->vectors[ARMV7M_EXCP_USAGE].active) val |= (1 << 3);
+        if (s->vectors[ARMV7M_EXCP_SVC].active) val |= (1 << 7);
+        if (s->vectors[ARMV7M_EXCP_DEBUG].active) val |= (1 << 8);
+        if (s->vectors[ARMV7M_EXCP_PENDSV].active) val |= (1 << 10);
+        if (s->vectors[ARMV7M_EXCP_SYSTICK].active) val |= (1 << 11);
+        if (s->vectors[ARMV7M_EXCP_USAGE].pending) val |= (1 << 12);
+        if (s->vectors[ARMV7M_EXCP_MEM].pending) val |= (1 << 13);
+        if (s->vectors[ARMV7M_EXCP_BUS].pending) val |= (1 << 14);
+        if (s->vectors[ARMV7M_EXCP_SVC].pending) val |= (1 << 15);
+        if (s->vectors[ARMV7M_EXCP_MEM].enabled) val |= (1 << 16);
+        if (s->vectors[ARMV7M_EXCP_BUS].enabled) val |= (1 << 17);
+        if (s->vectors[ARMV7M_EXCP_USAGE].enabled) val |= (1 << 18);
         return val;
     case 0xd28: /* Configurable Fault Status.  */
         /* TODO: Implement Fault Status.  */
@@ -314,9 +592,9 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
     }
 }
 
-static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
+static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
 {
-    ARMCPU *cpu;
+    ARMCPU *cpu = s->cpu;
     uint32_t oldval;
     switch (offset) {
     case 0x10: /* SysTick Control and Status.  */
@@ -358,18 +636,15 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
         if (value & (1 << 28)) {
             armv7m_nvic_set_pending(s, ARMV7M_EXCP_PENDSV);
         } else if (value & (1 << 27)) {
-            s->gic.irq_state[ARMV7M_EXCP_PENDSV].pending = 0;
-            gic_update(&s->gic);
+            armv7m_nvic_clear_pending(s, ARMV7M_EXCP_PENDSV);
         }
         if (value & (1 << 26)) {
             armv7m_nvic_set_pending(s, ARMV7M_EXCP_SYSTICK);
         } else if (value & (1 << 25)) {
-            s->gic.irq_state[ARMV7M_EXCP_SYSTICK].pending = 0;
-            gic_update(&s->gic);
+            armv7m_nvic_clear_pending(s, ARMV7M_EXCP_SYSTICK);
         }
         break;
     case 0xd08: /* Vector Table Offset.  */
-        cpu = ARM_CPU(current_cpu);
         cpu->env.v7m.vecbase = value & 0xffffff80;
         break;
     case 0xd0c: /* Application Interrupt/Reset Control.  */
@@ -378,13 +653,24 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
                 qemu_irq_pulse(s->sysresetreq);
             }
             if (value & 2) {
-                qemu_log_mask(LOG_UNIMP, "VECTCLRACTIVE unimplemented\n");
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Setting VECTCLRACTIVE when not in DEBUG mode "
+                              "is UNPREDICTABLE\n");
             }
             if (value & 1) {
-                qemu_log_mask(LOG_UNIMP, "AIRCR system reset unimplemented\n");
+                qemu_log_mask(LOG_GUEST_ERROR,
+                              "Setting VECTRESET when not in DEBUG mode "
+                              "is UNPREDICTABLE\n");
             }
             if (value & 0x700) {
-                qemu_log_mask(LOG_UNIMP, "PRIGROUP unimplemented\n");
+                unsigned i;
+                s->prigroup = (value>>8) & 0xf;
+                /* recalculate priorities for exceptions w/ configurable prio */
+                for (i = 4; i < s->num_irq; i++) {
+                    set_prio(s, i, s->vectors[i].raw_prio);
+                }
+                nvic_irq_update(s);
+                cpu->env.v7m.exception_prio = armv7m_nvic_get_active_prio(s);
             }
         }
         break;
@@ -396,9 +682,12 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
     case 0xd24: /* System Handler Control.  */
         /* TODO: Real hardware allows you to set/clear the active bits
            under some circumstances.  We don't implement this.  */
-        s->gic.irq_state[ARMV7M_EXCP_MEM].enabled = (value & (1 << 16)) != 0;
-        s->gic.irq_state[ARMV7M_EXCP_BUS].enabled = (value & (1 << 17)) != 0;
-        s->gic.irq_state[ARMV7M_EXCP_USAGE].enabled = (value & (1 << 18)) != 0;
+        s->vectors[ARMV7M_EXCP_MEM].enabled = (value & (1 << 16)) != 0;
+        s->vectors[ARMV7M_EXCP_BUS].enabled = (value & (1 << 17)) != 0;
+        s->vectors[ARMV7M_EXCP_USAGE].enabled = (value & (1 << 18)) != 0;
+        /* no need to call nvic_irq_update() since any pending while
+         * disabled would have been escalated to HardFault
+         */
         break;
     case 0xd28: /* Configurable Fault Status.  */
     case 0xd2c: /* Hard Fault Status.  */
@@ -410,8 +699,8 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
                       "NVIC: fault status registers unimplemented\n");
         break;
     case 0xf00: /* Software Triggered Interrupt Register */
-        if ((value & 0x1ff) < s->num_irq) {
-            gic_set_pending_private(&s->gic, 0, value & 0x1ff);
+        if ((value & 0x1ff) < NVIC_MAX_IRQ) {
+            armv7m_nvic_set_pending(s, (value&0x1ff)+16);
         }
         break;
     default:
@@ -423,54 +712,159 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
 static uint64_t nvic_sysreg_read(void *opaque, hwaddr addr,
                                  unsigned size)
 {
-    nvic_state *s = (nvic_state *)opaque;
+    NVICState *s = (NVICState *)opaque;
     uint32_t offset = addr;
-    int i;
+    unsigned i, end;
     uint32_t val;
 
     switch (offset) {
+    /* reads of set and clear both return the status */
+    case 0x100 ... 0x13c: /* NVIC Set enable */
+        offset += 0x80;
+        /* fall through */
+    case 0x180 ... 0x1bc: /* NVIC Clear enable */
+        val = 0;
+        offset = offset-0x180+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (s->vectors[offset+i].enabled) {
+                val |= (1<<i);
+            }
+        }
+        break;
+    case 0x200 ... 0x23c: /* NVIC Set pend */
+        offset += 0x80;
+        /* fall through */
+    case 0x280 ... 0x2bc: /* NVIC Clear pend */
+        val = 0;
+        offset = offset-0x280+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (s->vectors[offset+i].pending) {
+                val |= (1<<i);
+            }
+        }
+        break;
+    case 0x300 ... 0x37c: /* NVIC Active */
+        val = 0;
+        offset = offset-0x300+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (s->vectors[offset+i].active) {
+                val |= (1<<i);
+            }
+        }
+        break;
+    case 0x400 ... 0x7ec: /* NVIC Priority */
+        val = 0;
+        offset = offset-0x400+16; /* vector # */
+
+        for (i = 0; i < size && offset+i < s->num_irq; i++) {
+            val |= s->vectors[offset+i].raw_prio<<(8*i);
+        }
+        break;
     case 0xd18 ... 0xd23: /* System Handler Priority.  */
         val = 0;
         for (i = 0; i < size; i++) {
-            val |= s->gic.priority1[(offset - 0xd14) + i][0] << (i * 8);
+            val |= s->vectors[(offset - 0xd14) + i].raw_prio << (i * 8);
         }
-        return val;
+        break;
     case 0xfe0 ... 0xfff: /* ID.  */
         if (offset & 3) {
             return 0;
         }
-        return nvic_id[(offset - 0xfe0) >> 2];
-    }
-    if (size == 4) {
-        return nvic_readl(s, offset);
+        val = nvic_id[(offset - 0xfe0) >> 2];
+        break;
+    default:
+        if (size == 4) {
+            val = nvic_readl(s, offset);
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "NVIC: Bad read of size %d at offset 0x%x\n",
+                          size, offset);
+            val = 0;
+        }
     }
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "NVIC: Bad read of size %d at offset 0x%x\n", size, offset);
-    return 0;
+
+    DPRINTF(0, "sysreg read%u "TARGET_FMT_plx" -> %08x\n",
+            size*8, addr, (unsigned)val);
+    return val;
 }
 
 static void nvic_sysreg_write(void *opaque, hwaddr addr,
                               uint64_t value, unsigned size)
 {
-    nvic_state *s = (nvic_state *)opaque;
+    NVICState *s = (NVICState *)opaque;
     uint32_t offset = addr;
-    int i;
+    unsigned i, end;
+    unsigned setval = 0;
+
+    DPRINTF(0, "sysreg write%u "TARGET_FMT_plx" <- %08x\n",
+            size*8, addr, (unsigned)value);
 
     switch (offset) {
-    case 0xd18 ... 0xd23: /* System Handler Priority.  */
+    case 0x100 ... 0x13c: /* NVIC Set enable */
+        offset += 0x80;
+        setval = 1;
+        /* fall through */
+    case 0x180 ... 0x1bc: /* NVIC Clear enable */
+        offset = offset-0x180+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (value&(1<<i)) {
+                s->vectors[offset+i].enabled = setval;
+            }
+        }
+        nvic_irq_update(s);
+        return;
+    case 0x200 ... 0x23c: /* NVIC Set pend */
+        /* the special logic in armv7m_nvic_set_pending()
+         * is not needed since IRQs are never escalated
+         */
+        offset += 0x80;
+        setval = 1;
+        /* fall through */
+    case 0x280 ... 0x2bc: /* NVIC Clear pend */
+        offset = offset-0x280+16; /* vector # */
+
+        for (i = 0, end = size*8; i < end && offset+i < s->num_irq; i++) {
+            if (value&(1<<i)) {
+                s->vectors[offset+i].pending = setval;
+            }
+        }
+        nvic_irq_update(s);
+        return;
+    case 0x300 ... 0x37c: /* NVIC Active */
+        return; /* R/O */
+    case 0x400 ... 0x7ec: /* NVIC Priority */
+        offset = offset-0x400+16; /* vector # */
+
         for (i = 0; i < size; i++) {
-            s->gic.priority1[(offset - 0xd14) + i][0] =
-                (value >> (i * 8)) & 0xff;
+            set_prio(s, offset+i, (value>>(i*8))&0xff);
         }
-        gic_update(&s->gic);
+        nvic_irq_update(s);
+        s->cpu->env.v7m.exception_prio = armv7m_nvic_get_active_prio(s);
         return;
-    }
-    if (size == 4) {
-        nvic_writel(s, offset, value);
+    case 0xd18 ... 0xd23: /* System Handler Priority.  */
+        for (i = 0; i < size; i++) {
+            unsigned hdlidx = (offset - 0xd14) + i;
+            set_prio(s, hdlidx, (value >> (i * 8)) & 0xff);
+            DPRINTF(0, "Set Handler prio %u = %u\n",
+                    (unsigned)hdlidx,
+                    (unsigned)s->vectors[hdlidx].raw_prio);
+        }
+        nvic_irq_update(s);
+        s->cpu->env.v7m.exception_prio = armv7m_nvic_get_active_prio(s);
         return;
+    default:
+        if (size == 4) {
+            nvic_writel(s, offset, value);
+            return;
+        }
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "NVIC: Bad write of size %d at offset 0x%x\n",
+                      size, offset);
     }
-    qemu_log_mask(LOG_GUEST_ERROR,
-                  "NVIC: Bad write of size %d at offset 0x%x\n", size, offset);
 }
 
 static const MemoryRegionOps nvic_sysreg_ops = {
@@ -479,79 +873,123 @@ static const MemoryRegionOps nvic_sysreg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static const VMStateDescription vmstate_nvic = {
-    .name = "armv7m_nvic",
+static
+int nvic_post_load(void *opaque, int version_id)
+{
+    NVICState *s = opaque;
+    unsigned i;
+
+    /* recalculate priorities */
+    for (i = 4; i < s->num_irq; i++) {
+        set_prio(s, i, s->vectors[i].raw_prio);
+    }
+
+    nvic_irq_update(s);
+    s->cpu->env.v7m.exception_prio = armv7m_nvic_get_active_prio(s);
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_VecInfo = {
+    .name = "armv7m_nvic_info",
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32(systick.control, nvic_state),
-        VMSTATE_UINT32(systick.reload, nvic_state),
-        VMSTATE_INT64(systick.tick, nvic_state),
-        VMSTATE_TIMER_PTR(systick.timer, nvic_state),
+        VMSTATE_UINT16(prio_sub, VecInfo),
+        VMSTATE_INT8(prio_group, VecInfo),
+        VMSTATE_UINT8(raw_prio, VecInfo),
+        VMSTATE_UINT8(enabled, VecInfo),
+        VMSTATE_UINT8(pending, VecInfo),
+        VMSTATE_UINT8(active, VecInfo),
+        VMSTATE_UINT8(level, VecInfo),
         VMSTATE_END_OF_LIST()
     }
 };
 
+static const VMStateDescription vmstate_nvic = {
+    .name = "armv7m_nvic",
+    .version_id = 2,
+    .minimum_version_id = 2,
+    .post_load = &nvic_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(vectors, NVICState, NVIC_MAX_VECTORS, 1,
+                             vmstate_VecInfo, VecInfo),
+        VMSTATE_UINT8(prigroup, NVICState),
+        VMSTATE_UINT32(systick.control, NVICState),
+        VMSTATE_UINT32(systick.reload, NVICState),
+        VMSTATE_INT64(systick.tick, NVICState),
+        VMSTATE_TIMER_PTR(systick.timer, NVICState),
+        VMSTATE_UINT32(num_irq, NVICState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property props_nvic[] = {
+    DEFINE_PROP_UINT32("num-irq", NVICState, num_irq, 64),
+    DEFINE_PROP_END_OF_LIST()
+};
+
 static void armv7m_nvic_reset(DeviceState *dev)
 {
-    nvic_state *s = NVIC(dev);
-    NVICClass *nc = NVIC_GET_CLASS(s);
-    nc->parent_reset(dev);
-    /* Common GIC reset resets to disabled; the NVIC doesn't have
-     * per-CPU interfaces so mark our non-existent CPU interface
-     * as enabled by default, and with a priority mask which allows
-     * all interrupts through.
+    NVICState *s = NVIC(dev);
+
+    s->vectors[ARMV7M_EXCP_NMI].enabled = 1;
+    s->vectors[ARMV7M_EXCP_HARD].enabled = 1;
+    s->vectors[ARMV7M_EXCP_SVC].enabled = 1;
+    s->vectors[ARMV7M_EXCP_DEBUG].enabled = 1;
+    s->vectors[ARMV7M_EXCP_PENDSV].enabled = 1;
+
+    s->vectors[ARMV7M_EXCP_RESET].prio_group = -3;
+    s->vectors[ARMV7M_EXCP_NMI].prio_group = -2;
+    s->vectors[ARMV7M_EXCP_HARD].prio_group = -1;
+
+    /* strictly speaking the reset handler should be enabled.
+     * However, we don't simulate soft resets through the NVIC,
+     * and the reset vector should never be pended.
+     * So don't enabled to catch logic errors.
+    s->vectors[ARMV7M_EXCP_RESET].enabled = 1;
      */
-    s->gic.cpu_ctlr[0] = GICC_CTLR_EN_GRP0;
-    s->gic.priority_mask[0] = 0x100;
-    /* The NVIC as a whole is always enabled. */
-    s->gic.ctlr = 1;
+
     systick_reset(s);
 }
 
 static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
 {
-    nvic_state *s = NVIC(dev);
-    NVICClass *nc = NVIC_GET_CLASS(s);
-    Error *local_err = NULL;
-
-    /* The NVIC always has only one CPU */
-    s->gic.num_cpu = 1;
-    /* Tell the common code we're an NVIC */
-    s->gic.revision = 0xffffffff;
-    s->num_irq = s->gic.num_irq;
-    nc->parent_realize(dev, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    NVICState *s = NVIC(dev);
+
+    s->cpu = ARM_CPU(first_cpu);
+
+    if (s->num_irq > NVIC_MAX_IRQ) {
+        error_setg(errp, TYPE_NVIC " num-irq too large");
+        return;
+
+    } else if (s->num_irq & 0x1f) {
+        error_setg(errp, TYPE_NVIC " num-irq must be a multiple of 32");
         return;
     }
-    gic_init_irqs_and_distributor(&s->gic);
-    /* The NVIC and system controller register area looks like this:
-     *  0..0xff : system control registers, including systick
-     *  0x100..0xcff : GIC-like registers
-     *  0xd00..0xfff : system control registers
-     * We use overlaying to put the GIC like registers
-     * over the top of the system control register region.
-     */
-    memory_region_init(&s->container, OBJECT(s), "nvic", 0x1000);
-    /* The system register region goes at the bottom of the priority
-     * stack as it covers the whole page.
+
+    qdev_init_gpio_in(dev, set_irq_level, s->num_irq);
+
+    s->num_irq += 16; /* include space for internal exception vectors */
+
+    /* The NVIC and system controller register area starts at 0xe000e000
+     * and looks like this:
+     *  0x004 - ICTR
+     *  0x010 - 0x1c - systick
+     *  0x100..0x7ec - NVIC
+     *  0x7f0..0xcff - Reserved
+     *  0xd00..0xd3c - SCS registers
+     *  0xd40..0xeff - Reserved or Not implemented
+     *  0xf00 - STIR
      */
-    memory_region_init_io(&s->sysregmem, OBJECT(s), &nvic_sysreg_ops, s,
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &nvic_sysreg_ops, s,
                           "nvic_sysregs", 0x1000);
-    memory_region_add_subregion(&s->container, 0, &s->sysregmem);
-    /* Alias the GIC region so we can get only the section of it
-     * we need, and layer it on top of the system register region.
-     */
-    memory_region_init_alias(&s->gic_iomem_alias, OBJECT(s),
-                             "nvic-gic", &s->gic.iomem,
-                             0x100, 0xc00);
-    memory_region_add_subregion_overlap(&s->container, 0x100,
-                                        &s->gic_iomem_alias, 1);
+
     /* Map the whole thing into system memory at the location required
      * by the v7M architecture.
      */
-    memory_region_add_subregion(get_system_memory(), 0xe000e000, &s->container);
+    memory_region_add_subregion(get_system_memory(), 0xe000e000, &s->iomem);
     s->systick.timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, systick_timer_tick, s);
 }
 
@@ -563,36 +1001,31 @@ static void armv7m_nvic_instance_init(Object *obj)
      * any user-specified property setting, so just modify the
      * value in the GICState struct.
      */
-    GICState *s = ARM_GIC_COMMON(obj);
     DeviceState *dev = DEVICE(obj);
-    nvic_state *nvic = NVIC(obj);
-    /* The ARM v7m may have anything from 0 to 496 external interrupt
-     * IRQ lines. We default to 64. Other boards may differ and should
-     * set the num-irq property appropriately.
-     */
-    s->num_irq = 64;
+    NVICState *nvic = NVIC(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    sysbus_init_irq(sbd, &nvic->excpout);
     qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
 }
 
 static void armv7m_nvic_class_init(ObjectClass *klass, void *data)
 {
-    NVICClass *nc = NVIC_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    nc->parent_reset = dc->reset;
-    nc->parent_realize = dc->realize;
     dc->vmsd  = &vmstate_nvic;
+    dc->props = props_nvic;
     dc->reset = armv7m_nvic_reset;
     dc->realize = armv7m_nvic_realize;
 }
 
 static const TypeInfo armv7m_nvic_info = {
     .name          = TYPE_NVIC,
-    .parent        = TYPE_ARM_GIC_COMMON,
+    .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_init = armv7m_nvic_instance_init,
-    .instance_size = sizeof(nvic_state),
+    .instance_size = sizeof(NVICState),
     .class_init    = armv7m_nvic_class_init,
-    .class_size    = sizeof(NVICClass),
+    .class_size    = sizeof(SysBusDeviceClass),
 };
 
 static void armv7m_nvic_register_types(void)
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index e2d9e75..4b7f78e 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1036,7 +1036,9 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
 /* Interface between CPU and Interrupt controller.  */
 int armv7m_excp_running_prio(ARMCPU *cpu);
 void armv7m_nvic_set_pending(void *opaque, int irq);
-int armv7m_nvic_acknowledge_irq(void *opaque);
+bool armv7m_nvic_is_active(void *opaque, int irq);
+int armv7m_nvic_get_active_prio(void *opaque);
+void armv7m_nvic_acknowledge_irq(void *opaque);
 void armv7m_nvic_complete_irq(void *opaque, int irq);
 
 /* Interface for defining coprocessor registers.
-- 
2.1.4


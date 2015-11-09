Received: by 10.182.105.169 with SMTP id gn9csp901794obb;
        Sun, 8 Nov 2015 17:17:50 -0800 (PST)
X-Received: by 10.55.79.214 with SMTP id d205mr27154407qkb.22.1447031869257;
        Sun, 08 Nov 2015 17:17:49 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y203si9328737qka.43.2015.11.08.17.17.49
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:17:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb5h-0000mI-0b
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:17:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1O-0001KV-49
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1M-0007w1-1m
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:22 -0500
Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231]:34956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1L-0007vW-U8; Sun, 08 Nov 2015 20:13:19 -0500
Received: by qgec40 with SMTP id c40so71541164qge.2;
	Sun, 08 Nov 2015 17:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xldgl/KRUcOVHoGIwNel7CPMT19f36U4NE7AKzYonsM=;
	b=oOh94L2xSFQqdsC859mftKV+QL7zIMthC+Fg5GtjFnL8nZE8DjhNJCICEb/f0F3zju
	wL9kFmsnc8DEB0GpwQojli7c7ikvEekupETTgl3DavA8rD5nA+lTGf/FU6XRkcKSpKt8
	61MZnw2I9L47ITKfP/ZR4hSCNYKqwVUE8TnKfJme2OGoDK1ujdz6Sd8jnP/riVfPNMF6
	2EsJn5q0iaZi3VYzwfQ5uzOJv0/umutbzgaeJy4vtOrqEQx50UMu5vzHCi9WuO+lLChL
	+Ct15rUG9lSEVB7GArx8ZcaP9HdDw3ywMO0FUQlVr6vzmfnERyvq2a8sU2lhDKlSBIOw
	LV4g==
X-Received: by 10.140.156.199 with SMTP id c190mr6159030qhc.85.1447031599484; 
	Sun, 08 Nov 2015 17:13:19 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:19 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:33 -0500
Message-Id: <1447031505-12477-7-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 06/18] armv7m: new NVIC utility functions
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
X-TUID: NeXZsZmuLdOH

Internal functions for operations previously done
by GIC internals.

nvic_irq_update() recalculates highest pending/active
exceptions.

armv7m_nvic_set_pending() include exception escalation
logic.

armv7m_nvic_acknowledge_irq() and nvic_irq_update()
update ARMCPU fields.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 hw/intc/armv7m_nvic.c | 250 +++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 235 insertions(+), 15 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 487a09a..ebb4d4e 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -140,36 +140,256 @@ static void systick_reset(nvic_state *s)
     timer_del(s->systick.timer);
 }
 
-/* The external routines use the hardware vector numbering, ie. the first
-   IRQ is #16.  The internal GIC routines use #32 as the first IRQ.  */
+/* caller must call nvic_irq_update() after this */
+static
+void set_prio(nvic_state *s, unsigned irq, uint8_t prio)
+{
+    unsigned submask = (1<<(s->prigroup+1))-1;
+
+    assert(irq > 3); /* only use for configurable prios */
+    assert(irq < NVIC_MAX_VECTORS);
+
+    s->vectors[irq].raw_prio = prio;
+    s->vectors[irq].prio_group = (prio>>(s->prigroup+1));
+    s->vectors[irq].prio_sub = irq + (prio&submask)*NVIC_MAX_VECTORS;
+
+    DPRINTF(0, "Set %u priority grp %d sub %u\n", irq,
+            s->vectors[irq].prio_group, s->vectors[irq].prio_sub);
+}
+
+/* recompute highest pending */
+static
+void nvic_irq_update(nvic_state *s, int update_active)
+{
+    unsigned i;
+    int lvl;
+    CPUARMState *env = &s->cpu->env;
+    int16_t act_group = 0x100, pend_group = 0x100;
+    uint16_t act_sub = 0, pend_sub = 0;
+    uint16_t act_irq = 0, pend_irq = 0;
+
+    /* find highest priority */
+    for (i = 1; i < s->num_irq; i++) {
+        vec_info *I = &s->vectors[i];
+
+        DPRINTF(2, " VECT %d %d:%u\n", i, I->prio_group, I->prio_sub);
+
+        if (I->active && ((I->prio_group < act_group)
+                || (I->prio_group == act_group && I->prio_sub < act_sub)))
+        {
+            act_group = I->prio_group;
+            act_sub = I->prio_sub;
+            act_irq = i;
+        }
+
+        if (I->enabled && I->pending && ((I->prio_group < pend_group)
+                || (I->prio_group == pend_group && I->prio_sub < pend_sub)))
+        {
+            pend_group = I->prio_group;
+            pend_sub = I->prio_sub;
+            pend_irq = i;
+        }
+    }
+
+    env->v7m.pending = pend_irq;
+    env->v7m.pending_prio = pend_group;
+
+    if (update_active) {
+        env->v7m.exception = act_irq;
+        env->v7m.exception_prio = act_group;
+    }
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
+    DPRINTF(1, "highest pending %d %d:%u\n", pend_irq, pend_group, pend_sub);
+    DPRINTF(1, "highest active  %d %d:%u\n", act_irq, act_group, act_sub);
+
+    DPRINTF(0, "IRQ %c highest act %d pend %d\n",
+            lvl ? 'X' : '_', act_irq, pend_irq);
+
+    qemu_set_irq(s->excpout, lvl);
+}
+
+static
+void armv7m_nvic_clear_pending(void *opaque, int irq)
+{
+    nvic_state *s = (nvic_state *)opaque;
+    vec_info *I;
+
+    assert(irq >= 0);
+    assert(irq < NVIC_MAX_VECTORS);
+
+    I = &s->vectors[irq];
+    if (I->pending) {
+        I->pending = 0;
+        nvic_irq_update(s, 0);
+    }
+}
+
 void armv7m_nvic_set_pending(void *opaque, int irq)
 {
     nvic_state *s = (nvic_state *)opaque;
-    if (irq >= 16)
-        irq += 16;
-    gic_set_pending_private(&s->gic, 0, irq);
+    CPUARMState *env = &s->cpu->env;
+    vec_info *I;
+    int active = s->cpu->env.v7m.exception;
+
+    assert(irq > 0);
+    assert(irq < NVIC_MAX_VECTORS);
+
+    I = &s->vectors[irq];
+
+    if (irq < ARMV7M_EXCP_SYSTICK && irq != ARMV7M_EXCP_DEBUG) {
+        int runnable = armv7m_excp_unmasked(s->cpu);
+        /* test for exception escalation for vectors other than:
+         * Debug (12), SysTick (15), and all external IRQs (>=16)
+         */
+        unsigned escalate = 0;
+        if (I->active) {
+            /* trying to pend an active fault (possibly nested).
+             * eg. UsageFault in UsageFault handler
+             */
+            escalate = 1;
+            DPRINTF(0, " Escalate, active\n");
+        } else if (!I->enabled) {
+            /* trying to pend a disabled fault
+             * eg. UsageFault while USGFAULTENA in SHCSR is clear.
+             */
+            escalate = 1;
+            DPRINTF(0, " Escalate, not enabled\n");
+        } else if (I->prio_group > runnable) {
+            /* trying to pend a fault which is not immediately
+             * runnable due to masking by PRIMASK, FAULTMASK, BASEPRI,
+             * or the priority of the active exception
+             */
+            DPRINTF(0, " Escalate, mask %d >= %d\n",
+                    I->prio_group, runnable);
+            escalate = 1;
+        }
+
+        if (escalate) {
+#ifdef DEBUG_NVIC
+            int oldirq = irq;
+#endif
+            if (runnable < -1) {
+                /* TODO: actual unrecoverable exception actions */
+                cpu_abort(&s->cpu->parent_obj,
+                          "%d in %d escalates to unrecoverable exception\n",
+                          irq, active);
+            } else {
+                irq = ARMV7M_EXCP_HARD;
+            }
+            I = &s->vectors[irq];
+
+            DPRINTF(0, "Escalate %d to %d\n", oldirq, irq);
+        }
+    }
+
+    I->pending = 1;
+    if (I->enabled && (I->prio_group < env->v7m.pending_prio)) {
+        env->v7m.pending_prio = I->prio_group;
+        env->v7m.pending = irq;
+        qemu_set_irq(s->excpout, irq > 0);
+    }
+    DPRINTF(0, "Pending %d at %d%s runnable %d\n",
+            irq, I->prio_group,
+            env->v7m.pending == irq ? " (highest)" : "",
+            armv7m_excp_unmasked(s->cpu));
 }
 
 /* Make pending IRQ active.  */
-int armv7m_nvic_acknowledge_irq(void *opaque)
+void armv7m_nvic_acknowledge_irq(void *opaque)
 {
     nvic_state *s = (nvic_state *)opaque;
-    uint32_t irq;
+    CPUARMState *env = &s->cpu->env;
+    const int pending = env->v7m.pending;
+    const int runnable = armv7m_excp_unmasked(s->cpu);
+    vec_info *I;
 
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
+    I = &s->vectors[pending];
+
+    assert(I->enabled);
+
+    assert(env->v7m.pending_prio == I->prio_group);
+    if (env->v7m.pending_prio > runnable) {
+        hw_error("Interrupt ack. while masked %d > %d",
+                 env->v7m.pending_prio, runnable);
+    }
+
+    DPRINTF(0, "ACT %d at %d\n", pending, I->prio_group);
+
+    assert(I->pending);
+    I->active = 1;
+    I->pending = 0;
+
+    env->v7m.exception = env->v7m.pending;
+    env->v7m.exception_prio = env->v7m.pending_prio;
+
+    nvic_irq_update(s, 0);
+
+    assert(env->v7m.exception > 0); /* spurious exception? */
 }
 
 void armv7m_nvic_complete_irq(void *opaque, int irq)
 {
     nvic_state *s = (nvic_state *)opaque;
-    if (irq >= 16)
-        irq += 16;
-    gic_complete_irq(&s->gic, 0, irq, MEMTXATTRS_UNSPECIFIED);
+    vec_info *I;
+
+    assert(irq > 0);
+    assert(irq < NVIC_MAX_VECTORS);
+
+    I = &s->vectors[irq];
+
+    I->active = 0;
+    I->pending = I->level;
+    assert(!I->level || irq >= 16);
+
+    nvic_irq_update(s, 1);
+    DPRINTF(0, "EOI %d\n", irq);
+}
+
+/* Only called for external interrupt (vector>=16) */
+static
+void set_irq_level(void *opaque, int n, int level)
+{
+    nvic_state *s = opaque;
+    vec_info *I;
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
+    I = &s->vectors[n];
+    I->level = level;
+    if (level) {
+        DPRINTF(1, "assert IRQ %d\n", n-16);
+        armv7m_nvic_set_pending(s, n-16);
+    } else {
+        DPRINTF(2, "deassert IRQ %d\n", n-16);
+    }
 }
 
 static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
-- 
2.1.4


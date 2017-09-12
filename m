Received: by 10.223.172.38 with SMTP id v35csp7471375wrc;
        Tue, 12 Sep 2017 11:19:41 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb5RmdJAuj3nKzeUIURcYXZkXdmqDmBMPGS/vicHrnrPr5UYI5YKfMAaB+ePxy2H+SwWrHWe
X-Received: by 10.55.58.9 with SMTP id h9mr21035626qka.352.1505240381516;
        Tue, 12 Sep 2017 11:19:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240381; cv=none;
        d=google.com; s=arc-20160816;
        b=Zj15BXinQCiwz3+Zui8UXmMufGvW9+eBWDGCSx3bCxJIo+L1C+IXIiSvolc2110Aln
         emhO7pkC3JqVubZSQ5Upsb5qVYnz/uRVt/2gRh0BjLzkk/cbyUcry07SytVj+K9dnIJ0
         rfmEZRkz+ptTffzJYKh1lvh8CXHx+ixuJQ1tlsbbTeJoUROa0JjaBYP8SSVxd5vkSGbX
         89Vx2fTMbIn4AX8Ikw1vUaPG8HkJ9B9L6e7xQQV7m7FIQ6njceQy74IgGLel6dRRF3hf
         rftKRTuWuGdq+f7AnCc3SOmk10OlD85zMR0u4QQz0D3QOANe8319rRUUthpeFBzr+W3R
         RQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gKAMgogRWVRHLL2+573F/4t+0MGLZHPfN0Gkx/z5T8c=;
        b=rltVcc8vFQrElNjVDqwGqVoKfmD6ZWuYB+RIkC9iWZssogVoPpxAN8Q5926qg3BnK3
         SNWwygScTitu/W+GVjh392nn531RA5sGbVkeIHmMyC3D2eGFQ7mjB2UcOXnzeSlePH4N
         QjrPhEuj/fgqA4fZM3CQ8PvN0/+/h75Q3wwqlQSluZjHclrhaDqLrX29nH1N2IfbkJmD
         dfbDFjyqPYvr6oSKp17Pk5rhi/jfr+gN7+STNiMnSSP/DO1g4uUE//QlK/YZ3s2XOlK3
         L3NTiUPhVzXnT/JVDd4hyU0Arr/LgmmBUJ0G58p4pKOuq38u6splaa+qmaBg9atowK54
         2XWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n132si12053280qka.521.2017.09.12.11.19.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:19:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drpmd-0000Io-7F
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:19:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgy-0003Ne-9k
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgw-0006NX-BT
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:48 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37298)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgw-0006Mo-0k; Tue, 12 Sep 2017 14:13:46 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgv-000162-0H; Tue, 12 Sep 2017 19:13:45 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:55 +0100
Message-Id: <1505240046-11454-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
References: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 08/19] nvic: Handle banked exceptions in
 nvic_recompute_state()
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
X-TUID: vY9TB3A5aV5v

Update the nvic_recompute_state() code to handle the security
extension and its associated banked registers.

Code that uses the resulting cached state (ie the irq
acknowledge and complete code) will be updated in a later
commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/armv7m_nvic.c | 151 ++++++++++++++++++++++++++++++++++++++++++++++++--
 hw/intc/trace-events  |   1 +
 2 files changed, 147 insertions(+), 5 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index b97dbe3..fb824e6 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -54,6 +54,8 @@
  * (higher than the highest possible priority value)
  */
 #define NVIC_NOEXC_PRIO 0x100
+/* Maximum priority of non-secure exceptions when AIRCR.PRIS is set */
+#define NVIC_NS_PRIO_LIMIT 0x80
 
 static const uint8_t nvic_id[] = {
     0x00, 0xb0, 0x1b, 0x00, 0x0d, 0xe0, 0x05, 0xb1
@@ -126,13 +128,139 @@ static bool nvic_isrpending(NVICState *s)
     return false;
 }
 
+static bool exc_is_banked(int exc)
+{
+    /* Return true if this is one of the limited set of exceptions which
+     * are banked (and thus have state in sec_vectors[])
+     */
+    return exc == ARMV7M_EXCP_HARD ||
+        exc == ARMV7M_EXCP_MEM ||
+        exc == ARMV7M_EXCP_USAGE ||
+        exc == ARMV7M_EXCP_SVC ||
+        exc == ARMV7M_EXCP_PENDSV ||
+        exc == ARMV7M_EXCP_SYSTICK;
+}
+
 /* Return a mask word which clears the subpriority bits from
  * a priority value for an M-profile exception, leaving only
  * the group priority.
  */
-static inline uint32_t nvic_gprio_mask(NVICState *s)
+static inline uint32_t nvic_gprio_mask(NVICState *s, bool secure)
+{
+    return ~0U << (s->prigroup[secure] + 1);
+}
+
+static bool exc_targets_secure(NVICState *s, int exc)
+{
+    /* Return true if this non-banked exception targets Secure state. */
+    if (!arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
+        return false;
+    }
+
+    if (exc >= NVIC_FIRST_IRQ) {
+        return !s->itns[exc];
+    }
+
+    /* Function shouldn't be called for banked exceptions. */
+    assert(!exc_is_banked(exc));
+
+    switch (exc) {
+    case ARMV7M_EXCP_NMI:
+    case ARMV7M_EXCP_BUS:
+        return !(s->cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
+    case ARMV7M_EXCP_SECURE:
+        return true;
+    case ARMV7M_EXCP_DEBUG:
+        /* TODO: controlled by DEMCR.SDME, which we don't yet implement */
+        return false;
+    default:
+        /* reset, and reserved (unused) low exception numbers.
+         * We'll get called by code that loops through all the exception
+         * numbers, but it doesn't matter what we return here as these
+         * non-existent exceptions will never be pended or active.
+         */
+        return true;
+    }
+}
+
+static int exc_group_prio(NVICState *s, int rawprio, bool targets_secure)
+{
+    /* Return the group priority for this exception, given its raw
+     * (group-and-subgroup) priority value and whether it is targeting
+     * secure state or not.
+     */
+    if (rawprio < 0) {
+        return rawprio;
+    }
+    rawprio &= nvic_gprio_mask(s, targets_secure);
+    /* AIRCR.PRIS causes us to squash all NS priorities into the
+     * lower half of the total range
+     */
+    if (!targets_secure &&
+        (s->cpu->env.v7m.aircr & R_V7M_AIRCR_PRIS_MASK)) {
+        rawprio = (rawprio >> 1) + NVIC_NS_PRIO_LIMIT;
+    }
+    return rawprio;
+}
+
+/* Recompute vectpending and exception_prio for a CPU which implements
+ * the Security extension
+ */
+static void nvic_recompute_state_secure(NVICState *s)
 {
-    return ~0U << (s->prigroup[M_REG_NS] + 1);
+    int i, bank;
+    int pend_prio = NVIC_NOEXC_PRIO;
+    int active_prio = NVIC_NOEXC_PRIO;
+    int pend_irq = 0;
+    bool pending_is_s_banked = false;
+
+    /* R_CQRV: precedence is by:
+     *  - lowest group priority; if both the same then
+     *  - lowest subpriority; if both the same then
+     *  - lowest exception number; if both the same (ie banked) then
+     *  - secure exception takes precedence
+     * Compare pseudocode RawExecutionPriority.
+     * Annoyingly, now we have two prigroup values (for S and NS)
+     * we can't do the loop comparison on raw priority values.
+     */
+    for (i = 1; i < s->num_irq; i++) {
+        for (bank = M_REG_S; bank >= M_REG_NS; bank--) {
+            VecInfo *vec;
+            int prio;
+            bool targets_secure;
+
+            if (bank == M_REG_S) {
+                if (!exc_is_banked(i)) {
+                    continue;
+                }
+                vec = &s->sec_vectors[i];
+                targets_secure = true;
+            } else {
+                vec = &s->vectors[i];
+                targets_secure = !exc_is_banked(i) && exc_targets_secure(s, i);
+            }
+
+            prio = exc_group_prio(s, vec->prio, targets_secure);
+            if (vec->enabled && vec->pending && prio < pend_prio) {
+                pend_prio = prio;
+                pend_irq = i;
+                pending_is_s_banked = (bank == M_REG_S);
+            }
+            if (vec->active && prio < active_prio) {
+                active_prio = prio;
+            }
+        }
+    }
+
+    s->vectpending_is_s_banked = pending_is_s_banked;
+    s->vectpending = pend_irq;
+    s->vectpending_prio = pend_prio;
+    s->exception_prio = active_prio;
+
+    trace_nvic_recompute_state_secure(s->vectpending,
+                                      s->vectpending_is_s_banked,
+                                      s->vectpending_prio,
+                                      s->exception_prio);
 }
 
 /* Recompute vectpending and exception_prio */
@@ -143,6 +271,18 @@ static void nvic_recompute_state(NVICState *s)
     int active_prio = NVIC_NOEXC_PRIO;
     int pend_irq = 0;
 
+    /* In theory we could write one function that handled both
+     * the "security extension present" and "not present"; however
+     * the security related changes significantly complicate the
+     * recomputation just by themselves and mixing both cases together
+     * would be even worse, so we retain a separate non-secure-only
+     * version for CPUs which don't implement the security extension.
+     */
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
+        nvic_recompute_state_secure(s);
+        return;
+    }
+
     for (i = 1; i < s->num_irq; i++) {
         VecInfo *vec = &s->vectors[i];
 
@@ -156,11 +296,11 @@ static void nvic_recompute_state(NVICState *s)
     }
 
     if (active_prio > 0) {
-        active_prio &= nvic_gprio_mask(s);
+        active_prio &= nvic_gprio_mask(s, false);
     }
 
     if (pend_prio > 0) {
-        pend_prio &= nvic_gprio_mask(s);
+        pend_prio &= nvic_gprio_mask(s, false);
     }
 
     s->vectpending = pend_irq;
@@ -186,7 +326,8 @@ static inline int nvic_exec_prio(NVICState *s)
     } else if (env->v7m.primask[env->v7m.secure]) {
         running = 0;
     } else if (env->v7m.basepri[env->v7m.secure] > 0) {
-        running = env->v7m.basepri[env->v7m.secure] & nvic_gprio_mask(s);
+        running = env->v7m.basepri[env->v7m.secure] &
+            nvic_gprio_mask(s, env->v7m.secure);
     } else {
         running = NVIC_NOEXC_PRIO; /* lower than any possible priority */
     }
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 5635a5f..0b1fba3 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -168,6 +168,7 @@ gicv3_redist_send_sgi(uint32_t cpu, int irq) "GICv3 redistributor 0x%x pending S
 
 # hw/intc/armv7m_nvic.c
 nvic_recompute_state(int vectpending, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d vectpending_prio %d exception_prio %d"
+nvic_recompute_state_secure(int vectpending, bool vectpending_is_s_banked, int vectpending_prio, int exception_prio) "NVIC state recomputed: vectpending %d is_s_banked %d vectpending_prio %d exception_prio %d"
 nvic_set_prio(int irq, uint8_t prio) "NVIC set irq %d priority %d"
 nvic_irq_update(int vectpending, int pendprio, int exception_prio, int level) "NVIC vectpending %d pending prio %d exception_prio %d: setting irq line to %d"
 nvic_escalate_prio(int irq, int irqprio, int runprio) "NVIC escalating irq %d to HardFault: insufficient priority %d >= %d"
-- 
2.7.4


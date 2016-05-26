Received: by 10.25.30.65 with SMTP id e62csp534240lfe;
        Thu, 26 May 2016 07:57:19 -0700 (PDT)
X-Received: by 10.233.216.7 with SMTP id u7mr9496741qkf.141.1464274639242;
        Thu, 26 May 2016 07:57:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c142si2184876qkg.19.2016.05.26.07.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 07:57:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5wis-0000Uo-LC
	for alex.bennee@linaro.org; Thu, 26 May 2016 10:57:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5wha-0007VA-1g
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:55:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5whU-00057o-87
	for qemu-arm@nongnu.org; Thu, 26 May 2016 10:55:57 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57272)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whT-00057R-Sn; Thu, 26 May 2016 10:55:52 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whS-00049U-Th; Thu, 26 May 2016 15:55:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:34 +0100
Message-Id: <1464274540-19693-17-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 16/22] hw/intc/arm_gicv3: Implement
 gicv3_cpuif_update()
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vw474lvPnKhP

Implement the gicv3_cpuif_update() function which deals with correctly
asserting IRQ and FIQ based on the current running priority of the CPU,
the priority of the highest priority pending interrupt and the CPU's
current exception level and security state.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 140 +++++++++++++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h  |   5 +-
 trace-events              |   2 +
 3 files changed, 142 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index e112646..7faf3c0 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -36,6 +36,142 @@ static bool gicv3_use_ns_bank(CPUARMState *env)
     return !arm_is_secure_below_el3(env);
 }
 
+static int icc_highest_active_prio(GICv3CPUState *cs)
+{
+    /* Calculate the current running priority based on the set bits
+     * in the Active Priority Registers.
+     */
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(cs->icc_apr[0]); i++) {
+        uint32_t apr = cs->icc_apr[GICV3_G0][i] |
+            cs->icc_apr[GICV3_G1][i] | cs->icc_apr[GICV3_G1NS][i];
+
+        if (!apr) {
+            continue;
+        }
+        return (i * 32 + ctz32(apr)) << (GIC_MIN_BPR + 1);
+    }
+    /* No current active interrupts: return idle priority */
+    return 0xff;
+}
+
+static uint32_t icc_gprio_mask(GICv3CPUState *cs, int group)
+{
+    /* Return a mask word which clears the subpriority bits from
+     * a priority value for an interrupt in the specified group.
+     * This depends on the BPR value:
+     *  a BPR of 0 means the group priority bits are [7:1];
+     *  a BPR of 1 means they are [7:2], and so on down to
+     *  a BPR of 7 meaning no group priority bits at all.
+     * Which BPR to use depends on the group of the interrupt and
+     * the current ICC_CTLR.CBPR settings.
+     */
+    if ((group == GICV3_G1 && cs->icc_ctlr_el1[GICV3_S] & ICC_CTLR_EL1_CBPR) ||
+        (group == GICV3_G1NS &&
+         cs->icc_ctlr_el1[GICV3_NS] & ICC_CTLR_EL1_CBPR)) {
+        group = GICV3_G0;
+    }
+
+    return ~0U << ((cs->icc_bpr[group] & 7) + 1);
+}
+
+static bool icc_no_enabled_hppi(GICv3CPUState *cs)
+{
+    /* Return true if there is no pending interrupt, or the
+     * highest priority pending interrupt is in a group which has been
+     * disabled at the CPU interface by the ICC_IGRPEN* register enable bits.
+     */
+    return cs->hppi.prio == 0xff || (cs->icc_igrpen[cs->hppi.grp] == 0);
+}
+
+static bool icc_hppi_can_preempt(GICv3CPUState *cs)
+{
+    /* Return true if we have a pending interrupt of sufficient
+     * priority to preempt.
+     */
+    int rprio;
+    uint32_t mask;
+
+    if (icc_no_enabled_hppi(cs)) {
+        return false;
+    }
+
+    if (cs->hppi.prio >= cs->icc_pmr_el1) {
+        /* Priority mask masks this interrupt */
+        return false;
+    }
+
+    rprio = icc_highest_active_prio(cs);
+    if (rprio == 0xff) {
+        /* No currently running interrupt so we can preempt */
+        return true;
+    }
+
+    mask = icc_gprio_mask(cs, cs->hppi.grp);
+
+    /* We only preempt a running interrupt if the pending interrupt's
+     * group priority is sufficient (the subpriorities are not considered).
+     */
+    if ((cs->hppi.prio & mask) < (rprio & mask)) {
+        return true;
+    }
+
+    return false;
+}
+
+void gicv3_cpuif_update(GICv3CPUState *cs)
+{
+    /* Tell the CPU about its highest priority pending interrupt */
+    int irqlevel = 0;
+    int fiqlevel = 0;
+    ARMCPU *cpu = ARM_CPU(cs->cpu);
+    CPUARMState *env = &cpu->env;
+
+    trace_gicv3_cpuif_update(gicv3_redist_affid(cs), cs->hppi.irq,
+                             cs->hppi.grp, cs->hppi.prio);
+
+    if (cs->hppi.grp == GICV3_G1 && !arm_feature(env, ARM_FEATURE_EL3)) {
+        /* If a Security-enabled GIC sends a G1S interrupt to a
+         * Security-disabled CPU, we must treat it as if it were G0.
+         */
+        cs->hppi.grp = GICV3_G0;
+    }
+
+    if (icc_hppi_can_preempt(cs)) {
+        /* We have an interrupt: should we signal it as IRQ or FIQ?
+         * This is described in the GICv3 spec section 4.6.2.
+         */
+        bool isfiq;
+
+        switch (cs->hppi.grp) {
+        case GICV3_G0:
+            isfiq = true;
+            break;
+        case GICV3_G1:
+            isfiq = (!arm_is_secure(env) ||
+                     (arm_current_el(env) == 3 && arm_el_is_aa64(env, 3)));
+            break;
+        case GICV3_G1NS:
+            isfiq = arm_is_secure(env);
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        if (isfiq) {
+            fiqlevel = 1;
+        } else {
+            irqlevel = 1;
+        }
+    }
+
+    trace_gicv3_cpuif_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
+
+    qemu_set_irq(cs->parent_fiq, fiqlevel);
+    qemu_set_irq(cs->parent_irq, irqlevel);
+}
+
 static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     GICv3CPUState *cs = icc_cs_from_env(env);
@@ -617,7 +753,9 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
 
 static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
 {
-    /* Do nothing for now. */
+    GICv3CPUState *cs = opaque;
+
+    gicv3_cpuif_update(cs);
 }
 
 void gicv3_init_cpuif(GICv3State *s)
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index bd96419..d06ef3e 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -222,10 +222,7 @@ void gicv3_init_cpuif(GICv3State *s);
  * current running priority or the CPU's current exception level or
  * security state.
  */
-static inline void gicv3_cpuif_update(GICv3CPUState *cs)
-{
-    /* This will be implemented in a later commit. */
-}
+void gicv3_cpuif_update(GICv3CPUState *cs);
 
 static inline uint32_t gicv3_iidr(void)
 {
diff --git a/trace-events b/trace-events
index bfc7251..e84cea9 100644
--- a/trace-events
+++ b/trace-events
@@ -1932,6 +1932,8 @@ gicv3_icc_ctlr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR read cpu %x valu
 gicv3_icc_ctlr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR write cpu %x value 0x%" PRIx64
 gicv3_icc_ctlr_el3_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 read cpu %x value 0x%" PRIx64
 gicv3_icc_ctlr_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 write cpu %x value 0x%" PRIx64
+gicv3_cpuif_update(uint32_t cpuid, int irq, int grp, int prio) "GICv3 CPU i/f %x HPPI update: irq %d group %d prio %d"
+gicv3_cpuif_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f %x HPPI update: setting FIQ %d IRQ %d"
 
 # hw/intc/arm_gicv3_dist.c
 gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
-- 
1.9.1


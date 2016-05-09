Received: by 10.25.208.137 with SMTP id h131csp1684155lfg;
        Mon, 9 May 2016 10:32:40 -0700 (PDT)
X-Received: by 10.55.11.133 with SMTP id 127mr20080761qkl.160.1462815160612;
        Mon, 09 May 2016 10:32:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 77si19354476qhn.22.2016.05.09.10.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp2t-000060-PA
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:32:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0h-000445-Sj
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0e-0000HX-9A
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:22 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0d-00005k-Ra; Mon, 09 May 2016 13:30:20 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0L-0001VD-Tx; Mon, 09 May 2016 18:30:01 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:44 +0100
Message-Id: <1462814989-24360-19-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 18/23] hw/intc/arm_gicv3: Add IRQ handling CPU
 interface registers
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
X-TUID: pqxH7eYwWC4l

Add the CPU interface registers which deal with acknowledging
and dismissing interrupts.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 436 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h  |   5 +
 trace-events              |   7 +
 3 files changed, 448 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index a368dbb..c9b1a6a 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -219,6 +219,296 @@ static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gicv3_cpuif_update(cs);
 }
 
+static void icc_activate_irq(GICv3CPUState *cs, int irq)
+{
+    /* Move the interrupt from the Pending state to Active, and update
+     * the Active Priority Registers
+     */
+    uint32_t mask = icc_gprio_mask(cs, cs->hppi.grp);
+    int prio = cs->hppi.prio & mask;
+    int aprbit = prio >> 1;
+    int regno = aprbit / 32;
+    int regbit = aprbit % 32;
+
+    cs->icc_apr[cs->hppi.grp][regno] |= (1 << regbit);
+
+    if (irq < GIC_INTERNAL) {
+        cs->gicr_iactiver0 = deposit32(cs->gicr_iactiver0, irq, 1, 1);
+        cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 0);
+    } else {
+        gicv3_gicd_active_set(cs->gic, irq);
+        gicv3_gicd_pending_clear(cs->gic, irq);
+    }
+    gicv3_update(cs->gic, irq, 1);
+}
+
+static uint64_t icc_hppir0_value(GICv3CPUState *cs, CPUARMState *env)
+{
+    /* Return the highest priority pending interrupt register value
+     * for group 0.
+     */
+    bool irq_is_secure;
+
+    if (cs->hppi.prio == 0xff) {
+        return INTID_SPURIOUS;
+    }
+
+    /* Check whether we can return the interrupt or if we should return
+     * a special identifier, as per the CheckGroup0ForSpecialIdentifiers
+     * pseudocode. (We can simplify a little because for us ICC_SRE_EL1.RM
+     * is always zero.)
+     */
+    irq_is_secure = (!(cs->gic->gicd_ctlr & GICD_CTLR_DS) &&
+                     (cs->hppi.grp != GICV3_G1NS));
+
+    if (cs->hppi.grp != GICV3_G0 && !arm_is_el3_or_mon(env)) {
+        return INTID_SPURIOUS;
+    }
+    if (irq_is_secure && !arm_is_secure(env)) {
+        /* Secure interrupts not visible to Nonsecure */
+        return INTID_SPURIOUS;
+    }
+
+    if (cs->hppi.grp != GICV3_G0) {
+        /* Indicate to EL3 that there's a Group 1 interrupt for the other
+         * state pending.
+         */
+        return irq_is_secure ? INTID_SECURE : INTID_NONSECURE;
+    }
+
+    return cs->hppi.irq;
+}
+
+static uint64_t icc_hppir1_value(GICv3CPUState *cs, CPUARMState *env)
+{
+    /* Return the highest priority pending interrupt register value
+     * for group 1.
+     */
+    bool irq_is_secure;
+
+    if (cs->hppi.prio == 0xff) {
+        return INTID_SPURIOUS;
+    }
+
+    /* Check whether we can return the interrupt or if we should return
+     * a special identifier, as per the CheckGroup1ForSpecialIdentifiers
+     * pseudocode. (We can simplify a little because for us ICC_SRE_EL1.RM
+     * is always zero.)
+     */
+    irq_is_secure = (!(cs->gic->gicd_ctlr & GICD_CTLR_DS) &&
+                     (cs->hppi.grp != GICV3_G1NS));
+
+    if (cs->hppi.grp == GICV3_G0) {
+        /* Group 0 interrupts not visible via HPPIR1 */
+        return INTID_SPURIOUS;
+    }
+    if (irq_is_secure) {
+        if (!arm_is_secure(env)) {
+            /* Secure interrupts not visible in Non-secure */
+            return INTID_SPURIOUS;
+        }
+    } else if (!arm_is_el3_or_mon(env) && arm_is_secure(env)) {
+        /* Group 1 non-secure interrupts not visible in Secure EL1 */
+        return INTID_SPURIOUS;
+    }
+
+    return cs->hppi.irq;
+}
+
+static uint64_t icc_iar0_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    uint64_t intid;
+
+    if (!icc_hppi_can_preempt(cs)) {
+        intid = INTID_SPURIOUS;
+    } else {
+        intid = icc_hppir0_value(cs, env);
+    }
+
+    if (!(intid >= INTID_SECURE && intid <= INTID_SPURIOUS)) {
+        icc_activate_irq(cs, intid);
+    }
+
+    trace_gicv3_icc_iar0_read(gicv3_redist_affid(cs), intid);
+    return intid;
+}
+
+static uint64_t icc_iar1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    uint64_t intid;
+
+    if (!icc_hppi_can_preempt(cs)) {
+        intid = INTID_SPURIOUS;
+    } else {
+        intid = icc_hppir1_value(cs, env);
+    }
+
+    if (!(intid >= INTID_SECURE && intid <= INTID_SPURIOUS)) {
+        icc_activate_irq(cs, intid);
+    }
+
+    trace_gicv3_icc_iar1_read(gicv3_redist_affid(cs), intid);
+    return intid;
+}
+
+static void icc_drop_prio(GICv3CPUState *cs, int grp)
+{
+    /* Drop the priority of the currently active interrupt in
+     * the specified group.
+     *
+     * Note that we can guarantee (because of the requirement to nest
+     * ICC_IAR reads [which activate an interrupt and raise priority]
+     * with ICC_EOIR writes [which drop the priority for the interrupt])
+     * that the interrupt we're being called for is the highest priority
+     * active interrupt, meaning that it has the lowest set bit in the
+     * APR registers.
+     *
+     * If the guest does not honour the ordering constraints then the
+     * behaviour of the GIC is UNPREDICTABLE, which for us means that
+     * the values of the APR registers might become incorrect and the
+     * running priority will be wrong, so interrupts that should preempt
+     * might not do so, and interrupts that should not preempt might do so.
+     */
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(cs->icc_apr[grp]); i++) {
+        uint64_t *papr = &cs->icc_apr[grp][i];
+
+        if (!*papr) {
+            continue;
+        }
+        /* Clear the lowest set bit */
+        *papr &= *papr - 1;
+        break;
+    }
+
+    /* running priority change means we need an update for this cpu i/f */
+    gicv3_cpuif_update(cs);
+}
+
+static bool icc_eoi_split(CPUARMState *env, GICv3CPUState *cs)
+{
+    /* Return true if we should split priority drop and interrupt
+     * deactivation, ie whether the relevant EOIMode bit is set.
+     */
+    if (arm_is_el3_or_mon(env)) {
+        return cs->icc_ctlr_el3 & ICC_CTLR_EL3_EOIMODE_EL3;
+    }
+    if (arm_is_secure_below_el3(env)) {
+        return cs->icc_ctlr_el1[GICV3_S] & ICC_CTLR_EL1_EOIMODE;
+    } else {
+        return cs->icc_ctlr_el1[GICV3_NS] & ICC_CTLR_EL1_EOIMODE;
+    }
+}
+
+static int icc_highest_active_group(GICv3CPUState *cs)
+{
+    /* Return the group with the highest priority active interrupt.
+     * We can do this by just comparing the APRs to see which one
+     * has the lowest set bit.
+     * (If more than one group is active at the same priority then
+     * we're in UNPREDICTABLE territory.)
+     */
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(cs->icc_apr[0]); i++) {
+        int g0ctz = ctz32(cs->icc_apr[GICV3_G0][i]);
+        int g1ctz = ctz32(cs->icc_apr[GICV3_G1][i]);
+        int g1nsctz = ctz32(cs->icc_apr[GICV3_G1NS][i]);
+
+        if (g1nsctz < g0ctz && g1nsctz < g1ctz) {
+            return GICV3_G1NS;
+        }
+        if (g1ctz < g0ctz) {
+            return GICV3_G1;
+        }
+        if (g0ctz < 32) {
+            return GICV3_G0;
+        }
+    }
+    /* No set active bits? UNPREDICTABLE; return -1 so the caller
+     * ignores the spurious EOI attempt.
+     */
+    return -1;
+}
+
+static void icc_deactivate_irq(GICv3CPUState *cs, int irq)
+{
+    if (irq < GIC_INTERNAL) {
+        cs->gicr_iactiver0 = deposit32(cs->gicr_iactiver0, irq, 1, 0);
+        gicv3_redist_update(cs);
+    } else {
+        gicv3_gicd_active_clear(cs->gic, irq);
+        gicv3_update(cs->gic, irq, 1);
+    }
+}
+
+static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /* End of Interrupt */
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int irq = value & 0xffffff;
+    int grp;
+
+    trace_gicv3_icc_eoir_write(gicv3_redist_affid(cs), value);
+
+    if (ri->crm == 8) {
+        /* EOIR0 */
+        grp = GICV3_G0;
+    } else {
+        /* EOIR1 */
+        if (arm_is_secure(env)) {
+            grp = GICV3_G1;
+        } else {
+            grp = GICV3_G1NS;
+        }
+    }
+
+    if (irq >= cs->gic->num_irq) {
+        /* This handles two cases:
+         * 1. If software writes the ID of a spurious interrupt [ie 1020-1023]
+         * to the GICC_EOIR, the GIC ignores that write.
+         * 2. If software writes the number of a non-existent interrupt
+         * this must be a subcase of "value written does not match the last
+         * valid interrupt value read from the Interrupt Acknowledge
+         * register" and so this is UNPREDICTABLE. We choose to ignore it.
+         */
+        return;
+    }
+
+    if (icc_highest_active_group(cs) != grp) {
+        return;
+    }
+
+    icc_drop_prio(cs, grp);
+
+    if (!icc_eoi_split(env, cs)) {
+        /* Priority drop and deactivate not split: deactivate irq now */
+        icc_deactivate_irq(cs, irq);
+    }
+}
+
+static uint64_t icc_hppir0_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    uint64_t value = icc_hppir0_value(cs, env);
+
+    trace_gicv3_icc_hppir0_read(gicv3_redist_affid(cs), value);
+    return value;
+}
+
+static uint64_t icc_hppir1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    uint64_t value = icc_hppir1_value(cs, env);
+
+    trace_gicv3_icc_hppir1_read(gicv3_redist_affid(cs), value);
+    return value;
+}
+
 static uint64_t icc_bpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     GICv3CPUState *cs = icc_cs_from_env(env);
@@ -331,6 +621,104 @@ static void icc_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gicv3_cpuif_update(cs);
 }
 
+static void icc_dir_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    /* Deactivate interrupt */
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int irq = value & 0xffffff;
+    bool irq_is_secure, single_sec_state, irq_is_grp0;
+    bool route_fiq_to_el3, route_irq_to_el3, route_fiq_to_el2, route_irq_to_el2;
+
+    trace_gicv3_icc_dir_write(gicv3_redist_affid(cs), value);
+
+    if (irq >= cs->gic->num_irq) {
+        /* Also catches special interrupt numbers and LPIs */
+        return;
+    }
+
+    if (!icc_eoi_split(env, cs)) {
+        return;
+    }
+
+    int grp = gicv3_irq_group(cs->gic, cs, irq);
+
+    single_sec_state = cs->gic->gicd_ctlr & GICD_CTLR_DS;
+    irq_is_secure = !single_sec_state && (grp != GICV3_G1NS);
+    irq_is_grp0 = grp == GICV3_G0;
+
+    /* Check whether we're allowed to deactivate this interrupt based
+     * on its group and the current CPU state.
+     * These checks are laid out to correspond to the spec's pseudocode.
+     */
+    route_fiq_to_el3 = env->cp15.scr_el3 & SCR_FIQ;
+    route_irq_to_el3 = env->cp15.scr_el3 & SCR_IRQ;
+    /* No need to include !IsSecure in route_*_to_el2 as it's only
+     * tested in cases where we know !IsSecure is true.
+     */
+    route_fiq_to_el2 = env->cp15.hcr_el2 & HCR_FMO;
+    route_irq_to_el2 = env->cp15.hcr_el2 & HCR_FMO;
+
+    switch (arm_current_el(env)) {
+    case 3:
+        break;
+    case 2:
+        if (single_sec_state && irq_is_grp0 && !route_fiq_to_el3) {
+            break;
+        }
+        if (!irq_is_secure && !irq_is_grp0 && !route_irq_to_el3) {
+            break;
+        }
+        return;
+    case 1:
+        if (!arm_is_secure_below_el3(env)) {
+            if (single_sec_state && irq_is_grp0 &&
+                !route_fiq_to_el3 && !route_fiq_to_el2) {
+                break;
+            }
+            if (!irq_is_secure && !irq_is_grp0 &&
+                !route_irq_to_el3 && !route_irq_to_el2) {
+                break;
+            }
+        } else {
+            if (irq_is_grp0 && !route_fiq_to_el3) {
+                break;
+            }
+            if (!irq_is_grp0 &&
+                (!irq_is_secure || !single_sec_state) &&
+                !route_irq_to_el3) {
+                break;
+            }
+        }
+        return;
+    default:
+        g_assert_not_reached();
+    }
+
+    icc_deactivate_irq(cs, irq);
+}
+
+static uint64_t icc_rpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int prio = icc_highest_active_prio(cs);
+
+    if (arm_feature(env, ARM_FEATURE_EL3) &&
+        !arm_is_secure(env) && (env->cp15.scr_el3 & SCR_FIQ)) {
+        /* NS GIC access and Group 0 is inaccessible to NS */
+        if (prio & 0x80) {
+            /* NS mustn't see priorities in the Secure half of the range */
+            prio = 0;
+        } else if (prio != 0xff) {
+            /* Non-idle priority: show the Non-secure view of it */
+            prio = (prio << 1) & 0xff;
+        }
+    }
+
+    trace_gicv3_icc_rpr_read(gicv3_redist_affid(cs), prio);
+    return prio;
+}
+
 static void icc_generate_sgi(CPUARMState *env, GICv3CPUState *cs,
                              uint64_t value, int grp, bool ns)
 {
@@ -698,6 +1086,24 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
        */
       .resetfn = icc_reset,
     },
+    { .name = "ICC_IAR0_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 0,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_R, .accessfn = gicv3_fiq_access,
+      .readfn = icc_iar0_read,
+    },
+    { .name = "ICC_EOIR0_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 1,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = gicv3_fiq_access,
+      .writefn = icc_eoir_write,
+    },
+    { .name = "ICC_HPPIR0_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 2,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_R, .accessfn = gicv3_fiq_access,
+      .readfn = icc_hppir0_read,
+    },
     { .name = "ICC_BPR0_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 3,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
@@ -762,6 +1168,18 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
+    { .name = "ICC_DIR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 11, .opc2 = 1,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = gicv3_irqfiq_access,
+      .writefn = icc_dir_write,
+    },
+    { .name = "ICC_RPR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 11, .opc2 = 3,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_R, .accessfn = gicv3_irqfiq_access,
+      .readfn = icc_rpr_read,
+    },
     { .name = "ICC_SGI1R_EL1", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 11, .opc2 = 5,
       .type = ARM_CP_IO | ARM_CP_NO_RAW,
@@ -798,6 +1216,24 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .access = PL1_W, .accessfn = gicv3_irqfiq_access,
       .writefn = icc_sgi0r_write,
     },
+    { .name = "ICC_IAR1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 0,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_R, .accessfn = gicv3_irq_access,
+      .readfn = icc_iar1_read,
+    },
+    { .name = "ICC_EOIR1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 1,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = gicv3_irq_access,
+      .writefn = icc_eoir_write,
+    },
+    { .name = "ICC_HPPIR1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 2,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_R, .accessfn = gicv3_irq_access,
+      .readfn = icc_hppir1_read,
+    },
     /* This register is banked */
     { .name = "ICC_BPR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 3,
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 66bd1c0..842d621 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -159,6 +159,11 @@
 #define ICC_CTLR_EL3_A3V (1U << 15)
 #define ICC_CTLR_EL3_NDS (1U << 17)
 
+/* Special interrupt IDs */
+#define INTID_SECURE 1020
+#define INTID_NONSECURE 1021
+#define INTID_SPURIOUS 1023
+
 /* Functions internal to the emulated GICv3 */
 
 /**
diff --git a/trace-events b/trace-events
index 441469f..2c178d5 100644
--- a/trace-events
+++ b/trace-events
@@ -1928,6 +1928,13 @@ gicv3_icc_ctlr_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 write c
 gicv3_cpuif_update(uint32_t cpuid, int irq, int grp, int prio) "GICv3 CPU i/f %x HPPI update: irq %d group %d prio %d"
 gicv3_cpuif_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f %x HPPI update: setting FIQ %d IRQ %d"
 gicv3_icc_generate_sgi(uint32_t cpuid, int irq, int irm, uint32_t aff, uint32_t targetlist) "GICv3 CPU i/f %x generating SGI %d IRM %d target affinity 0x%xxx targetlist 0x%x"
+gicv3_icc_iar0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR0 read cpu %x value 0x%" PRIx64
+gicv3_icc_iar1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR1 read cpu %x value 0x%" PRIx64
+gicv3_icc_eoir_write(uint32_t cpu, uint64_t val) "GICv3 ICC_EOIR write cpu %x value 0x%" PRIx64
+gicv3_icc_hppir0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR0 read cpu %x value 0x%" PRIx64
+gicv3_icc_hppir1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR1 read cpu %x value 0x%" PRIx64
+gicv3_icc_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICC_DIR write cpu %x value 0x%" PRIx64
+gicv3_icc_rpr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_RPR read cpu %x value 0x%" PRIx64
 
 # hw/intc/arm_gicv3_dist.c
 gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
-- 
1.9.1


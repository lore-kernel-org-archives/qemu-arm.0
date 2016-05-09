Received: by 10.25.208.137 with SMTP id h131csp1684178lfg;
        Mon, 9 May 2016 10:32:43 -0700 (PDT)
X-Received: by 10.140.105.134 with SMTP id c6mr37440579qgf.31.1462815160920;
        Mon, 09 May 2016 10:32:40 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d67si3494855qkj.122.2016.05.09.10.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp2u-00009V-95
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:32:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0j-00049T-W4
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0f-0000Ic-T0
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:24 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0f-00005k-ED; Mon, 09 May 2016 13:30:21 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0K-0001UR-0A; Mon, 09 May 2016 18:30:00 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:41 +0100
Message-Id: <1462814989-24360-16-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 15/23] hw/intc/arm_gicv3: Implement GICv3 CPU
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
X-TUID: +sm3d3P4a75m

Implement the CPU interface registers for the GICv3; these are
CPU system registers, not MMIO registers.

This commit implements all the registers which are simple
accessors for GIC state, but not those which act as interfaces
for acknowledging, dismissing or generating interrupts. (Those
will be added in a later commit.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/Makefile.objs     |   1 +
 hw/intc/arm_gicv3.c       |   2 +
 hw/intc/arm_gicv3_cpuif.c | 646 ++++++++++++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h  |   1 +
 trace-events              |  16 ++
 5 files changed, 666 insertions(+)
 create mode 100644 hw/intc/arm_gicv3_cpuif.c

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index 417db11..c7bbf88 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -35,3 +35,4 @@ obj-$(CONFIG_ALLWINNER_A10_PIC) += allwinner-a10-pic.o
 obj-$(CONFIG_S390_FLIC) += s390_flic.o
 obj-$(CONFIG_S390_FLIC_KVM) += s390_flic_kvm.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_vic.o
+obj-$(CONFIG_ARM_GIC) += arm_gicv3_cpuif.o
diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index ffa8c41..2b94eaa 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -366,6 +366,8 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
     }
 
     gicv3_init_irqs_and_mmio(s, gicv3_set_irq, gic_ops);
+
+    gicv3_init_cpuif(s);
 }
 
 static void arm_gicv3_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
new file mode 100644
index 0000000..e112646
--- /dev/null
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -0,0 +1,646 @@
+/*
+ * ARM Generic Interrupt Controller v3
+ *
+ * Copyright (c) 2016 Linaro Limited
+ * Written by Peter Maydell
+ *
+ * This code is licensed under the GPL, version 2 or (at your option)
+ * any later version.
+ */
+
+/* This file contains the code for the system register interface
+ * portions of the GICv3.
+ */
+
+#include "qemu/osdep.h"
+#include "trace.h"
+#include "gicv3_internal.h"
+#include "cpu.h"
+
+static GICv3CPUState *icc_cs_from_env(CPUARMState *env)
+{
+    /* Given the CPU, find the right GICv3CPUState struct.
+     * Since we registered the CPU interface with the EL change hook as
+     * the opaque pointer, we can just directly get from the CPU to it.
+     */
+    return arm_get_el_change_hook_opaque(arm_env_get_cpu(env));
+}
+
+static bool gicv3_use_ns_bank(CPUARMState *env)
+{
+    /* Return true if we should use the NonSecure bank for a banked GIC
+     * CPU interface register. Note that this differs from the
+     * access_secure_reg() function because GICv3 banked registers are
+     * banked even for AArch64, unlike the other CPU system registers.
+     */
+    return !arm_is_secure_below_el3(env);
+}
+
+static uint64_t icc_pmr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    uint32_t value = cs->icc_pmr_el1;
+
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env) &&
+        (env->cp15.scr_el3 & SCR_FIQ)) {
+        /* NS access and Group 0 is inaccessible to NS: return the
+         * NS view of the current priority
+         */
+        if (value & 0x80) {
+            /* Secure priorities not visible to NS */
+            value = 0;
+        } else if (value != 0xff) {
+            value = (value << 1) & 0xff;
+        }
+    }
+
+    trace_gicv3_icc_pmr_read(gicv3_redist_affid(cs), value);
+
+    return value;
+}
+
+static void icc_pmr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+
+    trace_gicv3_icc_pmr_write(gicv3_redist_affid(cs), value);
+
+    value &= 0xff;
+
+    if (arm_feature(env, ARM_FEATURE_EL3) && !arm_is_secure(env) &&
+        (env->cp15.scr_el3 & SCR_FIQ)) {
+        /* NS access and Group 0 is inaccessible to NS: return the
+         * NS view of the current priority
+         */
+        if (!(cs->icc_pmr_el1 & 0x80)) {
+            /* Current PMR in the secure range, don't allow NS to change it */
+            return;
+        }
+        value = (value >> 1) & 0x80;
+    }
+    cs->icc_pmr_el1 = value;
+    gicv3_cpuif_update(cs);
+}
+
+static uint64_t icc_bpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int grp = (ri->crm == 8) ? GICV3_G0 : GICV3_G1;
+    bool satinc = false;
+    uint64_t bpr;
+
+    if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
+        grp = GICV3_G1NS;
+    }
+
+    if (grp == GICV3_G1 && !arm_is_el3_or_mon(env) &&
+        (cs->icc_ctlr_el1[GICV3_S] & ICC_CTLR_EL1_CBPR)) {
+        /* CBPR_EL1S means secure EL1 or AArch32 EL3 !Mon BPR1 accesses
+         * modify BPR0
+         */
+        grp = GICV3_G0;
+    }
+
+    if (grp == GICV3_G1NS && arm_current_el(env) < 3 &&
+        (cs->icc_ctlr_el1[GICV3_NS] & ICC_CTLR_EL1_CBPR)) {
+        /* reads return bpr0 + 1 sat to 7, writes ignored */
+        grp = GICV3_G0;
+        satinc = true;
+    }
+
+    bpr = cs->icc_bpr[grp];
+    if (satinc) {
+        bpr++;
+        bpr = MIN(bpr, 7);
+    }
+
+    trace_gicv3_icc_bpr_read(gicv3_redist_affid(cs), bpr);
+
+    return bpr;
+}
+
+static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int grp = (ri->crm == 8) ? GICV3_G0 : GICV3_G1;
+
+    trace_gicv3_icc_pmr_write(gicv3_redist_affid(cs), value);
+
+    if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
+        grp = GICV3_G1NS;
+    }
+
+    if (grp == GICV3_G1 && !arm_is_el3_or_mon(env) &&
+        (cs->icc_ctlr_el1[GICV3_S] & ICC_CTLR_EL1_CBPR)) {
+        /* CBPR_EL1S means secure EL1 or AArch32 EL3 !Mon BPR1 accesses
+         * modify BPR0
+         */
+        grp = GICV3_G0;
+    }
+
+    if (grp == GICV3_G1NS && arm_current_el(env) < 3 &&
+        (cs->icc_ctlr_el1[GICV3_NS] & ICC_CTLR_EL1_CBPR)) {
+        /* reads return bpr0 + 1 sat to 7, writes ignored */
+        return;
+    }
+
+    cs->icc_bpr[grp] = value & 7;
+    gicv3_cpuif_update(cs);
+}
+
+static uint64_t icc_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    uint64_t value;
+
+    int regno = ri->opc2 & 3;
+    int grp = ri->crm & 1 ? GICV3_G0 : GICV3_G1;
+
+    if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
+        grp = GICV3_G1NS;
+    }
+
+    value = cs->icc_apr[grp][regno];
+
+    trace_gicv3_icc_ap_read(regno, gicv3_redist_affid(cs), value);
+    return value;
+}
+
+static void icc_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+
+    int regno = ri->opc2 & 3;
+    int grp = ri->crm & 1 ? GICV3_G0 : GICV3_G1;
+
+    trace_gicv3_icc_ap_write(regno, gicv3_redist_affid(cs), value);
+
+    if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
+        grp = GICV3_G1NS;
+    }
+
+    /* It's not possible to claim that a Non-secure interrupt is active
+     * at a priority outside the Non-secure range (128..255), since this
+     * would otherwise allow malicious NS code to block delivery of S interrupts
+     * by writing a bad value to these registers.
+     */
+    if (grp == GICV3_G1NS && regno < 2 && arm_feature(env, ARM_FEATURE_EL3)) {
+        return;
+    }
+
+    cs->icc_apr[grp][regno] = value & 0xFFFFFFFFU;
+    gicv3_cpuif_update(cs);
+}
+
+static uint64_t icc_igrpen_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int grp = ri->opc2 & 1 ? GICV3_G1 : GICV3_G0;
+    uint64_t value;
+
+    if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
+        grp = GICV3_G1NS;
+    }
+
+    value = cs->icc_igrpen[grp];
+    trace_gicv3_icc_igrpen_read(gicv3_redist_affid(cs), value);
+    return value;
+}
+
+static void icc_igrpen_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int grp = ri->opc2 & 1 ? GICV3_G1 : GICV3_G0;
+
+    trace_gicv3_icc_igrpen_write(gicv3_redist_affid(cs), value);
+
+    if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
+        grp = GICV3_G1NS;
+    }
+
+    cs->icc_igrpen[grp] = value & ICC_IGRPEN_ENABLE;
+    gicv3_cpuif_update(cs);
+}
+
+static uint64_t icc_igrpen1_el3_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+
+    /* IGRPEN1_EL3 bits 0 and 1 are r/w aliases into IGRPEN1_EL1 NS and S */
+    return cs->icc_igrpen[GICV3_G1NS] | (cs->icc_igrpen[GICV3_G1] << 1);
+}
+
+static void icc_igrpen1_el3_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  uint64_t value)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+
+    trace_gicv3_icc_igrpen1_el3_write(gicv3_redist_affid(cs), value);
+
+    /* IGRPEN1_EL3 bits 0 and 1 are r/w aliases into IGRPEN1_EL1 NS and S */
+    cs->icc_igrpen[GICV3_G1NS] = extract32(value, 0, 1);
+    cs->icc_igrpen[GICV3_G1] = extract32(value, 1, 1);
+    gicv3_cpuif_update(cs);
+}
+
+static uint64_t icc_ctlr_el1_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int bank = gicv3_use_ns_bank(env) ? GICV3_NS : GICV3_S;
+    uint64_t value;
+
+    value = cs->icc_ctlr_el1[bank];
+    trace_gicv3_icc_ctlr_read(gicv3_redist_affid(cs), value);
+    return value;
+}
+
+static void icc_ctlr_el1_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                               uint64_t value)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int bank = gicv3_use_ns_bank(env) ? GICV3_NS : GICV3_S;
+    uint64_t mask;
+
+    trace_gicv3_icc_ctlr_write(gicv3_redist_affid(cs), value);
+
+    /* Only CBPR and EOIMODE can be RW;
+     * for us PMHE is RAZ/WI (we don't implement 1-of-N interrupts or
+     * the asseciated priority-based routing of them);
+     * if EL3 is implemented and GICD_CTLR.DS == 0, then PMHE and CBPR are RO.
+     */
+    if (arm_feature(env, ARM_FEATURE_EL3) &&
+        ((cs->gic->gicd_ctlr & GICD_CTLR_DS) == 0)) {
+        mask = ICC_CTLR_EL1_EOIMODE;
+    } else {
+        mask = ICC_CTLR_EL1_CBPR | ICC_CTLR_EL1_EOIMODE;
+    }
+
+    cs->icc_ctlr_el1[bank] &= ~mask;
+    cs->icc_ctlr_el1[bank] |= (value & mask);
+    gicv3_cpuif_update(cs);
+}
+
+
+static uint64_t icc_ctlr_el3_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    uint64_t value;
+
+    value = cs->icc_ctlr_el3;
+    if (cs->icc_ctlr_el1[GICV3_NS] & ICC_CTLR_EL1_EOIMODE) {
+        value |= ICC_CTLR_EL3_EOIMODE_EL1NS;
+    }
+    if (cs->icc_ctlr_el1[GICV3_NS] & ICC_CTLR_EL1_CBPR) {
+        value |= ICC_CTLR_EL3_CBPR_EL1NS;
+    }
+    if (cs->icc_ctlr_el1[GICV3_NS] & ICC_CTLR_EL1_EOIMODE) {
+        value |= ICC_CTLR_EL3_EOIMODE_EL1S;
+    }
+    if (cs->icc_ctlr_el1[GICV3_NS] & ICC_CTLR_EL1_CBPR) {
+        value |= ICC_CTLR_EL3_CBPR_EL1S;
+    }
+
+    trace_gicv3_icc_ctlr_el3_read(gicv3_redist_affid(cs), value);
+    return value;
+}
+
+static void icc_ctlr_el3_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                               uint64_t value)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    uint64_t mask;
+
+    trace_gicv3_icc_ctlr_el3_write(gicv3_redist_affid(cs), value);
+
+    /* *_EL1NS and *_EL1S bits are aliases into the ICC_CTLR_EL1 bits. */
+    cs->icc_ctlr_el1[GICV3_NS] &= (ICC_CTLR_EL1_CBPR | ICC_CTLR_EL1_EOIMODE);
+    if (value & ICC_CTLR_EL3_EOIMODE_EL1NS) {
+        cs->icc_ctlr_el1[GICV3_NS] |= ICC_CTLR_EL1_EOIMODE;
+    }
+    if (value & ICC_CTLR_EL3_CBPR_EL1NS) {
+        cs->icc_ctlr_el1[GICV3_NS] |= ICC_CTLR_EL1_CBPR;
+    }
+
+    cs->icc_ctlr_el1[GICV3_S] &= (ICC_CTLR_EL1_CBPR | ICC_CTLR_EL1_EOIMODE);
+    if (value & ICC_CTLR_EL3_EOIMODE_EL1S) {
+        cs->icc_ctlr_el1[GICV3_S] |= ICC_CTLR_EL1_EOIMODE;
+    }
+    if (value & ICC_CTLR_EL3_CBPR_EL1S) {
+        cs->icc_ctlr_el1[GICV3_S] |= ICC_CTLR_EL1_CBPR;
+    }
+
+    /* The only bit stored in icc_ctlr_el3 which is writeable is EOIMODE_EL3: */
+    mask = ICC_CTLR_EL3_EOIMODE_EL3;
+
+    cs->icc_ctlr_el3 &= ~mask;
+    cs->icc_ctlr_el3 |= (value & mask);
+    gicv3_cpuif_update(cs);
+}
+
+static CPAccessResult gicv3_irqfiq_access(CPUARMState *env,
+                                          const ARMCPRegInfo *ri, bool isread)
+{
+    CPAccessResult r = CP_ACCESS_OK;
+
+    if ((env->cp15.scr_el3 & (SCR_FIQ | SCR_IRQ)) == (SCR_FIQ | SCR_IRQ)) {
+        switch (arm_current_el(env)) {
+        case 1:
+            if (arm_is_secure_below_el3(env) ||
+                ((env->cp15.hcr_el2 & (HCR_IMO | HCR_FMO)) == 0)) {
+                r = CP_ACCESS_TRAP_EL3;
+            }
+            break;
+        case 2:
+            r = CP_ACCESS_TRAP_EL3;
+            break;
+        case 3:
+            if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
+                r = CP_ACCESS_TRAP_EL3;
+            }
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    if (r == CP_ACCESS_TRAP_EL3 && !arm_el_is_aa64(env, 3)) {
+        r = CP_ACCESS_TRAP;
+    }
+    return r;
+}
+
+static CPAccessResult gicv3_fiq_access(CPUARMState *env,
+                                       const ARMCPRegInfo *ri, bool isread)
+{
+    CPAccessResult r = CP_ACCESS_OK;
+
+    if (env->cp15.scr_el3 & SCR_FIQ) {
+        switch (arm_current_el(env)) {
+        case 1:
+            if (arm_is_secure_below_el3(env) ||
+                ((env->cp15.hcr_el2 & HCR_FMO) == 0)) {
+                r = CP_ACCESS_TRAP_EL3;
+            }
+            break;
+        case 2:
+            r = CP_ACCESS_TRAP_EL3;
+            break;
+        case 3:
+            if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
+                r = CP_ACCESS_TRAP_EL3;
+            }
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    if (r == CP_ACCESS_TRAP_EL3 && !arm_el_is_aa64(env, 3)) {
+        r = CP_ACCESS_TRAP;
+    }
+    return r;
+}
+
+static CPAccessResult gicv3_irq_access(CPUARMState *env,
+                                       const ARMCPRegInfo *ri, bool isread)
+{
+    CPAccessResult r = CP_ACCESS_OK;
+
+    if (env->cp15.scr_el3 & SCR_IRQ) {
+        switch (arm_current_el(env)) {
+        case 1:
+            if (arm_is_secure_below_el3(env) ||
+                ((env->cp15.hcr_el2 & HCR_IMO) == 0)) {
+                r = CP_ACCESS_TRAP_EL3;
+            }
+            break;
+        case 2:
+            r = CP_ACCESS_TRAP_EL3;
+            break;
+        case 3:
+            if (!is_a64(env) && !arm_is_el3_or_mon(env)) {
+                r = CP_ACCESS_TRAP_EL3;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+    }
+
+    if (r == CP_ACCESS_TRAP_EL3 && !arm_el_is_aa64(env, 3)) {
+        r = CP_ACCESS_TRAP;
+    }
+    return r;
+}
+
+static void icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    GICv3CPUState *cs = icc_cs_from_env(env);
+
+    cs->icc_ctlr_el1[GICV3_S] = ICC_CTLR_EL1_A3V |
+        (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
+        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+    cs->icc_ctlr_el1[GICV3_NS] = ICC_CTLR_EL1_A3V |
+        (1 << ICC_CTLR_EL1_IDBITS_SHIFT) |
+        (7 << ICC_CTLR_EL1_PRIBITS_SHIFT);
+    cs->icc_pmr_el1 = 0;
+    cs->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
+    cs->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
+    if (arm_feature(env, ARM_FEATURE_EL3)) {
+        cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR_NS;
+    } else {
+        cs->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
+    }
+    memset(cs->icc_apr, 0, sizeof(cs->icc_apr));
+    memset(cs->icc_igrpen, 0, sizeof(cs->icc_igrpen));
+    cs->icc_ctlr_el3 = ICC_CTLR_EL3_NDS | ICC_CTLR_EL3_A3V |
+        (1 << ICC_CTLR_EL3_IDBITS_SHIFT) |
+        (7 << ICC_CTLR_EL3_PRIBITS_SHIFT);
+}
+
+static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
+    { .name = "ICC_PMR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 6, .opc2 = 0,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irqfiq_access,
+      .readfn = icc_pmr_read,
+      .writefn = icc_pmr_write,
+      /* We hang the whole cpu interface reset routine off here
+       * rather than parcelling it out into one little function
+       * per register
+       */
+      .resetfn = icc_reset,
+    },
+    { .name = "ICC_BPR0_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 3,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .fieldoffset = offsetof(GICv3CPUState, icc_bpr[GICV3_G0]),
+      .writefn = icc_bpr_write,
+    },
+    { .name = "ICC_AP0R0_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 4,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][0]),
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP0R1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 5,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][1]),
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP0R2_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 6,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][2]),
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP0R3_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 8, .opc2 = 7,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .fieldoffset = offsetof(GICv3CPUState, icc_apr[GICV3_G0][3]),
+      .writefn = icc_ap_write,
+    },
+    /* All the ICC_AP1R*_EL1 registers are banked */
+    { .name = "ICC_AP1R0_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 0,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP1R1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 1,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP1R2_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 2,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    { .name = "ICC_AP1R3_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 9, .opc2 = 3,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_ap_read,
+      .writefn = icc_ap_write,
+    },
+    /* This register is banked */
+    { .name = "ICC_BPR1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 3,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_bpr_read,
+      .writefn = icc_bpr_write,
+    },
+    /* This register is banked */
+    { .name = "ICC_CTLR_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 4,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irqfiq_access,
+      .readfn = icc_ctlr_el1_read,
+      .writefn = icc_ctlr_el1_write,
+    },
+    { .name = "ICC_SRE_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 5,
+      .type = ARM_CP_NO_RAW | ARM_CP_CONST,
+      .access = PL1_RW,
+      /* We don't support IRQ/FIQ bypass and system registers are
+       * always enabled, so all our bits are RAZ/WI or RAO/WI.
+       * This register is banked but since it's constant we don't
+       * need to do anything special.
+       */
+      .resetvalue = 0x7,
+    },
+    { .name = "ICC_IGRPEN0_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 6,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_fiq_access,
+      .fieldoffset = offsetof(GICv3CPUState, icc_igrpen[GICV3_G0]),
+      .writefn = icc_igrpen_write,
+    },
+    /* This register is banked */
+    { .name = "ICC_IGRPEN1_EL1", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 7,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_RW, .accessfn = gicv3_irq_access,
+      .readfn = icc_igrpen_read,
+      .writefn = icc_igrpen_write,
+    },
+    { .name = "ICC_SRE_EL2", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 4, .crn = 12, .crm = 9, .opc2 = 5,
+      .type = ARM_CP_NO_RAW | ARM_CP_CONST,
+      .access = PL2_RW,
+      /* We don't support IRQ/FIQ bypass and system registers are
+       * always enabled, so all our bits are RAZ/WI or RAO/WI.
+       */
+      .resetvalue = 0xf,
+    },
+    { .name = "ICC_CTLR_EL3", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 12, .opc2 = 4,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL3_RW,
+      .fieldoffset = offsetof(GICv3CPUState, icc_ctlr_el3),
+      .readfn = icc_ctlr_el3_read,
+      .writefn = icc_ctlr_el3_write,
+    },
+    { .name = "ICC_SRE_EL3", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 12, .opc2 = 5,
+      .type = ARM_CP_NO_RAW | ARM_CP_CONST,
+      .access = PL3_RW,
+      /* We don't support IRQ/FIQ bypass and system registers are
+       * always enabled, so all our bits are RAZ/WI or RAO/WI.
+       */
+      .resetvalue = 0xf,
+    },
+    { .name = "ICC_IGRPEN1_EL3", .state = ARM_CP_STATE_BOTH,
+      .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 12, .opc2 = 7,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL3_RW,
+      .readfn = icc_igrpen1_el3_read,
+      .writefn = icc_igrpen1_el3_write,
+    },
+    REGINFO_SENTINEL
+};
+
+static void gicv3_cpuif_el_change_hook(ARMCPU *cpu, void *opaque)
+{
+    /* Do nothing for now. */
+}
+
+void gicv3_init_cpuif(GICv3State *s)
+{
+    /* Called from the GICv3 realize function; register our system
+     * registers with the CPU
+     */
+    int i;
+
+    for (i = 0; i < s->num_cpu; i++) {
+        ARMCPU *cpu = ARM_CPU(qemu_get_cpu(i));
+        GICv3CPUState *cs = &s->cpu[i];
+
+        /* Note that we can't just use the GICv3CPUState as an opaque pointer
+         * in define_arm_cp_regs_with_opaque(), because when we're called back
+         * it might be with code translated by CPU 0 but run by CPU 1, in
+         * which case we'd get the wrong value.
+         * So instead we define the regs with no ri->opaque info, and
+         * get back to the GICv3CPUState from the ARMCPU by reading back
+         * the opaque pointer from the el_change_hook, which we're going
+         * to need to register anyway.
+         */
+        define_arm_cp_regs(cpu, gicv3_cpuif_reginfo);
+        arm_register_el_change_hook(cpu, gicv3_cpuif_el_change_hook, cs);
+    }
+}
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 9ba1caf..fa9d7a0 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -211,6 +211,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs);
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
+void gicv3_init_cpuif(GICv3State *s);
 
 /**
  * gicv3_cpuif_update:
diff --git a/trace-events b/trace-events
index 319783f..592caf2 100644
--- a/trace-events
+++ b/trace-events
@@ -1910,6 +1910,22 @@ aspeed_vic_update_irq(int flags) "Raising IRQ: %d"
 aspeed_vic_read(uint64_t offset, unsigned size, uint32_t value) "From 0x%" PRIx64 " of size %u: 0x%" PRIx32
 aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
 
+# hw/intc/arm_gicv3_cpuif.c
+gicv3_icc_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR read cpu %x value 0x%" PRIx64
+gicv3_icc_pmr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR write cpu %x value 0x%" PRIx64
+gicv3_icc_bpr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_BPR read cpu %x value 0x%" PRIx64
+gicv3_icc_bpr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_BPR write cpu %x value 0x%" PRIx64
+gicv3_icc_ap_read(int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR read cpu %x value 0x%" PRIx64
+gicv3_icc_ap_write(int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR write cpu %x value 0x%" PRIx64
+gicv3_icc_igrpen_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN read cpu %x value 0x%" PRIx64
+gicv3_icc_igrpen_write(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN write cpu %x value 0x%" PRIx64
+gicv3_icc_igrpen1_el3_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN1_EL3 read cpu %x value 0x%" PRIx64
+gicv3_icc_igrpen1_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN1_EL3 write cpu %x value 0x%" PRIx64
+gicv3_icc_ctlr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR read cpu %x value 0x%" PRIx64
+gicv3_icc_ctlr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR write cpu %x value 0x%" PRIx64
+gicv3_icc_ctlr_el3_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 read cpu %x value 0x%" PRIx64
+gicv3_icc_ctlr_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 write cpu %x value 0x%" PRIx64
+
 # hw/intc/arm_gicv3_dist.c
 gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
 gicv3_dist_badread(uint64_t offset, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " size %u secure %d: error"
-- 
1.9.1


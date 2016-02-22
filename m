Received: by 10.25.208.211 with SMTP id h202csp1392855lfg;
        Mon, 22 Feb 2016 13:08:38 -0800 (PST)
X-Received: by 10.141.4.135 with SMTP id g129mr40084353qhd.31.1456175318177;
        Mon, 22 Feb 2016 13:08:38 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x7si31123931qhc.113.2016.02.22.13.08.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 13:08:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51992 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXxif-0001MT-4h
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 16:08:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxgE-0005Rs-4I
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 16:06:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxg9-0004Da-3r
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 16:06:06 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:55906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXxg8-0004CT-OJ; Mon, 22 Feb 2016 16:06:01 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXx2t-0001Qq-Gc; Mon, 22 Feb 2016 20:25:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 20:25:18 +0000
Message-Id: <1456172720-12650-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
References: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>, qemu-arm@nongnu.org,
	Pavel Fedin <p.fedin@samsung.com>
Subject: [Qemu-devel] [RFC 3/5] hw/intc/arm_gicv3_kvm: Implement get/put
	functions
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
X-TUID: SPpK/a60QO/k

From: Pavel Fedin <p.fedin@samsung.com>

This actually implements pre_save and post_load methods for in-kernel
vGICv3.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
[PMM:
 * use decimal, not 0bnnn
 * fixed typo in names of ICC_APR0R_EL1 and ICC_AP1R_EL1
 * completely rearranged the get and put functions to read and write
   the state in a natural order, rather than mixing distributor and
   redistributor state together]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_kvm.c | 437 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 433 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 90c7950..b674b01 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -22,8 +22,11 @@
 #include "qemu/osdep.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/sysbus.h"
+#include "migration/migration.h"
+#include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
+#include "gicv3_internal.h"
 #include "vgic_common.h"
 
 #ifdef DEBUG_GICV3_KVM
@@ -42,6 +45,23 @@
 #define KVM_ARM_GICV3_GET_CLASS(obj) \
      OBJECT_GET_CLASS(KVMARMGICv3Class, (obj), TYPE_KVM_ARM_GICV3)
 
+#define ICC_PMR_EL1     \
+    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 4, 6, 0)
+#define ICC_BPR0_EL1    \
+    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 8, 3)
+#define ICC_AP0R_EL1(n) \
+    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 8, 4 | n)
+#define ICC_AP1R_EL1(n) \
+    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 9, n)
+#define ICC_BPR1_EL1    \
+    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 3)
+#define ICC_CTLR_EL1    \
+    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 4)
+#define ICC_IGRPEN0_EL1 \
+    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 6)
+#define ICC_IGRPEN1_EL1 \
+    KVM_DEV_ARM_VGIC_SYSREG(3, 0, 12, 12, 7)
+
 typedef struct KVMARMGICv3Class {
     ARMGICv3CommonClass parent_class;
     DeviceRealize parent_realize;
@@ -55,16 +75,412 @@ static void kvm_arm_gicv3_set_irq(void *opaque, int irq, int level)
     kvm_arm_gic_set_irq(s->num_irq, irq, level);
 }
 
+#define VGIC_CPUID(cpuid) ((((cpuid) & ARM_AFF3_MASK) >> 8) | \
+                           ((cpuid) & ARM32_AFFINITY_MASK))
+#define KVM_VGIC_ATTR(reg, cpuid) \
+    ((VGIC_CPUID(cpuid) << KVM_DEV_ARM_VGIC_CPUID_SHIFT) | (reg))
+
+static inline void kvm_gicd_access(GICv3State *s, int offset,
+                                   uint64_t *val, bool write)
+{
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+                      KVM_VGIC_ATTR(offset, 0),
+                      val, write);
+}
+
+static inline void kvm_gicr_access(GICv3State *s, int offset, int cpu,
+                                   uint64_t *val, bool write)
+{
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_REDIST_REGS,
+                      KVM_VGIC_ATTR(offset, s->cpu[cpu].affinity_id),
+                      val, write);
+}
+
+static inline void kvm_gicc_access(GICv3State *s, uint64_t reg, int cpu,
+                                   uint64_t *val, bool write)
+{
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+                      KVM_VGIC_ATTR(reg, s->cpu[cpu].affinity_id),
+                      val, write);
+}
+
+/*
+ * Translate from the in-kernel field for an IRQ value to/from the qemu
+ * representation. Note that these are only expected to be used for
+ * SPIs (that is, for interrupts whose state is in the distributor
+ * rather than the redistributor).
+ */
+typedef void (*vgic_translate_fn)(GICv3State *s, int irq,
+                                  uint32_t *field, bool to_kernel);
+
+/* synthetic translate function used for clear/set registers to completely
+ * clear a setting using a clear-register before setting the remaining bits
+ * using a set-register */
+static void translate_clear(GICv3State *s, int irq,
+                            uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {
+        *field = ~0;
+    } else {
+        /* does not make sense: qemu model doesn't use set/clear regs */
+        abort();
+    }
+}
+
+#define GIC_BMP_TRANSLATE_FN(BMP) \
+    static void translate_##BMP(GICv3State *s, int irq, \
+                                uint32_t *field, bool to_kernel) \
+    {                                                            \
+    if (to_kernel) {                                             \
+        *field = gicv3_gicd_##BMP##_test(s, irq);                \
+    } else {                                                     \
+        gicv3_gicd_##BMP##_replace(s, irq, *field);              \
+    }                                                            \
+}
+
+GIC_BMP_TRANSLATE_FN(group)
+GIC_BMP_TRANSLATE_FN(enabled)
+GIC_BMP_TRANSLATE_FN(active)
+GIC_BMP_TRANSLATE_FN(edge_trigger)
+
+static void translate_pending(GICv3State *s, int irq,
+                              uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {
+        *field = gicv3_gicd_pending_test(s, irq);
+    } else {
+        gicv3_gicd_pending_replace(s, irq, *field);
+        /* TODO: Capture if level-line is held high in the kernel */
+    }
+}
+static void translate_priority(GICv3State *s, int irq,
+                               uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {
+        *field = s->gicd_ipriority[irq - GIC_INTERNAL];
+    } else {
+        s->gicd_ipriority[irq - GIC_INTERNAL] = *field;
+    }
+}
+
+/* Loop through each distributor IRQ related register; since bits
+ * corresponding to SPIs and PPIs are RAZ/WI when affinity routing
+ * is enabled, we skip those.
+ */
+#define for_each_dist_irq_reg(_irq, _max, _field_width) \
+    for (_irq = GIC_INTERNAL; _irq < _max; _irq += (32 / _field_width))
+
+/* Read a register group from the kernel VGIC */
+static void kvm_dist_get(GICv3State *s, uint32_t offset, int width,
+                         vgic_translate_fn translate_fn)
+{
+    uint64_t reg;
+    int j;
+    int irq;
+    uint32_t field;
+    int regsz = 32 / width; /* irqs per kernel register */
+
+    for_each_dist_irq_reg(irq, s->num_irq, width) {
+        kvm_gicd_access(s, offset, &reg, false);
+
+        for (j = 0; j < regsz; j++) {
+            field = extract32(reg, j * width, width);
+            translate_fn(s, irq + j, &field, false);
+        }
+        offset += 4;
+    }
+}
+
+/* Write a register group to the kernel VGIC */
+static void kvm_dist_put(GICv3State *s, uint32_t offset, int width,
+                         vgic_translate_fn translate_fn)
+{
+    uint64_t reg;
+    int j;
+    int irq;
+    uint32_t field;
+    int regsz = 32 / width; /* irqs per kernel register */
+
+    for_each_dist_irq_reg(irq, s->num_irq, width) {
+        reg = 0;
+        for (j = 0; j < regsz; j++) {
+            translate_fn(s, irq + j, &field, true);
+            reg = deposit32(reg, j * width, width, field);
+        }
+        kvm_gicd_access(s, offset, &reg, true);
+        offset += 4;
+    }
+}
+
+static void kvm_arm_gicv3_check(GICv3State *s)
+{
+    uint64_t reg;
+    uint32_t num_irq;
+
+    /* Sanity checking s->num_irq */
+    kvm_gicd_access(s, GICD_TYPER, &reg, false);
+    num_irq = ((reg & 0x1f) + 1) * 32;
+
+    if (num_irq < s->num_irq) {
+        error_report("Model requests %u IRQs, but kernel supports max %u\n",
+                     s->num_irq, num_irq);
+        abort();
+    }
+
+    /* TODO: Consider checking compatibility with the IIDR ? */
+}
+
 static void kvm_arm_gicv3_put(GICv3State *s)
 {
-    /* TODO */
-    DPRINTF("Cannot put kernel gic state, no kernel interface\n");
+    uint64_t reg, redist_typer;
+    int ncpu, i;
+
+    kvm_arm_gicv3_check(s);
+
+    kvm_gicr_access(s, GICR_TYPER, 0, &redist_typer, false);
+
+    reg = s->gicd_ctlr;
+    kvm_gicd_access(s, GICD_CTLR, &reg, true);
+
+    if (redist_typer & GICR_TYPER_PLPIS) {
+        /* Set base addresses before LPIs are enabled by GICR_CTLR write */
+        for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+            GICv3CPUState *c = &s->cpu[ncpu];
+
+            reg = c->gicr_propbaser;
+            kvm_gicr_access(s, GICR_PROPBASER, ncpu, &reg, true);
+
+            reg = c->gicr_pendbaser;
+            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
+                /* Setting PTZ is advised if LPIs are disabled, to reduce
+                 * GIC initialization time.
+                 */
+                reg |= GICR_PENDBASER_PTZ;
+            }
+            kvm_gicr_access(s, GICR_PENDBASER, ncpu, &reg, true);
+        }
+    }
+
+    /* Redistributor state (one per CPU) */
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        reg = c->gicr_ctlr;
+        kvm_gicr_access(s, GICR_CTLR, ncpu, &reg, true);
+
+        reg = c->gicr_waker;
+        kvm_gicr_access(s, GICR_WAKER, ncpu, &reg, true);
+
+        reg = c->gicr_igroupr0;
+        kvm_gicr_access(s, GICR_IGROUPR0, ncpu, &reg, true);
+
+        reg = ~0;
+        kvm_gicr_access(s, GICR_ICENABLER0, ncpu, &reg, true);
+        reg = c->gicr_ienabler0;
+        kvm_gicr_access(s, GICR_ISENABLER0, ncpu, &reg, true);
+
+        /* Restore config before pending so we treat level/edge correctly */
+        reg = c->gicr_icfgr0;
+        kvm_gicr_access(s, GICR_ICFGR0, ncpu, &reg, true);
+        reg = c->gicr_icfgr1;
+        kvm_gicr_access(s, GICR_ICFGR1, ncpu, &reg, true);
+
+        reg = ~0;
+        kvm_gicr_access(s, GICR_ICPENDR0, ncpu, &reg, true);
+        // FIXME do we need the hack here for mixing level with pending ?
+        reg = c->gicr_ipendr0;
+        kvm_gicr_access(s, GICR_ISPENDR0, ncpu, &reg, true);
+
+        reg = ~0;
+        kvm_gicr_access(s, GICR_ICACTIVER0, ncpu, &reg, true);
+        reg = c->gicr_iactiver0;
+        kvm_gicr_access(s, GICR_ISACTIVER0, ncpu, &reg, true);
+
+        for (i = 0; i < GIC_INTERNAL; i += 4) {
+            reg = c->gicr_ipriorityr[i] |
+                (c->gicr_ipriorityr[i + 1] << 8) |
+                (c->gicr_ipriorityr[i + 2] << 16) |
+                (c->gicr_ipriorityr[i + 3] << 24);
+            kvm_gicr_access(s, GICR_IPRIORITYR0 + i, ncpu, &reg, true);
+        }
+    }
+
+    /* Distributor state (shared between all CPUs */
+
+    /* s->enable bitmap -> GICD_ISENABLERn */
+    kvm_dist_put(s, GICD_ICENABLER, 1, translate_clear);
+    kvm_dist_put(s, GICD_ISENABLER, 1, translate_enabled);
+
+    /* s->group bitmap -> GICD_IGROUPRn */
+    kvm_dist_put(s, GICD_IGROUPR, 1, translate_group);
+
+    /* Restore targets before pending to ensure the pending state is set on
+     * the appropriate CPU interfaces in the kernel
+     */
+
+    /* s->gicd_irouter[irq] -> GICD_IROUTERn
+     * We can't use kvm_dist_put() here because the registers are 64-bit
+     */
+    for (i = GIC_INTERNAL; i < s->num_irq; i++) {
+        uint32_t offset = GICD_IROUTER + (sizeof(uint64_t) * i);
+
+        kvm_gicd_access(s, offset, &s->gicd_irouter[i - GIC_INTERNAL], true);
+    }
+
+    /* s->trigger bitmap -> GICD_ICFGRn
+     * (restore configuration registers before pending IRQs so we treat
+     * level/edge correctly)
+     */
+    kvm_dist_put(s, GICD_ICFGR, 2, translate_edge_trigger);
+
+    /* s->pending bitmap + s->level bitmap -> GICD_ISPENDRn */
+    kvm_dist_put(s, GICD_ICPENDR, 1, translate_clear);
+    kvm_dist_put(s, GICD_ISPENDR, 1, translate_pending);
+
+    /* s->active bitmap -> GICD_ISACTIVERn */
+    kvm_dist_put(s, GICD_ICACTIVER, 1, translate_clear);
+    kvm_dist_put(s, GICD_ISACTIVER, 1, translate_active);
+
+    /* s->gicd_ipriority[] -> GICD_IPRIORITYRn */
+    kvm_dist_put(s, GICD_IPRIORITYR, 8, translate_priority);
+
+    /* CPU Interface state (one per CPU) */
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu, &c->icc_ctlr_el1[1], true);
+        kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu, &c->icc_igrpen0_el1, true);
+        kvm_gicc_access(s, ICC_IGRPEN1_EL1, ncpu, &c->icc_igrpen1_el1, true);
+        kvm_gicc_access(s, ICC_PMR_EL1, ncpu, &c->icc_pmr_el1, true);
+        kvm_gicc_access(s, ICC_BPR0_EL1, ncpu, &c->icc_bpr[0], true);
+        kvm_gicc_access(s, ICC_BPR1_EL1, ncpu, &c->icc_bpr[1], true);
+
+        for (i = 0; i < 4; i++) {
+            reg = c->icc_ap1r[i][0];
+            kvm_gicc_access(s, ICC_AP0R_EL1(i), ncpu, &reg, true);
+        }
+
+        for (i = 0; i < 4; i++) {
+            reg = c->icc_ap1r[i][1];
+            kvm_gicc_access(s, ICC_AP1R_EL1(i), ncpu, &reg, true);
+        }
+    }
 }
 
 static void kvm_arm_gicv3_get(GICv3State *s)
 {
-    /* TODO */
-    DPRINTF("Cannot get kernel gic state, no kernel interface\n");
+    uint64_t reg, redist_typer;
+    int ncpu, i;
+
+    kvm_arm_gicv3_check(s);
+
+    kvm_gicr_access(s, GICR_TYPER, 0, &redist_typer, false);
+
+    kvm_gicd_access(s, GICD_CTLR, &reg, false);
+    s->gicd_ctlr = reg;
+
+    /* Redistributor state (one per CPU) */
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        kvm_gicr_access(s, GICR_CTLR, ncpu, &reg, false);
+        c->gicr_ctlr = reg;
+
+        kvm_gicr_access(s, GICR_WAKER, ncpu, &reg, false);
+        c->gicr_waker = reg;
+
+        kvm_gicr_access(s, GICR_IGROUPR0, ncpu, &reg, false);
+        c->gicr_igroupr0 = reg;
+        kvm_gicr_access(s, GICR_ISENABLER0, ncpu, &reg, false);
+        c->gicr_ienabler0 = reg;
+        kvm_gicr_access(s, GICR_ICFGR0, ncpu, &reg, false);
+        c->gicr_icfgr0 = reg;
+        kvm_gicr_access(s, GICR_ICFGR1, ncpu, &reg, false);
+        c->gicr_icfgr1 = reg;
+        kvm_gicr_access(s, GICR_ISPENDR0, ncpu, &reg, false);
+        c->gicr_ipendr0 = reg;
+        kvm_gicr_access(s, GICR_ISACTIVER0, ncpu, &reg, false);
+        c->gicr_iactiver0 = reg;
+
+        for (i = 0; i < GIC_INTERNAL; i += 4) {
+            kvm_gicr_access(s, GICR_IPRIORITYR0 + i, ncpu, &reg, false);
+            c->gicr_ipriorityr[i] = extract32(reg, 0, 8);
+            c->gicr_ipriorityr[i + 1] = extract32(reg, 8, 8);
+            c->gicr_ipriorityr[i + 2] = extract32(reg, 16, 8);
+            c->gicr_ipriorityr[i + 3] = extract32(reg, 24, 8);
+        }
+    }
+
+    if (redist_typer & GICR_TYPER_PLPIS) {
+        for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+            GICv3CPUState *c = &s->cpu[ncpu];
+
+            kvm_gicr_access(s, GICR_PROPBASER, ncpu, &reg, false);
+            c->gicr_propbaser = reg;
+
+            kvm_gicr_access(s, GICR_PENDBASER, ncpu, &reg, false);
+            c->gicr_pendbaser = reg;
+        }
+    }
+
+    /* Distributor state (shared between all CPUs */
+
+    /* GICD_IIDR -> ?   FIXME */
+    /* kvm_gicd_access(s, GICD_IIDR, 0, &reg, false); */
+
+    /* GICD_IGROUPRn -> s->group bitmap */
+    kvm_dist_get(s, GICD_IGROUPR, 1, translate_group);
+
+    /* GICD_ISENABLERn -> s->enabled bitmap */
+    kvm_dist_get(s, GICD_ISENABLER, 1, translate_enabled);
+
+    /* GICD_ISPENDRn -> s->pending + s->level bitmap */
+    kvm_dist_get(s, GICD_ISPENDR, 1, translate_pending);
+
+    /* GICD_ISACTIVERn -> s->active bitmap */
+    kvm_dist_get(s, GICD_ISACTIVER, 1, translate_active);
+
+    /* GICD_ICFRn -> s->trigger bitmap */
+    kvm_dist_get(s, GICD_ICFGR, 2, translate_edge_trigger);
+
+    /* GICD_IPRIORITYRn -> s->gicd_ipriority[] */
+    kvm_dist_get(s, GICD_IPRIORITYR, 8, translate_priority);
+
+    /* GICD_IROUTERn -> s->gicd_irouter[irq] */
+    for (i = GIC_INTERNAL; i < s->num_irq; i++) {
+        uint32_t offset = GICD_IROUTER + (sizeof(reg) * i);
+
+        kvm_gicd_access(s, offset, &reg, false);
+        s->gicd_irouter[i - GIC_INTERNAL] = reg;
+    }
+
+    /*****************************************************************
+     * CPU Interface(s) State
+     */
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu, &c->icc_ctlr_el1[1], false);
+        kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu, &c->icc_igrpen0_el1, false);
+        kvm_gicc_access(s, ICC_IGRPEN1_EL1, ncpu, &c->icc_igrpen1_el1, false);
+        kvm_gicc_access(s, ICC_PMR_EL1, ncpu, &c->icc_pmr_el1, false);
+        kvm_gicc_access(s, ICC_BPR0_EL1, ncpu, &c->icc_bpr[0], false);
+        kvm_gicc_access(s, ICC_BPR1_EL1, ncpu, &c->icc_bpr[1], false);
+
+        for (i = 0; i < 4; i++) {
+            kvm_gicc_access(s, ICC_AP0R_EL1(i), ncpu, &reg, false);
+            c->icc_ap1r[i][0] = reg;
+        }
+
+        for (i = 0; i < 4; i++) {
+            kvm_gicc_access(s, ICC_AP1R_EL1(i), ncpu, &reg, false);
+            c->icc_ap1r[i][1] = reg;
+        }
+    }
 }
 
 static void kvm_arm_gicv3_reset(DeviceState *dev)
@@ -75,6 +491,12 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
     DPRINTF("Reset\n");
 
     kgc->parent_reset(dev);
+
+    if (s->migration_blocker) {
+        DPRINTF("Cannot put kernel gic state, no kernel interface\n");
+        return;
+    }
+
     kvm_arm_gicv3_put(s);
 }
 
@@ -118,6 +540,13 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
                             KVM_VGIC_V3_ADDR_TYPE_DIST, s->dev_fd);
     kvm_arm_register_device(&s->iomem_redist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
+
+    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+                               GICD_CTLR)) {
+        error_setg(&s->migration_blocker, "This operating system kernel does "
+                                          "not support vGICv3 migration");
+        migrate_add_blocker(s->migration_blocker);
+    }
 }
 
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
-- 
1.9.1


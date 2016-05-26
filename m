Received: by 10.25.30.65 with SMTP id e62csp557265lfe;
        Thu, 26 May 2016 08:39:49 -0700 (PDT)
X-Received: by 10.233.232.213 with SMTP id a204mr9529524qkg.25.1464277189079;
        Thu, 26 May 2016 08:39:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l10si4237828qgf.111.2016.05.26.08.39.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 08:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5xO0-0005Cz-Bf
	for alex.bennee@linaro.org; Thu, 26 May 2016 11:39:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5xAA-0007ON-CZ
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:25:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5xA7-0004km-10
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:25:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5xA6-0004ke-HY; Thu, 26 May 2016 11:25:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whX-0004BC-QL; Thu, 26 May 2016 15:55:55 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:40 +0100
Message-Id: <1464274540-19693-23-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 22/22] RFC: hw/intc/arm_gicv3_kvm: Implement
 get/put functions
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
X-TUID: NhFPfjwxYcv+

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

FIXME: the kernel API is not final yet, so this can't be committed yet.
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_kvm.c | 452 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 442 insertions(+), 10 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index d08808d..87d096e 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -23,8 +23,11 @@
 #include "qapi/error.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/sysbus.h"
+#include "migration/migration.h"
+#include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "kvm_arm.h"
+#include "gicv3_internal.h"
 #include "vgic_common.h"
 
 #ifdef DEBUG_GICV3_KVM
@@ -43,6 +46,23 @@
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
@@ -56,16 +76,422 @@ static void kvm_arm_gicv3_set_irq(void *opaque, int irq, int level)
     kvm_arm_gic_set_irq(s->num_irq, irq, level);
 }
 
+#define KVM_VGIC_ATTR(reg, typer) \
+    ((typer & 0xFFFFFFFF00000000ULL) | (reg))
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
+                      KVM_VGIC_ATTR(offset, s->cpu[cpu].gicr_typer),
+                      val, write);
+}
+
+static inline void kvm_gicc_access(GICv3State *s, uint64_t reg, int cpu,
+                                   uint64_t *val, bool write)
+{
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+                      KVM_VGIC_ATTR(reg, s->cpu[cpu].gicr_typer),
+                      val, write);
+}
+
+/* Translate from the in-kernel field for an IRQ value to/from the qemu
+ * representation. Note that these are only expected to be used for
+ * SPIs (that is, for interrupts whose state is in the distributor
+ * rather than the redistributor).
+ */
+typedef void (*vgic_translate_fn)(GICv3State *s, int irq,
+                                  uint32_t *field, bool to_kernel);
+
+static void translate_edge_trigger(GICv3State *s, int irq,
+    uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {                                             \
+        *field = gicv3_gicd_edge_trigger_test(s, irq);           \
+    } else {                                                     \
+        gicv3_gicd_edge_trigger_replace(s, irq, *field);         \
+    }                                                            \
+}
+
+static void translate_priority(GICv3State *s, int irq,
+                               uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {
+        *field = s->gicd_ipriority[irq];
+    } else {
+        s->gicd_ipriority[irq] = *field;
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
+/* Read a bitmap register group from the kernel VGIC. */
+static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
+{
+    uint64_t reg;
+    int irq;
+
+    for_each_dist_irq_reg(irq, s->num_irq, 1) {
+        kvm_gicd_access(s, offset, &reg, false);
+        *gic_bmp_ptr32(bmp, irq) = reg;
+        offset += 4;
+    }
+}
+
+static void kvm_dist_putbmp(GICv3State *s, uint32_t offset,
+                            uint32_t clroffset, uint32_t *bmp)
+{
+    uint64_t reg;
+    int irq;
+
+    for_each_dist_irq_reg(irq, s->num_irq, 1) {
+        /* If this bitmap is a set/clear register pair, first write to the
+         * clear-reg to clear all bits before using the set-reg to write
+         * the 1 bits.
+         */
+        if (clroffset != 0) {
+            reg = 0;
+            kvm_gicd_access(s, clroffset, &reg, true);
+        }
+        reg = *gic_bmp_ptr32(bmp, irq);
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
+        error_report("Model requests %u IRQs, but kernel supports max %u",
+                     s->num_irq, num_irq);
+        abort();
+    }
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
+        reg = c->gicr_statusr[GICV3_NS];
+        kvm_gicr_access(s, GICR_STATUSR, ncpu, &reg, true);
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
+        reg = half_shuffle32(c->edge_trigger >> 16) << 1;
+        kvm_gicr_access(s, GICR_ICFGR1, ncpu, &reg, true);
+
+        // TODO: there is no kernel API for reading/writing c->level
+
+        reg = ~0;
+        kvm_gicr_access(s, GICR_ICPENDR0, ncpu, &reg, true);
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
+            kvm_gicr_access(s, GICR_IPRIORITYR + i, ncpu, &reg, true);
+        }
+    }
+
+    /* Distributor state (shared between all CPUs */
+
+    reg = s->gicd_statusr[GICV3_NS];
+    kvm_gicd_access(s, GICD_STATUSR, &reg, true);
+
+    /* s->enable bitmap -> GICD_ISENABLERn */
+    kvm_dist_putbmp(s, GICD_ISENABLER, GICD_ICENABLER, s->enabled);
+
+    /* s->group bitmap -> GICD_IGROUPRn */
+    kvm_dist_putbmp(s, GICD_IGROUPR, 0, s->group);
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
+        kvm_gicd_access(s, offset, &s->gicd_irouter[i], true);
+    }
+
+    /* s->trigger bitmap -> GICD_ICFGRn
+     * (restore configuration registers before pending IRQs so we treat
+     * level/edge correctly)
+     */
+    kvm_dist_put(s, GICD_ICFGR, 2, translate_edge_trigger);
+
+    // TODO: there is no kernel API for reading/writing s->level
+
+    /* s->pending bitmap -> GICD_ISPENDRn */
+    kvm_dist_putbmp(s, GICD_ISPENDR, GICD_ICPENDR, s->pending);
+
+    /* s->active bitmap -> GICD_ISACTIVERn */
+    kvm_dist_putbmp(s, GICD_ISACTIVER, GICD_ICACTIVER, s->active);
+
+    /* s->gicd_ipriority[] -> GICD_IPRIORITYRn */
+    kvm_dist_put(s, GICD_IPRIORITYR, 8, translate_priority);
+
+    /* CPU Interface state (one per CPU) */
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
+                        &c->icc_ctlr_el1[GICV3_NS], true);
+        kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu,
+                        &c->icc_igrpen[GICV3_G0], true);
+        kvm_gicc_access(s, ICC_IGRPEN1_EL1, ncpu,
+                        &c->icc_igrpen[GICV3_G1NS], true);
+        kvm_gicc_access(s, ICC_PMR_EL1, ncpu, &c->icc_pmr_el1, true);
+        kvm_gicc_access(s, ICC_BPR0_EL1, ncpu, &c->icc_bpr[GICV3_G0], true);
+        kvm_gicc_access(s, ICC_BPR1_EL1, ncpu, &c->icc_bpr[GICV3_G1NS], true);
+
+        for (i = 0; i < 4; i++) {
+            reg = c->icc_apr[GICV3_G0][i];
+            kvm_gicc_access(s, ICC_AP0R_EL1(i), ncpu, &reg, true);
+        }
+
+        for (i = 0; i < 4; i++) {
+            reg = c->icc_apr[GICV3_G1NS][i];
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
+        kvm_gicr_access(s, GICR_STATUSR, ncpu, &reg, false);
+        c->gicr_statusr[GICV3_NS] = reg;
+
+        kvm_gicr_access(s, GICR_WAKER, ncpu, &reg, false);
+        c->gicr_waker = reg;
+
+        kvm_gicr_access(s, GICR_IGROUPR0, ncpu, &reg, false);
+        c->gicr_igroupr0 = reg;
+        kvm_gicr_access(s, GICR_ISENABLER0, ncpu, &reg, false);
+        c->gicr_ienabler0 = reg;
+        kvm_gicr_access(s, GICR_ICFGR1, ncpu, &reg, false);
+        c->edge_trigger = half_unshuffle32(reg >> 1) << 16;
+        kvm_gicr_access(s, GICR_ISPENDR0, ncpu, &reg, false);
+        c->gicr_ipendr0 = reg;
+        kvm_gicr_access(s, GICR_ISACTIVER0, ncpu, &reg, false);
+        c->gicr_iactiver0 = reg;
+
+        for (i = 0; i < GIC_INTERNAL; i += 4) {
+            kvm_gicr_access(s, GICR_IPRIORITYR + i, ncpu, &reg, false);
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
+    kvm_gicd_access(s, GICD_STATUSR, &reg, false);
+    s->gicd_statusr[GICV3_NS] = reg;
+
+    /* GICD_IGROUPRn -> s->group bitmap */
+    kvm_dist_getbmp(s, GICD_IGROUPR, s->group);
+
+    /* GICD_ISENABLERn -> s->enabled bitmap */
+    kvm_dist_getbmp(s, GICD_ISENABLER, s->enabled);
+
+    /* GICD_ISPENDRn -> s->pending bitmap */
+    kvm_dist_getbmp(s, GICD_ISPENDR, s->pending);
+
+    /* GICD_ISACTIVERn -> s->active bitmap */
+    kvm_dist_getbmp(s, GICD_ISACTIVER, s->active);
+
+    /* GICD_ICFGRn -> s->trigger bitmap */
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
+        s->gicd_irouter[i] = reg;
+    }
+
+    /*****************************************************************
+     * CPU Interface(s) State
+     */
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu,
+                        &c->icc_ctlr_el1[GICV3_NS], false);
+        kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu,
+                        &c->icc_igrpen[GICV3_G0], false);
+        kvm_gicc_access(s, ICC_IGRPEN1_EL1, ncpu,
+                        &c->icc_igrpen[GICV3_G1NS], false);
+        kvm_gicc_access(s, ICC_PMR_EL1, ncpu, &c->icc_pmr_el1, false);
+        kvm_gicc_access(s, ICC_BPR0_EL1, ncpu, &c->icc_bpr[GICV3_G0], false);
+        kvm_gicc_access(s, ICC_BPR1_EL1, ncpu, &c->icc_bpr[GICV3_G1NS], false);
+
+        for (i = 0; i < 4; i++) {
+            kvm_gicc_access(s, ICC_AP0R_EL1(i), ncpu, &reg, false);
+            c->icc_apr[0][i] = reg;
+        }
+
+        for (i = 0; i < 4; i++) {
+            kvm_gicc_access(s, ICC_AP1R_EL1(i), ncpu, &reg, false);
+            c->icc_apr[1][i] = reg;
+        }
+    }
 }
 
 static void kvm_arm_gicv3_reset(DeviceState *dev)
@@ -76,6 +502,12 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
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
 
@@ -120,12 +552,12 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
     kvm_arm_register_device(&s->iomem_redist, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
                             KVM_VGIC_V3_ADDR_TYPE_REDIST, s->dev_fd);
 
-    /* Block migration of a KVM GICv3 device: the API for saving and restoring
-     * the state in the kernel is not yet finalised in the kernel or
-     * implemented in QEMU.
-     */
-    error_setg(&s->migration_blocker, "vGICv3 migration is not implemented");
-    migrate_add_blocker(s->migration_blocker);
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


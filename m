Received: by 10.25.21.156 with SMTP id 28csp273700lfv;
        Wed, 24 Aug 2016 04:26:06 -0700 (PDT)
X-Received: by 10.237.39.34 with SMTP id n31mr2716106qtd.55.1472037966848;
        Wed, 24 Aug 2016 04:26:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h189si6019510qkc.0.2016.08.24.04.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Aug 2016 04:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bcWJq-0004GV-7f
	for alex.bennee@linaro.org; Wed, 24 Aug 2016 07:26:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcWJj-0004DN-2A
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 07:26:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bcWJe-00058Y-VA
	for qemu-arm@nongnu.org; Wed, 24 Aug 2016 07:25:59 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35205)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bcWJe-00058O-Jd; Wed, 24 Aug 2016 07:25:54 -0400
Received: by mail-pf0-f195.google.com with SMTP id h186so1072377pfg.2;
	Wed, 24 Aug 2016 04:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ub7ZU46bgk8QEZUKbqNn/ljSXP6Xnkn53TW11/PQ3wY=;
	b=lyE4GSitd+rxO5HXRjzlAmNIU/7euVYjQ3EclU6uG8wJ8JKlwmnYjhAh+EmKSLUScF
	3G4R6ahSq9NL4AS43Ysom10gWl67TlLBbo1IYpdCmUJ3mqa2IwQNA9FQHxLoBQPt/K+W
	JK43hVFDr95sE8YUuYowWhNokwJA9mT4VTLof219EQo2CgcwRpnBT8SDnmxQlUxFvIXf
	a5QKN3J7Vr04TombLlYxzQa7yq733eoSJRzX6gHgkabNP+uGnxazhu82E+CXCGJ96xMd
	G++2sPpMKaOX7fG+SrVLhrWVCd5uWnQqKkB83j6LI3Q0b8QZgJKqYkdxh2LoGG2AGnnu
	N5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ub7ZU46bgk8QEZUKbqNn/ljSXP6Xnkn53TW11/PQ3wY=;
	b=e1mixdXM+oERJzf2e4qlCOBDePH0G7DUHUKNdKvvzrF3cznuoXfrb5y87mttbbszU+
	qYuovWZgrgFmySw6RDwwq+ikGKq2pVN/nSqv1nC1GhWnzbKYaiIDyjUSTFe7wk8X1Rpo
	fnYS1NUF2lX1wZg/ite782EPtT/bL7DeBRVTSBMjzr+rXcPOGT/neqmHKJiZeTb0cv+u
	qxLLz06/m3DXs2eOh41+yPJleyC6+GvDTTfhJxgwFGTqKcnYV3YHp47RPUku4Gzu6032
	/FRsXI7CqebJP+2ItIEr8F0aXEXYe9Wu+pti+qxTXMbYBnk1ANnNmjgEQz4qQNyvfHsf
	wung==
X-Gm-Message-State: AE9vXwM1COHf/jgZ6yk2XbZAzkAfYAYM46ffiJ4xazbm4jKWjX+codu1gQ2al+Nun27fJw==
X-Received: by 10.98.36.134 with SMTP id k6mr4642594pfk.116.1472037893811;
	Wed, 24 Aug 2016 04:24:53 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	p187sm12919193pfb.5.2016.08.24.04.24.50
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Aug 2016 04:24:53 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Wed, 24 Aug 2016 16:54:34 +0530
Message-Id: <1472037874-4356-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1472037874-4356-1-git-send-email-vijay.kilari@gmail.com>
References: <1472037874-4356-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.195
Subject: [Qemu-arm] [RFC PATCH v3 2/2] hw/intc/arm_gicv3_kvm: Implement
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
Cc: p.fedin@samsung.com, qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4/ro+FQ6qZVB

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This actually implements pre_save and post_load methods for in-kernel
vGICv3.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
[PMM:
 * use decimal, not 0bnnn
 * fixed typo in names of ICC_APR0R_EL1 and ICC_AP1R_EL1
 * completely rearranged the get and put functions to read and write
   the state in a natural order, rather than mixing distributor and
   redistributor state together]
Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
[Vijay:
 * Update macro KVM_VGIC_ATTR
 * Use 32 bit access for gicd and gicr
 * GICD_IROUTER, GICD_TYPER, GICR_PROPBASER and GICR_PENDBASER reg
   access  are changed from 64-bit to 32-bit access
 * s->edge_trigger stores only even bits value of an irq config.
   Update translate_edge_trigger() accordingly.
 * Drop GICR_SGI_OFFSET for GICR* registers address]
---
 hw/intc/arm_gicv3_kvm.c  | 518 ++++++++++++++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h |  29 ++-
 2 files changed, 520 insertions(+), 27 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 711fde3..24ba41e 100644
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
 #include "migration/migration.h"
 
@@ -44,6 +47,23 @@
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
@@ -57,16 +77,488 @@ static void kvm_arm_gicv3_set_irq(void *opaque, int irq, int level)
     kvm_arm_gic_set_irq(s->num_irq, irq, level);
 }
 
+#define KVM_VGIC_ATTR(reg, typer) \
+    ((typer & KVM_DEV_ARM_VGIC_V3_CPUID_MASK) | (reg))
+
+static inline void kvm_gicd_access(GICv3State *s, int offset,
+                                   uint32_t *val, bool write)
+{
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+                      KVM_VGIC_ATTR(offset, 0),
+                      val, write);
+}
+
+static inline void kvm_gicr_access(GICv3State *s, int offset, int cpu,
+                                   uint32_t *val, bool write)
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
+static inline void kvm_gic_line_level_access(GICv3State *s, int irq, int cpu,
+                                             uint32_t *val, bool write)
+{
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO,
+                      KVM_VGIC_ATTR(irq, s->cpu[cpu].gicr_typer) |
+                      (KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_VAL <<
+                       KVM_DEV_ARM_VGIC_LINE_LEVEL_INFO_SHIFT),
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
+    /*
+     * s->edge_trigger stores only even bits value of an irq config.
+     * Consider only even bits and translate accordingly.
+     */
+    if (to_kernel) {
+        *field = gicv3_gicd_edge_trigger_test(s, irq);
+        *field = (*field << 1) & 3;
+    } else {
+        *field = (*field >> 1) & 1;
+        gicv3_gicd_edge_trigger_replace(s, irq, *field);
+    }
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
+    uint32_t reg;
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
+    uint32_t reg;
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
+static void kvm_gic_get_line_level_bmp(GICv3State *s, uint32_t *bmp)
+{
+    uint32_t reg;
+    int irq;
+
+    for_each_dist_irq_reg(irq, s->num_irq, 1) {
+        kvm_gic_line_level_access(s, irq, 0, &reg, false);
+        *gic_bmp_ptr32(bmp, irq) = reg;
+    }
+}
+
+static void kvm_gic_put_line_level_bmp(GICv3State *s, uint32_t *bmp)
+{
+    uint32_t reg;
+    int irq;
+
+    for_each_dist_irq_reg(irq, s->num_irq, 1) {
+        reg = *gic_bmp_ptr32(bmp, irq);
+        kvm_gic_line_level_access(s, irq, 0, &reg, true);
+    }
+}
+
+/* Read a bitmap register group from the kernel VGIC. */
+static void kvm_dist_getbmp(GICv3State *s, uint32_t offset, uint32_t *bmp)
+{
+    uint32_t reg;
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
+    uint32_t reg;
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
+    uint32_t reg;
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
+    uint32_t regl, regh, reg;
+    uint64_t reg64, redist_typer;
+    int ncpu, i;
+
+    kvm_arm_gicv3_check(s);
+
+    kvm_gicr_access(s, GICR_TYPER, 0, &regl, false);
+    kvm_gicr_access(s, GICR_TYPER + 4, 0, &regh, false);
+    redist_typer = ((uint64_t)regh << 32) | regl;
+
+    reg = s->gicd_ctlr;
+    kvm_gicd_access(s, GICD_CTLR, &reg, true);
+
+    if (redist_typer & GICR_TYPER_PLPIS) {
+        /* Set base addresses before LPIs are enabled by GICR_CTLR write */
+        for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+            GICv3CPUState *c = &s->cpu[ncpu];
+
+            reg64 = c->gicr_propbaser;
+            regl = (uint32_t)reg64;
+            kvm_gicr_access(s, GICR_PROPBASER, ncpu, &regl, true);
+            regh = (uint32_t)(reg64 >> 32);
+            kvm_gicr_access(s, GICR_PROPBASER + 4, ncpu, &regh, true);
+
+            reg64 = c->gicr_pendbaser;
+            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
+                /* Setting PTZ is advised if LPIs are disabled, to reduce
+                 * GIC initialization time.
+                 */
+                reg64 |= GICR_PENDBASER_PTZ;
+            }
+            regl = (uint32_t)reg64;
+            kvm_gicr_access(s, GICR_PENDBASER, ncpu, &regl, true);
+            regh = (uint32_t)(reg64 >> 32);
+            kvm_gicr_access(s, GICR_PENDBASER + 4, ncpu, &regh, true);
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
+        reg = c->level;
+        kvm_gic_line_level_access(s, 0, ncpu, &reg, true);
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
+        uint32_t offset;
+
+        offset = GICD_IROUTER + (sizeof(uint32_t) * i);
+        reg = (uint32_t)s->gicd_irouter[i];
+        kvm_gicd_access(s, offset, &reg, true);
+
+        offset = GICD_IROUTER + (sizeof(uint32_t) * i) + 4;
+        reg = (uint32_t)(s->gicd_irouter[i] >> 32);
+        kvm_gicd_access(s, offset, &reg, true);
+    }
+
+    /* s->trigger bitmap -> GICD_ICFGRn
+     * (restore configuration registers before pending IRQs so we treat
+     * level/edge correctly)
+     */
+    kvm_dist_put(s, GICD_ICFGR, 2, translate_edge_trigger);
+
+    /* s->level bitmap ->  line_level */
+    kvm_gic_put_line_level_bmp(s, s->level);
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
+            reg64 = c->icc_apr[GICV3_G0][i];
+            kvm_gicc_access(s, ICC_AP0R_EL1(i), ncpu, &reg64, true);
+        }
+
+        for (i = 0; i < 4; i++) {
+            reg64 = c->icc_apr[GICV3_G1NS][i];
+            kvm_gicc_access(s, ICC_AP1R_EL1(i), ncpu, &reg64, true);
+        }
+    }
 }
 
 static void kvm_arm_gicv3_get(GICv3State *s)
 {
-    /* TODO */
-    DPRINTF("Cannot get kernel gic state, no kernel interface\n");
+    uint32_t regl, regh, reg;
+    uint64_t reg64, redist_typer;
+    int ncpu, i;
+
+    kvm_arm_gicv3_check(s);
+
+    kvm_gicr_access(s, GICR_TYPER, 0, &regl, false);
+    kvm_gicr_access(s, GICR_TYPER + 4, 0, &regh, false);
+    redist_typer = ((uint64_t)regh << 32) | regl;
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
+        kvm_gic_line_level_access(s, 0, ncpu, &reg, false);
+        c->level = reg;
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
+            kvm_gicr_access(s, GICR_PROPBASER, ncpu, &regl, false);
+            kvm_gicr_access(s, GICR_PROPBASER + 4, ncpu, &regh, false);
+            c->gicr_propbaser = ((uint64_t)regh << 32) | regl;
+
+            kvm_gicr_access(s, GICR_PENDBASER, ncpu, &regl, false);
+            kvm_gicr_access(s, GICR_PENDBASER + 4, ncpu, &regh, false);
+            c->gicr_pendbaser = ((uint64_t)regh << 32) | regl;
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
+    /* Line level of irq */
+    kvm_gic_get_line_level_bmp(s, s->level);
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
+        uint32_t offset;
+
+        offset = GICD_IROUTER + (sizeof(uint32_t) * i);
+        kvm_gicd_access(s, offset, &regl, false);
+        offset = GICD_IROUTER + (sizeof(uint32_t) * i) + 4;
+        kvm_gicd_access(s, offset, &regh, false);
+        s->gicd_irouter[i] = ((uint64_t)regh << 32) | regl;
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
+            kvm_gicc_access(s, ICC_AP0R_EL1(i), ncpu, &reg64, false);
+            c->icc_apr[0][i] = reg64;
+        }
+
+        for (i = 0; i < 4; i++) {
+            kvm_gicc_access(s, ICC_AP1R_EL1(i), ncpu, &reg64, false);
+            c->icc_apr[1][i] = reg64;
+        }
+    }
 }
 
 static void kvm_arm_gicv3_reset(DeviceState *dev)
@@ -77,6 +569,12 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
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
 
@@ -121,12 +619,12 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
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
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 8f3567e..dfdec2f 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -68,11 +68,6 @@
 #define GICD_CTLR_RWP               (1U << 31)
 
 /*
- * Redistributor frame offsets from RD_base
- */
-#define GICR_SGI_OFFSET 0x10000
-
-/*
  * Redistributor registers, offsets from RD_base
  */
 #define GICR_CTLR             0x0000
@@ -90,18 +85,18 @@
 #define GICR_IDREGS           0xFFD0
 
 /* SGI and PPI Redistributor registers, offsets from RD_base */
-#define GICR_IGROUPR0         (GICR_SGI_OFFSET + 0x0080)
-#define GICR_ISENABLER0       (GICR_SGI_OFFSET + 0x0100)
-#define GICR_ICENABLER0       (GICR_SGI_OFFSET + 0x0180)
-#define GICR_ISPENDR0         (GICR_SGI_OFFSET + 0x0200)
-#define GICR_ICPENDR0         (GICR_SGI_OFFSET + 0x0280)
-#define GICR_ISACTIVER0       (GICR_SGI_OFFSET + 0x0300)
-#define GICR_ICACTIVER0       (GICR_SGI_OFFSET + 0x0380)
-#define GICR_IPRIORITYR       (GICR_SGI_OFFSET + 0x0400)
-#define GICR_ICFGR0           (GICR_SGI_OFFSET + 0x0C00)
-#define GICR_ICFGR1           (GICR_SGI_OFFSET + 0x0C04)
-#define GICR_IGRPMODR0        (GICR_SGI_OFFSET + 0x0D00)
-#define GICR_NSACR            (GICR_SGI_OFFSET + 0x0E00)
+#define GICR_IGROUPR0         0x0080
+#define GICR_ISENABLER0       0x0100
+#define GICR_ICENABLER0       0x0180
+#define GICR_ISPENDR0         0x0200
+#define GICR_ICPENDR0         0x0280
+#define GICR_ISACTIVER0       0x0300
+#define GICR_ICACTIVER0       0x0380
+#define GICR_IPRIORITYR       0x0400
+#define GICR_ICFGR0           0x0C00
+#define GICR_ICFGR1           0x0C04
+#define GICR_IGRPMODR0        0x0D00
+#define GICR_NSACR            0x0E00
 
 #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
 #define GICR_CTLR_RWP                (1U << 3)
-- 
1.9.1


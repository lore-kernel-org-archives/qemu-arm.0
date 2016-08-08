Received: by 10.25.21.156 with SMTP id 28csp103634lfv;
        Mon, 8 Aug 2016 09:53:40 -0700 (PDT)
X-Received: by 10.55.33.80 with SMTP id h77mr3999395qkh.133.1470675220892;
        Mon, 08 Aug 2016 09:53:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 98si17891604qky.217.2016.08.08.09.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Aug 2016 09:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bWno4-0002dn-9Z
	for alex.bennee@linaro.org; Mon, 08 Aug 2016 12:53:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bWnmP-00010I-3v
	for qemu-devel@nongnu.org; Mon, 08 Aug 2016 12:52:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bWnmL-0004Re-Rs
	for qemu-devel@nongnu.org; Mon, 08 Aug 2016 12:51:56 -0400
Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244]:36807)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bWnmG-0004RB-No; Mon, 08 Aug 2016 12:51:49 -0400
Received: by mail-pa0-x244.google.com with SMTP id ez1so24280904pab.3;
	Mon, 08 Aug 2016 09:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mSynlGHtsW0I0S7Cgh8C8pdWulkj6DvM/JYB7kUu8Is=;
	b=Dto1W/IqhmhYJeuBVra70UmVr57CtHU3/G5NdTwyLCGOGQDSUzzmC0FZ+wwLoV5cml
	8Hg+tkd60NI/GRJe07T6KSwW/HuUbmMK+HrGyt0/AqN1ipV+nSovsVTxBMgaBaNTEkt5
	SfJEEy0BUlWUBB2icGMwd9QPwzsPORXdbLi18CNspE2TDI3+HkniFuDrrLuMmyTfCvRj
	PNZkLWPZaa7G+hsjkOW0B/dIh/b0apUSY+9sjBy5ezN5T9ZUTGL4lysIUcS8wh4XO267
	wq+DsxDIzCRlfTG6JsWCN4GxbgPrPxkyvI/srihj/0NuUpaoYtNy9iZZWgdk7+q+KFi3
	AZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mSynlGHtsW0I0S7Cgh8C8pdWulkj6DvM/JYB7kUu8Is=;
	b=I7l8/TkIvEjVVS2vIdqtphq1aDh64OoDHJscJUVe92iNtE6BkQpk8G4v6o6RuzltPT
	kLEMLbGPYHASCnVkI9dC7z04DW2WstSlnY9n4Oe4BMjriqF/BEm2kE1pkh5xyTxItDwc
	RYi/tccOe3pYcrSi+nFTuGnE6txUaJw/JMQlpmS6C72ZkV7bTKrpw2zere7PpyRQaOHg
	nL/xcc52vjzd0oD/oTB08gE8kxW/f+HmdUYwYWtLUs5lJPU2ejp/DAK/x6sFUuJCDBvp
	kNixuNiFg4p4MD4A5a/HnnwKSOKw0eFqAG1Cn8tK++CtYrgcN5HeuKQTjrK8UTT1SUfR
	gBbw==
X-Gm-Message-State: AEkoous+2t53Iu3h/D2PCFy/7PJP47CxV0U7DOcfznArvhp5Zp/ljCrstJ2XlLKGzVhCjw==
X-Received: by 10.66.189.199 with SMTP id gk7mr166173807pac.158.1470675107634; 
	Mon, 08 Aug 2016 09:51:47 -0700 (PDT)
Received: from localhost.localdomain ([14.140.2.178])
	by smtp.gmail.com with ESMTPSA id 6sm40282916pab.11.2016.08.08.09.51.43
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:51:46 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Mon,  8 Aug 2016 22:21:11 +0530
Message-Id: <1470675071-23677-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1470675071-23677-1-git-send-email-vijay.kilari@gmail.com>
References: <1470675071-23677-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::244
Subject: [Qemu-devel] [RFC PATCH v2 2/2] hw/intc/arm_gicv3_kvm: Implement
 get/put functions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Prasun.Kapoor@cavium.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	vijay.kilari@gmail.com, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V0Hwqw62UQ4s

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
   access  are changed from 64-bit to 32-bit access]
---
 hw/intc/arm_gicv3_kvm.c | 474 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 464 insertions(+), 10 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 711fde3..0f84c86 100644
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
@@ -57,16 +77,444 @@ static void kvm_arm_gicv3_set_irq(void *opaque, int irq, int level)
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
@@ -77,6 +525,12 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
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
 
@@ -121,12 +575,12 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
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


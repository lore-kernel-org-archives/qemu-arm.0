Received: by 10.25.21.156 with SMTP id 28csp1645130lfv;
        Tue, 26 Jul 2016 04:02:49 -0700 (PDT)
X-Received: by 10.55.217.89 with SMTP id u86mr28729268qki.114.1469530969836;
        Tue, 26 Jul 2016 04:02:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j1si117935qkf.317.2016.07.26.04.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 04:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS08P-0008J7-7B
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 07:02:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bS08D-0008Dz-5O
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:02:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bS088-0002qa-C0
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:02:35 -0400
Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243]:36325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bS087-0002qS-RX; Tue, 26 Jul 2016 07:02:32 -0400
Received: by mail-pa0-x243.google.com with SMTP id ez1so13124801pab.3;
	Tue, 26 Jul 2016 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2Z+i+1rWSOTAJ6RP+JHv/YetJQnPdSqvRWZSE3hjrek=;
	b=X25oWh/IaLB8TmWs3VFqsQibbzCOV3kswgEH4csOJpbmYxDsUlGdAvdmUAKjF6IBfO
	D/wKjsKsaChTh1jD/fAhaPjlvsv2pWd15V6/XOt9PBU/TMVlJohEt1+QhLKZDkULpGzJ
	Suj8kDwow5IeZPl2PCupIZHqNtJcHYugeixk6qRL3mdUFmtujQlXBoecpP1ilEwfGg9M
	rggKUFUNLM94ieI57gzck2V4A1QwNa9O3ccXnfsXSP04TqMtYoYdoa8OO5h9tPywqfyC
	Zqv8YbhA6QE7ljhWxXwxn4cS7ODsE26LnjGynhPk9R75fPkIVcZ3B9ZaCkPFi6rFjxXa
	UTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2Z+i+1rWSOTAJ6RP+JHv/YetJQnPdSqvRWZSE3hjrek=;
	b=EtntrUwbV0J2w0LMFB15/BAabBuyr9I69GTO8GvR3uqM/fI+ZXTrtLDQfF2EJmG5XW
	8e2JB0fsmaDzsOyj7JVOVhp8XLG8fos8IEO39JHV0Q52AKDh1hEwfZAdCbxK4kJnusLc
	1Q438AAWuBXPHcjE6kqzFQnRQdR6lyum+0OEMALwV5RQFVL8PxG5+zyRMGY8m95/pKa7
	15IbLKdL7h2dR1+QUIqx5eVjqlNLnzfQHrePwayLAUKqkHjX31lljWSNsx8bNnpP6Bcn
	WcGvOIN0dOGOyFCP1fZQsKjM8l133EWpJfJuHgnj/qGzef03UKxIghrIZtCejFpohRH5
	nYpA==
X-Gm-Message-State: AEkooutVhhhGChuVNHiqueN8rzO/nvPOZwq4BJCDwjXXwirWfnIXbLSVnrBKaYchs+APOw==
X-Received: by 10.66.181.139 with SMTP id dw11mr38579524pac.2.1469530950610;
	Tue, 26 Jul 2016 04:02:30 -0700 (PDT)
Received: from cavium-Vostro-2520.caveonetworks.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id b7sm584826pat.27.2016.07.26.04.02.27
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jul 2016 04:02:30 -0700 (PDT)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	pbonzini@redhat.com
Date: Tue, 26 Jul 2016 16:31:56 +0530
Message-Id: <1469530917-13842-3-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1469530917-13842-1-git-send-email-vijay.kilari@gmail.com>
References: <1469530917-13842-1-git-send-email-vijay.kilari@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::243
Subject: [Qemu-arm] [RFC PATCH v1 2/2] hw/intc/arm_gicv3_kvm: Implement
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
Cc: Prasun.Kapoor@cavium.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	vijay.kilari@gmail.com, Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: De/TXs4/pTRi

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

This actually implements pre_save and post_load methods for in-kernel
vGICv3.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
[Vijay: - Adjusted macros to handle gicr variables
 - Used gicr_typer for affinity
 - Made all GICD/GICR registers access as 32-bit.
 - All ICC register access as 64 bit.
 ]
---
 hw/intc/arm_gicv3_common.c         |    3 +
 hw/intc/arm_gicv3_kvm.c            |  496 +++++++++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           |  113 ++++++++
 include/hw/intc/arm_gicv3_common.h |    1 +
 4 files changed, 607 insertions(+), 6 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 0f8c4b8..55102f7 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -54,6 +54,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     .version_id = 1,
     .minimum_version_id = 1,
     .fields = (VMStateField[]) {
+        VMSTATE_BOOL(cpu_enabled, GICv3CPUState),
         VMSTATE_UINT32(level, GICv3CPUState),
         VMSTATE_UINT32(gicr_ctlr, GICv3CPUState),
         VMSTATE_UINT32_ARRAY(gicr_statusr, GICv3CPUState, 2),
@@ -64,6 +65,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
         VMSTATE_UINT32(gicr_ienabler0, GICv3CPUState),
         VMSTATE_UINT32(gicr_ipendr0, GICv3CPUState),
         VMSTATE_UINT32(gicr_iactiver0, GICv3CPUState),
+        VMSTATE_UINT32(level, GICv3CPUState),
         VMSTATE_UINT32(edge_trigger, GICv3CPUState),
         VMSTATE_UINT32(gicr_igrpmodr0, GICv3CPUState),
         VMSTATE_UINT32(gicr_nsacr, GICv3CPUState),
@@ -220,6 +222,7 @@ static void arm_gicv3_common_reset(DeviceState *dev)
     for (i = 0; i < s->num_cpu; i++) {
         GICv3CPUState *cs = &s->cpu[i];
 
+        cs->cpu_enabled = false;
         cs->level = 0;
         cs->gicr_ctlr = 0;
         cs->gicr_statusr[GICV3_S] = 0;
diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 711fde3..9b35165 100644
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
+    KVM_DEV_ARM_VGIC_SYSREG(0b11, 0b000, 0b0100, 0b0110, 0b000)
+#define ICC_BPR0_EL1    \
+    KVM_DEV_ARM_VGIC_SYSREG(0b11, 0b000, 0b1100, 0b1000, 0b011)
+#define ICC_APR0_EL1(n) \
+    KVM_DEV_ARM_VGIC_SYSREG(0b11, 0b000, 0b1100, 0b1000, 0b100 | n)
+#define ICC_APR1_EL1(n) \
+    KVM_DEV_ARM_VGIC_SYSREG(0b11, 0b000, 0b1100, 0b1001, 0b000 | n)
+#define ICC_BPR1_EL1    \
+    KVM_DEV_ARM_VGIC_SYSREG(0b11, 0b000, 0b1100, 0b1100, 0b011)
+#define ICC_CTLR_EL1    \
+    KVM_DEV_ARM_VGIC_SYSREG(0b11, 0b000, 0b1100, 0b1100, 0b100)
+#define ICC_IGRPEN0_EL1 \
+    KVM_DEV_ARM_VGIC_SYSREG(0b11, 0b000, 0b1100, 0b1100, 0b110)
+#define ICC_IGRPEN1_EL1 \
+    KVM_DEV_ARM_VGIC_SYSREG(0b11, 0b000, 0b1100, 0b1100, 0b111)
+
 typedef struct KVMARMGICv3Class {
     ARMGICv3CommonClass parent_class;
     DeviceRealize parent_realize;
@@ -57,16 +77,469 @@ static void kvm_arm_gicv3_set_irq(void *opaque, int irq, int level)
     kvm_arm_gic_set_irq(s->num_irq, irq, level);
 }
 
+#define KVM_VGIC_ATTR(reg, cpuaff) \
+    ((cpuaff << KVM_DEV_ARM_VGIC_CPUID_SHIFT) | (reg))
+
+static inline void kvm_gicd_access(GICv3State *s, int offset, int cpu,
+                                   uint32_t *val, bool write)
+{
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+           KVM_VGIC_ATTR(offset, ((s->cpu[cpu].gicr_typer >> 32) & 0xffffffff)),
+           val, write);
+}
+
+static inline void kvm_gicr_access(GICv3State *s, int offset, int cpu,
+                                   uint32_t *val, bool write)
+{
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_REDIST_REGS,
+           KVM_VGIC_ATTR(offset, ((s->cpu[cpu].gicr_typer >> 32) & 0xffffffff)),
+           val, write);
+}
+
+static inline void kvm_gicc_access(GICv3State *s, uint64_t reg, int cpu,
+                                   uint64_t *val, bool write)
+{
+    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
+           KVM_VGIC_ATTR(reg, ((s->cpu[cpu].gicr_typer >> 32) & 0xffffffff)),
+           val, write);
+}
+
+/*
+ * Translate from the in-kernel field for an IRQ value to/from the qemu
+ * representation.
+ */
+typedef void (*vgic_translate_fn)(GICv3State *s, int irq, int cpu,
+                                  uint32_t *field, bool to_kernel);
+
+/* synthetic translate function used for clear/set registers to completely
+ * clear a setting using a clear-register before setting the remaining bits
+ * using a set-register */
+static void translate_clear(GICv3State *s, int irq, int cpu,
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
+static void translate_enabled(GICv3State *s, int irq, int cpu,
+                              uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {
+        *field = GIC_TEST_ENABLED(irq, cpu);
+    } else {
+        GIC_REPLACE_ENABLED(irq, cpu, *field);
+    }
+}
+
+static void translate_group(GICv3State *s, int irq, int cpu,
+                            uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {
+        *field = GIC_TEST_GROUP(irq, cpu);
+    } else {
+        GIC_REPLACE_GROUP(irq, cpu, *field);
+    }
+}
+
+static void translate_trigger(GICv3State *s, int irq, int cpu,
+                              uint32_t *field, bool to_kernel)
+{
+    bool val;
+    if (to_kernel) {
+        val = GIC_TEST_EDGE_TRIGGER(irq, cpu);
+        *field = val ? 2 : 0;
+    } else {
+        GIC_REPLACE_EDGE_TRIGGER(irq, cpu, *field & 2);
+    }
+}
+
+static void translate_pending(GICv3State *s, int irq, int cpu,
+                              uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {
+        *field = gic_test_pending(s, irq, cpu);
+    } else {
+        GIC_REPLACE_PENDING(irq, cpu, *field);
+        /* TODO: Capture if level-line is held high in the kernel */
+    }
+}
+
+static void translate_active(GICv3State *s, int irq, int cpu,
+                             uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {
+        *field = GIC_TEST_ACTIVE(irq, cpu);
+    } else {
+        GIC_REPLACE_ACTIVE(irq, cpu, *field);
+    }
+}
+
+static void translate_priority(GICv3State *s, int irq, int cpu,
+                               uint32_t *field, bool to_kernel)
+{
+    if (to_kernel) {
+        *field = GIC_GET_PRIORITY(irq, cpu);
+    } else {
+        GIC_SET_PRIORITY(irq, cpu, *field);
+    }
+}
+
+#define for_each_irq_reg(_irq, _max, _field_width) \
+    for (_irq = 0; _irq < _max; _irq += (32 / _field_width))
+
+/* Read a register group from the kernel VGIC */
+static void kvm_dist_get(GICv3State *s, uint32_t offset, int width,
+                         vgic_translate_fn translate_fn)
+{
+    uint32_t reg;
+    int j;
+    int irq, cpu, maxcpu;
+    uint32_t field;
+    int regsz = 32 / width; /* irqs per kernel register */
+
+    for_each_irq_reg(irq, s->num_irq, width) {
+        maxcpu = irq < GIC_INTERNAL ? s->num_cpu : 1;
+        for (cpu = 0; cpu < maxcpu; cpu++) {
+            /* In GICv3 SGI/PPIs are stored in redistributor
+             * Offsets in SGI area are the same as in distributor
+             */
+            if (irq < GIC_INTERNAL) {
+                kvm_gicr_access(s, offset, cpu, &reg, false);
+            } else {
+                kvm_gicd_access(s, offset, cpu, &reg, false);
+            }
+            for (j = 0; j < regsz; j++) {
+                field = extract32(reg, j * width, width);
+                translate_fn(s, irq + j, cpu, &field, false);
+            }
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
+    int irq, cpu, maxcpu;
+    uint32_t field;
+    int regsz = 32 / width; /* irqs per kernel register */
+
+    for_each_irq_reg(irq, s->num_irq, width) {
+        maxcpu = irq < GIC_INTERNAL ? s->num_cpu : 1;
+        for (cpu = 0; cpu < maxcpu; cpu++) {
+            reg = 0;
+            for (j = 0; j < regsz; j++) {
+                translate_fn(s, irq + j, cpu, &field, true);
+                reg = deposit32(reg, j * width, width, field);
+            }
+            /* In GICv3 SGI/PPIs are stored in redistributor
+             * Offsets in SGI area are the same as in distributor
+             */
+            if (irq < GIC_INTERNAL) {
+                kvm_gicr_access(s, offset, cpu, &reg, true);
+            } else {
+                kvm_gicd_access(s, offset, cpu, &reg, true);
+            }
+        }
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
+    kvm_gicd_access(s, GICD_TYPER, 0, &reg, false);
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
+    uint32_t regl, regh, reg32;
+    uint64_t reg64, redist_typer;
+    int ncpu, i;
+
+    kvm_arm_gicv3_check(s);
+
+    kvm_gicr_access(s, GICR_TYPER, 0, &regl, false);
+    kvm_gicr_access(s, GICR_TYPER + 4, 0, &regh, false);
+
+    redist_typer = ((uint64_t)regh << 32) | regl;
+    /*
+     * (Re)distributor State
+     */
+
+    reg32 = s->gicd_ctlr;
+    kvm_gicd_access(s, GICD_CTLR, 0, &reg32, true);
+
+    if (redist_typer & GICR_TYPER_PLPIS) {
+        /* Set base addresses before LPIs are enabled by GICR_CTLR write */
+        for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+            GICv3CPUState *c = &s->cpu[ncpu];
+
+            reg64 = c->gicr_propbaser &
+                                 (GICR_PROPBASER_OUTER_CACHEABILITY_MASK |
+                                  GICR_PROPBASER_ADDR_MASK |
+                                  GICR_PROPBASER_SHAREABILITY_MASK |
+                                  GICR_PROPBASER_CACHEABILITY_MASK |
+                                  GICR_PROPBASER_IDBITS_MASK);
+            regl = (uint32_t)reg64;
+            kvm_gicr_access(s, GICR_PROPBASER, ncpu, &regl, true);
+            regh = (uint32_t)(reg64 >> 32);
+            kvm_gicr_access(s, GICR_PROPBASER + 4, ncpu, &regh, true);
+
+            reg64 = c->gicr_pendbaser &
+                                 (GICR_PENDBASER_OUTER_CACHEABILITY_MASK |
+                                  GICR_PENDBASER_ADDR_MASK |
+                                  GICR_PENDBASER_SHAREABILITY_MASK |
+                                  GICR_PENDBASER_CACHEABILITY_MASK);
+            if (!c->gicr_ctlr & GICR_CTLR_ENABLE_LPIS) {
+                reg64 |= GICR_PENDBASER_PTZ;
+            }
+            regl = (uint32_t)reg64;
+            kvm_gicr_access(s, GICR_PENDBASER, ncpu, &regl, true);
+            regh = (uint32_t)(reg64 >> 32);
+            kvm_gicr_access(s, GICR_PENDBASER + 4, ncpu, &regh, true);
+        }
+    }
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        reg32 = c->gicr_ctlr & (GICR_CTLR_ENABLE_LPIS | GICR_CTLR_DPG0 |
+                                GICR_CTLR_DPG1NS | GICR_CTLR_DPG1S);
+        kvm_gicr_access(s, GICR_CTLR, ncpu, &reg32, true);
+
+        reg32 = c->cpu_enabled ? 0 : GICR_WAKER_ProcessorSleep;
+        kvm_gicr_access(s, GICR_WAKER, ncpu, &reg32, true);
+    }
+
+    /* irq_state[n].enabled -> GICD_ISENABLERn */
+    kvm_dist_put(s, GICD_ICENABLER, 1, translate_clear);
+    kvm_dist_put(s, GICD_ISENABLER, 1, translate_enabled);
+
+    /* irq_state[n].group -> GICD_IGROUPRn */
+    kvm_dist_put(s, GICD_IGROUPR, 1, translate_group);
+
+    /* Restore targets before pending to ensure the pending state is set on
+     * the appropriate CPU interfaces in the kernel */
+
+    /* s->route[irq] -> GICD_IROUTERn */
+    for (i = GIC_INTERNAL; i < s->num_irq; i++) {
+        uint32_t offset;
+
+        offset = GICD_IROUTER + (sizeof(reg32) * i);
+        reg32 = (uint32_t)s->gicd_irouter[i - GIC_INTERNAL];
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+            KVM_VGIC_ATTR(offset, ((s->cpu[0].gicr_typer >> 32) & 0xffffffff)),
+            &reg32, true);
+        offset = GICD_IROUTER + (sizeof(reg32) * i) + 4;
+        reg32 = (uint32_t)(s->gicd_irouter[i - GIC_INTERNAL] >> 32);
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+            KVM_VGIC_ATTR(offset, ((s->cpu[0].gicr_typer >> 32) & 0xffffffff)),
+            &reg32, true);
+    }
+
+    /* irq_state[n].trigger -> GICD_ICFGRn
+     * (restore configuration registers before pending IRQs so we treat
+     * level/edge correctly) */
+    kvm_dist_put(s, GICD_ICFGR, 2, translate_trigger);
+
+    /* irq_state[n].pending + irq_state[n].level -> GICD_ISPENDRn */
+    kvm_dist_put(s, GICD_ICPENDR, 1, translate_clear);
+    kvm_dist_put(s, GICD_ISPENDR, 1, translate_pending);
+
+    /* irq_state[n].active -> GICD_ISACTIVERn */
+    kvm_dist_put(s, GICD_ICACTIVER, 1, translate_clear);
+    kvm_dist_put(s, GICD_ISACTIVER, 1, translate_active);
+
+    /* s->priorityX[irq] -> ICD_IPRIORITYRn */
+    kvm_dist_put(s, GICD_IPRIORITYR, 8, translate_priority);
+
+    /*
+     * CPU Interface(s) State
+     */
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        reg64 = c->icc_ctlr_el1[GICV3_NS] & (ICC_CTLR_EL1_CBPR |
+                ICC_CTLR_EL1_EOIMODE | ICC_CTLR_EL1_PMHE);
+        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu, &reg64, true);
+
+        reg64 = c->icc_igrpen[GICV3_G0];
+        kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu, &reg64, true);
+
+        reg64 = c->icc_igrpen[GICV3_G1NS];
+        kvm_gicc_access(s, ICC_IGRPEN1_EL1, ncpu, &reg64, true);
+
+        reg64 = c->icc_pmr_el1;
+        kvm_gicc_access(s, ICC_PMR_EL1, ncpu, &reg64, true);
+
+        reg64 = c->icc_bpr[0];
+        kvm_gicc_access(s, ICC_BPR0_EL1, ncpu, &reg64, true);
+
+        reg64 = c->icc_bpr[1];
+        kvm_gicc_access(s, ICC_BPR1_EL1, ncpu, &reg64, true);
+
+        for (i = 0; i < 4; i++) {
+            reg64 = c->icc_apr[i][0];
+            kvm_gicc_access(s, ICC_APR0_EL1(i), ncpu, &reg64, true);
+        }
+
+        for (i = 0; i < 4; i++) {
+            reg64 = c->icc_apr[i][1];
+            kvm_gicc_access(s, ICC_APR1_EL1(i), ncpu, &reg64, true);
+        }
+    }
 }
 
 static void kvm_arm_gicv3_get(GICv3State *s)
 {
-    /* TODO */
-    DPRINTF("Cannot get kernel gic state, no kernel interface\n");
+    uint32_t regl, regh, reg32;
+    uint64_t reg64, redist_typer;
+    int ncpu, i;
+
+    kvm_arm_gicv3_check(s);
+
+    kvm_gicr_access(s, GICR_TYPER, 0, &regl, false);
+    kvm_gicr_access(s, GICR_TYPER + 4, 0, &regh, false);
+
+    redist_typer = ((uint64_t)regh << 32) | regl;
+    /*
+     * (Re)distributor State
+     */
+
+    /* GICD_CTLR -> s->ctlr */
+    kvm_gicd_access(s, GICD_CTLR, 0, &reg32, false);
+    s->gicd_ctlr = reg32;
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        kvm_gicr_access(s, GICR_CTLR, ncpu, &reg32, false);
+        c->gicr_ctlr = reg32 & (GICR_CTLR_ENABLE_LPIS | GICR_CTLR_DPG0 |
+                                GICR_CTLR_DPG1NS | GICR_CTLR_DPG1S);
+
+        kvm_gicr_access(s, GICR_WAKER, ncpu, &reg32, false);
+        c->cpu_enabled = !(reg32 & GICR_WAKER_ProcessorSleep);
+    }
+
+    if (redist_typer & GICR_TYPER_PLPIS) {
+        for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+            GICv3CPUState *c = &s->cpu[ncpu];
+
+            kvm_gicr_access(s, GICR_PROPBASER, ncpu, &regl, false);
+            kvm_gicr_access(s, GICR_PROPBASER + 4, ncpu, &regh, false);
+            reg64 = ((uint64_t)regh << 32) | regl;
+            c->gicr_propbaser = reg64 &
+                                 (GICR_PROPBASER_OUTER_CACHEABILITY_MASK |
+                                  GICR_PROPBASER_ADDR_MASK |
+                                  GICR_PROPBASER_SHAREABILITY_MASK |
+                                  GICR_PROPBASER_CACHEABILITY_MASK |
+                                  GICR_PROPBASER_IDBITS_MASK);
+
+            kvm_gicr_access(s, GICR_PENDBASER, ncpu, &regl, false);
+            kvm_gicr_access(s, GICR_PENDBASER + 4, ncpu, &regh, false);
+            reg64 = ((uint64_t)regh << 32) | regl;
+            c->gicr_pendbaser = reg64 &
+                                 (GICR_PENDBASER_OUTER_CACHEABILITY_MASK |
+                                  GICR_PENDBASER_ADDR_MASK |
+                                  GICR_PENDBASER_SHAREABILITY_MASK |
+                                  GICR_PENDBASER_CACHEABILITY_MASK);
+        }
+    }
+
+    /* GICD_IIDR -> ? */
+    /* kvm_gicd_access(s, GICD_IIDR, 0, &reg, false); */
+
+    /* GICD_IGROUPRn -> irq_state[n].group */
+    kvm_dist_get(s, GICD_IGROUPR, 1, translate_group);
+
+    /* GICD_ISENABLERn -> irq_state[n].enabled */
+    kvm_dist_get(s, GICD_ISENABLER, 1, translate_enabled);
+
+    /* GICD_ISPENDRn -> irq_state[n].pending + irq_state[n].level */
+    kvm_dist_get(s, GICD_ISPENDR, 1, translate_pending);
+
+    /* GICD_ISACTIVERn -> irq_state[n].active */
+    kvm_dist_get(s, GICD_ISACTIVER, 1, translate_active);
+
+    /* GICD_ICFRn -> irq_state[n].trigger */
+    kvm_dist_get(s, GICD_ICFGR, 2, translate_trigger);
+
+    /* GICD_IPRIORITYRn -> s->priorityX[irq] */
+    kvm_dist_get(s, GICD_IPRIORITYR, 8, translate_priority);
+
+    /* GICD_IROUTERn -> s->route[irq] */
+    for (i = GIC_INTERNAL; i < s->num_irq; i++) {
+
+        uint32_t offset;
+
+        offset = GICD_IROUTER + (sizeof(reg32) * i);
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+            KVM_VGIC_ATTR(offset, ((s->cpu[0].gicr_typer >> 32) & 0xffffffff)),
+            &regl, false);
+        offset = GICD_IROUTER + (sizeof(reg32) * i) + 4;
+        kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+            KVM_VGIC_ATTR(offset, ((s->cpu[0].gicr_typer >> 32) & 0xffffffff)),
+            &regh, false);
+        s->gicd_irouter[i - GIC_INTERNAL] = ((uint64_t)regh << 32) | regl;
+    }
+
+    /*
+     * CPU Interface(s) State
+     */
+
+    for (ncpu = 0; ncpu < s->num_cpu; ncpu++) {
+        GICv3CPUState *c = &s->cpu[ncpu];
+
+        kvm_gicc_access(s, ICC_CTLR_EL1, ncpu, &reg64, false);
+        c->icc_ctlr_el1[GICV3_NS] = reg64 & (ICC_CTLR_EL1_CBPR |
+                             ICC_CTLR_EL1_EOIMODE | ICC_CTLR_EL1_PMHE);
+
+        kvm_gicc_access(s, ICC_IGRPEN0_EL1, ncpu, &reg64, false);
+        c->icc_igrpen[GICV3_G0] = reg64;
+
+        kvm_gicc_access(s, ICC_IGRPEN1_EL1, ncpu, &reg64, false);
+        c->icc_igrpen[GICV3_G1NS] = reg64;
+
+        kvm_gicc_access(s, ICC_PMR_EL1, ncpu, &reg64, false);
+        c->icc_pmr_el1 = reg64 & ICC_PMR_PRIORITY_MASK;
+
+        kvm_gicc_access(s, ICC_BPR0_EL1, ncpu, &reg64, false);
+        c->icc_bpr[0] = reg64 & ICC_BPR_BINARYPOINT_MASK;
+
+        kvm_gicc_access(s, ICC_BPR1_EL1, ncpu, &reg64, false);
+        c->icc_bpr[1] = reg64 & ICC_BPR_BINARYPOINT_MASK;
+
+        for (i = 0; i < 4; i++) {
+            kvm_gicc_access(s, ICC_APR0_EL1(i), ncpu, &reg64, false);
+            c->icc_apr[i][0] = reg64;
+        }
+
+        for (i = 0; i < 4; i++) {
+            kvm_gicc_access(s, ICC_APR1_EL1(i), ncpu, &reg64, false);
+            c->icc_apr[i][1] = reg64;
+        }
+    }
 }
 
 static void kvm_arm_gicv3_reset(DeviceState *dev)
@@ -77,6 +550,12 @@ static void kvm_arm_gicv3_reset(DeviceState *dev)
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
 
@@ -125,8 +604,13 @@ static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
      * the state in the kernel is not yet finalised in the kernel or
      * implemented in QEMU.
      */
-    error_setg(&s->migration_blocker, "vGICv3 migration is not implemented");
-    migrate_add_blocker(s->migration_blocker);
+
+    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+                               GICD_CTLR)) {
+        error_setg(&s->migration_blocker, "This operating system kernel does "
+                                          "not support vGICv3 migration");
+        migrate_add_blocker(s->migration_blocker);
+    }
 }
 
 static void kvm_arm_gicv3_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 8f3567e..012a107 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -26,6 +26,119 @@
 
 #include "hw/intc/arm_gicv3_common.h"
 
+/*
+ * Field manipulations
+ */
+#define GIC_CLEAR_BIT(irq, ncpu, gicr_field1, gicd_field2)           \
+    do {                                                             \
+        if ((irq) < GIC_INTERNAL) {                                  \
+            s->cpu[(ncpu)].gicr_field1 &= ~(1 << (irq));             \
+        } else {                                                     \
+            gic_bmp_clear_bit((irq - GIC_INTERNAL), s->gicd_field2); \
+        }                                                            \
+    } while (0)
+#define GIC_SET_BIT(irq, ncpu, gicr_field1, gicd_field2)             \
+    do {                                                             \
+        if ((irq) < GIC_INTERNAL) {                                  \
+            s->cpu[(ncpu)].gicr_field1 |= 1 << (irq);                \
+        } else {                                                     \
+            gic_bmp_set_bit((irq - GIC_INTERNAL), s->gicd_field2);   \
+        }                                                            \
+    } while (0)
+#define GIC_REPLACE_BIT(irq, ncpu, gicr_field1, gicd_field2, val)    \
+    do {                                                             \
+        if (val) {                                                   \
+            GIC_SET_BIT(irq, ncpu, gicr_field1, gicd_field2);        \
+        } else {                                                     \
+            GIC_CLEAR_BIT(irq, ncpu, gicr_field1, gicd_field2);      \
+        }                                                            \
+    } while (0)
+#define GIC_TEST_BIT(irq, ncpu, gicr_field1, gicd_field2)                 \
+    (((irq) < GIC_INTERNAL) ? (s->cpu[(ncpu)].gicr_field1 >> (irq)) & 1 : \
+    gic_bmp_test_bit((irq) - GIC_INTERNAL, s->gicd_field2));
+
+#define GIC_SET_PRIORITY(irq, ncpu, pri)                       \
+    do {                                                       \
+        if ((irq) < GIC_INTERNAL) {                            \
+            s->cpu[(ncpu)].gicr_ipriorityr[(irq)] = (pri);     \
+        } else {                                               \
+            s->gicd_ipriority[(irq) - GIC_INTERNAL] = (pri);   \
+        }                                                      \
+    } while (0)
+#define GIC_GET_PRIORITY(irq, ncpu)                                 \
+    (((irq) < GIC_INTERNAL) ? s->cpu[(ncpu)].gicr_ipriorityr[irq] : \
+     s->gicd_ipriority[(irq) - GIC_INTERNAL])
+
+#define GIC_GET_TARGET(irq, ncpu)                       \
+    (((irq) < GIC_INTERNAL) ? (1 << (ncpu)) :           \
+     s->irq_target[(irq) - GIC_INTERNAL])
+#define GIC_SET_TARGET(irq, cm)                         \
+    do {                                                \
+        if ((irq) >= GIC_INTERNAL) {                    \
+            s->irq_target[(irq - GIC_INTERNAL)] = (cm); \
+        }                                               \
+    } while (0)
+
+#define GIC_SET_GROUP(irq, cpu)    GIC_SET_BIT(irq, cpu, gicr_igroupr0, group)
+#define GIC_CLEAR_GROUP(irq, cpu)  \
+                                 GIC_CLEAR_BIT(irq, cpu, gicr_igroupr0, group)
+#define GIC_REPLACE_GROUP(irq, cpu, val) \
+                          GIC_REPLACE_BIT(irq, cpu, gicr_igroupr0, group, val)
+#define GIC_TEST_GROUP(irq, cpu)   \
+                                  GIC_TEST_BIT(irq, cpu, gicr_igroupr0, group)
+#define GIC_SET_ENABLED(irq, cpu)  \
+                                GIC_SET_BIT(irq, cpu, gicr_ienabler0, enabled)
+#define GIC_CLEAR_ENABLED(irq, cpu) \
+                              GIC_CLEAR_BIT(irq, cpu, gicr_ienabler0, enabled)
+#define GIC_REPLACE_ENABLED(irq, cpu, val) \
+                       GIC_REPLACE_BIT(irq, cpu, gicr_ienabler0, enabled, val)
+#define GIC_TEST_ENABLED(irq, cpu) \
+                               GIC_TEST_BIT(irq, cpu, gicr_ienabler0, enabled)
+#define GIC_SET_PENDING(irq, cpu)  \
+                                  GIC_SET_BIT(irq, cpu, gicr_ipendr0, pending)
+#define GIC_CLEAR_PENDING(irq, cpu) \
+                                GIC_CLEAR_BIT(irq, cpu, gicr_ipendr0, pending)
+#define GIC_CLEAR_PENDING(irq, cpu) \
+                                GIC_CLEAR_BIT(irq, cpu, gicr_ipendr0, pending)
+#define GIC_REPLACE_PENDING(irq, cpu, val) \
+                         GIC_REPLACE_BIT(irq, cpu, gicr_ipendr0, pending, val)
+#define GIC_TEST_PENDING(irq, cpu) \
+                                 GIC_TEST_BIT(irq, cpu, gicr_ipendr0, pending)
+#define GIC_SET_ACTIVE(irq, cpu)   \
+                                 GIC_SET_BIT(irq, cpu, gicr_iactiver0, active)
+#define GIC_CLEAR_ACTIVE(irq, cpu) \
+                               GIC_CLEAR_BIT(irq, cpu, gicr_iactiver0, active)
+#define GIC_REPLACE_ACTIVE(irq, cpu, val) \
+                        GIC_REPLACE_BIT(irq, cpu, gicr_iactiver0, active, val)
+#define GIC_TEST_ACTIVE(irq, cpu)         \
+                                GIC_TEST_BIT(irq, cpu, gicr_iactiver0, active)
+#define GIC_SET_LEVEL(irq, cpu)          GIC_SET_BIT(irq, cpu, level, level)
+#define GIC_CLEAR_LEVEL(irq, cpu)        GIC_CLEAR_BIT(irq, cpu, level, level)
+#define GIC_REPLACE_LEVEL(irq, cpu, val) \
+                                  GIC_REPLACE_BIT(irq, cpu, level, level, val)
+#define GIC_TEST_LEVEL(irq, cpu)         GIC_TEST_BIT(irq, cpu, level, level)
+#define GIC_SET_EDGE_TRIGGER(irq, cpu)   \
+                             GIC_SET_BIT(irq, cpu, edge_trigger, edge_trigger)
+#define GIC_CLEAR_EDGE_TRIGGER(irq, cpu) \
+                           GIC_CLEAR_BIT(irq, cpu, edge_trigger, edge_trigger)
+#define GIC_REPLACE_EDGE_TRIGGER(irq, cpu, val) \
+                    GIC_REPLACE_BIT(irq, cpu, edge_trigger, edge_trigger, val)
+#define GIC_TEST_EDGE_TRIGGER(irq, cpu)  \
+                            GIC_TEST_BIT(irq, cpu, edge_trigger, edge_trigger)
+
+static inline bool gic_test_pending(GICv3State *s, int irq, int cpu)
+{
+    /* Edge-triggered interrupts are marked pending on a rising edge, but
+     * level-triggered interrupts are either considered pending when the
+     * level is active or if software has explicitly written to
+     * GICD_ISPENDR to set the state pending.
+     */
+    bool pending = GIC_TEST_PENDING(irq, cpu);
+    bool trigger = GIC_TEST_EDGE_TRIGGER(irq, cpu);
+    bool level = GIC_TEST_LEVEL(irq, cpu);
+    return pending || (!trigger && level);
+}
+
 /* Distributor registers, as offsets from the distributor base address */
 #define GICD_CTLR            0x0000
 #define GICD_TYPER           0x0004
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 341a311..6a66c8a 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -146,6 +146,7 @@ struct GICv3CPUState {
     qemu_irq parent_irq;
     qemu_irq parent_fiq;
 
+    bool cpu_enabled;
     /* Redistributor */
     uint32_t level;                  /* Current IRQ level */
     /* RD_base page registers */
-- 
1.7.9.5


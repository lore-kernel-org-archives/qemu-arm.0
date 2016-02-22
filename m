Received: by 10.25.208.211 with SMTP id h202csp1392151lfg;
        Mon, 22 Feb 2016 13:06:51 -0800 (PST)
X-Received: by 10.140.19.43 with SMTP id 40mr37431867qgg.72.1456175211546;
        Mon, 22 Feb 2016 13:06:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w9si20539416qhc.10.2016.02.22.13.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 13:06:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXxgw-0006OM-Qw
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 16:06:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxgA-0005LW-R6
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 16:06:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxg8-0004D9-Aw
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 16:06:02 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:55906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXxg7-0004CT-UY; Mon, 22 Feb 2016 16:06:00 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXx2s-0001QU-Iy; Mon, 22 Feb 2016 20:25:26 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 20:25:16 +0000
Message-Id: <1456172720-12650-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
References: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>, qemu-arm@nongnu.org,
	Pavel Fedin <p.fedin@samsung.com>
Subject: [Qemu-devel] [RFC 1/5] hw/intc/arm_gicv3_common: Add state
	information
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
X-TUID: AOEvmzo/gXPg

From: Pavel Fedin <p.fedin@samsung.com>

Add state information to GICv3 object structure and implement
arm_gicv3_common_reset(). Also, add some functions for registers which are
not stored directly but simulated.

State information includes not only pure GICv3 data, but also some legacy
registers. This will be useful for implementing software emulation of GICv3
with v2 backwards compatilibity mode.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
[PMM: significantly overhauled:
 * Add missing qom/cpu.h include
 * Remove legacy-only state fields (we can add them later if/when we add
   legacy emulation)
 * Add various missing register offset #defines
 * Accessor macros removed entirely
 * Fields in state structures renamed to match architectural register names
 * Corrected the reset value for GICR_IENABLER0 since we don't support
   legacy mode
 * Added ARM_LINUX_BOOT_IF interface for "we are directly booting a kernel in
   non-secure" so that we can fake up the firmware-mandated reconfiguration
   only when we need it
]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c         | 116 ++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           | 147 +++++++++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h | 106 +++++++++++++++++++++++++-
 3 files changed, 364 insertions(+), 5 deletions(-)
 create mode 100644 hw/intc/gicv3_internal.h

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index e4f0f5a..a1ce4c1 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -3,8 +3,9 @@
  *
  * Copyright (c) 2012 Linaro Limited
  * Copyright (c) 2015 Huawei.
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
  * Written by Peter Maydell
- * Extended to 64 cores by Shlomo Pongratz
+ * Reworked for GICv3 by Shlomo Pongratz and Pavel Fedin
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -21,7 +22,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "qom/cpu.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "gicv3_internal.h"
+#include "hw/arm/linux-boot-if.h"
 
 static void gicv3_pre_save(void *opaque)
 {
@@ -89,6 +93,8 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
+    Object *cpu;
+    int i;
 
     /* revision property is actually reserved and currently used only in order
      * to keep the interface compatible with GICv2 code, avoiding extra
@@ -99,11 +105,111 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
         error_setg(errp, "unsupported GIC revision %d", s->revision);
         return;
     }
+
+    if (s->num_irq > GICV3_MAXIRQ) {
+        error_setg(errp,
+                   "requested %u interrupt lines exceeds GIC maximum %d",
+                   s->num_irq, GICV3_MAXIRQ);
+        return;
+    }
+
+    s->cpu = g_new0(GICv3CPUState, s->num_cpu);
+
+    for (i = 0; i < s->num_cpu; i++) {
+        cpu = OBJECT(qemu_get_cpu(i));
+        s->cpu[i].affinity_id = object_property_get_int(cpu, "mp-affinity",
+                                                        NULL);
+    }
 }
 
 static void arm_gicv3_common_reset(DeviceState *dev)
 {
-    /* TODO */
+    GICv3State *s = ARM_GICV3_COMMON(dev);
+    int i;
+
+    for (i = 0; i < s->num_cpu; i++) {
+        GICv3CPUState *c = &s->cpu[i];
+
+        c->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
+        c->gicr_ctlr = 0;
+        c->gicr_propbaser = 0;
+        c->gicr_pendbaser = 0;
+        /* If we're resetting a TZ-aware GIC as if secure firmware
+         * had set it up ready to start a kernel in non-secure, we
+         * need to set interrupts to group 1 so the kernel can use them.
+         * Otherwise they reset to group 0 like the hardware.
+         */
+        if (s->security_extn && s->irq_reset_nonsecure) {
+            c->gicr_igroupr0 = 0xffffffff;
+        } else {
+            c->gicr_igroupr0 = 0;
+        }
+
+        c->gicr_ienabler0 = 0;
+        c->gicr_ipendr0 = 0;
+        c->gicr_iactiver0 = 0;
+        c->gicr_icfgr0 = 0xaaaaaaaa;
+        c->gicr_icfgr1 = 0;
+        memset(c->gicr_ipriorityr, 0, sizeof(c->gicr_ipriorityr));
+        c->level = 0;
+
+        c->icc_ctlr_el1[0] = 0;
+        c->icc_ctlr_el1[1] = 0;
+        c->icc_igrpen0_el1 = 0;
+        c->icc_igrpen1_el1 = 0;
+        c->icc_pmr_el1 = 0;
+        c->icc_bpr[0] = GIC_MIN_BPR0;
+        c->icc_bpr[1] = GIC_MIN_BPR1;
+        memset(c->icc_ap1r, 0, sizeof(c->icc_ap1r));
+    }
+
+    memset(s->group, 0, sizeof(s->group));
+    memset(s->enabled, 0, sizeof(s->enabled));
+    memset(s->pending, 0, sizeof(s->pending));
+    memset(s->active, 0, sizeof(s->active));
+    memset(s->level, 0, sizeof(s->level));
+    memset(s->edge_trigger, 0, sizeof(s->edge_trigger));
+
+    /* Workaround! (the same as c->group above) */
+    for (i = GIC_INTERNAL; i < s->num_irq; i++) {
+        set_bit(i - GIC_INTERNAL, s->group);
+    }
+
+    /* By default all interrupts always target CPU #0 */
+    for (i = 0; i < GICV3_MAXSPI; i++) {
+        s->gicd_itargetsr[i] = 1;
+    }
+    memset(s->gicd_irouter, 0, sizeof(s->gicd_irouter));
+    memset(s->gicd_ipriority, 0, sizeof(s->gicd_ipriority));
+
+    /* With all configuration we don't support GICv2 backwards computability */
+    if (s->security_extn) {
+        /* GICv3 5.3.20 With two security So DS is RAZ/WI ARE_NS is RAO/WI
+         * and ARE_S is RAO/WI
+         */
+         s->gicd_ctlr = GICD_CTLR_ARE_S | GICD_CTLR_ARE_NS;
+    } else {
+        /* GICv3 5.3.20 With one security So DS is RAO/WI ARE is RAO/WI
+         */
+        s->gicd_ctlr = GICD_CTLR_DS | GICD_CTLR_ARE;
+    }
+}
+
+static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
+                                      bool secure_boot)
+{
+    GICState *s = ARM_GIC_COMMON(obj);
+
+    if (s->security_extn && !secure_boot) {
+        /* We're directly booting a kernel into NonSecure. If this GIC
+         * implements the security extensions then we must configure it
+         * to have all the interrupts be NonSecure (this is a job that
+         * is done by the Secure boot firmware in real hardware, and in
+         * this mode QEMU is acting as a minimalist firmware-and-bootloader
+         * equivalent).
+         */
+        s->irq_reset_nonsecure = true;
+    }
 }
 
 static Property arm_gicv3_common_properties[] = {
@@ -117,11 +223,13 @@ static Property arm_gicv3_common_properties[] = {
 static void arm_gicv3_common_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ARMLinuxBootIfClass *albifc = ARM_LINUX_BOOT_IF_CLASS(klass);
 
     dc->reset = arm_gicv3_common_reset;
     dc->realize = arm_gicv3_common_realize;
     dc->props = arm_gicv3_common_properties;
     dc->vmsd = &vmstate_gicv3;
+    albifc->arm_linux_init = arm_gic_common_linux_init;
 }
 
 static const TypeInfo arm_gicv3_common_type = {
@@ -131,6 +239,10 @@ static const TypeInfo arm_gicv3_common_type = {
     .class_size = sizeof(ARMGICv3CommonClass),
     .class_init = arm_gicv3_common_class_init,
     .abstract = true,
+    .interfaces = (InterfaceInfo []) {
+        { TYPE_ARM_LINUX_BOOT_IF },
+        { },
+    },
 };
 
 static void register_types(void)
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
new file mode 100644
index 0000000..9f9a45e
--- /dev/null
+++ b/hw/intc/gicv3_internal.h
@@ -0,0 +1,147 @@
+/*
+ * ARM GICv3 support - internal interfaces
+ *
+ * Copyright (c) 2012 Linaro Limited
+ * Copyright (c) 2015 Huawei.
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
+ * Written by Peter Maydell
+ * Reworked for GICv3 by Shlomo Pongratz and Pavel Fedin
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef QEMU_ARM_GICV3_INTERNAL_H
+#define QEMU_ARM_GICV3_INTERNAL_H
+
+#include "hw/intc/arm_gicv3_common.h"
+
+/* Distributor registers, as offsets from the distributor base address */
+#define GICD_CTLR            0x0000
+#define GICD_TYPER           0x0004
+#define GICD_IIDR            0x0008
+#define GICD_STATUSR         0x0010
+#define GICD_SETSPI_NSR      0x0040
+#define GICD_CLRSPI_NSR      0x0048
+#define GICD_SETSPI_SR       0x0050
+#define GICD_CLRSPI_SR       0x0058
+#define GICD_SEIR            0x0068
+#define GICD_IGROUPR         0x0080
+#define GICD_ISENABLER       0x0100
+#define GICD_ICENABLER       0x0180
+#define GICD_ISPENDR         0x0200
+#define GICD_ICPENDR         0x0280
+#define GICD_ISACTIVER       0x0300
+#define GICD_ICACTIVER       0x0380
+#define GICD_IPRIORITYR      0x0400
+#define GICD_ITARGETSR       0x0800
+#define GICD_ICFGR           0x0C00
+#define GICD_IGRPMODR        0x0D00
+#define GICD_NASCR           0x0E00
+#define GICD_SGIR            0x0F00
+#define GICD_CPENDSGIR       0x0F10
+#define GICD_SPENDSGIR       0x0F20
+#define GICD_IROUTER         0x6000
+#define GICD_PIDR2           0xFFE8
+
+/* GICD_CTLR fields  */
+#define GICD_CTLR_EN_GRP0           (1U << 0)
+#define GICD_CTLR_EN_GRP1NS         (1U << 1) /* GICv3 5.3.20 */
+#define GICD_CTLR_EN_GRP1S          (1U << 2)
+#define GICD_CTLR_EN_GRP1_ALL       (GICD_CTLR_EN_GRP1NS | GICD_CTLR_EN_GRP1S)
+/* Bit 4 is ARE if the system doesn't support TrustZone, ARE_S otherwise */
+#define GICD_CTLR_ARE               (1U << 4)
+#define GICD_CTLR_ARE_S             (1U << 4)
+#define GICD_CTLR_ARE_NS            (1U << 5)
+#define GICD_CTLR_DS                (1U << 6)
+#define GICD_CTLR_E1NWF             (1U << 7)
+#define GICD_CTLR_RWP               (1U << 31)
+
+/*
+ * Redistributor frame offsets from RD_base
+ */
+#define GICR_SGI_OFFSET 0x10000
+
+/*
+ * Redistributor registers, offsets from RD_base
+ */
+#define GICR_CTLR             0x0000
+#define GICR_IIDR             0x0004
+#define GICR_TYPER            0x0008
+#define GICR_STATUSR          0x0010
+#define GICR_WAKER            0x0014
+#define GICR_SETLPIR          0x0040
+#define GICR_CLRLPIR          0x0048
+#define GICR_PROPBASER        0x0070
+#define GICR_PENDBASER        0x0078
+#define GICR_INVLPIR          0x00A0
+#define GICR_INVALLR          0x00B0
+#define GICR_SYNCR            0x00C0
+#define GICR_PIDR2            0xFFE8
+
+/* SGI and PPI Redistributor registers, offsets from SGI_base */
+#define GICR_IGROUPR0         0x0080
+#define GICR_ISENABLER0       0x0100
+#define GICR_ICENABLER0       0x0180
+#define GICR_ISPENDR0         0x0200
+#define GICR_ICPENDR0         0x0280
+#define GICR_ISACTIVER0       0x0300
+#define GICR_ICACTIVER0       0x0380
+#define GICR_IPRIORITYR0      0x0400
+#define GICR_ICFGR0           0x0C00
+#define GICR_ICFGR1           0x0C04
+#define GICR_IGRPMODR0        0x0D00
+#define GICR_NSACR            0x0E00
+
+#define GICR_CTLR_ENABLE_LPIS        (1U << 0)
+#define GICR_CTLR_RWP                (1U << 3)
+#define GICR_CTLR_DPG0               (1U << 24)
+#define GICR_CTLR_DPG1NS             (1U << 25)
+#define GICR_CTLR_DPG1S              (1U << 26)
+#define GICR_CTLR_UWP                (1U << 31)
+
+#define GICR_TYPER_PLPIS             (1U << 0)
+#define GICR_TYPER_VLPIS             (1U << 1)
+#define GICR_TYPER_DIRECTLPI         (1U << 3)
+#define GICR_TYPER_LAST              (1U << 4)
+#define GICR_TYPER_DPGS              (1U << 5)
+#define GICR_TYPER_PROCNUM           (0xFFFFU << 8)
+#define GICR_TYPER_COMMONLPIAFF      (0x3 << 24)
+#define GICR_TYPER_AFFINITYVALUE     (0xFFFFFFFFULL << 32)
+
+#define GICR_WAKER_ProcessorSleep    (1U << 1)
+#define GICR_WAKER_ChildrenAsleep    (1U << 2)
+
+#define GICR_PROPBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
+#define GICR_PROPBASER_ADDR_MASK               (0xfffffffffULL << 12)
+#define GICR_PROPBASER_SHAREABILITY_MASK       (3U << 10)
+#define GICR_PROPBASER_CACHEABILITY_MASK       (7U << 7)
+#define GICR_PROPBASER_IDBITS_MASK             (0x1f)
+
+#define GICR_PENDBASER_PTZ                     (1ULL << 62)
+#define GICR_PENDBASER_OUTER_CACHEABILITY_MASK (7ULL << 56)
+#define GICR_PENDBASER_ADDR_MASK               (0xffffffffULL << 16)
+#define GICR_PENDBASER_SHAREABILITY_MASK       (3U << 10)
+#define GICR_PENDBASER_CACHEABILITY_MASK       (7U << 7)
+
+#define ICC_CTLR_EL1_CBPR           (1U << 0)
+#define ICC_CTLR_EL1_EOIMODE        (1U << 1)
+#define ICC_CTLR_EL1_PMHE           (1U << 6)
+#define ICC_CTLR_EL1_SEIS           (1U << 14)
+#define ICC_CTLR_EL1_A3V            (1U << 15)
+
+#define ICC_PMR_PRIORITY_MASK    0xff
+#define ICC_BPR_BINARYPOINT_MASK 0x07
+#define ICC_IGRPEN_ENABLE        0x01
+
+#endif /* !QEMU_ARM_GIC_INTERNAL_H */
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index c2fd8da..84e9406 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -3,8 +3,9 @@
  *
  * Copyright (c) 2012 Linaro Limited
  * Copyright (c) 2015 Huawei.
+ * Copyright (c) 2015 Samsung Electronics Co., Ltd.
  * Written by Peter Maydell
- * Extended to 64 cores by Shlomo Pongratz
+ * Reworked for GICv3 by Shlomo Pongratz and Pavel Fedin
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -26,7 +27,48 @@
 #include "hw/sysbus.h"
 #include "hw/intc/arm_gic_common.h"
 
-typedef struct GICv3State {
+/*
+ * Maximum number of possible interrupts, determined by the GIC architecture.
+ * Note that this does not include LPIs. When implemented, these should be
+ * dealt with separately.
+ */
+#define GICV3_MAXIRQ 1020
+#define GICV3_MAXSPI (GICV3_MAXIRQ - GIC_INTERNAL)
+
+#define GIC_MIN_BPR0 0
+#define GIC_MIN_BPR1 (GIC_MIN_BPR0 + 1)
+
+struct GICv3CPUState {
+    uint64_t affinity_id;            /* Cached affinity ID of the CPU */
+
+    /* Redistributor */
+    uint32_t level;                  /* Current IRQ level */
+    /* RD_base page registers */
+    uint32_t gicr_ctlr;
+    uint32_t gicr_waker;
+    uint64_t gicr_propbaser;
+    uint64_t gicr_pendbaser;
+    /* SGI_base page registers */
+    uint32_t gicr_igroupr0;
+    uint32_t gicr_ienabler0;
+    uint32_t gicr_ipendr0;
+    uint32_t gicr_iactiver0;
+    uint32_t gicr_icfgr0;
+    uint32_t gicr_icfgr1;
+    uint8_t gicr_ipriorityr[GIC_INTERNAL];
+
+    /* CPU interface */
+    uint64_t icc_ctlr_el1[2];
+    uint64_t icc_pmr_el1;
+    uint64_t icc_bpr[2];
+    uint64_t icc_ap1r[4][2];
+    uint64_t icc_igrpen0_el1;
+    uint64_t icc_igrpen1_el1;
+};
+
+typedef struct GICv3CPUState GICv3CPUState;
+
+struct GICv3State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -41,9 +83,61 @@ typedef struct GICv3State {
     uint32_t num_irq;
     uint32_t revision;
     bool security_extn;
+    bool irq_reset_nonsecure;
 
     int dev_fd; /* kvm device fd if backed by kvm vgic support */
-} GICv3State;
+    Error *migration_blocker;
+
+    /* Distributor */
+
+    /* for a GIC with the security extensions the NS banked version of this
+     * register is just an alias of bit 1 of the S banked version.
+     */
+    uint32_t gicd_ctlr;
+    DECLARE_BITMAP(group, GICV3_MAXSPI);        /* GICD_IGROUPR */
+    DECLARE_BITMAP(enabled, GICV3_MAXSPI);      /* GICD_ISENABLER */
+    DECLARE_BITMAP(pending, GICV3_MAXSPI);      /* GICD_ISPENDR */
+    DECLARE_BITMAP(active, GICV3_MAXSPI);       /* GICD_ISACTIVER */
+    DECLARE_BITMAP(level, GICV3_MAXSPI);        /* Current level */
+    DECLARE_BITMAP(edge_trigger, GICV3_MAXSPI); /* GICD_ICFGR */
+    uint8_t gicd_ipriority[GICV3_MAXSPI];
+    uint8_t gicd_itargetsr[GICV3_MAXSPI];
+    uint64_t gicd_irouter[GICV3_MAXSPI];
+
+    GICv3CPUState *cpu;
+};
+
+typedef struct GICv3State GICv3State;
+
+#define GICV3_BITMAP_ACCESSORS(BMP)                                     \
+    static inline void gicv3_gicd_##BMP##_set(GICv3State *s, int irq)   \
+    {                                                                   \
+        set_bit(irq - GIC_INTERNAL, s->BMP);                            \
+    }                                                                   \
+    static inline int gicv3_gicd_##BMP##_test(GICv3State *s, int irq)   \
+    {                                                                   \
+        return test_bit(irq - GIC_INTERNAL, s->BMP);                    \
+    }                                                                   \
+    static inline void gicv3_gicd_##BMP##_clear(GICv3State *s, int irq) \
+    {                                                                   \
+        clear_bit(irq - GIC_INTERNAL, s->BMP);                          \
+    }                                                                   \
+    static inline void gicv3_gicd_##BMP##_replace(GICv3State *s,        \
+                                                  int irq, int value)   \
+    {                                                                   \
+        if (value) {                                                    \
+            gicv3_gicd_##BMP##_set(s, irq);                             \
+        } else {                                                        \
+            gicv3_gicd_##BMP##_clear(s, irq);                           \
+        }                                                               \
+    }
+
+GICV3_BITMAP_ACCESSORS(group)
+GICV3_BITMAP_ACCESSORS(enabled)
+GICV3_BITMAP_ACCESSORS(pending)
+GICV3_BITMAP_ACCESSORS(active)
+GICV3_BITMAP_ACCESSORS(level)
+GICV3_BITMAP_ACCESSORS(edge_trigger)
 
 #define TYPE_ARM_GICV3_COMMON "arm-gicv3-common"
 #define ARM_GICV3_COMMON(obj) \
@@ -65,4 +159,10 @@ typedef struct ARMGICv3CommonClass {
 void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
                               const MemoryRegionOps *ops);
 
+/* Accessors for simulated system registers */
+uint32_t gicv3_get_igrpen0(GICv3State *s, int cpuindex);
+void gicv3_set_igrpen0(GICv3State *s, int cpuindex, uint32_t val);
+uint32_t gicv3_get_igrpen1(GICv3State *s, int cpuindex);
+void gicv3_set_igrpen1(GICv3State *s, int cpuindex, uint32_t val);
+
 #endif
-- 
1.9.1


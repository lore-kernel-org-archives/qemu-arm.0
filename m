Received: by 10.25.30.65 with SMTP id e62csp551742lfe;
        Thu, 26 May 2016 08:29:22 -0700 (PDT)
X-Received: by 10.140.144.204 with SMTP id 195mr9408471qhq.92.1464276562053;
        Thu, 26 May 2016 08:29:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w61si3078013qtd.15.2016.05.26.08.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 08:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5xDt-0002ek-7x
	for alex.bennee@linaro.org; Thu, 26 May 2016 11:29:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9t-0007BN-ON
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:25:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9m-0004dt-Kl
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:25:12 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57326)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5x9m-0004cj-3o; Thu, 26 May 2016 11:25:06 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whM-00046D-D9; Thu, 26 May 2016 15:55:44 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:24 +0100
Message-Id: <1464274540-19693-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 06/22] hw/intc/arm_gicv3: Add state information
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
X-TUID: LJj/DBH+d6he

From: Pavel Fedin <p.fedin@samsung.com>

Add state information to GICv3 object structure and implement
arm_gicv3_common_reset().

This commit includes accessor functions for the fields which are
stored as bitmaps in uint32_t arrays.

Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
[PMM: significantly overhauled:
 * Add missing qom/cpu.h include
 * Remove legacy-only state fields (we can add them later if/when we add
   legacy emulation)
 * Use arrays of uint32_t to store the various distributor bitmaps,
   and provide accessor functions for the various set/test/etc operations
 * Add various missing register offset #defines
 * Accessor macros which combine distributor and redistributor behaviour
   removed
 * Fields in state structures renamed to match architectural register names
 * Corrected the reset value for GICR_IENABLER0 since we don't support
   legacy mode
 * Added ARM_LINUX_BOOT_IF interface for "we are directly booting a kernel in
   non-secure" so that we can fake up the firmware-mandated reconfiguration
   only when we need it
]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c         | 159 +++++++++++++++++++++++++++++-
 hw/intc/gicv3_internal.h           | 172 +++++++++++++++++++++++++++++++++
 include/hw/intc/arm_gicv3_common.h | 193 ++++++++++++++++++++++++++++++++++++-
 3 files changed, 519 insertions(+), 5 deletions(-)
 create mode 100644 hw/intc/gicv3_internal.h

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index b9d3824..bf6949f 100644
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
@@ -22,7 +23,10 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qom/cpu.h"
 #include "hw/intc/arm_gicv3_common.h"
+#include "gicv3_internal.h"
+#include "hw/arm/linux-boot-if.h"
 
 static void gicv3_pre_save(void *opaque)
 {
@@ -90,6 +94,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
+    int i;
 
     /* revision property is actually reserved and currently used only in order
      * to keep the interface compatible with GICv2 code, avoiding extra
@@ -100,11 +105,155 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
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
+    if (s->num_irq < GIC_INTERNAL) {
+        error_setg(errp,
+                   "requested %u interrupt lines is below GIC minimum %d",
+                   s->num_irq, GIC_INTERNAL);
+        return;
+    }
+
+    /* ITLinesNumber is represented as (N / 32) - 1, so this is an
+     * implementation imposed restriction, not an architectural one,
+     * so we don't have to deal with bitfields where only some of the
+     * bits in a 32-bit word should be valid.
+     */
+    if (s->num_irq % 32) {
+        error_setg(errp,
+                   "%d interrupt lines unsupported: not divisible by 32",
+                   s->num_irq);
+        return;
+    }
+
+    s->cpu = g_new0(GICv3CPUState, s->num_cpu);
+
+    for (i = 0; i < s->num_cpu; i++) {
+        CPUState *cpu = qemu_get_cpu(i);
+        uint64_t cpu_affid;
+        int last;
+
+        s->cpu[i].cpu = cpu;
+        s->cpu[i].gic = s;
+
+        /* Pre-construct the GICR_TYPER:
+         * For our implementation:
+         *  Top 32 bits are the affinity value of the associated CPU
+         *  CommonLPIAff == 01 (redistributors with same Aff3 share LPI table)
+         *  Processor_Number == CPU index starting from 0
+         *  DPGS == 0 (GICR_CTLR.DPG* not supported)
+         *  Last == 1 if this is the last redistributor in a series of
+         *            contiguous redistributor pages
+         *  DirectLPI == 0 (direct injection of LPIs not supported)
+         *  VLPIS == 0 (virtual LPIs not supported)
+         *  PLPIS == 0 (physical LPIs not supported)
+         */
+        cpu_affid = object_property_get_int(OBJECT(cpu), "mp-affinity", NULL);
+        last = (i == s->num_cpu - 1);
+
+        /* The CPU mp-affinity property is in MPIDR register format; squash
+         * the affinity bytes into 32 bits as the GICR_TYPER has them.
+         */
+        cpu_affid = (cpu_affid & 0xFF00000000ULL >> 8) | (cpu_affid & 0xFFFFFF);
+        s->cpu[i].gicr_typer = (cpu_affid << 32) |
+            (1 << 24) |
+            (i << 8) |
+            (last << 4);
+    }
 }
 
 static void arm_gicv3_common_reset(DeviceState *dev)
 {
-    /* TODO */
+    GICv3State *s = ARM_GICV3_COMMON(dev);
+    int i;
+
+    for (i = 0; i < s->num_cpu; i++) {
+        GICv3CPUState *cs = &s->cpu[i];
+
+        cs->level = 0;
+        cs->gicr_ctlr = 0;
+        cs->gicr_statusr[GICV3_S] = 0;
+        cs->gicr_statusr[GICV3_NS] = 0;
+        cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
+        cs->gicr_propbaser = 0;
+        cs->gicr_pendbaser = 0;
+        /* If we're resetting a TZ-aware GIC as if secure firmware
+         * had set it up ready to start a kernel in non-secure, we
+         * need to set interrupts to group 1 so the kernel can use them.
+         * Otherwise they reset to group 0 like the hardware.
+         */
+        if (s->irq_reset_nonsecure) {
+            cs->gicr_igroupr0 = 0xffffffff;
+        } else {
+            cs->gicr_igroupr0 = 0;
+        }
+
+        cs->gicr_ienabler0 = 0;
+        cs->gicr_ipendr0 = 0;
+        cs->gicr_iactiver0 = 0;
+        cs->edge_trigger = 0xffff;
+        cs->gicr_igrpmodr0 = 0;
+        cs->gicr_nsacr = 0;
+        memset(cs->gicr_ipriorityr, 0, sizeof(cs->gicr_ipriorityr));
+
+        /* State in the CPU interface must *not* be reset here, because it
+         * is part of the CPU's reset domain, not the GIC device's.
+         */
+    }
+
+    /* For our implementation affinity routing is always enabled */
+    if (s->security_extn) {
+        s->gicd_ctlr = GICD_CTLR_ARE_S | GICD_CTLR_ARE_NS;
+    } else {
+        s->gicd_ctlr = GICD_CTLR_DS | GICD_CTLR_ARE;
+    }
+
+    s->gicd_statusr[GICV3_S] = 0;
+    s->gicd_statusr[GICV3_NS] = 0;
+
+    memset(s->group, 0, sizeof(s->group));
+    memset(s->grpmod, 0, sizeof(s->grpmod));
+    memset(s->enabled, 0, sizeof(s->enabled));
+    memset(s->pending, 0, sizeof(s->pending));
+    memset(s->active, 0, sizeof(s->active));
+    memset(s->level, 0, sizeof(s->level));
+    memset(s->edge_trigger, 0, sizeof(s->edge_trigger));
+    memset(s->gicd_ipriority, 0, sizeof(s->gicd_ipriority));
+    memset(s->gicd_irouter, 0, sizeof(s->gicd_irouter));
+    memset(s->gicd_nsacr, 0, sizeof(s->gicd_nsacr));
+
+    if (s->irq_reset_nonsecure) {
+        /* If we're resetting a TZ-aware GIC as if secure firmware
+         * had set it up ready to start a kernel in non-secure, we
+         * need to set interrupts to group 1 so the kernel can use them.
+         * Otherwise they reset to group 0 like the hardware.
+         */
+        for (i = GIC_INTERNAL; i < s->num_irq; i++) {
+            gicv3_gicd_group_set(s, i);
+        }
+    }
+}
+
+static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
+                                      bool secure_boot)
+{
+    GICv3State *s = ARM_GICV3_COMMON(obj);
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
@@ -118,11 +267,13 @@ static Property arm_gicv3_common_properties[] = {
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
@@ -132,6 +283,10 @@ static const TypeInfo arm_gicv3_common_type = {
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
index 0000000..d23524b
--- /dev/null
+++ b/hw/intc/gicv3_internal.h
@@ -0,0 +1,172 @@
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
+#define GICD_NSACR           0x0E00
+#define GICD_SGIR            0x0F00
+#define GICD_CPENDSGIR       0x0F10
+#define GICD_SPENDSGIR       0x0F20
+#define GICD_IROUTER         0x6000
+#define GICD_IDREGS          0xFFD0
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
+#define GICR_IDREGS           0xFFD0
+
+/* SGI and PPI Redistributor registers, offsets from RD_base */
+#define GICR_IGROUPR0         (GICR_SGI_OFFSET + 0x0080)
+#define GICR_ISENABLER0       (GICR_SGI_OFFSET + 0x0100)
+#define GICR_ICENABLER0       (GICR_SGI_OFFSET + 0x0180)
+#define GICR_ISPENDR0         (GICR_SGI_OFFSET + 0x0200)
+#define GICR_ICPENDR0         (GICR_SGI_OFFSET + 0x0280)
+#define GICR_ISACTIVER0       (GICR_SGI_OFFSET + 0x0300)
+#define GICR_ICACTIVER0       (GICR_SGI_OFFSET + 0x0380)
+#define GICR_IPRIORITYR       (GICR_SGI_OFFSET + 0x0400)
+#define GICR_ICFGR0           (GICR_SGI_OFFSET + 0x0C00)
+#define GICR_ICFGR1           (GICR_SGI_OFFSET + 0x0C04)
+#define GICR_IGRPMODR0        (GICR_SGI_OFFSET + 0x0D00)
+#define GICR_NSACR            (GICR_SGI_OFFSET + 0x0E00)
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
+#define ICC_CTLR_EL1_PRIBITS_SHIFT 8
+#define ICC_CTLR_EL1_IDBITS_SHIFT 11
+#define ICC_CTLR_EL1_SEIS           (1U << 14)
+#define ICC_CTLR_EL1_A3V            (1U << 15)
+
+#define ICC_PMR_PRIORITY_MASK    0xff
+#define ICC_BPR_BINARYPOINT_MASK 0x07
+#define ICC_IGRPEN_ENABLE        0x01
+
+#define ICC_CTLR_EL3_CBPR_EL1S (1U << 0)
+#define ICC_CTLR_EL3_CBPR_EL1NS (1U << 1)
+#define ICC_CTLR_EL3_EOIMODE_EL3 (1U << 2)
+#define ICC_CTLR_EL3_EOIMODE_EL1S (1U << 3)
+#define ICC_CTLR_EL3_EOIMODE_EL1NS (1U << 4)
+#define ICC_CTLR_EL3_RM (1U << 5)
+#define ICC_CTLR_EL3_PMHE (1U << 6)
+#define ICC_CTLR_EL3_PRIBITS_SHIFT 8
+#define ICC_CTLR_EL3_IDBITS_SHIFT 11
+#define ICC_CTLR_EL3_SEIS (1U << 14)
+#define ICC_CTLR_EL3_A3V (1U << 15)
+#define ICC_CTLR_EL3_NDS (1U << 17)
+
+/**
+ * gicv3_redist_affid:
+ *
+ * Return the 32-bit affinity ID of the CPU connected to this redistributor
+ */
+static inline uint32_t gicv3_redist_affid(GICv3CPUState *cs)
+{
+    return cs->gicr_typer >> 32;
+}
+
+#endif /* !QEMU_ARM_GIC_INTERNAL_H */
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index c2fd8da..6d4327b 100644
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
@@ -26,7 +27,144 @@
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
+/* Minimum BPR for Secure, or when security not enabled */
+#define GIC_MIN_BPR 0
+/* Minimum BPR for Nonsecure when security is enabled */
+#define GIC_MIN_BPR_NS (GIC_MIN_BPR + 1)
+
+/* For some distributor fields we want to model the array of 32-bit
+ * register values which hold various bitmaps corresponding to enabled,
+ * pending, etc bits. These macros and functions facilitate that; the
+ * APIs are generally modelled on the generic bitmap.h functions
+ * (which are unsuitable here because they use 'unsigned long' as the
+ * underlying storage type, which is very awkward when you need to
+ * access the data as 32-bit values.)
+ * Each bitmap contains a bit for each interrupt. Although there is
+ * space for the PPIs and SGIs, those bits (the first 32) are never
+ * used as that state lives in the redistributor. The unused bits are
+ * provided purely so that interrupt X's state is always in bit X; this
+ * avoids bugs where we forget to subtract GIC_INTERNAL from an
+ * interrupt number.
+ */
+#define GICV3_BMP_SIZE (DIV_ROUND_UP(GICV3_MAXIRQ, 32))
+
+#define GIC_DECLARE_BITMAP(name) \
+    uint32_t name[GICV3_BMP_SIZE]
+
+#define GIC_BIT_MASK(nr) (1U << ((nr) % 32))
+#define GIC_BIT_WORD(nr) ((nr) / 32)
+#define GIC_BIT(nr) (1U << (nr))
+
+static inline void gic_bmp_set_bit(int nr, uint32_t *addr)
+{
+    uint32_t mask = GIC_BIT_MASK(nr);
+    uint32_t *p = addr + GIC_BIT_WORD(nr);
+
+    *p |= mask;
+}
+
+static inline void gic_bmp_clear_bit(int nr, uint32_t *addr)
+{
+    uint32_t mask = GIC_BIT_MASK(nr);
+    uint32_t *p = addr + GIC_BIT_WORD(nr);
+
+    *p &= ~mask;
+}
+
+static inline int gic_bmp_test_bit(int nr, const uint32_t *addr)
+{
+    return 1U & (addr[GIC_BIT_WORD(nr)] >> (nr & 31));
+}
+
+static inline void gic_bmp_replace_bit(int nr, uint32_t *addr, int val)
+{
+    uint32_t mask = GIC_BIT_MASK(nr);
+    uint32_t *p = addr + GIC_BIT_WORD(nr);
+
+    *p &= ~mask;
+    *p |= (val & 1U) << (nr % 32);
+}
+
+/* Return a pointer to the 32-bit word containing the specified bit. */
+static inline uint32_t *gic_bmp_ptr32(uint32_t *addr, int nr)
+{
+    return addr + GIC_BIT_WORD(nr);
+}
+
+typedef struct GICv3State GICv3State;
+typedef struct GICv3CPUState GICv3CPUState;
+
+/* Some CPU interface registers come in three flavours:
+ * Group0, Group1 (Secure) and Group1 (NonSecure)
+ * (where the latter two are exposed as a single banked system register).
+ * In the state struct they are implemented as a 3-element array which
+ * can be indexed into by the GICV3_G0, GICV3_G1 and GICV3_G1NS constants.
+ * If the CPU doesn't support EL3 then the G1 element is unused.
+ *
+ * These constants are also used to communicate the group to use for
+ * an interrupt or SGI when it is passed between the cpu interface and
+ * the redistributor or distributor. For those purposes the receiving end
+ * must be prepared to cope with a Group 1 Secure interrupt even if it does
+ * not have security support enabled, because security can be disabled
+ * independently in the CPU and in the GIC. In that case the receiver should
+ * treat an incoming Group 1 Secure interrupt as if it were Group 0.
+ * (This architectural requirement is why the _G1 element is the unused one
+ * in a no-EL3 CPU:  we would otherwise have to translate back and forth
+ * between (G0, G1NS) from the distributor and (G0, G1) in the CPU i/f.)
+ */
+#define GICV3_G0 0
+#define GICV3_G1 1
+#define GICV3_G1NS 2
+
+/* ICC_CTLR_EL1, GICD_STATUSR and GICR_STATUSR are banked but not
+ * group-related, so those indices are just 0 for S and 1 for NS.
+ * (If the CPU or the GIC, respectively, don't support the Security
+ * extensions then the S element is unused.)
+ */
+#define GICV3_S 0
+#define GICV3_NS 1
+
+struct GICv3CPUState {
+    GICv3State *gic;
+    CPUState *cpu;
+
+    /* Redistributor */
+    uint32_t level;                  /* Current IRQ level */
+    /* RD_base page registers */
+    uint32_t gicr_ctlr;
+    uint64_t gicr_typer;
+    uint32_t gicr_statusr[2];
+    uint32_t gicr_waker;
+    uint64_t gicr_propbaser;
+    uint64_t gicr_pendbaser;
+    /* SGI_base page registers */
+    uint32_t gicr_igroupr0;
+    uint32_t gicr_ienabler0;
+    uint32_t gicr_ipendr0;
+    uint32_t gicr_iactiver0;
+    uint32_t edge_trigger; /* ICFGR0 and ICFGR1 even bits */
+    uint32_t gicr_igrpmodr0;
+    uint32_t gicr_nsacr;
+    uint8_t gicr_ipriorityr[GIC_INTERNAL];
+
+    /* CPU interface */
+    uint64_t icc_ctlr_el1[2];
+    uint64_t icc_pmr_el1;
+    uint64_t icc_bpr[3];
+    uint64_t icc_apr[3][4];
+    uint64_t icc_igrpen[3];
+    uint64_t icc_ctlr_el3;
+};
+
+struct GICv3State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
@@ -41,9 +179,58 @@ typedef struct GICv3State {
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
+    uint32_t gicd_statusr[2];
+    GIC_DECLARE_BITMAP(group);        /* GICD_IGROUPR */
+    GIC_DECLARE_BITMAP(grpmod);       /* GICD_IGRPMODR */
+    GIC_DECLARE_BITMAP(enabled);      /* GICD_ISENABLER */
+    GIC_DECLARE_BITMAP(pending);      /* GICD_ISPENDR */
+    GIC_DECLARE_BITMAP(active);       /* GICD_ISACTIVER */
+    GIC_DECLARE_BITMAP(level);        /* Current level */
+    GIC_DECLARE_BITMAP(edge_trigger); /* GICD_ICFGR even bits */
+    uint8_t gicd_ipriority[GICV3_MAXIRQ];
+    uint64_t gicd_irouter[GICV3_MAXIRQ];
+    uint32_t gicd_nsacr[DIV_ROUND_UP(GICV3_MAXIRQ, 16)];
+
+    GICv3CPUState *cpu;
+};
+
+#define GICV3_BITMAP_ACCESSORS(BMP)                                     \
+    static inline void gicv3_gicd_##BMP##_set(GICv3State *s, int irq)   \
+    {                                                                   \
+        gic_bmp_set_bit(irq, s->BMP);                                   \
+    }                                                                   \
+    static inline int gicv3_gicd_##BMP##_test(GICv3State *s, int irq)   \
+    {                                                                   \
+        return gic_bmp_test_bit(irq, s->BMP);                           \
+    }                                                                   \
+    static inline void gicv3_gicd_##BMP##_clear(GICv3State *s, int irq) \
+    {                                                                   \
+        gic_bmp_clear_bit(irq, s->BMP);                                 \
+    }                                                                   \
+    static inline void gicv3_gicd_##BMP##_replace(GICv3State *s,        \
+                                                  int irq, int value)   \
+    {                                                                   \
+        gic_bmp_replace_bit(irq, s->BMP, value);                        \
+    }
+
+GICV3_BITMAP_ACCESSORS(group)
+GICV3_BITMAP_ACCESSORS(grpmod)
+GICV3_BITMAP_ACCESSORS(enabled)
+GICV3_BITMAP_ACCESSORS(pending)
+GICV3_BITMAP_ACCESSORS(active)
+GICV3_BITMAP_ACCESSORS(level)
+GICV3_BITMAP_ACCESSORS(edge_trigger)
 
 #define TYPE_ARM_GICV3_COMMON "arm-gicv3-common"
 #define ARM_GICV3_COMMON(obj) \
-- 
1.9.1


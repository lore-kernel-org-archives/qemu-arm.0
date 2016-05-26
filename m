Received: by 10.25.30.65 with SMTP id e62csp554243lfe;
        Thu, 26 May 2016 08:34:03 -0700 (PDT)
X-Received: by 10.55.91.194 with SMTP id p185mr9736515qkb.182.1464276843739;
        Thu, 26 May 2016 08:34:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m3si1891409qkl.62.2016.05.26.08.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 08:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5xIR-0006nx-1z
	for alex.bennee@linaro.org; Thu, 26 May 2016 11:34:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5xA5-0007Kb-KD
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:25:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5xA3-0004je-7s
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:25:25 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57334)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5xA2-0004jT-O5; Thu, 26 May 2016 11:25:23 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whP-000489-Pw; Thu, 26 May 2016 15:55:47 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:30 +0100
Message-Id: <1464274540-19693-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 12/22] hw/intc/arm_gicv3: Implement GICv3
 redistributor registers
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
X-TUID: nsOHmKMjGBnr

From: Shlomo Pongratz <shlomo.pongratz@huawei.com>

Implement the redistributor registers of a GICv3.

Signed-off-by: Shlomo Pongratz <shlomo.pongratz@huawei.com>
[PMM: significantly overhauled/rewritten:
 * use the new data structures
 * restructure register read/write to handle different width accesses
   natively, since almost all registers are 32-bit only, rather
   than implementing everything as byte accesses
 * implemented security extension support
]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/Makefile.objs      |   1 +
 hw/intc/arm_gicv3_redist.c | 495 +++++++++++++++++++++++++++++++++++++++++++++
 hw/intc/gicv3_internal.h   |   4 +
 trace-events               |   6 +
 4 files changed, 506 insertions(+)
 create mode 100644 hw/intc/arm_gicv3_redist.c

diff --git a/hw/intc/Makefile.objs b/hw/intc/Makefile.objs
index a173d29..417db11 100644
--- a/hw/intc/Makefile.objs
+++ b/hw/intc/Makefile.objs
@@ -15,6 +15,7 @@ common-obj-$(CONFIG_ARM_GIC) += arm_gicv2m.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_common.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv3.o
 common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_dist.o
+common-obj-$(CONFIG_ARM_GIC) += arm_gicv3_redist.o
 common-obj-$(CONFIG_OPENPIC) += openpic.o
 
 obj-$(CONFIG_APIC) += apic.o apic_common.o
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
new file mode 100644
index 0000000..18dc0c8
--- /dev/null
+++ b/hw/intc/arm_gicv3_redist.c
@@ -0,0 +1,495 @@
+/*
+ * ARM GICv3 emulation: Redistributor
+ *
+ * Copyright (c) 2015 Huawei.
+ * Copyright (c) 2016 Linaro Limited.
+ * Written by Shlomo Pongratz, Peter Maydell
+ *
+ * This code is licensed under the GPL, version 2 or (at your option)
+ * any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "trace.h"
+#include "gicv3_internal.h"
+
+static uint32_t mask_group(GICv3CPUState *cs, MemTxAttrs attrs)
+{
+    /* Return a 32-bit mask which should be applied for this set of 32
+     * interrupts; each bit is 1 if access is permitted by the
+     * combination of attrs.secure and GICR_GROUPR. (GICR_NSACR does
+     * not affect config register accesses, unlike GICD_NSACR.)
+     */
+    if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
+        /* bits for Group 0 or Secure Group 1 interrupts are RAZ/WI */
+        return cs->gicr_igroupr0;
+    }
+    return 0xFFFFFFFFU;
+}
+
+static void gicr_write_set_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
+                                      uint32_t *reg, uint32_t val)
+{
+    /* Helper routine to implement writing to a "set-bitmap" register */
+    val &= mask_group(cs, attrs);
+    *reg |= val;
+    gicv3_redist_update(cs);
+}
+
+static void gicr_write_clear_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
+                                        uint32_t *reg, uint32_t val)
+{
+    /* Helper routine to implement writing to a "clear-bitmap" register */
+    val &= mask_group(cs, attrs);
+    *reg &= ~val;
+    gicv3_redist_update(cs);
+}
+
+static uint32_t gicr_read_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
+                                     uint32_t reg)
+{
+    reg &= mask_group(cs, attrs);
+    return reg;
+}
+
+static uint8_t gicr_read_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs,
+                                    int irq)
+{
+    /* Read the value of GICR_IPRIORITYR<n> for the specified interrupt,
+     * honouring security state (these are RAZ/WI for Group 0 or Secure
+     * Group 1 interrupts).
+     */
+    uint32_t prio;
+
+    prio = cs->gicr_ipriorityr[irq];
+
+    if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
+        if (!(cs->gicr_igroupr0 & (1U << irq))) {
+            /* Fields for Group 0 or Secure Group 1 interrupts are RAZ/WI */
+            return 0;
+        }
+        /* NS view of the interrupt priority */
+        prio = (prio << 1) & 0xff;
+    }
+    return prio;
+}
+
+static void gicr_write_ipriorityr(GICv3CPUState *cs, MemTxAttrs attrs, int irq,
+                                  uint8_t value)
+{
+    /* Write the value of GICD_IPRIORITYR<n> for the specified interrupt,
+     * honouring security state (these are RAZ/WI for Group 0 or Secure
+     * Group 1 interrupts).
+     */
+    if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
+        if (!(cs->gicr_igroupr0 & (1U << irq))) {
+            /* Fields for Group 0 or Secure Group 1 interrupts are RAZ/WI */
+            return;
+        }
+        /* NS view of the interrupt priority */
+        value = 0x80 | (value >> 1);
+    }
+    cs->gicr_ipriorityr[irq] = value;
+}
+
+static MemTxResult gicr_readb(GICv3CPUState *cs, hwaddr offset,
+                              uint64_t *data, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
+        *data = gicr_read_ipriorityr(cs, attrs, offset - GICR_IPRIORITYR);
+        return MEMTX_OK;
+    default:
+        return MEMTX_ERROR;
+    }
+}
+
+static MemTxResult gicr_writeb(GICv3CPUState *cs, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
+        gicr_write_ipriorityr(cs, attrs, offset - GICR_IPRIORITYR, value);
+        gicv3_redist_update(cs);
+        return MEMTX_OK;
+    default:
+        return MEMTX_ERROR;
+    }
+}
+
+static MemTxResult gicr_readl(GICv3CPUState *cs, hwaddr offset,
+                              uint64_t *data, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case GICR_CTLR:
+        *data = cs->gicr_ctlr;
+        return MEMTX_OK;
+    case GICR_IIDR:
+        *data = gicv3_iidr();
+        return MEMTX_OK;
+    case GICR_TYPER:
+        *data = extract64(cs->gicr_typer, 0, 32);
+        return MEMTX_OK;
+    case GICR_TYPER + 4:
+        *data = extract64(cs->gicr_typer, 32, 32);
+        return MEMTX_OK;
+    case GICR_STATUSR:
+        /* RAZ/WI for us (this is an optional register and our implementation
+         * does not track RO/WO/reserved violations to report them to the guest)
+         */
+        *data = 0;
+        return MEMTX_OK;
+    case GICR_WAKER:
+        *data = cs->gicr_waker;
+        return MEMTX_OK;
+    case GICR_PROPBASER:
+        *data = extract64(cs->gicr_propbaser, 0, 32);
+        return MEMTX_OK;
+    case GICR_PROPBASER + 4:
+        *data = extract64(cs->gicr_propbaser, 32, 32);
+        return MEMTX_OK;
+    case GICR_PENDBASER:
+        *data = extract64(cs->gicr_pendbaser, 0, 32);
+        return MEMTX_OK;
+    case GICR_PENDBASER + 4:
+        *data = extract64(cs->gicr_pendbaser, 32, 32);
+        return MEMTX_OK;
+    case GICR_IGROUPR0:
+        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
+            *data = 0;
+            return MEMTX_OK;
+        }
+        *data = cs->gicr_igroupr0;
+        return MEMTX_OK;
+    case GICR_ISENABLER0:
+    case GICR_ICENABLER0:
+        *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_ienabler0);
+        return MEMTX_OK;
+    case GICR_ISPENDR0:
+    case GICR_ICPENDR0:
+    {
+        /* The pending register reads as the logical OR of the pending
+         * latch and the input line level for level-triggered interrupts.
+         */
+        uint32_t val = cs->gicr_ipendr0 | (~cs->edge_trigger & cs->level);
+        *data = gicr_read_bitmap_reg(cs, attrs, val);
+        return MEMTX_OK;
+    }
+    case GICR_ISACTIVER0:
+    case GICR_ICACTIVER0:
+        *data = gicr_read_bitmap_reg(cs, attrs, cs->gicr_iactiver0);
+        return MEMTX_OK;
+    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
+    {
+        int i, irq = offset - GICR_IPRIORITYR;
+        uint32_t value = 0;
+
+        for (i = irq + 3; i >= irq; i--, value <<= 8) {
+            value |= gicr_read_ipriorityr(cs, attrs, i);
+        }
+        *data = value;
+        return MEMTX_OK;
+    }
+    case GICR_ICFGR0:
+    case GICR_ICFGR1:
+    {
+        /* Our edge_trigger bitmap is one bit per irq; take the correct
+         * half of it, and spread it out into the odd bits.
+         */
+        uint32_t value;
+
+        value = cs->edge_trigger & mask_group(cs, attrs);
+        value = extract32(value, (offset == GICR_ICFGR1) ? 16 : 0, 16);
+        value = half_shuffle32(value) << 1;
+        *data = value;
+        return MEMTX_OK;
+    }
+    case GICR_IGRPMODR0:
+        if ((cs->gic->gicd_ctlr & GICD_CTLR_DS) || !attrs.secure) {
+            /* RAZ/WI if security disabled, or if
+             * security enabled and this is an NS access
+             */
+            *data = 0;
+            return MEMTX_OK;
+        }
+        *data = cs->gicr_igrpmodr0;
+        return MEMTX_OK;
+    case GICR_NSACR:
+        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
+            *data = 0;
+            return MEMTX_OK;
+        }
+        *data = cs->gicr_nsacr;
+        return MEMTX_OK;
+    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
+        *data = gicv3_idreg(offset - GICR_IDREGS);
+        return MEMTX_OK;
+    default:
+        return MEMTX_ERROR;
+    }
+}
+
+static MemTxResult gicr_writel(GICv3CPUState *cs, hwaddr offset,
+                               uint64_t value, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case GICR_CTLR:
+        /* For our implementation, GICR_TYPER.DPGS is 0 and so all
+         * the DPG bits are RAZ/WI. We don't do anything asynchronously,
+         * so UWP and RWP are RAZ/WI. And GICR_TYPER.LPIS is 0 (we don't
+         * implement LPIs) so Enable_LPIs is RES0. So there are no writable
+         * bits for us.
+         */
+        return MEMTX_OK;
+    case GICR_STATUSR:
+        /* RAZ/WI for our implementation */
+        return MEMTX_OK;
+    case GICR_WAKER:
+        /* Only the ProcessorSleep bit is writeable. When the guest sets
+         * it it requests that we transition the channel between the
+         * redistributor and the cpu interface to quiescent, and that
+         * we set the ChildrenAsleep bit once the inteface has reached the
+         * quiescent state.
+         * Setting the ProcessorSleep to 0 reverses the quiescing, and
+         * ChildrenAsleep is cleared once the transition is complete.
+         * Since our interface is not asynchronous, we complete these
+         * transitions instantaneously, so we set ChildrenAsleep to the
+         * same value as ProcessorSleep here.
+         */
+        value &= GICR_WAKER_ProcessorSleep;
+        if (value & GICR_WAKER_ProcessorSleep) {
+            value |= GICR_WAKER_ChildrenAsleep;
+        }
+        cs->gicr_waker = value;
+        return MEMTX_OK;
+    case GICR_PROPBASER:
+        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 0, 32, value);
+        return MEMTX_OK;
+    case GICR_PROPBASER + 4:
+        cs->gicr_propbaser = deposit64(cs->gicr_propbaser, 32, 32, value);
+        return MEMTX_OK;
+    case GICR_PENDBASER:
+        cs->gicr_pendbaser = deposit64(cs->gicr_pendbaser, 0, 32, value);
+        return MEMTX_OK;
+    case GICR_PENDBASER + 4:
+        cs->gicr_pendbaser = deposit64(cs->gicr_pendbaser, 32, 32, value);
+        return MEMTX_OK;
+    case GICR_IGROUPR0:
+        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
+            return MEMTX_OK;
+        }
+        cs->gicr_igroupr0 = value;
+        gicv3_redist_update(cs);
+        return MEMTX_OK;
+    case GICR_ISENABLER0:
+        gicr_write_set_bitmap_reg(cs, attrs, &cs->gicr_ienabler0, value);
+        return MEMTX_OK;
+    case GICR_ICENABLER0:
+        gicr_write_clear_bitmap_reg(cs, attrs, &cs->gicr_ienabler0, value);
+        return MEMTX_OK;
+    case GICR_ISPENDR0:
+        gicr_write_set_bitmap_reg(cs, attrs, &cs->gicr_ipendr0, value);
+        return MEMTX_OK;
+    case GICR_ICPENDR0:
+        gicr_write_clear_bitmap_reg(cs, attrs, &cs->gicr_ipendr0, value);
+        return MEMTX_OK;
+    case GICR_ISACTIVER0:
+        gicr_write_set_bitmap_reg(cs, attrs, &cs->gicr_iactiver0, value);
+        return MEMTX_OK;
+    case GICR_ICACTIVER0:
+        gicr_write_clear_bitmap_reg(cs, attrs, &cs->gicr_iactiver0, value);
+        return MEMTX_OK;
+    case GICR_IPRIORITYR ... GICR_IPRIORITYR + 0x1f:
+    {
+        int i, irq = offset - GICR_IPRIORITYR;
+
+        for (i = irq; i < irq + 4; i++, value >>= 8) {
+            gicr_write_ipriorityr(cs, attrs, i, value);
+        }
+        gicv3_redist_update(cs);
+        return MEMTX_OK;
+    }
+    case GICR_ICFGR0:
+        /* Register is all RAZ/WI or RAO/WI bits */
+        return MEMTX_OK;
+    case GICR_ICFGR1:
+    {
+        uint32_t mask;
+
+        /* Since our edge_trigger bitmap is one bit per irq, our input
+         * 32-bits will compress down into 16 bits which we need
+         * to write into the bitmap.
+         */
+        value = half_unshuffle32(value >> 1) << 16;
+        mask = mask_group(cs, attrs) & 0xffff0000U;
+
+        cs->edge_trigger &= ~mask;
+        cs->edge_trigger |= (value & mask);
+
+        gicv3_redist_update(cs);
+        return MEMTX_OK;
+    }
+    case GICR_IGRPMODR0:
+        if ((cs->gic->gicd_ctlr & GICD_CTLR_DS) || !attrs.secure) {
+            /* RAZ/WI if security disabled, or if
+             * security enabled and this is an NS access
+             */
+            return MEMTX_OK;
+        }
+        cs->gicr_igrpmodr0 = value;
+        gicv3_redist_update(cs);
+        return MEMTX_OK;
+    case GICR_NSACR:
+        if (!attrs.secure && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
+            return MEMTX_OK;
+        }
+        cs->gicr_nsacr = value;
+        /* no update required as this only affects access permission checks */
+        return MEMTX_OK;
+    case GICR_IIDR:
+    case GICR_TYPER:
+    case GICR_IDREGS ... GICR_IDREGS + 0x1f:
+        /* RO registers, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write to RO register at offset "
+                      TARGET_FMT_plx "\n", __func__, offset);
+        return MEMTX_OK;
+    default:
+        return MEMTX_ERROR;
+    }
+}
+
+static MemTxResult gicr_readll(GICv3CPUState *cs, hwaddr offset,
+                               uint64_t *data, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case GICR_TYPER:
+        *data = cs->gicr_typer;
+        return MEMTX_OK;
+    case GICR_PROPBASER:
+        *data = cs->gicr_propbaser;
+        return MEMTX_OK;
+    case GICR_PENDBASER:
+        *data = cs->gicr_pendbaser;
+        return MEMTX_OK;
+    default:
+        return MEMTX_ERROR;
+    }
+}
+
+static MemTxResult gicr_writell(GICv3CPUState *cs, hwaddr offset,
+                                uint64_t value, MemTxAttrs attrs)
+{
+    switch (offset) {
+    case GICR_PROPBASER:
+        cs->gicr_propbaser = value;
+        return MEMTX_OK;
+    case GICR_PENDBASER:
+        cs->gicr_pendbaser = value;
+        return MEMTX_OK;
+    case GICR_TYPER:
+        /* RO register, ignore the write */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write to RO register at offset "
+                      TARGET_FMT_plx "\n", __func__, offset);
+        return MEMTX_OK;
+    default:
+        return MEMTX_ERROR;
+    }
+}
+
+MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
+                              unsigned size, MemTxAttrs attrs)
+{
+    GICv3State *s = opaque;
+    GICv3CPUState *cs;
+    MemTxResult r;
+    int cpuidx;
+
+    /* This region covers all the redistributor pages; there are
+     * (for GICv3) two 64K pages per CPU. At the moment they are
+     * all contiguous (ie in this one region), though we might later
+     * want to allow splitting of redistributor pages into several
+     * blocks so we can support more CPUs.
+     */
+    cpuidx = offset / 0x20000;
+    offset %= 0x20000;
+    assert(cpuidx < s->num_cpu);
+
+    cs = &s->cpu[cpuidx];
+
+    switch (size) {
+    case 1:
+        r = gicr_readb(cs, offset, data, attrs);
+        break;
+    case 4:
+        r = gicr_readl(cs, offset, data, attrs);
+        break;
+    case 8:
+        r = gicr_readll(cs, offset, data, attrs);
+        break;
+    default:
+        r = MEMTX_ERROR;
+        break;
+    }
+
+    if (r == MEMTX_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest read at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        trace_gicv3_redist_badread(gicv3_redist_affid(cs), offset,
+                                   size, attrs.secure);
+    } else {
+        trace_gicv3_redist_read(gicv3_redist_affid(cs), offset, *data,
+                                size, attrs.secure);
+    }
+    return r;
+}
+
+MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
+                               unsigned size, MemTxAttrs attrs)
+{
+    GICv3State *s = opaque;
+    GICv3CPUState *cs;
+    MemTxResult r;
+    int cpuidx;
+
+    /* This region covers all the redistributor pages; there are
+     * (for GICv3) two 64K pages per CPU. At the moment they are
+     * all contiguous (ie in this one region), though we might later
+     * want to allow splitting of redistributor pages into several
+     * blocks so we can support more CPUs.
+     */
+    cpuidx = offset / 0x20000;
+    offset %= 0x20000;
+    assert(cpuidx < s->num_cpu);
+
+    cs = &s->cpu[cpuidx];
+
+    switch (size) {
+    case 1:
+        r = gicr_writeb(cs, offset, data, attrs);
+        break;
+    case 4:
+        r = gicr_writel(cs, offset, data, attrs);
+        break;
+    case 8:
+        r = gicr_writell(cs, offset, data, attrs);
+        break;
+    default:
+        r = MEMTX_ERROR;
+        break;
+    }
+
+    if (r == MEMTX_ERROR) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid guest write at offset " TARGET_FMT_plx
+                      "size %u\n", __func__, offset, size);
+        trace_gicv3_redist_badwrite(gicv3_redist_affid(cs), offset, data,
+                                    size, attrs.secure);
+    } else {
+        trace_gicv3_redist_write(gicv3_redist_affid(cs), offset, data,
+                                 size, attrs.secure);
+    }
+    return r;
+}
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 1f901ca..39196fa 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -205,6 +205,10 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
                             unsigned size, MemTxAttrs attrs);
 MemTxResult gicv3_dist_write(void *opaque, hwaddr addr, uint64_t data,
                              unsigned size, MemTxAttrs attrs);
+MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
+                              unsigned size, MemTxAttrs attrs);
+MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
+                               unsigned size, MemTxAttrs attrs);
 
 /**
  * gicv3_cpuif_update:
diff --git a/trace-events b/trace-events
index be67121..308d458 100644
--- a/trace-events
+++ b/trace-events
@@ -1922,3 +1922,9 @@ gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GIC
 gicv3_dist_badread(uint64_t offset, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " size %u secure %d: error"
 gicv3_dist_write(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
 gicv3_dist_badwrite(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d: error"
+
+# hw/intc/arm_gicv3_redist.c
+gicv3_redist_read(uint32_t cpu, uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 redistributor %x read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
+gicv3_redist_badread(uint32_t cpu, uint64_t offset, unsigned size, bool secure) "GICv3 redistributor %x read: offset 0x%" PRIx64 " size %u secure %d: error"
+gicv3_redist_write(uint32_t cpu, uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 redistributor %x write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
+gicv3_redist_badwrite(uint32_t cpu, uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 redistributor %x write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d: error"
-- 
1.9.1


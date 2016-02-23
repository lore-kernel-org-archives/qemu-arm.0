Received: by 10.25.208.211 with SMTP id h202csp1875851lfg;
        Tue, 23 Feb 2016 10:51:21 -0800 (PST)
X-Received: by 10.140.241.5 with SMTP id m5mr28555771qhc.98.1456253481460;
        Tue, 23 Feb 2016 10:51:21 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u4si35121242qka.50.2016.02.23.10.51.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Feb 2016 10:51:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYI3M-0006v4-PI
	for alex.bennee@linaro.org; Tue, 23 Feb 2016 13:51:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aYI2a-00067X-FP
	for qemu-devel@nongnu.org; Tue, 23 Feb 2016 13:50:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aYI2Z-0005kL-9n
	for qemu-devel@nongnu.org; Tue, 23 Feb 2016 13:50:32 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:55948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aYI2Z-0005k2-27; Tue, 23 Feb 2016 13:50:31 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aYI2U-0001xX-S4; Tue, 23 Feb 2016 18:50:26 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 23 Feb 2016 18:50:25 +0000
Message-Id: <1456253425-13541-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH] hw/intc/arm_gic.c: Implement GICv2 GICC_DIR
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
X-TUID: 959lx1SrOree

The GICv2 introduces a new CPU interface register GICC_DIR, which
allows an OS to split the "priority drop" and "deactivate interrupt"
parts of interrupt completion. Implement this register.
(Note that the register is at offset 0x1000 in the CPU interface,
which means it is on a different 4K page from all the other registers.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We've been missing this for ages, but since Linux defaults to not
using it it hasn't mattered. However Linux will use GICC_DIR if
it is started in Hyp mode, so this is needed for proper EL2 support.
Luckily since I did the groundwork for this by implementing active
priorities properly last year, this is now straightforward.

Tested with a hacked Linux kernel that disables the "return false if
no hyp mode" check in gic_check_eoimode(). OTOH that hacked kernel will
boot OK on the broken QEMU too because it's hard to tell the difference
between correct behaviour and "EOI does prio-drop+deactivate regardless
of EOIMode, and DIR is writes-ignored".


 hw/cpu/a15mpcore.c       |  2 +-
 hw/intc/arm_gic.c        | 46 +++++++++++++++++++++++++++++++++++++++++++++-
 hw/intc/arm_gic_common.c |  2 +-
 3 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
index e9063ad..a221b8f 100644
--- a/hw/cpu/a15mpcore.c
+++ b/hw/cpu/a15mpcore.c
@@ -109,7 +109,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
     /* Memory map (addresses are offsets from PERIPHBASE):
      *  0x0000-0x0fff -- reserved
      *  0x1000-0x1fff -- GIC Distributor
-     *  0x2000-0x2fff -- GIC CPU interface
+     *  0x2000-0x3fff -- GIC CPU interface
      *  0x4000-0x4fff -- GIC virtual interface control (not modelled)
      *  0x5000-0x5fff -- GIC virtual interface control (not modelled)
      *  0x6000-0x7fff -- GIC virtual CPU interface (not modelled)
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 60ab9b8..5536b37 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -500,6 +500,42 @@ static uint8_t gic_get_running_priority(GICState *s, int cpu, MemTxAttrs attrs)
     }
 }
 
+/* Return true if we should split priority drop and interrupt deactivation,
+ * ie whether the relevant EOIMode bit is set.
+ */
+static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
+{
+    if (s->revision != 2) {
+        /* Before GICv2 prio-drop and deactivate are not separable */
+        return false;
+    }
+    if (s->security_extn && !attrs.secure) {
+        return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE_NS;
+    }
+    return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE;
+}
+
+static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
+{
+    int cm = 1 << cpu;
+    int group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
+
+    if (!gic_eoi_split(s, cpu, attrs)) {
+        /* This is UNPREDICTABLE; we choose to ignore it */
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "gic_deactivate_irq: GICC_DIR write when EOIMode clear");
+        return;
+    }
+
+    if (s->security_extn && !attrs.secure && !group) {
+        DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
+        return;
+    }
+
+    GIC_CLEAR_ACTIVE(irq, cm);
+    gic_update(s);
+}
+
 void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
     int cm = 1 << cpu;
@@ -544,7 +580,11 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
      */
 
     gic_drop_prio(s, cpu, group);
-    GIC_CLEAR_ACTIVE(irq, cm);
+
+    /* In GICv2 the guest can choose to split priority-drop and deactivate */
+    if (!gic_eoi_split(s, cpu, attrs)) {
+        GIC_CLEAR_ACTIVE(irq, cm);
+    }
     gic_update(s);
 }
 
@@ -1210,6 +1250,10 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
         s->nsapr[regno][cpu] = value;
         break;
     }
+    case 0x1000:
+        /* GICC_DIR */
+        gic_deactivate_irq(s, cpu, value & 0x3ff, attrs);
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_cpu_write: Bad offset %x\n", (int)offset);
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index ac8cf42..707d00d 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -121,7 +121,7 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
          * neither it can use KVM.
          */
         memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
-                              s, "gic_cpu", s->revision == 2 ? 0x1000 : 0x100);
+                              s, "gic_cpu", s->revision == 2 ? 0x2000 : 0x100);
         sysbus_init_mmio(sbd, &s->cpuiomem[0]);
     }
 }
-- 
1.9.1


Received: by 10.25.208.194 with SMTP id h185csp249006lfg;
        Thu, 21 Apr 2016 08:26:17 -0700 (PDT)
X-Received: by 10.55.31.203 with SMTP id n72mr2136672qkh.53.1461252377240;
        Thu, 21 Apr 2016 08:26:17 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v67si624700qkc.283.2016.04.21.08.26.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 08:26:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atGUi-0004gz-NA
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 11:26:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Hollis_Blanchard@mentor.com>) id 1atGTR-0002Sq-1T
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 11:25:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Hollis_Blanchard@mentor.com>) id 1atGTM-00053X-Q1
	for qemu-devel@nongnu.org; Thu, 21 Apr 2016 11:24:56 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:56259)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Hollis_Blanchard@mentor.com>)
	id 1atGTG-00051s-Si; Thu, 21 Apr 2016 11:24:47 -0400
Received: from svr-orw-fem-02x.mgc.mentorg.com ([147.34.96.206]
	helo=SVR-ORW-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1atGTC-0002IB-UE from Hollis_Blanchard@mentor.com ;
	Thu, 21 Apr 2016 08:24:42 -0700
Received: from matte.world.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.3.224.2; Thu, 21 Apr 2016 08:24:42 -0700
From: Hollis Blanchard <hollis_blanchard@mentor.com>
To: <stefanha@redhat.com>
Date: Thu, 21 Apr 2016 08:24:41 -0700
Message-ID: <1461252281-22399-1-git-send-email-hollis_blanchard@mentor.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
Subject: [Qemu-devel] [PATCH] hw/intc/arm_gic: add tracepoints
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Hollis Blanchard <hollis_blanchard@mentor.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mJxwYL0d11KH

These are obviously critical to understanding interrupt delivery:
gic_enable_irq
gic_disable_irq
gic_set_irq (inbound irq from device models)
gic_update_set_irq (outbound irq to CPU)
gic_acknowledge_irq

The only one that I think might raise eyebrows is gic_update_bestirq, but I've
(sadly) debugged problems that ended up being caused by unexpected priorities.
Knowing that the GIC has an irq ready, but doesn't deliver to the CPU due to
priority, has also proven important.

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
---
 hw/intc/arm_gic.c | 12 ++++++++++++
 trace-events      |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index f551241..5ee79b8 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -23,6 +23,7 @@
 #include "gic_internal.h"
 #include "qapi/error.h"
 #include "qom/cpu.h"
+#include "trace.h"
 
 //#define DEBUG_GIC
 
@@ -93,6 +94,11 @@ void gic_update(GICState *s)
             }
         }
 
+        if (best_irq != 1023) {
+            trace_gic_update_bestirq(cpu, best_irq, best_prio,
+                s->priority_mask[cpu], s->running_priority[cpu]);
+        }
+
         irq_level = fiq_level = 0;
 
         if (best_prio < s->priority_mask[cpu]) {
@@ -106,10 +112,12 @@ void gic_update(GICState *s)
                         DPRINTF("Raised pending FIQ %d (cpu %d)\n",
                                 best_irq, cpu);
                         fiq_level = 1;
+                        trace_gic_update_set_irq(cpu, "fiq", fiq_level);
                     } else {
                         DPRINTF("Raised pending IRQ %d (cpu %d)\n",
                                 best_irq, cpu);
                         irq_level = 1;
+                        trace_gic_update_set_irq(cpu, "irq", irq_level);
                     }
                 }
             }
@@ -197,6 +205,7 @@ static void gic_set_irq(void *opaque, int irq, int level)
     } else {
         gic_set_irq_generic(s, irq, level, cm, target);
     }
+    trace_gic_set_irq(irq, level, cm, target);
 
     gic_update(s);
 }
@@ -332,6 +341,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
      * is in the wrong group.
      */
     irq = gic_get_current_pending_irq(s, cpu, attrs);
+    trace_gic_acknowledge_irq(cpu, irq);
 
     if (irq >= GIC_MAXIRQ) {
         DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
@@ -853,6 +863,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
 
                 if (!GIC_TEST_ENABLED(irq + i, cm)) {
                     DPRINTF("Enabled IRQ %d\n", irq + i);
+                    trace_gic_enable_irq(irq + i);
                 }
                 GIC_SET_ENABLED(irq + i, cm);
                 /* If a raised level triggered IRQ enabled then mark
@@ -879,6 +890,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
 
                 if (GIC_TEST_ENABLED(irq + i, cm)) {
                     DPRINTF("Disabled IRQ %d\n", irq + i);
+                    trace_gic_disable_irq(irq + i);
                 }
                 GIC_CLEAR_ENABLED(irq + i, cm);
             }
diff --git a/trace-events b/trace-events
index 8350743..8796ff7 100644
--- a/trace-events
+++ b/trace-events
@@ -1909,3 +1909,11 @@ aspeed_vic_update_fiq(int flags) "Raising FIQ: %d"
 aspeed_vic_update_irq(int flags) "Raising IRQ: %d"
 aspeed_vic_read(uint64_t offset, unsigned size, uint32_t value) "From 0x%" PRIx64 " of size %u: 0x%" PRIx32
 aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
+
+# hw/intc/arm_gic.c
+gic_enable_irq(int irq) "irq %d enabled"
+gic_disable_irq(int irq) "irq %d disabled"
+gic_set_irq(int irq, int level, int cpumask, int target) "irq %d level %d cpumask 0x%x target 0x%x"
+gic_update_bestirq(int cpu, int irq, int prio, int priority_mask, int running_priority) "cpu %d irq %d priority %d cpu priority mask %d cpu running priority %d"
+gic_update_set_irq(int cpu, const char *name, int level) "cpu[%d]: %s = %d"
+gic_acknowledge_irq(int cpu, int irq) "cpu %d acknowledged irq %d"
-- 
2.5.5


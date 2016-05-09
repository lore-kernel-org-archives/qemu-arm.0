Received: by 10.25.208.137 with SMTP id h131csp1683305lfg;
        Mon, 9 May 2016 10:30:44 -0700 (PDT)
X-Received: by 10.55.164.210 with SMTP id n201mr38894464qke.188.1462815033571;
        Mon, 09 May 2016 10:30:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4si19347540qkd.165.2016.05.09.10.30.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azp0q-0004OV-Sn
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:30:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0j-00047i-5t
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1azp0g-0000J0-GO
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:30:24 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:56751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0g-00005k-6I; Mon, 09 May 2016 13:30:22 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1azp0J-0001UA-AS; Mon, 09 May 2016 18:29:59 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 May 2016 18:29:40 +0100
Message-Id: <1462814989-24360-15-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 14/23] hw/intc/arm_gicv3: Implement
 gicv3_set_irq()
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
X-TUID: TaFm2cGtb9GI

Implement the code which updates the GIC state when an interrupt
input into the GIC is asserted.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3.c        | 20 +++++++++++++++++++-
 hw/intc/arm_gicv3_dist.c   | 21 +++++++++++++++++++++
 hw/intc/arm_gicv3_redist.c | 21 +++++++++++++++++++++
 hw/intc/gicv3_internal.h   |  2 ++
 trace-events               |  2 ++
 5 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index e4f429d..ffa8c41 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -308,7 +308,25 @@ static void gicv3_set_irq(void *opaque, int irq, int level)
      *  [N+32..N+63] : PPI (internal interrupts for CPU 1
      *  ...
      */
-    /* Do nothing for now */
+    GICv3State *s = opaque;
+
+    if (irq < (s->num_irq - GIC_INTERNAL)) {
+        /* external interrupt (SPI) */
+        gicv3_dist_set_irq(s, irq + GIC_INTERNAL, level);
+    } else {
+        /* per-cpu interrupt (PPI) */
+        int cpu;
+
+        irq -= (s->num_irq - GIC_INTERNAL);
+        cpu = irq / GIC_INTERNAL;
+        irq %= GIC_INTERNAL;
+        assert(cpu < s->num_cpu);
+        /* Raising SGIs via this function would be a bug in how the board
+         * model wires up interrupts.
+         */
+        assert(irq >= 16 && irq < 32);
+        gicv3_redist_set_irq(&s->cpu[cpu], irq, level);
+    }
 }
 
 static void arm_gicv3_post_load(GICv3State *s)
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index f4bfd95..0ded724 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -839,3 +839,24 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
     }
     return r;
 }
+
+void gicv3_dist_set_irq(GICv3State *s, int irq, int level)
+{
+    /* Update distributor state for a change in an external SPI input line */
+    if (level == gicv3_gicd_level_test(s, irq)) {
+        return;
+    }
+
+    trace_gicv3_dist_set_irq(irq, level);
+
+    gicv3_gicd_level_replace(s, irq, level);
+
+    if (level) {
+        /* 0->1 edges latch the pending bit for edge-triggered interrupts */
+        if (gicv3_gicd_edge_trigger_test(s, irq)) {
+            gicv3_gicd_pending_set(s, irq);
+        }
+    }
+
+    gicv3_update(s, irq, 1);
+}
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 18dc0c8..16b3422 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -493,3 +493,24 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
     }
     return r;
 }
+
+void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
+{
+    /* Update redistributor state for a change in an external PPI input line */
+    if (level == extract32(cs->level, irq, 1)) {
+        return;
+    }
+
+    trace_gicv3_redist_set_irq(gicv3_redist_affid(cs), irq, level);
+
+    cs->level = deposit32(cs->level, irq, 1, level);
+
+    if (level) {
+        /* 0->1 edges latch the pending bit for edge-triggered interrupts */
+        if (extract32(cs->edge_trigger, irq, 1)) {
+            cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 1);
+        }
+    }
+
+    gicv3_redist_update(cs);
+}
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index e68840a..9ba1caf 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -209,6 +209,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
                               unsigned size, MemTxAttrs attrs);
 MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs);
+void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
+void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
 
 /**
  * gicv3_cpuif_update:
diff --git a/trace-events b/trace-events
index f5a2d4a..319783f 100644
--- a/trace-events
+++ b/trace-events
@@ -1915,9 +1915,11 @@ gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GIC
 gicv3_dist_badread(uint64_t offset, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " size %u secure %d: error"
 gicv3_dist_write(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
 gicv3_dist_badwrite(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d: error"
+gicv3_dist_set_irq(int irq, int level) "GICv3 distributor interrupt %d level changed to %d"
 
 # hw/intc/arm_gicv3_redist.c
 gicv3_redist_read(uint32_t cpu, uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 redistributor %x read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
 gicv3_redist_badread(uint32_t cpu, uint64_t offset, unsigned size, bool secure) "GICv3 redistributor %x read: offset 0x%" PRIx64 " size %u secure %d: error"
 gicv3_redist_write(uint32_t cpu, uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 redistributor %x write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
 gicv3_redist_badwrite(uint32_t cpu, uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 redistributor %x write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d: error"
+gicv3_redist_set_irq(uint32_t cpu, int irq, int level) "GICv3 redistributor %x interrupt %d level changed to %d"
-- 
1.9.1


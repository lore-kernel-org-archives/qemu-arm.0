Received: by 10.25.205.13 with SMTP id d13csp11568513lfg;
        Mon, 9 Jan 2017 08:18:48 -0800 (PST)
X-Received: by 10.200.58.231 with SMTP id x94mr20622527qte.87.1483978728429;
        Mon, 09 Jan 2017 08:18:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q33si11476216qtd.32.2017.01.09.08.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Jan 2017 08:18:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cQcej-00036D-Kw
	for alex.bennee@linaro.org; Mon, 09 Jan 2017 11:18:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS8-0007vD-F1
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQcS2-0003jN-3A
	for qemu-arm@nongnu.org; Mon, 09 Jan 2017 11:05:44 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQcS1-0003hC-K9; Mon, 09 Jan 2017 11:05:37 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQcRv-0001mB-43; Mon, 09 Jan 2017 16:05:31 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  9 Jan 2017 16:05:18 +0000
Message-Id: <1483977924-14522-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 12/18] hw/intc/arm_gicv3: Implement
 gicv3_cpuif_virt_update()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4SjCl11pwVAN

Implement the function which signals virtual interrupts to the
CPU as appropriate following CPU interface state changes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gicv3_common.h |  1 +
 hw/intc/arm_gicv3_cpuif.c          | 49 ++++++++++++++++++++++++++++++++++++++
 hw/intc/trace-events               |  2 ++
 3 files changed, 52 insertions(+)

diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 665d3f8..4156051 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -150,6 +150,7 @@ struct GICv3CPUState {
     qemu_irq parent_fiq;
     qemu_irq parent_virq;
     qemu_irq parent_vfiq;
+    qemu_irq maintenance_irq;
 
     /* Redistributor */
     uint32_t level;                  /* Current IRQ level */
diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index f3845a6..e05f6b3 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -352,6 +352,53 @@ static uint32_t maintenance_interrupt_state(GICv3CPUState *cs)
 
 static void gicv3_cpuif_virt_update(GICv3CPUState *cs)
 {
+    /* Tell the CPU about any pending virtual interrupts or
+     * maintenance interrupts, following a change to the state
+     * of the CPU interface relevant to virtual interrupts.
+     *
+     * CAUTION: this function will call qemu_set_irq() on the
+     * CPU maintenance IRQ line, which is typically wired up
+     * to the GIC as a per-CPU interrupt. This means that it
+     * will recursively call back into the GIC code via
+     * gicv3_redist_set_irq() and thus into the CPU interface code's
+     * gicv3_cpuif_update(). It is therefore important that this
+     * function is only called as the final action of a CPU interface
+     * register write implementation, after all the GIC state
+     * fields have been updated. gicv3_cpuif_update() also must
+     * not cause this function to be called, but that happens
+     * naturally as a result of there being no architectural
+     * linkage between the physical and virtual GIC logic.
+     */
+    int idx;
+    int irqlevel = 0;
+    int fiqlevel = 0;
+    int maintlevel = 0;
+
+    idx = hppvi_index(cs);
+    trace_gicv3_cpuif_virt_update(gicv3_redist_affid(cs), idx);
+    if (idx >= 0) {
+        uint64_t lr = cs->ich_lr_el2[idx];
+
+        if (icv_hppi_can_preempt(cs, lr)) {
+            /* Virtual interrupts are simple: G0 are always FIQ, and G1 IRQ */
+            if (lr & ICH_LR_EL2_GROUP) {
+                irqlevel = 1;
+            } else {
+                fiqlevel = 1;
+            }
+        }
+    }
+
+    if (cs->ich_hcr_el2 & ICH_HCR_EL2_EN) {
+        maintlevel = maintenance_interrupt_state(cs);
+    }
+
+    trace_gicv3_cpuif_virt_set_irqs(gicv3_redist_affid(cs), fiqlevel,
+                                    irqlevel, maintlevel);
+
+    qemu_set_irq(cs->parent_vfiq, fiqlevel);
+    qemu_set_irq(cs->parent_virq, irqlevel);
+    qemu_set_irq(cs->maintenance_irq, maintlevel);
 }
 
 static uint64_t icv_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
@@ -2480,6 +2527,8 @@ void gicv3_init_cpuif(GICv3State *s)
             && cpu->gic_num_lrs) {
             int j;
 
+            cs->maintenance_irq = cpu->gicv3_maintenance_interrupt;
+
             cs->num_list_regs = cpu->gic_num_lrs;
             cs->vpribits = cpu->gic_vpribits;
             cs->vprebits = cpu->gic_vprebits;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 1dcc830..6116df5 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -138,6 +138,8 @@ gicv3_icv_hppir_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_HPPIR%d rea
 gicv3_icv_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICV_DIR write cpu %x value 0x%" PRIx64
 gicv3_icv_iar_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_IAR%d read cpu %x value 0x%" PRIx64
 gicv3_icv_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICV_EOIR%d write cpu %x value 0x%" PRIx64
+gicv3_cpuif_virt_update(uint32_t cpuid, int idx) "GICv3 CPU i/f %x virt HPPI update LR index %d"
+gicv3_cpuif_virt_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel, int maintlevel) "GICv3 CPU i/f %x virt HPPI update: setting FIQ %d IRQ %d maintenance-irq %d"
 
 # hw/intc/arm_gicv3_dist.c
 gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
-- 
2.7.4


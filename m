Received: by 10.25.30.65 with SMTP id e62csp535070lfe;
        Thu, 26 May 2016 07:58:57 -0700 (PDT)
X-Received: by 10.200.55.83 with SMTP id p19mr9631064qtb.68.1464274737240;
        Thu, 26 May 2016 07:58:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t67si13295438qkf.107.2016.05.26.07.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 07:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5wkS-0001qd-K0
	for alex.bennee@linaro.org; Thu, 26 May 2016 10:58:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5whc-0007Yj-Nl
	for qemu-devel@nongnu.org; Thu, 26 May 2016 10:56:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5wha-00059c-5w
	for qemu-devel@nongnu.org; Thu, 26 May 2016 10:55:59 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57277)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whU-00057s-Rq; Thu, 26 May 2016 10:55:53 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whU-00049j-0j; Thu, 26 May 2016 15:55:52 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:35 +0100
Message-Id: <1464274540-19693-18-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH v2 17/22] hw/intc/arm_gicv3: Implement CPU i/f
 SGI generation registers
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /J5kGaFnr3b0

Implement the registers in the GICv3 CPU interface which generate
new SGI interrupts.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c  | 125 +++++++++++++++++++++++++++++++++++++++++++++
 hw/intc/arm_gicv3_redist.c |  40 +++++++++++++++
 hw/intc/gicv3_internal.h   |   1 +
 trace-events               |   2 +
 4 files changed, 168 insertions(+)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 7faf3c0..a368dbb 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -331,6 +331,95 @@ static void icc_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
     gicv3_cpuif_update(cs);
 }
 
+static void icc_generate_sgi(CPUARMState *env, GICv3CPUState *cs,
+                             uint64_t value, int grp, bool ns)
+{
+    GICv3State *s = cs->gic;
+
+    /* Extract Aff3/Aff2/Aff1 and shift into the bottom 24 bits */
+    uint64_t aff = extract64(value, 48, 8) << 16 |
+        extract64(value, 32, 8) << 8 |
+        extract64(value, 16, 8);
+    uint32_t targetlist = extract64(value, 0, 16);
+    uint32_t irq = extract64(value, 24, 4);
+    bool irm = extract64(value, 40, 1);
+    int i;
+
+    if (grp == GICV3_G1 && s->gicd_ctlr & GICD_CTLR_DS) {
+        /* If GICD_CTLR.DS == 1, the Distributor treats Secure Group 1
+         * interrupts as Group 0 interrupts and must send Secure Group 0
+         * interrupts to the target CPUs.
+         */
+        grp = GICV3_G0;
+    }
+
+    trace_gicv3_icc_generate_sgi(gicv3_redist_affid(cs), irq, irm,
+                                 aff, targetlist);
+
+    for (i = 0; i < s->num_cpu; i++) {
+        GICv3CPUState *ocs = &s->cpu[i];
+
+        if (irm) {
+            /* IRM == 1 : route to all CPUs except self */
+            if (cs == ocs) {
+                continue;
+            }
+        } else {
+            /* IRM == 0 : route to Aff3.Aff2.Aff1.n for all n in [0..15]
+             * where the corresponding bit is set in targetlist
+             */
+            int aff0;
+
+            if (ocs->gicr_typer >> 40 != aff) {
+                continue;
+            }
+            aff0 = extract64(ocs->gicr_typer, 32, 8);
+            if (aff0 > 15 || extract32(targetlist, aff0, 1) == 0) {
+                continue;
+            }
+        }
+
+        /* The redistributor will check against its own GICR_NSACR as needed */
+        gicv3_redist_send_sgi(ocs, grp, irq, ns);
+    }
+}
+
+static void icc_sgi0r_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /* Generate Secure Group 0 SGI. */
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    bool ns = !arm_is_secure(env);
+
+    icc_generate_sgi(env, cs, value, GICV3_G0, ns);
+}
+
+static void icc_sgi1r_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                           uint64_t value)
+{
+    /* Generate Group 1 SGI for the current Security state */
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int grp;
+    bool ns = !arm_is_secure(env);
+
+    grp = ns ? GICV3_G1NS : GICV3_G1;
+    icc_generate_sgi(env, cs, value, grp, ns);
+}
+
+static void icc_asgi1r_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    /* Generate Group 1 SGI for the Security state that is not
+     * the current state
+     */
+    GICv3CPUState *cs = icc_cs_from_env(env);
+    int grp;
+    bool ns = !arm_is_secure(env);
+
+    grp = ns ? GICV3_G1 : GICV3_G1NS;
+    icc_generate_sgi(env, cs, value, grp, ns);
+}
+
 static uint64_t icc_igrpen_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     GICv3CPUState *cs = icc_cs_from_env(env);
@@ -673,6 +762,42 @@ static const ARMCPRegInfo gicv3_cpuif_reginfo[] = {
       .readfn = icc_ap_read,
       .writefn = icc_ap_write,
     },
+    { .name = "ICC_SGI1R_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 11, .opc2 = 5,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = gicv3_irqfiq_access,
+      .writefn = icc_sgi1r_write,
+    },
+    { .name = "ICC_SGI1R",
+      .cp = 15, .opc1 = 0, .crm = 12,
+      .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = gicv3_irqfiq_access,
+      .writefn = icc_sgi1r_write,
+    },
+    { .name = "ICC_ASGI1R_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 11, .opc2 = 6,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = gicv3_irqfiq_access,
+      .writefn = icc_asgi1r_write,
+    },
+    { .name = "ICC_ASGI1R",
+      .cp = 15, .opc1 = 1, .crm = 12,
+      .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = gicv3_irqfiq_access,
+      .writefn = icc_asgi1r_write,
+    },
+    { .name = "ICC_SGI0R_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 11, .opc2 = 7,
+      .type = ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = gicv3_irqfiq_access,
+      .writefn = icc_sgi0r_write,
+    },
+    { .name = "ICC_SGI0R",
+      .cp = 15, .opc1 = 2, .crm = 12,
+      .type = ARM_CP_64BIT | ARM_CP_IO | ARM_CP_NO_RAW,
+      .access = PL1_W, .accessfn = gicv3_irqfiq_access,
+      .writefn = icc_sgi0r_write,
+    },
     /* This register is banked */
     { .name = "ICC_BPR1_EL1", .state = ARM_CP_STATE_BOTH,
       .opc0 = 3, .opc1 = 0, .crn = 12, .crm = 12, .opc2 = 3,
diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 16b3422..13893d3 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -27,6 +27,13 @@ static uint32_t mask_group(GICv3CPUState *cs, MemTxAttrs attrs)
     return 0xFFFFFFFFU;
 }
 
+static int gicr_ns_access(GICv3CPUState *cs, int irq)
+{
+    /* Return the 2 bit NSACR.NS_access field for this SGI */
+    assert(irq < 16);
+    return extract32(cs->gicr_nsacr, irq * 2, 2);
+}
+
 static void gicr_write_set_bitmap_reg(GICv3CPUState *cs, MemTxAttrs attrs,
                                       uint32_t *reg, uint32_t val)
 {
@@ -514,3 +521,36 @@ void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level)
 
     gicv3_redist_update(cs);
 }
+
+void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns)
+{
+    /* Update redistributor state for a generated SGI */
+    int irqgrp = gicv3_irq_group(cs->gic, cs, irq);
+
+    /* If we are asked for a Secure Group 1 SGI and it's actually
+     * configured as Secure Group 0 this is OK (subject to the usual
+     * NSACR checks).
+     */
+    if (grp == GICV3_G1 && irqgrp == GICV3_G0) {
+        grp = GICV3_G0;
+    }
+
+    if (grp != irqgrp) {
+        return;
+    }
+
+    if (ns && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
+        /* If security is enabled we must test the NSACR bits */
+        int nsaccess = gicr_ns_access(cs, irq);
+
+        if ((irqgrp == GICV3_G0 && nsaccess < 1) ||
+            (irqgrp == GICV3_G1 && nsaccess < 2)) {
+            return;
+        }
+    }
+
+    /* OK, we can accept the SGI */
+    trace_gicv3_redist_send_sgi(gicv3_redist_affid(cs), irq);
+    cs->gicr_ipendr0 = deposit32(cs->gicr_ipendr0, irq, 1, 1);
+    gicv3_redist_update(cs);
+}
diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index d06ef3e..561849c 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -211,6 +211,7 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
                                unsigned size, MemTxAttrs attrs);
 void gicv3_dist_set_irq(GICv3State *s, int irq, int level);
 void gicv3_redist_set_irq(GICv3CPUState *cs, int irq, int level);
+void gicv3_redist_send_sgi(GICv3CPUState *cs, int grp, int irq, bool ns);
 void gicv3_init_cpuif(GICv3State *s);
 
 /**
diff --git a/trace-events b/trace-events
index e84cea9..762f5a0 100644
--- a/trace-events
+++ b/trace-events
@@ -1934,6 +1934,7 @@ gicv3_icc_ctlr_el3_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 read cpu
 gicv3_icc_ctlr_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR_EL3 write cpu %x value 0x%" PRIx64
 gicv3_cpuif_update(uint32_t cpuid, int irq, int grp, int prio) "GICv3 CPU i/f %x HPPI update: irq %d group %d prio %d"
 gicv3_cpuif_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f %x HPPI update: setting FIQ %d IRQ %d"
+gicv3_icc_generate_sgi(uint32_t cpuid, int irq, int irm, uint32_t aff, uint32_t targetlist) "GICv3 CPU i/f %x generating SGI %d IRM %d target affinity 0x%xxx targetlist 0x%x"
 
 # hw/intc/arm_gicv3_dist.c
 gicv3_dist_read(uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 distributor read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
@@ -1948,3 +1949,4 @@ gicv3_redist_badread(uint32_t cpu, uint64_t offset, unsigned size, bool secure)
 gicv3_redist_write(uint32_t cpu, uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 redistributor %x write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d"
 gicv3_redist_badwrite(uint32_t cpu, uint64_t offset, uint64_t data, unsigned size, bool secure) "GICv3 redistributor %x write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u secure %d: error"
 gicv3_redist_set_irq(uint32_t cpu, int irq, int level) "GICv3 redistributor %x interrupt %d level changed to %d"
+gicv3_redist_send_sgi(uint32_t cpu, int irq) "GICv3 redistributor %x pending SGI %d"
-- 
1.9.1


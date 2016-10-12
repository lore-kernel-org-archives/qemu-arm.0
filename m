Received: by 10.80.166.35 with SMTP id d32csp659447edc;
        Wed, 12 Oct 2016 10:55:05 -0700 (PDT)
X-Received: by 10.55.121.133 with SMTP id u127mr2359357qkc.233.1476294905705;
        Wed, 12 Oct 2016 10:55:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n187si4441069qkf.84.2016.10.12.10.55.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 10:55:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34998 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buNk9-0007Ao-3l
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 13:55:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35343)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1buNjt-00070K-RU
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 13:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1buNjr-00033B-Gi
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 13:54:48 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1buNjr-00030L-99; Wed, 12 Oct 2016 13:54:47 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1buNjj-0001tC-US; Wed, 12 Oct 2016 18:54:39 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 12 Oct 2016 18:54:35 +0100
Message-Id: <1476294876-12340-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476294876-12340-1-git-send-email-peter.maydell@linaro.org>
References: <1476294876-12340-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 3/4] hw/intc/arm_gicv3: Fix ICC register
 tracepoints
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e9ANTDpW/B8e

Fix some problems with the tracepoints for ICC register reads
and writes:
 * tracepoints for ICC_BPR<n>, ICC_AP<n>R<x>, ICC_IGRPEN<n>,
   ICC_EIOR<n> were not printing the <n> that indicated whether
   the access was to the group 0 or 1 register
 * the ICC_IGREPEN1_EL3 read function was not actually calling
   the associated tracepoint
 * the ICC_BPR<n> write function was incorrectly calling the
   tracepoint for ICC_PMR writes

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/intc/arm_gicv3_cpuif.c | 23 +++++++++++++++--------
 hw/intc/trace-events      | 14 +++++++-------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 4633172..bca30c4 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -454,7 +454,8 @@ static void icc_eoir_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int irq = value & 0xffffff;
     int grp;
 
-    trace_gicv3_icc_eoir_write(gicv3_redist_affid(cs), value);
+    trace_gicv3_icc_eoir_write(ri->crm == 8 ? 0 : 1,
+                               gicv3_redist_affid(cs), value);
 
     if (ri->crm == 8) {
         /* EOIR0 */
@@ -542,7 +543,7 @@ static uint64_t icc_bpr_read(CPUARMState *env, const ARMCPRegInfo *ri)
         bpr = MIN(bpr, 7);
     }
 
-    trace_gicv3_icc_bpr_read(gicv3_redist_affid(cs), bpr);
+    trace_gicv3_icc_bpr_read(ri->crm == 8 ? 0 : 1, gicv3_redist_affid(cs), bpr);
 
     return bpr;
 }
@@ -553,7 +554,8 @@ static void icc_bpr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     GICv3CPUState *cs = icc_cs_from_env(env);
     int grp = (ri->crm == 8) ? GICV3_G0 : GICV3_G1;
 
-    trace_gicv3_icc_pmr_write(gicv3_redist_affid(cs), value);
+    trace_gicv3_icc_bpr_write(ri->crm == 8 ? 0 : 1,
+                              gicv3_redist_affid(cs), value);
 
     if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
         grp = GICV3_G1NS;
@@ -591,7 +593,7 @@ static uint64_t icc_ap_read(CPUARMState *env, const ARMCPRegInfo *ri)
 
     value = cs->icc_apr[grp][regno];
 
-    trace_gicv3_icc_ap_read(regno, gicv3_redist_affid(cs), value);
+    trace_gicv3_icc_ap_read(ri->crm & 1, regno, gicv3_redist_affid(cs), value);
     return value;
 }
 
@@ -603,7 +605,7 @@ static void icc_ap_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int regno = ri->opc2 & 3;
     int grp = ri->crm & 1 ? GICV3_G0 : GICV3_G1;
 
-    trace_gicv3_icc_ap_write(regno, gicv3_redist_affid(cs), value);
+    trace_gicv3_icc_ap_write(ri->crm & 1, regno, gicv3_redist_affid(cs), value);
 
     if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
         grp = GICV3_G1NS;
@@ -820,7 +822,8 @@ static uint64_t icc_igrpen_read(CPUARMState *env, const ARMCPRegInfo *ri)
     }
 
     value = cs->icc_igrpen[grp];
-    trace_gicv3_icc_igrpen_read(gicv3_redist_affid(cs), value);
+    trace_gicv3_icc_igrpen_read(ri->opc2 & 1 ? 1 : 0,
+                                gicv3_redist_affid(cs), value);
     return value;
 }
 
@@ -830,7 +833,8 @@ static void icc_igrpen_write(CPUARMState *env, const ARMCPRegInfo *ri,
     GICv3CPUState *cs = icc_cs_from_env(env);
     int grp = ri->opc2 & 1 ? GICV3_G1 : GICV3_G0;
 
-    trace_gicv3_icc_igrpen_write(gicv3_redist_affid(cs), value);
+    trace_gicv3_icc_igrpen_write(ri->opc2 & 1 ? 1 : 0,
+                                 gicv3_redist_affid(cs), value);
 
     if (grp == GICV3_G1 && gicv3_use_ns_bank(env)) {
         grp = GICV3_G1NS;
@@ -843,9 +847,12 @@ static void icc_igrpen_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static uint64_t icc_igrpen1_el3_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     GICv3CPUState *cs = icc_cs_from_env(env);
+    uint64_t value;
 
     /* IGRPEN1_EL3 bits 0 and 1 are r/w aliases into IGRPEN1_EL1 NS and S */
-    return cs->icc_igrpen[GICV3_G1NS] | (cs->icc_igrpen[GICV3_G1] << 1);
+    value = cs->icc_igrpen[GICV3_G1NS] | (cs->icc_igrpen[GICV3_G1] << 1);
+    trace_gicv3_icc_igrpen1_el3_read(gicv3_redist_affid(cs), value);
+    return value;
 }
 
 static void icc_igrpen1_el3_write(CPUARMState *env, const ARMCPRegInfo *ri,
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index f12192c..4a23848 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -84,12 +84,12 @@ gic_acknowledge_irq(int cpu, int irq) "cpu %d acknowledged irq %d"
 # hw/intc/arm_gicv3_cpuif.c
 gicv3_icc_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR read cpu %x value 0x%" PRIx64
 gicv3_icc_pmr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR write cpu %x value 0x%" PRIx64
-gicv3_icc_bpr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_BPR read cpu %x value 0x%" PRIx64
-gicv3_icc_bpr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_BPR write cpu %x value 0x%" PRIx64
-gicv3_icc_ap_read(int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR read cpu %x value 0x%" PRIx64
-gicv3_icc_ap_write(int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR write cpu %x value 0x%" PRIx64
-gicv3_icc_igrpen_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN read cpu %x value 0x%" PRIx64
-gicv3_icc_igrpen_write(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN write cpu %x value 0x%" PRIx64
+gicv3_icc_bpr_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_BPR%d read cpu %x value 0x%" PRIx64
+gicv3_icc_bpr_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_BPR%d write cpu %x value 0x%" PRIx64
+gicv3_icc_ap_read(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR%d read cpu %x value 0x%" PRIx64
+gicv3_icc_ap_write(int grp, int regno, uint32_t cpu, uint64_t val) "GICv3 ICC_AP%dR%d write cpu %x value 0x%" PRIx64
+gicv3_icc_igrpen_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN%d read cpu %x value 0x%" PRIx64
+gicv3_icc_igrpen_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN%d write cpu %x value 0x%" PRIx64
 gicv3_icc_igrpen1_el3_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN1_EL3 read cpu %x value 0x%" PRIx64
 gicv3_icc_igrpen1_el3_write(uint32_t cpu, uint64_t val) "GICv3 ICC_IGRPEN1_EL3 write cpu %x value 0x%" PRIx64
 gicv3_icc_ctlr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_CTLR read cpu %x value 0x%" PRIx64
@@ -101,7 +101,7 @@ gicv3_cpuif_set_irqs(uint32_t cpuid, int fiqlevel, int irqlevel) "GICv3 CPU i/f
 gicv3_icc_generate_sgi(uint32_t cpuid, int irq, int irm, uint32_t aff, uint32_t targetlist) "GICv3 CPU i/f %x generating SGI %d IRM %d target affinity 0x%xxx targetlist 0x%x"
 gicv3_icc_iar0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR0 read cpu %x value 0x%" PRIx64
 gicv3_icc_iar1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_IAR1 read cpu %x value 0x%" PRIx64
-gicv3_icc_eoir_write(uint32_t cpu, uint64_t val) "GICv3 ICC_EOIR write cpu %x value 0x%" PRIx64
+gicv3_icc_eoir_write(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_EOIR%d write cpu %x value 0x%" PRIx64
 gicv3_icc_hppir0_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR0 read cpu %x value 0x%" PRIx64
 gicv3_icc_hppir1_read(uint32_t cpu, uint64_t val) "GICv3 ICC_HPPIR1 read cpu %x value 0x%" PRIx64
 gicv3_icc_dir_write(uint32_t cpu, uint64_t val) "GICv3 ICC_DIR write cpu %x value 0x%" PRIx64
-- 
2.7.4


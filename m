Received: by 10.25.205.13 with SMTP id d13csp2122876lfg;
        Tue, 13 Dec 2016 02:54:47 -0800 (PST)
X-Received: by 10.200.47.140 with SMTP id l12mr92469683qta.51.1481626487257;
        Tue, 13 Dec 2016 02:54:47 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n76si27848252qke.251.2016.12.13.02.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 02:54:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37168 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkjM-00031v-G9
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 05:54:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkSs-0005d3-Pa
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkSr-0000BA-Qn
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:42 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkSr-000087-Jl; Tue, 13 Dec 2016 05:37:41 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRi-0002Hy-Hw; Tue, 13 Dec 2016 10:36:30 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:08 +0000
Message-Id: <1481625384-15077-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 07/23] hw/arm/virt: Don't incorrectly claim
 architectural timer to be edge-triggered
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
Cc: Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kjMOhHtg4a81

The architectural timers in ARM CPUs all have level triggered interrupts
(unless you're using KVM on a host kernel before 4.4, which misimplemented
them as edge-triggered).

We were incorrectly describing them in the device tree as edge triggered.
This can cause problems for guest kernels in 4.8 before rc6:
 * pre-4.8 kernels ignore the values in the DT
 * 4.8 before rc6 write the DT values to the GIC config registers
 * newer than rc6 ignore the DT and insist that the timer interrupts
   are level triggered regardless

Fix the DT so we're describing reality. For backwards-compatibility
purposes, only do this for the virt-2.9 machine onward.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 54498ea..2ca9527 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -71,6 +71,7 @@ typedef struct {
     bool disallow_affinity_adjustment;
     bool no_its;
     bool no_pmu;
+    bool claim_edge_triggered_timers;
 } VirtMachineClass;
 
 typedef struct {
@@ -309,12 +310,31 @@ static void fdt_add_psci_node(const VirtMachineState *vms)
 
 static void fdt_add_timer_nodes(const VirtMachineState *vms, int gictype)
 {
-    /* Note that on A15 h/w these interrupts are level-triggered,
-     * but for the GIC implementation provided by both QEMU and KVM
-     * they are edge-triggered.
+    /* On real hardware these interrupts are level-triggered.
+     * On KVM they were edge-triggered before host kernel version 4.4,
+     * and level-triggered afterwards.
+     * On emulated QEMU they are level-triggered.
+     *
+     * Getting the DTB info about them wrong is awkward for some
+     * guest kernels:
+     *  pre-4.8 ignore the DT and leave the interrupt configured
+     *   with whatever the GIC reset value (or the bootloader) left it at
+     *  4.8 before rc6 honour the incorrect data by programming it back
+     *   into the GIC, causing problems
+     *  4.8rc6 and later ignore the DT and always write "level triggered"
+     *   into the GIC
+     *
+     * For backwards-compatibility, virt-2.8 and earlier will continue
+     * to say these are edge-triggered, but later machines will report
+     * the correct information.
      */
     ARMCPU *armcpu;
-    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+    uint32_t irqflags = GIC_FDT_IRQ_FLAGS_LEVEL_HI;
+
+    if (vmc->claim_edge_triggered_timers) {
+        irqflags = GIC_FDT_IRQ_FLAGS_EDGE_LO_HI;
+    }
 
     if (gictype == 2) {
         irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
@@ -1556,8 +1576,14 @@ static void virt_2_8_instance_init(Object *obj)
 
 static void virt_machine_2_8_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_2_9_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_8);
+    /* For 2.8 and earlier we falsely claimed in the DT that
+     * our timers were edge-triggered, not level-triggered.
+     */
+    vmc->claim_edge_triggered_timers = true;
 }
 DEFINE_VIRT_MACHINE(2, 8)
 
-- 
2.7.4


Received: by 10.25.205.13 with SMTP id d13csp2124619lfg;
        Tue, 13 Dec 2016 02:59:59 -0800 (PST)
X-Received: by 10.237.48.139 with SMTP id 11mr82794637qtf.219.1481626799611;
        Tue, 13 Dec 2016 02:59:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id m42si27891772qtb.102.2016.12.13.02.59.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 02:59:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkoO-00070y-Mi
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 05:59:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkT3-0005pc-Ny
	for qemu-devel@nongnu.org; Tue, 13 Dec 2016 05:37:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkT2-0000G9-No
	for qemu-devel@nongnu.org; Tue, 13 Dec 2016 05:37:53 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkSv-000087-DE; Tue, 13 Dec 2016 05:37:45 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRf-0002GT-FW; Tue, 13 Dec 2016 10:36:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:04 +0000
Message-Id: <1481625384-15077-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 03/23] hw/intc/arm_gicv3: Don't signal
 Pending+Active interrupts to CPU
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2b8Er489OxyG

The GICv3 requires that we only signal Pending interrupts to
the CPU. This category does not include Pending+Active interrupts,
which means we need to check whether the interrupt is Active in
the gicr_int_pending() and gicd_int_pending() functions.

Interrupts are rarely in the Active+Pending state, but KVM
uses this as part of its handling of the virtual timer, so
this bug was causing KVM to go into an infinite loop of
taking the vtimer interrupt when the guest first triggered it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/intc/arm_gicv3.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
index 8a6c647..f0c967b 100644
--- a/hw/intc/arm_gicv3.c
+++ b/hw/intc/arm_gicv3.c
@@ -54,6 +54,7 @@ static uint32_t gicd_int_pending(GICv3State *s, int irq)
      *  + the PENDING latch is set OR it is level triggered and the input is 1
      *  + its ENABLE bit is set
      *  + the GICD enable bit for its group is set
+     *  + its ACTIVE bit is not set (otherwise it would be Active+Pending)
      * Conveniently we can bulk-calculate this with bitwise operations.
      */
     uint32_t pend, grpmask;
@@ -63,9 +64,11 @@ static uint32_t gicd_int_pending(GICv3State *s, int irq)
     uint32_t group = *gic_bmp_ptr32(s->group, irq);
     uint32_t grpmod = *gic_bmp_ptr32(s->grpmod, irq);
     uint32_t enable = *gic_bmp_ptr32(s->enabled, irq);
+    uint32_t active = *gic_bmp_ptr32(s->active, irq);
 
     pend = pending | (~edge_trigger & level);
     pend &= enable;
+    pend &= ~active;
 
     if (s->gicd_ctlr & GICD_CTLR_DS) {
         grpmod = 0;
@@ -96,12 +99,14 @@ static uint32_t gicr_int_pending(GICv3CPUState *cs)
      *  + the PENDING latch is set OR it is level triggered and the input is 1
      *  + its ENABLE bit is set
      *  + the GICD enable bit for its group is set
+     *  + its ACTIVE bit is not set (otherwise it would be Active+Pending)
      * Conveniently we can bulk-calculate this with bitwise operations.
      */
     uint32_t pend, grpmask, grpmod;
 
     pend = cs->gicr_ipendr0 | (~cs->edge_trigger & cs->level);
     pend &= cs->gicr_ienabler0;
+    pend &= ~cs->gicr_iactiver0;
 
     if (cs->gic->gicd_ctlr & GICD_CTLR_DS) {
         grpmod = 0;
-- 
2.7.4


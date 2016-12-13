Received: by 10.25.205.13 with SMTP id d13csp2122754lfg;
        Tue, 13 Dec 2016 02:54:24 -0800 (PST)
X-Received: by 10.55.70.76 with SMTP id t73mr81445195qka.195.1481626464441;
        Tue, 13 Dec 2016 02:54:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id n89si27936039qtd.91.2016.12.13.02.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 02:54:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37163 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGkiz-0002jl-EI
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 05:54:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkSv-0005gB-76
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cGkSr-0000Ac-04
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 05:37:45 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cGkSq-000087-Pq; Tue, 13 Dec 2016 05:37:40 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cGkRj-0002Id-Fx; Tue, 13 Dec 2016 10:36:31 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Dec 2016 10:36:10 +0000
Message-Id: <1481625384-15077-10-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 09/23] hw/intc/arm_gic: Add external IRQ lines
 for VIRQ and VFIQ
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
X-TUID: WrxXLRH9qDhE

Augment the GIC's QOM device interface by adding two
new sets of sysbus IRQ lines, to signal VIRQ and VFIQ to
each CPU.

We never use these, but it's helpful to keep the v2-and-earlier
GIC's external interface in line with that of the GICv3 to
avoid board code having to add extra code conditional on which
version of the GIC is in use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/intc/arm_gic_common.h | 2 ++
 hw/intc/arm_gic_common.c         | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
index f4c349a..af3ca18 100644
--- a/include/hw/intc/arm_gic_common.h
+++ b/include/hw/intc/arm_gic_common.h
@@ -55,6 +55,8 @@ typedef struct GICState {
 
     qemu_irq parent_irq[GIC_NCPU];
     qemu_irq parent_fiq[GIC_NCPU];
+    qemu_irq parent_virq[GIC_NCPU];
+    qemu_irq parent_vfiq[GIC_NCPU];
     /* GICD_CTLR; for a GIC with the security extensions the NS banked version
      * of this register is just an alias of bit 1 of the S banked version.
      */
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 0a1f56a..4a8df44 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -110,6 +110,12 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
     for (i = 0; i < s->num_cpu; i++) {
         sysbus_init_irq(sbd, &s->parent_fiq[i]);
     }
+    for (i = 0; i < s->num_cpu; i++) {
+        sysbus_init_irq(sbd, &s->parent_virq[i]);
+    }
+    for (i = 0; i < s->num_cpu; i++) {
+        sysbus_init_irq(sbd, &s->parent_vfiq[i]);
+    }
 
     /* Distributor */
     memory_region_init_io(&s->iomem, OBJECT(s), ops, s, "gic_dist", 0x1000);
-- 
2.7.4


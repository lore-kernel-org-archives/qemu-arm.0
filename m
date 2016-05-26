Received: by 10.25.30.65 with SMTP id e62csp549500lfe;
        Thu, 26 May 2016 08:24:48 -0700 (PDT)
X-Received: by 10.55.112.69 with SMTP id l66mr9817675qkc.20.1464276281771;
        Thu, 26 May 2016 08:24:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 79si7741968qhw.132.2016.05.26.08.24.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 08:24:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38956 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5x9N-0006St-4R
	for alex.bennee@linaro.org; Thu, 26 May 2016 11:24:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9F-0006Ox-Uv
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9E-0004V7-0x
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:32 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5x9D-0004Uz-Oi; Thu, 26 May 2016 11:24:31 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whM-00046O-SY; Thu, 26 May 2016 15:55:44 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:25 +0100
Message-Id: <1464274540-19693-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 07/22] hw/intc/arm_gicv3: Move irq lines into
 GICv3CPUState structure
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
X-TUID: HIo0zGVGuF7l

Move the GICv3 parent_irq and parent_fiq pointers into the
GICv3CPUState structure rather than giving them their own array.
This will make it easy to assert the IRQ and FIQ lines for a
particular CPU interface without having to know or calculate
the CPU index for the GICv3CPUState we are working on.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c         | 7 ++-----
 include/hw/intc/arm_gicv3_common.h | 5 ++---
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index bf6949f..1557833 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -72,14 +72,11 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
     i = s->num_irq - GIC_INTERNAL + GIC_INTERNAL * s->num_cpu;
     qdev_init_gpio_in(DEVICE(s), handler, i);
 
-    s->parent_irq = g_malloc(s->num_cpu * sizeof(qemu_irq));
-    s->parent_fiq = g_malloc(s->num_cpu * sizeof(qemu_irq));
-
     for (i = 0; i < s->num_cpu; i++) {
-        sysbus_init_irq(sbd, &s->parent_irq[i]);
+        sysbus_init_irq(sbd, &s->cpu[i].parent_irq);
     }
     for (i = 0; i < s->num_cpu; i++) {
-        sysbus_init_irq(sbd, &s->parent_fiq[i]);
+        sysbus_init_irq(sbd, &s->cpu[i].parent_fiq);
     }
 
     memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
index 6d4327b..f01b616 100644
--- a/include/hw/intc/arm_gicv3_common.h
+++ b/include/hw/intc/arm_gicv3_common.h
@@ -135,6 +135,8 @@ typedef struct GICv3CPUState GICv3CPUState;
 struct GICv3CPUState {
     GICv3State *gic;
     CPUState *cpu;
+    qemu_irq parent_irq;
+    qemu_irq parent_fiq;
 
     /* Redistributor */
     uint32_t level;                  /* Current IRQ level */
@@ -169,9 +171,6 @@ struct GICv3State {
     SysBusDevice parent_obj;
     /*< public >*/
 
-    qemu_irq *parent_irq;
-    qemu_irq *parent_fiq;
-
     MemoryRegion iomem_dist; /* Distributor */
     MemoryRegion iomem_redist; /* Redistributors */
 
-- 
1.9.1


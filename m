Received: by 10.182.158.201 with SMTP id ww9csp3414120obb;
        Wed, 2 Dec 2015 16:23:51 -0800 (PST)
X-Received: by 10.140.251.212 with SMTP id w203mr8345738qhc.25.1449102231954;
        Wed, 02 Dec 2015 16:23:51 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z203si6180896qka.44.2015.12.02.16.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hgd-0004IB-FX
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:23:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc5-0004Gj-Pd
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc4-00020I-AX
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:09 -0500
Received: from mail-qk0-x230.google.com ([2607:f8b0:400d:c09::230]:36363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc4-00020D-61; Wed, 02 Dec 2015 19:19:08 -0500
Received: by qkda6 with SMTP id a6so23875525qkd.3;
	Wed, 02 Dec 2015 16:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4RBR1L07r+KbcMN/N5Zy8UWwVvV13Un660HDjnyu7rc=;
	b=ioYtsfrJGO0LyX3gYfe1J+zEyeIUPR0iPlXtquRuGBXUBhWvfDmP+s+/YWizKhDnUi
	MpleNGVie0KBgo49UeX1b49wl40qvkYmbZnahDY5baFVO+UG4j4CP2TSZ4rhGnnoAN3t
	pdU7Um66thmZnnXsI3kWaS0f4hne5OnlDzSULfaqduPoIvXDa3UDsReB+ZzPA/GHpCcZ
	I4j9ZTxg1gAwPd6GCtxmpqUuz4urGBZSF7BWPfYCLhv5cm0W4MQ3XFRyA2KIglCFvywo
	m/q5ey4kU8rxZnyOnd50U82D/77DfQg3Q1DUItua8vk2x3n7J8oF4WFb1Z/5xGw93pu7
	eczA==
X-Received: by 10.55.74.16 with SMTP id x16mr7456797qka.80.1449101947791;
	Wed, 02 Dec 2015 16:19:07 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:07 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:38 -0500
Message-Id: <1449101933-24928-12-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::230
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 11/26] arm: gic: Remove references to NVIC
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
X-TUID: zDUQXkGhD1w9

armv7m_nvic.c no longer relies on the GIC.
Remove REV_NVIC and conditionals which use it.
---
 hw/intc/arm_gic.c        | 14 +++++++-------
 hw/intc/arm_gic_common.c | 23 ++++++++---------------
 hw/intc/gic_internal.h   |  7 ++-----
 3 files changed, 17 insertions(+), 27 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 13e297d..2b09cd9 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -182,7 +182,7 @@ static void gic_set_irq(void *opaque, int irq, int level)
         return;
     }
 
-    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+    if (s->revision == REV_11MPCORE) {
         gic_set_irq_11mpcore(s, irq, level, cm, target);
     } else {
         gic_set_irq_generic(s, irq, level, cm, target);
@@ -333,7 +333,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         return 1023;
     }
 
-    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+    if (s->revision == REV_11MPCORE) {
         /* Clear pending flags for both level and edge triggered interrupts.
          * Level triggered IRQs will be reasserted once they become inactive.
          */
@@ -512,7 +512,7 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         return; /* No active IRQ.  */
     }
 
-    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+    if (s->revision == REV_11MPCORE) {
         /* Mark level triggered interrupts as pending if they are still
            raised.  */
         if (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_ENABLED(irq, cm)
@@ -670,7 +670,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
     } else if (offset < 0xf10) {
         goto bad_reg;
     } else if (offset < 0xf30) {
-        if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+        if (s->revision == REV_11MPCORE) {
             goto bad_reg;
         }
 
@@ -881,7 +881,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         if (irq < GIC_NR_SGIS)
             value |= 0xaa;
         for (i = 0; i < 4; i++) {
-            if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+            if (s->revision == REV_11MPCORE) {
                 if (value & (1 << (i * 2))) {
                     GIC_SET_MODEL(irq + i);
                 } else {
@@ -899,7 +899,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         goto bad_reg;
     } else if (offset < 0xf20) {
         /* GICD_CPENDSGIRn */
-        if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+        if (s->revision == REV_11MPCORE) {
             goto bad_reg;
         }
         irq = (offset - 0xf10);
@@ -910,7 +910,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
     } else if (offset < 0xf30) {
         /* GICD_SPENDSGIRn */
-        if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
+        if (s->revision == REV_11MPCORE) {
             goto bad_reg;
         }
         irq = (offset - 0xf20);
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 9c82b97..4987047 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -97,9 +97,7 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
      *  [N+32..N+63] PPIs for CPU 1
      *   ...
      */
-    if (s->revision != REV_NVIC) {
-        i += (GIC_INTERNAL * s->num_cpu);
-    }
+    i += (GIC_INTERNAL * s->num_cpu);
     qdev_init_gpio_in(DEVICE(s), handler, i);
 
     for (i = 0; i < s->num_cpu; i++) {
@@ -113,16 +111,12 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
     memory_region_init_io(&s->iomem, OBJECT(s), ops, s, "gic_dist", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
 
-    if (s->revision != REV_NVIC) {
-        /* This is the main CPU interface "for this core". It is always
-         * present because it is required by both software emulation and KVM.
-         * NVIC is not handled here because its CPU interface is different,
-         * neither it can use KVM.
-         */
-        memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
-                              s, "gic_cpu", s->revision == 2 ? 0x1000 : 0x100);
-        sysbus_init_mmio(sbd, &s->cpuiomem[0]);
-    }
+    /* This is the main CPU interface "for this core". It is always
+     * present because it is required by both software emulation and KVM.
+     */
+    memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
+                          s, "gic_cpu", s->revision == 2 ? 0x1000 : 0x100);
+    sysbus_init_mmio(sbd, &s->cpuiomem[0]);
 }
 
 static void arm_gic_common_realize(DeviceState *dev, Error **errp)
@@ -154,7 +148,7 @@ static void arm_gic_common_realize(DeviceState *dev, Error **errp)
     }
 
     if (s->security_extn &&
-        (s->revision == REV_11MPCORE || s->revision == REV_NVIC)) {
+        (s->revision == REV_11MPCORE)) {
         error_setg(errp, "this GIC revision does not implement "
                    "the security extensions");
         return;
@@ -247,7 +241,6 @@ static Property arm_gic_common_properties[] = {
     DEFINE_PROP_UINT32("num-irq", GICState, num_irq, 32),
     /* Revision can be 1 or 2 for GIC architecture specification
      * versions 1 or 2, or 0 to indicate the legacy 11MPCore GIC.
-     * (Internally, 0xffffffff also indicates "not a GIC but an NVIC".)
      */
     DEFINE_PROP_UINT32("revision", GICState, revision, 1),
     /* True if the GIC should implement the security extensions */
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 20c1e8a..a1f9320 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -25,9 +25,7 @@
 
 #define ALL_CPU_MASK ((unsigned)(((1 << GIC_NCPU) - 1)))
 
-/* The NVIC has 16 internal vectors.  However these are not exposed
-   through the normal GIC interface.  */
-#define GIC_BASE_IRQ ((s->revision == REV_NVIC) ? 32 : 0)
+#define GIC_BASE_IRQ 0
 
 #define GIC_SET_ENABLED(irq, cm) s->irq_state[irq].enabled |= (cm)
 #define GIC_CLEAR_ENABLED(irq, cm) s->irq_state[irq].enabled &= ~(cm)
@@ -75,7 +73,6 @@
 
 /* The special cases for the revision property: */
 #define REV_11MPCORE 0
-#define REV_NVIC 0xffffffff
 
 void gic_set_pending_private(GICState *s, int cpu, int irq);
 uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
@@ -87,7 +84,7 @@ void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
 
 static inline bool gic_test_pending(GICState *s, int irq, int cm)
 {
-    if (s->revision == REV_NVIC || s->revision == REV_11MPCORE) {
+    if (s->revision == REV_11MPCORE) {
         return s->irq_state[irq].pending & cm;
     } else {
         /* Edge-triggered interrupts are marked pending on a rising edge, but
-- 
2.1.4


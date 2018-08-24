Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2509424wrd;
        Fri, 24 Aug 2018 09:18:39 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYZpOrVOafZQZW2kvN43F+8pYnld8GIRAwOPpIbX5c+0J8C7Uckx9bn48QQb0a21+w0YtCM
X-Received: by 2002:ac8:611c:: with SMTP id a28-v6mr2519509qtm.130.1535127519440;
        Fri, 24 Aug 2018 09:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535127519; cv=none;
        d=google.com; s=arc-20160816;
        b=pJqnqi7l1MZ6CFnevFQD4w/Df0eeEad810t20BmgWRNe80pWx6PskSz7AxLdZUsTL1
         5pS0xDb1sms7WqfquMyHHovK2ao/ZTH9PxlfIO+ZxWOGYEW+L3QaJ35MDiCY9YdOLEGi
         h4gVQ2QBNcixuxEkvGL+8XNpvi7L6t6kp+APLjtnSzVsBKsHtL9x4jYbyTnPCjWCoIUk
         SyAyBcYBrlc/XKQFJ9lvZHtn9nEHjMLFn81eorsiG+oxUWRuO3ywm7zbgoAL8Gq32OQc
         NayUHoq7Lat6UuSNQU3V8Zff0I3IzO6cyL+WG8oe+PyIBIA3xHZoYu8jsU3XFGq7eDeq
         hjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=KptozLvvfbyOAnSzUX7V+OXpzpEHzEYpN79bDYa6RB8=;
        b=u8hhPn9NPz0tDIaubiEHYM6Z00RAF2HNgePAR+p3QvX+6sqjTGvkaz6bn+QDhOGsu+
         kCG9Ru6b91Du/QfTWRSc33U0Avt1wAWx/bJTaONCAOyh3FVYbhjeT7YE4p3uKiQoyh2L
         ba3035q2AJJ7wjPp0a0oZI2AyGmHX8P3twbkXZLhPh0S0pKjIH+P82zjrDwS2aXVktBm
         Q7d1jFO7PFsN5LbQw7KaYXYrCpXIUptTXmslux+kGArC/tyulcSK/n1ooC0isfAXo0L7
         ctLW77TOrd7P1PAJ8xljydbFlrFJcrGJvN6GQfQ2ub5wG4LCrnKf9BD2jzpFI9ApgiTq
         3CaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e3-v6si6290201qtd.39.2018.08.24.09.18.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Aug 2018 09:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ftEnG-0007Di-Ue
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 12:18:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ftEn4-00075o-3q
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 12:18:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1ftEn2-00067g-VE
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 12:18:26 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1ftEn2-00064H-JJ; Fri, 24 Aug 2018 12:18:24 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ftEn0-0006vH-30; Fri, 24 Aug 2018 17:18:22 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 24 Aug 2018 17:18:19 +0100
Message-Id: <20180824161819.11085-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] hw/intc/arm_gic: Drop GIC_BASE_IRQ macro
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
X-TUID: 22h6UTpbZjAR

The GIC_BASE_IRQ macro is a leftover from when we shared code
between the GICv2 and the v7M NVIC. Since the NVIC is now
split off, GIC_BASE_IRQ is always 0, and we can just delete it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/gic_internal.h   |  2 --
 hw/intc/arm_gic.c        | 31 ++++++++++++++-----------------
 hw/intc/arm_gic_common.c |  1 -
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 45c2af0bf59..8d29b40ca10 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -26,8 +26,6 @@
 
 #define ALL_CPU_MASK ((unsigned)(((1 << GIC_NCPU) - 1)))
 
-#define GIC_BASE_IRQ 0
-
 #define GIC_DIST_SET_ENABLED(irq, cm) (s->irq_state[irq].enabled |= (cm))
 #define GIC_DIST_CLEAR_ENABLED(irq, cm) (s->irq_state[irq].enabled &= ~(cm))
 #define GIC_DIST_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled & (cm)) != 0)
diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 542b4b93eab..b3ac2d11fc5 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -955,7 +955,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             res = 0;
             if (!(s->security_extn && !attrs.secure) && gic_has_groups(s)) {
                 /* Every byte offset holds 8 group status bits */
-                irq = (offset - 0x080) * 8 + GIC_BASE_IRQ;
+                irq = (offset - 0x080) * 8;
                 if (irq >= s->num_irq) {
                     goto bad_reg;
                 }
@@ -974,7 +974,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             irq = (offset - 0x100) * 8;
         else
             irq = (offset - 0x180) * 8;
-        irq += GIC_BASE_IRQ;
         if (irq >= s->num_irq)
             goto bad_reg;
         res = 0;
@@ -994,7 +993,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             irq = (offset - 0x200) * 8;
         else
             irq = (offset - 0x280) * 8;
-        irq += GIC_BASE_IRQ;
         if (irq >= s->num_irq)
             goto bad_reg;
         res = 0;
@@ -1019,7 +1017,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             goto bad_reg;
         }
 
-        irq += GIC_BASE_IRQ;
         if (irq >= s->num_irq)
             goto bad_reg;
         res = 0;
@@ -1036,7 +1033,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         }
     } else if (offset < 0x800) {
         /* Interrupt Priority.  */
-        irq = (offset - 0x400) + GIC_BASE_IRQ;
+        irq = (offset - 0x400);
         if (irq >= s->num_irq)
             goto bad_reg;
         res = gic_dist_get_priority(s, cpu, irq, attrs);
@@ -1046,7 +1043,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             /* For uniprocessor GICs these RAZ/WI */
             res = 0;
         } else {
-            irq = (offset - 0x800) + GIC_BASE_IRQ;
+            irq = (offset - 0x800);
             if (irq >= s->num_irq) {
                 goto bad_reg;
             }
@@ -1060,7 +1057,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         }
     } else if (offset < 0xf00) {
         /* Interrupt Configuration.  */
-        irq = (offset - 0xc00) * 4 + GIC_BASE_IRQ;
+        irq = (offset - 0xc00) * 4;
         if (irq >= s->num_irq)
             goto bad_reg;
         res = 0;
@@ -1183,7 +1180,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
              */
             if (!(s->security_extn && !attrs.secure) && gic_has_groups(s)) {
                 /* Every byte offset holds 8 group status bits */
-                irq = (offset - 0x80) * 8 + GIC_BASE_IRQ;
+                irq = (offset - 0x80) * 8;
                 if (irq >= s->num_irq) {
                     goto bad_reg;
                 }
@@ -1204,7 +1201,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
     } else if (offset < 0x180) {
         /* Interrupt Set Enable.  */
-        irq = (offset - 0x100) * 8 + GIC_BASE_IRQ;
+        irq = (offset - 0x100) * 8;
         if (irq >= s->num_irq)
             goto bad_reg;
         if (irq < GIC_NR_SGIS) {
@@ -1239,7 +1236,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
     } else if (offset < 0x200) {
         /* Interrupt Clear Enable.  */
-        irq = (offset - 0x180) * 8 + GIC_BASE_IRQ;
+        irq = (offset - 0x180) * 8;
         if (irq >= s->num_irq)
             goto bad_reg;
         if (irq < GIC_NR_SGIS) {
@@ -1264,7 +1261,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
     } else if (offset < 0x280) {
         /* Interrupt Set Pending.  */
-        irq = (offset - 0x200) * 8 + GIC_BASE_IRQ;
+        irq = (offset - 0x200) * 8;
         if (irq >= s->num_irq)
             goto bad_reg;
         if (irq < GIC_NR_SGIS) {
@@ -1283,7 +1280,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
     } else if (offset < 0x300) {
         /* Interrupt Clear Pending.  */
-        irq = (offset - 0x280) * 8 + GIC_BASE_IRQ;
+        irq = (offset - 0x280) * 8;
         if (irq >= s->num_irq)
             goto bad_reg;
         if (irq < GIC_NR_SGIS) {
@@ -1309,7 +1306,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
             goto bad_reg;
         }
 
-        irq = (offset - 0x300) * 8 + GIC_BASE_IRQ;
+        irq = (offset - 0x300) * 8;
         if (irq >= s->num_irq) {
             goto bad_reg;
         }
@@ -1333,7 +1330,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
             goto bad_reg;
         }
 
-        irq = (offset - 0x380) * 8 + GIC_BASE_IRQ;
+        irq = (offset - 0x380) * 8;
         if (irq >= s->num_irq) {
             goto bad_reg;
         }
@@ -1353,7 +1350,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
     } else if (offset < 0x800) {
         /* Interrupt Priority.  */
-        irq = (offset - 0x400) + GIC_BASE_IRQ;
+        irq = (offset - 0x400);
         if (irq >= s->num_irq)
             goto bad_reg;
         gic_dist_set_priority(s, cpu, irq, value, attrs);
@@ -1362,7 +1359,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
          * annoying exception of the 11MPCore's GIC.
          */
         if (s->num_cpu != 1 || s->revision == REV_11MPCORE) {
-            irq = (offset - 0x800) + GIC_BASE_IRQ;
+            irq = (offset - 0x800);
             if (irq >= s->num_irq) {
                 goto bad_reg;
             }
@@ -1375,7 +1372,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         }
     } else if (offset < 0xf00) {
         /* Interrupt Configuration.  */
-        irq = (offset - 0xc00) * 4 + GIC_BASE_IRQ;
+        irq = (offset - 0xc00) * 4;
         if (irq >= s->num_irq)
             goto bad_reg;
         if (irq < GIC_NR_SGIS)
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index 547dc41185e..57569a4e590 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -191,7 +191,6 @@ static void arm_gic_common_realize(DeviceState *dev, Error **errp)
                    s->num_cpu, GIC_NCPU);
         return;
     }
-    s->num_irq += GIC_BASE_IRQ;
     if (s->num_irq > GIC_MAXIRQ) {
         error_setg(errp,
                    "requested %u interrupt lines exceeds GIC maximum %d",
-- 
2.18.0


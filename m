Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp589174wrq;
        Wed, 6 Jun 2018 02:32:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIyi2EbHxOZUxyzyGI/CrnFcyutcKHChaQh+jYRxjrUY0WEWF3tDtFFTklaePlObPU1RlEy
X-Received: by 2002:ac8:2bb2:: with SMTP id m47-v6mr2016533qtm.300.1528277540649;
        Wed, 06 Jun 2018 02:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528277540; cv=none;
        d=google.com; s=arc-20160816;
        b=0VjiKw6e7k4AEUg0vpIg70LW3M3MDJk8SzRvF7IH4/swn72N9ov13zwuk3ljBDrn2z
         baBHwSyF5tI1bxjpsGBAZ9dCYlztMcRlEKL+SswmfDn1RXP9vTmVN1Qu7mcud8HeiUPj
         k6BoufnGOW5dw6z746vccuKSgnZsk+o4HRMyaOS02i4kNsMnQgUyDpAFRBiDJpAylRr0
         le/8uELbNwqKoBIAh1GRHE2VmrymR29BFrj2Zs2EKiwqDELE4w8Pv435YKu6o1trhCBH
         C+hIUaH5jI6TfKlcMfN51BJnG/zrtNyjYvPhp+Bw0FurJHH37a+ycfsG2e9JIlHwlpd7
         Va3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=kVA1nxxWHHUaDylDXIp9N9E66hJ3PsIQobFwMt0tgSs=;
        b=i6vBvS2K4WB2s6O1QWUyEJ7/liv+Ds9RsgrKs9DQi8P7lBWm5YMej9quHJ9qsASIqa
         QSBdwL1wNthGhWa9IZYOLIHTkNqOECSle/lPq+vX4cCvdVW0NUq9lBY+ja5wzlMkT3zj
         9mKJ8QZQLLyiz+NEaZSkLoO1MuDWhadkZPL3a9xw5Zc7/0+c41dQ0FnSISc4O87X3kPF
         pdyY6UR8Pn7gqIj3X5ni2gEpN5d3IE58jNWwEnN9mmO3EVPNs5M6+BSMwcbboWUW96uj
         6Y9kwUcD50GEkiFaQCLRBCTiNfBF+vJWWtQum9gS7e4k0RJ72QLQAXR3KZuWj/MfylWF
         5eXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ns7svx6u;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=As58ZY+h;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=As58ZY+h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f30-v6si3743195qva.253.2018.06.06.02.32.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 02:32:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ns7svx6u;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=As58ZY+h;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=As58ZY+h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQUnk-0001y4-3u
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 05:32:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnG-0001iQ-Du
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnD-0003h0-50
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:50 -0400
Received: from greensocs.com ([193.104.36.180]:53693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fQUnC-0003fZ-ID; Wed, 06 Jun 2018 05:31:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AAE60443565;
	Wed,  6 Jun 2018 11:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277498;
	bh=rwcS+ZraJp1hDUvC+VbBKTtl1eym4P80PMXw8pAoC7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ns7svx6umm0EHkcIB5loActyjJIS8L3ns2aUe9lc/hWnsl9oqgrx11JOck53nSoNz
	AKTiHJUZ3QuM/zlCGsUkHu6qiuPg0IG/d4cnN0razjME6f6m3j3sMA5TKV8ybY5Ja+
	4GWgXKjXZJ6Dz8yEejV6gUw3Db98H/AwJHbTAR+g=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=As58ZY+h;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=As58ZY+h
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BHXAn0eaR6xh; Wed,  6 Jun 2018 11:31:37 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 45E77443546; Wed,  6 Jun 2018 11:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277497;
	bh=rwcS+ZraJp1hDUvC+VbBKTtl1eym4P80PMXw8pAoC7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=As58ZY+hveDaT9ryT8KXtYaPAJTME1LARTySWZH9ycVZXd2bFKWsnmgftoGI5lsoc
	vnzA7+TfkjXnPUS7FtZ+o7SbfKkvnB0dd5T9s/lihH3kBmOu0ZKbQSqy+1siOoG1Bm
	k2ujSZm+8M5BLx9jRfbwYpAqcJIvZjcnceWYbjUU=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D8CD244354B;
	Wed,  6 Jun 2018 11:31:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277497;
	bh=rwcS+ZraJp1hDUvC+VbBKTtl1eym4P80PMXw8pAoC7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=As58ZY+hveDaT9ryT8KXtYaPAJTME1LARTySWZH9ycVZXd2bFKWsnmgftoGI5lsoc
	vnzA7+TfkjXnPUS7FtZ+o7SbfKkvnB0dd5T9s/lihH3kBmOu0ZKbQSqy+1siOoG1Bm
	k2ujSZm+8M5BLx9jRfbwYpAqcJIvZjcnceWYbjUU=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Wed,  6 Jun 2018 11:30:56 +0200
Message-Id: <20180606093101.30518-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180606093101.30518-1-luc.michel@greensocs.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 1/6] intc/arm_gic: Refactor operations on the
 distributor
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc MICHEL <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: saB9GHSpkmsm

From: Luc MICHEL <luc.michel@greensocs.com>

In preparation for the virtualization extensions implementation,
refactor the name of the functions and macros that act on the GIC
distributor to make that fact explicit. It will be useful to
differentiate them from the ones that will act on the virtual
interfaces.

Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c        | 164 ++++++++++++++++++++-------------------
 hw/intc/arm_gic_common.c |   6 +-
 hw/intc/arm_gic_kvm.c    |  23 +++---
 hw/intc/gic_internal.h   |  51 ++++++------
 4 files changed, 127 insertions(+), 117 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index ea0323f969..141f3e7a48 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -92,11 +92,12 @@ void gic_update(GICState *s)
         best_prio = 0x100;
         best_irq = 1023;
         for (irq = 0; irq < s->num_irq; irq++) {
-            if (GIC_TEST_ENABLED(irq, cm) && gic_test_pending(s, irq, cm) &&
-                (!GIC_TEST_ACTIVE(irq, cm)) &&
-                (irq < GIC_INTERNAL || GIC_TARGET(irq) & cm)) {
-                if (GIC_GET_PRIORITY(irq, cpu) < best_prio) {
-                    best_prio = GIC_GET_PRIORITY(irq, cpu);
+            if (GIC_DIST_TEST_ENABLED(irq, cm) &&
+                gic_test_pending(s, irq, cm) &&
+                (!GIC_DIST_TEST_ACTIVE(irq, cm)) &&
+                (irq < GIC_INTERNAL || GIC_DIST_TARGET(irq) & cm)) {
+                if (GIC_DIST_GET_PRIORITY(irq, cpu) < best_prio) {
+                    best_prio = GIC_DIST_GET_PRIORITY(irq, cpu);
                     best_irq = irq;
                 }
             }
@@ -112,7 +113,7 @@ void gic_update(GICState *s)
         if (best_prio < s->priority_mask[cpu]) {
             s->current_pending[cpu] = best_irq;
             if (best_prio < s->running_priority[cpu]) {
-                int group = GIC_TEST_GROUP(best_irq, cm);
+                int group = GIC_DIST_TEST_GROUP(best_irq, cm);
 
                 if (extract32(s->ctlr, group, 1) &&
                     extract32(s->cpu_ctlr[cpu], group, 1)) {
@@ -145,7 +146,7 @@ void gic_set_pending_private(GICState *s, int cpu, int irq)
     }
 
     DPRINTF("Set %d pending cpu %d\n", irq, cpu);
-    GIC_SET_PENDING(irq, cm);
+    GIC_DIST_SET_PENDING(irq, cm);
     gic_update(s);
 }
 
@@ -153,13 +154,13 @@ static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
                                  int cm, int target)
 {
     if (level) {
-        GIC_SET_LEVEL(irq, cm);
-        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)) {
+        GIC_DIST_SET_LEVEL(irq, cm);
+        if (GIC_DIST_TEST_EDGE_TRIGGER(irq) || GIC_DIST_TEST_ENABLED(irq, cm)) {
             DPRINTF("Set %d pending mask %x\n", irq, target);
-            GIC_SET_PENDING(irq, target);
+            GIC_DIST_SET_PENDING(irq, target);
         }
     } else {
-        GIC_CLEAR_LEVEL(irq, cm);
+        GIC_DIST_CLEAR_LEVEL(irq, cm);
     }
 }
 
@@ -167,13 +168,13 @@ static void gic_set_irq_generic(GICState *s, int irq, int level,
                                 int cm, int target)
 {
     if (level) {
-        GIC_SET_LEVEL(irq, cm);
+        GIC_DIST_SET_LEVEL(irq, cm);
         DPRINTF("Set %d pending mask %x\n", irq, target);
-        if (GIC_TEST_EDGE_TRIGGER(irq)) {
-            GIC_SET_PENDING(irq, target);
+        if (GIC_DIST_TEST_EDGE_TRIGGER(irq)) {
+            GIC_DIST_SET_PENDING(irq, target);
         }
     } else {
-        GIC_CLEAR_LEVEL(irq, cm);
+        GIC_DIST_CLEAR_LEVEL(irq, cm);
     }
 }
 
@@ -192,7 +193,7 @@ static void gic_set_irq(void *opaque, int irq, int level)
         /* The first external input line is internal interrupt 32.  */
         cm = ALL_CPU_MASK;
         irq += GIC_INTERNAL;
-        target = GIC_TARGET(irq);
+        target = GIC_DIST_TARGET(irq);
     } else {
         int cpu;
         irq -= (s->num_irq - GIC_INTERNAL);
@@ -204,7 +205,7 @@ static void gic_set_irq(void *opaque, int irq, int level)
 
     assert(irq >= GIC_NR_SGIS);
 
-    if (level == GIC_TEST_LEVEL(irq, cm)) {
+    if (level == GIC_DIST_TEST_LEVEL(irq, cm)) {
         return;
     }
 
@@ -224,7 +225,7 @@ static uint16_t gic_get_current_pending_irq(GICState *s, int cpu,
     uint16_t pending_irq = s->current_pending[cpu];
 
     if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
-        int group = GIC_TEST_GROUP(pending_irq, (1 << cpu));
+        int group = GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
         /* On a GIC without the security extensions, reading this register
          * behaves in the same way as a secure access to a GIC with them.
          */
@@ -255,7 +256,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
 
     if (gic_has_groups(s) &&
         !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
-        GIC_TEST_GROUP(irq, (1 << cpu))) {
+        GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
         bpr = s->abpr[cpu] - 1;
         assert(bpr >= 0);
     } else {
@@ -268,7 +269,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
      */
     mask = ~0U << ((bpr & 7) + 1);
 
-    return GIC_GET_PRIORITY(irq, cpu) & mask;
+    return GIC_DIST_GET_PRIORITY(irq, cpu) & mask;
 }
 
 static void gic_activate_irq(GICState *s, int cpu, int irq)
@@ -281,14 +282,14 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
     int regno = preemption_level / 32;
     int bitno = preemption_level % 32;
 
-    if (gic_has_groups(s) && GIC_TEST_GROUP(irq, (1 << cpu))) {
+    if (gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
         s->nsapr[regno][cpu] |= (1 << bitno);
     } else {
         s->apr[regno][cpu] |= (1 << bitno);
     }
 
     s->running_priority[cpu] = prio;
-    GIC_SET_ACTIVE(irq, 1 << cpu);
+    GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
 }
 
 static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
@@ -357,7 +358,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         return irq;
     }
 
-    if (GIC_GET_PRIORITY(irq, cpu) >= s->running_priority[cpu]) {
+    if (GIC_DIST_GET_PRIORITY(irq, cpu) >= s->running_priority[cpu]) {
         DPRINTF("ACK, pending interrupt (%d) has insufficient priority\n", irq);
         return 1023;
     }
@@ -366,7 +367,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         /* Clear pending flags for both level and edge triggered interrupts.
          * Level triggered IRQs will be reasserted once they become inactive.
          */
-        GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : cm);
+        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
+                                                             : cm);
         ret = irq;
     } else {
         if (irq < GIC_NR_SGIS) {
@@ -378,7 +380,9 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
             src = ctz32(s->sgi_pending[irq][cpu]);
             s->sgi_pending[irq][cpu] &= ~(1 << src);
             if (s->sgi_pending[irq][cpu] == 0) {
-                GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : cm);
+                GIC_DIST_CLEAR_PENDING(irq,
+                                       GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
+                                                                : cm);
             }
             ret = irq | ((src & 0x7) << 10);
         } else {
@@ -386,7 +390,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
              * interrupts. (level triggered interrupts with an active line
              * remain pending, see gic_test_pending)
              */
-            GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : cm);
+            GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
+                                                                 : cm);
             ret = irq;
         }
     }
@@ -397,11 +402,11 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
     return ret;
 }
 
-void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
+void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
                       MemTxAttrs attrs)
 {
     if (s->security_extn && !attrs.secure) {
-        if (!GIC_TEST_GROUP(irq, (1 << cpu))) {
+        if (!GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
             return; /* Ignore Non-secure access of Group0 IRQ */
         }
         val = 0x80 | (val >> 1); /* Non-secure view */
@@ -414,13 +419,13 @@ void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
     }
 }
 
-static uint32_t gic_get_priority(GICState *s, int cpu, int irq,
+static uint32_t gic_dist_get_priority(GICState *s, int cpu, int irq,
                                  MemTxAttrs attrs)
 {
-    uint32_t prio = GIC_GET_PRIORITY(irq, cpu);
+    uint32_t prio = GIC_DIST_GET_PRIORITY(irq, cpu);
 
     if (s->security_extn && !attrs.secure) {
-        if (!GIC_TEST_GROUP(irq, (1 << cpu))) {
+        if (!GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
             return 0; /* Non-secure access cannot read priority of Group0 IRQ */
         }
         prio = (prio << 1) & 0xff; /* Non-secure view */
@@ -543,7 +548,7 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
 static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
     int cm = 1 << cpu;
-    int group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
+    int group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
 
     if (!gic_eoi_split(s, cpu, attrs)) {
         /* This is UNPREDICTABLE; we choose to ignore it */
@@ -557,7 +562,7 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         return;
     }
 
-    GIC_CLEAR_ACTIVE(irq, cm);
+    GIC_DIST_CLEAR_ACTIVE(irq, cm);
 }
 
 void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
@@ -584,14 +589,15 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     if (s->revision == REV_11MPCORE) {
         /* Mark level triggered interrupts as pending if they are still
            raised.  */
-        if (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_ENABLED(irq, cm)
-            && GIC_TEST_LEVEL(irq, cm) && (GIC_TARGET(irq) & cm) != 0) {
+        if (!GIC_DIST_TEST_EDGE_TRIGGER(irq) && GIC_DIST_TEST_ENABLED(irq, cm)
+            && GIC_DIST_TEST_LEVEL(irq, cm)
+            && (GIC_DIST_TARGET(irq) & cm) != 0) {
             DPRINTF("Set %d pending mask %x\n", irq, cm);
-            GIC_SET_PENDING(irq, cm);
+            GIC_DIST_SET_PENDING(irq, cm);
         }
     }
 
-    group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
+    group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
 
     if (s->security_extn && !attrs.secure && !group) {
         DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
@@ -607,7 +613,7 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 
     /* In GICv2 the guest can choose to split priority-drop and deactivate */
     if (!gic_eoi_split(s, cpu, attrs)) {
-        GIC_CLEAR_ACTIVE(irq, cm);
+        GIC_DIST_CLEAR_ACTIVE(irq, cm);
     }
     gic_update(s);
 }
@@ -655,7 +661,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
                     goto bad_reg;
                 }
                 for (i = 0; i < 8; i++) {
-                    if (GIC_TEST_GROUP(irq + i, cm)) {
+                    if (GIC_DIST_TEST_GROUP(irq + i, cm)) {
                         res |= (1 << i);
                     }
                 }
@@ -675,11 +681,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         res = 0;
         for (i = 0; i < 8; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
 
-            if (GIC_TEST_ENABLED(irq + i, cm)) {
+            if (GIC_DIST_TEST_ENABLED(irq + i, cm)) {
                 res |= (1 << i);
             }
         }
@@ -696,7 +702,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         mask = (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
         for (i = 0; i < 8; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
 
@@ -713,11 +719,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         mask = (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
         for (i = 0; i < 8; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
 
-            if (GIC_TEST_ACTIVE(irq + i, mask)) {
+            if (GIC_DIST_TEST_ACTIVE(irq + i, mask)) {
                 res |= (1 << i);
             }
         }
@@ -726,7 +732,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         irq = (offset - 0x400) + GIC_BASE_IRQ;
         if (irq >= s->num_irq)
             goto bad_reg;
-        res = gic_get_priority(s, cpu, irq, attrs);
+        res = gic_dist_get_priority(s, cpu, irq, attrs);
     } else if (offset < 0xc00) {
         /* Interrupt CPU Target.  */
         if (s->num_cpu == 1 && s->revision != REV_11MPCORE) {
@@ -740,7 +746,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             if (irq >= 29 && irq <= 31) {
                 res = cm;
             } else {
-                res = GIC_TARGET(irq);
+                res = GIC_DIST_TARGET(irq);
             }
         }
     } else if (offset < 0xf00) {
@@ -751,14 +757,16 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         res = 0;
         for (i = 0; i < 4; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
 
-            if (GIC_TEST_MODEL(irq + i))
+            if (GIC_DIST_TEST_MODEL(irq + i)) {
                 res |= (1 << (i * 2));
-            if (GIC_TEST_EDGE_TRIGGER(irq + i))
+            }
+            if (GIC_DIST_TEST_EDGE_TRIGGER(irq + i)) {
                 res |= (2 << (i * 2));
+            }
         }
     } else if (offset < 0xf10) {
         goto bad_reg;
@@ -776,7 +784,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
         }
 
         if (s->security_extn && !attrs.secure &&
-            !GIC_TEST_GROUP(irq, 1 << cpu)) {
+            !GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
             res = 0; /* Ignore Non-secure access of Group0 IRQ */
         } else {
             res = s->sgi_pending[irq][cpu];
@@ -872,10 +880,10 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
                     int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
                     if (value & (1 << i)) {
                         /* Group1 (Non-secure) */
-                        GIC_SET_GROUP(irq + i, cm);
+                        GIC_DIST_SET_GROUP(irq + i, cm);
                     } else {
                         /* Group0 (Secure) */
-                        GIC_CLEAR_GROUP(irq + i, cm);
+                        GIC_DIST_CLEAR_GROUP(irq + i, cm);
                     }
                 }
             }
@@ -893,26 +901,26 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
 
         for (i = 0; i < 8; i++) {
             if (value & (1 << i)) {
-                int mask =
-                    (irq < GIC_INTERNAL) ? (1 << cpu) : GIC_TARGET(irq + i);
+                int mask = (irq < GIC_INTERNAL) ? (1 << cpu)
+                                                : GIC_DIST_TARGET(irq + i);
                 int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
 
                 if (s->security_extn && !attrs.secure &&
-                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                     continue; /* Ignore Non-secure access of Group0 IRQ */
                 }
 
-                if (!GIC_TEST_ENABLED(irq + i, cm)) {
+                if (!GIC_DIST_TEST_ENABLED(irq + i, cm)) {
                     DPRINTF("Enabled IRQ %d\n", irq + i);
                     trace_gic_enable_irq(irq + i);
                 }
-                GIC_SET_ENABLED(irq + i, cm);
+                GIC_DIST_SET_ENABLED(irq + i, cm);
                 /* If a raised level triggered IRQ enabled then mark
                    is as pending.  */
-                if (GIC_TEST_LEVEL(irq + i, mask)
-                        && !GIC_TEST_EDGE_TRIGGER(irq + i)) {
+                if (GIC_DIST_TEST_LEVEL(irq + i, mask)
+                        && !GIC_DIST_TEST_EDGE_TRIGGER(irq + i)) {
                     DPRINTF("Set %d pending mask %x\n", irq + i, mask);
-                    GIC_SET_PENDING(irq + i, mask);
+                    GIC_DIST_SET_PENDING(irq + i, mask);
                 }
             }
         }
@@ -930,15 +938,15 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
                 int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
 
                 if (s->security_extn && !attrs.secure &&
-                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                     continue; /* Ignore Non-secure access of Group0 IRQ */
                 }
 
-                if (GIC_TEST_ENABLED(irq + i, cm)) {
+                if (GIC_DIST_TEST_ENABLED(irq + i, cm)) {
                     DPRINTF("Disabled IRQ %d\n", irq + i);
                     trace_gic_disable_irq(irq + i);
                 }
-                GIC_CLEAR_ENABLED(irq + i, cm);
+                GIC_DIST_CLEAR_ENABLED(irq + i, cm);
             }
         }
     } else if (offset < 0x280) {
@@ -953,11 +961,11 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         for (i = 0; i < 8; i++) {
             if (value & (1 << i)) {
                 if (s->security_extn && !attrs.secure &&
-                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                     continue; /* Ignore Non-secure access of Group0 IRQ */
                 }
 
-                GIC_SET_PENDING(irq + i, GIC_TARGET(irq + i));
+                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq + i));
             }
         }
     } else if (offset < 0x300) {
@@ -971,7 +979,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
 
         for (i = 0; i < 8; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
 
@@ -979,7 +987,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
                for per-CPU interrupts.  It's unclear whether this is the
                corect behavior.  */
             if (value & (1 << i)) {
-                GIC_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
+                GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
             }
         }
     } else if (offset < 0x400) {
@@ -990,7 +998,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         irq = (offset - 0x400) + GIC_BASE_IRQ;
         if (irq >= s->num_irq)
             goto bad_reg;
-        gic_set_priority(s, cpu, irq, value, attrs);
+        gic_dist_set_priority(s, cpu, irq, value, attrs);
     } else if (offset < 0xc00) {
         /* Interrupt CPU Target. RAZ/WI on uniprocessor GICs, with the
          * annoying exception of the 11MPCore's GIC.
@@ -1016,21 +1024,21 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
             value |= 0xaa;
         for (i = 0; i < 4; i++) {
             if (s->security_extn && !attrs.secure &&
-                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
                 continue; /* Ignore Non-secure access of Group0 IRQ */
             }
 
             if (s->revision == REV_11MPCORE) {
                 if (value & (1 << (i * 2))) {
-                    GIC_SET_MODEL(irq + i);
+                    GIC_DIST_SET_MODEL(irq + i);
                 } else {
-                    GIC_CLEAR_MODEL(irq + i);
+                    GIC_DIST_CLEAR_MODEL(irq + i);
                 }
             }
             if (value & (2 << (i * 2))) {
-                GIC_SET_EDGE_TRIGGER(irq + i);
+                GIC_DIST_SET_EDGE_TRIGGER(irq + i);
             } else {
-                GIC_CLEAR_EDGE_TRIGGER(irq + i);
+                GIC_DIST_CLEAR_EDGE_TRIGGER(irq + i);
             }
         }
     } else if (offset < 0xf10) {
@@ -1044,10 +1052,10 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         irq = (offset - 0xf10);
 
         if (!s->security_extn || attrs.secure ||
-            GIC_TEST_GROUP(irq, 1 << cpu)) {
+            GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
             s->sgi_pending[irq][cpu] &= ~value;
             if (s->sgi_pending[irq][cpu] == 0) {
-                GIC_CLEAR_PENDING(irq, 1 << cpu);
+                GIC_DIST_CLEAR_PENDING(irq, 1 << cpu);
             }
         }
     } else if (offset < 0xf30) {
@@ -1058,8 +1066,8 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
         irq = (offset - 0xf20);
 
         if (!s->security_extn || attrs.secure ||
-            GIC_TEST_GROUP(irq, 1 << cpu)) {
-            GIC_SET_PENDING(irq, 1 << cpu);
+            GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
+            GIC_DIST_SET_PENDING(irq, 1 << cpu);
             s->sgi_pending[irq][cpu] |= value;
         }
     } else {
@@ -1106,7 +1114,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
             mask = ALL_CPU_MASK;
             break;
         }
-        GIC_SET_PENDING(irq, mask);
+        GIC_DIST_SET_PENDING(irq, mask);
         target_cpu = ctz32(mask);
         while (target_cpu < GIC_NCPU) {
             s->sgi_pending[irq][target_cpu] |= (1 << cpu);
diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
index aee50a20e0..295ee9cc5e 100644
--- a/hw/intc/arm_gic_common.c
+++ b/hw/intc/arm_gic_common.c
@@ -204,8 +204,8 @@ static void arm_gic_common_reset(DeviceState *dev)
         }
     }
     for (i = 0; i < GIC_NR_SGIS; i++) {
-        GIC_SET_ENABLED(i, ALL_CPU_MASK);
-        GIC_SET_EDGE_TRIGGER(i);
+        GIC_DIST_SET_ENABLED(i, ALL_CPU_MASK);
+        GIC_DIST_SET_EDGE_TRIGGER(i);
     }
 
     for (i = 0; i < ARRAY_SIZE(s->priority2); i++) {
@@ -222,7 +222,7 @@ static void arm_gic_common_reset(DeviceState *dev)
     }
     if (s->security_extn && s->irq_reset_nonsecure) {
         for (i = 0; i < GIC_MAXIRQ; i++) {
-            GIC_SET_GROUP(i, ALL_CPU_MASK);
+            GIC_DIST_SET_GROUP(i, ALL_CPU_MASK);
         }
     }
 
diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index 204369d0e2..799136732a 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -140,10 +140,10 @@ static void translate_group(GICState *s, int irq, int cpu,
     int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
 
     if (to_kernel) {
-        *field = GIC_TEST_GROUP(irq, cm);
+        *field = GIC_DIST_TEST_GROUP(irq, cm);
     } else {
         if (*field & 1) {
-            GIC_SET_GROUP(irq, cm);
+            GIC_DIST_SET_GROUP(irq, cm);
         }
     }
 }
@@ -154,10 +154,10 @@ static void translate_enabled(GICState *s, int irq, int cpu,
     int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
 
     if (to_kernel) {
-        *field = GIC_TEST_ENABLED(irq, cm);
+        *field = GIC_DIST_TEST_ENABLED(irq, cm);
     } else {
         if (*field & 1) {
-            GIC_SET_ENABLED(irq, cm);
+            GIC_DIST_SET_ENABLED(irq, cm);
         }
     }
 }
@@ -171,7 +171,7 @@ static void translate_pending(GICState *s, int irq, int cpu,
         *field = gic_test_pending(s, irq, cm);
     } else {
         if (*field & 1) {
-            GIC_SET_PENDING(irq, cm);
+            GIC_DIST_SET_PENDING(irq, cm);
             /* TODO: Capture is level-line is held high in the kernel */
         }
     }
@@ -183,10 +183,10 @@ static void translate_active(GICState *s, int irq, int cpu,
     int cm = (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
 
     if (to_kernel) {
-        *field = GIC_TEST_ACTIVE(irq, cm);
+        *field = GIC_DIST_TEST_ACTIVE(irq, cm);
     } else {
         if (*field & 1) {
-            GIC_SET_ACTIVE(irq, cm);
+            GIC_DIST_SET_ACTIVE(irq, cm);
         }
     }
 }
@@ -195,10 +195,10 @@ static void translate_trigger(GICState *s, int irq, int cpu,
                               uint32_t *field, bool to_kernel)
 {
     if (to_kernel) {
-        *field = (GIC_TEST_EDGE_TRIGGER(irq)) ? 0x2 : 0x0;
+        *field = (GIC_DIST_TEST_EDGE_TRIGGER(irq)) ? 0x2 : 0x0;
     } else {
         if (*field & 0x2) {
-            GIC_SET_EDGE_TRIGGER(irq);
+            GIC_DIST_SET_EDGE_TRIGGER(irq);
         }
     }
 }
@@ -207,9 +207,10 @@ static void translate_priority(GICState *s, int irq, int cpu,
                                uint32_t *field, bool to_kernel)
 {
     if (to_kernel) {
-        *field = GIC_GET_PRIORITY(irq, cpu) & 0xff;
+        *field = GIC_DIST_GET_PRIORITY(irq, cpu) & 0xff;
     } else {
-        gic_set_priority(s, cpu, irq, *field & 0xff, MEMTXATTRS_UNSPECIFIED);
+        gic_dist_set_priority(s, cpu, irq,
+                              *field & 0xff, MEMTXATTRS_UNSPECIFIED);
     }
 }
 
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 7fe87b13de..6f8d242904 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -27,30 +27,31 @@
 
 #define GIC_BASE_IRQ 0
 
-#define GIC_SET_ENABLED(irq, cm) s->irq_state[irq].enabled |= (cm)
-#define GIC_CLEAR_ENABLED(irq, cm) s->irq_state[irq].enabled &= ~(cm)
-#define GIC_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled & (cm)) != 0)
-#define GIC_SET_PENDING(irq, cm) s->irq_state[irq].pending |= (cm)
-#define GIC_CLEAR_PENDING(irq, cm) s->irq_state[irq].pending &= ~(cm)
-#define GIC_SET_ACTIVE(irq, cm) s->irq_state[irq].active |= (cm)
-#define GIC_CLEAR_ACTIVE(irq, cm) s->irq_state[irq].active &= ~(cm)
-#define GIC_TEST_ACTIVE(irq, cm) ((s->irq_state[irq].active & (cm)) != 0)
-#define GIC_SET_MODEL(irq) s->irq_state[irq].model = true
-#define GIC_CLEAR_MODEL(irq) s->irq_state[irq].model = false
-#define GIC_TEST_MODEL(irq) s->irq_state[irq].model
-#define GIC_SET_LEVEL(irq, cm) s->irq_state[irq].level |= (cm)
-#define GIC_CLEAR_LEVEL(irq, cm) s->irq_state[irq].level &= ~(cm)
-#define GIC_TEST_LEVEL(irq, cm) ((s->irq_state[irq].level & (cm)) != 0)
-#define GIC_SET_EDGE_TRIGGER(irq) s->irq_state[irq].edge_trigger = true
-#define GIC_CLEAR_EDGE_TRIGGER(irq) s->irq_state[irq].edge_trigger = false
-#define GIC_TEST_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger)
-#define GIC_GET_PRIORITY(irq, cpu) (((irq) < GIC_INTERNAL) ?            \
+#define GIC_DIST_SET_ENABLED(irq, cm) (s->irq_state[irq].enabled |= (cm))
+#define GIC_DIST_CLEAR_ENABLED(irq, cm) (s->irq_state[irq].enabled &= ~(cm))
+#define GIC_DIST_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled & (cm)) != 0)
+#define GIC_DIST_SET_PENDING(irq, cm) (s->irq_state[irq].pending |= (cm))
+#define GIC_DIST_CLEAR_PENDING(irq, cm) (s->irq_state[irq].pending &= ~(cm))
+#define GIC_DIST_SET_ACTIVE(irq, cm) (s->irq_state[irq].active |= (cm))
+#define GIC_DIST_CLEAR_ACTIVE(irq, cm) (s->irq_state[irq].active &= ~(cm))
+#define GIC_DIST_TEST_ACTIVE(irq, cm) ((s->irq_state[irq].active & (cm)) != 0)
+#define GIC_DIST_SET_MODEL(irq) (s->irq_state[irq].model = true)
+#define GIC_DIST_CLEAR_MODEL(irq) (s->irq_state[irq].model = false)
+#define GIC_DIST_TEST_MODEL(irq) (s->irq_state[irq].model)
+#define GIC_DIST_SET_LEVEL(irq, cm) (s->irq_state[irq].level |= (cm))
+#define GIC_DIST_CLEAR_LEVEL(irq, cm) (s->irq_state[irq].level &= ~(cm))
+#define GIC_DIST_TEST_LEVEL(irq, cm) ((s->irq_state[irq].level & (cm)) != 0)
+#define GIC_DIST_SET_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger = true)
+#define GIC_DIST_CLEAR_EDGE_TRIGGER(irq) \
+    (s->irq_state[irq].edge_trigger = false)
+#define GIC_DIST_TEST_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger)
+#define GIC_DIST_GET_PRIORITY(irq, cpu) (((irq) < GIC_INTERNAL) ?            \
                                     s->priority1[irq][cpu] :            \
                                     s->priority2[(irq) - GIC_INTERNAL])
-#define GIC_TARGET(irq) s->irq_target[irq]
-#define GIC_CLEAR_GROUP(irq, cm) (s->irq_state[irq].group &= ~(cm))
-#define GIC_SET_GROUP(irq, cm) (s->irq_state[irq].group |= (cm))
-#define GIC_TEST_GROUP(irq, cm) ((s->irq_state[irq].group & (cm)) != 0)
+#define GIC_DIST_TARGET(irq) (s->irq_target[irq])
+#define GIC_DIST_CLEAR_GROUP(irq, cm) (s->irq_state[irq].group &= ~(cm))
+#define GIC_DIST_SET_GROUP(irq, cm) (s->irq_state[irq].group |= (cm))
+#define GIC_DIST_TEST_GROUP(irq, cm) ((s->irq_state[irq].group & (cm)) != 0)
 
 #define GICD_CTLR_EN_GRP0 (1U << 0)
 #define GICD_CTLR_EN_GRP1 (1U << 1)
@@ -79,8 +80,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
 void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs);
 void gic_update(GICState *s);
 void gic_init_irqs_and_distributor(GICState *s);
-void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
-                      MemTxAttrs attrs);
+void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
+                           MemTxAttrs attrs);
 
 static inline bool gic_test_pending(GICState *s, int irq, int cm)
 {
@@ -93,7 +94,7 @@ static inline bool gic_test_pending(GICState *s, int irq, int cm)
          * GICD_ISPENDR to set the state pending.
          */
         return (s->irq_state[irq].pending & cm) ||
-            (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_LEVEL(irq, cm));
+            (!GIC_DIST_TEST_EDGE_TRIGGER(irq) && GIC_DIST_TEST_LEVEL(irq, cm));
     }
 }
 
-- 
2.17.0


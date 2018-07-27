Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507910wru;
        Fri, 27 Jul 2018 02:56:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcFhaQhgZZ4Y/qv5rNXBc0OuKxh0alDkaT933teqSOxMOJ5WQUt21+tBDMMNDhQ40i+8Bv/
X-Received: by 2002:a37:b887:: with SMTP id i129-v6mr5070045qkf.310.1532685394684;
        Fri, 27 Jul 2018 02:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685394; cv=none;
        d=google.com; s=arc-20160816;
        b=0JD600bSH8LrqZNDitGwAyTHcn39UaWxybvjhAEawjkjHgWTR5KsVtHckbKi6Q7LK3
         UBIuzb4nPZ3NuC9Y9SOrjpTxqacing2KKLUZQClqG68CBhYaRDVuSXpPr4UxwpP9BfLC
         +9MhD0RQVcoO6JmjGJtwr3lF0cgwFXh8ImkmskZozJXdRo4lX19eJp0be6fzUqlpsYB9
         1UuQg4TjWbXbKT1Sp/ZZyR0hzaj1M9uUgM6vhDNaA8irWzs8K6SeHCk5bXxeKKCenxmr
         YGNMVL2Sr3Q+1eZOJSqx8/aL7GqVX5eK0myU7XVYT6YDyssHaPqA8Cm01OfBekP5FTFa
         BqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=dxnwGm4o5HHreY6nDaaie/u2lc79GSJpgCrkbb0pVGs=;
        b=0mZQmf7PssRmLfz9ziQsGl4s8SLAvKiWo19qlAyjEzDP7vMByB4z1CgF+/9dgq2l80
         H/J4E02kp+HwT+ab3FeXjLcqR1ZvIB5kPEO0AWgXLAmEMgB9X0dAfrXy4yNJb2B+Pefa
         qkZETZsD/20ft1DF4W4JckcpGa6yhQzct+WLgVxW2WVJGQKVSiQWvzjhluuhVcFr72IW
         Be/3ljeDROcRDTGXW8kQs5zfur0HtqQlYRiVsRr/MhPxU6GcAa0C0KhOx8b8NuaV1P9V
         sS9F7a/jLyByGC4KuKN1PQGE9cCkMVyXCnnneI6j93Yezd47lequCGpMlfndM1oiuxeS
         5PEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7tm5UJvN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=TInwgScZ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=TInwgScZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s12-v6si3160400qtg.362.2018.07.27.02.56.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:56:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7tm5UJvN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=TInwgScZ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=TInwgScZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizUA-0005F5-5P
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:56:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSf-0003eI-Rn
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006Aw-Dw
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:01 -0400
Received: from greensocs.com ([193.104.36.180]:47519)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00068n-Ti; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BE04244572B;
	Fri, 27 Jul 2018 11:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685288;
	bh=spls3mB/uY79yFvW2CylmjxAsCX0R5OwcdB6AiJDS1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7tm5UJvN8hcnSBLewy/KTP28yt/RczAkGC7wqtHv0xDHMVxjIcyxkYjov8tzDkodQ
	Ctm1j+bjw3fdysOlguQN7eZ36YYHXi8XtX2nSMQN4XM+hImSzMU7V+WX5EJG7RlqnH
	AUY6Kdy9nqUgB9WrTZP8ZCPvX4gf1jVwktT1lClo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=TInwgScZ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=TInwgScZ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZOq2lA-cswM; Fri, 27 Jul 2018 11:54:47 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 9147E443557; Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685286;
	bh=spls3mB/uY79yFvW2CylmjxAsCX0R5OwcdB6AiJDS1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TInwgScZXBTjpltmoDy9trmCoYHjuji02jRi/Gw4yQ5vANz6erFfCyvC+5SiStDKN
	KM989QjXQ0usp60F2aKV3YY18q86hftS9fvPEItYdMi4DOlWDSx+IWtrpw0vlzGw9k
	lPnorUew5kgl5hN0z2vAaDr7tVxnOKvkMHrwWEq4=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 405FD400DC8;
	Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685286;
	bh=spls3mB/uY79yFvW2CylmjxAsCX0R5OwcdB6AiJDS1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TInwgScZXBTjpltmoDy9trmCoYHjuji02jRi/Gw4yQ5vANz6erFfCyvC+5SiStDKN
	KM989QjXQ0usp60F2aKV3YY18q86hftS9fvPEItYdMi4DOlWDSx+IWtrpw0vlzGw9k
	lPnorUew5kgl5hN0z2vAaDr7tVxnOKvkMHrwWEq4=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:10 +0200
Message-Id: <20180727095421.386-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 09/20] intc/arm_gic: Add virtualization
 enabled IRQ helper functions
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
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O/ANyjaO7y+2

Add some helper functions to gic_internal.h to get or change the state
of an IRQ. When the current CPU is not a vCPU, the call is forwarded to
the GIC distributor. Otherwise, it acts on the list register matching
the IRQ in the current CPU virtual interface.

gic_clear_active can have a side effect on the distributor, even in the
vCPU case, when the correponding LR has the HW field set.

Use those functions in the CPU interface code path to prepare for the
vCPU interface implementation.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c      | 32 +++++++---------
 hw/intc/gic_internal.h | 83 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 18 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 94d5982e2a..26ed7ea58a 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -220,11 +220,12 @@ static uint16_t gic_get_current_pending_irq(GICState *s, int cpu,
                                             MemTxAttrs attrs)
 {
     uint16_t pending_irq = s->current_pending[cpu];
 
     if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
-        int group = GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
+        int group = gic_test_group(s, pending_irq, cpu);
+
         /* On a GIC without the security extensions, reading this register
          * behaves in the same way as a secure access to a GIC with them.
          */
         bool secure = !gic_cpu_ns_access(s, cpu, attrs);
 
@@ -251,11 +252,11 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
     int bpr;
     uint32_t mask;
 
     if (gic_has_groups(s) &&
         !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
-        GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
+        gic_test_group(s, irq, cpu)) {
         bpr = s->abpr[cpu] - 1;
         assert(bpr >= 0);
     } else {
         bpr = s->bpr[cpu];
     }
@@ -264,11 +265,11 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
      * a BPR of 1 means they are [7:2], and so on down to
      * a BPR of 7 meaning no group priority bits at all.
      */
     mask = ~0U << ((bpr & 7) + 1);
 
-    return GIC_DIST_GET_PRIORITY(irq, cpu) & mask;
+    return gic_get_priority(s, irq, cpu) & mask;
 }
 
 static void gic_activate_irq(GICState *s, int cpu, int irq)
 {
     /* Set the appropriate Active Priority Register bit for this IRQ,
@@ -277,18 +278,18 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
     int prio = gic_get_group_priority(s, cpu, irq);
     int preemption_level = prio >> (GIC_MIN_BPR + 1);
     int regno = preemption_level / 32;
     int bitno = preemption_level % 32;
 
-    if (gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
+    if (gic_has_groups(s) && gic_test_group(s, irq, cpu)) {
         s->nsapr[regno][cpu] |= (1 << bitno);
     } else {
         s->apr[regno][cpu] |= (1 << bitno);
     }
 
     s->running_priority[cpu] = prio;
-    GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
+    gic_set_active(s, irq, cpu);
 }
 
 static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
 {
     /* Recalculate the current running priority for this CPU based
@@ -353,21 +354,20 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
     if (irq >= GIC_MAXIRQ) {
         DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
         return irq;
     }
 
-    if (GIC_DIST_GET_PRIORITY(irq, cpu) >= s->running_priority[cpu]) {
+    if (gic_get_priority(s, irq, cpu) >= s->running_priority[cpu]) {
         DPRINTF("ACK, pending interrupt (%d) has insufficient priority\n", irq);
         return 1023;
     }
 
     if (s->revision == REV_11MPCORE) {
         /* Clear pending flags for both level and edge triggered interrupts.
          * Level triggered IRQs will be reasserted once they become inactive.
          */
-        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
-                                                             : cm);
+        gic_clear_pending(s, irq, cpu);
         ret = irq;
     } else {
         if (irq < GIC_NR_SGIS) {
             /* Lookup the source CPU for the SGI and clear this in the
              * sgi_pending map.  Return the src and clear the overall pending
@@ -375,22 +375,19 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
              */
             assert(s->sgi_pending[irq][cpu] != 0);
             src = ctz32(s->sgi_pending[irq][cpu]);
             s->sgi_pending[irq][cpu] &= ~(1 << src);
             if (s->sgi_pending[irq][cpu] == 0) {
-                GIC_DIST_CLEAR_PENDING(irq,
-                                       GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
-                                                                : cm);
+                gic_clear_pending(s, irq, cpu);
             }
             ret = irq | ((src & 0x7) << 10);
         } else {
             /* Clear pending state for both level and edge triggered
              * interrupts. (level triggered interrupts with an active line
              * remain pending, see gic_test_pending)
              */
-            GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
-                                                                 : cm);
+            gic_clear_pending(s, irq, cpu);
             ret = irq;
         }
     }
 
     gic_activate_irq(s, cpu, irq);
@@ -542,11 +539,10 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
     return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE;
 }
 
 static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
-    int cm = 1 << cpu;
     int group;
 
     if (irq >= s->num_irq) {
         /*
          * This handles two cases:
@@ -557,11 +553,11 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
          * and so this is UNPREDICTABLE. We choose to ignore it.
          */
         return;
     }
 
-    group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
+    group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
 
     if (!gic_eoi_split(s, cpu, attrs)) {
         /* This is UNPREDICTABLE; we choose to ignore it */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_deactivate_irq: GICC_DIR write when EOIMode clear");
@@ -571,11 +567,11 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
         return;
     }
 
-    GIC_DIST_CLEAR_ACTIVE(irq, cm);
+    gic_clear_active(s, irq, cpu);
 }
 
 static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
     int cm = 1 << cpu;
@@ -606,11 +602,11 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
             DPRINTF("Set %d pending mask %x\n", irq, cm);
             GIC_DIST_SET_PENDING(irq, cm);
         }
     }
 
-    group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
+    group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
 
     if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
         return;
     }
@@ -622,11 +618,11 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 
     gic_drop_prio(s, cpu, group);
 
     /* In GICv2 the guest can choose to split priority-drop and deactivate */
     if (!gic_eoi_split(s, cpu, attrs)) {
-        GIC_DIST_CLEAR_ACTIVE(irq, cm);
+        gic_clear_active(s, irq, cpu);
     }
     gic_update(s);
 }
 
 static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index cc5acc5d41..45c2af0bf5 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -141,10 +141,17 @@ REG32(GICH_LR63, 0x1fc)
 #define GICH_LR_PRIORITY(entry) (FIELD_EX32(entry, GICH_LR0, Priority) << 3)
 #define GICH_LR_STATE(entry) (FIELD_EX32(entry, GICH_LR0, State))
 #define GICH_LR_GROUP(entry) (FIELD_EX32(entry, GICH_LR0, Grp1))
 #define GICH_LR_HW(entry) (FIELD_EX32(entry, GICH_LR0, HW))
 
+#define GICH_LR_CLEAR_PENDING(entry) \
+        ((entry) &= ~(GICH_LR_STATE_PENDING << R_GICH_LR0_State_SHIFT))
+#define GICH_LR_SET_ACTIVE(entry) \
+        ((entry) |= (GICH_LR_STATE_ACTIVE << R_GICH_LR0_State_SHIFT))
+#define GICH_LR_CLEAR_ACTIVE(entry) \
+        ((entry) &= ~(GICH_LR_STATE_ACTIVE << R_GICH_LR0_State_SHIFT))
+
 /* Valid bits for GICC_CTLR for GICv1, v1 with security extensions,
  * GICv2 and GICv2 with security extensions:
  */
 #define GICC_CTLR_V1_MASK    0x1
 #define GICC_CTLR_V1_S_MASK  0x1f
@@ -236,6 +243,82 @@ static inline uint32_t *gic_get_lr_entry(GICState *s, int irq, int vcpu)
     }
 
     g_assert_not_reached();
 }
 
+static inline bool gic_test_group(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        return GICH_LR_GROUP(*entry);
+    } else {
+        return GIC_DIST_TEST_GROUP(irq, 1 << cpu);
+    }
+}
+
+static inline void gic_clear_pending(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        GICH_LR_CLEAR_PENDING(*entry);
+    } else {
+        /* Clear pending state for both level and edge triggered
+         * interrupts. (level triggered interrupts with an active line
+         * remain pending, see gic_test_pending)
+         */
+        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
+                                                             : (1 << cpu));
+    }
+}
+
+static inline void gic_set_active(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        GICH_LR_SET_ACTIVE(*entry);
+    } else {
+        GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
+    }
+}
+
+static inline void gic_clear_active(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        GICH_LR_CLEAR_ACTIVE(*entry);
+
+        if (GICH_LR_HW(*entry)) {
+            /* Hardware interrupt. We must forward the deactivation request to
+             * the distributor.
+             */
+            int phys_irq = GICH_LR_PHYS_ID(*entry);
+            int rcpu = gic_get_vcpu_real_id(cpu);
+
+            if (phys_irq < GIC_NR_SGIS || phys_irq >= GIC_MAXIRQ) {
+                /* UNPREDICTABLE behaviour, we choose to ignore the request */
+                return;
+            }
+
+            /* This is equivalent to a NS write to DIR on the physical CPU
+             * interface. Hence group0 interrupt deactivation is ignored if
+             * the GIC is secure.
+             */
+            if (!s->security_extn || GIC_DIST_TEST_GROUP(phys_irq, 1 << rcpu)) {
+                GIC_DIST_CLEAR_ACTIVE(phys_irq, 1 << rcpu);
+            }
+        }
+    } else {
+        GIC_DIST_CLEAR_ACTIVE(irq, 1 << cpu);
+    }
+}
+
+static inline int gic_get_priority(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        return GICH_LR_PRIORITY(*entry);
+    } else {
+        return GIC_DIST_GET_PRIORITY(irq, cpu);
+    }
+}
+
 #endif /* QEMU_ARM_GIC_INTERNAL_H */
-- 
2.18.0


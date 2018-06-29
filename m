Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730921wrq;
        Fri, 29 Jun 2018 06:32:02 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdJogOsow/j0FdNRSawBSIaPDCpmGGsDyXIReRvAxqJg9Juo6mzGMa2a5iVJdwuyXXOxt0z
X-Received: by 2002:a0c:ac85:: with SMTP id m5-v6mr12626863qvc.197.1530279122240;
        Fri, 29 Jun 2018 06:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279122; cv=none;
        d=google.com; s=arc-20160816;
        b=y8TrzXwpfrEsUilpqoSCHnugVPtDx+mkRgkVJS+6rOs1Q/kzv69KkGMb1UwcstjVf3
         rbGPhGGIfogUlJBKpkt6fxVhjiWt9aYx6Vy3BYYTYmaWXseai3K0Yv8EUzEHYypZ0qc3
         U0M9/5QBkauwfIh8vDUxp5yT5jbsqGq/MZkyMQiWBMtGRJvtdpcw1GBAUIQ/2XEvmtV/
         9sHN16GvYzz1SoxmF0TrEwv31VrCOloy24J4kSbf94Fcwro86TXeExj6y2drhp/0eqE/
         s5tsa5mWHOBGpMdnafL3jlPJ79Lm7z6SvJFvXN65xg/PO1omThh9orpC/U2jdp824Jf9
         x35Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=pDfDtS1AuPfJzA4XfQVNzPQrWd7O2RPsJV8slF3YRbk=;
        b=QvEgcFrWj6jcnZVoa61l7Oqinqo/zbEs4NSd+VhnqqwgAg2P1OqCCFK0XyyANQepyC
         S4kBA1ZqmmcX9v5V75uCQyZFkhJnhgd1VLPAVrRalnFTBhTka3IRlhPZkqOQ5T1Ja8Kf
         MDZTBZXjFAcJNl9dDNQhgi0A6bv8uhpfG58q/UhzrLBpOxJqBdPElp1a/A9KxvWFn/Hs
         MFLYDCZsZaWmXztsM/Qrvgvfd3IJjp26Ph8xrjdd7Mg1o4eQMYX/AB83leBbcpGvHsJT
         2IEGgnTd3qSAgLomWSrB2zEcKNB3mlcB/vr4x+VFqaOtnPnfLjkhm3qSd+PkvwsGEYXn
         9H3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=i8Ma9jX5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="l9V/TH0a";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="l9V/TH0a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14-v6si1309595qti.34.2018.06.29.06.32.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=i8Ma9jX5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="l9V/TH0a";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="l9V/TH0a";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42150 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtVJ-0008PK-I4
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:32:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU6-0007a1-Vx
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006qH-2m
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:46 -0400
Received: from greensocs.com ([193.104.36.180]:58616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006mV-AF; Fri, 29 Jun 2018 09:30:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9780D4434AB;
	Fri, 29 Jun 2018 15:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279037;
	bh=Bil+frXao78+kycLwohEdCE57evq9N47sfNCjZ6KNLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=i8Ma9jX5LL0mO4aR8BJJRCeD4R/k22KktKb9UNXeVh3Ovtbr0VYR3KG/Jym74vhjW
	POrGLwdS8YzlvF7cuZwx7y1O+6CG4POVmujggndhf6jSnc3h/llFbkS9DtAOi89IIX
	xGWLqfpq9/BKpMmeZ8Pky3fhN3O9FHMMOh9jWZ6Y=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=l9V/TH0a;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=l9V/TH0a
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M2aAGjEdCIIQ; Fri, 29 Jun 2018 15:30:36 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 729EC4434B4; Fri, 29 Jun 2018 15:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279036;
	bh=Bil+frXao78+kycLwohEdCE57evq9N47sfNCjZ6KNLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l9V/TH0arxkD+WTCr/+Sr8LB4kwXc12QX4MIp8V5JU4aMOlHVvHoinZx6jRWS21V7
	0It+N8vj4dMiUXpAA5uUL8YXOeK0OHU6O19Uuc3nbRCoiDL77LFB+HSsNlvBQSw9+t
	OhGfjjQiUCP/7mE/6s+rb6UelEiFbFRglIVMwGyg=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EF9834434AB;
	Fri, 29 Jun 2018 15:30:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279036;
	bh=Bil+frXao78+kycLwohEdCE57evq9N47sfNCjZ6KNLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l9V/TH0arxkD+WTCr/+Sr8LB4kwXc12QX4MIp8V5JU4aMOlHVvHoinZx6jRWS21V7
	0It+N8vj4dMiUXpAA5uUL8YXOeK0OHU6O19Uuc3nbRCoiDL77LFB+HSsNlvBQSw9+t
	OhGfjjQiUCP/7mE/6s+rb6UelEiFbFRglIVMwGyg=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:43 +0200
Message-Id: <20180629132954.24269-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 09/20] intc/arm_gic: Add virtualization
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
X-TUID: LicatMuo/6cP

Add some helper functions to gic_internal.h to get or change the state
of an IRQ. When the current CPU is not a vCPU, the call is forwarded to
the GIC distributor. Otherwise, it acts on the list register matching
the IRQ in the current CPU virtual interface.

gic_clear_active can have a side effect on the distributor, even in the
vCPU case, when the correponding LR has the HW field set.

Use those functions in the CPU interface code path to prepare for the
vCPU interface implementation.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c      | 32 ++++++++---------
 hw/intc/gic_internal.h | 78 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+), 18 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 8ab3025901..d55a88bb33 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -222,7 +222,8 @@ static uint16_t gic_get_current_pending_irq(GICState *s, int cpu,
     uint16_t pending_irq = s->current_pending[cpu];
 
     if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
-        int group = GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
+        int group = gic_test_group(s, pending_irq, cpu);
+
         /* On a GIC without the security extensions, reading this register
          * behaves in the same way as a secure access to a GIC with them.
          */
@@ -253,7 +254,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
 
     if (gic_has_groups(s) &&
         !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
-        GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
+        gic_test_group(s, irq, cpu)) {
         bpr = s->abpr[cpu] - 1;
         assert(bpr >= 0);
     } else {
@@ -266,7 +267,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
      */
     mask = ~0U << ((bpr & 7) + 1);
 
-    return GIC_DIST_GET_PRIORITY(irq, cpu) & mask;
+    return gic_get_priority(s, irq, cpu) & mask;
 }
 
 static void gic_activate_irq(GICState *s, int cpu, int irq)
@@ -279,14 +280,14 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
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
@@ -355,7 +356,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         return irq;
     }
 
-    if (GIC_DIST_GET_PRIORITY(irq, cpu) >= s->running_priority[cpu]) {
+    if (gic_get_priority(s, irq, cpu) >= s->running_priority[cpu]) {
         DPRINTF("ACK, pending interrupt (%d) has insufficient priority\n", irq);
         return 1023;
     }
@@ -364,8 +365,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         /* Clear pending flags for both level and edge triggered interrupts.
          * Level triggered IRQs will be reasserted once they become inactive.
          */
-        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
-                                                             : cm);
+        gic_clear_pending(s, irq, cpu);
         ret = irq;
     } else {
         if (irq < GIC_NR_SGIS) {
@@ -377,9 +377,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
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
@@ -387,8 +385,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
              * interrupts. (level triggered interrupts with an active line
              * remain pending, see gic_test_pending)
              */
-            GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
-                                                                 : cm);
+            gic_clear_pending(s, irq, cpu);
             ret = irq;
         }
     }
@@ -544,8 +541,7 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
 
 static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
-    int cm = 1 << cpu;
-    int group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
+    int group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
 
     if (!gic_eoi_split(s, cpu, attrs)) {
         /* This is UNPREDICTABLE; we choose to ignore it */
@@ -559,7 +555,7 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         return;
     }
 
-    GIC_DIST_CLEAR_ACTIVE(irq, cm);
+    gic_clear_active(s, irq, cpu);
 }
 
 static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
@@ -594,7 +590,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         }
     }
 
-    group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
+    group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
 
     if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
@@ -610,7 +606,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 
     /* In GICv2 the guest can choose to split priority-drop and deactivate */
     if (!gic_eoi_split(s, cpu, attrs)) {
-        GIC_DIST_CLEAR_ACTIVE(irq, cm);
+        gic_clear_active(s, irq, cpu);
     }
     gic_update(s);
 }
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 4242a16bd4..4cacd34264 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -143,6 +143,13 @@ REG32(GICH_LR63, 0x1fc)
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
@@ -229,4 +236,75 @@ static inline uint32_t *gic_get_lr_entry_nofail(GICState *s, int irq, int vcpu)
     return entry;
 }
 
+static inline bool gic_test_group(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry_nofail(s, irq, cpu);
+        return GICH_LR_GROUP(*entry);
+    } else {
+        return GIC_DIST_TEST_GROUP(irq, 1 << cpu);
+    }
+}
+
+static inline void gic_clear_pending(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry_nofail(s, irq, cpu);
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
+        uint32_t *entry = gic_get_lr_entry_nofail(s, irq, cpu);
+        GICH_LR_SET_ACTIVE(*entry);
+    } else {
+        GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
+    }
+}
+
+static inline void gic_clear_active(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry_nofail(s, irq, cpu);
+        GICH_LR_CLEAR_ACTIVE(*entry);
+
+        if (GICH_LR_HW(*entry)) {
+            /* Hardware interrupt. We must forward the deactivation request to
+             * the distributor.
+             */
+            int phys_irq = GICH_LR_PHYS_ID(*entry);
+            int rcpu = gic_get_vcpu_real_id(cpu);
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
+        uint32_t *entry = gic_get_lr_entry_nofail(s, irq, cpu);
+        return GICH_LR_PRIORITY(*entry);
+    } else {
+        return GIC_DIST_GET_PRIORITY(irq, cpu);
+    }
+}
+
 #endif /* QEMU_ARM_GIC_INTERNAL_H */
-- 
2.17.1


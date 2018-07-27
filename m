Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507967wru;
        Fri, 27 Jul 2018 02:56:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe/LIL0qYpFyoO9b03l9GPSbbI3EPkjHJjWYRXMt1GoFVivyA4anugUDwWq4Gy7+XRa9oq2
X-Received: by 2002:a0c:db8f:: with SMTP id m15-v6mr4718401qvk.143.1532685400494;
        Fri, 27 Jul 2018 02:56:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685400; cv=none;
        d=google.com; s=arc-20160816;
        b=AlkYtUiySmEgST8Va0XptiDoLvwwbLHmQffN8luQ9nEcjFP0OXcOyATCenGZK4bGdD
         VsIfOopB1O4guNc40/GwllsRBITvH7XXsqlEiTV64ruNrEA/KdCtWV4hyYVPCtIRn42B
         jdi6zwLMHSeyYRmQRmzFflqAz8nxlaYkrGR8bix+3FEHfNyUuGuYa/2vnXu5RYUkWIAJ
         DD/+oM0MYfot2VaERp79BH4aEcZR0ECOPai+S+PxqfasRd4wqpwSZeeTc5k2eqEA6WZX
         h22gAapfC+jbmCz9B7L8zmxh6JcJuPx0P7nNWfSuHVCuzr03O1hYd+qAYB4cicu8n+qZ
         7Htg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=t2Pwv0GD4OsMH20z5IDIPzvItd7mxgZwQE6IQxDRjo4=;
        b=k/GJCVW6YngYHz03JMYC0VgVVTYFtGy9ZEdT5cHNucPSgi32VaOmuod5s6IeXOZL/k
         Fx0/tvchfzUjNSfYoInvdegV/utYDx+WSuElNodWDIRSv87CevHNiUkxe7puDOFbXM71
         xy/h/uddFVP+uIjRfuKeCrXNr1ROcGo1tBM5LxX90X6RmKTViCdOgYNVatAX2/6+FHZt
         fTnlIz/0+OX84QfmN9CT58MrG4Q7sE58Z04C4GWJ6zPQFwrE0AmBwjVWnmwiWbhMrJ79
         fqt8lRLHxIM9ooT/LIos9TeSeVXAXeWdZstx11SrV8vvY6lP8hfeTEya4/+PWjvCQoW0
         IHuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=mlbN1PrX;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gkutp6fx;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gkutp6fx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2-v6si564417qkf.290.2018.07.27.02.56.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:56:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=mlbN1PrX;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gkutp6fx;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gkutp6fx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizUF-0005K3-Ti
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:56:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSg-0003eo-7G
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006CP-TY
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:02 -0400
Received: from greensocs.com ([193.104.36.180]:47531)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSZ-0006Ag-Ix; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 98B0A44355C;
	Fri, 27 Jul 2018 11:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685291;
	bh=0nWuiCI2Sfl8isJ+W/w8e+MYSZZzizdpCMSw8CG2vQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mlbN1PrX4AhzaFn/xu7+6VXXMG5qVWisOOECF0a7qWl10LiRi/T2Nh51kwO0fxJZX
	VfSzkYwaM6MCRAYlBuJAuF7neYQZ+lshtM71fMhGLjF8NJuZI+PTFn9Iv4jB/roz+6
	6bve9BfAublP0JJ4LxHjfBjl3URH8ERMyULOQU74=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=gkutp6fx;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=gkutp6fx
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgK21aYC7uX3; Fri, 27 Jul 2018 11:54:50 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 7FCFF443485; Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685289;
	bh=0nWuiCI2Sfl8isJ+W/w8e+MYSZZzizdpCMSw8CG2vQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gkutp6fx//y3z30DGFsLeDlZouiVDlYS6VYokI1rtZ1bqJgz2zyQgs8abShdJ7ile
	iNR176lZTVg4dLZd90b+FzuNAhtXdrDJ7JU+Xa+xfdvJciqe0oxfZ1qaKKb7pBSwUO
	xjC/Ad7hj4SJb7Nciim/GBn+7fb6fbH0jQgscXe0=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 25666443557;
	Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685289;
	bh=0nWuiCI2Sfl8isJ+W/w8e+MYSZZzizdpCMSw8CG2vQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gkutp6fx//y3z30DGFsLeDlZouiVDlYS6VYokI1rtZ1bqJgz2zyQgs8abShdJ7ile
	iNR176lZTVg4dLZd90b+FzuNAhtXdrDJ7JU+Xa+xfdvJciqe0oxfZ1qaKKb7pBSwUO
	xjC/Ad7hj4SJb7Nciim/GBn+7fb6fbH0jQgscXe0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:17 +0200
Message-Id: <20180727095421.386-17-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 16/20] intc/arm_gic: Implement
 gic_update_virt() function
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
X-TUID: 5y8xawBfXn/P

Add the gic_update_virt() function to update the vCPU interface states
and raise vIRQ and vFIQ as needed. This commit renames gic_update() to
gic_update_internal() and generalizes it to handle both cases, with a
`virt' parameter to track whether we are updating the CPU or vCPU
interfaces.

The main difference between CPU and vCPU is the way we select the best
IRQ. This part has been split into the gic_get_best_(v)irq functions.
For the virt case, the LRs are iterated to find the best candidate.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 175 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 136 insertions(+), 39 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 6063196487..6b97e19796 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -77,78 +77,153 @@ static inline bool gic_has_groups(GICState *s)
 static inline bool gic_cpu_ns_access(GICState *s, int cpu, MemTxAttrs attrs)
 {
     return !gic_is_vcpu(cpu) && s->security_extn && !attrs.secure;
 }
 
+static inline void gic_get_best_irq(GICState *s, int cpu,
+                                    int *best_irq, int *best_prio, int *group)
+{
+    int irq;
+    int cm = 1 << cpu;
+
+    *best_irq = 1023;
+    *best_prio = 0x100;
+
+    for (irq = 0; irq < s->num_irq; irq++) {
+        if (GIC_DIST_TEST_ENABLED(irq, cm) && gic_test_pending(s, irq, cm) &&
+            (!GIC_DIST_TEST_ACTIVE(irq, cm)) &&
+            (irq < GIC_INTERNAL || GIC_DIST_TARGET(irq) & cm)) {
+            if (GIC_DIST_GET_PRIORITY(irq, cpu) < *best_prio) {
+                *best_prio = GIC_DIST_GET_PRIORITY(irq, cpu);
+                *best_irq = irq;
+            }
+        }
+    }
+
+    if (*best_irq < 1023) {
+        *group = GIC_DIST_TEST_GROUP(*best_irq, cm);
+    }
+}
+
+static inline void gic_get_best_virq(GICState *s, int cpu,
+                                     int *best_irq, int *best_prio, int *group)
+{
+    int lr_idx = 0;
+
+    *best_irq = 1023;
+    *best_prio = 0x100;
+
+    for (lr_idx = 0; lr_idx < s->num_lrs; lr_idx++) {
+        uint32_t lr_entry = s->h_lr[lr_idx][cpu];
+        int state = GICH_LR_STATE(lr_entry);
+
+        if (state == GICH_LR_STATE_PENDING) {
+            int prio = GICH_LR_PRIORITY(lr_entry);
+
+            if (prio < *best_prio) {
+                *best_prio = prio;
+                *best_irq = GICH_LR_VIRT_ID(lr_entry);
+                *group = GICH_LR_GROUP(lr_entry);
+            }
+        }
+    }
+}
+
+/* Return true if IRQ signaling is enabled for the given cpu and at least one
+ * of the given groups:
+ *   - in the non-virt case, the distributor must be enabled for one of the
+ *   given groups
+ *   - in the virt case, the virtual interface must be enabled.
+ *   - in all cases, the (v)CPU interface must be enabled for one of the given
+ *   groups.
+ */
+static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
+                                    int group_mask)
+{
+    if (!virt && !(s->ctlr & group_mask)) {
+        return false;
+    }
+
+    if (virt && !(s->h_hcr[cpu] & R_GICH_HCR_EN_MASK)) {
+        return false;
+    }
+
+    if (!(s->cpu_ctlr[cpu] & group_mask)) {
+        return false;
+    }
+
+    return true;
+}
+
 /* TODO: Many places that call this routine could be optimized.  */
 /* Update interrupt status after enabled or pending bits have been changed.  */
-static void gic_update(GICState *s)
+static inline void gic_update_internal(GICState *s, bool virt)
 {
     int best_irq;
     int best_prio;
-    int irq;
     int irq_level, fiq_level;
-    int cpu;
-    int cm;
+    int cpu, cpu_iface;
+    int group = 0;
+    qemu_irq *irq_lines = virt ? s->parent_virq : s->parent_irq;
+    qemu_irq *fiq_lines = virt ? s->parent_vfiq : s->parent_fiq;
 
     for (cpu = 0; cpu < s->num_cpu; cpu++) {
-        cm = 1 << cpu;
-        s->current_pending[cpu] = 1023;
-        if (!(s->ctlr & (GICD_CTLR_EN_GRP0 | GICD_CTLR_EN_GRP1))
-            || !(s->cpu_ctlr[cpu] & (GICC_CTLR_EN_GRP0 | GICC_CTLR_EN_GRP1))) {
-            qemu_irq_lower(s->parent_irq[cpu]);
-            qemu_irq_lower(s->parent_fiq[cpu]);
+        cpu_iface = virt ? (cpu + GIC_NCPU) : cpu;
+
+        s->current_pending[cpu_iface] = 1023;
+        if (!gic_irq_signaling_enabled(s, cpu, virt,
+                                       GICD_CTLR_EN_GRP0 | GICD_CTLR_EN_GRP1)) {
+            qemu_irq_lower(irq_lines[cpu]);
+            qemu_irq_lower(fiq_lines[cpu]);
             continue;
         }
-        best_prio = 0x100;
-        best_irq = 1023;
-        for (irq = 0; irq < s->num_irq; irq++) {
-            if (GIC_DIST_TEST_ENABLED(irq, cm) &&
-                gic_test_pending(s, irq, cm) &&
-                (!GIC_DIST_TEST_ACTIVE(irq, cm)) &&
-                (irq < GIC_INTERNAL || GIC_DIST_TARGET(irq) & cm)) {
-                if (GIC_DIST_GET_PRIORITY(irq, cpu) < best_prio) {
-                    best_prio = GIC_DIST_GET_PRIORITY(irq, cpu);
-                    best_irq = irq;
-                }
-            }
+
+        if (virt) {
+            gic_get_best_virq(s, cpu, &best_irq, &best_prio, &group);
+        } else {
+            gic_get_best_irq(s, cpu, &best_irq, &best_prio, &group);
         }
 
         if (best_irq != 1023) {
             trace_gic_update_bestirq(cpu, best_irq, best_prio,
-                s->priority_mask[cpu], s->running_priority[cpu]);
+                s->priority_mask[cpu_iface], s->running_priority[cpu_iface]);
         }
 
         irq_level = fiq_level = 0;
 
-        if (best_prio < s->priority_mask[cpu]) {
-            s->current_pending[cpu] = best_irq;
-            if (best_prio < s->running_priority[cpu]) {
-                int group = GIC_DIST_TEST_GROUP(best_irq, cm);
-
-                if (extract32(s->ctlr, group, 1) &&
-                    extract32(s->cpu_ctlr[cpu], group, 1)) {
-                    if (group == 0 && s->cpu_ctlr[cpu] & GICC_CTLR_FIQ_EN) {
+        if (best_prio < s->priority_mask[cpu_iface]) {
+            s->current_pending[cpu_iface] = best_irq;
+            if (best_prio < s->running_priority[cpu_iface]) {
+                if (gic_irq_signaling_enabled(s, cpu, virt, 1 << group)) {
+                    if (group == 0 &&
+                        s->cpu_ctlr[cpu_iface] & GICC_CTLR_FIQ_EN) {
                         DPRINTF("Raised pending FIQ %d (cpu %d)\n",
-                                best_irq, cpu);
+                                best_irq, cpu_iface);
                         fiq_level = 1;
-                        trace_gic_update_set_irq(cpu, "fiq", fiq_level);
+                        trace_gic_update_set_irq(cpu, virt ? "vfiq" : "fiq",
+                                                 fiq_level);
                     } else {
                         DPRINTF("Raised pending IRQ %d (cpu %d)\n",
-                                best_irq, cpu);
+                                best_irq, cpu_iface);
                         irq_level = 1;
-                        trace_gic_update_set_irq(cpu, "irq", irq_level);
+                        trace_gic_update_set_irq(cpu, virt ? "virq" : "irq",
+                                                 irq_level);
                     }
                 }
             }
         }
 
-        qemu_set_irq(s->parent_irq[cpu], irq_level);
-        qemu_set_irq(s->parent_fiq[cpu], fiq_level);
+        qemu_set_irq(irq_lines[cpu], irq_level);
+        qemu_set_irq(fiq_lines[cpu], fiq_level);
     }
 }
 
+static void gic_update(GICState *s)
+{
+    gic_update_internal(s, false);
+}
+
 /* Return true if this LR is empty, i.e. the corresponding bit
  * in ELRSR is set.
  */
 static inline bool gic_lr_entry_is_free(uint32_t entry)
 {
@@ -163,10 +238,15 @@ static inline bool gic_lr_entry_is_eoi(uint32_t entry)
 {
     return (GICH_LR_STATE(entry) == GICH_LR_STATE_INVALID)
         && !GICH_LR_HW(entry) && GICH_LR_EOI(entry);
 }
 
+static void gic_update_virt(GICState *s)
+{
+    gic_update_internal(s, true);
+}
+
 static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
                                  int cm, int target)
 {
     if (level) {
         GIC_DIST_SET_LEVEL(irq, cm);
@@ -447,11 +527,15 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
             gic_clear_pending(s, irq, cpu);
             ret = irq;
         }
     }
 
-    gic_update(s);
+    if (gic_is_vcpu(cpu)) {
+        gic_update_virt(s);
+    } else {
+        gic_update(s);
+    }
     DPRINTF("ACK %d\n", irq);
     return ret;
 }
 
 void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
@@ -625,10 +709,15 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         /* This vIRQ does not have an LR entry which is either active or
          * pending and active. Increment EOICount and ignore the write.
          */
         int rcpu = gic_get_vcpu_real_id(cpu);
         s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
+
+        /* Update the virtual interface in case a maintenance interrupt should
+         * be raised.
+         */
+        gic_update_virt(s);
         return;
     }
 
     group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
 
@@ -674,10 +763,11 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
             } else if (valid) {
                 gic_clear_active(s, irq, cpu);
             }
         }
 
+        gic_update_virt(s);
         return;
     }
 
     if (irq >= s->num_irq) {
         /* This handles two cases:
@@ -1529,11 +1619,17 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_cpu_write: Bad offset %x\n", (int)offset);
         return MEMTX_OK;
     }
-    gic_update(s);
+
+    if (gic_is_vcpu(cpu)) {
+        gic_update_virt(s);
+    } else {
+        gic_update(s);
+    }
+
     return MEMTX_OK;
 }
 
 /* Wrappers to read/write the GIC CPU interface for the current CPU */
 static MemTxResult gic_thiscpu_read(void *opaque, hwaddr addr, uint64_t *data,
@@ -1740,10 +1836,11 @@ static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_hyp_write: Bad offset %" HWADDR_PRIx "\n", addr);
         return MEMTX_OK;
     }
 
+    gic_update_virt(s);
     return MEMTX_OK;
 }
 
 static MemTxResult gic_thiscpu_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
                                     unsigned size, MemTxAttrs attrs)
-- 
2.18.0


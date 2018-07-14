Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp658907wrq;
        Sat, 14 Jul 2018 10:30:52 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe4pbkL3QERBcOXeoYI/l/ucl/1k51ce+slgculMz7A0ZQgMYykZzHDBJ0X4rK2E1VBVE2j
X-Received: by 2002:ac8:3385:: with SMTP id c5-v6mr9883964qtb.124.1531589452657;
        Sat, 14 Jul 2018 10:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531589452; cv=none;
        d=google.com; s=arc-20160816;
        b=G4gpXyypCjzGkMpbF7bN+naPGplNscyTYkFZ/uuvwfJGcSQNkCXk5WVoS6hL2G6jRf
         HolPNNBPdD8goO2652jb6EkjYDZ9iK3FUPyWcuCGzWalNTUsz7Ww0Tv7ZAcO+1xhKP0T
         rvsSp31Mzp/9qxes/MxiWGRHKuMn0OILaAgClinCx0ZpaEY071zVSDUbD1PAGA95r0CA
         D+Cn6bwRkb2S1AznNU4qNWX3JumLTHoPsLumjU3gYW5jxd3AiipcNRoj+Td8rWGTpsSz
         9jqkan0GYzRbdnV9214+Z2EN1n/XX4QFtUZOhWHGGEENzyOpVooN0L3wWW1+xcYRxUn/
         bg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=Csm71iC1f6nB7lJUZyi6VrvtViUpg4QGquLyzs39MP4=;
        b=G+r2UmIaFlboOc05Wj8LGRJy9Mbu06wPm3SqvolhzV6O/8ROwZKRsqxah5MguTs7ee
         HBXz9A6mo4MPcBc4tjue3jnGog9BGAllC9o7Mc3EUnApji2Cwh6RkTEYXnesJWSuO2um
         Y3IRt8KUkef9UBe4jTkYhgZ0plqTb0VmFK9Mb/BV9dkpM+S7oOdoq4unDMaiR2iddGKU
         Qfzf++BMYKDmKEfmyKq1nfWTe6lnAmzfagL0N/ngR2cg8fwL7y8v+eq2vOzGXGb2c6DY
         0lvnlf7Curg1KaxUl8RAtDLYqzxCmnhIxhuwgZ7e3fzRVBaN8EAhmkyQsYwqSwBSnKi8
         FkbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QXi2msai;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pmCTZqeo;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pmCTZqeo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f53-v6si2883217qta.336.2018.07.14.10.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QXi2msai;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pmCTZqeo;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pmCTZqeo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42149 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feONg-0000AY-7y
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:30:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9u-0005nG-CT
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9o-0004Xc-4W
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:36 -0400
Received: from greensocs.com ([193.104.36.180]:57367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9n-0004Wu-Kk; Sat, 14 Jul 2018 13:16:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 1AF1EC7AFD;
	Sat, 14 Jul 2018 19:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588591;
	bh=yPWR/NPqq9B9XvhSaAF4Z+pIfgx2B5PTR8tDwWe3gdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QXi2msaiR1pAywMCcILDoBTqW86pEaJlBZIUxYKssiMihTCzN9DwCxGSHbn6Vh8MA
	FLY5YvK2tfjUXurQYPibcJnuYB1RrhnvKIvPIyvKcxMutg7YM+E1yjJ7zoVikQH4i1
	rfWrRmXmQylJqlFUbMvFjEmoSRjcpaz7pYhWvcFY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pmCTZqeo;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pmCTZqeo
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nsmrpcoTrFsA; Sat, 14 Jul 2018 19:16:30 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 21055C7ADD; Sat, 14 Jul 2018 19:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588590;
	bh=yPWR/NPqq9B9XvhSaAF4Z+pIfgx2B5PTR8tDwWe3gdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pmCTZqeol2NQ7GHUiuCF4PGrf2EO7V/OXM4maxLGdAma6VUbRD8Zhi1iZaETIc6rz
	2ImkRav3lum8gmPDkIq8Tji5NOTxibeQ7WK4MtickHrfyw/EyPoYYSILLb9y/flBNQ
	fxuMCD1i75bZu3ffPLAKz5VaNR6DA79HppS+1ij4=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 1123EC7AE3;
	Sat, 14 Jul 2018 19:16:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588590;
	bh=yPWR/NPqq9B9XvhSaAF4Z+pIfgx2B5PTR8tDwWe3gdY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pmCTZqeol2NQ7GHUiuCF4PGrf2EO7V/OXM4maxLGdAma6VUbRD8Zhi1iZaETIc6rz
	2ImkRav3lum8gmPDkIq8Tji5NOTxibeQ7WK4MtickHrfyw/EyPoYYSILLb9y/flBNQ
	fxuMCD1i75bZu3ffPLAKz5VaNR6DA79HppS+1ij4=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:57 +0200
Message-Id: <20180714171601.5734-17-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 16/20] intc/arm_gic: Implement
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
X-TUID: +x1j8ZS7OpwY

Add the gic_update_virt() function to update the vCPU interface states
and raise vIRQ and vFIQ as needed. This commit renames gic_update() to
gic_update_internal() and generalizes it to handle both cases, with a
`virt' parameter to track whether we are updating the CPU or vCPU
interfaces.

The main difference between CPU and vCPU is the way we select the best
IRQ. This part has been split into the gic_get_best_(v)irq functions.
For the virt case, the LRs are iterated to find the best candidate.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 186 ++++++++++++++++++++++++++++++++++++----------
 1 file changed, 146 insertions(+), 40 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d8e9cf0a3a..85f1a03147 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -79,74 +79,149 @@ static inline bool gic_cpu_ns_access(GICState *s, int cpu, MemTxAttrs attrs)
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
@@ -165,6 +240,11 @@ static inline bool gic_lr_entry_is_eoi(uint32_t entry)
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
@@ -449,7 +529,11 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
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
@@ -614,6 +698,11 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
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
 
@@ -637,6 +726,11 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
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
 
@@ -684,7 +778,12 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     if (!gic_eoi_split(s, cpu, attrs)) {
         gic_clear_active(s, irq, cpu);
     }
-    gic_update(s);
+
+    if (gic_is_vcpu(cpu)) {
+        gic_update_virt(s);
+    } else {
+        gic_update(s);
+    }
 }
 
 static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
@@ -1490,7 +1589,13 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
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
 
@@ -1701,6 +1806,7 @@ static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
         return MEMTX_OK;
     }
 
+    gic_update_virt(s);
     return MEMTX_OK;
 }
 
-- 
2.18.0


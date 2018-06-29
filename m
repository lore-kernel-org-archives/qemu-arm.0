Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp731476wrq;
        Fri, 29 Jun 2018 06:32:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdnl4XHMHb4cw1B6Y8YlRa4zdXqAJ0MTluzdc/M7CxGcLOrjgGGpE0WsRVFaBrPrjSyc4f6
X-Received: by 2002:ac8:1c63:: with SMTP id j32-v6mr3874944qtk.242.1530279151592;
        Fri, 29 Jun 2018 06:32:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279151; cv=none;
        d=google.com; s=arc-20160816;
        b=mQm2HfkK9PwTtnDD6jDREm+L6bHVL4FKrdnOF2TGXzIuhBIoF8usH7vPo6TG8Fs89t
         bxUivoeepzawBxZ2ENb9CesUX1OEXQZ6HQvkHwqLSy9WYkvQN3K0uePFLtkF4bmHnbwZ
         pQ9HB8TeYFLuwTjbSsM+4rjq3mXeXWM+c4gfwpUii4/yOEkZfINdCS0Kz2N97p0lPcH7
         9UVm/Re3pcx5+PWFsZ2tyEpYIzbRVvaguVVeB8c9RFQ6sjWudlOuAGBaYmZl0r4NwDgo
         jDDnYnm8YhzvxM+u47kYp8iGP7lVsfhjDRygYnPsM9YQrXE0T7ACPzBmGqDC02ck9FRH
         sg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=8rDsMH1lDopWBQ8/mEUQsgfgdq7ZM5xbjHUq0wwG9CM=;
        b=AThYECT4Fpin8h4PgZQi2KBzryfnWvFhtSBTqeE7RupFC1Rrb3Fbjq3ATdIPhqdKDB
         jKq+Ian25tAFxTthx8IscNTNX2oTvvQEHJj0SN8nTdq1o6tGLI7A5ShdzsZ+yikcnAtj
         6wZFjSPP6m0iW7iaKw7yywTMO962SPfrze2rJ86QDzj8JP1nNT+Ru1kj4wmFha81apu/
         trp3/qmT+ZGW2msWiSDZvWrahPaGSSrM3qlBmQ0mwL1mxfHl6+4FLQLmkQLJ4KaXuHcv
         OeEK951VEfroW4R0WijrJjAvw4JVCgF38zT1OEgoe7VO0Zv+toGz/OaFOUhbxGuEq3+1
         b2WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=J7D6GbhT;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=0+LqEDvL;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nEwilZoM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o11-v6si2793870qkl.97.2018.06.29.06.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:32:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=J7D6GbhT;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=0+LqEDvL;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nEwilZoM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtVm-0000Fd-TU
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:32:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtUB-0007ax-0l
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006rg-8l
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:50 -0400
Received: from greensocs.com ([193.104.36.180]:58613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006mN-Q5; Fri, 29 Jun 2018 09:30:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 15B154434A7;
	Fri, 29 Jun 2018 15:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279042;
	bh=8xdtf465CGcWMU7V2dmPwvljMfepIQZd0ArMlY93CVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J7D6GbhT12pOkyEtPP4D4fyE+9ObMZLenh8GkTOPf2I9bIejK66nsoYcdRd5CWVIR
	EXvfJwcssl8tyC6EtqZXddl2hx5dVo62bT4mMJErjAKVHk5swT7uPB9Y8Y9V7CXUXK
	lPAk9nmaEBZUaJgHIgcsaWYk1+D2oUSofpZjeZUo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=0+LqEDvL;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=nEwilZoM
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztKjp1fDH9Rr; Fri, 29 Jun 2018 15:30:41 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 2655F4434BC; Fri, 29 Jun 2018 15:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279041;
	bh=8xdtf465CGcWMU7V2dmPwvljMfepIQZd0ArMlY93CVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=0+LqEDvLt2tOGtH0frj2X5TdHyFm6adx/vLkIHpwO8pfFicrl43gnHImwuKqgUVdR
	c8gPxPEU2t/eNgh8TM5y2DV/htUQc0fkM0L4fyaCRP2xM5ui5RkX8HXR5GBLBaHQqt
	AeJ/EVgth90fw8DrEIg+20oNj6jA3WNG5vO7yTno=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id BB9014434B8;
	Fri, 29 Jun 2018 15:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279040;
	bh=8xdtf465CGcWMU7V2dmPwvljMfepIQZd0ArMlY93CVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nEwilZoMSnAG+Q+ENkoSJoKqJRY/GJ0zJRJYK+nLwYh/s1Q3MO07wEpV1htHoGANZ
	jmZO5QodZpLd2LbosESAsxKjyC8PSjTHgL44roW6unZfLE+sZQTf6MnRAgKHVDc2pP
	J1RAQWGLNy+HdYOQxbVUpQT/gNN/MAptw7ylyvFw=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:50 +0200
Message-Id: <20180629132954.24269-17-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 16/20] intc/arm_gic: Implement
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
X-TUID: r5cgE+VrXpUT

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
 hw/intc/arm_gic.c | 170 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 130 insertions(+), 40 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index a29042f291..a3ff4b89d1 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -79,74 +79,143 @@ static inline bool gic_cpu_ns_access(GICState *s, int cpu, MemTxAttrs attrs)
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
+/* Return true if IRQ signaling is enabled:
+ *   - !virt -> from the distributor to the CPU interfaces,
+ *              for the given group mask,
+ *   -  virt -> from the given virtual interface to the CPU virtual interface.
+ */
+static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
+                                    int group_mask)
+{
+    return (virt && (s->h_hcr[cpu] & R_GICH_HCR_EN_MASK))
+        || (!virt && (s->ctlr & group_mask));
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
+                                       GICD_CTLR_EN_GRP0 | GICD_CTLR_EN_GRP1)
+            || !(s->cpu_ctlr[cpu_iface] &
+                 (GICC_CTLR_EN_GRP0 | GICC_CTLR_EN_GRP1))) {
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
+                if (gic_irq_signaling_enabled(s, cpu, virt, 1 << group) &&
+                    extract32(s->cpu_ctlr[cpu_iface], group, 1)) {
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
+static void gic_update_virt(GICState *s)
+{
+    gic_update_internal(s, true);
+}
+
 static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
                                  int cm, int target)
 {
@@ -432,7 +501,11 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
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
@@ -611,6 +684,11 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
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
 
@@ -658,7 +736,12 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
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
@@ -1448,7 +1531,13 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
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
 
@@ -1684,6 +1773,7 @@ static MemTxResult gic_hyp_write(void *opaque, hwaddr addr, uint64_t value,
         return MEMTX_OK;
     }
 
+    gic_update_virt(s);
     return MEMTX_OK;
 }
 
-- 
2.17.1


Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp588948wrq;
        Wed, 6 Jun 2018 02:32:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJTUBz4GuKV9XyfTf4kyI7rvS+XxXZLzGGdDV7kmiF+eICQOw3Uyf1KnKqwVCb+S+Uw3nzB
X-Received: by 2002:a0c:b116:: with SMTP id q22-v6mr454948qvc.19.1528277527165;
        Wed, 06 Jun 2018 02:32:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528277527; cv=none;
        d=google.com; s=arc-20160816;
        b=EVX6WdzE8AB4uVX97BALT7s3skIzV5idQJWBRwDXNgB/HdLz1uiqlMYqa2yseH0Gqy
         lW7NvrT8i/6LOVJZAua8Qnr//cGcoEcRSS0y7DxBHA2hMxYktI2zxDTGHi/3ZDyIWffy
         3cLles28yzJxAj/KaskaRpHlQFGBou2c+cmiJ6vuTTAo+ldkvheHjAzdrTyv2+axYbvZ
         vTYYhF09hHHnSk6peccq0+4txelw1si2ChYf9ADMBFd64LzluELl54JcMCtRCYLxVd/O
         /RhAoT744CiDRkfbWHtMHHllnlGO0rOHrEroXoGQtIT4dyu8guc/qRf3HISYhKhciB63
         e7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=BsJQxZpN6KFA3toqOpRwYkiWDh77Bk0n0Tjv1fYBeD4=;
        b=kPjPQSzjEtWSLJ+8AkFXJe01Jo96yzPM6qqFTuOxMrV9YDwfDhobxoa/HKjd+fGqL1
         iHhDfcgUSz3TGPJcbEgFyDWiPMyr0Z86EHjQoPAMCSJ38d/G2twwM9wwPZnPsi/HUNl3
         Z+EUMzLBKTlAUjZd8F+wUJQ7ACU4/GQov7UtixlvMMlPtVt02+k36Yy7PbLMRHCBcNt+
         AbPv7ZLaNu8oauoOu0xWYfBLC+qPwRuWjgXOFHsy7P7iPeVwZxbBINFjx2+Z7tLfqRPp
         rodWW0+k6xHpJtkpILbUZItWkNILVvLNGBaLU6RCa8iwTWq4ZqL/b2XYSabUllAO3M/s
         503w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yUmO7zdN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Cz+c3ZY4;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Cz+c3ZY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y67-v6si4059503qkd.160.2018.06.06.02.32.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 02:32:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=yUmO7zdN;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Cz+c3ZY4;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Cz+c3ZY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQUnW-0001it-JH
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 05:32:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnG-0001iM-8L
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnD-0003hM-NN
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:50 -0400
Received: from greensocs.com ([193.104.36.180]:53737)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fQUnD-0003h6-CU; Wed, 06 Jun 2018 05:31:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DBC5244355F;
	Wed,  6 Jun 2018 11:31:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277500;
	bh=CMmVzt4a3RYYkoxTChm+EUJm/11QFvwCw2sxhsnogis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=yUmO7zdN5nziO+ryCfJ5RRkQMs/bNzRljyrVV5ZdjYrsJp/obm4g4RJZiURmzrkLm
	Jj7JKZ5kxn8mAC/hnKXnhC75RTTWcCAs13oYmQuou1o16fejNZSjVtgsMng6dc7BBk
	V36jxhwA7Otz1kgbFVZr2WWHUNENp9xMkOPZzTUk=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Cz+c3ZY4;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Cz+c3ZY4
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p0Ovs-wvChz5; Wed,  6 Jun 2018 11:31:39 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id F22D144354B; Wed,  6 Jun 2018 11:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277498;
	bh=CMmVzt4a3RYYkoxTChm+EUJm/11QFvwCw2sxhsnogis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cz+c3ZY4hwSorA02wdw3JshB8XyBD+2TNKpmUthoxf9bs71S/frU5TLAXeXs5NRH6
	BwTFDViglBUZO2xIrKNbrjMm1yVbxZadXQ0awop9yAqcF6fQrJ4EOvGrtwq7TSo9tj
	VtwlveRaL9jE3BKcbUrX3snViF4bDJK/yn3e9jmY=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 74EB344355E;
	Wed,  6 Jun 2018 11:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277498;
	bh=CMmVzt4a3RYYkoxTChm+EUJm/11QFvwCw2sxhsnogis=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cz+c3ZY4hwSorA02wdw3JshB8XyBD+2TNKpmUthoxf9bs71S/frU5TLAXeXs5NRH6
	BwTFDViglBUZO2xIrKNbrjMm1yVbxZadXQ0awop9yAqcF6fQrJ4EOvGrtwq7TSo9tj
	VtwlveRaL9jE3BKcbUrX3snViF4bDJK/yn3e9jmY=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Wed,  6 Jun 2018 11:31:00 +0200
Message-Id: <20180606093101.30518-6-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180606093101.30518-1-luc.michel@greensocs.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 5/6] intc/arm_gic: Improve traces
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
X-TUID: Wlktucc8Cq6/

From: Luc MICHEL <luc.michel@greensocs.com>

Add some traces to the ARM GIC to catch register accesses (distributor,
(v)cpu interface and virtual interface), and to take into account
virtualization extensions (print `vcpu` instead of `cpu` when needed).

Also add some virtualization extensions specific traces: LR updating
and maintenance IRQ generation.

Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c    | 31 +++++++++++++++++++++++++------
 hw/intc/trace-events | 12 ++++++++++--
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 6105f930c4..a0ffd85fdf 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -179,8 +179,10 @@ static inline void gic_update_internal(GICState *s, bool virt)
         }
 
         if (best_irq != 1023) {
-            trace_gic_update_bestirq(cpu, best_irq, best_prio,
-                s->priority_mask[cpu_iface], s->running_priority[cpu_iface]);
+            trace_gic_update_bestirq(virt ? "vcpu" : "cpu", cpu,
+                                     best_irq, best_prio,
+                                     s->priority_mask[cpu_iface],
+                                     s->running_priority[cpu_iface]);
         }
 
         irq_level = fiq_level = 0;
@@ -268,6 +270,7 @@ static void gic_update_maintenance(GICState *s)
         gic_compute_misr(s, cpu);
         maint_level = (s->h_hcr[cpu] & GICH_HCR_EN) && s->h_misr[cpu];
 
+        trace_gic_update_maintenance_irq(cpu, maint_level);
         qemu_set_irq(s->maintenance_irq[cpu], maint_level);
     }
 }
@@ -524,7 +527,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
      * is in the wrong group.
      */
     irq = gic_get_current_pending_irq(s, cpu, attrs);
-    trace_gic_acknowledge_irq(gic_get_vcpu_real_id(cpu), irq);
+    trace_gic_acknowledge_irq(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
+                              gic_get_vcpu_real_id(cpu), irq);
 
     if (irq >= GIC_MAXIRQ) {
         DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
@@ -1002,20 +1006,23 @@ static MemTxResult gic_dist_read(void *opaque, hwaddr offset, uint64_t *data,
     switch (size) {
     case 1:
         *data = gic_dist_readb(opaque, offset, attrs);
-        return MEMTX_OK;
+        break;
     case 2:
         *data = gic_dist_readb(opaque, offset, attrs);
         *data |= gic_dist_readb(opaque, offset + 1, attrs) << 8;
-        return MEMTX_OK;
+        break;
     case 4:
         *data = gic_dist_readb(opaque, offset, attrs);
         *data |= gic_dist_readb(opaque, offset + 1, attrs) << 8;
         *data |= gic_dist_readb(opaque, offset + 2, attrs) << 16;
         *data |= gic_dist_readb(opaque, offset + 3, attrs) << 24;
-        return MEMTX_OK;
+        break;
     default:
         return MEMTX_ERROR;
     }
+
+    trace_gic_dist_read(offset, size, *data);
+    return MEMTX_OK;
 }
 
 static void gic_dist_writeb(void *opaque, hwaddr offset,
@@ -1309,6 +1316,8 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
 static MemTxResult gic_dist_write(void *opaque, hwaddr offset, uint64_t data,
                                   unsigned size, MemTxAttrs attrs)
 {
+    trace_gic_dist_write(offset, size, data);
+
     switch (size) {
     case 1:
         gic_dist_writeb(opaque, offset, data, attrs);
@@ -1463,12 +1472,18 @@ static MemTxResult gic_cpu_read(GICState *s, int cpu, int offset,
         *data = 0;
         break;
     }
+
+    trace_gic_cpu_read(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
+                       gic_get_vcpu_real_id(cpu), offset, *data);
     return MEMTX_OK;
 }
 
 static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
                                  uint32_t value, MemTxAttrs attrs)
 {
+    trace_gic_cpu_write(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
+                        gic_get_vcpu_real_id(cpu), offset, value);
+
     switch (offset) {
     case 0x00: /* Control */
         gic_set_cpu_control(s, cpu, value, attrs);
@@ -1679,6 +1694,7 @@ static void gic_set_lr_entry(GICState *s, int cpu, int lr_num, uint32_t entry)
     }
 
     s->h_lr[lr_num][cpu] = entry;
+    trace_gic_lr_entry(cpu, lr_num, entry);
     is_free = gic_lr_update(s, lr_num, cpu);
 
     if (!is_free) {
@@ -1749,6 +1765,7 @@ static MemTxResult gic_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
         return MEMTX_OK;
     }
 
+    trace_gic_hyp_read(addr, *data);
     return MEMTX_OK;
 }
 
@@ -1759,6 +1776,8 @@ static MemTxResult gic_hyp_write(void *opaque, hwaddr addr, uint64_t value,
     int cpu = gic_get_current_cpu(s);
     int vcpu = gic_get_current_vcpu(s);
 
+    trace_gic_hyp_write(addr, value);
+
     switch (addr) {
     case 0x0: /* Hypervisor Control */
         s->h_hcr[cpu] = value & 0xf80000ff;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 55e8c2570c..16d02fa8cf 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -92,9 +92,17 @@ aspeed_vic_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64
 gic_enable_irq(int irq) "irq %d enabled"
 gic_disable_irq(int irq) "irq %d disabled"
 gic_set_irq(int irq, int level, int cpumask, int target) "irq %d level %d cpumask 0x%x target 0x%x"
-gic_update_bestirq(int cpu, int irq, int prio, int priority_mask, int running_priority) "cpu %d irq %d priority %d cpu priority mask %d cpu running priority %d"
+gic_update_bestirq(const char *s, int cpu, int irq, int prio, int priority_mask, int running_priority) "%s %d irq %d priority %d cpu priority mask %d cpu running priority %d"
 gic_update_set_irq(int cpu, const char *name, int level) "cpu[%d]: %s = %d"
-gic_acknowledge_irq(int cpu, int irq) "cpu %d acknowledged irq %d"
+gic_acknowledge_irq(const char *s, int cpu, int irq) "%s %d acknowledged irq %d"
+gic_cpu_write(const char *s, int cpu, int addr, uint32_t val) "%s %d iface write at 0x%08x 0x%08" PRIx32
+gic_cpu_read(const char *s, int cpu, int addr, uint32_t val) "%s %d iface write at 0x%08x: 0x%08" PRIx32
+gic_hyp_read(int addr, uint32_t val) "hyp read at 0x%08x: 0x%08" PRIx32
+gic_hyp_write(int addr, uint32_t val) "hyp write at 0x%08x: 0x%08" PRIx32
+gic_dist_read(int addr, unsigned int size, uint32_t val) "dist read at 0x%08x size %u: 0x%08" PRIx32
+gic_dist_write(int addr, unsigned int size, uint32_t val) "dist write at 0x%08x size %u: 0x%08" PRIx32
+gic_lr_entry(int cpu, int entry, uint32_t val) "cpu %d: new lr entry %d: 0x%08" PRIx32
+gic_update_maintenance_irq(int cpu, int val) "cpu %d: maintenance = %d"
 
 # hw/intc/arm_gicv3_cpuif.c
 gicv3_icc_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR read cpu 0x%x value 0x%" PRIx64
-- 
2.17.0


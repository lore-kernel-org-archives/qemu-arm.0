Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507794wru;
        Fri, 27 Jul 2018 02:56:25 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpekKIUvW53ehD5H2x1xrFQfYuOtMH8vzPqDgTQd2dkU28apXVzyJFbOOPxflofjHlC8jQsO
X-Received: by 2002:aed:3ea5:: with SMTP id n34-v6mr5396174qtf.275.1532685385391;
        Fri, 27 Jul 2018 02:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685385; cv=none;
        d=google.com; s=arc-20160816;
        b=gX/3LXWW/DIXZVllWYyB9iltN23ZeMutXBPOXcFRJDITfvQ+YsU21b1URXpF6EH4FJ
         NHNQId0Xwv8tJ9ZjVarxhFjLTX5tAt+7OvsjY9+Q8SId/ju0zoUBjJ7pnRTVpAI/qywb
         /cKsXjMkDtgzlwzRX2qNdvasGuco9/6IrVznIo4lrLxNnYeAbhUUZoalhePsbWPYATnP
         kd2YkOqa6Mz9msfvCz7qqOUS4sKJKo57jojh/+9HWqh81PXM7IOh5wwPDLxovMhF/Uzm
         NyLM7ncBUAqT1rxk3z46Zgp/5aAzLaXWZEbd2ZAcKsiiPluTQadnWQjl2w2Fxes1AZ9a
         7w+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=E5drH9WEG9dANnkN55KnlzgOI055s0p019fyRcl0rl0=;
        b=gWKlsZLW6rPvq7n7n78/ke+FOcnwiwC/NJ8xR8E7r93ruBRQcTQMIDFcvKwPykONxc
         hTsUenpwdNoXhOAAwfmwsgX7xYhgUQyY80LdgTlxq0YvPPTEdnPo1ItQdTxXosidLWmS
         R46Padcy+EDQ2uQaACT5YDbrzDmh1ugwyQ8/w4K/Ed3NuPNdi0cWURIsTdMQ+ii+JzCP
         2//PQ1qvb9N8dS5KaZJg7jBtKxaHi3JVqaET0dzq+6hHGdc7SDeMtvsM0onTMMCgtkWW
         jdEKSY0Rtwywkz6YP4YcIG1I3eqt6mn3s4LPouXPLBJEsukMLB0IVubWlC4nO4+62Xya
         fcXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ymo13dPx;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="KaIac/ys";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="KaIac/ys";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19-v6si3699582qkh.271.2018.07.27.02.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ymo13dPx;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="KaIac/ys";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="KaIac/ys";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40042 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizU0-00058N-PX
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:56:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSf-0003dc-NL
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006Ce-VE
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:01 -0400
Received: from greensocs.com ([193.104.36.180]:47534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSZ-0006Au-KV; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9E8EB443555;
	Fri, 27 Jul 2018 11:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685292;
	bh=NPr6OjFh0pz4ZmPkNP0eT08Q4MxZN27JaWCOFwGMd5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ymo13dPxbe6wyqDpNb4AyZDoqUnygM+iXoZGMClPzySaTaXy5jhSiRLi7uPoTFxzZ
	H5WwbUMCg20CIXoNFXy9gMOxvEt8Oej66GGGyhz4+FVZ8GzMN+NrwAFgcHkMO6HARf
	0OguhdM3LQyMX8l3A9R3gvZE4vruQS3zq8abpH/k=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=KaIac/ys;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=KaIac/ys
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQyWFexLhLR5; Fri, 27 Jul 2018 11:54:51 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 49481443557; Fri, 27 Jul 2018 11:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685290;
	bh=NPr6OjFh0pz4ZmPkNP0eT08Q4MxZN27JaWCOFwGMd5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KaIac/yswLLMtTQeWS52vO/LJfJppoFCcuUFVbc+cIzw1TaiSVZf9c8c/rW1lvaXJ
	Xq69E5Es/NwU9d3wuO6F+adVlNwoXQ9WcGcs/n2e6fiIRgwjSqypEncpdGldqvKKv4
	comdmpA/HjaGh6whu/MT/CPNDCuHEfUYD04Vi+/g=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E2FD8400DC8;
	Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685290;
	bh=NPr6OjFh0pz4ZmPkNP0eT08Q4MxZN27JaWCOFwGMd5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KaIac/yswLLMtTQeWS52vO/LJfJppoFCcuUFVbc+cIzw1TaiSVZf9c8c/rW1lvaXJ
	Xq69E5Es/NwU9d3wuO6F+adVlNwoXQ9WcGcs/n2e6fiIRgwjSqypEncpdGldqvKKv4
	comdmpA/HjaGh6whu/MT/CPNDCuHEfUYD04Vi+/g=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:19 +0200
Message-Id: <20180727095421.386-19-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 18/20] intc/arm_gic: Improve traces
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
X-TUID: AwuuALVAz+Fz

Add some traces to the ARM GIC to catch register accesses (distributor,
(v)cpu interface and virtual interface), and to take into account
virtualization extensions (print `vcpu` instead of `cpu` when needed).

Also add some virtualization extensions specific traces: LR updating
and maintenance IRQ generation.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c    | 31 +++++++++++++++++++++++++------
 hw/intc/trace-events | 12 ++++++++++--
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 6ff7da3e5d..c1b35fc1ee 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -182,12 +182,14 @@ static inline void gic_update_internal(GICState *s,=
 bool virt)
         } else {
             gic_get_best_irq(s, cpu, &best_irq, &best_prio, &group);
         }
=20
         if (best_irq !=3D 1023) {
-            trace_gic_update_bestirq(cpu, best_irq, best_prio,
-                s->priority_mask[cpu_iface], s->running_priority[cpu_ifa=
ce]);
+            trace_gic_update_bestirq(virt ? "vcpu" : "cpu", cpu,
+                                     best_irq, best_prio,
+                                     s->priority_mask[cpu_iface],
+                                     s->running_priority[cpu_iface]);
         }
=20
         irq_level =3D fiq_level =3D 0;
=20
         if (best_prio < s->priority_mask[cpu_iface]) {
@@ -330,10 +332,11 @@ static void gic_update_maintenance(GICState *s)
=20
     for (cpu =3D 0; cpu < s->num_cpu; cpu++) {
         gic_compute_misr(s, cpu);
         maint_level =3D (s->h_hcr[cpu] & R_GICH_HCR_EN_MASK) && s->h_mis=
r[cpu];
=20
+        trace_gic_update_maintenance_irq(cpu, maint_level);
         qemu_set_irq(s->maintenance_irq[cpu], maint_level);
     }
 }
=20
 static void gic_update_virt(GICState *s)
@@ -595,11 +598,12 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, =
MemTxAttrs attrs)
     /* gic_get_current_pending_irq() will return 1022 or 1023 appropriat=
ely
      * for the case where this GIC supports grouping and the pending int=
errupt
      * is in the wrong group.
      */
     irq =3D gic_get_current_pending_irq(s, cpu, attrs);
-    trace_gic_acknowledge_irq(gic_get_vcpu_real_id(cpu), irq);
+    trace_gic_acknowledge_irq(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
+                              gic_get_vcpu_real_id(cpu), irq);
=20
     if (irq >=3D GIC_MAXIRQ) {
         DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
         return irq;
     }
@@ -1128,24 +1132,27 @@ static MemTxResult gic_dist_read(void *opaque, hw=
addr offset, uint64_t *data,
                                  unsigned size, MemTxAttrs attrs)
 {
     switch (size) {
     case 1:
         *data =3D gic_dist_readb(opaque, offset, attrs);
-        return MEMTX_OK;
+        break;
     case 2:
         *data =3D gic_dist_readb(opaque, offset, attrs);
         *data |=3D gic_dist_readb(opaque, offset + 1, attrs) << 8;
-        return MEMTX_OK;
+        break;
     case 4:
         *data =3D gic_dist_readb(opaque, offset, attrs);
         *data |=3D gic_dist_readb(opaque, offset + 1, attrs) << 8;
         *data |=3D gic_dist_readb(opaque, offset + 2, attrs) << 16;
         *data |=3D gic_dist_readb(opaque, offset + 3, attrs) << 24;
-        return MEMTX_OK;
+        break;
     default:
         return MEMTX_ERROR;
     }
+
+    trace_gic_dist_read(offset, size, *data);
+    return MEMTX_OK;
 }
=20
 static void gic_dist_writeb(void *opaque, hwaddr offset,
                             uint32_t value, MemTxAttrs attrs)
 {
@@ -1480,10 +1487,12 @@ static void gic_dist_writel(void *opaque, hwaddr =
offset,
 }
=20
 static MemTxResult gic_dist_write(void *opaque, hwaddr offset, uint64_t =
data,
                                   unsigned size, MemTxAttrs attrs)
 {
+    trace_gic_dist_write(offset, size, data);
+
     switch (size) {
     case 1:
         gic_dist_writeb(opaque, offset, data, attrs);
         return MEMTX_OK;
     case 2:
@@ -1636,16 +1645,22 @@ static MemTxResult gic_cpu_read(GICState *s, int =
cpu, int offset,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_cpu_read: Bad offset %x\n", (int)offset);
         *data =3D 0;
         break;
     }
+
+    trace_gic_cpu_read(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
+                       gic_get_vcpu_real_id(cpu), offset, *data);
     return MEMTX_OK;
 }
=20
 static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
                                  uint32_t value, MemTxAttrs attrs)
 {
+    trace_gic_cpu_write(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
+                        gic_get_vcpu_real_id(cpu), offset, value);
+
     switch (offset) {
     case 0x00: /* Control */
         gic_set_cpu_control(s, cpu, value, attrs);
         break;
     case 0x04: /* Priority mask */
@@ -1892,19 +1907,22 @@ static MemTxResult gic_hyp_read(void *opaque, int=
 cpu, hwaddr addr,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_hyp_read: Bad offset %" HWADDR_PRIx "\n", add=
r);
         return MEMTX_OK;
     }
=20
+    trace_gic_hyp_read(addr, *data);
     return MEMTX_OK;
 }
=20
 static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
                                  uint64_t value, MemTxAttrs attrs)
 {
     GICState *s =3D ARM_GIC(opaque);
     int vcpu =3D cpu + GIC_NCPU;
=20
+    trace_gic_hyp_write(addr, value);
+
     switch (addr) {
     case A_GICH_HCR: /* Hypervisor Control */
         s->h_hcr[cpu] =3D value & GICH_HCR_MASK;
         break;
=20
@@ -1924,10 +1942,11 @@ static MemTxResult gic_hyp_write(void *opaque, in=
t cpu, hwaddr addr,
         if (lr_idx > s->num_lrs) {
             return MEMTX_OK;
         }
=20
         s->h_lr[lr_idx][cpu] =3D value & GICH_LR_MASK;
+        trace_gic_lr_entry(cpu, lr_idx, s->h_lr[lr_idx][cpu]);
         break;
     }
=20
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 5fb18e65c9..81c7c399f7 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -90,13 +90,21 @@ aspeed_vic_write(uint64_t offset, unsigned size, uint=
32_t data) "To 0x%" PRIx64
=20
 # hw/intc/arm_gic.c
 gic_enable_irq(int irq) "irq %d enabled"
 gic_disable_irq(int irq) "irq %d disabled"
 gic_set_irq(int irq, int level, int cpumask, int target) "irq %d level %=
d cpumask 0x%x target 0x%x"
-gic_update_bestirq(int cpu, int irq, int prio, int priority_mask, int ru=
nning_priority) "cpu %d irq %d priority %d cpu priority mask %d cpu runni=
ng priority %d"
+gic_update_bestirq(const char *s, int cpu, int irq, int prio, int priori=
ty_mask, int running_priority) "%s %d irq %d priority %d cpu priority mas=
k %d cpu running priority %d"
 gic_update_set_irq(int cpu, const char *name, int level) "cpu[%d]: %s =3D=
 %d"
-gic_acknowledge_irq(int cpu, int irq) "cpu %d acknowledged irq %d"
+gic_acknowledge_irq(const char *s, int cpu, int irq) "%s %d acknowledged=
 irq %d"
+gic_cpu_write(const char *s, int cpu, int addr, uint32_t val) "%s %d ifa=
ce write at 0x%08x 0x%08" PRIx32
+gic_cpu_read(const char *s, int cpu, int addr, uint32_t val) "%s %d ifac=
e read at 0x%08x: 0x%08" PRIx32
+gic_hyp_read(int addr, uint32_t val) "hyp read at 0x%08x: 0x%08" PRIx32
+gic_hyp_write(int addr, uint32_t val) "hyp write at 0x%08x: 0x%08" PRIx3=
2
+gic_dist_read(int addr, unsigned int size, uint32_t val) "dist read at 0=
x%08x size %u: 0x%08" PRIx32
+gic_dist_write(int addr, unsigned int size, uint32_t val) "dist write at=
 0x%08x size %u: 0x%08" PRIx32
+gic_lr_entry(int cpu, int entry, uint32_t val) "cpu %d: new lr entry %d:=
 0x%08" PRIx32
+gic_update_maintenance_irq(int cpu, int val) "cpu %d: maintenance =3D %d=
"
=20
 # hw/intc/arm_gicv3_cpuif.c
 gicv3_icc_pmr_read(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR read cpu 0=
x%x value 0x%" PRIx64
 gicv3_icc_pmr_write(uint32_t cpu, uint64_t val) "GICv3 ICC_PMR write cpu=
 0x%x value 0x%" PRIx64
 gicv3_icc_bpr_read(int grp, uint32_t cpu, uint64_t val) "GICv3 ICC_BPR%d=
 read cpu 0x%x value 0x%" PRIx64
--=20
2.18.0


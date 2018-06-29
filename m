Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp731121wrq;
        Fri, 29 Jun 2018 06:32:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpenRBdQrinaApTbjfvhGT7uoX82Amyubu1W8xsvixtnqB/rTU0eNhRiK7hbAuLNTVhyGlrs
X-Received: by 2002:aed:36e7:: with SMTP id f94-v6mr13650371qtb.276.1530279132485;
        Fri, 29 Jun 2018 06:32:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279132; cv=none;
        d=google.com; s=arc-20160816;
        b=F9QheI9LL6Nuj0z7DOK4m4LMsNuEeHU9ymTDM+GV3jdMaYcJCGQ0J3vJjXQdIMetsh
         nYNXxcpN3LeD89ICr8pWIBOTgSFRvT4k5y+TpiDnJ01hDGco8c7+NvWtGdSFdhNcoe8B
         mGR8Keb880AAfjdRcRs684CjdQ/hMekMZ0HIwck8WdG6Ywj21JWeS2EL7jJWZhg0+Zir
         pxRCahtk7MywIdK6HwtLzz35tP5sjhbiPvm2EzsNud7KLhPKdDlpOuDLj86vNyjGUBIL
         Nm3VMziKpvoJYznxGbBtEMra7SodSWiMseSeS5RXsoxEcwKlOzFpe7qxR7wV5hiygNCW
         Pg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=qXtqN1QK+gN3aK2cM5ZdSStfdhsi6NAznL0VYa/c0xU=;
        b=bnlqt94HK9Iqo3SuI138X3ccNivpeWKgLvBEgMKXU4lTuVO8XIt2YrFmd8x96E8mOS
         CYICPr7eVzxeqz+SkOnBCcgqd7mKNXSbTth5Uyw+2bJ3bBgzmY9yfo+c1Uh38ehLF9cz
         J7w/zPrxqYLrFoxSbJZ4njA0paT7/jZ94AxcsS4XYUD9FdgvoeBkr4rWFNvHVVif8tCN
         sBDIdrwEXlmPi+nNCVnEt2HOzzgOaUZc9HAXv6HmLsrUd5Sc1O0C09NsbxWFJOoYmdj7
         y0GRNJnHtIXib1Mi173IdOIcHcfhq+pBO+TLlMefXI57uIotlgHl5seR0ZdGo6/OYbWS
         R4Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="0K//EYf7";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CH84hPtv;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zF8hNKUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w1-v6si8806627qvf.185.2018.06.29.06.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:32:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="0K//EYf7";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CH84hPtv;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=zF8hNKUM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtVT-0008WB-Rh
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:32:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtUA-0007aK-74
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006tV-Oo
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:50 -0400
Received: from greensocs.com ([193.104.36.180]:58616)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU3-0006mV-Db; Fri, 29 Jun 2018 09:30:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 101154434A8;
	Fri, 29 Jun 2018 15:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279043;
	bh=JXnfvnQvRli+fPXG5DPmVsRnNaeRyhVEbA5DGp3+TWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=0K//EYf7T/ir8ZJE5ly38+aQmMGY+k3vf33cpWMXvAARb7ZNEx1LooWh6DMuHb0t8
	sYHljrg4A30WDBRXBHtSgXMAbnEP5KbwqVVhl+vHWzB8x2zEPQmvCc51O7L/ous6IU
	oFx3XtxUGan+giC0SIIoBm+exG1qcv2Pb1jhRroo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=CH84hPtv;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zF8hNKUM
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abAPlla9AiuM; Fri, 29 Jun 2018 15:30:42 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 0076C443495; Fri, 29 Jun 2018 15:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279042;
	bh=JXnfvnQvRli+fPXG5DPmVsRnNaeRyhVEbA5DGp3+TWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CH84hPtvpTks3wWfsQX5pqP3JSCOidnjSqPXVUcq4z0kDwzXCvyIYS5wAB33R31Hm
	jwbPwMUfOB4/2dcdx0En1/LFi8i3gHxUxCi4gH+tMGb/ejwP2xEp/A/LUkKx8yyHEF
	1gahXvIXBpwwyapmWASBEfXZU7E5XTbOJkmBptn0=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 953B84434BA;
	Fri, 29 Jun 2018 15:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279041;
	bh=JXnfvnQvRli+fPXG5DPmVsRnNaeRyhVEbA5DGp3+TWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zF8hNKUMVarzSQ30Am/o4h0DucBAzby8CFYSAO1XAjvCbajGWQmrvYUUeG6aMBLVp
	2PTH6+3lMceouK2RljBwQNECpMC78cHFi0A8+uv/v0ywa6+HtxqYdvEXZqc6/KjT+Q
	Vos3DvzbO0MDEqxFHdtLyejTjldIG0ppVDEeBnyk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:52 +0200
Message-Id: <20180629132954.24269-19-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 18/20] intc/arm_gic: Improve traces
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
X-TUID: 7M/ecdfbC2G/

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
index 10300e9b4c..7d24348d96 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -172,8 +172,10 @@ static inline void gic_update_internal(GICState *s, =
bool virt)
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
@@ -290,6 +292,7 @@ static void gic_update_maintenance(GICState *s)
         gic_compute_misr(s, cpu);
         maint_level =3D (s->h_hcr[cpu] & R_GICH_HCR_EN_MASK) && s->h_mis=
r[cpu];
=20
+        trace_gic_update_maintenance_irq(cpu, maint_level);
         qemu_set_irq(s->maintenance_irq[cpu], maint_level);
     }
 }
@@ -561,7 +564,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, Me=
mTxAttrs attrs)
      * is in the wrong group.
      */
     irq =3D gic_get_current_pending_irq(s, cpu, attrs);
-    trace_gic_acknowledge_irq(gic_get_vcpu_real_id(cpu), irq);
+    trace_gic_acknowledge_irq(gic_is_vcpu(cpu) ? "vcpu" : "cpu",
+                              gic_get_vcpu_real_id(cpu), irq);
=20
     if (irq >=3D GIC_MAXIRQ) {
         DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
@@ -1040,20 +1044,23 @@ static MemTxResult gic_dist_read(void *opaque, hw=
addr offset, uint64_t *data,
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
@@ -1384,6 +1391,8 @@ static void gic_dist_writel(void *opaque, hwaddr of=
fset,
 static MemTxResult gic_dist_write(void *opaque, hwaddr offset, uint64_t =
data,
                                   unsigned size, MemTxAttrs attrs)
 {
+    trace_gic_dist_write(offset, size, data);
+
     switch (size) {
     case 1:
         gic_dist_writeb(opaque, offset, data, attrs);
@@ -1540,12 +1549,18 @@ static MemTxResult gic_cpu_read(GICState *s, int =
cpu, int offset,
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
@@ -1820,6 +1835,7 @@ static MemTxResult gic_hyp_read(void *opaque, hwadd=
r addr, uint64_t *data,
         return MEMTX_OK;
     }
=20
+    trace_gic_hyp_read(addr, *data);
     return MEMTX_OK;
 }
=20
@@ -1830,6 +1846,8 @@ static MemTxResult gic_hyp_write(void *opaque, hwad=
dr addr, uint64_t value,
     int cpu =3D gic_get_current_cpu(s);
     int vcpu =3D gic_get_current_vcpu(s);
=20
+    trace_gic_hyp_write(addr, value);
+
     switch (addr) {
     case A_GICH_HCR: /* Hypervisor Control */
         s->h_hcr[cpu] =3D value & GICH_HCR_MASK;
@@ -1853,6 +1871,7 @@ static MemTxResult gic_hyp_write(void *opaque, hwad=
dr addr, uint64_t value,
         }
=20
         s->h_lr[lr_idx][cpu] =3D value & GICH_LR_MASK;
+        trace_gic_lr_entry(cpu, lr_idx, s->h_lr[lr_idx][cpu]);
         break;
     }
=20
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 55e8c2570c..47fa4ad5c1 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -92,9 +92,17 @@ aspeed_vic_write(uint64_t offset, unsigned size, uint3=
2_t data) "To 0x%" PRIx64
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
--=20
2.17.1


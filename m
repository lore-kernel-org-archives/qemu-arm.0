Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp657500wrq;
        Sat, 14 Jul 2018 10:28:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeGX0wwJujeVjXyQuVt5AaqBa0gLwb3V2Ah+9xh2N1gPN5YQrHROWUhZas2eQYRcqhG1eXL
X-Received: by 2002:ae9:df81:: with SMTP id t123-v6mr9223025qkf.55.1531589337306;
        Sat, 14 Jul 2018 10:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531589337; cv=none;
        d=google.com; s=arc-20160816;
        b=f4Xrq3s97PrtqkCAGysbof90IMmV8tk0g3zS9410eD/bRPU4CzxdMZ34UX+oZdwKJN
         tRyY5cpGzJNuUeF9ydm3y9zRJ8ElUY6qLAguKny+7HTBq7tW8N0wo6NAHhKCDbfMBBRt
         chLEh3Tp/sumlrHlkgN07ctixgsysdovsEsA2mnuClgzvJiXiLDTk75VMTip33YK1eCA
         S4LpdH0KHjLrLm1lIVrL2VI/srYdbd+AMuvbP7ID5tJ+qIDjTFkgyjuQSdCCffyrJ+Ym
         4tbDqigNh1kVFqByAz6hWikK45le8c+sptLVOz/02QM60B5FI04+nz4I0JhnbOCwhWo7
         uaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=nh0CtSEfhZnCSxhulX+TyyhIJTKqHXnJuHGlOvkQgq0=;
        b=dwgqw1SmkvEba15L+MQdatI1LhJWhnBItTaG5Z3jcy4i0neMFtVvHu64TwJtlRdOnZ
         RdNKpdLEsU10X2P1Wxq7tEqvTB9QHlF2b2Lp9GjMtX+00W1CONnh3DkIYBkAb75/VDh7
         5r9+fzEQJgYN2lrFHwGgLI3uK0/sz4UmJhWQoKkLnQy0Cxvl0ssEn/VW0kaXsYbXL9Ev
         VmL7jOUpCYvETqFcQQm1LmBU6wc+7H3pdd4rwHp11DlNukcO48v3z+Pd899WUWjfMDMM
         eoMKOwC+QErlGDgtol3qS/LEKCE7B5vpn7fHC3kRedXUUL591JjN3S9bL1FrNQa4QDkf
         ALTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ja9NagPl;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CmF+7Ffn;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=l56X17Q4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r1-v6si3164739qkd.113.2018.07.14.10.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=ja9NagPl;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CmF+7Ffn;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=l56X17Q4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOLo-00078a-Pi
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:28:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9u-0005nN-Ck
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9r-0004bz-7a
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:38 -0400
Received: from greensocs.com ([193.104.36.180]:57408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9q-0004bC-Nc; Sat, 14 Jul 2018 13:16:35 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 28D4CC7AFD;
	Sat, 14 Jul 2018 19:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588594;
	bh=HfO+D7ZdbpsDFmIwVCToXNZbCsQtb1nXmnk4bOtXSqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ja9NagPl1tUGZb5F6Gnsjog5gD23u3juxrBCKUbgI1F/kA8R/3w0GXpJvCp1eicKN
	6E1CZDTwJiJ9r6/H7IXXlqUq8VZm7MOsGtFOoxD2wtOUv8Yd8wa0Tf2M70kjSBOcTK
	4Bi40TbbGt7dQicWA2ZVNvknceXuHT6qmOvB458c=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=CmF+7Ffn;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=l56X17Q4
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gDXWf990x2J; Sat, 14 Jul 2018 19:16:33 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 13F88C7AE3; Sat, 14 Jul 2018 19:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588592;
	bh=HfO+D7ZdbpsDFmIwVCToXNZbCsQtb1nXmnk4bOtXSqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CmF+7FfnQd6PhR/EDgO3vFbszAG1gL2IQ6hCzPJaTrjpqVYCJ39g+1qN2etJsXXSL
	3P/8eHEdxHOnL9zUwkbSirwp5Hc4xTlr8zS0cSYUq5CrmvQH69m+/rMiAdmc/HrHKT
	Qkg7vwanW5QqxuBonuAYoCAYsQzn0tGuXtTqrpOQ=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4BF51C7ADD;
	Sat, 14 Jul 2018 19:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588591;
	bh=HfO+D7ZdbpsDFmIwVCToXNZbCsQtb1nXmnk4bOtXSqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l56X17Q4dKV/mRa1B9Z1JhE0tjiNFYDPa15HjTZWS+dWVrJxdQLjqBmkIF1WtfqHF
	stW+/pcdSgaaz/yx4eNy6/9oYV1+Krv92x8uD/gZDXxZc8owns7rtsVuHAs4EGTC44
	bneVV0/5azTPlwJxCh4+KnLWh9NpgzrEr9ezS9q0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:59 +0200
Message-Id: <20180714171601.5734-19-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 18/20] intc/arm_gic: Improve traces
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
X-TUID: Z0bALnEE5kV5

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
index 4155fbe667..bb06c90cfc 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -184,8 +184,10 @@ static inline void gic_update_internal(GICState *s, =
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
@@ -332,6 +334,7 @@ static void gic_update_maintenance(GICState *s)
         gic_compute_misr(s, cpu);
         maint_level =3D (s->h_hcr[cpu] & R_GICH_HCR_EN_MASK) && s->h_mis=
r[cpu];
=20
+        trace_gic_update_maintenance_irq(cpu, maint_level);
         qemu_set_irq(s->maintenance_irq[cpu], maint_level);
     }
 }
@@ -597,7 +600,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, Me=
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
@@ -1098,20 +1102,23 @@ static MemTxResult gic_dist_read(void *opaque, hw=
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
@@ -1450,6 +1457,8 @@ static void gic_dist_writel(void *opaque, hwaddr of=
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
@@ -1606,12 +1615,18 @@ static MemTxResult gic_cpu_read(GICState *s, int =
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
@@ -1862,6 +1877,7 @@ static MemTxResult gic_hyp_read(void *opaque, int c=
pu, hwaddr addr,
         return MEMTX_OK;
     }
=20
+    trace_gic_hyp_read(addr, *data);
     return MEMTX_OK;
 }
=20
@@ -1871,6 +1887,8 @@ static MemTxResult gic_hyp_write(void *opaque, int =
cpu, hwaddr addr,
     GICState *s =3D ARM_GIC(opaque);
     int vcpu =3D cpu + GIC_NCPU;
=20
+    trace_gic_hyp_write(addr, value);
+
     switch (addr) {
     case A_GICH_HCR: /* Hypervisor Control */
         s->h_hcr[cpu] =3D value & GICH_HCR_MASK;
@@ -1894,6 +1912,7 @@ static MemTxResult gic_hyp_write(void *opaque, int =
cpu, hwaddr addr,
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
2.18.0


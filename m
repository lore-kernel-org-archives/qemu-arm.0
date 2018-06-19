Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4911639wrq;
        Tue, 19 Jun 2018 02:32:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLoqs36ZluzQGY8Effyxlv81Ho0RjqZ0XtSihyAcvx1wC0VlR5nWFYGG0UUzixMtuhx6zoa
X-Received: by 2002:ae9:ebcf:: with SMTP id b198-v6mr12946926qkg.113.1529400730549;
        Tue, 19 Jun 2018 02:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529400730; cv=none;
        d=google.com; s=arc-20160816;
        b=Wq4mXzifdqXCjK2GMSrENrTVxQV1Z/nxzntsa87VT4g6wnpNlWb6fZtKxQXTFO9seQ
         /si6sy4Mh9kpmmYfuCKyp6+u2kXJ/I9lF8BvlgPY8L3QhB+Ug2IbhUWILj9ZbELhnV7m
         juFV63GW36PKpB/bVJorePP0lwJ4JXCtNdpjzxRYZtUPoIRGh4a+F8f9wvPrAIF/Ye9M
         WdxBCzphDHNA3McB7NDP3O4MJQVr9ZhY78r0awwt3rDHXPKFWz+6vUqgyjWDE6oiwR82
         1cBtfKDMsLn47fXX9us+V2UD3f5Th9JXleYC8EzhtaRsdBowMOYGwcmXmZa3tLAkZGhl
         xifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=YUxLJ5jhGTFtABBG6OGbPPFL6pZvCkHJ/ztZC5zyYPg=;
        b=fxHOXYI7McJeVRsceMBxW7I/S3XQRvBkDfg8p1cf0BcwTXeTmU8UWf8iG6yjcU3856
         nAtNDla0gqsnJ/CLhiPOB70HOa92cDAxbGayXSdvAQwacwbQUtVXkb09igPabgGnUdRl
         jyLKPqbRhI40JcZdb5Jmyd9qxViQ/BocBT3W3kkMBifge0+CFFmJQ2aizjqCFFT5q/5A
         ItN9TquBjWuP4EQtibZmyeRrON+GDtF++kWud6AKZSYyhwpD24AJgcoLVx0iUOfcuOPT
         6oOyoeZ6mmkAf4zHvbm5VwQiKHDVgVsezqNNlTB7j1TPygczg99pnlNx++4Nl2zshTX6
         7ZXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="hah/rorK";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=U+eKRhe3;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=U+eKRhe3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b27-v6si1606419qtb.275.2018.06.19.02.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jun 2018 02:32:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="hah/rorK";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=U+eKRhe3;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=U+eKRhe3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVCzi-0005ge-12
	for alex.bennee@linaro.org; Tue, 19 Jun 2018 05:32:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38110)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzG-0005Pm-6r
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fVCzC-0006Go-0Q
	for qemu-arm@nongnu.org; Tue, 19 Jun 2018 05:31:42 -0400
Received: from greensocs.com ([193.104.36.180]:42325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fVCzB-0006GR-Kp; Tue, 19 Jun 2018 05:31:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 482A5428984;
	Tue, 19 Jun 2018 11:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400691;
	bh=cDP7AKA+0AbszTm7zc2svxuoTOxVOao6HgwwSykwt4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hah/rorKrY3FTC2kiK9+9hWb6pa16Zunk9ovJJJrgCYhHD0xeXOJ1xm0Ma4UZtA8i
	Qr4s6miFis+nVBS+8k+sAWfsOpWpYITCGAgSTW/tJ84NOqa8I6YWqta7kGfh34vT+Q
	sskVDa1Zg7bgcLZZ9CVTx2So3vlxMrbu5cMy5ZvA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U+eKRhe3;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=U+eKRhe3
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vG0DU7fgj0nC; Tue, 19 Jun 2018 11:31:30 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 8B4EF44B867; Tue, 19 Jun 2018 11:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400689;
	bh=cDP7AKA+0AbszTm7zc2svxuoTOxVOao6HgwwSykwt4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U+eKRhe3RMXBbTalr1j3uoAjZmiB4OtB/2Qy7L/wGoLPYwZ9zBs0k0VqFVhR1qLM5
	+lBzn6IUXu3ZgK/gzQTpf7PIIOmwmIXmUfJSHd+QYyMuUhFBwk3OZetEhqluFV6dOM
	+rf9V5FPjor0xzC+hCvp2m2R6/WdRrszLI7O2JqE=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 1F448400FEF;
	Tue, 19 Jun 2018 11:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1529400689;
	bh=cDP7AKA+0AbszTm7zc2svxuoTOxVOao6HgwwSykwt4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U+eKRhe3RMXBbTalr1j3uoAjZmiB4OtB/2Qy7L/wGoLPYwZ9zBs0k0VqFVhR1qLM5
	+lBzn6IUXu3ZgK/gzQTpf7PIIOmwmIXmUfJSHd+QYyMuUhFBwk3OZetEhqluFV6dOM
	+rf9V5FPjor0xzC+hCvp2m2R6/WdRrszLI7O2JqE=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Tue, 19 Jun 2018 11:31:23 +0200
Message-Id: <20180619093124.24011-7-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619093124.24011-1-luc.michel@greensocs.com>
References: <20180619093124.24011-1-luc.michel@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v2 6/7] intc/arm_gic: Improve traces
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
X-TUID: v3OIYWgfhjoi

From: Luc MICHEL <luc.michel@greensocs.com>

Add some traces to the ARM GIC to catch register accesses (distributor,
(v)cpu interface and virtual interface), and to take into account
virtualization extensions (print `vcpu` instead of `cpu` when needed).

Also add some virtualization extensions specific traces: LR updating
and maintenance IRQ generation.

Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/intc/arm_gic.c    | 31 +++++++++++++++++++++++++------
 hw/intc/trace-events | 12 ++++++++++--
 2 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 834caa8504..a128fb3f4d 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -179,8 +179,10 @@ static inline void gic_update_internal(GICState *s, =
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
@@ -268,6 +270,7 @@ static void gic_update_maintenance(GICState *s)
         gic_compute_misr(s, cpu);
         maint_level =3D (s->h_hcr[cpu] & GICH_HCR_EN) && s->h_misr[cpu];
=20
+        trace_gic_update_maintenance_irq(cpu, maint_level);
         qemu_set_irq(s->maintenance_irq[cpu], maint_level);
     }
 }
@@ -539,7 +542,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, Me=
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
@@ -1017,20 +1021,23 @@ static MemTxResult gic_dist_read(void *opaque, hw=
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
@@ -1324,6 +1331,8 @@ static void gic_dist_writel(void *opaque, hwaddr of=
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
@@ -1480,12 +1489,18 @@ static MemTxResult gic_cpu_read(GICState *s, int =
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
@@ -1698,6 +1713,7 @@ static void gic_set_lr_entry(GICState *s, int cpu, =
int lr_num, uint32_t entry)
     }
=20
     s->h_lr[lr_num][cpu] =3D entry;
+    trace_gic_lr_entry(cpu, lr_num, entry);
     is_free =3D gic_lr_update(s, lr_num, cpu);
=20
     if (!is_free) {
@@ -1768,6 +1784,7 @@ static MemTxResult gic_hyp_read(void *opaque, hwadd=
r addr, uint64_t *data,
         return MEMTX_OK;
     }
=20
+    trace_gic_hyp_read(addr, *data);
     return MEMTX_OK;
 }
=20
@@ -1777,6 +1794,8 @@ static MemTxResult gic_hyp_write(void *opaque, hwad=
dr addr, uint64_t value,
     GICState *s =3D ARM_GIC(opaque);
     int cpu =3D gic_get_current_cpu(s);
=20
+    trace_gic_hyp_write(addr, value);
+
     switch (addr) {
     case 0x0: /* Hypervisor Control */
         s->h_hcr[cpu] =3D value & 0xf80000ff;
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 55e8c2570c..16d02fa8cf 100644
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
e write at 0x%08x: 0x%08" PRIx32
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


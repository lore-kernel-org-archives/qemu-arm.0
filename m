Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp650023wrq;
        Sat, 14 Jul 2018 10:17:42 -0700 (PDT)
X-Google-Smtp-Source: AAOMgperxkLTRGuhqzlyWeorXG2LWPXU+EOQuvRrmJefkEzoV/Q9vH3TCutwa5gEODDkYuNGp/Dm
X-Received: by 2002:a37:4249:: with SMTP id p70-v6mr9063255qka.297.1531588662566;
        Sat, 14 Jul 2018 10:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588662; cv=none;
        d=google.com; s=arc-20160816;
        b=tn+uIKuHTq8I7MsY4CcDeaLZOz9XLiXj8xhuF1j24Tn4F4Y7IP64xCwcFdYKizCsUd
         lhwEHPdfwaxRThk2TobqIN5GELC7Kqs8yab7hCPlgDorktUBg3x8ul2JORnxfT/wTaGZ
         Fs/7G06T6GsFtol0+AVbdznyNiey0aYvVFBIUE8Ev8Zib41uY1jCEhG1NZC85Ss/IvK9
         izUivk4yMK1KVIDpGX/RuL9jwZqmyhMrTa0pNxCARdow/Zc368bHK/dtxssppzw7Xy+g
         Wq37gqKai0q64/dq4W5eREHqrYrIEOY4kGUxZ6fgW7kANSrU7yo8ugi02LYsk8la9Fbf
         flig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=7FSfek8fXV5KqiZzqa8ayNvmJc8+XgAWQVFQOpS+s+c=;
        b=MdDipdjAJdcAMmpcxj7GZLk7M07ktnUmwKmZ5vFBh/VYY+DYOy3G2JtoK0Ouk+LpRP
         0jrmJGu0oQz61FGB9g2QFAkEJU+l1pJhQruuJMTMmdcaDYo6yIDGr+WoW/TXN+HSkqYe
         c4l0PaKZMnmDMDVCOXtu/Htxx7hC8ac8HVTZGU0vybJDzlzJzIne6QtfnLWuRtAsFm+g
         95Asy1Zp9nIPsP9M3rx6czNA+p1sX4g13tkxG1uS8wuBl6fFU50mIlyJRCo4AYHOaC09
         F+lWp1mFilUpyjIT9aCVThgqh4D6tIQ8f5nasr5Wrmi+f42MAxmjwK7EgjXhBIi/8/oD
         svJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bKcLHemB;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ddEuQh8m;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ddEuQh8m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u187-v6si3368902qkd.356.2018.07.14.10.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=bKcLHemB;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ddEuQh8m;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ddEuQh8m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOAw-0006YT-1s
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:17:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9o-0005kU-Lf
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004SJ-Vs
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:32 -0400
Received: from greensocs.com ([193.104.36.180]:57317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9j-0004Qd-G7; Sat, 14 Jul 2018 13:16:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 7B1E6C7AF0;
	Sat, 14 Jul 2018 19:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588586;
	bh=hjvPhdX2GCICeVw8K3GCAmxUM1WCOlflGQnWMSsw2MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bKcLHemB4Cnjuf3n8LcZ3W9ajZndshxtZOBaLHIF3H7qONqOpK/TuouCnB1epJcmG
	bcJ3OEtK3HfAtUKQ4G64lVnPAXYFiKuaL8GYNScukpOUX11EWMnfpZuNa05EapwvqH
	zo03s9mOAtccKUINCKTHPTaw+5TdGME4Qm7/Q1Uo=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ddEuQh8m;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=ddEuQh8m
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PcE-qdWwXLSY; Sat, 14 Jul 2018 19:16:25 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 914E0C7AF9; Sat, 14 Jul 2018 19:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588585;
	bh=hjvPhdX2GCICeVw8K3GCAmxUM1WCOlflGQnWMSsw2MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ddEuQh8mrW50kSlfi30m5SK+z1AMLnChbgg3aM46jdClMN1nQuBYsgjVJdhx7/Aeo
	Vx6Xfdw1yvRhVxJGZEehX1ruCkE6K4CTccACez5ypj8xfiIIdskKmEOVFhUMZn1qYx
	XJ1BHeDrMimfaiZL/8NeIztPfnNoLNW3b3kT2GdQ=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D688AC7ADD;
	Sat, 14 Jul 2018 19:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588585;
	bh=hjvPhdX2GCICeVw8K3GCAmxUM1WCOlflGQnWMSsw2MM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ddEuQh8mrW50kSlfi30m5SK+z1AMLnChbgg3aM46jdClMN1nQuBYsgjVJdhx7/Aeo
	Vx6Xfdw1yvRhVxJGZEehX1ruCkE6K4CTccACez5ypj8xfiIIdskKmEOVFhUMZn1qYx
	XJ1BHeDrMimfaiZL/8NeIztPfnNoLNW3b3kT2GdQ=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:52 +0200
Message-Id: <20180714171601.5734-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 11/20] intc/arm_gic: Implement virtualization
 extensions in gic_acknowledge_irq
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
X-TUID: Tli0AML/4Noc

Implement virtualization extensions in the gic_acknowledge_irq()
function. This function changes the state of the highest priority IRQ
from pending to active.

When the current CPU is a vCPU, modifying the state of an IRQ modifies
the corresponding LR entry. However if we clear the pending flag before
setting the active one, we lose track of the LR entry as it becomes
invalid. The next call to gic_get_lr_entry() will fail.

To overcome this issue, we call gic_activate_irq() before
gic_clear_pending(). This does not change the general behaviour of
gic_acknowledge_irq.

We also move the SGI case in gic_clear_pending_sgi() to enhance
code readability as the virtualization extensions support adds a if-else
level.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 52 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 60704cabbb..be9e2594d9 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -365,17 +365,44 @@ static void gic_drop_prio(GICState *s, int cpu, int group)
     s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
 }
 
+static inline uint32_t gic_clear_pending_sgi(GICState *s, int irq, int cpu)
+{
+    int src;
+    uint32_t ret;
+
+    if (!gic_is_vcpu(cpu)) {
+        /* Lookup the source CPU for the SGI and clear this in the
+         * sgi_pending map.  Return the src and clear the overall pending
+         * state on this CPU if the SGI is not pending from any CPUs.
+         */
+        assert(s->sgi_pending[irq][cpu] != 0);
+        src = ctz32(s->sgi_pending[irq][cpu]);
+        s->sgi_pending[irq][cpu] &= ~(1 << src);
+        if (s->sgi_pending[irq][cpu] == 0) {
+            gic_clear_pending(s, irq, cpu);
+        }
+        ret = irq | ((src & 0x7) << 10);
+    } else {
+        uint32_t *lr_entry = gic_get_lr_entry(s, irq, cpu);
+        src = GICH_LR_CPUID(*lr_entry);
+
+        gic_clear_pending(s, irq, cpu);
+        ret = irq | (src << 10);
+    }
+
+    return ret;
+}
+
 uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
 {
-    int ret, irq, src;
-    int cm = 1 << cpu;
+    int ret, irq;
 
     /* gic_get_current_pending_irq() will return 1022 or 1023 appropriately
      * for the case where this GIC supports grouping and the pending interrupt
      * is in the wrong group.
      */
     irq = gic_get_current_pending_irq(s, cpu, attrs);
-    trace_gic_acknowledge_irq(cpu, irq);
+    trace_gic_acknowledge_irq(gic_get_vcpu_real_id(cpu), irq);
 
     if (irq >= GIC_MAXIRQ) {
         DPRINTF("ACK, no pending interrupt or it is hidden: %d\n", irq);
@@ -387,6 +414,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         return 1023;
     }
 
+    gic_activate_irq(s, cpu, irq);
+
     if (s->revision == REV_11MPCORE) {
         /* Clear pending flags for both level and edge triggered interrupts.
          * Level triggered IRQs will be reasserted once they become inactive.
@@ -395,28 +424,13 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         ret = irq;
     } else {
         if (irq < GIC_NR_SGIS) {
-            /* Lookup the source CPU for the SGI and clear this in the
-             * sgi_pending map.  Return the src and clear the overall pending
-             * state on this CPU if the SGI is not pending from any CPUs.
-             */
-            assert(s->sgi_pending[irq][cpu] != 0);
-            src = ctz32(s->sgi_pending[irq][cpu]);
-            s->sgi_pending[irq][cpu] &= ~(1 << src);
-            if (s->sgi_pending[irq][cpu] == 0) {
-                gic_clear_pending(s, irq, cpu);
-            }
-            ret = irq | ((src & 0x7) << 10);
+            ret = gic_clear_pending_sgi(s, irq, cpu);
         } else {
-            /* Clear pending state for both level and edge triggered
-             * interrupts. (level triggered interrupts with an active line
-             * remain pending, see gic_test_pending)
-             */
             gic_clear_pending(s, irq, cpu);
             ret = irq;
         }
     }
 
-    gic_activate_irq(s, cpu, irq);
     gic_update(s);
     DPRINTF("ACK %d\n", irq);
     return ret;
-- 
2.18.0


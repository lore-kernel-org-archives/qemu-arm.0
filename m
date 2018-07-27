Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507567wru;
        Fri, 27 Jul 2018 02:56:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdB4wYZM4bnMhiHq8gGMxx3HMJrbjjZTFNGQD5bi5o5b9bdTALmOZxdRM7gIggmPsiyOxhn
X-Received: by 2002:a0c:e011:: with SMTP id j17-v6mr5037546qvk.0.1532685365591;
        Fri, 27 Jul 2018 02:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685365; cv=none;
        d=google.com; s=arc-20160816;
        b=hkx0d/XrqUU6adHP4gGNlNGRl6lVP9+yKzxf6rW9awZzZDltnWku+sgSuwYMDv3O9u
         CGN6ncgJ1t0XKfJuoOOONTlUkVYa9WENJDvV2479xeSlsGurIx0JUQMY0cpyMbU4ZBT0
         kJ2/dJcsMEZs0ANQRHArZGmwiT8XFdrIsjVY6f0W7eugTn9VCoEAfXPTtkLzoluqDV5B
         y0IoiQnI1mbj/d7uB9Slxgbpl1OgzMbFTnPkuWVPRmsmjS/ahORb1mRVpiITJHjIsOwF
         E1y9x1xetBJ+zoca3tMEQYJfvpjHcPNxatN9tWWIiiynJcNH3AW0Lffw4iMTYgkbUagE
         5/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=Bwz9cZsuf3h0F1WoHZXp2JpyKYO3fibTK1aMSJgUXzU=;
        b=XgBCqh1Fvb6ULbuIy+eUrj2Pay76z3tKx0jXmm/UhwvtwwRqubcPc/JawoP6frGAwv
         F65OdylO7jJLVmcccD87pO6tFf+JYd2F3WNYB9ttva4WPOd40lronuIHdujsMj4L7Wgs
         2DkYqdKFZbLqCvmMDkBNOYHMb0cVNLeMlx3jIwBZGXimUtzk6jnZWrC80/MWX54HGV9i
         Bq+sK/dKYw5yg8FnXckZt44o/q9xzWChEQuzkR52Cw0pmjepuom7R0WYqEN3pD6Yxo+8
         waTRN8L84NINnmFKa7k/8Ne/hn5mko0S93Gs6Do9XCOHHS+q9abpHRN7WJ5Ld6q1SlfG
         AG/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=weUOvuL5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wSat81Rr;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wSat81Rr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p26-v6si927791qki.262.2018.07.27.02.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=weUOvuL5;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wSat81Rr;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=wSat81Rr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40034 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTh-0004rC-3q
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:56:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSe-0003ZU-9t
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006B7-Es
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:00 -0400
Received: from greensocs.com ([193.104.36.180]:47522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00068w-Tj; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A7ABA44A0ED;
	Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685289;
	bh=xAHr68KhTy99xqhWJCA5rOyjUrOn4IWYSYzyr9p/TEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=weUOvuL5BHOLE6pGyYGoLGiuc5KbN8aFDGSUYufU0cMtMLNA/84fl/+haE1xHSVFR
	78u0p00g91DzYrrZ3Y0SO/kL/OnffhEHKaJGZ7zYQ0cyj3qLMDwJ9y0S1zVvAY+Cm9
	LsLq8DevVuRV1gOZ7sF9fq84ORCy2/WypbGy9CM8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wSat81Rr;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=wSat81Rr
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x9UaHX8zwHrr; Fri, 27 Jul 2018 11:54:48 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 5CCE7443555; Fri, 27 Jul 2018 11:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685287;
	bh=xAHr68KhTy99xqhWJCA5rOyjUrOn4IWYSYzyr9p/TEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wSat81RrlO42dGXoRSqss54l1nHdkobMs8qcVIvCJugyw9s61ywCZZxJ+1aVMLAbM
	Z+bYxT6St/Bth0BZ/CY4W6xyQ5v1F3upeOFRN9BASTg6x3l4PHtMvUGeMhRLuwy+Ev
	PcXXCCNO++lobZ9X5T6dqwP6MSXQRr06x9cG+JJA=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id EA333400DC8;
	Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685287;
	bh=xAHr68KhTy99xqhWJCA5rOyjUrOn4IWYSYzyr9p/TEY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wSat81RrlO42dGXoRSqss54l1nHdkobMs8qcVIvCJugyw9s61ywCZZxJ+1aVMLAbM
	Z+bYxT6St/Bth0BZ/CY4W6xyQ5v1F3upeOFRN9BASTg6x3l4PHtMvUGeMhRLuwy+Ev
	PcXXCCNO++lobZ9X5T6dqwP6MSXQRr06x9cG+JJA=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:12 +0200
Message-Id: <20180727095421.386-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 11/20] intc/arm_gic: Implement virtualization
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
X-TUID: IM8OFMOcDXxg

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
index de73dc9f54..d80acde989 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -363,21 +363,48 @@ static void gic_drop_prio(GICState *s, int cpu, int group)
     }
 
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
         return irq;
     }
@@ -385,40 +412,27 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
     if (gic_get_priority(s, irq, cpu) >= s->running_priority[cpu]) {
         DPRINTF("ACK, pending interrupt (%d) has insufficient priority\n", irq);
         return 1023;
     }
 
+    gic_activate_irq(s, cpu, irq);
+
     if (s->revision == REV_11MPCORE) {
         /* Clear pending flags for both level and edge triggered interrupts.
          * Level triggered IRQs will be reasserted once they become inactive.
          */
         gic_clear_pending(s, irq, cpu);
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
 }
 
-- 
2.18.0


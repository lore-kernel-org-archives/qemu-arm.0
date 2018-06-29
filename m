Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730830wrq;
        Fri, 29 Jun 2018 06:31:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdM21qLu3p8IN1IDUqcxB8jyWrhagPFqtvTT9TJOsfc8VcAtD2yUkb8XCm4eC/k0UaCKd0g
X-Received: by 2002:ac8:16ee:: with SMTP id y43-v6mr13821329qtk.148.1530279116574;
        Fri, 29 Jun 2018 06:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279116; cv=none;
        d=google.com; s=arc-20160816;
        b=rpOfOgqIDZ/u5AwR6EmlPKYS//qLx3CWhrL1ll0bQVXzVJNuctUDnQzdFr4J2V87qh
         bsHRl8NgF+ZP86FhdImJnzXX0onTNrkx4NUzLA8X8k58ySGoo3ahYRjeAj66tICpoSRo
         dyBCQbDWPehdwBWto/yb1bZdMgjbKWil/YrBXFqI1Twi/Ky8tMCdbBOU1SGuZ31WISC6
         uZfvtRJGVvTPTQ9OzjICUfO3gS2Q0KRVwDlvPA0HLuO3c5aqWaN6y98CdOSz7vYbllTA
         t8ThpQoKymnt3tvaYeHNsDF5DaNfsVHdwNOhWQvPuQ/oo1ZP/aZo9bbjolGBsLZ7yoaf
         Ny0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=Vcd2/6NSjkzJdCfqtezP2dwh86gnUB1eGVt941ejrVs=;
        b=UflP3UCPZuK2koioqmTGPTXtqKTe/V38DrcVFFVTZ4YD6RYrtOnLUCzD4k88INigcK
         KsdWLz017ZXmMbz14f8Rlz4mvbFgjrkGvjwjuhWeIP7gUmr+3k8nZ26aAQntmAdVZSHZ
         +OYV3QftB+wZfM3dFPAGu0QUPdf23ue1TrsWFr8yCulmsV7ut9B8js9OLBziepIf85h0
         NrRVF28zjGONhRSLEHQINX+bN3ovZHMzLz1GsSGIo4owfXXAZpdma7lPrrBJIW3ZfaH/
         GYGbpqdN+Uhw/wdKRoBFObjlj5xlfCOPg4ggLyGdRihxfLxJRGUmSe9KU4kbDQzDyM4B
         O/pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=koWroJbm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=llcfmHSa;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=llcfmHSa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l10-v6si1204098qvk.121.2018.06.29.06.31.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=koWroJbm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=llcfmHSa;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=llcfmHSa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtVE-0008KD-1O
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU9-0007aD-Hr
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006qp-3k
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:49 -0400
Received: from greensocs.com ([193.104.36.180]:58618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006mf-Aw; Fri, 29 Jun 2018 09:30:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A7A8B4434B6;
	Fri, 29 Jun 2018 15:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279038;
	bh=QszQPZXYcFkSBsQQnLZxtmc59qcfJEbtosKMiFwaW9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=koWroJbm3H2MhVCGPRohwFDUdV09eB/V4+YQUF/azbk87yEEMXL5Z0lm8ZLUeWETD
	uT6t/ilESrfWQnUuhqQn+sdT5lx17iRFSeXGBZjEaOjOxBkjP6rPd/V2JRdNlPi66O
	4m4IY4tob3qzFld78qEiwOksBhl20YHVimiuJ9hQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=llcfmHSa;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=llcfmHSa
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGHT2P4Ts9TY; Fri, 29 Jun 2018 15:30:37 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 9F5354434B1; Fri, 29 Jun 2018 15:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279037;
	bh=QszQPZXYcFkSBsQQnLZxtmc59qcfJEbtosKMiFwaW9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=llcfmHSayx1GclAFdkF/XUQBPsVWGfMs8rmH9480QJwCQ6wgRKcSUH6ehg2bUVOmF
	sn9K7c/2TbEerKNgecNckBmZ2W6DlK716Rf9ACfnZDIN9urvewiRspVH7MgCNTz7RN
	c1+ZlYK8w0X0IGMl/55ve9Gyl77LB9Aqgggrhm5U=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 314144434B5;
	Fri, 29 Jun 2018 15:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279037;
	bh=QszQPZXYcFkSBsQQnLZxtmc59qcfJEbtosKMiFwaW9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=llcfmHSayx1GclAFdkF/XUQBPsVWGfMs8rmH9480QJwCQ6wgRKcSUH6ehg2bUVOmF
	sn9K7c/2TbEerKNgecNckBmZ2W6DlK716Rf9ACfnZDIN9urvewiRspVH7MgCNTz7RN
	c1+ZlYK8w0X0IGMl/55ve9Gyl77LB9Aqgggrhm5U=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:45 +0200
Message-Id: <20180629132954.24269-12-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 11/20] intc/arm_gic: Implement virtualization
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
X-TUID: CG4ri6re/WzO

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
---
 hw/intc/arm_gic.c | 52 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d61c2dd557..a7577ac073 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -366,17 +366,44 @@ static void gic_drop_prio(GICState *s, int cpu, int group)
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
@@ -388,6 +415,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         return 1023;
     }
 
+    gic_activate_irq(s, cpu, irq);
+
     if (s->revision == REV_11MPCORE) {
         /* Clear pending flags for both level and edge triggered interrupts.
          * Level triggered IRQs will be reasserted once they become inactive.
@@ -396,28 +425,13 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
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
2.17.1


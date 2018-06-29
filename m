Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730310wrq;
        Fri, 29 Jun 2018 06:31:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcgbHgQ28c8d195ZwtQmERp8FDi11TthILIxQKIAEwaW/UOpoPDJvlPgJgriTd1dd8OdBDD
X-Received: by 2002:a37:188c:: with SMTP id 12-v6mr12989010qky.72.1530279090945;
        Fri, 29 Jun 2018 06:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279090; cv=none;
        d=google.com; s=arc-20160816;
        b=VEwDnLbsBXG21Jis4VBmo7RXk0dgXGKTLVSLhfhV/VPcLidw2QcuASjuI57dkAao+1
         lwlNOpWhrHuBTQffLOKdW4NHX93J6Zu1t/VYsEEe/u9LygJjMepYfT/MwMG7n/MhYfYl
         8rmmucTXaf9gahlFmVfSyjlZh4RLOW0QKWIcTxVKCW0DGaslso74Kt67eVW5aSB8CtWd
         dp/H4xgeGFXAR0t0XLk7SZ4wuEDBZ4yg3vpAM7zRmntJ+sIDFBYxh20VViq5UGTIt4eL
         TuRSDwP4xrKdeNPQgGFak4NSXVqGttJwbM+udApMLVfyLZ1BnsaP69bVEguQyTXxLT+A
         DHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=Z1eEuATbonmtcA7KNUCptSukR3N650rxKO0E3G9fGfw=;
        b=JmCdp45vsplzv2LEp8KqO2Za2fj21cHGXyJz+HSC2+900VXlrWqsZlLbCQUVEKnHnF
         V/M/z9PSPpJowMCLZ9UScQQ5TyZDvjP3afgdhqXJhPXI0vFCAg9AH+7caq432j/qv1Ea
         3/PMBOuQN1lRx8mYRU+iUz7hXYsfMA1XD0yNizsBqDxeUjCwGDMRFOa/jOBEdIamu0nE
         bHdERN5JVffdtFMhwm07BKpztx4jS3kq0NQi8apzS94cnaaFbJeRSpdhgtjQ8OUV5D5Q
         eJ27VD3DTL59lhpoYG8ldw1MX3wdhtpcFDOylij5gVy9OLCw0fmBNsTmRiB97W09xfJH
         zJ4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="ncxUPI8/";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=dQDCi1cK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vO1QPaZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c2-v6si9346189qvb.53.2018.06.29.06.31.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="ncxUPI8/";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=dQDCi1cK;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=vO1QPaZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42142 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtUo-0007zY-9i
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU8-0007a8-Ql
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006qY-3M
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:48 -0400
Received: from greensocs.com ([193.104.36.180]:58615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006mW-BL; Fri, 29 Jun 2018 09:30:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2FA854434B4;
	Fri, 29 Jun 2018 15:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279038;
	bh=MIz3Xya7Bfs70SeBav01e9oe2TZ/yq+G0OAvywSvOto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ncxUPI8/UwmEDDiC9vU9sxQXHXE8/0xk3DJO6X69HM4S4Jwy8cymo4IRabCUYZ57a
	GYkK54nBrZMxDCf1Z0bkQKJfnwbwovSUwL89E6MtBT+ZV1q3ZcZQ/zCFLPY5+YckVY
	6VqZeca2tXHkd06Cc67aOpvRt0MNWT70GvLxHIdw=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=dQDCi1cK;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=vO1QPaZR
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2SfvjpbkcP5g; Fri, 29 Jun 2018 15:30:37 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 3C16E4434B6; Fri, 29 Jun 2018 15:30:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279037;
	bh=MIz3Xya7Bfs70SeBav01e9oe2TZ/yq+G0OAvywSvOto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dQDCi1cKCo4pZ10+VbS9/xberr0FCBO4HtmgNAyGJNI8P7EKU8zJoDVY8c8a6lIeG
	Am7UK6SvbBfipbNkpwfupz8/IjEaye//WOMsnDx4OqKKaQy3S0yY0UBfV4/gLIzYbM
	wyCIINALKij6Jshse197hhF9t56HanjzAHS0rlWE=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 768594434AB;
	Fri, 29 Jun 2018 15:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279036;
	bh=MIz3Xya7Bfs70SeBav01e9oe2TZ/yq+G0OAvywSvOto=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vO1QPaZRpwoihA7xC09UPu5FvEhEBk9LzD4kwxH7TthFaFG7Osn4okoPiZ9Ik7nTw
	qi/btPUYz/nWwDgclzyT5J5szVu0IiJszrL3wXLg189ZWJ/H2vbhjy2pei0eKaO74D
	4gwbUc63bR8pbc5sBPFqewLWFbFMqSx/RWbptaxo=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:44 +0200
Message-Id: <20180629132954.24269-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 10/20] intc/arm_gic: Implement virtualization
 extensions in gic_(activate_irq|drop_prio)
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
X-TUID: L7q6R6F7QLWU

Implement virtualization extensions in gic_activate_irq() and
gic_drop_prio() and in gic_get_prio_from_apr_bits() called by
gic_drop_prio().

When the current CPU is a vCPU:
  - Use GIC_VIRT_MIN_BPR and GIC_VIRT_NR_APRS instead of their non-virt
  counterparts,
  - the vCPU APR is stored in the virtual interface, in h_apr.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 45 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 9 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d55a88bb33..d61c2dd557 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -276,16 +276,23 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
      * and update the running priority.
      */
     int prio = gic_get_group_priority(s, cpu, irq);
-    int preemption_level = prio >> (GIC_MIN_BPR + 1);
+    int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
+    int preemption_level = prio >> (min_bpr + 1);
     int regno = preemption_level / 32;
     int bitno = preemption_level % 32;
+    uint32_t *papr = NULL;
 
-    if (gic_has_groups(s) && gic_test_group(s, irq, cpu)) {
-        s->nsapr[regno][cpu] |= (1 << bitno);
+    if (gic_is_vcpu(cpu)) {
+        assert(regno == 0);
+        papr = &s->h_apr[gic_get_vcpu_real_id(cpu)];
+    } else if (gic_has_groups(s) && gic_test_group(s, irq, cpu)) {
+        papr = &s->nsapr[regno][cpu];
     } else {
-        s->apr[regno][cpu] |= (1 << bitno);
+        papr = &s->apr[regno][cpu];
     }
 
+    *papr |= (1 << bitno);
+
     s->running_priority[cpu] = prio;
     gic_set_active(s, irq, cpu);
 }
@@ -296,12 +303,22 @@ static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
      * on the set bits in the Active Priority Registers.
      */
     int i;
-    for (i = 0; i < GIC_NR_APRS; i++) {
-        uint32_t apr = s->apr[i][cpu] | s->nsapr[i][cpu];
+    int min_bpr = gic_is_vcpu(cpu) ? GIC_VIRT_MIN_BPR : GIC_MIN_BPR;
+    int nr_aprs = gic_is_vcpu(cpu) ? GIC_VIRT_NR_APRS : GIC_NR_APRS;
+
+    for (i = 0; i < nr_aprs; i++) {
+        uint32_t apr;
+
+        if (gic_is_vcpu(cpu)) {
+            apr = s->h_apr[gic_get_vcpu_real_id(cpu)];
+        } else {
+            apr = s->apr[i][cpu] | s->nsapr[i][cpu];
+        }
+
         if (!apr) {
             continue;
         }
-        return (i * 32 + ctz32(apr)) << (GIC_MIN_BPR + 1);
+        return (i * 32 + ctz32(apr)) << (min_bpr + 1);
     }
     return 0x100;
 }
@@ -325,9 +342,19 @@ static void gic_drop_prio(GICState *s, int cpu, int group)
      * might not do so, and interrupts that should not preempt might do so.
      */
     int i;
+    int nr_aprs = gic_is_vcpu(cpu) ? GIC_VIRT_NR_APRS : GIC_NR_APRS;
+
+    for (i = 0; i < nr_aprs; i++) {
+        uint32_t *papr = NULL;
+
+        if (gic_is_vcpu(cpu)) {
+            papr = &s->h_apr[gic_get_vcpu_real_id(cpu)];
+        } else if (group) {
+            papr = &s->nsapr[i][cpu];
+        } else {
+            papr = &s->apr[i][cpu];
+        }
 
-    for (i = 0; i < GIC_NR_APRS; i++) {
-        uint32_t *papr = group ? &s->nsapr[i][cpu] : &s->apr[i][cpu];
         if (!*papr) {
             continue;
         }
-- 
2.17.1


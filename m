Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507410wru;
        Fri, 27 Jul 2018 02:55:49 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeVrx3DLytn12wTt63RK0eiR9FY1eyx6ksf+jMtY9DvTfcj9NHbQ6mf4+sVsM4ewkUN5DKm
X-Received: by 2002:a37:84c4:: with SMTP id g187-v6mr4950725qkd.49.1532685349902;
        Fri, 27 Jul 2018 02:55:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685349; cv=none;
        d=google.com; s=arc-20160816;
        b=BBOoPXmZ+yNQtyEfYp50lvsRigQ3bqjc9nNIeFY582eRpg5r+yE8FczImw9B5G/Vs5
         7IK+G8xJMhVgL2jN0VixMVTjzXd84ouJkolRaaV+noB/7ZOVxMt5Z4EdOEtu5kwSyGFT
         OW6O+n+V9IJjzguopWZ2pBQBXv5g7zmFt/F+OC41ZjkIKsuWPHTYVonl/6LEru0jMj21
         0ZO2Nhao+TRP4AWn504JExGuJc1GdoEZkkQFQaIg3hGW77BB72Z8WcOXx/mJtpu+eST7
         22qSzbhTnjnCmXjK2T5HFS6OM/A2coBBhzHmz0VqMOBiHjTL6fJ3nBlEgtHNGp6EwFry
         xRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=TX1BEutUVAC3X2341G0KWW8BFcJ/6aUhmoEoF+k8xN4=;
        b=ykXYQIa3bu4JuFseiMfsC97GbIwhdG45M+GZiZsJ5S0ww19jPhFYkfgwxbRrAtFU+j
         Ax+LZbPpDBsiOkQjvsgpYsifhNca2uwXJsy2wJ5wWrDygD1dly6kr3r2jo2xwQyhI+mK
         p+jkBAi0zE99B7XW5xQOaElr22RBH7w4eSWnADSezyBReL8c9B03qUjqvVvNl2XMuzhA
         tGBLCw35g5Zcizus0jZNpeIAMd5hZll/Xq3/KHx0MZdrdkVAifYcC9XGK/b5qc03aA2L
         oSzHQUn/QcmWTTIRYQJxwc4m+gdnynFAMHNek/xaxvOoNCoqKnB7XM/yegoTJ1BtDa4+
         2LBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=WqefBYgv;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pz9QpLKE;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pz9QpLKE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l6-v6si3215534qvi.12.2018.07.27.02.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=WqefBYgv;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pz9QpLKE;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pz9QpLKE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTR-0004b2-Cu
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003W8-F5
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006Ab-C1
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47520)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00068t-Ta; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C997344A0E2;
	Fri, 27 Jul 2018 11:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685288;
	bh=RHBfXmsfK8Wt+vPCtdwaxY95CxsEuU7z0TJvQS8Edxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WqefBYgv3QhYFuo8S5j2WzZsmaaMByZAttUx6+y3nthxsO/nRfy8DAvUFH5eC0Owp
	RmJrmitoZRttrjE993wUL6zKtwX13Dm/h/or/qppAD3ZrUJvobM7dJRN6Ne5UpakF0
	DFv3qGmYCN2BAkK/lTNxkvusYCbU6Kqda3JAkVbg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pz9QpLKE;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pz9QpLKE
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ir5G3Vo3QMoY; Fri, 27 Jul 2018 11:54:48 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E9024443572; Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685286;
	bh=RHBfXmsfK8Wt+vPCtdwaxY95CxsEuU7z0TJvQS8Edxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pz9QpLKEIlikSGLkmSqEWMngQEw1WjIiJeV2F0X6RgG9BtAUgw/rFopkZ/Rei0+UD
	4aUnmvjLQQ/YSOwqPpqqzg79ZQYQRawKXLKnqZCnbJsH7T/eA1fCN3krG7hCqN0EIt
	XVabr/YoVS6EE9xCwubM1AkscJYMKvKNad3OBB0w=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 9488D400DC8;
	Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685286;
	bh=RHBfXmsfK8Wt+vPCtdwaxY95CxsEuU7z0TJvQS8Edxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pz9QpLKEIlikSGLkmSqEWMngQEw1WjIiJeV2F0X6RgG9BtAUgw/rFopkZ/Rei0+UD
	4aUnmvjLQQ/YSOwqPpqqzg79ZQYQRawKXLKnqZCnbJsH7T/eA1fCN3krG7hCqN0EIt
	XVabr/YoVS6EE9xCwubM1AkscJYMKvKNad3OBB0w=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:11 +0200
Message-Id: <20180727095421.386-11-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 10/20] intc/arm_gic: Implement virtualization
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
X-TUID: pn7fvKLZyAJS

Implement virtualization extensions in gic_activate_irq() and
gic_drop_prio() and in gic_get_prio_from_apr_bits() called by
gic_drop_prio().

When the current CPU is a vCPU:
  - Use GIC_VIRT_MIN_BPR and GIC_VIRT_NR_APRS instead of their non-virt
  counterparts,
  - the vCPU APR is stored in the virtual interface, in h_apr.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 50 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 26ed7ea58a..de73dc9f54 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -274,30 +274,47 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
 {
     /* Set the appropriate Active Priority Register bit for this IRQ,
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
 
 static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
 {
     /* Recalculate the current running priority for this CPU based
      * on the set bits in the Active Priority Registers.
      */
     int i;
+
+    if (gic_is_vcpu(cpu)) {
+        uint32_t apr = s->h_apr[gic_get_vcpu_real_id(cpu)];
+        if (apr) {
+            return ctz32(apr) << (GIC_VIRT_MIN_BPR + 1);
+        } else {
+            return 0x100;
+        }
+    }
+
     for (i = 0; i < GIC_NR_APRS; i++) {
         uint32_t apr = s->apr[i][cpu] | s->nsapr[i][cpu];
         if (!apr) {
             continue;
         }
@@ -322,20 +339,29 @@ static void gic_drop_prio(GICState *s, int cpu, int group)
      * behaviour of the GIC is UNPREDICTABLE, which for us means that
      * the values of the APR registers might become incorrect and the
      * running priority will be wrong, so interrupts that should preempt
      * might not do so, and interrupts that should not preempt might do so.
      */
-    int i;
+    if (gic_is_vcpu(cpu)) {
+        int rcpu = gic_get_vcpu_real_id(cpu);
 
-    for (i = 0; i < GIC_NR_APRS; i++) {
-        uint32_t *papr = group ? &s->nsapr[i][cpu] : &s->apr[i][cpu];
-        if (!*papr) {
-            continue;
+        if (s->h_apr[rcpu]) {
+            /* Clear lowest set bit */
+            s->h_apr[rcpu] &= s->h_apr[rcpu] - 1;
+        }
+    } else {
+        int i;
+
+        for (i = 0; i < GIC_NR_APRS; i++) {
+            uint32_t *papr = group ? &s->nsapr[i][cpu] : &s->apr[i][cpu];
+            if (!*papr) {
+                continue;
+            }
+            /* Clear lowest set bit */
+            *papr &= *papr - 1;
+            break;
         }
-        /* Clear lowest set bit */
-        *papr &= *papr - 1;
-        break;
     }
 
     s->running_priority[cpu] = gic_get_prio_from_apr_bits(s, cpu);
 }
 
-- 
2.18.0


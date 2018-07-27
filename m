Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507004wru;
        Fri, 27 Jul 2018 02:55:18 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcws78typeyOd0IQ2bVtsLA8ZTzcxSdElzzsyApS8NGbXuBME+dygTTvjksAJTCapJNnQP5
X-Received: by 2002:ae9:f449:: with SMTP id z9-v6mr5337277qkl.410.1532685318399;
        Fri, 27 Jul 2018 02:55:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685318; cv=none;
        d=google.com; s=arc-20160816;
        b=RiEcHcrmwAFDCDamlw2StM4rXljyg/PfAZ/UiW9O3NK13KC2vYKqcNNOqy3RdCmB3m
         NjYB/WbiHqDzBg70mR4u1ffiKoYMZHAAaVGYt+CYbWFt3EQhl/uqHxJrWIVVkiyhDEof
         S2SEJ5dG9qy/LIXI2h7JIGGVS+QGrb+7LDsxGfE5qbNqfb+Fd+aycuC9XjyHDPNwlu+X
         6fvUFFNTJiUP2B4qngrTOuOUxTwr5F7KFV6kuqGIuAnwoQ9lDBo+FK3h8tD3BCy/40x3
         ugaWDOhJ+19W9JLUobyJnNqZfSs6qeHmtO2AyWqnZBgcQ/Dbf+jXyHHXMHEWIRnuljCX
         7VIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=nqE++G6suSSnHMnJ3HG2o4/nbwQHlbQmcscJ1ohqL+8=;
        b=pz/NaKw/Hqmdw6GLT13GBQHD3YsH/NoMGMb/R4iWn0QqENmdkhTLpz43Q/ijhj6uO4
         qldVSSSPhBBKX0WtWE7xd4bVryltMK1u7uQKTf51GQ0QRQE+5cWsbtHeBE80I7JT1x9L
         ucyFRM3+mKNw4bvbiQA/UcoD/S3K7d4ljWcl0qml7RogbRPqoqDUas+mjymEkP+jXBwZ
         X351+If7tLQ1kJxIbV2DQdPbEiT89hdkHBBBIR7O+/0VNCjS7Aj65oRgoN51xb7vW6RR
         JULsPhAyIWYPBM7J/0rZAHJCYWOkouSwU0x3y6gCpPjoUj+WHdFKbWXO3Ptic7qSayTM
         lJnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kVSm6YHf;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=W1RmNtxl;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=W1RmNtxl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s26-v6si1550463qtk.191.2018.07.27.02.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kVSm6YHf;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=W1RmNtxl;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=W1RmNtxl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizSv-0003eW-QY
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58088)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003W4-Dz
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSY-000681-GD
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47469)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00064C-1O; Fri, 27 Jul 2018 05:54:54 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id C5DB7443552;
	Fri, 27 Jul 2018 11:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685284;
	bh=tGF+F1QMsC3Sl8uhC6AMT3vZXThYqbUvIbTOAzBL6/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kVSm6YHfZsV5sRS8kSS68GmSzv128xSVx9fU73q7MSvMri5QPrh5CWkKOvHN/ObqK
	suzfXaCHkJY1mB04NrwaSnQsnDSzdinQ1yzdIW33wLz3mX3Cgas+S4oOBDe7o/pzCt
	JSNraIpajnctmGP2vHou++stNOGx/kTB6LoS4PQQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=W1RmNtxl;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=W1RmNtxl
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYPaaQD32dMP; Fri, 27 Jul 2018 11:54:44 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id CB0164434B9; Fri, 27 Jul 2018 11:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685283;
	bh=tGF+F1QMsC3Sl8uhC6AMT3vZXThYqbUvIbTOAzBL6/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W1RmNtxlgCn+VF+HBI39hygKhCGayqxVugpKWUaELC7U9zi92Bibl6jGaz26HRiC5
	x/WAuRYDB21k9rkudgtUo39McufYDZMhpxCKpsfSkDmLM9zQ453X0yzjtk6l6342Hc
	yVORKA5jyQUz5Dn4WOkj8t1Loz/jsdGn5dEpO4GU=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 792C9400DC8;
	Fri, 27 Jul 2018 11:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685283;
	bh=tGF+F1QMsC3Sl8uhC6AMT3vZXThYqbUvIbTOAzBL6/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W1RmNtxlgCn+VF+HBI39hygKhCGayqxVugpKWUaELC7U9zi92Bibl6jGaz26HRiC5
	x/WAuRYDB21k9rkudgtUo39McufYDZMhpxCKpsfSkDmLM9zQ453X0yzjtk6l6342Hc
	yVORKA5jyQUz5Dn4WOkj8t1Loz/jsdGn5dEpO4GU=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:03 +0200
Message-Id: <20180727095421.386-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 02/20] intc/arm_gic: Implement GICD_ISACTIVERn
 and GICD_ICACTIVERn registers
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
X-TUID: uPVgUzmRc6c0

Implement GICD_ISACTIVERn and GICD_ICACTIVERn registers in the GICv2.
Those registers allow to set or clear the active state of an IRQ in the
distributor.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 61 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 9286236d86..53b749d216 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -723,12 +723,20 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             if (gic_test_pending(s, irq + i, mask)) {
                 res |= (1 << i);
             }
         }
     } else if (offset < 0x400) {
-        /* Interrupt Active.  */
-        irq = (offset - 0x300) * 8 + GIC_BASE_IRQ;
+        /* Interrupt Set/Clear Active.  */
+        if (offset < 0x380) {
+            irq = (offset - 0x300) * 8;
+        } else if (s->revision == 2) {
+            irq = (offset - 0x380) * 8;
+        } else {
+            goto bad_reg;
+        }
+
+        irq += GIC_BASE_IRQ;
         if (irq >= s->num_irq)
             goto bad_reg;
         res = 0;
         mask = (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
         for (i = 0; i < 8; i++) {
@@ -1005,13 +1013,58 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
                corect behavior.  */
             if (value & (1 << i)) {
                 GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
             }
         }
+    } else if (offset < 0x380) {
+        /* Interrupt Set Active.  */
+        if (s->revision != 2) {
+            goto bad_reg;
+        }
+
+        irq = (offset - 0x300) * 8 + GIC_BASE_IRQ;
+        if (irq >= s->num_irq) {
+            goto bad_reg;
+        }
+
+        /* This register is banked per-cpu for PPIs */
+        int cm = irq < GIC_INTERNAL ? (1 << cpu) : ALL_CPU_MASK;
+
+        for (i = 0; i < 8; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
+            if (value & (1 << i)) {
+                GIC_DIST_SET_ACTIVE(irq + i, cm);
+            }
+        }
     } else if (offset < 0x400) {
-        /* Interrupt Active.  */
-        goto bad_reg;
+        /* Interrupt Clear Active.  */
+        if (s->revision != 2) {
+            goto bad_reg;
+        }
+
+        irq = (offset - 0x380) * 8 + GIC_BASE_IRQ;
+        if (irq >= s->num_irq) {
+            goto bad_reg;
+        }
+
+        /* This register is banked per-cpu for PPIs */
+        int cm = irq < GIC_INTERNAL ? (1 << cpu) : ALL_CPU_MASK;
+
+        for (i = 0; i < 8; i++) {
+            if (s->security_extn && !attrs.secure &&
+                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
+                continue; /* Ignore Non-secure access of Group0 IRQ */
+            }
+
+            if (value & (1 << i)) {
+                GIC_DIST_CLEAR_ACTIVE(irq + i, cm);
+            }
+        }
     } else if (offset < 0x800) {
         /* Interrupt Priority.  */
         irq = (offset - 0x400) + GIC_BASE_IRQ;
         if (irq >= s->num_irq)
             goto bad_reg;
-- 
2.18.0


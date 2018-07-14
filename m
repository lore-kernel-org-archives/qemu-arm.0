Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649640wrq;
        Sat, 14 Jul 2018 10:17:05 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfb1m6NuEQEF51fqeYkboVNJZuOMt5R6o1AIT5StctIdOREq1s4AEo3QZ/GJHlAWT78dwRv
X-Received: by 2002:aed:3f5d:: with SMTP id q29-v6mr9458123qtf.403.1531588625896;
        Sat, 14 Jul 2018 10:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588625; cv=none;
        d=google.com; s=arc-20160816;
        b=VeewNiQa7InL12zmkM/Y6tZco0VWG4l380BdIKZ6QPHGrNrbSU4B918DefPA2Bk4Xo
         S1VmQl2mHF0Fu4ohKGO9ly+VUPtkE30zhk29OiCRRri9hM3Dm6DkXy2qpxgv82k+KkWP
         dTS431WRzTNtUqKNtZ791vKY+Zo/R9U3pP/E3fNEAlX2JnluG0PzqsYz/hiSd4SDQs/r
         UcWWvNTYmprGxrI3Pu2lTD0Y5YeQrPQAp25Xl9nu8Mni+23L0+ANTnaVuBCpAfrJUWzK
         r9IZUC16hZ0athLNQmp20xjJAMViedflFtnD6sE9VfpDpb/D2Li78lZiMQlpPwgPOxlj
         p4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=mXPICZt5s7WNkDoE2/ZUfNlqY/WVZjGOYDKjaNTaNxg=;
        b=FNosel5sdETEK658THUTRkDlItBu9zZIzAAZHbSZRS2ENcNBgltn491FqpJkdox3jK
         77NvhDMFk3fTlBv9U1hU7c+g5T3Ouh0/s5ZvDtVXJ+gMSwVgPWVurASOjVyQodGdhpft
         08/5tsRgHK8BNiWioYvHULrd8zFykpbbpKzfuAsTcMnlBbq2nHbXcNRdkjoHtAukUu6p
         qwIFRrHS6f8nwt18YVTIBa9pM4t8fSUT+wc2ceicYDJ3kFmjdnHv9+pu0RUYa40hOoBb
         1AOfqEsEl7Ybh+HnUtnPrlFhka22DU3GuZKyElj6ev7/VfKvwJrKrJh96nM+UI5gtRWB
         GR+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=AsV+XrcV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QuDcugKU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QuDcugKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2-v6si1550723qke.294.2018.07.14.10.17.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:17:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=AsV+XrcV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QuDcugKU;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QuDcugKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42050 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOAL-00062C-AE
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:17:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9m-0005k3-8Z
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004Pe-1c
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:30 -0400
Received: from greensocs.com ([193.104.36.180]:57255)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9i-0004MM-Mv; Sat, 14 Jul 2018 13:16:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BFF3FC7AFE;
	Sat, 14 Jul 2018 19:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588577;
	bh=cH6+vpEmFdzTYRqDq6gwPorocs7nHSz3mVlAilMImI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AsV+XrcVNCdUjvRjaYlH4YJOlI36CrVrag5RXYp3afKjLWbTTmKQ8LVwaqH/efaPc
	HbEHEFF28DKNf22QcSokgleOdS/0Go2y3HhLj90JtU87GkKxkW3fCCdEiMY1jpsSaa
	vu+cGCD/YpGcxKKnivftGuvC8LeKYfagTEHj6Lrg=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QuDcugKU;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=QuDcugKU
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epXyKaisCYkb; Sat, 14 Jul 2018 19:16:17 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id E6A6FC7AF9; Sat, 14 Jul 2018 19:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588576;
	bh=cH6+vpEmFdzTYRqDq6gwPorocs7nHSz3mVlAilMImI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QuDcugKUnlIDXEijgzSjngjzLC9DDBISgY9jG2OII/1w0fQ3J+bHbfKt+44GHGByr
	oSxqCgWL0UQ7Con+CzSZHFb2jjgtikiYowq7ONScu8puXzSVCy1HtLgZ8uwT2hASrP
	GvRGYNUO2rvOgK0Uxon1w+IyUa6hFN/08F+f5CL0=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 1D45CC7AE3;
	Sat, 14 Jul 2018 19:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588576;
	bh=cH6+vpEmFdzTYRqDq6gwPorocs7nHSz3mVlAilMImI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QuDcugKUnlIDXEijgzSjngjzLC9DDBISgY9jG2OII/1w0fQ3J+bHbfKt+44GHGByr
	oSxqCgWL0UQ7Con+CzSZHFb2jjgtikiYowq7ONScu8puXzSVCy1HtLgZ8uwT2hASrP
	GvRGYNUO2rvOgK0Uxon1w+IyUa6hFN/08F+f5CL0=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:43 +0200
Message-Id: <20180714171601.5734-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 02/20] intc/arm_gic: Implement GICD_ISACTIVERn
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
X-TUID: xSogfNf5Wgyz

Implement GICD_ISACTIVERn and GICD_ICACTIVERn registers in the GICv2.
Those registers allow to set or clear the active state of an IRQ in the
distributor.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 61 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 6f3074ba88..accc03523b 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -711,8 +711,16 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
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
@@ -991,9 +999,54 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
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
-- 
2.18.0


Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp729928wrq;
        Fri, 29 Jun 2018 06:31:11 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfJuGx6yJrhIFUqnHxnXjYlEXs3HkcW7bd1cxv3wTFVoQUwIV1xYhej/A+RsqHjevMqAGxl
X-Received: by 2002:a37:6809:: with SMTP id d9-v6mr12106387qkc.444.1530279071516;
        Fri, 29 Jun 2018 06:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279071; cv=none;
        d=google.com; s=arc-20160816;
        b=0L2ly13eIyV7RQiN7WwcJD7amT2xxgLA0q2x8DmO/mte3stqsRQXIv6jeT8yV2BQg7
         VhKvp0Rat04t4WV3UrCQbgLqaMKR1aq1Naqj26pG18ocp6pFfQ6x+tymZLHiBz5WVAUU
         vEmkxk/6OXQjM0oNKkjwXd6hbEar+bujspGCLD4/0rvLWj+EwZWhaF/vDgSNuAPLTama
         p0bVtPglrhC1qY6Gzfv7GjgBCpME81LzNa6Ulh0OdKuQ7T5lXVjuOFDMy/c1APHzUCZs
         UzE232izYoqjc9en1oQ7o3CWS51tlyaO0iXjCRfqDtWDNCZdWO3yRRmuKjQlppM3C86l
         bPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=TPmHIRMvcB9oUJkDVT5lIcgw1sJ8xqLMPqQ3rKEGSqg=;
        b=cEuQ49IBsUPSIOoGCYNzFo6u0lxGvcElSdzAs6+t7KrrCAHJgpbZUQdg2oUQazXdhc
         OpTVKD9+f09KrS14Uc8LwXpejHv0iXGsTASHLcS1MbpLc9bwGBh2FchKTa10jJJpOu3q
         cos3jnKqQIr51WuIPRE9OsU3aGIJ48pMBSl38F4EQNSDzKbCNr8ZJ9iPph2QTHG07TFv
         8/zo11lxqLbO/hNnJmPmyret7M/8qmxfCNIIG2T0Xjs5Imcb52besfDah5LvEPCRtM9D
         kzcwjPXHTNpJ+/AnP+Ps1s2lMm6vh/WrqZlWQzrOYjuNbnS9FN/7qVZt3vGsgOWk/Ogi
         VeGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BeJFg3IQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="vEuTvO/j";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="zPDar/Ek";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c56-v6si9224550qtc.342.2018.06.29.06.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=BeJFg3IQ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="vEuTvO/j";
       dkim=fail header.i=@greensocs.com header.s=mail header.b="zPDar/Ek";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtUU-0007cW-Vd
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU6-0007Zu-Tp
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU1-0006lI-U0
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:46 -0400
Received: from greensocs.com ([193.104.36.180]:58558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU1-0006ZS-I7; Fri, 29 Jun 2018 09:30:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 00E32443496;
	Fri, 29 Jun 2018 15:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279032;
	bh=gkFgsq3m5Nx9eJGMBEBFQpu3WOu84eY5r+uz8s7ufGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BeJFg3IQWYFAkCAOq47bWcDjMaOz+inMkXwa/4fpZDMPV7qnZYDE9War7/27hD1pR
	qmORJPTds4XNEerttIiFJsO7d9KGqCdvRpTlJMZf1z9LdpVNPsDzzIkK0ZFdTa2UAh
	QOaBW5DmBoSNj7vwbuqYhhHGpHMHmI+4I09ajg3c=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=vEuTvO/j;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=zPDar/Ek
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id alurRsX1RDHy; Fri, 29 Jun 2018 15:30:31 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 0C3584434A8; Fri, 29 Jun 2018 15:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279031;
	bh=gkFgsq3m5Nx9eJGMBEBFQpu3WOu84eY5r+uz8s7ufGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=vEuTvO/jUBYB9ZBBG5v8A6OMMsLaaIUCE7GKz21KK1NXB0oMGp1Jj17tfzCeeccZ+
	9bIUi2ckDBEYg2/qxCsxrlBSnN8NCct+6h8NYRg/gDFIh/tsLmpEzd8n2NTaxB96yS
	cC6DsoYNaM4HKCE23Ol2lmNq4qQrSrk+vVLVFMEo=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 87CA1443496;
	Fri, 29 Jun 2018 15:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279030;
	bh=gkFgsq3m5Nx9eJGMBEBFQpu3WOu84eY5r+uz8s7ufGI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zPDar/EkRtr8EptT1wu8VLxdfKylAuSZ4PdYv7YcU1fmOHh2vFWfvQhrrnS+WFTjq
	ucPjWRHOMIuf/iCI7dEBvVAB9Cy+uHCD3F6FAOMCiBx+XcCoUBRl6GbTC0gSpqqd6W
	f4zH2F/A/ZImNoV7AUOiqc7c34E6iVMPKsAm4jBk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:35 +0200
Message-Id: <20180629132954.24269-2-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 01/20] intc/arm_gic: Implement write to
 GICD_ISACTIVERn and GICD_ICACTIVERn registers
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
X-TUID: gPzMtq343AVM

Implement write access to GICD_ISACTIVERn and GICD_ICACTIVERn registers
in the GICv2. Those registers allow to set or clear the active state of
an IRQ in the distributor.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 41 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index ea0323f969..5755a4fb2c 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -982,9 +982,46 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
                 GIC_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
             }
         }
+    } else if (offset < 0x380) {
+        /* Interrupt Set Active.  */
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
2.17.1


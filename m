Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649522wrq;
        Sat, 14 Jul 2018 10:16:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdGleiZjLnxKTnJTTFimy+ce9xw9juiF59xcAHlXG4W3CPsHbDbOzhAdGA1feQItE2QW8QD
X-Received: by 2002:a0c:fa4e:: with SMTP id k14-v6mr11838978qvo.35.1531588614515;
        Sat, 14 Jul 2018 10:16:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588614; cv=none;
        d=google.com; s=arc-20160816;
        b=VGNSCBBW4Y2RxFmd9UdhR+verfD9keJXMSBzy9m0QI3HSnyZPrStJYo392l8N5IeVv
         ZGfcayblLheUe/deLZkQGZ5xMVVB3MmGBFZlQIqeB8X5qEfAn3xrXwP5C7U+xCLF8HrR
         yPjZuuCRE/PKu2bRlGVAXr6bxy68XGxzXLvwp9pprFccGwJ2a+eBmVogNnFIyw/Y5/hT
         V+yRo4dvSwPxqhyt2JunCg3Qfk/Ozqfrc4pdTfx3BF5/HpG444S2Fe/Z4QT6zXdsHsIR
         A9zk4marViFCFpD2deeOvmrkiNV+PtgPzs+VBtyByT9le5Y9j5asGFWpd0bTDsqEcVFR
         M4/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=uc+cOFjHT416R4e39uCxXKwUWY/d8OdtONyy7cPLZN8=;
        b=L6w4CF9xhzJW/a5n03+2XWT5Cw2NuwrSsmiY5Nzw1Ii3me/rG0Xj+B6PRb0NDACM2R
         AbpZT9aZl8bXPRTAklleJbsi39Q+PENmXdE1RPahFMpIckhrT09Q8Y+ROti/2VAtIWSp
         X7812N2SFZxjb4XOrfHtk7/pMxVvsGX5x2vujTxypRpvbtM840+9P8VBblnyh5pBaJQT
         YID3HsRutn+TCgfEmfWRXwY+u8lDKCQSIiEKMWoBbO97BajIJlRpr7OO2Tg/0r3WeZFb
         PHlWxbgSnO+ar/LJeSG5hzEiCFIe55MFgffMpklbxx9Gm7ua362hfsiim9bUOo88HNRB
         qhTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ZXlX+LGu;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nxER826N;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nxER826N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l21-v6si2050400qtk.212.2018.07.14.10.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:16:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=ZXlX+LGu;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nxER826N;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=nxER826N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOA9-0005oX-Vv
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:16:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9o-0005kC-3Y
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9k-0004SQ-1X
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:31 -0400
Received: from greensocs.com ([193.104.36.180]:57319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9j-0004Qn-LA; Sat, 14 Jul 2018 13:16:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2B5EBC7AFB;
	Sat, 14 Jul 2018 19:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588587;
	bh=EG46i0a1O3AX/avIOovDkdx0T7SdNQIq/Xhp8wq4+FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZXlX+LGu/APcDBprLvbzoYlYPCYZ1jQknkDHEnc7jGBAOH39ZAWNbBJ4lghhP6Wki
	UTM5Hxw0Wxlmvsk/5b7Sb/fPukQ4BW0EnMH7xc54lJtejqhFfmCbMwg+YQEFLJ4WCD
	jJSAivbdESeDTd+dMZfH4Ibe8tPKU7dXIPwNdFPA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=nxER826N;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=nxER826N
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mp5SvqOQmpak; Sat, 14 Jul 2018 19:16:26 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 60AD3C7ADD; Sat, 14 Jul 2018 19:16:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588586;
	bh=EG46i0a1O3AX/avIOovDkdx0T7SdNQIq/Xhp8wq4+FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nxER826N7SyHQ62zQaHKQGOegbxxWDYjyxL9UMk4TNlnePZjhH8ySbpOklliXEZqm
	B8ftCxrf59DIKmoEn+T/bu/L7Kjg6LccPcKnDsFI1CFJkLCdzPTuD0sXoilI6W2EPF
	TvkOXmXUH2VmgDt8rT0i15QEK6Hx26gPwkgwVPM8=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id A58F542898C;
	Sat, 14 Jul 2018 19:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588586;
	bh=EG46i0a1O3AX/avIOovDkdx0T7SdNQIq/Xhp8wq4+FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nxER826N7SyHQ62zQaHKQGOegbxxWDYjyxL9UMk4TNlnePZjhH8ySbpOklliXEZqm
	B8ftCxrf59DIKmoEn+T/bu/L7Kjg6LccPcKnDsFI1CFJkLCdzPTuD0sXoilI6W2EPF
	TvkOXmXUH2VmgDt8rT0i15QEK6Hx26gPwkgwVPM8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:53 +0200
Message-Id: <20180714171601.5734-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 12/20] intc/arm_gic: Implement virtualization
 extensions in gic_(deactivate|complete_irq)
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
X-TUID: MVyxjhmSAE0R

Implement virtualization extensions in the gic_deactivate_irq() and
gic_complete_irq() functions.  When a guest tries to deactivat or end an
IRQ that does not exist in the LRs, the EOICount field of the virtual
interface HCR register is incremented by one, and the request is
ignored.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index be9e2594d9..50cbbfbe24 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -590,6 +590,15 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         return;
     }
 
+    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
+        /* This vIRQ does not have an LR entry which is either active or
+         * pending and active. Increment EOICount and ignore the write.
+         */
+        int rcpu = gic_get_vcpu_real_id(cpu);
+        s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
+        return;
+    }
+
     if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
         return;
@@ -604,6 +613,15 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     int group;
 
     DPRINTF("EOI %d\n", irq);
+    if (gic_is_vcpu(cpu) && !gic_virq_is_valid(s, irq, cpu)) {
+        /* This vIRQ does not have an LR entry which is either active or
+         * pending and active. Increment EOICount and ignore the write.
+         */
+        int rcpu = gic_get_vcpu_real_id(cpu);
+        s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
+        return;
+    }
+
     if (irq >= s->num_irq) {
         /* This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1023]
-- 
2.18.0


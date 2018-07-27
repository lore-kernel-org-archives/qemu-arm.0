Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp506998wru;
        Fri, 27 Jul 2018 02:55:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd2rtyVdTYNt4M4UnNmze6shLR9HAlpmJZCbVOwYUlGqukxeyAiW3aYCv0wVq61Sml+yHpF
X-Received: by 2002:ae9:de05:: with SMTP id s5-v6mr4873723qkf.145.1532685317725;
        Fri, 27 Jul 2018 02:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685317; cv=none;
        d=google.com; s=arc-20160816;
        b=FrTEBmV3R6cL9dUfQyNG3wzKi+dfZgYvyDTtHZaVVALw3P4pix0FARIPJaIpKyyMPR
         oPzk/ycHnywqStP/6FdFdr2THYYoXRwHFLJQdNh+F9ADbF6aCYGO+IXx+QqezYXmtEGk
         wPk/oafdPOxI/KPGJn0q+8L4/VIUjyVoCmire4eY+pY6ufoPFTsITBp3Gx/nQCdjYZOQ
         5LKDAV/KAA78EYvL+VyeUWpmxqrlPz0cs0zH3ewgt0Wsy0N4tzqj7makGDdza3Wn5suB
         eP3mxbZYp2AEt4XoFrMi5mX9RwT2PAuSwTsXWaFq+m98iiPC04f8C/2hm1F6RN0uOg1K
         voag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=l+EACEEkyRkYagwJUJ2C06w5AfV8mWp/d5LocrgLG4Q=;
        b=jm49q1X/tb+3eUr5gtjkStyqMmz96hd/AleePwtMO60pc+oMYqhrWurv21Uw+bfbc9
         m7rFBM3ShP9gZBHemL7r18DgNeyQLpsYBTPo7ONYnVUIaISmqTW6kGdfVvtA2KsBRydH
         nvIsHpeIrxk+jkJgwlzlPnQ7XDQLqeyi7P5kA57ml4JpqWSCNgEaJbgZAUqWmU5G3wqO
         a9gUOMAd6jJ6D2HQyNuxVhpsVXBQ5u+OsDV8ed2WOenjUr2wZ3UgRiKmKzPG1UnnJeMx
         edRP7USRrN++ZaTL7wILSw3KZgziwowbA+M5SHgyG+Z7W5rkxdaVv7aybCg3thenFgb6
         f+/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QUA7H0ux;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=UzthTwPJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=UzthTwPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z13-v6si536588qkf.190.2018.07.27.02.55.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=QUA7H0ux;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=UzthTwPJ;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=UzthTwPJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizSv-0003fP-2v
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003WD-Fu
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006Ai-CH
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47523)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00068v-TV; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id AEA4D44A0F2;
	Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685289;
	bh=5WV/wNLjNyQfMb2EzAtNl4rfaf6k6INk+sl6UaUVf2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QUA7H0ux95QNv+t+mLigacy9aeJ+TeHszSiW5Q+7ZDeWKNbkQ6H3Z/GBwukgN0fGC
	h8raCqdZaIhihlAzd8Qz1TcWTeS4eaC6v5r+EcWrl+JDHhbsKak+iQOC0irBu3kTCI
	DA5lB0PCrmdnIIUlEK3uY2fP+7OnPcxKE4VmfCyY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=UzthTwPJ;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=UzthTwPJ
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hB1MMotST5hW; Fri, 27 Jul 2018 11:54:48 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id AE6E7400DC8; Fri, 27 Jul 2018 11:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685287;
	bh=5WV/wNLjNyQfMb2EzAtNl4rfaf6k6INk+sl6UaUVf2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UzthTwPJNJQibOzESpmFNGfp+hQAVuRIHhkXYDdLItDQvTIEKe88+OWkAEUUbHiim
	Qn8Kx6ZDaR9vzltqBK3foiSVNPusAuwbL7LMjcL9pboAtowHM4bS8Rk4diJbOdSavZ
	d3Xgbygqp0jiXBSM6LxWZJPihqLpdRqZu25eMyfE=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 591264434A7;
	Fri, 27 Jul 2018 11:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685287;
	bh=5WV/wNLjNyQfMb2EzAtNl4rfaf6k6INk+sl6UaUVf2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UzthTwPJNJQibOzESpmFNGfp+hQAVuRIHhkXYDdLItDQvTIEKe88+OWkAEUUbHiim
	Qn8Kx6ZDaR9vzltqBK3foiSVNPusAuwbL7LMjcL9pboAtowHM4bS8Rk4diJbOdSavZ
	d3Xgbygqp0jiXBSM6LxWZJPihqLpdRqZu25eMyfE=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:13 +0200
Message-Id: <20180727095421.386-13-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 12/20] intc/arm_gic: Implement virtualization
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
X-TUID: 6t09BQDlD8wD

Implement virtualization extensions in the gic_deactivate_irq() and
gic_complete_irq() functions.

When the guest writes an invalid vIRQ to V_EOIR or V_DIR, since the
GICv2 specification is not entirely clear here, we adopt the behaviour
observed on real hardware:
  * When V_CTRL.EOIMode is false (EOI split is disabled):
    - In case of an invalid vIRQ write to V_EOIR:
      -> If some bits are set in H_APR, an invalid vIRQ write to V_EOIR
         triggers a priority drop, and increments V_HCR.EOICount.
      -> If V_APR is already cleared, nothing happen

    - An invalid vIRQ write to V_DIR is ignored.

  * When V_CTRL.EOIMode is true:
    - In case of an invalid vIRQ write to V_EOIR:
      -> If some bits are set in H_APR, an invalid vIRQ write to V_EOIR
         triggers a priority drop.
      -> If V_APR is already cleared, nothing happen

    - An invalid vIRQ write to V_DIR increments V_HCR.EOICount.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 51 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index d80acde989..3cddf65826 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -581,31 +581,41 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
 
 static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
     int group;
 
-    if (irq >= s->num_irq) {
+    if (irq >= GIC_MAXIRQ || (!gic_is_vcpu(cpu) && irq >= s->num_irq)) {
         /*
          * This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1023]
          * to the GICC_DIR, the GIC ignores that write.
          * 2. If software writes the number of a non-existent interrupt
          * this must be a subcase of "value written is not an active interrupt"
-         * and so this is UNPREDICTABLE. We choose to ignore it.
+         * and so this is UNPREDICTABLE. We choose to ignore it. For vCPUs,
+         * all IRQs potentially exist, so this limit does not apply.
          */
         return;
     }
 
-    group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
-
     if (!gic_eoi_split(s, cpu, attrs)) {
         /* This is UNPREDICTABLE; we choose to ignore it */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gic_deactivate_irq: GICC_DIR write when EOIMode clear");
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
+    group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
+
     if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
         return;
     }
 
@@ -616,10 +626,43 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
     int cm = 1 << cpu;
     int group;
 
     DPRINTF("EOI %d\n", irq);
+    if (gic_is_vcpu(cpu)) {
+        /* The call to gic_prio_drop() will clear a bit in GICH_APR iff the
+         * running prio is < 0x100.
+         */
+        bool prio_drop = s->running_priority[cpu] < 0x100;
+
+        if (irq >= GIC_MAXIRQ) {
+            /* Ignore spurious interrupt */
+            return;
+        }
+
+        gic_drop_prio(s, cpu, 0);
+
+        if (!gic_eoi_split(s, cpu, attrs)) {
+            bool valid = gic_virq_is_valid(s, irq, cpu);
+            if (prio_drop && !valid) {
+                /* We are in a situation where:
+                 *   - V_CTRL.EOIMode is false (no EOI split),
+                 *   - The call to gic_drop_prio() cleared a bit in GICH_APR,
+                 *   - This vIRQ does not have an LR entry which is either
+                 *     active or pending and active.
+                 * In that case, we must increment EOICount.
+                 */
+                int rcpu = gic_get_vcpu_real_id(cpu);
+                s->h_hcr[rcpu] += 1 << R_GICH_HCR_EOICount_SHIFT;
+            } else if (valid) {
+                gic_clear_active(s, irq, cpu);
+            }
+        }
+
+        return;
+    }
+
     if (irq >= s->num_irq) {
         /* This handles two cases:
          * 1. If software writes the ID of a spurious interrupt [ie 1023]
          * to the GICC_EOIR, the GIC ignores that write.
          * 2. If software writes the number of a non-existent interrupt
-- 
2.18.0


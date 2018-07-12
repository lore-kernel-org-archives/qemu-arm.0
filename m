Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1516270wrq;
        Thu, 12 Jul 2018 08:42:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcydB6BznCinWI1rcjTttU06kmMuLyRyFO32weVGshUVVEuskORVsiItxPVAJ68//o2xAE4
X-Received: by 2002:a37:ad0f:: with SMTP id f15-v6mr2268573qkm.255.1531410176121;
        Thu, 12 Jul 2018 08:42:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531410176; cv=none;
        d=google.com; s=arc-20160816;
        b=BMdJl2TGlA+jIVpOv4sNTCs4dmqUEQchsD0vzJK1Vfj+dplVks/a6yPGsujymsukYb
         lM7s9bhyYysS9vAGXp9VuO+N+yOHBb4yx+iCxcHL/vO587Q3KYdG4OtFGvJBRrFobMbW
         DX8zQp9Wb2F6ZAMCTztgWyaBkx62cEJRc5ES5z4FGSAGKwPKUH9h3qGrhMLIDo+Xd5/O
         3yMUDZqDhJF7DfyfHWkdd+WWU/b0GAdZhl2IqAfqTbVxbnUOm9/SSNZz29t6f0ZCPnji
         fEqB6KQGJEZX8fJekhRxqQY13d+G3A/0FL3WIIOoSka/dclUQKQNHpr2IyCQC9r+SQwi
         FPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MsVg9cutsu5tMdfiqCn9uR4BPhk5G6oOUs0ouMEzNLg=;
        b=oplNGpQJ+6Jnx+dtAg7qkzurE/ndaMVshyeps8jMu/aAjNmtYfWSu2GY2fLRNNjd4m
         cAaWDlzQT/iKbGc0dE9brcw6xL0jHtrQzzTd322vZWTG+kiFnuVSnR9WsBrHQjN7IhFE
         6WSNrHRiGMfIKEefx85jCz0HyhrJh13fkLlqdNZ4nqjCXbZL9NpDl3nDtsRJKuUDnxF1
         qhLNj63JQPAXF4FPrRRnPJByExoyaI0cjlpPb+TDXCUszSjE/bhIayEHU5QfV7G8KxH7
         Do5C9ebAzg1+wAVYQYpibCP3MP2uDCFLmoswCNmSfBjD+L8cJEum95Kt2lIwj5+N/Otg
         puwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11-v6si2985415qvi.8.2018.07.12.08.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 08:42:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fddk7-00058q-Ii
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 11:42:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fddjH-0004Zd-If
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:42:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fddjG-0008ON-M1
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 11:42:03 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43486)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fddjG-0008GP-FY; Thu, 12 Jul 2018 11:42:02 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fddj9-0003qk-2l; Thu, 12 Jul 2018 16:41:55 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 12 Jul 2018 16:41:52 +0100
Message-Id: <20180712154152.32183-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180712154152.32183-1-peter.maydell@linaro.org>
References: <20180712154152.32183-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 2/2] hw/intc/arm_gic: Fix handling of
 GICD_ITARGETSR
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
Cc: Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HPFLfd7QK8bM

The GICD_ITARGETSR implementation still has some 11MPCore behaviour
that we were incorrectly using in our GICv1 and GICv2 implementations
for the case where the interrupt number is less than GIC_INTERNAL.
The desired behaviour here is:
 * for 11MPCore: RAZ/WI for irqs 0..28; read a number matching the
   CPU doing the read for irqs 29..31
 * for GICv1 and v2: RAZ/WI if uniprocessor; otherwise read a
   number matching the CPU doing the read for all irqs < 32

Stop squashing GICD_ITARGETSR to 0 for IRQs 0..28 unless this
is an 11MPCore GIC.

Reported-by: Jan Kiszka <jan.kiszka@web.de>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index b0a69d6386e..34dc84ae813 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -751,7 +751,9 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
             if (irq >= s->num_irq) {
                 goto bad_reg;
             }
-            if (irq >= 29 && irq <= 31) {
+            if (irq < 29 && s->revision == REV_11MPCORE) {
+                res = 0;
+            } else if (irq < GIC_INTERNAL) {
                 res = cm;
             } else {
                 res = GIC_TARGET(irq);
@@ -1014,7 +1016,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
             if (irq >= s->num_irq) {
                 goto bad_reg;
             }
-            if (irq < 29) {
+            if (irq < 29 && s->revision == REV_11MPCORE) {
                 value = 0;
             } else if (irq < GIC_INTERNAL) {
                 value = ALL_CPU_MASK;
-- 
2.17.1


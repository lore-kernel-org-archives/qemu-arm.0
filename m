Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp588924wrq;
        Wed, 6 Jun 2018 02:32:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJQDLygmqKEFl0SkkyjiCO0AT/ChjOGpfwTU2O/FZGuxoM+Czfwx8/yO5uJM1WPvFMTo2zE
X-Received: by 2002:ac8:21e5:: with SMTP id 34-v6mr1996071qtz.198.1528277525262;
        Wed, 06 Jun 2018 02:32:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528277525; cv=none;
        d=google.com; s=arc-20160816;
        b=vuY1QqjTULBuQrxl5mRXlM0Ty/q8wUnNRMZSPgh1/NhfSkPjnydwE34MI5gg6ImvZy
         xkkIrQVtLr5dhWvIEql6asihIYis7EcmQHhAMea8cam9lPLKEN0wIc6wdXh7onoysMgO
         CshiD+XOZbPOeySXXraZGLCG07ZjEk2Bmk6Q1G4vV+zj7Qj4oKoHajRD69t/JZi7gNiq
         qPUHI7EJduCIf37IIAUsvnO0wDezQD9u4vcNBZk9au5N5ilsJc7fUIIEMRCM4p5MeIyX
         VFhigc8pFnJ2MVbpSpIv331v/lBqLCBwXjVKctmMGJXTn+aowa/7jri2bpPreZ1PFKwP
         qLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=mUF6JYBIs8bapmruX0S4vkXtU4Tlvn4f4Pxjmr7UVbA=;
        b=ejQ3Oehf7E6R7mUnRAcneaW2y86DxWriW1IXbpjFGG413P+yDHd9cV77nWC3pud9GY
         I2FAB5/V0r3/CQmvptCbiQjNAPIZ8WdoymnuenEhVqf7rtM6x14M5iRO1RpF6/j4OmYK
         4JCxoaKKOcRym7/uVA3XUZVRNAa22WwysAq5bk0BDT8b/Nb0OQqdMRCMiEx9YE+Mx+tJ
         VDo7F0/dbUgS/7XYdQzlSBga2TDUn4FWJRmmbIolEq+scYg4m+pl0C/j609RSWAB29dD
         H6WtFuBf/GofdcNU9DMTIIKmEdfXyqsJJpbVBV3o14v54+nu8ggDfXViglNdz5wBDBpu
         g3vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=5/7xSwhH;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L5MSCPR6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L5MSCPR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a10-v6si2951235qvd.43.2018.06.06.02.32.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 02:32:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=5/7xSwhH;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L5MSCPR6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L5MSCPR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQUnU-0001iu-M1
	for alex.bennee@linaro.org; Wed, 06 Jun 2018 05:32:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnG-0001iP-AL
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fQUnD-0003gm-0U
	for qemu-arm@nongnu.org; Wed, 06 Jun 2018 05:31:50 -0400
Received: from greensocs.com ([193.104.36.180]:53694)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fQUnC-0003fX-ID; Wed, 06 Jun 2018 05:31:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id A2B8F443552;
	Wed,  6 Jun 2018 11:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277498;
	bh=2sAi8a9Z+tTbV0tR7/7r0u+odNweZxuimVSx40dIFdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5/7xSwhHKsR2wlVcEVnSAIf+YhLHKMS1wKlpfS98setBdUPGOE5lFwHUTYbdBm7yU
	43JVe5g/g1RegO2Gc7PZXWyfg/TsZEyeHBdQlmx6VdSbDQMOE187u3PnQSmfsw9LuA
	GfEuj4OVRQpeTI0Vrdz0FICFwoe8UciNdq9zkHz8=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=L5MSCPR6;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=L5MSCPR6
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKNhkdNDX3Um; Wed,  6 Jun 2018 11:31:37 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 996F544354B; Wed,  6 Jun 2018 11:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277497;
	bh=2sAi8a9Z+tTbV0tR7/7r0u+odNweZxuimVSx40dIFdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L5MSCPR6JOmxF8be6JpTrehO76KQf9gvI2o0D2O3SHxwVqzRdNAuCU05DPM/DqcCA
	3qDUV2Ugt6tgIXBoQ4lDPFK/3TSoXm34fqekrge9RlpEONt78JDEEj127scH9BZNdX
	7kV3qKvepx4itIVLeb6BBqF5ydy9SrVuUGjb6Wr4=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 4689D443557;
	Wed,  6 Jun 2018 11:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1528277497;
	bh=2sAi8a9Z+tTbV0tR7/7r0u+odNweZxuimVSx40dIFdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L5MSCPR6JOmxF8be6JpTrehO76KQf9gvI2o0D2O3SHxwVqzRdNAuCU05DPM/DqcCA
	3qDUV2Ugt6tgIXBoQ4lDPFK/3TSoXm34fqekrge9RlpEONt78JDEEj127scH9BZNdX
	7kV3qKvepx4itIVLeb6BBqF5ydy9SrVuUGjb6Wr4=
From: luc.michel@greensocs.com
To: qemu-devel@nongnu.org
Date: Wed,  6 Jun 2018 11:30:57 +0200
Message-Id: <20180606093101.30518-3-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180606093101.30518-1-luc.michel@greensocs.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH 2/6] intc/arm_gic: Remove some dead code and put
 some functions static
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
	Jan Kiszka <jan.kiszka@web.de>, Luc MICHEL <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P8i6htMUio8H

From: Luc MICHEL <luc.michel@greensocs.com>

Some functions are now only used in arm_gic.c, put them static. Some of
them where only used by the NVIC implementation and are not used
anymore, so remove them.

Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c      | 23 ++---------------------
 hw/intc/gic_internal.h |  4 ----
 2 files changed, 2 insertions(+), 25 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 141f3e7a48..679b19fb94 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -71,7 +71,7 @@ static inline bool gic_has_groups(GICState *s)
 
 /* TODO: Many places that call this routine could be optimized.  */
 /* Update interrupt status after enabled or pending bits have been changed.  */
-void gic_update(GICState *s)
+static void gic_update(GICState *s)
 {
     int best_irq;
     int best_prio;
@@ -137,19 +137,6 @@ void gic_update(GICState *s)
     }
 }
 
-void gic_set_pending_private(GICState *s, int cpu, int irq)
-{
-    int cm = 1 << cpu;
-
-    if (gic_test_pending(s, irq, cm)) {
-        return;
-    }
-
-    DPRINTF("Set %d pending cpu %d\n", irq, cpu);
-    GIC_DIST_SET_PENDING(irq, cm);
-    gic_update(s);
-}
-
 static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
                                  int cm, int target)
 {
@@ -565,7 +552,7 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
     GIC_DIST_CLEAR_ACTIVE(irq, cm);
 }
 
-void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
+static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
     int cm = 1 << cpu;
     int group;
@@ -1418,12 +1405,6 @@ static const MemoryRegionOps gic_cpu_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-/* This function is used by nvic model */
-void gic_init_irqs_and_distributor(GICState *s)
-{
-    gic_init_irqs_and_mmio(s, gic_set_irq, gic_ops);
-}
-
 static void arm_gic_realize(DeviceState *dev, Error **errp)
 {
     /* Device instance realize function for the GIC sysbus device */
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 6f8d242904..a2075a94db 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -75,11 +75,7 @@
 /* The special cases for the revision property: */
 #define REV_11MPCORE 0
 
-void gic_set_pending_private(GICState *s, int cpu, int irq);
 uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
-void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs);
-void gic_update(GICState *s);
-void gic_init_irqs_and_distributor(GICState *s);
 void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
                            MemTxAttrs attrs);
 
-- 
2.17.0


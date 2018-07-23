Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5929003wru;
        Mon, 23 Jul 2018 11:03:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeXsqKqGWshk4nlSPmOZazabor9iYd/yhXItzmDxyw6SVtjvBnrmkTdj4EY03My2C1K44AZ
X-Received: by 2002:a0c:ae17:: with SMTP id y23-v6mr12178020qvc.157.1532369031332;
        Mon, 23 Jul 2018 11:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532369031; cv=none;
        d=google.com; s=arc-20160816;
        b=Or30JoLiZ0hjJ4qhD0XPHJGnwPgycvj/IpMNTTI23ApFjof6JuyqounMthZ0yUIlMH
         EGXiM5McNL+zuDQ/zdN+88yPiuzElABD6feYbRUrdOELmoR8kGCqJRqPdkSbSIcqEm93
         4q16DRRe6azjST/uVwYTtTAgjyz9OIO6SQDxikz+1EX9Oai/TbVAGY1Cg6PxByel8Kns
         QxO2dOct/veFMNfkZBJdoFw8N5qCaKyZrrGVW8Kk9bDK3Qyh1rvizyGUwaXhLIf0YVFK
         +2foEemqJJ28axofQjg8A+NS7EBR/mswuf1bAPUZ1fmrqRH3GWjZ73S2YxofV2/rP0kB
         CoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=daDA8SyLlbArueQhDsH8d7wiLU8f3ikltkMNLkPcDys=;
        b=lTq1tdiC2A5B9gqpJ9S7PApYhIQvNVWTRkTNpMTg8Q4jM9R8gKSSvHPv11ZKeO+th2
         GO3Ck1lY1OvcD5WGbaIz2PhLC6OZgfJ/oPgJFBw1P/VC4qTacfXPeHbCGrK2YtoKDZ8l
         kBRWtvqqUyRO5KVc/tFLSLYgXM5N3s7C4DJgxigRU9YXLYkiK0NnY+ieIqEv+gisiCiD
         VQ75X5s7W0/L2psw1FJs6Ml3VFUUE9iUGZkd/BpmiCk9f+vCPv0/J/shiyahy4ImnhAI
         I74ewUlmwOw/Umlk38ioRXK081w601rhD7cVjDaArvhGlruVK/tX3X4t8PVuxOml+L6i
         uTVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k16-v6si4025874qkh.243.2018.07.23.11.03.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 11:03:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhfBW-0000Cd-PP
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 14:03:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhfBN-0000BU-8y
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 14:03:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fhfBM-0006A4-56
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 14:03:41 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:43688)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fhfBL-00069F-VH; Mon, 23 Jul 2018 14:03:40 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fhfBK-0007o9-4t; Mon, 23 Jul 2018 19:03:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 23 Jul 2018 19:03:37 +0100
Message-Id: <20180723180337.17378-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0?] hw/intc/arm_gicv3: Check correct
 HCR_EL2 bit when routing IRQ
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TaQnLoyF3Ygz

In icc_dir_write() we were incorrectly checking HCR_EL2.FMO
when determining whether IRQ should be routed to EL2; this should
be HCR_EL2.IMO (compare the GICv3 pseudocode ICC_DIR_EL1[]).
Use the correct mask.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Cut-n-paste bug we've had since forever. Linux always sets
FMO and IMO to the same thing, so we haven't noticed this.
Probably should go into 3.0, though...

 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index 5c89be1af07..2a60568d82c 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1550,7 +1550,7 @@ static void icc_dir_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * tested in cases where we know !IsSecure is true.
      */
     route_fiq_to_el2 = env->cp15.hcr_el2 & HCR_FMO;
-    route_irq_to_el2 = env->cp15.hcr_el2 & HCR_FMO;
+    route_irq_to_el2 = env->cp15.hcr_el2 & HCR_IMO;
 
     switch (arm_current_el(env)) {
     case 3:
-- 
2.17.1


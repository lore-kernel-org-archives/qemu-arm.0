Received: by 10.25.44.15 with SMTP id s15csp6354292lfs;
        Wed, 2 Aug 2017 09:44:58 -0700 (PDT)
X-Received: by 10.200.38.155 with SMTP id 27mr15451857qto.228.1501692298602;
        Wed, 02 Aug 2017 09:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501692298; cv=none;
        d=google.com; s=arc-20160816;
        b=mV2tvTd8O+D+BbbFLVxXLvrKCQp9HJD/9kRmDdRAcc+P8jTJEhgi88wCzMqkE0cFLW
         L4FwPjPFadT09f9OiTUu+Fd1AaktSLMXG3N5Y0KOfjTNtV70ANEcUxVwrWWVsw4z6ijA
         6/e+WVtRA9f//xp0TywyONP37U3PDr65X9k75nouBH7n61FvzcWOOk0LrKWtlDTHwvkC
         1iGaybmc4LMDIZvLORHB+JI1Upj+zgpwXNu0X2oJwtgAixxeWOiY1AeANlqws1XWmnfV
         DWTc27/RK2ZeqwGT2X817SNImpTg1qMkQ6DvQHc7+CoVHkGC6XyQUbDN1uU5LMSVqHIh
         XxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=MFhLl6TJBr4rJacH/vjWxiNoW+ugx7pQnJ7K7jiklSI=;
        b=welUdyOFMr9pulfW21DkNd32wLw9+SFWiA4pX8zliBEEdZ8N4gxi6SRD0h0lHR2qD3
         dXolCTWLP/+I3s0421fS83n1WY8Z+EVuw9TGm/OCQPsQj525iz/urPMbiTJpcj/ioLKb
         L0NJKE4EQur27vKACUpGsI/71UV6HGAgNPce3ieDrJhHBU8+egbGmz/4qtVnoajsvw9i
         vRYULT7Rp9fIMLeZO0uH0znR3+/4IcEMMrIoyxsDRljUmrzsTBBZ9ti1uSb3yL7TawX/
         9N2ZJrYfT/H2ZbydLdxtzqrYqGuH4ROiwUZHuUiU3307IsRFkcIz7FRrFJ07JNcfSRlg
         OqOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n15si5309822qtc.352.2017.08.02.09.44.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Aug 2017 09:44:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48674 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcwlT-0003sw-Rg
	for alex.bennee@linaro.org; Wed, 02 Aug 2017 12:44:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl5-0003UO-2B
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dcwl4-0004dz-C5
	for qemu-arm@nongnu.org; Wed, 02 Aug 2017 12:44:31 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37764)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dcwl4-0003zA-51; Wed, 02 Aug 2017 12:44:30 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dcwki-00040L-D5; Wed, 02 Aug 2017 17:44:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed,  2 Aug 2017 17:43:58 +0100
Message-Id: <1501692241-23310-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 12/15] target/arm: Don't calculate lr in
 arm_v7m_cpu_do_interrupt() until needed
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
X-TUID: oqs5a1/13rUf

Move the code in arm_v7m_cpu_do_interrupt() that calculates the
magic LR value down to when we're actually going to use it.
Having the calculation and use so far apart makes the code
a little harder to understand than it needs to be.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b64ddb1..0ecc8f1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6311,13 +6311,6 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
 
     arm_log_exception(cs->exception_index);
 
-    lr = 0xfffffff1;
-    if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
-        lr |= 4;
-    }
-    if (env->v7m.exception == 0)
-        lr |= 8;
-
     /* For exceptions we just mark as pending on the NVIC, and let that
        handle it.  */
     switch (cs->exception_index) {
@@ -6408,6 +6401,14 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         return; /* Never happens.  Keep compiler happy.  */
     }
 
+    lr = 0xfffffff1;
+    if (env->v7m.control & R_V7M_CONTROL_SPSEL_MASK) {
+        lr |= 4;
+    }
+    if (env->v7m.exception == 0) {
+        lr |= 8;
+    }
+
     v7m_push_stack(cpu);
     v7m_exception_taken(cpu, lr);
     qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
-- 
2.7.4


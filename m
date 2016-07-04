Received: by 10.25.21.96 with SMTP id l93csp1622845lfi;
        Mon, 4 Jul 2016 10:23:05 -0700 (PDT)
X-Received: by 10.237.36.35 with SMTP id r32mr19962186qtc.61.1467652985562;
        Mon, 04 Jul 2016 10:23:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r185si2650032qke.5.2016.07.04.10.23.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jul 2016 10:23:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bK7aL-00052o-0D
	for alex.bennee@linaro.org; Mon, 04 Jul 2016 13:23:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bK73W-0004ZA-2L
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 12:49:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bK73U-000334-88
	for qemu-arm@nongnu.org; Mon, 04 Jul 2016 12:49:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58097)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bK73U-00032y-0s; Mon, 04 Jul 2016 12:49:08 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bK73O-0001IT-U9; Mon, 04 Jul 2016 17:49:02 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  4 Jul 2016 17:49:02 +0100
Message-Id: <1467650942-28706-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target-arm/arm-semi.c: In SYS_HEAPINFO use
 correct type for 'limit'
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3So5tisQXEv

In commit f5666418c4 most of the SYS_HEAPINFO implementation was
fixed to use target_ulong rather than uint32_t, but the 'limit'
variable was not changed.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This was actually pointed out in code review for the original
patch, but I accidentally forgot to make the change when I
applied the patch to the target-arm queue :-(
---
 target-arm/arm-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/arm-semi.c b/target-arm/arm-semi.c
index d50726f..7cac873 100644
--- a/target-arm/arm-semi.c
+++ b/target-arm/arm-semi.c
@@ -565,7 +565,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
     case TARGET_SYS_HEAPINFO:
         {
             target_ulong retvals[4];
-            uint32_t limit;
+            target_ulong limit;
             int i;
 
             GET_ARG(0);
-- 
1.9.1


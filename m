Received: by 10.25.15.230 with SMTP id 99csp764324lfp;
        Thu, 6 Apr 2017 06:45:50 -0700 (PDT)
X-Received: by 10.55.46.71 with SMTP id u68mr32505161qkh.115.1491486350557;
        Thu, 06 Apr 2017 06:45:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l29si1444707qta.50.2017.04.06.06.45.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Apr 2017 06:45:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cw7jR-0004Dx-Ts
	for alex.bennee@linaro.org; Thu, 06 Apr 2017 09:45:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33838)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cw7jL-0004A6-Pz
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 09:45:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cw7jK-0000Si-HE
	for qemu-arm@nongnu.org; Thu, 06 Apr 2017 09:45:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49079)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cw7jK-0000SK-Av; Thu, 06 Apr 2017 09:45:42 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cw7jJ-0001p9-C2; Thu, 06 Apr 2017 14:45:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Apr 2017 14:45:40 +0100
Message-Id: <1491486340-25988-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Add missing entries to excnames[]
 for log strings
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
X-TUID: ohmqJTOEExvj

Recent changes have added new EXCP_ values to ARM but forgot
to update the excnames[] array which is used to provide
human-readable strings when printing information about the
exception for debug logging. Add the missing entries, and
add a comment to the list of #defines to help avoid the mistake
being repeated in future.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 1 +
 target/arm/internals.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index a8aabce..e6f05e2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -58,6 +58,7 @@
 #define EXCP_SEMIHOST       16   /* semihosting call */
 #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
 #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
+/* NB: new EXCP_ defines should be added to the excnames[] array too */
 
 #define ARMV7M_EXCP_RESET   1
 #define ARMV7M_EXCP_NMI     2
diff --git a/target/arm/internals.h b/target/arm/internals.h
index f742a41..97ca034 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -70,6 +70,8 @@ static const char * const excnames[] = {
     [EXCP_VIRQ] = "Virtual IRQ",
     [EXCP_VFIQ] = "Virtual FIQ",
     [EXCP_SEMIHOST] = "Semihosting call",
+    [EXCP_NOCP] = "v7M NOCP UsageFault",
+    [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
 };
 
 /* Scale factor for generic timers, ie number of ns per tick.
-- 
2.7.4


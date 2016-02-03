Received: by 10.25.159.19 with SMTP id i19csp1234036lfe;
        Wed, 3 Feb 2016 05:53:09 -0800 (PST)
X-Received: by 10.140.108.8 with SMTP id i8mr1664790qgf.83.1454507587657;
        Wed, 03 Feb 2016 05:53:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g73si5591907qge.55.2016.02.03.05.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 05:53:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35091 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQxrn-0000II-8G
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 08:53:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxrj-0000Ba-Ic
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 08:53:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxrf-0006gd-Lg
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 08:53:03 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxrd-0006eA-MQ; Wed, 03 Feb 2016 08:52:57 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxdq-00035c-1p; Wed, 03 Feb 2016 13:38:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Feb 2016 13:38:35 +0000
Message-Id: <1454506721-11843-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 1/7] target-arm: Fix typo in comment in
	arm_is_secure_below_el3()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Z1XOv0Rdf7+T

Fix a typo where "EL2" was written but "EL3" intended.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index b8b3364..52284e9 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -931,7 +931,7 @@ static inline bool arm_is_secure_below_el3(CPUARMState *env)
     if (arm_feature(env, ARM_FEATURE_EL3)) {
         return !(env->cp15.scr_el3 & SCR_NS);
     } else {
-        /* If EL2 is not supported then the secure state is implementation
+        /* If EL3 is not supported then the secure state is implementation
          * defined, in which case QEMU defaults to non-secure.
          */
         return false;
-- 
1.9.1


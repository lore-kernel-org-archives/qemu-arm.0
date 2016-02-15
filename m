Received: by 10.25.208.211 with SMTP id h202csp849372lfg;
        Mon, 15 Feb 2016 09:23:54 -0800 (PST)
X-Received: by 10.55.23.217 with SMTP id 86mr20701091qkx.64.1455557034707;
        Mon, 15 Feb 2016 09:23:54 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w206si35116208qhc.124.2016.02.15.09.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:23:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34525 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMsM-0001Vv-3H
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:23:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrb-0000XO-8n
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMra-0007o9-Hk
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:07 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMra-0007mW-B2; Mon, 15 Feb 2016 12:23:06 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrS-0000xp-6U; Mon, 15 Feb 2016 17:22:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:54 +0000
Message-Id: <1455556977-3644-9-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 08/11] target-arm: Forbid mode switch to Mon
	from Secure EL1
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OrCBcUL8ql6O

In v8 trying to switch mode to Mon from Secure EL1 is an
illegal mode switch. (In v7 this is impossible as all secure
modes except User are at EL3.) We can handle this case by
making a switch to Mon valid only if the current EL is 3,
which then gives the correct answer whether EL3 is AArch32
or AArch64.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4074b97..e7b3eb3 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5188,7 +5188,7 @@ static int bad_mode_switch(CPUARMState *env, int mode)
         return !arm_feature(env, ARM_FEATURE_EL2)
             || arm_current_el(env) < 2 || arm_is_secure(env);
     case ARM_CPU_MODE_MON:
-        return !arm_is_secure(env);
+        return arm_current_el(env) < 3;
     default:
         return 1;
     }
-- 
1.9.1


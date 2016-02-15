Received: by 10.25.208.211 with SMTP id h202csp849474lfg;
        Mon, 15 Feb 2016 09:24:04 -0800 (PST)
X-Received: by 10.140.253.2 with SMTP id y2mr23186791qhc.89.1455557044045;
        Mon, 15 Feb 2016 09:24:04 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y187si35163895qhb.47.2016.02.15.09.24.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:24:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMsV-0001mv-HP
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:24:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrd-0000aR-NR
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrc-0007pX-PK
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:09 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrc-0007mW-Iq; Mon, 15 Feb 2016 12:23:08 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrS-0000xl-4Z; Mon, 15 Feb 2016 17:22:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:53 +0000
Message-Id: <1455556977-3644-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 07/11] target-arm: Add Hyp mode checks to
	bad_mode_switch()
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
X-TUID: AjRBZQwlUWBi

We don't actually support Hyp mode yet, but add the correct
checks for it to the bad_mode_switch() function for completeness.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 37b5439..4074b97 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5184,6 +5184,9 @@ static int bad_mode_switch(CPUARMState *env, int mode)
          * allows FIQ mode to be Secure-only. (In v8 this doesn't exist.)
          */
         return 0;
+    case ARM_CPU_MODE_HYP:
+        return !arm_feature(env, ARM_FEATURE_EL2)
+            || arm_current_el(env) < 2 || arm_is_secure(env);
     case ARM_CPU_MODE_MON:
         return !arm_is_secure(env);
     default:
-- 
1.9.1


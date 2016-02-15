Received: by 10.25.208.211 with SMTP id h202csp850946lfg;
        Mon, 15 Feb 2016 09:27:19 -0800 (PST)
X-Received: by 10.55.75.131 with SMTP id y125mr21510892qka.61.1455557237847;
        Mon, 15 Feb 2016 09:27:17 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si35212880qkb.126.2016.02.15.09.27.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Feb 2016 09:27:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVMvd-0007L1-BB
	for alex.bennee@linaro.org; Mon, 15 Feb 2016 12:27:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMre-0000aw-9Q
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aVMrd-0007pt-3e
	for qemu-devel@nongnu.org; Mon, 15 Feb 2016 12:23:10 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57358)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrc-0007mW-SV; Mon, 15 Feb 2016 12:23:09 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aVMrS-0000xh-2j; Mon, 15 Feb 2016 17:22:58 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 15 Feb 2016 17:22:52 +0000
Message-Id: <1455556977-3644-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
References: <1455556977-3644-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Sergey Fedorov <serge.fdrv@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 06/11] target-arm: Add comment about not
	implementing NSACR.RFR
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
X-TUID: 4II6CO5Kdz6s

QEMU doesn't implement the NSACR.RFR bit, which is a permitted
IMPDEF in choice in ARMv7 and the only permitted choice in ARMv8.
Add a comment to bad_mode_switch() to note that this is why
FIQ is always a valid mode regardless of the CPU's Secure state.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target-arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 9998a25..37b5439 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5180,6 +5180,9 @@ static int bad_mode_switch(CPUARMState *env, int mode)
     case ARM_CPU_MODE_UND:
     case ARM_CPU_MODE_IRQ:
     case ARM_CPU_MODE_FIQ:
+        /* Note that we don't implement the IMPDEF NSACR.RFR which in v7
+         * allows FIQ mode to be Secure-only. (In v8 this doesn't exist.)
+         */
         return 0;
     case ARM_CPU_MODE_MON:
         return !arm_is_secure(env);
-- 
1.9.1


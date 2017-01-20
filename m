Received: by 10.25.77.65 with SMTP id a62csp125245lfb;
        Fri, 20 Jan 2017 10:45:03 -0800 (PST)
X-Received: by 10.55.43.74 with SMTP id r71mr13242759qkh.306.1484937903779;
        Fri, 20 Jan 2017 10:45:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f62si5440475qkj.156.2017.01.20.10.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 10:45:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56735 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUeBJ-00033q-6q
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 13:45:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBC-00033e-2D
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBB-0002VM-B6
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:54 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cUeBB-0002QO-46; Fri, 20 Jan 2017 13:44:53 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cUeB5-00048A-5Q; Fri, 20 Jan 2017 18:44:47 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jan 2017 18:44:43 +0000
Message-Id: <1484937883-1068-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 6/6] armv7m: Clear FAULTMASK on return from
 non-NMI exceptions
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
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TYX30Y8uLJqB

From: Michael Davidsaver <mdavidsaver@gmail.com>

FAULTMASK must be cleared on return from all
exceptions other than NMI.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index dc383d1..cfbc622 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5969,8 +5969,13 @@ static void do_v7m_exception_exit(CPUARMState *env)
     uint32_t xpsr;
 
     type = env->regs[15];
-    if (env->v7m.exception != 0)
+    if (env->v7m.exception != ARMV7M_EXCP_NMI) {
+        /* Auto-clear FAULTMASK on return from other than NMI */
+        env->daif &= ~PSTATE_F;
+    }
+    if (env->v7m.exception != 0) {
         armv7m_nvic_complete_irq(env->nvic, env->v7m.exception);
+    }
 
     /* Switch to the target stack.  */
     switch_v7m_sp(env, (type & 4) != 0);
-- 
2.7.4


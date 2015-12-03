Received: by 10.182.158.201 with SMTP id ww9csp3412720obb;
        Wed, 2 Dec 2015 16:20:04 -0800 (PST)
X-Received: by 10.140.105.101 with SMTP id b92mr7723377qgf.5.1449102004005;
        Wed, 02 Dec 2015 16:20:04 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p63si2158746qkl.45.2015.12.02.16.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hcx-0005bp-NX
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:20:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc1-00049T-JP
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc0-0001xo-Mw
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:05 -0500
Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235]:34959)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc0-0001xj-JY; Wed, 02 Dec 2015 19:19:04 -0500
Received: by qgec40 with SMTP id c40so48207260qge.2;
	Wed, 02 Dec 2015 16:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AP1/CTLT14IQ0hrXZhrpozjUpJpntI2nZyDz/Cfkqyo=;
	b=MJaq+/qlScKF227vlJYIfvh4DRpbm3yxt2AjvDkx1Ey/Dz7WGc/w2xNQfr8rJc2rNG
	BcvYkAzObdRMRsDHSjN+2kNnz95Sx1+e4alSh5JJuf/zqoHld9BseGM9x9Qt3jKLk+eA
	6ourmNOm7QaTB/fhjsm5nDyso3xC9KIpO/bxmb0Cyc6dadUPhOIpKuUsIMVTE6bHDXpw
	PjA+8LVA4+TMBUmUrXRg+mITEfFFD+I9FemmgtjoCz7iINm9gEe67VekxEu+I/LjBO/t
	gcJxU+jjxe5/KPJOMSJyZOHBoVOiCi12FgEsnuGLGU8jfT0RVzIkRLQcjtcQu32+G2gk
	5Keg==
X-Received: by 10.140.239.87 with SMTP id k84mr8355414qhc.87.1449101944205;
	Wed, 02 Dec 2015 16:19:04 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:03 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:34 -0500
Message-Id: <1449101933-24928-8-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::235
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 07/26] armv7m: simpler/faster exception start
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
X-TUID: UdtVwAg2Yg64

No need to bounce through EXCP_IRQ handling
for non-IRQ exceptions.  just update CPU
state directly.
---
 target-arm/helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 7b76f32..4490b74 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5451,23 +5451,21 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
 
     /* For exceptions we just mark as pending on the NVIC, and let that
        handle it.  */
-    /* TODO: Need to escalate if the current priority is higher than the
-       one we're raising.  */
     switch (cs->exception_index) {
     case EXCP_UDEF:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
-        return;
+        break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC);
-        return;
+        break;
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
         /* TODO: if we implemented the MPU registers, this is where we
          * should set the MMFAR, etc from exception.fsr and exception.vaddress.
          */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
-        return;
+        break;
     case EXCP_BKPT:
         if (semihosting_enabled()) {
             int nr;
@@ -5484,7 +5482,6 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG);
         return;
     case EXCP_IRQ:
-        env->v7m.exception = armv7m_nvic_acknowledge_irq(env->nvic);
         break;
     case EXCP_EXCEPTION_EXIT:
         do_v7m_exception_exit(env);
@@ -5494,6 +5491,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         return; /* Never happens.  Keep compiler happy.  */
     }
 
+    armv7m_nvic_acknowledge_irq(env->nvic);
+
+    qemu_log_mask(CPU_LOG_INT, "... as %d\n", env->v7m.exception);
+
     /* Align stack pointer.  */
     /* ??? Should only do this if Configuration Control Register
        STACKALIGN bit is set.  */
-- 
2.1.4


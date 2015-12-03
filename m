Received: by 10.182.158.201 with SMTP id ww9csp3416582obb;
        Wed, 2 Dec 2015 16:30:32 -0800 (PST)
X-Received: by 10.141.28.80 with SMTP id f77mr8213790qhe.66.1449102629016;
        Wed, 02 Dec 2015 16:30:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g189si6193317qhd.50.2015.12.02.16.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:30:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hn2-0000Wp-FL
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:30:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36696)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcJ-0004if-E0
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 19:19:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcF-00028U-Re
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 19:19:23 -0500
Received: from mail-qg0-x232.google.com ([2607:f8b0:400d:c04::232]:33505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4HcD-00026f-7J; Wed, 02 Dec 2015 19:19:17 -0500
Received: by qgea14 with SMTP id a14so48166058qge.0;
	Wed, 02 Dec 2015 16:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=y4CuxcBjR7kB3mi4dT3lBehHSIMAUvuNOS5ti+E1KtE=;
	b=hmJoZCeV68kEdwuE8cFXsEi91iTdxQuckzMTri+mroDXu1mHZXzd7YUFLZIQKh7hme
	vgEp9F7jD3a06i3Wl9tH+w+l+UGt1LNwtHZx4JjTG01y5Ek6kDdH+Z3IqI5sPY+bTVuO
	bUht6GlQp71ck5Qs72FY2/HsrGujSJfcXS3liP5XGuM0rGcGwL/IGZ5++NAhBZAmV2/q
	8Havy9cVwofoDIvXY0RI9OkNM1bzJfAeUvTbVmpScoHaC3tdaGh4DbGAf7os82u3iPsU
	8RFgNN6ZOdOR+gXJ4FW9RpLu5e9xhpkwyHOjw4nqsuIMjLRyIvuLVYkYBFmJ6lY1eT+9
	PHtQ==
X-Received: by 10.140.97.4 with SMTP id l4mr7750895qge.84.1449101956887;
	Wed, 02 Dec 2015 16:19:16 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:16 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:53 -0500
Message-Id: <1449101933-24928-27-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::232
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-arm] [PATCH v2 26/26] armv7m: decide whether faults are
	MemManage or BusFault
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
X-TUID: a8yRpTYDSmf1

General logic is that operations stopped by the MPU are MemManage,
and those which go through the MPU and are caught by the unassigned
handle are BusFault.
---
 target-arm/helper.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index c890b3a..630d5c9 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5546,12 +5546,35 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         break;
     case EXCP_PREFETCH_ABORT:
     case EXCP_DATA_ABORT:
-        /* TODO: if we implemented the MPU registers, this is where we
-         * should set the MMFAR, etc from exception.fsr and exception.vaddress.
-         */
-        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
-        env->v7m.mmfar = env->exception.vaddress;
-        env->v7m.cfsr = (1<<1)|(1<<7); /* DACCVIOL and MMARVALID */
+        switch (env->exception.fsr & 0xf) {
+        case 0x8: /* External Abort */
+            switch (cs->exception_index) {
+            case EXCP_PREFETCH_ABORT:
+                env->v7m.cfsr |= (1<<(8+1)); /* PRECISERR */
+                break;
+            case EXCP_DATA_ABORT:
+                env->v7m.cfsr |= (1<<(8+0)); /* IBUSERR */
+                break;
+            }
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_BUS);
+            env->v7m.bfar = env->exception.vaddress;
+            env->v7m.cfsr |= (1<<(8+7)); /* BFARVALID */
+            break;
+        case 0xd: /* Permission fault */
+        default:
+            switch (cs->exception_index) {
+            case EXCP_PREFETCH_ABORT:
+                env->v7m.cfsr |= (1<<0); /* IACCVIOL */
+                break;
+            case EXCP_DATA_ABORT:
+                env->v7m.cfsr |= (1<<1); /* DACCVIOL */
+                break;
+            }
+            armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_MEM);
+            env->v7m.mmfar = env->exception.vaddress;
+            env->v7m.cfsr |= (1<<7); /* MMARVALID */
+            break;
+        }
         break;
     case EXCP_BKPT:
         if (semihosting_enabled()) {
-- 
2.1.4


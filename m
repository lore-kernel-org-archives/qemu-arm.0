Received: by 10.182.158.201 with SMTP id ww9csp3414091obb;
        Wed, 2 Dec 2015 16:23:46 -0800 (PST)
X-Received: by 10.55.207.139 with SMTP id v11mr7450188qkl.53.1449102226845;
        Wed, 02 Dec 2015 16:23:46 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h95si4379812qge.82.2015.12.02.16.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:23:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4HgY-00047a-ED
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:23:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc4-0004Eg-Ge
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc3-0001zz-NL
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:08 -0500
Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229]:34967)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc3-0001zo-Is; Wed, 02 Dec 2015 19:19:07 -0500
Received: by qgec40 with SMTP id c40so48208167qge.2;
	Wed, 02 Dec 2015 16:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1LOESrnGHMohoz0TXB+RMsifE10tR0fkFD3+EW/I19U=;
	b=IDrXnjxGzMW2B5ajngoWBvvs5hFQNT+nHOVo6jf4iWbnOvYMmrqPKOaoA7z+TRkMll
	gdrR2q61bjhrEW4siOlc51cI1q1F8/daoaOfUFaAcW4WvweXJtT2fCVzfRbtt5/zujVy
	yGh7TjYmk3jZRlVZ7faUTRaVlYrAYy1B0tHJ71TnEhZ1yS8fzn3jhTqEfk0j1p76U1CP
	vMzQxK9PQ9A6K34FjYwwDe+xqZVch+63uIhXFjD0uSGQx0nalMADqtFjfZo8bilND2Z3
	eO1uzEQ7Aac5Twdd3QMWLQ0barqNt889HWEhxoz16G0KVmjo4weWf/3gOtTxi9znKa/a
	vomQ==
X-Received: by 10.140.242.77 with SMTP id n74mr8156662qhc.37.1449101947194;
	Wed, 02 Dec 2015 16:19:07 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:06 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:37 -0500
Message-Id: <1449101933-24928-11-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::229
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 10/26] armv7m: auto-clear FAULTMASK
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
X-TUID: oq0MCohCS3Ge

on return from all exceptions other than NMI
---
 target-arm/helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index d1ca011..b6ec761 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5379,8 +5379,13 @@ static void do_v7m_exception_exit(CPUARMState *env)
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
2.1.4


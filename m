Received: by 10.182.158.201 with SMTP id ww9csp3414755obb;
        Wed, 2 Dec 2015 16:25:45 -0800 (PST)
X-Received: by 10.55.76.76 with SMTP id z73mr7626496qka.90.1449102345904;
        Wed, 02 Dec 2015 16:25:45 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c197si2401346qkb.66.2015.12.02.16.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4HiT-0007nX-F2
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:25:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcA-0004S5-Or
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc9-00023L-HF
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231]:34985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc9-00023G-Cx; Wed, 02 Dec 2015 19:19:13 -0500
Received: by qgec40 with SMTP id c40so48209763qge.2;
	Wed, 02 Dec 2015 16:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CyUiW/QbNr7Gg00RqeRNfV+u2pXnSTHNacfpV4FXnnY=;
	b=rDGcwuQlTjrBz9hY7+4shVC8xmQ/nwFCikqbLgZ82c5BJ1zZIOwMXukzBmcy9tDLaf
	3VPJGZCN1Gg+uuTQqrYcmiyV6NAQDY1A2tyMfGy9DcUGtEbXTutIIRhdcfmBU+EvcFc9
	yxw75n1imF16sxoG/cXH8IlcmSbUIuetv4WKWYhFL2Bc7vbEA7oqJ6l+m/mhzRKao/Pq
	Rqj/JHpqQQjqQPF29136hiu3wx9I0GyE4gtnbmIl28C0OpihzeoKLZJCI+Gqd+uMvJAv
	NJ04JuFphc+t83nTpESeXCaqXbjmRttbToQNjz4Jzf+3IPFAUjXF5qJuS7itrSuQKfzU
	8inw==
X-Received: by 10.140.174.68 with SMTP id u65mr8281698qhu.62.1449101953011;
	Wed, 02 Dec 2015 16:19:13 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:12 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:47 -0500
Message-Id: <1449101933-24928-21-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::231
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 20/26] armv7m: observable initial register
	state
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
X-TUID: dYCqEL+kh9HF

At least for TI TM4C1294.
LR==-1
XPSR==0
PRIMASK, FAULTMASK, and BASEPRI all cleared
so exception handlers are unmasked.
STKALIGN set.
---
 target-arm/cpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 1fa1f96..8b85888 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -175,7 +175,10 @@ static void arm_cpu_reset(CPUState *s)
 
         env->v7m.exception_prio = env->v7m.pending_prio = 0x100;
 
-        env->daif &= ~PSTATE_I;
+        env->v7m.ccr = 1<<9; /* STKALIGN */
+
+        env->daif &= ~(PSTATE_I|PSTATE_F);
+        env->ZF = 1;
         rom = rom_ptr(0);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
@@ -194,6 +197,7 @@ static void arm_cpu_reset(CPUState *s)
         }
 
         env->regs[13] = initial_msp & 0xFFFFFFFC;
+        env->regs[14] = 0xffffffff;
         env->regs[15] = initial_pc & ~1;
         env->thumb = initial_pc & 1;
     }
-- 
2.1.4


Received: by 10.182.158.201 with SMTP id ww9csp3414724obb;
        Wed, 2 Dec 2015 16:25:40 -0800 (PST)
X-Received: by 10.140.217.211 with SMTP id n202mr8363807qhb.26.1449102340901;
        Wed, 02 Dec 2015 16:25:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b79si2826858qga.92.2015.12.02.16.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:25:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4HiO-0007dV-F4
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:25:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc6-0004It-Ne
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc5-00021M-U6
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:10 -0500
Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c]:33485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hc5-00021A-RA; Wed, 02 Dec 2015 19:19:09 -0500
Received: by qgea14 with SMTP id a14so48164112qge.0;
	Wed, 02 Dec 2015 16:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B+M56Zc26aeCYSSIuDQHIAUfg8O2B4TQeSl0TFSZ4K0=;
	b=Wb9nH7/N+VTmF4njsnWGZ6ilxXwvwquf6U2ai2a6cye6RVIJMkbLwijGmJxOE2T++p
	csor2BCujoRMG9oijXFc5Oj6/z1BrMUwuKazNFcGyTAgC/ZnXp2Kb4rHVbXgYV8dAjyF
	cPSzmuvyr4QYGUnmqXzUso4xc0i4UYNVKA4IwTrFFYLL8q+0ChjhR0LA/9HEAwmb5Odb
	q0IR616JurfrWmBuGXBNieOpG652djGG7aZDKAVP++vhoFHJ5IVmxTGALKbWMOSDiK7o
	ZVcUJM+Abh30dmLAKVk00n+ghRPYNl2C/HUz6WDQdU9rpkVV4jhYUVBDSUHNwzqX3Ywl
	mRWA==
X-Received: by 10.140.31.161 with SMTP id f30mr7625485qgf.95.1449101949470;
	Wed, 02 Dec 2015 16:19:09 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:09 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:41 -0500
Message-Id: <1449101933-24928-15-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::22c
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 14/26] armv7m: prevent unprivileged write to
	STIR
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
X-TUID: Buu9WPPq2Tip

Prevent unprivileged from writing to the
Software Triggered Interrupt register
---
 hw/intc/armv7m_nvic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 0f9ca6a..5731146 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -727,7 +727,9 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
                       "NVIC: Aux fault status registers unimplemented\n");
         break;
     case 0xf00: /* Software Triggered Interrupt Register */
-        if ((value & 0x1ff) < NVIC_MAX_IRQ) {
+        /* STIR write allowed if privlaged or USERSETMPEND set */
+        if ((arm_current_el(&cpu->env) || (cpu->env.v7m.ccr & 2))
+            && ((value & 0x1ff) < NVIC_MAX_IRQ)) {
             armv7m_nvic_set_pending(s, (value&0x1ff)+16);
         }
         break;
-- 
2.1.4


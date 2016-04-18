Received: by 10.25.208.194 with SMTP id h185csp1487791lfg;
        Mon, 18 Apr 2016 11:00:25 -0700 (PDT)
X-Received: by 10.55.163.13 with SMTP id m13mr11426606qke.75.1461002425604;
        Mon, 18 Apr 2016 11:00:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w6si41785670qge.10.2016.04.18.11.00.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Apr 2016 11:00:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@yandex.ru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=yandex.ru
Received: from localhost ([::1]:42895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1asDTF-0002Hr-8k
	for alex.bennee@linaro.org; Mon, 18 Apr 2016 14:00:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asDT9-0002Az-SQ
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 14:00:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>) id 1asDT6-0001uK-O9
	for qemu-arm@nongnu.org; Mon, 18 Apr 2016 14:00:19 -0400
Received: from forward20o.cmail.yandex.net ([37.9.109.219]:53022)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afarallax@yandex.ru>)
	id 1asDT6-0001tK-Dc; Mon, 18 Apr 2016 14:00:16 -0400
Received: from smtp4o.mail.yandex.net (smtp4o.mail.yandex.net [37.140.190.29])
	by forward20o.cmail.yandex.net (Yandex) with ESMTP id B7C1D21AA7;
	Mon, 18 Apr 2016 21:00:13 +0300 (MSK)
Received: from smtp4o.mail.yandex.net (localhost [127.0.0.1])
	by smtp4o.mail.yandex.net (Yandex) with ESMTP id 2597B2323A86;
	Mon, 18 Apr 2016 21:00:13 +0300 (MSK)
Received: by smtp4o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	xZMZYt1l2x-0CxeXEjJ; Mon, 18 Apr 2016 21:00:12 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1461002412; bh=QV6uZNSIyOUDALCFSQa+MO1iP+sqhlHK04VspKoBfH8=;
	h=From:To:Cc:Subject:Date:Message-Id:X-Mailer;
	b=vcJj6pHU/CDqLsGKW3HyII2WDjDhXiVj3N/pyDmJfDJOGf0fy+6vXtXX/vctB1Yv1
	+5EF/fSgioEeJSw/pKSvk6hEOgk/2jRENyymt0IoIlvDLqlh8MLPPUrHw6/Jztycfu
	ok0spXWy1nkk/wneDUaPTF7vxXXmjkxt+PhSd/3Q=
Authentication-Results: smtp4o.mail.yandex.net; dkim=pass header.i=@yandex.ru
X-Yandex-ForeignMX: US
X-Yandex-Suid-Status: 1 0,1 0,1 0,1 37377968
From: Sergey Sorokin <afarallax@yandex.ru>
To: qemu-devel@nongnu.org
Date: Mon, 18 Apr 2016 21:00:00 +0300
Message-Id: <1461002400-3187-1-git-send-email-afarallax@yandex.ru>
X-Mailer: git-send-email 1.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.9.109.219
Subject: [Qemu-arm] [PATCH] target-arm: Stage 2 permission fault was fixed
 in AArch32 state
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Sergey Sorokin <afarallax@yandex.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CQaCR+P5EeOL

As described in AArch32.CheckS2Permission an instruction fetch fails if
XN bit is set or there is no read permission for the address.

Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>
---
 target-arm/helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 09638b2..59efb90 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -6708,7 +6708,9 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn)
         prot |= PAGE_WRITE;
     }
     if (!xn) {
-        prot |= PAGE_EXEC;
+        if (arm_el_is_aa64(env, 2) || prot & PAGE_READ) {
+            prot |= PAGE_EXEC;
+        }
     }
     return prot;
 }
-- 
1.9.3


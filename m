Received: by 10.182.158.201 with SMTP id ww9csp692807obb;
        Wed, 9 Dec 2015 07:04:19 -0800 (PST)
X-Received: by 10.140.242.141 with SMTP id n135mr13614752qhc.59.1449673459839;
        Wed, 09 Dec 2015 07:04:19 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1si9219134qkl.107.2015.12.09.07.04.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 07:04:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36542 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6gHz-00087E-Bq
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 10:04:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rabin.vincent@axis.com>) id 1a6bxf-0004vn-SX
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 05:27:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rabin.vincent@axis.com>) id 1a6bxb-0003YI-PP
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 05:27:03 -0500
Received: from bes.se.axis.com ([195.60.68.10]:39247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rabin.vincent@axis.com>) id 1a6bxb-0003YE-JP
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 05:26:59 -0500
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 1A58F2E0FD;
	Wed,  9 Dec 2015 11:26:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 10+LSVXgcCmh; Wed,  9 Dec 2015 11:26:58 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 321BC2E10C;
	Wed,  9 Dec 2015 11:26:58 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 1870A1228;
	Wed,  9 Dec 2015 11:26:58 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 0BC2AC0;
	Wed,  9 Dec 2015 11:26:58 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 0850434269;
	Wed,  9 Dec 2015 11:26:58 +0100 (CET)
Received: from lnxrabinv.se.axis.com (10.88.144.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 9 Dec 2015 11:26:58 +0100
From: Rabin Vincent <rabin.vincent@axis.com>
To: <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2015 11:26:48 +0100
Message-ID: <1449656808-16570-2-git-send-email-rabinv@axis.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1449656808-16570-1-git-send-email-rabinv@axis.com>
References: <1449656808-16570-1-git-send-email-rabinv@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.60.68.10
X-Mailman-Approved-At: Wed, 09 Dec 2015 10:04:18 -0500
Cc: qemu-arm@nongnu.org, Rabin Vincent <rabinv@axis.com>
Subject: [Qemu-arm] [PATCH 2/2] a9mpcore: use watchdog
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
X-TUID: IW/xhyDl/lcJ

Use the watchdog variant of the MPCore timer for the watchdog block.

Signed-off-by: Rabin Vincent <rabinv@axis.com>
---
 hw/cpu/a9mpcore.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
index 869818c..9a5474b 100644
--- a/hw/cpu/a9mpcore.c
+++ b/hw/cpu/a9mpcore.c
@@ -36,7 +36,7 @@ static void a9mp_priv_initfn(Object *obj)
     object_initialize(&s->mptimer, sizeof(s->mptimer), TYPE_ARM_MPTIMER);
     qdev_set_parent_bus(DEVICE(&s->mptimer), sysbus_get_default());
 
-    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ARM_MPTIMER);
+    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ARM_MPTIMER_WDOG);
     qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
 }
 
-- 
1.7.10.4


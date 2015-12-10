Received: by 10.182.158.201 with SMTP id ww9csp384848obb;
        Thu, 10 Dec 2015 02:29:43 -0800 (PST)
X-Received: by 10.55.80.9 with SMTP id e9mr13349369qkb.94.1449743383235;
        Thu, 10 Dec 2015 02:29:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w74si199857qka.65.2015.12.10.02.29.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 02:29:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6yTm-0007ms-Ud
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 05:29:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a6yTk-0007lN-92
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:29:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1a6yTf-0007MG-Ii
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:29:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1a6yTf-0007Lx-Da; Thu, 10 Dec 2015 05:29:35 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 1340BC0A146C;
	Thu, 10 Dec 2015 10:29:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-204-39.brq.redhat.com
	[10.40.204.39])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAATX3I006051
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 10 Dec 2015 05:29:34 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 7D5813043914; Thu, 10 Dec 2015 11:29:32 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 10 Dec 2015 11:29:23 +0100
Message-Id: <1449743372-17169-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1449743372-17169-1-git-send-email-armbru@redhat.com>
References: <1449743372-17169-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH 03/12] arm_mptimer: Don't use hw_error() in
	realize() method
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
X-TUID: Me9+gdHUBx1M

Device realize() methods aren't supposed to call hw_error(), they
should set an error and fail cleanly.  Do that.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/timer/arm_mptimer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 3e59c2a..f1a34ec 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -220,8 +220,9 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
     int i;
 
     if (s->num_cpu < 1 || s->num_cpu > ARM_MPTIMER_MAX_CPUS) {
-        hw_error("%s: num-cpu must be between 1 and %d\n",
-                 __func__, ARM_MPTIMER_MAX_CPUS);
+        error_setg(errp, "num-cpu must be between 1 and %d\n",
+                   ARM_MPTIMER_MAX_CPUS);
+        return;
     }
     /* We implement one timer block per CPU, and expose multiple MMIO regions:
      *  * region 0 is "timer for this core"
-- 
2.4.3


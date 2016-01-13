Received: by 10.25.159.19 with SMTP id i19csp1201059lfe;
        Wed, 13 Jan 2016 07:52:36 -0800 (PST)
X-Received: by 10.140.19.43 with SMTP id 40mr130145101qgg.72.1452700350591;
        Wed, 13 Jan 2016 07:52:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13si1881452qkb.79.2016.01.13.07.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Jan 2016 07:52:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37765 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJNio-0004h3-7I
	for alex.bennee@linaro.org; Wed, 13 Jan 2016 10:52:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aJNaQ-000447-Gu
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 10:43:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1aJNaL-00015d-E2
	for qemu-arm@nongnu.org; Wed, 13 Jan 2016 10:43:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59354)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1aJNaL-00015J-8w; Wed, 13 Jan 2016 10:43:45 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id D4E1D552E7;
	Wed, 13 Jan 2016 15:43:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-28.phx2.redhat.com
	[10.3.113.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0DFhgbH015875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 13 Jan 2016 10:43:44 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C7D76300383E; Wed, 13 Jan 2016 16:43:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 13 Jan 2016 16:43:04 +0100
Message-Id: <1452699819-26608-7-git-send-email-armbru@redhat.com>
In-Reply-To: <1452699819-26608-1-git-send-email-armbru@redhat.com>
References: <1452699819-26608-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PULL 06/41] arm_mptimer: Don't use hw_error() in
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
X-TUID: JVWy7z0L3XyM

Device realize() methods aren't supposed to call hw_error(), they
should set an error and fail cleanly.  Do that.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <1450370121-5768-4-git-send-email-armbru@redhat.com>
---
 hw/timer/arm_mptimer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 3e59c2a..5dfab66 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -220,8 +220,9 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
     int i;
 
     if (s->num_cpu < 1 || s->num_cpu > ARM_MPTIMER_MAX_CPUS) {
-        hw_error("%s: num-cpu must be between 1 and %d\n",
-                 __func__, ARM_MPTIMER_MAX_CPUS);
+        error_setg(errp, "num-cpu must be between 1 and %d",
+                   ARM_MPTIMER_MAX_CPUS);
+        return;
     }
     /* We implement one timer block per CPU, and expose multiple MMIO regions:
      *  * region 0 is "timer for this core"
-- 
2.4.3


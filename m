Received: by 10.80.163.71 with SMTP id 65csp1572755edn;
        Wed, 21 Sep 2016 13:14:10 -0700 (PDT)
X-Received: by 10.237.46.226 with SMTP id k89mr33602929qtd.146.1474488850606;
        Wed, 21 Sep 2016 13:14:10 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id v188si26784782qka.6.2016.09.21.13.14.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Sep 2016 13:14:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54130 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bmntt-0004cJ-4Z
	for alex.bennee@linaro.org; Wed, 21 Sep 2016 16:13:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bmntn-0004a9-5i
	for qemu-arm@nongnu.org; Wed, 21 Sep 2016 16:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bmnti-0002IG-Us
	for qemu-arm@nongnu.org; Wed, 21 Sep 2016 16:13:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1bmnti-0002I5-Or; Wed, 21 Sep 2016 16:13:38 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05A07A1007;
	Wed, 21 Sep 2016 20:13:38 +0000 (UTC)
Received: from javelin.localdomain (vpn1-51-172.bne.redhat.com [10.64.51.172])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8LKDTLa011744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 21 Sep 2016 16:13:33 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Thu, 22 Sep 2016 01:43:27 +0530
Message-Id: <1474488807-451-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 21 Sep 2016 20:13:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] timer: a9gtimer: check auto-increment register
 value
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
	Li Qiang <liqiang6-s@360.cn>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n5QL0Ky2TuxK

From: Prasad J Pandit <pjp@fedoraproject.org>

ARM A9MP processor has a peripheral timer with an auto-increment
register, which holds an increment step value. A user could set
this value to zero, when auto-increment control bit is enabled.
This leads to an infinite loop in 'a9_gtimer_update' while
updating comparator value. Add check to avoid it.

Reported-by: Li Qiang <liqiang6-s@360.cn>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/timer/a9gtimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 772f85f..3f752ce 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -85,7 +85,7 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
             while (gtb->compare < update.new) {
                 DB_PRINT("Compare event happened for CPU %d\n", i);
                 gtb->status = 1;
-                if (gtb->control & R_CONTROL_AUTO_INCREMENT) {
+                if (gtb->inc && gtb->control & R_CONTROL_AUTO_INCREMENT) {
                     DB_PRINT("Auto incrementing timer compare by %" PRId32 "\n",
                              gtb->inc);
                     gtb->compare += gtb->inc;
-- 
2.5.5


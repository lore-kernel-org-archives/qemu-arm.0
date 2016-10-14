Received: by 10.80.166.35 with SMTP id d32csp74308edc;
        Thu, 13 Oct 2016 20:44:11 -0700 (PDT)
X-Received: by 10.55.25.211 with SMTP id 80mr9638055qkz.230.1476416651154;
        Thu, 13 Oct 2016 20:44:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w65si8489160qkg.266.2016.10.13.20.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Oct 2016 20:44:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44800 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1butPm-0002TH-Ex
	for alex.bennee@linaro.org; Thu, 13 Oct 2016 23:44:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38172)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1butPi-0002RI-FD
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 23:44:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1butPe-0006kX-CU
	for qemu-arm@nongnu.org; Thu, 13 Oct 2016 23:44:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1butPe-0006kS-6W; Thu, 13 Oct 2016 23:44:02 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 281513D95F;
	Fri, 14 Oct 2016 03:44:01 +0000 (UTC)
Received: from javelin.localdomain (vpn1-4-151.sin2.redhat.com [10.67.4.151])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u9E3hsPm012921
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 13 Oct 2016 23:43:56 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Fri, 14 Oct 2016 09:13:51 +0530
Message-Id: <1476416631-2870-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 14 Oct 2016 03:44:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6] timer: a9gtimer: remove loop to
 auto-increment comparator
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	Li Qiang <liqiang6-s@360.cn>, Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: niW6y61IB4Vw

From: Prasad J Pandit <pjp@fedoraproject.org>

ARM A9MP processor has a peripheral timer with an auto-increment
register, which holds an increment step value. A user could set
this value to zero. When auto-increment control bit is enabled,
it leads to an infinite loop in 'a9_gtimer_update' while
updating comparator value. Remove this loop incrementing the
comparator value.

Reported-by: Li Qiang <liqiang6-s@360.cn>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/timer/a9gtimer.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

Update per
  -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg02891.html

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 772f85f..03dfaf2 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -73,6 +73,7 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
 
     A9GTimerUpdate update = a9_gtimer_get_update(s);
     int i;
+    uint64_t inc;
     int64_t next_cdiff = 0;
 
     for (i = 0; i < s->num_cpu; ++i) {
@@ -82,15 +83,15 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
         if ((s->control & R_CONTROL_TIMER_ENABLE) &&
                 (gtb->control & R_CONTROL_COMP_ENABLE)) {
             /* R2p0+, where the compare function is >= */
-            while (gtb->compare < update.new) {
+            if (gtb->compare < update.new) {
                 DB_PRINT("Compare event happened for CPU %d\n", i);
                 gtb->status = 1;
-                if (gtb->control & R_CONTROL_AUTO_INCREMENT) {
-                    DB_PRINT("Auto incrementing timer compare by %" PRId32 "\n",
-                             gtb->inc);
-                    gtb->compare += gtb->inc;
-                } else {
-                    break;
+                if (gtb->control & R_CONTROL_AUTO_INCREMENT && gtb->inc) {
+                    inc = update.new + gtb->inc - gtb->compare - 1;
+                    inc = QEMU_ALIGN_DOWN(inc, gtb->inc);
+                    DB_PRINT("Auto incrementing timer compare by %"
+                                                        PRId64 "\n", inc);
+                    gtb->compare += inc;
                 }
             }
             cdiff = (int64_t)gtb->compare - (int64_t)update.new + 1;
-- 
2.5.5


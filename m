Received: by 10.80.166.35 with SMTP id d32csp637735edc;
        Mon, 17 Oct 2016 12:46:27 -0700 (PDT)
X-Received: by 10.55.150.70 with SMTP id y67mr28413486qkd.89.1476733587360;
        Mon, 17 Oct 2016 12:46:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e26si18770865qtc.130.2016.10.17.12.46.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Oct 2016 12:46:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwDre-000809-QL
	for alex.bennee@linaro.org; Mon, 17 Oct 2016 15:46:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54935)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwDfO-0005JV-TC
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 15:33:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bwDfL-0005Lv-HQ
	for qemu-arm@nongnu.org; Mon, 17 Oct 2016 15:33:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36220)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ppandit@redhat.com>)
	id 1bwDfL-0005LW-Bb; Mon, 17 Oct 2016 15:33:43 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D031C05678C;
	Mon, 17 Oct 2016 19:33:42 +0000 (UTC)
Received: from javelin (vpn1-48-133.bne.redhat.com [10.64.48.133])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9HJXY3N012098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 17 Oct 2016 15:33:38 -0400
Date: Tue, 18 Oct 2016 01:03:33 +0530 (IST)
From: P J P <ppandit@redhat.com>
X-X-Sender: pjp@javelin
To: Qemu Developers <qemu-devel@nongnu.org>
Message-ID: <alpine.LFD.2.20.1610180059230.11219@wniryva>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 17 Oct 2016 19:33:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v7] timer: a9gtimer: remove loop to
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
	Li Qiang <liqiang6-s@360.cn>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7txDy01LPmVO


===
From 632498fa33248bb990b08f246c98f3f318aa631c Mon Sep 17 00:00:00 2001
From: Prasad J Pandit <pjp@fedoraproject.org>
Date: Mon, 17 Oct 2016 23:56:01 +0530
Subject: [PATCH v7] timer: a9gtimer: remove loop to auto-increment comparator

ARM A9MP processor has a peripheral timer with an auto-increment
register, which holds an increment step value. A user could set
this value to zero. When auto-increment control bit is enabled,
it leads to an infinite loop in 'a9_gtimer_update' while
updating comparator value. Remove this loop incrementing the
comparator value.

Reported-by: Li Qiang <liqiang6-s@360.cn>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
  hw/timer/a9gtimer.c | 14 +++++++-------
  1 file changed, 7 insertions(+), 7 deletions(-)

Use QEMU_ALIGN_UP instead of QEMU_ALIGN_DOWN
   -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg03788.html

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 772f85f..ce1dc63 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -82,15 +82,15 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
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
+                    uint64_t inc =
+                        QEMU_ALIGN_UP(update.new - gtb->compare, gtb->inc);
+                    DB_PRINT("Auto incrementing timer compare by %"
+                                                        PRId64 "\n", inc);
+                    gtb->compare += inc;
                  }
              }
              cdiff = (int64_t)gtb->compare - (int64_t)update.new + 1;
-- 
2.7.4
===


Sorry about inline text here, git send-email is showing an error about CA path

   CA path "'/etc/mail/'" does not exist at /usr/libexec/git-core/git-send-email line 1220

trying to fix it.

Thank you.
--
Prasad J Pandit / Red Hat Product Security Team
47AF CE69 3A90 54AA 9045 1053 DD13 3D32 FE5B 041F

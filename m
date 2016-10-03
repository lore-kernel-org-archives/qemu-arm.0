Received: by 10.80.163.71 with SMTP id 65csp1448522edn;
        Mon, 3 Oct 2016 02:05:18 -0700 (PDT)
X-Received: by 10.237.55.232 with SMTP id j95mr19896341qtb.131.1475485518530;
        Mon, 03 Oct 2016 02:05:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c12si2847574qka.128.2016.10.03.02.05.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Oct 2016 02:05:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35377 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqzBV-0007IB-Ca
	for alex.bennee@linaro.org; Mon, 03 Oct 2016 05:05:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bqzBR-0007Gk-1F
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 05:05:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bqzBK-0004aI-4S
	for qemu-arm@nongnu.org; Mon, 03 Oct 2016 05:05:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34472)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1bqzBJ-0004Zq-Tp; Mon, 03 Oct 2016 05:05:06 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3D098B977;
	Mon,  3 Oct 2016 09:05:03 +0000 (UTC)
Received: from javelin.localdomain ([10.65.148.59])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9394wiX015371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 3 Oct 2016 05:05:00 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Mon,  3 Oct 2016 14:34:56 +0530
Message-Id: <1475485496-21168-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 03 Oct 2016 09:05:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3] timer: a9gtimer: remove loop to
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
X-TUID: NEf64uTMOuVf

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
 hw/timer/a9gtimer.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

Update per:
  -> https://lists.gnu.org/archive/html/qemu-devel/2016-10/msg00079.html

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 772f85f..add2f31 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -73,6 +73,7 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
 
     A9GTimerUpdate update = a9_gtimer_get_update(s);
     int i;
+    uint64_t inc;
     int64_t next_cdiff = 0;
 
     for (i = 0; i < s->num_cpu; ++i) {
@@ -82,16 +83,15 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
         if ((s->control & R_CONTROL_TIMER_ENABLE) &&
                 (gtb->control & R_CONTROL_COMP_ENABLE)) {
             /* R2p0+, where the compare function is >= */
-            while (gtb->compare < update.new) {
+            if (gtb->compare < update.new
+                && gtb->control & R_CONTROL_AUTO_INCREMENT) {
                 DB_PRINT("Compare event happened for CPU %d\n", i);
                 gtb->status = 1;
-                if (gtb->control & R_CONTROL_AUTO_INCREMENT) {
-                    DB_PRINT("Auto incrementing timer compare by %" PRId32 "\n",
-                             gtb->inc);
-                    gtb->compare += gtb->inc;
-                } else {
-                    break;
-                }
+                inc = update.new - gtb->compare - 1;
+                inc = gtb->inc ? QEMU_ALIGN_DOWN(inc, gtb->inc) : 0;
+                DB_PRINT("Auto incrementing timer compare by %"
+                                                    PRId64 "\n", inc);
+                gtb->compare += inc;
             }
             cdiff = (int64_t)gtb->compare - (int64_t)update.new + 1;
             if (cdiff > 0 && (cdiff < next_cdiff || !next_cdiff)) {
-- 
2.5.5


Received: by 10.80.163.71 with SMTP id 65csp265966edn;
        Wed, 28 Sep 2016 02:21:49 -0700 (PDT)
X-Received: by 10.55.166.81 with SMTP id p78mr32160374qke.18.1475054509740;
        Wed, 28 Sep 2016 02:21:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3si4537517qkd.105.2016.09.28.02.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Sep 2016 02:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpB3l-0006o0-5D
	for alex.bennee@linaro.org; Wed, 28 Sep 2016 05:21:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bpAz6-0002hq-MK
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 05:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ppandit@redhat.com>) id 1bpAz2-0004kp-Fo
	for qemu-arm@nongnu.org; Wed, 28 Sep 2016 05:16:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37442)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ppandit@redhat.com>)
	id 1bpAz2-0004kc-8k; Wed, 28 Sep 2016 05:16:56 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 139657EA91;
	Wed, 28 Sep 2016 09:16:55 +0000 (UTC)
Received: from javelin.localdomain (vpn-234-75.phx2.redhat.com [10.3.234.75])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u8S9Goou005199
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 28 Sep 2016 05:16:52 -0400
From: P J P <ppandit@redhat.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Wed, 28 Sep 2016 14:46:48 +0530
Message-Id: <1475054208-20288-1-git-send-email-ppandit@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 28 Sep 2016 09:16:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2] timer: a9gtimer: check auto-increment
 register value
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
X-TUID: SWlVBP+FwutP

From: Prasad J Pandit <pjp@fedoraproject.org>

ARM A9MP processor has a peripheral timer with an auto-increment
register, which holds an increment step value. A user could set
this value to zero, when auto-increment control bit is enabled.
This leads to an infinite loop in 'a9_gtimer_update' while
updating comparator value. Remove the loop incrementing the
comparator value; Add check to avoid value zero.

Reported-by: Li Qiang <liqiang6-s@360.cn>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/timer/a9gtimer.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

Update per
  -> https://lists.gnu.org/archive/html/qemu-devel/2016-09/msg05682.html

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index 772f85f..021ae59 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -72,7 +72,7 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
 {
 
     A9GTimerUpdate update = a9_gtimer_get_update(s);
-    int i;
+    uint32_t i, inc;
     int64_t next_cdiff = 0;
 
     for (i = 0; i < s->num_cpu; ++i) {
@@ -82,16 +82,14 @@ static void a9_gtimer_update(A9GTimerState *s, bool sync)
         if ((s->control & R_CONTROL_TIMER_ENABLE) &&
                 (gtb->control & R_CONTROL_COMP_ENABLE)) {
             /* R2p0+, where the compare function is >= */
-            while (gtb->compare < update.new) {
-                DB_PRINT("Compare event happened for CPU %d\n", i);
-                gtb->status = 1;
-                if (gtb->control & R_CONTROL_AUTO_INCREMENT) {
-                    DB_PRINT("Auto incrementing timer compare by %" PRId32 "\n",
-                             gtb->inc);
-                    gtb->compare += gtb->inc;
-                } else {
-                    break;
-                }
+            DB_PRINT("Compare event happened for CPU %d\n", i);
+            gtb->status = 1;
+            if (gtb->control & R_CONTROL_AUTO_INCREMENT
+                && gtb->compare < update.new) {
+                inc = ((update.new - gtb->compare - 1) / gtb->inc) * gtb->inc;
+                DB_PRINT("Auto incrementing timer compare by %"
+                                                            PRId32 "\n", inc);
+                gtb->compare += inc;
             }
             cdiff = (int64_t)gtb->compare - (int64_t)update.new + 1;
             if (cdiff > 0 && (cdiff < next_cdiff || !next_cdiff)) {
@@ -210,7 +208,7 @@ static void a9_gtimer_write(void *opaque, hwaddr addr, uint64_t value,
         gtb->compare = deposit64(gtb->compare, shift, 32, value);
         break;
     case R_AUTO_INCREMENT:
-        gtb->inc = value;
+        gtb->inc = value ? value : 1;
         return;
     default:
         return;
-- 
2.5.5


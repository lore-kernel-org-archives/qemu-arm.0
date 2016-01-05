Received: by 10.182.158.201 with SMTP id ww9csp10897362obb;
        Mon, 4 Jan 2016 18:38:45 -0800 (PST)
X-Received: by 10.141.5.136 with SMTP id h130mr125099434qhd.47.1451961525328;
        Mon, 04 Jan 2016 18:38:45 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si104508832qka.74.2016.01.04.18.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jan 2016 18:38:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGHWH-0006DW-2h
	for alex.bennee@linaro.org; Mon, 04 Jan 2016 21:38:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGHUo-0003KI-1W
	for qemu-devel@nongnu.org; Mon, 04 Jan 2016 21:37:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGHUk-000142-Os
	for qemu-devel@nongnu.org; Mon, 04 Jan 2016 21:37:13 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aGHUk-00013v-Hs; Mon, 04 Jan 2016 21:37:10 -0500
Received: by mail-lf0-x242.google.com with SMTP id p203so29300133lfa.3;
	Mon, 04 Jan 2016 18:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZeIEEywtBcn9OdY+lpVaHAyNDxFRSjSNblycdFkVZ5Y=;
	b=pZzLRlWzvwO5fcypm7HZB5+Y54FhblhqGvV5kwcoVdzyPTmRE57y84DqTNctEG7+Ak
	AqL63ajiuknrDxpVBkbXBGL3dWNRVFkKIs/mO5r/5bpVOoyBCO11gBfs/HAaCqIouAkS
	xyg+xjTKuWVMaJ8SmP/PCNMy7SqIhx/42IGvhA2uFF9rNC4zdPMf5JIU8gdXNFfQ8AFA
	1xutdGOlba2oheXtYT31tqDSkgf6jwZLcM5qKski666aqZcCFAiP33KGKvBVkwJsGqz5
	XpRx/fTs88JxUeZagbadF9VxbireIzeF9jwDdnjhujT8+TlDgnTi0Eq64l+sQxJn5lLw
	m5NA==
X-Received: by 10.25.154.9 with SMTP id c9mr26373583lfe.79.1451961429834;
	Mon, 04 Jan 2016 18:37:09 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	d2sm16008201lbc.11.2016.01.04.18.37.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jan 2016 18:37:09 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Tue,  5 Jan 2016 05:33:27 +0300
Message-Id: <004073b3af0a56899f9a07e3f6b00167359322e6.1451960508.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1451960508.git.digetx@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
In-Reply-To: <cover.1451960508.git.digetx@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v8 2/4] hw/ptimer: Perform tick and counter
	wrap around if timer already expired
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
X-TUID: IQ0jhME10VLi

ptimer_get_count() might be called while QEMU timer already been expired.
In that case ptimer would return counter = 0, which might be undesirable
in case of polled timer. Do counter wrap around for periodic timer to keep
it distributed.

In addition, there is no reason to keep expired timer tick deferred, so
just perform the tick from ptimer_get_count().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 035af97..96a6c7a 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -85,15 +85,21 @@ static void ptimer_tick(void *opaque)
 
 uint64_t ptimer_get_count(ptimer_state *s)
 {
+    int enabled = s->enabled;
     int64_t now;
+    int64_t next;
     uint64_t counter;
+    int expired;
+    int oneshot;
 
-    if (s->enabled) {
+    if (enabled) {
         now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        next = s->next_event;
+        expired = (now - next >= 0);
+        oneshot = (enabled == 2);
         /* Figure out the current counter value.  */
-        if (now - s->next_event > 0
-            || s->period == 0) {
-            /* Prevent timer underflowing if it should already have
+        if (s->period == 0 || (expired && oneshot)) {
+            /* Prevent one-shot timer underflowing if it should already have
                triggered.  */
             counter = 0;
         } else {
@@ -114,12 +120,12 @@ uint64_t ptimer_get_count(ptimer_state *s)
                backwards.
             */
 
-            if ((s->enabled == 1) && (s->limit * period < 10000)) {
+            if (!oneshot && (s->limit * period < 10000)) {
                 period = 10000 / s->limit;
                 period_frac = 0;
             }
 
-            rem = s->next_event - now;
+            rem = expired ? now - next : next - now;
             div = period;
 
             clz1 = clz64(rem);
@@ -139,6 +145,23 @@ uint64_t ptimer_get_count(ptimer_state *s)
                     div += 1;
             }
             counter = rem / div;
+
+            if (expired) {
+                /* Wrap around periodic counter.  */
+                counter = s->delta = s->limit - counter % s->limit;
+            }
+        }
+
+        if (expired) {
+            if (oneshot) {
+                ptimer_tick(s);
+            } else {
+                /* Don't use ptimer_tick() for the periodic timer since it
+                 * would reset the delta value.
+                 */
+                ptimer_trigger(s);
+                ptimer_reload(s);
+            }
         }
     } else {
         counter = s->delta;
-- 
2.6.4


Received: by 10.182.158.201 with SMTP id ww9csp10897009obb;
        Mon, 4 Jan 2016 18:37:46 -0800 (PST)
X-Received: by 10.55.31.95 with SMTP id f92mr83415247qkf.50.1451961466146;
        Mon, 04 Jan 2016 18:37:46 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b74si47206296qhc.16.2016.01.04.18.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jan 2016 18:37:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGHVJ-000437-SO
	for alex.bennee@linaro.org; Mon, 04 Jan 2016 21:37:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58090)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGHUg-00037u-J9
	for qemu-devel@nongnu.org; Mon, 04 Jan 2016 21:37:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aGHUf-00013L-Dq
	for qemu-devel@nongnu.org; Mon, 04 Jan 2016 21:37:06 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:36634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aGHUf-00013D-2C; Mon, 04 Jan 2016 21:37:05 -0500
Received: by mail-lb0-x242.google.com with SMTP id ti8so18125789lbb.3;
	Mon, 04 Jan 2016 18:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=WGaeWLVWcDsS892isfVmXb2zj1T4/KlYqSdil1vPVDM=;
	b=RP1QEtnOfK/ycdXlJkpj83+kQ428IHcHPmZzXO+p/DnrNunf1/3Y973SewUUPHZJ7v
	8X80MQW4zrJK420panHnVvfBsbDK2oD3nBoBx5oR6GB2bukjZ8Q+u63sZxMIBT1G9cYF
	hcQjfe/ePE8BA1ogTV5tqHj6cmmFdGdTFkqJI5ku634kvYiRtJoLcwHAdcJLr4WqwTo6
	dh3K/t6nn5izA747re0Uzpn2PPRU5sdi3D4/0VYbB3W2v0ih9/R5rv4VFZRQPg9CecmI
	9EEhDqnaJ3Xj5n2G0jvD+iRYrEebfXsl/DvhoQLQHkmG9ww1l8JOHPrXBO7cnoDBhMqZ
	FLSg==
X-Received: by 10.112.146.67 with SMTP id ta3mr14953179lbb.98.1451961424326;
	Mon, 04 Jan 2016 18:37:04 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	d2sm16008201lbc.11.2016.01.04.18.37.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jan 2016 18:37:03 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Tue,  5 Jan 2016 05:33:26 +0300
Message-Id: <32ced3aba243ebfac3f1db6e9f8bc820c2302cfa.1451960508.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1451960508.git.digetx@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
In-Reply-To: <cover.1451960508.git.digetx@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v8 1/4] hw/ptimer: Fix issues caused by the
	adjusted timer limit value
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
X-TUID: JcPEwOZBjZH4

Multiple issues here related to the timer with a adjusted .limit value:

1) ptimer_get_count() returns incorrect counter value for the disabled
timer after loading the counter with a small value, because adjusted limit
value is used instead of the original.

For instance:
    1) ptimer_stop(t)
    2) ptimer_set_period(t, 1)
    3) ptimer_set_limit(t, 0, 1)
    4) ptimer_get_count(t) <-- would return 10000 instead of 0

2) ptimer_get_count() might return incorrect value for the timer running
with a adjusted limit value.

For instance:
    1) ptimer_stop(t)
    2) ptimer_set_period(t, 1)
    3) ptimer_set_limit(t, 10, 1)
    4) ptimer_run(t)
    5) ptimer_get_count(t) <-- might return value > 10

3) Neither ptimer_set_period() nor ptimer_set_freq() are adjusting the
limit value, so it is still possible to make timer timeout value
arbitrary small.

For instance:
    1) ptimer_set_period(t, 10000)
    2) ptimer_set_limit(t, 1, 0)
    3) ptimer_set_period(t, 1) <-- bypass limit correction

Fix all of the above issues by adjusting timer period instead of the limit.
Do the adjust for periodic timer only.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 59 ++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index edf077c..035af97 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -34,20 +34,39 @@ static void ptimer_trigger(ptimer_state *s)
 
 static void ptimer_reload(ptimer_state *s)
 {
-    if (s->delta == 0) {
+    uint32_t period_frac = s->period_frac;
+    uint64_t period = s->period;
+    uint64_t delta = s->delta;
+    uint64_t limit = s->limit;
+
+    if (delta == 0) {
         ptimer_trigger(s);
-        s->delta = s->limit;
+        delta = limit;
     }
-    if (s->delta == 0 || s->period == 0) {
+    if (delta == 0 || period == 0) {
         fprintf(stderr, "Timer with period zero, disabling\n");
         s->enabled = 0;
         return;
     }
 
+    /*
+     * Artificially limit timeout rate to something
+     * achievable under QEMU.  Otherwise, QEMU spends all
+     * its time generating timer interrupts, and there
+     * is no forward progress.
+     * About ten microseconds is the fastest that really works
+     * on the current generation of host machines.
+     */
+
+    if ((s->enabled == 1) && (limit * period < 10000)) {
+        period = 10000 / limit;
+        period_frac = 0;
+    }
+
     s->last_event = s->next_event;
-    s->next_event = s->last_event + s->delta * s->period;
-    if (s->period_frac) {
-        s->next_event += ((int64_t)s->period_frac * s->delta) >> 32;
+    s->next_event = s->last_event + delta * period;
+    if (period_frac) {
+        s->next_event += ((int64_t)period_frac * delta) >> 32;
     }
     timer_mod(s->timer, s->next_event);
 }
@@ -82,6 +101,8 @@ uint64_t ptimer_get_count(ptimer_state *s)
             uint64_t div;
             int clz1, clz2;
             int shift;
+            uint32_t period_frac = s->period_frac;
+            uint64_t period = s->period;
 
             /* We need to divide time by period, where time is stored in
                rem (64-bit integer) and period is stored in period/period_frac
@@ -93,8 +114,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
                backwards.
             */
 
+            if ((s->enabled == 1) && (s->limit * period < 10000)) {
+                period = 10000 / s->limit;
+                period_frac = 0;
+            }
+
             rem = s->next_event - now;
-            div = s->period;
+            div = period;
 
             clz1 = clz64(rem);
             clz2 = clz64(div);
@@ -103,13 +129,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
             rem <<= shift;
             div <<= shift;
             if (shift >= 32) {
-                div |= ((uint64_t)s->period_frac << (shift - 32));
+                div |= ((uint64_t)period_frac << (shift - 32));
             } else {
                 if (shift != 0)
-                    div |= (s->period_frac >> (32 - shift));
+                    div |= (period_frac >> (32 - shift));
                 /* Look at remaining bits of period_frac and round div up if 
                    necessary.  */
-                if ((uint32_t)(s->period_frac << shift))
+                if ((uint32_t)(period_frac << shift))
                     div += 1;
             }
             counter = rem / div;
@@ -181,19 +207,6 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
    count = limit.  */
 void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
 {
-    /*
-     * Artificially limit timeout rate to something
-     * achievable under QEMU.  Otherwise, QEMU spends all
-     * its time generating timer interrupts, and there
-     * is no forward progress.
-     * About ten microseconds is the fastest that really works
-     * on the current generation of host machines.
-     */
-
-    if (!use_icount && limit * s->period < 10000 && s->period) {
-        limit = 10000 / s->period;
-    }
-
     s->limit = limit;
     if (reload)
         s->delta = limit;
-- 
2.6.4


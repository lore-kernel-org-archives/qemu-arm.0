Received: by 10.25.159.19 with SMTP id i19csp3909701lfe;
        Thu, 21 Jan 2016 11:07:12 -0800 (PST)
X-Received: by 10.140.32.194 with SMTP id h60mr53752762qgh.79.1453403232235;
        Thu, 21 Jan 2016 11:07:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m63si2668861qki.63.2016.01.21.11.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 11:07:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMKZb-00034K-LJ
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 14:07:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXK-0007RP-0R
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXE-0001BV-Vu
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:49 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:33140)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aMKXE-0001Ao-GG; Thu, 21 Jan 2016 14:04:44 -0500
Received: by mail-lb0-x242.google.com with SMTP id bc4so2468926lbc.0;
	Thu, 21 Jan 2016 11:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RuhKooUwWaX/mdb/Qr/6/JnETltw2V9QP8ougOQBvK8=;
	b=JNFkmLiqZIXPtusk8BxeYijtXuX83bHVu6uJxdpEYvBh/pZMxZJRyb5EEJy0y/Ta8T
	/cZaFMCXyfGvHEhCotS3ae/WhNOmQ7Iz92f78qcehWTMYxdYmRwc7j1CHpJWZxohjRK2
	Gkt+Oc0oo+AaouF8aHTLRL0quvyNlAJL8sSlAcCTdmCgchZ1KGWAHgLNy19UnC2RZ9x+
	g2b3bVYsRB3NZD6kM3AAQIqsXOT99N9CyOUjx8sSm9Ab307MdYB69oDNZXvewSmHreBU
	ePLUr1txCz5pjc6jaAZUZDzBf6hDvExYBZgQ5zZH3VamgsvxalZp7vvJljaMewwFV+lK
	FfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=RuhKooUwWaX/mdb/Qr/6/JnETltw2V9QP8ougOQBvK8=;
	b=E3wDZJi/z+MaJI+v/UHC/XLf4LqSSDSqdcXbIdA9yexiTykTrJ56socoimy54QWs/w
	buL4mr3Vt+i3+A5sTaUX2l3dyhNELjlYyXbgcTGVsW6xaJTqJO3W3Uayy9vgB1AzVnsO
	nekPbQxJJOGvXZ0CAjvcmPm3C/2BVHFH6IQIPUcBGTWsaCCwqsWVmJ6oElQKjICfRvlZ
	CQ+zng31A6Hnty5KXPHpY8XfiC/sivvT4z5Hrzy53nLeM+bHa2/zFTlvWcUIBRZykQc/
	zieHbQahh6neXlSY8DvLhwnrKl4cGqTkgo4aBSOgukB5Wv9CYVVh4BnH0CCOSGvd24Pm
	/Zdg==
X-Gm-Message-State: ALoCoQlaYPLEvRongjhSsK788aU23zwBXO24/Q1/499s/vPNpkEOZShRDpbzaqFdDUSAeV+/jbL/3F4DYPDghvRPIBXBK4wXqw==
X-Received: by 10.112.63.161 with SMTP id h1mr15936421lbs.61.1453403083525;
	Thu, 21 Jan 2016 11:04:43 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163])
	by smtp.gmail.com with ESMTPSA id m21sm382496lfe.29.2016.01.21.11.04.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 11:04:43 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jan 2016 22:03:44 +0300
Message-Id: <73f8fa42b0af75594a2ec6a2fa13cf5d21fd2703.1453402860.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v11 1/7] hw/ptimer: Fix issues caused by the
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
X-TUID: IA5yXX7AoIBy

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
Perform the adjustment for periodic timer only. Use the delta value instead
of the limit to make decision whether adjustment is required, as limit could
be altered while timer is running, resulting in incorrect value returned by
ptimer_get_count.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c | 51 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index edf077c..6dc1677 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -34,6 +34,9 @@ static void ptimer_trigger(ptimer_state *s)
 
 static void ptimer_reload(ptimer_state *s)
 {
+    uint32_t period_frac = s->period_frac;
+    uint64_t period = s->period;
+
     if (s->delta == 0) {
         ptimer_trigger(s);
         s->delta = s->limit;
@@ -44,10 +47,24 @@ static void ptimer_reload(ptimer_state *s)
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
+    if ((s->enabled == 1) && (s->delta * period < 10000) && !use_icount) {
+        period = 10000 / s->delta;
+        period_frac = 0;
+    }
+
     s->last_event = s->next_event;
-    s->next_event = s->last_event + s->delta * s->period;
-    if (s->period_frac) {
-        s->next_event += ((int64_t)s->period_frac * s->delta) >> 32;
+    s->next_event = s->last_event + s->delta * period;
+    if (period_frac) {
+        s->next_event += ((int64_t)period_frac * s->delta) >> 32;
     }
     timer_mod(s->timer, s->next_event);
 }
@@ -82,6 +99,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
             uint64_t div;
             int clz1, clz2;
             int shift;
+            uint32_t period_frac = s->period_frac;
+            uint64_t period = s->period;
+
+            if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
+                period = 10000 / s->delta;
+                period_frac = 0;
+            }
 
             /* We need to divide time by period, where time is stored in
                rem (64-bit integer) and period is stored in period/period_frac
@@ -94,7 +118,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
             */
 
             rem = s->next_event - now;
-            div = s->period;
+            div = period;
 
             clz1 = clz64(rem);
             clz2 = clz64(div);
@@ -103,13 +127,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
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
@@ -181,19 +205,6 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
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
2.7.0


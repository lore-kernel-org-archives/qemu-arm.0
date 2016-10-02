Received: by 10.80.163.71 with SMTP id 65csp1175422edn;
        Sun, 2 Oct 2016 09:20:35 -0700 (PDT)
X-Received: by 10.237.37.189 with SMTP id x58mr14668762qtc.148.1475425235619;
        Sun, 02 Oct 2016 09:20:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m189si18483789qkd.39.2016.10.02.09.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60060 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjVD-0001gb-1f
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:20:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC4-0002h2-3z
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 12:00:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjC2-0003JX-Ff
	for qemu-arm@nongnu.org; Sun, 02 Oct 2016 12:00:47 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjBx-0003G6-K4; Sun, 02 Oct 2016 12:00:42 -0400
Received: by mail-lf0-x244.google.com with SMTP id b75so429180lfg.3;
	Sun, 02 Oct 2016 09:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=jQJXwzutTf4ZTTAydX4wOGD58j0DPnB2rdPv8Yyub9Q=;
	b=kO3sbE03NkWWvr2dykMRyZ6sYar8HgfA6mmWCzuHusO5an6SU6QIrnVAzxLomgXQne
	pRWYAAJ5MyC1dYRbMOsUCFn002M8PXtT9r49M6M5sK7RYSgBO5b4DdWAIeqXFWaKgFCh
	1Jjvp1PxYigUmF7hNgvfibWKdYPMtpZJpAjEnHdP/x89avuSru5RzXhATWqBojxuza3G
	y4UggiMcgJAwWWfYJ5BTofh9JJjTc9UsnobVEcNgnB48STSDR6OoNMzTcgUfuYcr2EGy
	Mf7Y2LVJfRKnH+AJG0Zu4osoJCfzKL9qs2rY3FchRz/+I04NKdaZG04FJUjfPjmvTQo1
	FWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=jQJXwzutTf4ZTTAydX4wOGD58j0DPnB2rdPv8Yyub9Q=;
	b=B1VRhGqQW+/9fP1WWqDm372skq1dG2tqjbRIni6sCC5kRl2dYSCF/b+qSNzBWbq0dU
	PqZNHh3eJEqOP0gY2HXvHyy+2bEAgZJG1EV3LDW5XFfvLNFXg5nNFIxBhh6O7Rjtnihm
	npePUizWs1L+V6I1F86aavII4qzNRWCnh4w/0J9OmwDxrwW5HmZpZI/a7GqwtyK68nSI
	qNz17MPklohN90VV0uNTdsUjyDezARuGfSH+4gQ53a4OPoyT5i1FQ/wsYa0Vs4dGzz2g
	Zs4k4/uljyEWmyiN6i1cu2nL46zvZkqvYVKWakXWVGbdzaRR5zSQLVefCW8UWg5s+T2c
	V2PQ==
X-Gm-Message-State: AA6/9RmHpMP0QGMnBBky7phY1f5/juQ1d6qMdtI3nV6NTk9d/+dO5dQF5z0afEE49Hy26A==
X-Received: by 10.25.76.136 with SMTP id z130mr6403963lfa.126.1475424009664;
	Sun, 02 Oct 2016 09:00:09 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:09 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:33 +0300
Message-Id: <f22a670cf1f4be298b31640cb5f4be1df0f20ab6.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH v17 01/14] hw/ptimer: Add "wraparound after one
 period" policy
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KFdRuBEFKCUB

Currently, periodic counter wraps around immediately once counter reaches
"0", this is wrong behaviour for some of the timers, resulting in one period
being lost. Add new ptimer policy that provides correct behaviour for such
timers, so that counter stays with "0" for a one period before wrapping
around.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 58 +++++++++++++++++++++++++++++++++++++++--------------
 include/hw/ptimer.h |  4 ++++
 2 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index c45c835..1f4122d 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -13,6 +13,8 @@
 #include "sysemu/replay.h"
 #include "sysemu/qtest.h"
 
+#define DELTA_ADJUST    1
+
 struct ptimer_state
 {
     uint8_t enabled; /* 0 = disabled, 1 = periodic, 2 = oneshot.  */
@@ -35,16 +37,17 @@ static void ptimer_trigger(ptimer_state *s)
     }
 }
 
-static void ptimer_reload(ptimer_state *s)
+static void ptimer_reload(ptimer_state *s, int delta_adjust)
 {
     uint32_t period_frac = s->period_frac;
     uint64_t period = s->period;
+    uint64_t delta = s->delta;
 
-    if (s->delta == 0) {
+    if (delta == 0) {
         ptimer_trigger(s);
-        s->delta = s->limit;
+        delta = s->delta = s->limit;
     }
-    if (s->delta == 0 || s->period == 0) {
+    if (delta == 0 || s->period == 0) {
         if (!qtest_enabled()) {
             fprintf(stderr, "Timer with period zero, disabling\n");
         }
@@ -53,6 +56,10 @@ static void ptimer_reload(ptimer_state *s)
         return;
     }
 
+    if (s->policy_mask & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
+        delta += delta_adjust;
+    }
+
     /*
      * Artificially limit timeout rate to something
      * achievable under QEMU.  Otherwise, QEMU spends all
@@ -62,15 +69,15 @@ static void ptimer_reload(ptimer_state *s)
      * on the current generation of host machines.
      */
 
-    if (s->enabled == 1 && (s->delta * period < 10000) && !use_icount) {
-        period = 10000 / s->delta;
+    if (s->enabled == 1 && (delta * period < 10000) && !use_icount) {
+        period = 10000 / delta;
         period_frac = 0;
     }
 
     s->last_event = s->next_event;
-    s->next_event = s->last_event + s->delta * period;
+    s->next_event = s->last_event + delta * period;
     if (period_frac) {
-        s->next_event += ((int64_t)period_frac * s->delta) >> 32;
+        s->next_event += ((int64_t)period_frac * delta) >> 32;
     }
     timer_mod(s->timer, s->next_event);
 }
@@ -83,7 +90,7 @@ static void ptimer_tick(void *opaque)
     if (s->enabled == 2) {
         s->enabled = 0;
     } else {
-        ptimer_reload(s);
+        ptimer_reload(s, DELTA_ADJUST);
     }
 }
 
@@ -94,6 +101,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
     if (s->enabled) {
         int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         int64_t next = s->next_event;
+        int64_t last = s->last_event;
         bool expired = (now - next >= 0);
         bool oneshot = (s->enabled == 2);
 
@@ -118,7 +126,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
             /* We need to divide time by period, where time is stored in
                rem (64-bit integer) and period is stored in period/period_frac
                (64.32 fixed point).
-              
+
                Doing full precision division is hard, so scale values and
                do a 64-bit division.  The result should be rounded down,
                so that the rounding error never causes the timer to go
@@ -145,6 +153,26 @@ uint64_t ptimer_get_count(ptimer_state *s)
                     div += 1;
             }
             counter = rem / div;
+
+            if (s->policy_mask & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
+                /* Before wrapping around, timer should stay with counter = 0
+                   for a one period.  */
+                if (!oneshot && s->delta == s->limit) {
+                    if (now == last) {
+                        /* Counter == delta here, check whether it was
+                           adjusted and if it was, then right now it is
+                           that "one period".  */
+                        if (counter == s->limit + DELTA_ADJUST) {
+                            return 0;
+                        }
+                    } else if (counter == s->limit) {
+                        /* Since the counter is rounded down and now != last,
+                           the counter == limit means that delta was adjusted
+                           by +1 and right now it is that adjusted period.  */
+                        return 0;
+                    }
+                }
+            }
         }
     } else {
         counter = s->delta;
@@ -157,7 +185,7 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
     s->delta = count;
     if (s->enabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -174,7 +202,7 @@ void ptimer_run(ptimer_state *s, int oneshot)
     s->enabled = oneshot ? 2 : 1;
     if (was_disabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -198,7 +226,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
     s->period_frac = 0;
     if (s->enabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -210,7 +238,7 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
     s->period_frac = (1000000000ll << 32) / freq;
     if (s->enabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -223,7 +251,7 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
         s->delta = limit;
     if (s->enabled && reload) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 26c7fdc..03441cb 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -35,6 +35,10 @@
  */
 #define PTIMER_POLICY_DEFAULT               0
 
+/* Periodic timer counter stays with "0" for a one period before wrapping
+ * around.  */
+#define PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD (1 << 0)
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
-- 
2.9.3


Received: by 10.25.21.156 with SMTP id 28csp434979lfv;
        Thu, 21 Jul 2016 07:34:43 -0700 (PDT)
X-Received: by 10.37.215.18 with SMTP id o18mr19017425ybg.134.1469111682605;
        Thu, 21 Jul 2016 07:34:42 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o65si5168792qkd.128.2016.07.21.07.34.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 07:34:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQF3h-0004JS-RN
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 10:34:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1Y-000315-Il
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1X-0003jl-CJ
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:28 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33808)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1W-0003jY-VW; Thu, 21 Jul 2016 10:32:27 -0400
Received: by mail-lf0-x241.google.com with SMTP id l69so5637132lfg.1;
	Thu, 21 Jul 2016 07:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=x8nND54rlZUCVI/ppJax06v9ByyxUR2d7mdPVarKaPY=;
	b=j0x5U4Y9CKL5bPP3Y14IDO2104p4P3+cw8ymTbHQisOgBqb1Q5sEqf03NoTlycBAws
	6O/RqkzRy2h57iu98r8M9XwbqDrZT3si3XlFGafLiOqdrP0pd9ReNx/wyHW+bYzBOL3x
	l4JBcAgd9A70kVoqajykHgu7CccLLkJvnu/huG12SjuF0mxn+mdFA3y2XKVRkurAgSEg
	+eeFFvpfiR80NmM36fr6xxPap/0mivmWZMOj3hL8UN2sDvHDLFokWoH08Z5z4I/YFwcb
	83fW2YqSDnfsAkH8oyN02ZrU0atpqaGJvP69iC10vPmtidX/5t8nD5avvjK652SUI2/g
	hwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=x8nND54rlZUCVI/ppJax06v9ByyxUR2d7mdPVarKaPY=;
	b=QZUfIg0J1cpcoWZD9z7Pr9BlcwAfPuSGr5iQFO3mR5FITkja3HibkVI0QIZQ0N+2S9
	LEtZJGkkgugXmVnzomfSlR5TBWXj49cH7z6jnB7hn8yHy83AhcXOalcXe85EgYXnfvp+
	6D7gx2bNTkHvNSgIL1ik5vsL+LS0Q0Wm2CB5FV1sWIfiTtMA0VEJ2zOtge6qtLadvOtA
	9myGBDXykUnOVo11n6Zn79RnlfhT2/NYLB2uvJoG0cHqFFI/7APYnNto8vhFBHGsO4AJ
	O3QKpEGAd7OJjJKP3Uc+7yxjim/WZZhmATO+pGL2aa4IHDqkjl2EeuTzOnr0EuPwgbpa
	rQdA==
X-Gm-Message-State: ALyK8tKDDTho5FxyvHnn/Eh7u9YV819IXOJgBx7h0CWmKneFtwwaUrbzFpMbtk8mGm518w==
X-Received: by 10.25.44.71 with SMTP id s68mr15004162lfs.197.1469111546141;
	Thu, 21 Jul 2016 07:32:26 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:25 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:17 +0300
Message-Id: <202a4dbb6513279642280d8ce4ee7f1f8df06e34.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v15 06/15] hw/ptimer: Add "wraparound after one
 period" policy
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GwzWpZCppGwh

Currently, periodic counter wraps around immediately once counter reaches
"0", this is wrong behaviour for some of the timers, resulting in one period
being lost. Add new ptimer policy that provides correct behaviour for such
timers, so that counter stays with "0" for a one period before wrapping
around.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 43 ++++++++++++++++++++++++++++---------------
 include/hw/ptimer.h |  3 +++
 2 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 87af293..c697c08 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -34,22 +34,27 @@ static void ptimer_trigger(ptimer_state *s)
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
         fprintf(stderr, "Timer with period zero, disabling\n");
         timer_del(s->timer);
         s->enabled = 0;
         return;
     }
 
+    if (s->policy_mask & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
+        delta += delta_adjust;
+    }
+
     /*
      * Artificially limit timeout rate to something
      * achievable under QEMU.  Otherwise, QEMU spends all
@@ -59,15 +64,15 @@ static void ptimer_reload(ptimer_state *s)
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
@@ -80,7 +85,7 @@ static void ptimer_tick(void *opaque)
     if (s->enabled == 2) {
         s->enabled = 0;
     } else {
-        ptimer_reload(s);
+        ptimer_reload(s, 1);
     }
 }
 
@@ -88,7 +93,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
 {
     uint64_t counter;
 
-    if (s->enabled) {
+    if (s->enabled && s->delta != 0) {
         int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         int64_t next = s->next_event;
         int64_t last = s->last_event;
@@ -145,6 +150,14 @@ uint64_t ptimer_get_count(ptimer_state *s)
                     div += 1;
             }
             counter = rem / div + 1;
+
+            if (!oneshot && s->delta == s->limit) {
+                /* Before wrapping around, timer should stay with counter = 0
+                   for a one period.  The delta has been adjusted by +1 for
+                   the wrapped around counter, so taking a modulo of limit + 1
+                   gives that period.  */
+                counter %= s->limit + 1;
+            }
         }
     } else {
         counter = s->delta;
@@ -157,7 +170,7 @@ void ptimer_set_count(ptimer_state *s, uint64_t count)
     s->delta = count;
     if (s->enabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -172,7 +185,7 @@ void ptimer_run(ptimer_state *s, int oneshot)
     s->enabled = oneshot ? 2 : 1;
     if (was_disabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -196,7 +209,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
     s->period_frac = 0;
     if (s->enabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -208,7 +221,7 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
     s->period_frac = (1000000000ll << 32) / freq;
     if (s->enabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -221,7 +234,7 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
         s->delta = limit;
     if (s->enabled && reload) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 80564ea..e8de48d 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -13,6 +13,9 @@
 #include "migration/vmstate.h"
 
 #define PTIMER_POLICY_DEFAULT               0
+/* Periodic timer counter stays with "0" for a one period before wrapping
+ * around.  */
+#define PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD (1 << 0)
 
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
-- 
2.9.2


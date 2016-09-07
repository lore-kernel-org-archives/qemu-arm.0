Received: by 10.25.87.130 with SMTP id l124csp310848lfb;
        Wed, 7 Sep 2016 06:29:40 -0700 (PDT)
X-Received: by 10.200.45.249 with SMTP id q54mr17773334qta.66.1473254980373;
        Wed, 07 Sep 2016 06:29:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d187si25015806qkf.270.2016.09.07.06.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Sep 2016 06:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bhcv5-0007jH-LT
	for alex.bennee@linaro.org; Wed, 07 Sep 2016 09:29:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcp1-0001Z8-M2
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bhcoz-0005fa-F6
	for qemu-devel@nongnu.org; Wed, 07 Sep 2016 09:23:23 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35793)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bhcoz-0005fV-2X; Wed, 07 Sep 2016 09:23:21 -0400
Received: by mail-lf0-x241.google.com with SMTP id s64so834315lfs.2;
	Wed, 07 Sep 2016 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=rGYzjLdOtI8IbtVS+tL/n0dzaPNNOyC8quB9/aLVBTA=;
	b=mK63B+eVRrcTeC066er6GtJqbCV/vZpK9cg5mTrabbKwsTQQ0BHllihhZg2TGjvMbY
	7OqmQx9uOmNR6JbDJbu5t3TrF6lpOMoQKyW/UjHHcjhpVZjyr2FSTfpF6ptfEa7LPtWV
	ncS8qFkU3UfLY+VKAYf6Ho/lXihDdRpupQgEV2rN7txBjitIGiygYwFUNGv8WQIl4JEr
	NlvNrKPFEFpyZSZ4jcWi1CCi+EzT9MLvv294vi2dcIrYVhU6hpDdGY8NQi6cDVkhhWSs
	ri6KSqFaC+5LwKuwMos91mw7iG6gyrD9BrpDDGNXv/RwFTtepfxCMhHrLB8LoKbPIbkt
	zeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rGYzjLdOtI8IbtVS+tL/n0dzaPNNOyC8quB9/aLVBTA=;
	b=FkmF6c4hsHBgfQ3Q5heY49vryBzQShRaMUp6D6beFmMsc5EKj1ecefY3dqk1RgXw0t
	i+2Ai4L5aDsdl9sYYZ+5hBHEvzq0ZpYdUunEegNPvOiIpUzKAQgU3DkiF1txoK4PLpT7
	xlb9Ql9V6Og0iCRln9yfpfuSQ6AqauBzvM/lU1WL7wozqy3fkTB5BRBCBAfCXv9JdBrC
	ZRPEesmzQXWfoSZYVgyeAkf3BCyfn/tFFNASgIsZxA54GOgcUjYL0EQwUriS1NEmNb0l
	eR0B+fkEZgqp7HRdrvnCbvc0npafjOy3ZSHCE4j5CBSCV+0F3dHL4TJFAdUAW4bgwAIv
	RrUw==
X-Gm-Message-State: AE9vXwMKv1M3RY6ocHzVGJuya2eTzYYrf56yh6uls02VHysnt8MzkakgTQ5L5Ap4x2OYDQ==
X-Received: by 10.25.150.208 with SMTP id y199mr26499lfd.92.1473254600232;
	Wed, 07 Sep 2016 06:23:20 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17])
	by smtp.gmail.com with ESMTPSA id h29sm11375lfi.18.2016.09.07.06.23.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 06:23:19 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Wed,  7 Sep 2016 16:22:16 +0300
Message-Id: <586d1643bf90bab81322ae34b9b68c10458249a9.1473252818.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
In-Reply-To: <cover.1473252818.git.digetx@gmail.com>
References: <cover.1473252818.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v16 05/16] hw/ptimer: Add "wraparound after one
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
X-TUID: ovjt/eX1vMko

Currently, periodic counter wraps around immediately once counter reaches
"0", this is wrong behaviour for some of the timers, resulting in one period
being lost. Add new ptimer policy that provides correct behaviour for such
timers, so that counter stays with "0" for a one period before wrapping
around.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 43 ++++++++++++++++++++++++++++---------------
 include/hw/ptimer.h |  4 ++++
 2 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index c45c835..e9b2e15 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -35,16 +35,17 @@ static void ptimer_trigger(ptimer_state *s)
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
@@ -53,6 +54,10 @@ static void ptimer_reload(ptimer_state *s)
         return;
     }
 
+    if (s->policy_mask & PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD) {
+        delta += delta_adjust;
+    }
+
     /*
      * Artificially limit timeout rate to something
      * achievable under QEMU.  Otherwise, QEMU spends all
@@ -62,15 +67,15 @@ static void ptimer_reload(ptimer_state *s)
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
@@ -83,7 +88,7 @@ static void ptimer_tick(void *opaque)
     if (s->enabled == 2) {
         s->enabled = 0;
     } else {
-        ptimer_reload(s);
+        ptimer_reload(s, 1);
     }
 }
 
@@ -91,7 +96,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
 {
     uint64_t counter;
 
-    if (s->enabled) {
+    if (s->enabled && s->delta != 0) {
         int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         int64_t next = s->next_event;
         bool expired = (now - next >= 0);
@@ -145,6 +150,14 @@ uint64_t ptimer_get_count(ptimer_state *s)
                     div += 1;
             }
             counter = rem / div;
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
 
@@ -174,7 +187,7 @@ void ptimer_run(ptimer_state *s, int oneshot)
     s->enabled = oneshot ? 2 : 1;
     if (was_disabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -198,7 +211,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
     s->period_frac = 0;
     if (s->enabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -210,7 +223,7 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
     s->period_frac = (1000000000ll << 32) / freq;
     if (s->enabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
@@ -223,7 +236,7 @@ void ptimer_set_limit(ptimer_state *s, uint64_t limit, int reload)
         s->delta = limit;
     if (s->enabled && reload) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        ptimer_reload(s);
+        ptimer_reload(s, 0);
     }
 }
 
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index 7b0fc13..a13a12e 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -34,6 +34,10 @@
  *    counter = counter value at the moment of change (.i.e. one less).  */
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


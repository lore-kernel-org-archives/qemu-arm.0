Received: by 10.25.134.130 with SMTP id i124csp1100923lfd;
        Sat, 9 Jan 2016 09:43:41 -0800 (PST)
X-Received: by 10.140.170.212 with SMTP id q203mr28148724qhq.32.1452361420416;
        Sat, 09 Jan 2016 09:43:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s107si8812861qge.111.2016.01.09.09.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 09:43:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHxYB-0004UG-UH
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 12:43:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXM-0003Hb-5p
	for qemu-devel@nongnu.org; Sat, 09 Jan 2016 12:42:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXI-0000gB-5L
	for qemu-devel@nongnu.org; Sat, 09 Jan 2016 12:42:48 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:34428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aHxXH-0000g0-Qm; Sat, 09 Jan 2016 12:42:44 -0500
Received: by mail-lf0-x241.google.com with SMTP id n70so17776598lfn.1;
	Sat, 09 Jan 2016 09:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=dt+vB1iC2ehMkHVvqeRHeQbnLEDO9BIxYDp9cGRBYPE=;
	b=ZAHAHAm1vymD9oy4iyAkSVCDZAaEung0WMbr/OZCHGQv7GEUYAZ5bazzUpLfu4CHN2
	vAaisHrn4EpKmITL9nVrKgMAeD4h3/YWCygoVGJ35so0FpbqDrUTCdm0VoxkkvKv25vF
	tDu4gU+/pxfHlKlfJ0roSQWxMP5VT2mGkU8pilX39ukw+k5EDIaR+VmYVIYWfTef/CdC
	hFbKARSKtzeJYwgPPEdbOYB7ldHGDacGzhwnUAE27oxZlbp2FRIk5aeemR6Ew+S/CxC9
	RCfnUOprIpIYx56OGpN7Phnoa5dGZsjd6xzHmHEoAjr5SaEPh4apE7+4fzVX2nXmJRRk
	x9/g==
X-Received: by 10.25.213.3 with SMTP id m3mr3231657lfg.125.1452361363090;
	Sat, 09 Jan 2016 09:42:43 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	f186sm8406450lfd.26.2016.01.09.09.42.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jan 2016 09:42:42 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat,  9 Jan 2016 20:39:49 +0300
Message-Id: <ce1e75505277dc9c11b2e417aea3aac099c428ad.1452359845.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v10 1/7] hw/ptimer: Fix issues caused by the
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
X-TUID: wGP00NeQPb7I

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
---
 hw/core/ptimer.c | 51 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index edf077c..c3d31cb 100644
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
+    if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
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
2.6.4


Received: by 10.25.27.66 with SMTP id b63csp280081lfb;
        Fri, 27 May 2016 10:15:40 -0700 (PDT)
X-Received: by 10.55.123.130 with SMTP id w124mr15347707qkc.164.1464369340664;
        Fri, 27 May 2016 10:15:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h140si18351991qhc.40.2016.05.27.10.15.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 10:15:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6LMK-0004f3-2S
	for alex.bennee@linaro.org; Fri, 27 May 2016 13:15:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBv-0002QZ-05
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBk-0003oY-Ti
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:04:53 -0400
Received: from mail-lb0-x243.google.com ([2a00:1450:4010:c04::243]:35073)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6LBk-0003oI-Hl; Fri, 27 May 2016 13:04:44 -0400
Received: by mail-lb0-x243.google.com with SMTP id sh2so6034747lbb.2;
	Fri, 27 May 2016 10:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=uNINqv7UudgC4+LnN+3CdlWTgbuABmcVBRxfsaOBa0w=;
	b=cC1PNWHimFBnHUOvHG1Pfoyzg+FQeD9q8fb2eKij4YCkRMnc/MLFN0RxiHxRI2nwV3
	X82A+BnU3lN8qtP1qtIncUVMf+18anmg0PCdpvz5xsQOltHHvnJfGvePn401T0plRmGh
	Ba55TQcEHNkJaQrxZrHuWqt5MZ0vPxs4jwP/6/gwd4r28WYHT57z0k0Q8Z2RvbrpNYRB
	mrZhTCGq+Dfki5lu5A0uW5OGBYUnyNtXDveOpo+AJ4sc7IbmZZHaOf3D9DC3pjDMiofk
	AInsiy7BgD7RHOjw213CWNJwdf2nGsGLa5R926btAhNdCdcERd1d6fU0uD77dVkdNIFo
	uonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=uNINqv7UudgC4+LnN+3CdlWTgbuABmcVBRxfsaOBa0w=;
	b=O+Bt9/Ewm5PMIob7WYneAkin+spjhHrNsyeAEo0Kt1f4yv1SslEdtyONy5ceCRzuC/
	Q/2dQyLF1dCmYH9Q/v2QCnyioLoEAewIsUHQhyS0Jv9fLnsY6yhadnyttiZ4XFMPTcas
	FhO8Ny1zRh7c7IyzCTUPvCW9lfwxc+7LOuqBmiU9L/AQaPwVDo3d8C8R5jJcCLmaDor4
	S1p0mIslsh0Q/k/cT5Lf19b47/sSEry+ojxjpcygmzy2NK/kk80SnoM0rIieLcAlf3fi
	Wyg8OVrg0Fp93WYGtW3KexTsZAFpbKiMFtgUOy2zPLM/QRt23upWVArscXUSuu8agZ9r
	StPA==
X-Gm-Message-State: ALyK8tLXhmN6L/k04vWvueGMUpVyujaIS6x8TKk2uOMKEumEFaA/vL6gH37b/RX/CrvQxA==
X-Received: by 10.112.149.234 with SMTP id ud10mr4735921lbb.132.1464368683694; 
	Fri, 27 May 2016 10:04:43 -0700 (PDT)
Received: from localhost.localdomain ([109.252.52.1])
	by smtp.gmail.com with ESMTPSA id p4sm3123088lfe.40.2016.05.27.10.04.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 10:04:43 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 27 May 2016 20:03:29 +0300
Message-Id: <cd141f74f5737480ec586b9c7d18cce1d69884e2.1464367869.git.digetx@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::243
Subject: [Qemu-devel] [PATCH v13 1/8] hw/ptimer: Fix issues caused by the
 adjusted timer limit value
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
X-TUID: K6+rYArgpVFF

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
index 153c835..16d7dd5 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -35,6 +35,9 @@ static void ptimer_trigger(ptimer_state *s)
 
 static void ptimer_reload(ptimer_state *s)
 {
+    uint32_t period_frac = s->period_frac;
+    uint64_t period = s->period;
+
     if (s->delta == 0) {
         ptimer_trigger(s);
         s->delta = s->limit;
@@ -45,10 +48,24 @@ static void ptimer_reload(ptimer_state *s)
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
+    if (s->enabled == 1 && (s->delta * period < 10000) && !use_icount) {
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
@@ -83,6 +100,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
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
@@ -95,7 +119,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
             */
 
             rem = s->next_event - now;
-            div = s->period;
+            div = period;
 
             clz1 = clz64(rem);
             clz2 = clz64(div);
@@ -104,13 +128,13 @@ uint64_t ptimer_get_count(ptimer_state *s)
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
@@ -182,19 +206,6 @@ void ptimer_set_freq(ptimer_state *s, uint32_t freq)
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
2.8.3


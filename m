Received: by 10.25.159.19 with SMTP id i19csp1541716lfe;
        Sat, 30 Jan 2016 08:48:40 -0800 (PST)
X-Received: by 10.55.74.14 with SMTP id x14mr18679778qka.70.1454172520003;
        Sat, 30 Jan 2016 08:48:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z139si20541970qka.98.2016.01.30.08.48.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:48:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYhT-0003aS-H9
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:48:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgg-0002WH-KL
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgf-0002Cl-6n
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:50 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:32895)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYge-0002CQ-P8; Sat, 30 Jan 2016 11:47:49 -0500
Received: by mail-lf0-x242.google.com with SMTP id e36so1788628lfi.0;
	Sat, 30 Jan 2016 08:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=x/uOOU8dhb9+x50wivndTv7MaG/rpiiQlGzJjCK9w0o=;
	b=nn/Cnp7q7tjp2wrZHK5EqzkFos8N8wkYVZ7KapvYu9tCgGS1Lg+gJ48L53VrqNqaMn
	cs0uqX6+sIp+Uxz6CsZQpyxQ1X9mB/eJ966iNrP1vu6vV0Pm3M4qL4Q7Vq62mJb9xX4r
	pEsa3OWjPQk8K8YOl+uqeNycUxmPQn9kIoJ4XbiRg+N8qxisI2AZv+4g/UxMd2R7PYzH
	fPgv5qpQtnADiFomDYmrZxZp/R+iXAREJY4hh0hBMyASrAfdStaSI3XZXAzl2c/T+TeV
	VN5x7sqC0a1qwfhUIbbfdQyl0QmmI1Xe4EmHMKpEdBOO5P+wZ0Bu6gT31UTJRGU9s9Z8
	5+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=x/uOOU8dhb9+x50wivndTv7MaG/rpiiQlGzJjCK9w0o=;
	b=XjuRXjVefPyTzi/QSjbjkyJxZGgXEiRrRf10Ran8qgvw4tyg3V0S2hTj6guOhHEtK1
	JG6RZrWG30EWpocYcRorLuZJXpXx1XJ27/KHXHiZ1ishM6FaCYugcVtoczikTcCdvXoI
	XjAdPvEID7WYPLJfQiojDdtSlNT+YBVgz2maVASUJcpa8lSEFJ1pyxMFc7K/zw1vY/PN
	rPaDzD1PCGpMo6ZgQT5aZdZ62IL6Ts/WjARcPNrfjAtRzJ0tvdN8Nah2mx/kxRHaeimL
	cf+hV9nEJvCDgQCaJGwWTQutWMAk97/Uop8oMi61ach+p2f8sBAwPZ+jKO35/S0UhBh0
	bdTg==
X-Gm-Message-State: AG10YORKeqe1eCb4yrUZznY82/W+Oh/3mme6zSizbkpws0+5e1R8O33UCKHlJs3STyfing==
X-Received: by 10.25.15.23 with SMTP id e23mr4737145lfi.111.1454172467959;
	Sat, 30 Jan 2016 08:47:47 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:10 +0300
Message-Id: <7799cedf6b0995323ab5a2f6123763abf88fde56.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v12 1/9] hw/ptimer: Fix issues caused by the
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
X-TUID: gMITWi/6QjFa

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
index edf077c..5edcd71 100644
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


Received: by 10.25.0.23 with SMTP id 23csp1484498lfa;
        Tue, 6 Jun 2017 01:55:43 -0700 (PDT)
X-Received: by 10.200.3.162 with SMTP id t34mr23885430qtg.232.1496739343163;
        Tue, 06 Jun 2017 01:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496739343; cv=none;
        d=google.com; s=arc-20160816;
        b=hA9maVuPTHt7q2XKsQcnLTgpuCNH4/DoZyH/Pq102e/1M/MXk7BFoYWQ7KYNTQk/v4
         NTEC0b8UBgWgShBdpzioc5R2r9TqEHlIj+cx3kIsgbA1c1x5ldUEHGL4Wb5HkJwQnKsE
         N5JANmhgmvxJxBJsZ8yg+ex/gEwZtucQJqgcjQURKnpWheAHf0hQm+1oVxb9LzLakgUJ
         KQ1FOCtmGsFEbZ57ydW+ZBHn2XxQyHol+ogbZzTYYuf+pAMDX5Zf+VbeEXgJsnABjTWV
         bM3EIm1RksOtk08Nw/4z90W0PprX1Sb1KyAdcBVeGQw8Rp7xH+gyzUxgTAggTrfpVjPY
         HnJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=uaFobGr91Xq7xENADhSbfQqK0utsivgDqW0lHT47YdY=;
        b=IswG8zczlSJqdfwnf14mTDz343yK5xYNtBw9jdf93y2Vx2cGfSo0bE/+4fLCm1/4hl
         QBZYG+RsoitZvF3+12Bw6sA1NjGstM4lNJxG3mMukZC4eoye4EsnDULqCeOStejA1LuH
         /EKm3a+OWEelbcUvfBindxC+3gv5D21ljAn50aSNqlejoMWfGAtST6/uveEHtWW6jvdr
         25G9c2gbM/DTA8aHdwpwFiEBcaMdS1qpRurwOtfgbtISIotQvsoo5E8xR3rSdmWHqcog
         KHMGeacYS+eNCShIMakcqPQgAnjInO6ZEQiLGEz2rWpojudis4zhjN2/Wg2H4tLtjhso
         vV7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j89si34497977qte.301.2017.06.06.01.55.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Jun 2017 01:55:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIAH6-0006Ff-8F
	for alex.bennee@linaro.org; Tue, 06 Jun 2017 04:55:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dIAGv-0006DU-Jd
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 04:55:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1dIAGs-0005EQ-Ge
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 04:55:29 -0400
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216]:47439)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1dIAGs-0005Dw-AH
	for qemu-arm@nongnu.org; Tue, 06 Jun 2017 04:55:26 -0400
Received: from player762.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id D404D592CA
	for <qemu-arm@nongnu.org>; Tue,  6 Jun 2017 10:55:24 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
	[90.89.238.153]) (Authenticated sender: clg@kaod.org)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id 5F1A9E0093;
	Tue,  6 Jun 2017 10:55:19 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue,  6 Jun 2017 10:55:12 +0200
Message-Id: <1496739312-32304-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7925209444320250641
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeljedrheelgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.72.216
Subject: [Qemu-arm] [PATCH] timer/aspeed: fix timer enablement when a reload
 is not set
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BzJFU9/uybgN

When a timer is enabled before a reload value is set, the controller
waits for a reload value to be set before starting decrementing. This
fix tries to cover that case by changing the timer expiry only when
a reload value is valid.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/timer/aspeed_timer.c | 37 +++++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 9b70ee09b07f..50acbf530a3a 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -130,15 +130,26 @@ static uint64_t calculate_next(struct AspeedTimer *=
t)
             next =3D seq[1];
         } else if (now < seq[2]) {
             next =3D seq[2];
-        } else {
+        } else if (t->reload) {
             reload_ns =3D muldiv64(t->reload, NANOSECONDS_PER_SECOND, ra=
te);
             t->start =3D now - ((now - t->start) % reload_ns);
+        } else {
+            /* no reload value, return 0 */
+            break;
         }
     }
=20
     return next;
 }
=20
+static void aspeed_timer_mod(AspeedTimer *t)
+{
+    uint64_t next =3D calculate_next(t);
+    if (next) {
+        timer_mod(&t->timer, next);
+    }
+}
+
 static void aspeed_timer_expire(void *opaque)
 {
     AspeedTimer *t =3D opaque;
@@ -164,7 +175,7 @@ static void aspeed_timer_expire(void *opaque)
         qemu_set_irq(t->irq, t->level);
     }
=20
-    timer_mod(&t->timer, calculate_next(t));
+    aspeed_timer_mod(t);
 }
=20
 static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
@@ -227,10 +238,23 @@ static void aspeed_timer_set_value(AspeedTimerCtrlS=
tate *s, int timer, int reg,
                                    uint32_t value)
 {
     AspeedTimer *t;
+    uint32_t old_reload;
=20
     trace_aspeed_timer_set_value(timer, reg, value);
     t =3D &s->timers[timer];
     switch (reg) {
+    case TIMER_REG_RELOAD:
+        old_reload =3D t->reload;
+        t->reload =3D value;
+
+        /* If the reload value was not previously set, or zero, and
+         * the current value is valid, try to start the timer if it is
+         * enabled.
+         */
+        if (old_reload || !t->reload) {
+            break;
+        }
+
     case TIMER_REG_STATUS:
         if (timer_enabled(t)) {
             uint64_t now =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -238,17 +262,14 @@ static void aspeed_timer_set_value(AspeedTimerCtrlS=
tate *s, int timer, int reg,
             uint32_t rate =3D calculate_rate(t);
=20
             t->start +=3D muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
-            timer_mod(&t->timer, calculate_next(t));
+            aspeed_timer_mod(t);
         }
         break;
-    case TIMER_REG_RELOAD:
-        t->reload =3D value;
-        break;
     case TIMER_REG_MATCH_FIRST:
     case TIMER_REG_MATCH_SECOND:
         t->match[reg - 2] =3D value;
         if (timer_enabled(t)) {
-            timer_mod(&t->timer, calculate_next(t));
+            aspeed_timer_mod(t);
         }
         break;
     default:
@@ -268,7 +289,7 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *t, =
bool enable)
     trace_aspeed_timer_ctrl_enable(t->id, enable);
     if (enable) {
         t->start =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        timer_mod(&t->timer, calculate_next(t));
+        aspeed_timer_mod(t);
     } else {
         timer_del(&t->timer);
     }
--=20
2.7.4


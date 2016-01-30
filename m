Received: by 10.25.159.19 with SMTP id i19csp1542805lfe;
        Sat, 30 Jan 2016 08:51:48 -0800 (PST)
X-Received: by 10.55.73.69 with SMTP id w66mr18277182qka.39.1454172708645;
        Sat, 30 Jan 2016 08:51:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 19si23060135qgf.103.2016.01.30.08.51.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:51:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYkW-0000sR-8F
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:51:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgm-0002d7-B8
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgl-0002GL-Co
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:56 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:34595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYgl-0002Fi-4x; Sat, 30 Jan 2016 11:47:55 -0500
Received: by mail-lf0-x242.google.com with SMTP id n70so5192541lfn.1;
	Sat, 30 Jan 2016 08:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=D0wjSZC6q8v9IkpoLrPl5KF4x6VWsZq+wamL2UVUWIU=;
	b=KbNPhaX5T1DVs63SfoHPRwTgumW6S2PkbRUQBxnxJKvm6UUHoQIA9JEvNeXXUmQROJ
	sBvIRMhBV+dPI87IkB72mek1lqwYOTbun/O5RL7LEGE83ew0vO7eE8Z64a8/3AbkRq1k
	6sUopsJ6SVodFbmhybVL5kTRzeLckkDLVewPHs6Q8bJt1eZHQuVvsPHekM3mzcd+/VOA
	1XlttI0OfyupzkgM6v4WYgVmpYtLUwe2OFbQ2tkGIwuw3oYH6DWoNOpHA15zGv3rhg7V
	NCbJT+MS5Hgtgd+FUFMJqOMWoCyOzSSl6UkUq2chDFbkoCO3UMkxVd5XJzveJBXUyYDq
	jWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=D0wjSZC6q8v9IkpoLrPl5KF4x6VWsZq+wamL2UVUWIU=;
	b=iKn5lIeRoJjwpzlG8MK/z29aFD8kB7LcxZtAM15pFno0kwrqF63Rl35vtltKz5/3PC
	y3cCe6P3u87KbOylZAIeV1yoUsSn/lo5nG1l/mwgANbFtvo5iIvfvOEszQFSl5o6z04o
	qoi7rjf2QOLkL6OGYFZ0zrEVRm8l8BKa/y3/5s78yET1ZdIDZpkxX+BowbEW6RXZ3H/W
	Bj0FYp8VPLPqHEcyJWwPAE5xKw4kQAUrm0yfpD6H073x44/SFcshb9yXxKw3GZyksSBm
	zA+J+/5gGa4DkAUrPa0jyJimdvgUFKXMQTo1vb7GxbUS2seYgM6kylJP6FgOphOWbOnR
	CNJw==
X-Gm-Message-State: AG10YOSRGL5ecOaPElgY3fABi/whJDsQFQH13ihsUGheM+ROkaWOA7o/u4mT/QN/BHorBQ==
X-Received: by 10.25.135.198 with SMTP id j189mr3016016lfd.84.1454172474391;
	Sat, 30 Jan 2016 08:47:54 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:53 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:17 +0300
Message-Id: <0eb543c0917bac416a18fc9daf97f5ba4e61ce1f.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v12 8/9] hw/ptimer: Perform delayed tick
	instead of immediate if delta = 0
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
X-TUID: Mf1QBmwuwIzA

It might be necessary by some emulated HW to perform the tick after one
period if delta = 0. Given that it is much less churny to implement immediate
tick by the ptimer user itself, let's make ptimer do the delayed tick.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index b2044fb..bcd090c 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -36,19 +36,7 @@ static void ptimer_reload(ptimer_state *s)
 {
     uint32_t period_frac = s->period_frac;
     uint64_t period = s->period;
-
-    if (s->delta == 0) {
-        ptimer_trigger(s);
-    }
-
-    if (s->delta == 0 && s->enabled == 1) {
-        s->delta = s->limit;
-    }
-
-    if (s->delta == 0) {
-        ptimer_stop(s);
-        return;
-    }
+    uint64_t delta = MAX(1, s->delta);
 
     /*
      * Artificially limit timeout rate to something
@@ -59,15 +47,15 @@ static void ptimer_reload(ptimer_state *s)
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
@@ -75,8 +63,16 @@ static void ptimer_reload(ptimer_state *s)
 static void ptimer_tick(void *opaque)
 {
     ptimer_state *s = (ptimer_state *)opaque;
-    s->delta = 0;
-    ptimer_reload(s);
+
+    s->delta = (s->enabled == 1) ? s->limit : 0;
+
+    if (s->delta == 0) {
+        s->enabled = 0;
+    } else {
+        ptimer_reload(s);
+    }
+
+    ptimer_trigger(s);
 }
 
 uint64_t ptimer_get_count(ptimer_state *s)
-- 
2.7.0


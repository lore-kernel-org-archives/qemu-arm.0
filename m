Received: by 10.25.159.19 with SMTP id i19csp3908884lfe;
        Thu, 21 Jan 2016 11:05:37 -0800 (PST)
X-Received: by 10.140.226.8 with SMTP id w8mr45645310qhb.83.1453403137119;
        Thu, 21 Jan 2016 11:05:37 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w138si2657432qhb.76.2016.01.21.11.05.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 11:05:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49350 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMKY4-0008RY-JT
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 14:05:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXK-0007RT-0m
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXF-0001Bh-8Z
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:49 -0500
Received: from mail-lb0-x242.google.com ([2a00:1450:4010:c04::242]:35950)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aMKXF-0001BJ-0Z; Thu, 21 Jan 2016 14:04:45 -0500
Received: by mail-lb0-x242.google.com with SMTP id ad5so1945630lbc.3;
	Thu, 21 Jan 2016 11:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=68lZAq9SMdIujxMJCfXPh/942/hSbjC5ncXFGPy9HvM=;
	b=lQmaemxnQpws3ofUFNz8ikT1ldiZJsCwZNaXr5ixovgY179/UW1PvwfqV1Ti1H4hld
	vlgCnATnYQTsq+dYm6ELYEupoMLxxVjIdEp+tU8mu+CqtESCtlbgjJeVaaHf5LkXBysL
	teNk23RJw6Yx35UfEPA/HqdrBrUNhGZz/xyAtxrMB5DZfRqeOjQTDYOJWeDn5m6hxm8I
	cKweBIjBwEcLrd9avyy4EL2XQ1iANeKU3Mn2mceVg0l8DOOEuTpimFKeR4TZSB5U3cub
	fIqsVzKX8PI5oRn5j2kRry4SIXoW9eF4nzOcgjmRBpMHYihUU77aqvg1PgQxeprlCG+h
	t8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=68lZAq9SMdIujxMJCfXPh/942/hSbjC5ncXFGPy9HvM=;
	b=ZOaeU6vckRRCVsfHxF5VxQYxaTUOTuhYDGGMJfncBQbG9ILoLAG5f+ATuUV3URFHXT
	nl58SCTwNQdA6WGo7awYBCcQ2WJLkDA7ohls1QtOFU/XtUqtW1C9pBBSDaas8Zof9SP/
	IPU40sMrNFB3HHnDMuVB6hC2bWYgGc5lKDr4EpklstHQPzME3tVLo6puWrPz3KFeJAhe
	rHWgZjiYeu/OHywY/HCfim9Ps1Bs7P0R9ehb0vsc50gXULYBmukE2fsR3F5Z7fgvqGWh
	3el/2mavviPSsW3TK7GoS6sWw5xBeCyddZcDGGc8CT93fKYVXQylaW2GPZCK30Xs248h
	SWwA==
X-Gm-Message-State: ALoCoQkUJiw+ByZFatiCoMCscKIt92DR1Gjaq5AgOX4fgYkyfOXn473oKiXwxhsVJftyqV0lciO+unb/Uhje3m/tDdBCAv2hQw==
X-Received: by 10.112.64.5 with SMTP id k5mr15939176lbs.133.1453403084346;
	Thu, 21 Jan 2016 11:04:44 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163])
	by smtp.gmail.com with ESMTPSA id m21sm382496lfe.29.2016.01.21.11.04.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 11:04:43 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jan 2016 22:03:45 +0300
Message-Id: <9fb47bb0f1355221ef074766d5cc49f2de97e79b.1453402860.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::242
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v11 2/7] hw/ptimer: Perform counter wrap around
	if timer already expired
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
X-TUID: 9SkwlaPLM570

ptimer_get_count() might be called while QEMU timer already been expired.
In that case ptimer would return counter = 0, which might be undesirable
in case of polled timer. Do counter wrap around for periodic timer to keep
it distributed. In order to achieve more accurate emulation behaviour of
certain hardware, don't perform wrap around when in icount mode and return
counter = 0 in that case (that doesn't affect polled counter distribution).

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 6dc1677..cb50d30 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -83,14 +83,16 @@ static void ptimer_tick(void *opaque)
 
 uint64_t ptimer_get_count(ptimer_state *s)
 {
-    int64_t now;
     uint64_t counter;
 
     if (s->enabled) {
-        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        int64_t next = s->next_event;
+        bool expired = (now - next >= 0);
+        bool oneshot = (s->enabled == 2);
+
         /* Figure out the current counter value.  */
-        if (now - s->next_event > 0
-            || s->period == 0) {
+        if (s->period == 0 || (expired && (oneshot || use_icount))) {
             /* Prevent timer underflowing if it should already have
                triggered.  */
             counter = 0;
@@ -102,7 +104,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
             uint32_t period_frac = s->period_frac;
             uint64_t period = s->period;
 
-            if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
+            if (!oneshot && (s->delta * period < 10000) && !use_icount) {
                 period = 10000 / s->delta;
                 period_frac = 0;
             }
@@ -117,7 +119,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
                backwards.
             */
 
-            rem = s->next_event - now;
+            rem = expired ? now - next : next - now;
             div = period;
 
             clz1 = clz64(rem);
@@ -137,6 +139,11 @@ uint64_t ptimer_get_count(ptimer_state *s)
                     div += 1;
             }
             counter = rem / div;
+
+            if (expired && (counter != 0)) {
+                /* Wrap around periodic counter.  */
+                counter = s->limit - counter % s->limit;
+            }
         }
     } else {
         counter = s->delta;
-- 
2.7.0


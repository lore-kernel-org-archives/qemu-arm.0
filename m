Received: by 10.25.134.130 with SMTP id i124csp1100916lfd;
        Sat, 9 Jan 2016 09:43:40 -0800 (PST)
X-Received: by 10.140.167.86 with SMTP id n83mr80420312qhn.41.1452361419998;
        Sat, 09 Jan 2016 09:43:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a197si26160329qkb.6.2016.01.09.09.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 09:43:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHxYB-0004Ut-JJ
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 12:43:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXM-0003HZ-3e
	for qemu-devel@nongnu.org; Sat, 09 Jan 2016 12:42:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXI-0000gM-P8
	for qemu-devel@nongnu.org; Sat, 09 Jan 2016 12:42:47 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:33498)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aHxXI-0000gH-IU; Sat, 09 Jan 2016 12:42:44 -0500
Received: by mail-lf0-x244.google.com with SMTP id z62so2165019lfd.0;
	Sat, 09 Jan 2016 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=c/VxfLNSrfjLtH6rsK1C4xEfoaKrN1FQOxQ1P8J3VnA=;
	b=dfmu64QLkDsFyOb7fOqBrgfWxO2qayHoQGCheX0WGEo0j0Lg/ERgyPMf5R4ENGe+yU
	xXJ6liqQcliRsb+MBNZeYdkDe34kT/lmGjCdT1T5lezRnkPRCpJKXN4dMk8a6giLg1K6
	ypjdQOCg56PN5WlpyKUu8Wu9POBT7fT+HAffKTBnjyCgNGtXwJVKOiAP4iwn37dQ4y0/
	atTBrDX84mvKwuLHgQwhL3GUYc1XSzOeCQNa5Odvca1nV/LhLr9zyN4ZzPwpe9qBQlv7
	xyA+ZqMI+iup2QVABPchQ/xA7G4jboekObZj5EWeqp0MadxHQyoKD/tsmnsTBM9LFbCL
	9W8Q==
X-Received: by 10.25.26.68 with SMTP id a65mr34324331lfa.24.1452361363900;
	Sat, 09 Jan 2016 09:42:43 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	f186sm8406450lfd.26.2016.01.09.09.42.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jan 2016 09:42:43 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat,  9 Jan 2016 20:39:50 +0300
Message-Id: <9bdf3e1d349c7cfc6d75cc37430fe4f177c20734.1452359845.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v10 2/7] hw/ptimer: Perform tick and counter
	wrap around if timer already expired
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
X-TUID: fXV383lj9Kip

ptimer_get_count() might be called while QEMU timer already been expired.
In that case ptimer would return counter = 0, which might be undesirable
in case of polled timer. Do counter wrap around for periodic timer to keep
it distributed. In order to achieve more accurate emulation behaviour of
certain hardware, don't perform wrap around when in icount mode and return
counter = 0 in that case (that doesn't affect polled counter distribution).

In addition, there is no reason to keep expired timer tick deferred, so
just perform the tick from ptimer_get_count().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index c3d31cb..cf329eb 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -83,14 +83,17 @@ static void ptimer_tick(void *opaque)
 
 uint64_t ptimer_get_count(ptimer_state *s)
 {
-    int64_t now;
+    int enabled = s->enabled;
     uint64_t counter;
 
-    if (s->enabled) {
-        now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    if (enabled) {
+        int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        int64_t next = s->next_event;
+        int expired = (now - next >= 0);
+        int oneshot = (enabled == 2);
+
         /* Figure out the current counter value.  */
-        if (now - s->next_event > 0
-            || s->period == 0) {
+        if (s->period == 0 || (expired && (use_icount || oneshot))) {
             /* Prevent timer underflowing if it should already have
                triggered.  */
             counter = 0;
@@ -102,7 +105,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
             uint32_t period_frac = s->period_frac;
             uint64_t period = s->period;
 
-            if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
+            if (!oneshot && !use_icount && (s->delta * period < 10000)) {
                 period = 10000 / s->delta;
                 period_frac = 0;
             }
@@ -117,7 +120,7 @@ uint64_t ptimer_get_count(ptimer_state *s)
                backwards.
             */
 
-            rem = s->next_event - now;
+            rem = expired ? now - next : next - now;
             div = period;
 
             clz1 = clz64(rem);
@@ -137,6 +140,15 @@ uint64_t ptimer_get_count(ptimer_state *s)
                     div += 1;
             }
             counter = rem / div;
+
+            if (expired && (counter != 0)) {
+                /* Wrap around periodic counter.  */
+                counter = s->limit - counter % s->limit;
+            }
+        }
+
+        if (expired) {
+            ptimer_tick(s);
         }
     } else {
         counter = s->delta;
-- 
2.6.4


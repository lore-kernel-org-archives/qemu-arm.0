Received: by 10.25.134.130 with SMTP id i124csp1100940lfd;
        Sat, 9 Jan 2016 09:43:43 -0800 (PST)
X-Received: by 10.140.178.139 with SMTP id y133mr156030667qhy.92.1452361420669;
        Sat, 09 Jan 2016 09:43:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s107si8812880qge.111.2016.01.09.09.43.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 09:43:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHxYC-0004WG-8l
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 12:43:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXN-0003Hl-GN
	for qemu-devel@nongnu.org; Sat, 09 Jan 2016 12:42:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXL-0000hF-2t
	for qemu-devel@nongnu.org; Sat, 09 Jan 2016 12:42:49 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35813)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aHxXK-0000hA-SK; Sat, 09 Jan 2016 12:42:47 -0500
Received: by mail-lf0-x244.google.com with SMTP id c134so2046182lfb.2;
	Sat, 09 Jan 2016 09:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vZ49fCMGwkupZrjLTtcG5QMU2vHgNsoDjsE2KDPFl5c=;
	b=lD5fuZBkT6XX6xYFObVuMVpWaIJVIN4VYuIbQftzpSWXBPIEl2At0Sp/Xke3t0KtFb
	4ssBfUqOFGo/kbiSJI6vWw3Bcj/+Ez1GqIhHzXtbYpCGjWYgPF1ziq1z+fb3xdTigQ1R
	/G9XX+hMxjOaEpaG1ZuERV3CC3hkzyHjR3D80m2yB4Ra67li8dgPrQREddlzx04cQQft
	rmp3+dL3ebYql/WRLJ+eOjpRxaZWC3YbsdvM3ZNtLBYt0VZ4mq9MS/mTqfY2OUIeqI6K
	/x1nMv2IAQ30FhYxSEc7gpLGlegiR0HeHKKJV5yD1MF/bCk+qFTj0TAS8VG6x1+8kCYC
	UP3Q==
X-Received: by 10.25.144.5 with SMTP id s5mr43828372lfd.154.1452361366260;
	Sat, 09 Jan 2016 09:42:46 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	f186sm8406450lfd.26.2016.01.09.09.42.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jan 2016 09:42:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat,  9 Jan 2016 20:39:53 +0300
Message-Id: <5c18054d536f3f940d3059235f0ac4aad42c835c.1452359845.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v10 5/7] hw/ptimer: Legalize running with delta
	= load = 0
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
X-TUID: 604yXRognNrG

Currently ptimer would print error message and clear enable flag for an
arming timer that has delta = load = 0. That actually could be a valid case
for some hardware, like instant IRQ trigger for oneshot timer or continuous
in periodic mode. Support those cases by printing error message only when
period = 0.

In addition, don't load one-shot timer when delta = 0 and actually stop the
timer by timer_del().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 6960738..42e44f9 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -36,13 +36,20 @@ static void ptimer_reload(ptimer_state *s)
 {
     uint32_t period_frac = s->period_frac;
     uint64_t period = s->period;
+    int periodic = (s->enabled == 1);
 
-    if (s->delta == 0) {
+    if (s->delta == 0 && period != 0) {
         ptimer_trigger(s);
-        s->delta = s->limit;
+        if (periodic) {
+            s->delta = s->limit;
+        }
     }
-    if (s->delta == 0 || s->period == 0) {
-        fprintf(stderr, "Timer with period zero, disabling\n");
+    if (s->delta == 0 || period == 0) {
+        if (period == 0) {
+            fprintf(stderr, "Timer with period zero, disabling\n");
+            s->delta = 0;
+        }
+        timer_del(s->timer);
         s->enabled = 0;
         return;
     }
@@ -56,7 +63,7 @@ static void ptimer_reload(ptimer_state *s)
      * on the current generation of host machines.
      */
 
-    if ((s->enabled == 1) && !use_icount && (s->delta * period < 10000)) {
+    if (periodic && !use_icount && (s->delta * period < 10000)) {
         period = 10000 / s->delta;
         period_frac = 0;
     }
@@ -86,14 +93,14 @@ uint64_t ptimer_get_count(ptimer_state *s)
     int enabled = s->enabled;
     uint64_t counter;
 
-    if (enabled) {
+    if (enabled && s->delta != 0) {
         int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         int64_t next = s->next_event;
         int expired = (now - next >= 0);
         int oneshot = (enabled == 2);
 
         /* Figure out the current counter value.  */
-        if (s->period == 0 || (expired && (use_icount || oneshot))) {
+        if (expired && (use_icount || oneshot)) {
             /* Prevent timer underflowing if it should already have
                triggered.  */
             counter = 0;
-- 
2.6.4


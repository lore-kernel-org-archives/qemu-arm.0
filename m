Received: by 10.25.159.19 with SMTP id i19csp1542794lfe;
        Sat, 30 Jan 2016 08:51:47 -0800 (PST)
X-Received: by 10.140.35.115 with SMTP id m106mr18106860qgm.13.1454172707321;
        Sat, 30 Jan 2016 08:51:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m66si20550013qki.88.2016.01.30.08.51.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:51:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYkU-0000ou-TN
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:51:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgk-0002Zk-Uy
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgj-0002FH-TR
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:54 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:34593)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYgj-0002Et-Gd; Sat, 30 Jan 2016 11:47:53 -0500
Received: by mail-lf0-x241.google.com with SMTP id n70so5192448lfn.1;
	Sat, 30 Jan 2016 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=vueQwYzhFNks9vH8eZn+H9ZM3awUOSx7xa2NeEqPeeg=;
	b=MrLUf438BuScdkxreH4X662MToVsnL/jK8H5/4WcXxWEKJ/LYeFbfHNvyGXIQihOHQ
	rkZx5wCFrn55n1GT5Oe9wguIVkXJtaxeJwddelKykx+LleI3pbC8QyHghVM046RMzWeg
	XrCnCz938DhfyJg5T8DUObpmi6c+kjBurMkFV1GllybVmeXxXU40or6hdTQXkyjdTOIx
	Q1ZLrN81FSsIfWkY30L4lL92GuFSWj8VnqJDeHzav9oIw+VN4vD7U8nbJ5NqWresvNai
	tQHFgIacBHOpwXQdmLbWLpezubcn085Vf7JVduNYt0Mh7/tLQzVMVttTIfip4QfuUPwI
	3q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=vueQwYzhFNks9vH8eZn+H9ZM3awUOSx7xa2NeEqPeeg=;
	b=Qdgv8nwklPzN0IQUoz0kucIPw85egR0GRL2JArg2Hydlc8YKj6FwRcGkvv+o5gT1C7
	U6T8gz6UV9x+X7TydJWakgARagpN8DOVrinHfXFCcboM0CN/cuu8+GSomRS9AWjoUFIY
	cKQgaLykSF69o5nWKZSTZ5J8XJ1W7RHxOyO0qwNfMI0Q3NY5E4PhsvPwGHluXD1A94Ep
	+AAcEksJpUZpGFCU0a9OtLpQ+CeF8FDLfxCKwRehxQaHHsu7GgrpC1XeMf2270kgsWpn
	Aoajp6RccO+HZP8//PU/8f1cxJNs9qXvBCBCnI4+hG7/BvGuUt5iFRcr+2IcXUz3Zjdx
	1dSA==
X-Gm-Message-State: AG10YOT3NU8Lw0jPyGw2K/INXnx9rvxXmwoV8I1C6C5of9f408N/8Ls+74thIZsRYQqiQg==
X-Received: by 10.25.142.136 with SMTP id q130mr5772929lfd.56.1454172472707;
	Sat, 30 Jan 2016 08:47:52 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:52 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:15 +0300
Message-Id: <26b6102ecf2a5804a442a17fe4c4f0b7f3f50f70.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v12 6/9] hw/ptimer: Legalize running with delta
	= load = 0 and abort on period = 0
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
X-TUID: C6rIR9Ko14Y0

Currently ptimer would print error message and clear enable flag for an
arming timer that has delta = load = 0. That actually could be a valid case
for some hardware, like instant IRQ trigger for oneshot timer or continuous
in periodic mode. Support those cases by removing the error message and
stopping the timer when delta = 0. Abort execution when period = 0 instead
of printing the error message, otherwise there is a chance to miss that error.

In addition, don't re-load oneshot timer when delta = 0 and remove duplicated
code from ptimer_tick(), since ptimer_reload would invoke trigger and stop
the timer.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/core/ptimer.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index bf62fdd..62f8cb1 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -39,11 +39,14 @@ static void ptimer_reload(ptimer_state *s)
 
     if (s->delta == 0) {
         ptimer_trigger(s);
+    }
+
+    if (s->delta == 0 && s->enabled == 1) {
         s->delta = s->limit;
     }
-    if (s->delta == 0 || s->period == 0) {
-        fprintf(stderr, "Timer with period zero, disabling\n");
-        s->enabled = 0;
+
+    if (s->delta == 0) {
+        ptimer_stop(s);
         return;
     }
 
@@ -72,27 +75,22 @@ static void ptimer_reload(ptimer_state *s)
 static void ptimer_tick(void *opaque)
 {
     ptimer_state *s = (ptimer_state *)opaque;
-    ptimer_trigger(s);
     s->delta = 0;
-    if (s->enabled == 2) {
-        s->enabled = 0;
-    } else {
-        ptimer_reload(s);
-    }
+    ptimer_reload(s);
 }
 
 uint64_t ptimer_get_count(ptimer_state *s)
 {
     uint64_t counter;
 
-    if (s->enabled) {
+    if (s->enabled && s->delta != 0) {
         int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         int64_t next = s->next_event;
         bool expired = (now - next >= 0);
         bool oneshot = (s->enabled == 2);
 
         /* Figure out the current counter value.  */
-        if (s->period == 0 || (expired && (oneshot || use_icount))) {
+        if (expired && (oneshot || use_icount)) {
             /* Prevent timer underflowing if it should already have
                triggered.  */
             counter = 0;
@@ -164,12 +162,10 @@ void ptimer_run(ptimer_state *s, int oneshot)
 {
     bool was_disabled = !s->enabled;
 
-    if (was_disabled && s->period == 0) {
-        fprintf(stderr, "Timer with period zero, disabling\n");
-        return;
-    }
     s->enabled = oneshot ? 2 : 1;
+
     if (was_disabled) {
+        g_assert(s->period != 0);
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         ptimer_reload(s);
     }
@@ -190,6 +186,7 @@ void ptimer_stop(ptimer_state *s)
 /* Set counter increment interval in nanoseconds.  */
 void ptimer_set_period(ptimer_state *s, int64_t period)
 {
+    g_assert(period != 0);
     s->delta = ptimer_get_count(s);
     s->period = period;
     s->period_frac = 0;
@@ -202,6 +199,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
+    g_assert(freq != 0 && freq <= 1000000000);
     s->delta = ptimer_get_count(s);
     s->period = 1000000000ll / freq;
     s->period_frac = (1000000000ll << 32) / freq;
-- 
2.7.0


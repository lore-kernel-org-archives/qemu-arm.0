Received: by 10.25.159.19 with SMTP id i19csp3909729lfe;
        Thu, 21 Jan 2016 11:07:15 -0800 (PST)
X-Received: by 10.140.19.52 with SMTP id 49mr53756554qgg.65.1453403235431;
        Thu, 21 Jan 2016 11:07:15 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h35si2673424qgd.61.2016.01.21.11.07.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jan 2016 11:07:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49366 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aMKZe-0003Bh-PC
	for alex.bennee@linaro.org; Thu, 21 Jan 2016 14:07:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXK-0007RU-Ed
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aMKXJ-0001DD-2X
	for qemu-devel@nongnu.org; Thu, 21 Jan 2016 14:04:50 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:36829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aMKXI-0001Cz-Ly; Thu, 21 Jan 2016 14:04:48 -0500
Received: by mail-lf0-x241.google.com with SMTP id t141so2797875lfd.3;
	Thu, 21 Jan 2016 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QlvbnldpsRFQInQQATmijjGWQn2NNKSL0l1kxp7aEOo=;
	b=NZM72OO21OYHVvhB3B+s6RIYGq7vO8cjcKrk2iz0jm+jCvIShfFASG/4VjdZvN48WB
	aD8TtNDfBLmyhws/V0Zn6grULGdtfpWkqWAMIrrqq3/favMSKlyTnjlo9dt3g7/2ecCF
	FYWnmeBRTOY9j5BRuop+LmDaIZHoSquONpN8Ij7Wgy7bcYtOwzCGT++TTT+b3AxpqXhd
	9/e5Ax92EkEpu7Z+edVqw4tSXG+KwLsC+Z70/XdFld2Y7WrFHVREQF01Pb38ptJlw3NK
	U0GN6aF+WL7pakP6UW4uGwuHbha+YaRAu9TZgbVB9NgL6/QaRy3uVs/OoDBoPNR2b2zx
	Wbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=QlvbnldpsRFQInQQATmijjGWQn2NNKSL0l1kxp7aEOo=;
	b=K7kbrv05t7fojU6Znvj3+p9pls+oZGX0H5Y62/F37lbfqinUCj77DfAE2aSaro7wcf
	ixoSz0aFnkAmu74zrdoQ9p5jZzCwAxtzZkv7xgyGD50B8gDg6qWJujXL9hVQx0V2d/yo
	3yoMzVK1NXbaJRV8sBoOEiCyN3TdWYcsWZQwLO+I+4L4QnbQ3J7CBUjwR9/OE/XKyGJp
	ICOWJinVSz2dl+xVc+84bjL72fbz/veeysn2QZrizCZ4F1QnmVtfEdTEpIyzOAiuPwHH
	sAIc7iR7dYMOirQ4GRGdCrkqCf4Ya6EI8d3/RROV8UtisrR3cQ2bbFHe195VPpKNRAEs
	BJHg==
X-Gm-Message-State: ALoCoQkhD/xKE1BagRO90Zk7nMwDX4JtQLiGwMnEwXkXJ//FJ+EvAfBZgmZNFAcBiUpWMj3PF5U+8tmITV2L92kfP443+3NQrQ==
X-Received: by 10.25.42.16 with SMTP id q16mr13353071lfq.58.1453403087981;
	Thu, 21 Jan 2016 11:04:47 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163])
	by smtp.gmail.com with ESMTPSA id m21sm382496lfe.29.2016.01.21.11.04.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jan 2016 11:04:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jan 2016 22:03:49 +0300
Message-Id: <3ceca99fa19a5251a9ed121a4645c59fdad61150.1453402860.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
In-Reply-To: <cover.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v11 6/7] hw/ptimer: Legalize running with delta
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
X-TUID: 1z3OmvNANMsL

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
---
 hw/core/ptimer.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 142cc64..cec59e1 100644
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
@@ -164,10 +162,7 @@ void ptimer_run(ptimer_state *s, int oneshot)
 {
     bool was_disabled = !s->enabled;
 
-    if (was_disabled && s->period == 0) {
-        fprintf(stderr, "Timer with period zero, disabling\n");
-        return;
-    }
+    g_assert(s->period != 0);
     s->enabled = oneshot ? 2 : 1;
     if (was_disabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
@@ -190,6 +185,7 @@ void ptimer_stop(ptimer_state *s)
 /* Set counter increment interval in nanoseconds.  */
 void ptimer_set_period(ptimer_state *s, int64_t period)
 {
+    g_assert(period != 0);
     s->delta = ptimer_get_count(s);
     s->period = period;
     s->period_frac = 0;
@@ -202,6 +198,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
+    g_assert(freq != 0);
     s->delta = ptimer_get_count(s);
     s->period = 1000000000ll / freq;
     s->period_frac = (1000000000ll << 32) / freq;
-- 
2.7.0


Received: by 10.25.27.66 with SMTP id b63csp277224lfb;
        Fri, 27 May 2016 10:09:40 -0700 (PDT)
X-Received: by 10.200.39.221 with SMTP id x29mr14953849qtx.33.1464368979949;
        Fri, 27 May 2016 10:09:39 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f42si18368299qtf.57.2016.05.27.10.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 10:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6LGV-0006dL-9t
	for alex.bennee@linaro.org; Fri, 27 May 2016 13:09:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBr-0002Ne-0w
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:04:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBp-0003q2-8p
	for qemu-devel@nongnu.org; Fri, 27 May 2016 13:04:50 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:32873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6LBo-0003pi-SQ; Fri, 27 May 2016 13:04:49 -0400
Received: by mail-lf0-x244.google.com with SMTP id w16so6862263lfd.0;
	Fri, 27 May 2016 10:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7+OBJgTFJtU61VkT3LMI4sYxF4THC64oButuLvNzVV0=;
	b=sPlwM9Lr+3LfnunsFBDO7XhN+R1JTD5AScyFHq4ze3jE9TplKPGPOSaA/XfPSJw57h
	sP2GJezZsN2yquyXCP8tB3eY2BQfSdvWVm0bU0XtIpPBokGTZyIB56xIKj6CHuZ9yuZQ
	OwTBRyf79Sk4tTo0YJPQx4/qcrvRVz/TF4EM6Y5k97UjUozMRam46Rb+3aOrAuEqpYmz
	6nVdGjsSqUlh+aPa8GybZi+71XBUPsrrOog0N08wX4wkfsy3n8adD3iqWmhCEzBLdvKI
	t46FzL10YK+HWY8sw7xB5KE7IRCu4X4Pr2PfoyrkCAiXIc9oGfZiEqDiXwX5cpaWmaEd
	AU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=7+OBJgTFJtU61VkT3LMI4sYxF4THC64oButuLvNzVV0=;
	b=iqukZqiBHefJH3H2OhWITBT7vZQxROlMjshZY9o+/xh6w+SllNJ6XKt1NWC64udGnN
	6C6aXKOseiEeoSg4ESinK5p3lABi3d23oHUoAg0d+Q8dzSt0qiOXO/Krhc2L04clNII2
	4F+7uv09Aa1i/9ybMx7CFO9jkBLXX9nyLJkesZwTLWuY2dE2S4ceQAMWj/3xz7D4qxgr
	8GBN/FdofYB0OZw+coIDfuwTvGVLJJ34gNaw/+h0O4k0Dg/PYXa2u0J+2E9XJPMTbPQ4
	Drd4dXQFHtWa07tjbIa2o7hVguXd3J8d0m3X4QxUcDo9j6qUn9FO27BnsJS1k44fLui6
	UVmw==
X-Gm-Message-State: ALyK8tIVvsulTpN3fUCgnROMfjuUy0/VvW+tEwefecn1qcRRE1bt4VpoVH9hEnR22+JMaQ==
X-Received: by 10.25.78.3 with SMTP id c3mr3968990lfb.143.1464368687965;
	Fri, 27 May 2016 10:04:47 -0700 (PDT)
Received: from localhost.localdomain ([109.252.52.1])
	by smtp.gmail.com with ESMTPSA id p4sm3123088lfe.40.2016.05.27.10.04.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 10:04:47 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 27 May 2016 20:03:34 +0300
Message-Id: <97318fe5bbe95202ca2d96e72a31c597a148ea77.1464367869.git.digetx@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-devel] [PATCH v13 6/8] hw/ptimer: Support running with
 counter = 0 by introducing new policy feature
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
X-TUID: 0kv9fyFY0sBq

Currently ptimer prints error message and clears enable flag for an arming
timer that has delta = load = 0. That actually is a valid case for most
of the timers, like instant IRQ trigger for oneshot timer or continuous in
periodic mode. There are different possible policies of how particular timer
could interpret setting counter to 0, like:

1) Immediate stop with triggering the interrupt in oneshot mode. Immediate
   wraparound with triggering the interrupt in continuous mode.

2) Immediate stop without triggering the interrupt in oneshot mode. Immediate
   wraparound without triggering the interrupt in continuous mode.

3) Stopping with triggering the interrupt after one period in oneshot mode.
   Wraparound with triggering the interrupt in continuous mode after one
   period.

4) Stopping without triggering the interrupt after one period in oneshot mode.
   Wraparound without triggering the interrupt in continuous mode after one
   period.

As well as handling oneshot/continuous modes differently.

Given that, currently, running the timer with counter/period equal to 0 is
treated as a error case, it's not obvious what policies should be supported
by ptimer. Let's implement the third policy for now, as it is known to be
used by the ARM MPTimer.

Explicitly forbid running with counter/period == 0 in all cases by aborting
QEMU execution instead of printing the error message.

Bump VMSD version since a new VMState member is added.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/core/ptimer.c    | 53 +++++++++++++++++++++++++++++++----------------------
 include/hw/ptimer.h |  6 ++++++
 2 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 05b0c27..9bc70f5 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -21,6 +21,7 @@ struct ptimer_state
     int64_t period;
     int64_t last_event;
     int64_t next_event;
+    uint8_t policy;
     QEMUBH *bh;
     QEMUTimer *timer;
 };
@@ -37,15 +38,16 @@ static void ptimer_reload(ptimer_state *s)
 {
     uint32_t period_frac = s->period_frac;
     uint64_t period = s->period;
+    uint64_t delta = MAX(1, s->delta);
 
-    if (s->delta == 0) {
-        ptimer_trigger(s);
-        s->delta = s->limit;
+    if (s->delta == 0 && s->policy == UNIMPLEMENTED) {
+        hw_error("ptimer: Running with counter=0 is unimplemented by " \
+                 "this timer, fix it!\n");
     }
-    if (s->delta == 0 || s->period == 0) {
-        fprintf(stderr, "Timer with period zero, disabling\n");
-        s->enabled = 0;
-        return;
+
+    if (period == 0) {
+        hw_error("ptimer: Timer tries to run with period=0, behaviour is " \
+                 "undefined, fix it!\n");
     }
 
     /*
@@ -57,15 +59,15 @@ static void ptimer_reload(ptimer_state *s)
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
@@ -73,27 +75,30 @@ static void ptimer_reload(ptimer_state *s)
 static void ptimer_tick(void *opaque)
 {
     ptimer_state *s = (ptimer_state *)opaque;
-    ptimer_trigger(s);
-    s->delta = 0;
-    if (s->enabled == 2) {
+
+    s->delta = (s->enabled == 1) ? s->limit : 0;
+
+    if (s->delta == 0) {
         s->enabled = 0;
     } else {
         ptimer_reload(s);
     }
+
+    ptimer_trigger(s);
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
@@ -165,11 +170,8 @@ void ptimer_run(ptimer_state *s, int oneshot)
 {
     bool was_disabled = !s->enabled;
 
-    if (was_disabled && s->period == 0) {
-        fprintf(stderr, "Timer with period zero, disabling\n");
-        return;
-    }
     s->enabled = oneshot ? 2 : 1;
+
     if (was_disabled) {
         s->next_event = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
         ptimer_reload(s);
@@ -203,6 +205,7 @@ void ptimer_set_period(ptimer_state *s, int64_t period)
 /* Set counter frequency in Hz.  */
 void ptimer_set_freq(ptimer_state *s, uint32_t freq)
 {
+    g_assert(freq != 0 && freq <= 1000000000);
     s->delta = ptimer_get_count(s);
     s->period = 1000000000ll / freq;
     s->period_frac = (1000000000ll << 32) / freq;
@@ -230,10 +233,15 @@ uint64_t ptimer_get_limit(ptimer_state *s)
     return s->limit;
 }
 
+void ptimer_set_policy(ptimer_state *s, enum ptimer_policy policy)
+{
+    s->policy = policy;
+}
+
 const VMStateDescription vmstate_ptimer = {
     .name = "ptimer",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(enabled, ptimer_state),
         VMSTATE_UINT64(limit, ptimer_state),
@@ -243,6 +251,7 @@ const VMStateDescription vmstate_ptimer = {
         VMSTATE_INT64(last_event, ptimer_state),
         VMSTATE_INT64(next_event, ptimer_state),
         VMSTATE_TIMER_PTR(timer, ptimer_state),
+        VMSTATE_UINT8(policy, ptimer_state),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/ptimer.h b/include/hw/ptimer.h
index e397db5..221f591 100644
--- a/include/hw/ptimer.h
+++ b/include/hw/ptimer.h
@@ -12,6 +12,11 @@
 #include "qemu/timer.h"
 #include "migration/vmstate.h"
 
+enum ptimer_policy {
+    UNIMPLEMENTED,
+    SET_CNT_TO_0_TRIGGERS_IRQ_AFTER_ONE_PERIOD,
+};
+
 /* ptimer.c */
 typedef struct ptimer_state ptimer_state;
 typedef void (*ptimer_cb)(void *opaque);
@@ -25,6 +30,7 @@ uint64_t ptimer_get_count(ptimer_state *s);
 void ptimer_set_count(ptimer_state *s, uint64_t count);
 void ptimer_run(ptimer_state *s, int oneshot);
 void ptimer_stop(ptimer_state *s);
+void ptimer_set_policy(ptimer_state *s, enum ptimer_policy policy);
 
 extern const VMStateDescription vmstate_ptimer;
 
-- 
2.8.3


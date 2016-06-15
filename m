Received: by 10.25.21.96 with SMTP id l93csp409877lfi;
        Wed, 15 Jun 2016 00:04:35 -0700 (PDT)
X-Received: by 10.55.40.68 with SMTP id o65mr23019154qkh.201.1465974275656;
        Wed, 15 Jun 2016 00:04:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si21190122qke.40.2016.06.15.00.04.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Jun 2016 00:04:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40100 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bD4sN-0002De-2l
	for alex.bennee@linaro.org; Wed, 15 Jun 2016 03:04:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bD4sI-00027n-1k
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 03:04:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bD4sD-0004tL-Ow
	for qemu-arm@nongnu.org; Wed, 15 Jun 2016 03:04:28 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:45726
	helo=homiemail-a12.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bD4sD-0004tE-DW; Wed, 15 Jun 2016 03:04:25 -0400
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id 88B7B1030063; 
	Wed, 15 Jun 2016 00:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id; s=aj.id.au; bh=biDWcYDdlQQWEj3IYjmdiPJ
	MgiM=; b=QOFWfb/5Z36TJXluLL8EvU5vPkuavMZ3zBYux+ZWtKVIOTfevB4JQMj
	Iuyma5H5C4VxxJukVZEgbIlaWBTAhcx2vbKkmoU0nAL4VuCZ8PfPSa6x2FQprEzh
	UWZHOBdW/4fAIh2aLbtnT1tj3dsKNaI+8285+z+ql2p1DpkVDBhk=
Received: from keelia.au.ibm.com (orion.jms.id.au [119.9.53.35])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id 33B2C1030062;
	Wed, 15 Jun 2016 00:04:20 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Jun 2016 17:04:08 +1000
Message-Id: <1465974248-20434-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Subject: [Qemu-arm] [PATCH v2] hw/timer: Add value matching support to
 aspeed_timer
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
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
	qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z8X2UDFBKfVR

Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=y on the
palmetto-bmc machine. Two match registers are provided for each timer.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
Since v1: Address comments from Peter

* Switch calculations to use muldiv64()
* Switch to loops when calculating the next event after wrap
* Bump VMStateDescription versions as required

 hw/timer/aspeed_timer.c         | 138 +++++++++++++++++++++++++++++-----------
 include/hw/timer/aspeed_timer.h |   5 +-
 2 files changed, 104 insertions(+), 39 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 4b94808821b4..9b70ee09b07f 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -10,12 +10,10 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/ptimer.h"
 #include "hw/sysbus.h"
 #include "hw/timer/aspeed_timer.h"
 #include "qemu-common.h"
 #include "qemu/bitops.h"
-#include "qemu/main-loop.h"
 #include "qemu/timer.h"
 #include "qemu/log.h"
 #include "trace.h"
@@ -77,21 +75,96 @@ static inline bool timer_can_pulse(AspeedTimer *t)
     return t->id >= TIMER_FIRST_CAP_PULSE;
 }
 
+static inline bool timer_external_clock(AspeedTimer *t)
+{
+    return timer_ctrl_status(t, op_external_clock);
+}
+
+static uint32_t clock_rates[] = { TIMER_CLOCK_APB_HZ, TIMER_CLOCK_EXT_HZ };
+
+static inline uint32_t calculate_rate(struct AspeedTimer *t)
+{
+    return clock_rates[timer_external_clock(t)];
+}
+
+static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t now_ns)
+{
+    uint64_t delta_ns = now_ns - MIN(now_ns, t->start);
+    uint32_t rate = calculate_rate(t);
+    uint64_t ticks = muldiv64(delta_ns, rate, NANOSECONDS_PER_SECOND);
+
+    return t->reload - MIN(t->reload, ticks);
+}
+
+static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
+{
+    uint64_t delta_ns;
+    uint64_t delta_ticks;
+
+    delta_ticks = t->reload - MIN(t->reload, ticks);
+    delta_ns = muldiv64(delta_ticks, NANOSECONDS_PER_SECOND, calculate_rate(t));
+
+    return t->start + delta_ns;
+}
+
+static uint64_t calculate_next(struct AspeedTimer *t)
+{
+    uint64_t next = 0;
+    uint32_t rate = calculate_rate(t);
+
+    while (!next) {
+        /* We don't know the relationship between the values in the match
+         * registers, so sort using MAX/MIN/zero. We sort in that order as the
+         * timer counts down to zero. */
+        uint64_t seq[] = {
+            calculate_time(t, MAX(t->match[0], t->match[1])),
+            calculate_time(t, MIN(t->match[0], t->match[1])),
+            calculate_time(t, 0),
+        };
+        uint64_t reload_ns;
+        uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+
+        if (now < seq[0]) {
+            next = seq[0];
+        } else if (now < seq[1]) {
+            next = seq[1];
+        } else if (now < seq[2]) {
+            next = seq[2];
+        } else {
+            reload_ns = muldiv64(t->reload, NANOSECONDS_PER_SECOND, rate);
+            t->start = now - ((now - t->start) % reload_ns);
+        }
+    }
+
+    return next;
+}
+
 static void aspeed_timer_expire(void *opaque)
 {
     AspeedTimer *t = opaque;
+    bool interrupt = false;
+    uint32_t ticks;
 
-    /* Only support interrupts on match values of zero for the moment - this is
-     * sufficient to boot an aspeed_defconfig Linux kernel.
-     *
-     * TODO: matching on arbitrary values (see e.g. hw/timer/a9gtimer.c)
-     */
-    bool match = !(t->match[0] && t->match[1]);
-    bool interrupt = timer_overflow_interrupt(t) || match;
-    if (timer_enabled(t) && interrupt) {
+    if (!timer_enabled(t)) {
+        return;
+    }
+
+    ticks = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
+
+    if (!ticks) {
+        interrupt = timer_overflow_interrupt(t) || !t->match[0] || !t->match[1];
+    } else if (ticks <= MIN(t->match[0], t->match[1])) {
+        interrupt = true;
+    } else if (ticks <= MAX(t->match[0], t->match[1])) {
+        interrupt = true;
+    }
+
+    if (interrupt) {
         t->level = !t->level;
         qemu_set_irq(t->irq, t->level);
     }
+
+    timer_mod(&t->timer, calculate_next(t));
 }
 
 static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
@@ -100,7 +173,7 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
 
     switch (reg) {
     case TIMER_REG_STATUS:
-        value = ptimer_get_count(t->timer);
+        value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case TIMER_REG_RELOAD:
         value = t->reload;
@@ -160,24 +233,22 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
     switch (reg) {
     case TIMER_REG_STATUS:
         if (timer_enabled(t)) {
-            ptimer_set_count(t->timer, value);
+            uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            int64_t delta = (int64_t) value - (int64_t) calculate_ticks(t, now);
+            uint32_t rate = calculate_rate(t);
+
+            t->start += muldiv64(delta, NANOSECONDS_PER_SECOND, rate);
+            timer_mod(&t->timer, calculate_next(t));
         }
         break;
     case TIMER_REG_RELOAD:
         t->reload = value;
-        ptimer_set_limit(t->timer, value, 1);
         break;
     case TIMER_REG_MATCH_FIRST:
     case TIMER_REG_MATCH_SECOND:
-        if (value) {
-            /* Non-zero match values are unsupported. As such an interrupt will
-             * always be triggered when the timer reaches zero even if the
-             * overflow interrupt control bit is clear.
-             */
-            qemu_log_mask(LOG_UNIMP, "%s: Match value unsupported by device: "
-                    "0x%" PRIx32 "\n", __func__, value);
-        } else {
-            t->match[reg - 2] = value;
+        t->match[reg - 2] = value;
+        if (timer_enabled(t)) {
+            timer_mod(&t->timer, calculate_next(t));
         }
         break;
     default:
@@ -196,21 +267,16 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *t, bool enable)
 {
     trace_aspeed_timer_ctrl_enable(t->id, enable);
     if (enable) {
-        ptimer_run(t->timer, 0);
+        t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+        timer_mod(&t->timer, calculate_next(t));
     } else {
-        ptimer_stop(t->timer);
-        ptimer_set_limit(t->timer, t->reload, 1);
+        timer_del(&t->timer);
     }
 }
 
 static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool enable)
 {
     trace_aspeed_timer_ctrl_external_clock(t->id, enable);
-    if (enable) {
-        ptimer_set_freq(t->timer, TIMER_CLOCK_EXT_HZ);
-    } else {
-        ptimer_set_freq(t->timer, TIMER_CLOCK_APB_HZ);
-    }
 }
 
 static void aspeed_timer_ctrl_overflow_interrupt(AspeedTimer *t, bool enable)
@@ -351,12 +417,10 @@ static const MemoryRegionOps aspeed_timer_ops = {
 
 static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id)
 {
-    QEMUBH *bh;
     AspeedTimer *t = &s->timers[id];
 
     t->id = id;
-    bh = qemu_bh_new(aspeed_timer_expire, t);
-    t->timer = ptimer_init(bh);
+    timer_init_ns(&t->timer, QEMU_CLOCK_VIRTUAL, aspeed_timer_expire, t);
 }
 
 static void aspeed_timer_realize(DeviceState *dev, Error **errp)
@@ -399,12 +463,12 @@ static void aspeed_timer_reset(DeviceState *dev)
 
 static const VMStateDescription vmstate_aspeed_timer = {
     .name = "aspeed.timer",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(id, AspeedTimer),
         VMSTATE_INT32(level, AspeedTimer),
-        VMSTATE_PTIMER(timer, AspeedTimer),
+        VMSTATE_TIMER(timer, AspeedTimer),
         VMSTATE_UINT32(reload, AspeedTimer),
         VMSTATE_UINT32_ARRAY(match, AspeedTimer, 2),
         VMSTATE_END_OF_LIST()
@@ -419,7 +483,7 @@ static const VMStateDescription vmstate_aspeed_timer_state = {
         VMSTATE_UINT32(ctrl, AspeedTimerCtrlState),
         VMSTATE_UINT32(ctrl2, AspeedTimerCtrlState),
         VMSTATE_STRUCT_ARRAY(timers, AspeedTimerCtrlState,
-                             ASPEED_TIMER_NR_TIMERS, 1, vmstate_aspeed_timer,
+                             ASPEED_TIMER_NR_TIMERS, 2, vmstate_aspeed_timer,
                              AspeedTimer),
         VMSTATE_END_OF_LIST()
     }
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index 44dc2f89d5c6..bd6c1a7f9609 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -22,7 +22,7 @@
 #ifndef ASPEED_TIMER_H
 #define ASPEED_TIMER_H
 
-#include "hw/ptimer.h"
+#include "qemu/timer.h"
 
 #define ASPEED_TIMER(obj) \
     OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
@@ -33,15 +33,16 @@ typedef struct AspeedTimer {
     qemu_irq irq;
 
     uint8_t id;
+    QEMUTimer timer;
 
     /**
      * Track the line level as the ASPEED timers implement edge triggered
      * interrupts, signalling with both the rising and falling edge.
      */
     int32_t level;
-    ptimer_state *timer;
     uint32_t reload;
     uint32_t match[2];
+    uint64_t start;
 } AspeedTimer;
 
 typedef struct AspeedTimerCtrlState {
-- 
2.7.4


Received: by 10.25.27.66 with SMTP id b63csp44278lfb;
        Thu, 26 May 2016 22:10:28 -0700 (PDT)
X-Received: by 10.140.250.194 with SMTP id v185mr12113245qhc.15.1464325828153;
        Thu, 26 May 2016 22:10:28 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p10si6927337qgp.123.2016.05.26.22.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 22:10:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44017 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6A2V-0006l5-J0
	for alex.bennee@linaro.org; Fri, 27 May 2016 01:10:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54635)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1b6A2Q-0006iz-PF
	for qemu-arm@nongnu.org; Fri, 27 May 2016 01:10:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1b6A2M-00043R-IQ
	for qemu-arm@nongnu.org; Fri, 27 May 2016 01:10:22 -0400
Received: from hapkido.dreamhost.com ([66.33.216.122]:53177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1b6A2M-00043E-75; Fri, 27 May 2016 01:10:18 -0400
Received: from homiemail-a76.g.dreamhost.com (sub3.mail.dreamhost.com
	[69.163.253.7])
	by hapkido.dreamhost.com (Postfix) with ESMTP id F394297ECE;
	Thu, 26 May 2016 22:10:15 -0700 (PDT)
Received: from homiemail-a76.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTP id 3FE9A45807B;
	Thu, 26 May 2016 22:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id; s=aj.id.au; bh=pd4KBKybhKBADW3kQYL87x2
	zErI=; b=xtQ2gy/SQteaybQ9A414wJlZ+4YZY062j0cc3Dw+1YcC8HijOFqMl8p
	XCMokCKnuF2c72Qg6rLxtHLGjsEO6EgXShJhBO6G3TRKPdTmMSW05oq+pKp0l4k+
	/6BGTb/K6IBfq/4X+i/F9K8HSgMrw8NVWRN/c/hnb1J4My2YBWgQ=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a76.g.dreamhost.com (Postfix) with ESMTPSA id 5BD42458079; 
	Thu, 26 May 2016 22:10:10 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 May 2016 14:38:26 +0930
Message-Id: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 66.33.216.122
Subject: [Qemu-arm] [PATCH] hw/timer: Add value matching support to
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
X-TUID: 6e2TA4PNLUwH

Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=y on the
palmetto-bmc machine. Two match registers are provided for each timer.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---

The change pulls out ptimer in favour of the regular timer infrastructure. As a
consequence it implements the conversions between ticks and time which feels a
little tedious. Any comments there would be appreciated.

 hw/timer/aspeed_timer.c         | 135 ++++++++++++++++++++++++++++++----------
 include/hw/timer/aspeed_timer.h |   6 +-
 2 files changed, 105 insertions(+), 36 deletions(-)

diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
index 4b94808821b4..905de0f788b2 100644
--- a/hw/timer/aspeed_timer.c
+++ b/hw/timer/aspeed_timer.c
@@ -9,13 +9,12 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <math.h>
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
@@ -77,21 +76,99 @@ static inline bool timer_can_pulse(AspeedTimer *t)
     return t->id >= TIMER_FIRST_CAP_PULSE;
 }
 
+static inline bool timer_external_clock(AspeedTimer *t)
+{
+    return timer_ctrl_status(t, op_external_clock);
+}
+
+static double clock_rates[] = { TIMER_CLOCK_APB_HZ, TIMER_CLOCK_EXT_HZ };
+
+static inline double calculate_rate(struct AspeedTimer *t)
+{
+    return clock_rates[timer_external_clock(t)];
+}
+
+static inline double calculate_period(struct AspeedTimer *t)
+{
+    return NANOSECONDS_PER_SECOND / calculate_rate(t);
+}
+
+static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t now_ns)
+{
+    uint64_t delta_ns = now_ns - MIN(now_ns, t->start);
+    uint32_t ticks = (uint32_t) floor(delta_ns / calculate_period(t));
+
+    return t->reload - MIN(t->reload, ticks);
+}
+
+static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
+{
+    uint64_t delta_ns;
+
+    ticks = MIN(t->reload, ticks);
+    delta_ns = (uint64_t) floor((t->reload - ticks) * calculate_period(t));
+
+    return t->start + delta_ns;
+}
+
+static uint64_t calculate_next(struct AspeedTimer *t)
+{
+    uint64_t now;
+    uint64_t next;
+    int i;
+    /* We don't know the relationship between the values in the match
+     * registers, so sort using MAX/MIN/zero. We sort in that order as the
+     * timer counts down to zero. */
+    uint64_t seq[] = {
+        MAX(t->match[0], t->match[1]),
+        MIN(t->match[0], t->match[1]),
+        0,
+    };
+
+    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    for (i = 0; i < ARRAY_SIZE(seq); i++) {
+        next = calculate_time(t, seq[i]);
+        if (now < next) {
+            return next;
+        }
+    }
+
+    {
+        uint64_t reload_ns;
+
+        reload_ns = (uint64_t) floor(t->reload * calculate_period(t));
+        t->start = now - ((now - t->start) % reload_ns);
+    }
+
+    return calculate_next(t);
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
@@ -100,7 +177,7 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
 
     switch (reg) {
     case TIMER_REG_STATUS:
-        value = ptimer_get_count(t->timer);
+        value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
         break;
     case TIMER_REG_RELOAD:
         value = t->reload;
@@ -160,24 +237,21 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
     switch (reg) {
     case TIMER_REG_STATUS:
         if (timer_enabled(t)) {
-            ptimer_set_count(t->timer, value);
+            uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+            int64_t delta = (int64_t) value - (int64_t) calculate_ticks(t, now);
+
+            t->start += delta * calculate_period(t);
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
@@ -196,21 +270,16 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *t, bool enable)
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
@@ -351,12 +420,10 @@ static const MemoryRegionOps aspeed_timer_ops = {
 
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
@@ -404,7 +471,7 @@ static const VMStateDescription vmstate_aspeed_timer = {
     .fields = (VMStateField[]) {
         VMSTATE_UINT8(id, AspeedTimer),
         VMSTATE_INT32(level, AspeedTimer),
-        VMSTATE_PTIMER(timer, AspeedTimer),
+        VMSTATE_TIMER(timer, AspeedTimer),
         VMSTATE_UINT32(reload, AspeedTimer),
         VMSTATE_UINT32_ARRAY(match, AspeedTimer, 2),
         VMSTATE_END_OF_LIST()
diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index 44dc2f89d5c6..970fea83143c 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -22,7 +22,8 @@
 #ifndef ASPEED_TIMER_H
 #define ASPEED_TIMER_H
 
-#include "hw/ptimer.h"
+#include "qemu/typedefs.h"
+#include "qemu/timer.h"
 
 #define ASPEED_TIMER(obj) \
     OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
@@ -33,15 +34,16 @@ typedef struct AspeedTimer {
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


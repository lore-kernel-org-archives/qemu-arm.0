Received: by 10.25.27.66 with SMTP id b63csp276616lfb;
        Fri, 27 May 2016 10:08:32 -0700 (PDT)
X-Received: by 10.55.195.193 with SMTP id r62mr5810542qkl.23.1464368912165;
        Fri, 27 May 2016 10:08:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s71si18289752qka.256.2016.05.27.10.08.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 May 2016 10:08:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b6LFP-0005vV-IH
	for alex.bennee@linaro.org; Fri, 27 May 2016 13:08:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55535)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LC3-0002Zl-Mu
	for qemu-arm@nongnu.org; Fri, 27 May 2016 13:05:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1b6LBx-0003sk-8o
	for qemu-arm@nongnu.org; Fri, 27 May 2016 13:05:03 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1b6LBq-0003qS-QG; Fri, 27 May 2016 13:04:51 -0400
Received: by mail-lf0-x243.google.com with SMTP id h68so1931395lfh.3;
	Fri, 27 May 2016 10:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RR9T7d3zf70kO6zG8kJY3gwfIeXef4aqblBuheO2KWs=;
	b=vRnxA8eatAfTIigj+VD1hxKnrC4np73Jsl3nEp7I7QxrTEkxGh9SIk2aY8YuNFOtYh
	Mi6m76U1yJXgXWkRhdMJ0IPH8CSn6w84QLu4KftzOFn2+JOEil66H44o+W3WNVYyPZCL
	x75EwQ9uyfdp1wzVUhW0sZNOICyKkLD8bYCyrmsOYjcPrSAlUkWSJvAxChEvqI4KB7Me
	m1dDvH76Yu8RF473ZqaO8A1Moi8+VXkMOmZaFsvmtGW6b7f+0R7guQrV1SpaFoQfBABq
	E/PWX4+OGsjN7oZ95FdpxRLkbec/armsPE7viRnM1duJ5YmWvZ9SmppWCA11xVTSwDYo
	hmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=RR9T7d3zf70kO6zG8kJY3gwfIeXef4aqblBuheO2KWs=;
	b=Wm/LzmQkb9Np1pWv8DWEZ3rzyhDQ4z4MmXyLpFffnhkYqbLZggJq3FwbLZ+KF6UkHf
	GAJ32B7H0npO/uSwD+hGbYl6IrujHd6bgxHX1xQtk6iBo4RRUeQjxmr2lnjCH++Yncwa
	pPfED/DKlQ4ZUDPKOsWuwYoiSzJiZaFLe7C/aR3acUBrwMbyK9mWqjJ1/m7VgO2uzsKT
	OF43tKa+umR4ou2/0S7qUEk/K0udRoC570RrasYHUF4kZnqa6vkpftMVhgteM7Ky6Kam
	7HdEhdnAvjRuduhVLhjt6AypVlQYxZvPvWzW4iYhakaY8+gQGlVw38G+Afa9VLSVkwE9
	wD8g==
X-Gm-Message-State: ALyK8tIGHnm4ivvZmqWMBM1MZFFq+NC0kk8SKUibJGWT2tCjaH+1YqNKhReLmgcOmQeiHA==
X-Received: by 10.25.23.234 with SMTP id 103mr4008014lfx.38.1464368689876;
	Fri, 27 May 2016 10:04:49 -0700 (PDT)
Received: from localhost.localdomain ([109.252.52.1])
	by smtp.gmail.com with ESMTPSA id p4sm3123088lfe.40.2016.05.27.10.04.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 May 2016 10:04:49 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 27 May 2016 20:03:36 +0300
Message-Id: <4ce60d3c2d7d67d7787045e11de7537a5e5fba42.1464367869.git.digetx@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
In-Reply-To: <cover.1464367869.git.digetx@gmail.com>
References: <cover.1464367869.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-arm] [PATCH v13 8/8] arm_mptimer: Convert to use ptimer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YzceF0/o3u0h

Current ARM MPTimer implementation uses QEMUTimer for the actual timer,
this implementation isn't complete and mostly tries to duplicate of what
generic ptimer is already doing fine.

Conversion to ptimer brings the following benefits and fixes:
	- Simple timer pausing implementation
	- Fixes counter value preservation after stopping the timer
	- Correctly handles prescaler != 0 / counter = 0 / load = 0 cases
	- Code simplification and reduction

Use new ptimer policy feature to correctly emulate running with/setting
counter = 0.

Bump VMSD to version 3, since VMState is changed and is not compatible
with the previous implementation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/timer/arm_mptimer.c         | 135 ++++++++++++++++++++++-------------------
 include/hw/timer/arm_mptimer.h |   5 +-
 2 files changed, 72 insertions(+), 68 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index d66bbf0..bffc506 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -20,9 +20,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/ptimer.h"
 #include "hw/timer/arm_mptimer.h"
 #include "qapi/error.h"
-#include "qemu/timer.h"
+#include "qemu/main-loop.h"
 #include "qom/cpu.h"
 
 /* This device implements the per-cpu private timer and watchdog block
@@ -44,55 +45,54 @@ static inline void timerblock_update_irq(TimerBlock *tb)
 }
 
 /* Return conversion factor from mpcore timer ticks to qemu timer ticks.  */
-static inline uint32_t timerblock_scale(TimerBlock *tb)
+static inline uint32_t timerblock_scale(uint32_t control)
 {
-    return (((tb->control >> 8) & 0xff) + 1) * 10;
+    return (((control >> 8) & 0xff) + 1) * 10;
 }
 
-static void timerblock_reload(TimerBlock *tb, int restart)
+static inline void timerblock_set_count(struct ptimer_state *timer,
+                                        uint32_t control, uint64_t *count)
 {
-    if (tb->count == 0) {
-        return;
+    /* PTimer would immediately trigger interrupt for periodic timer
+     * when counter set to 0, MPtimer under certain condition only.
+     */
+    if ((control & 3) == 3 && (control & 0xff00) == 0 && *count == 0) {
+        *count = ptimer_get_limit(timer);
     }
-    if (restart) {
-        tb->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    ptimer_set_count(timer, *count);
+}
+
+static inline void timerblock_run(struct ptimer_state *timer,
+                                  uint32_t control, uint32_t load)
+{
+    if ((control & 1) && ((control & 0xff00) || load != 0)) {
+        ptimer_run(timer, !(control & 2));
     }
-    tb->tick += (int64_t)tb->count * timerblock_scale(tb);
-    timer_mod(tb->timer, tb->tick);
 }
 
 static void timerblock_tick(void *opaque)
 {
     TimerBlock *tb = (TimerBlock *)opaque;
     tb->status = 1;
-    if (tb->control & 2) {
-        tb->count = tb->load;
-        timerblock_reload(tb, 0);
-    } else {
-        tb->count = 0;
-    }
     timerblock_update_irq(tb);
+    /* Periodic timer with load = 0 and prescaler != 0 would re-trigger
+     * IRQ after one period, otherwise it either stops or wraps around.
+     */
+    if ((tb->control & 2) && (tb->control & 0xff00) &&
+            ptimer_get_limit(tb->timer) == 0) {
+        ptimer_run(tb->timer, 0);
+    }
 }
 
 static uint64_t timerblock_read(void *opaque, hwaddr addr,
                                 unsigned size)
 {
     TimerBlock *tb = (TimerBlock *)opaque;
-    int64_t val;
     switch (addr) {
     case 0: /* Load */
-        return tb->load;
+        return ptimer_get_limit(tb->timer);
     case 4: /* Counter.  */
-        if (((tb->control & 1) == 0) || (tb->count == 0)) {
-            return 0;
-        }
-        /* Slow and ugly, but hopefully won't happen too often.  */
-        val = tb->tick - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-        val /= timerblock_scale(tb);
-        if (val < 0) {
-            val = 0;
-        }
-        return val;
+        return ptimer_get_count(tb->timer);
     case 8: /* Control.  */
         return tb->control;
     case 12: /* Interrupt status.  */
@@ -106,37 +106,45 @@ static void timerblock_write(void *opaque, hwaddr addr,
                              uint64_t value, unsigned size)
 {
     TimerBlock *tb = (TimerBlock *)opaque;
-    int64_t old;
+    uint32_t control = tb->control;
     switch (addr) {
     case 0: /* Load */
-        tb->load = value;
-        /* Fall through.  */
-    case 4: /* Counter.  */
-        if ((tb->control & 1) && tb->count) {
-            /* Cancel the previous timer.  */
-            timer_del(tb->timer);
+        /* Setting load to 0 stops the timer without doing the tick if
+         * prescaler = 0.
+         */
+        if ((control & 1) && (control & 0xff00) == 0 && value == 0) {
+            ptimer_stop(tb->timer);
         }
-        tb->count = value;
-        if (tb->control & 1) {
-            timerblock_reload(tb, 1);
+        ptimer_set_limit(tb->timer, value, 1);
+        timerblock_run(tb->timer, control, value);
+        break;
+    case 4: /* Counter.  */
+        /* Setting counter to 0 stops the one-shot timer, or periodic with
+         * load == 0, without doing the tick if prescaler = 0.
+         */
+        if ((control & 1) && (control & 0xff00) == 0 && value == 0 &&
+                (!(control & 2) || ptimer_get_limit(tb->timer) == 0)) {
+            ptimer_stop(tb->timer);
         }
+        timerblock_set_count(tb->timer, control, &value);
+        timerblock_run(tb->timer, control, value);
         break;
     case 8: /* Control.  */
-        old = tb->control;
-        tb->control = value;
+        if ((control & 1) && !(value & 1)) {
+            ptimer_stop(tb->timer);
+        }
+        if ((control & 0xff00) != (value & 0xff00)) {
+            ptimer_set_period(tb->timer, timerblock_scale(value));
+        }
         if (value & 1) {
-            if ((old & 1) && (tb->count != 0)) {
-                /* Do nothing if timer is ticking right now.  */
-                break;
+            uint64_t count = ptimer_get_count(tb->timer);
+            /* Re-load periodic timer counter if needed.  */
+            if ((value & 2) && count == 0) {
+                timerblock_set_count(tb->timer, value, &count);
             }
-            if (tb->control & 2) {
-                tb->count = tb->load;
-            }
-            timerblock_reload(tb, 1);
-        } else if (old & 1) {
-            /* Shutdown the timer.  */
-            timer_del(tb->timer);
+            timerblock_run(tb->timer, value, count);
         }
+        tb->control = value;
         break;
     case 12: /* Interrupt status.  */
         tb->status &= ~value;
@@ -186,13 +194,12 @@ static const MemoryRegionOps timerblock_ops = {
 
 static void timerblock_reset(TimerBlock *tb)
 {
-    tb->count = 0;
-    tb->load = 0;
     tb->control = 0;
     tb->status = 0;
-    tb->tick = 0;
     if (tb->timer) {
-        timer_del(tb->timer);
+        ptimer_stop(tb->timer);
+        ptimer_set_limit(tb->timer, 0, 1);
+        ptimer_set_period(tb->timer, timerblock_scale(0));
     }
 }
 
@@ -238,7 +245,10 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
      */
     for (i = 0; i < s->num_cpu; i++) {
         TimerBlock *tb = &s->timerblock[i];
-        tb->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timerblock_tick, tb);
+        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
+        tb->timer = ptimer_init(bh);
+        ptimer_set_policy(tb->timer,
+                          SET_CNT_TO_0_TRIGGERS_IRQ_AFTER_ONE_PERIOD);
         sysbus_init_irq(sbd, &tb->irq);
         memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
                               "arm_mptimer_timerblock", 0x20);
@@ -248,26 +258,23 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_timerblock = {
     .name = "arm_mptimer_timerblock",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
-        VMSTATE_UINT32(count, TimerBlock),
-        VMSTATE_UINT32(load, TimerBlock),
         VMSTATE_UINT32(control, TimerBlock),
         VMSTATE_UINT32(status, TimerBlock),
-        VMSTATE_INT64(tick, TimerBlock),
-        VMSTATE_TIMER_PTR(timer, TimerBlock),
+        VMSTATE_PTIMER(timer, TimerBlock),
         VMSTATE_END_OF_LIST()
     }
 };
 
 static const VMStateDescription vmstate_arm_mptimer = {
     .name = "arm_mptimer",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT_VARRAY_UINT32(timerblock, ARMMPTimerState, num_cpu,
-                                     2, vmstate_timerblock, TimerBlock),
+                                     3, vmstate_timerblock, TimerBlock),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/timer/arm_mptimer.h b/include/hw/timer/arm_mptimer.h
index b34cba0..c46d8d2 100644
--- a/include/hw/timer/arm_mptimer.h
+++ b/include/hw/timer/arm_mptimer.h
@@ -27,12 +27,9 @@
 
 /* State of a single timer or watchdog block */
 typedef struct {
-    uint32_t count;
-    uint32_t load;
     uint32_t control;
     uint32_t status;
-    int64_t tick;
-    QEMUTimer *timer;
+    struct ptimer_state *timer;
     qemu_irq irq;
     MemoryRegion iomem;
 } TimerBlock;
-- 
2.8.3


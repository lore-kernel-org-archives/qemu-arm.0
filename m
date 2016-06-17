Received: by 10.25.21.96 with SMTP id l93csp270409lfi;
        Fri, 17 Jun 2016 06:40:55 -0700 (PDT)
X-Received: by 10.55.75.82 with SMTP id y79mr2253839qka.57.1466170855129;
        Fri, 17 Jun 2016 06:40:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n74si31441680qka.255.2016.06.17.06.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 06:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDu10-0001hW-G4
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 09:40:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bDtet-00038H-F8
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 09:18:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bDteq-0002s3-Sj
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 09:18:02 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34436)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bDtem-0002qb-Cc; Fri, 17 Jun 2016 09:17:57 -0400
Received: by mail-lf0-x244.google.com with SMTP id l184so8337649lfl.1;
	Fri, 17 Jun 2016 06:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=eTQ/DbY7q4xJPDwqP2n2YmnIK+8LG1BOY8yat7qhMmc=;
	b=xJcU4Yo1TsFshm/0fSex6oCV/fEfsIbGLtskcwBMm8wXZfAxcqohCagnP2Y2etK0bU
	PhfpzZkAmlYi11Cy4882KZtpXv8x5R/dDsiRNr36ZuKiKmUMNeB6RmJf+WpR8OPbl1WN
	cmBv6miVfF7kO8c6SGdSiIP6Uvaik98Yyi7IQIUkAVK1mf6Yo8SiLN3SzGFcqcJVDLZC
	IoUR4DhhYcPXA8PpIS4zEkyxr6R7iy1hb8U0AiHKsaMs/C3dS0XA5L8U4IIMYQewe9j1
	XJA9So4twzxo5Y2hDhEBkdp0s/OxPBuOsWXONGrOSZIo5mKyso1pCUkqhINEttDHh5o6
	9YLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=eTQ/DbY7q4xJPDwqP2n2YmnIK+8LG1BOY8yat7qhMmc=;
	b=kdEFOwinw047sVD3fWOJn+pAQt3akIPm1jDgUxfPXYBgl78jQL1oHsV4yn/sa5ZO4S
	N7fNfqDLbnU6Wzr/0AoI3RKbw9nDpxcL2KSsA+2y7NhG09tKKDXrZ7VuGr9dXmhWs8OM
	UDSGBbaUA20VNPpgN7KXjHnETbyzPd4mXx/3F27Emlt+94RiOddLxTZLKfm0YNvi7s07
	OTHseREIWNkN26Nf/AfaNunDEKaKk+puQnioKGHsk9yRBPfdoSo/obKIH5oif8ZDUqEb
	kIXl1SkVEWXgLIaMWuJnpV7H8NQABDmcj/tGYpNQEQJofahCPFn867ifrB0Tr/tv104U
	7sVw==
X-Gm-Message-State: ALyK8tLhwl65Gm73xd1pyBayXoe7nMxqKFksMPuPcuUymqG9s5dsWQ1hTVJrD6yLqSt0+A==
X-Received: by 10.25.21.223 with SMTP id 92mr551695lfv.19.1466169475588;
	Fri, 17 Jun 2016 06:17:55 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30])
	by smtp.gmail.com with ESMTPSA id d8sm2538183lbc.29.2016.06.17.06.17.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Jun 2016 06:17:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Fri, 17 Jun 2016 16:17:28 +0300
Message-Id: <c6acba917f720cedfeb4dc0583ff06ba833b69dc.1466167530.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1466167530.git.digetx@gmail.com>
References: <cover.1466167530.git.digetx@gmail.com>
In-Reply-To: <cover.1466167530.git.digetx@gmail.com>
References: <cover.1466167530.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: [Qemu-arm] [PATCH v14 3/3] arm_mptimer: Convert to use ptimer
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
X-TUID: Uy/ItUrDkF55

Current ARM MPTimer implementation uses QEMUTimer for the actual timer,
this implementation isn't complete and mostly tries to duplicate of what
generic ptimer is already doing fine.

Conversion to ptimer brings the following benefits and fixes:
	- Simple timer pausing implementation
	- Fixes counter value preservation after stopping the timer
	- Properly handles prescaler != 0 / counter = 0 / load = 0 cases
	- Code simplification and reduction

Bump VMSD to version 3, since VMState is changed and is not compatible
with the previous implementation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 hw/timer/arm_mptimer.c         | 133 +++++++++++++++++++++--------------------
 include/hw/timer/arm_mptimer.h |   5 +-
 2 files changed, 70 insertions(+), 68 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index d66bbf0..3616c40 100644
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
 
@@ -238,7 +245,8 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
      */
     for (i = 0; i < s->num_cpu; i++) {
         TimerBlock *tb = &s->timerblock[i];
-        tb->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timerblock_tick, tb);
+        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
+        tb->timer = ptimer_init(bh, PTIMER_POLICY_CNT_0_DEFERRED_TRIG);
         sysbus_init_irq(sbd, &tb->irq);
         memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
                               "arm_mptimer_timerblock", 0x20);
@@ -248,26 +256,23 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
 
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
2.9.0


Received: by 10.25.21.156 with SMTP id 28csp447936lfv;
        Thu, 21 Jul 2016 08:01:38 -0700 (PDT)
X-Received: by 10.37.207.71 with SMTP id f68mr15708256ybg.63.1469113298183;
        Thu, 21 Jul 2016 08:01:38 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4si5246339qkf.158.2016.07.21.08.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jul 2016 08:01:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bQFTl-0002W8-Ib
	for alex.bennee@linaro.org; Thu, 21 Jul 2016 11:01:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1k-0003Bh-6g
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bQF1f-0003pj-4Q
	for qemu-devel@nongnu.org; Thu, 21 Jul 2016 10:32:39 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:33569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bQF1e-0003pA-OE; Thu, 21 Jul 2016 10:32:35 -0400
Received: by mail-lf0-x243.google.com with SMTP id f93so5657141lfi.0;
	Thu, 21 Jul 2016 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RpoHcPKEvhxSGtCaw31xDuogMPS2E4LDZO1aMAxHpRY=;
	b=VV7kV92moaQPmV8jOduy1lFmi9nqdm6/BrxAuKIlP6O52txDo28F8qJbRFXJFKFL7W
	4L5tlsxEkZQbJzrNOhaPRUtT1X292GCKgxtwmWWjQdmgskjLz+WG4G2lykk97aHE9g48
	/HZiinLK7TW2gnLDHLNWEwIQOYnSszcyRStSsPaTbJFVDx8Y7hpa2EhZM8piKMlQuaxu
	412YW0vbw5iYdS0+ozaYmJI+0FM6K5plZULaLklP/XIhAfPKibzlx80rvG/WdVSQxtFE
	LSHExO3/GFBGyfcU1VpqI2ZzGEB4Y+l2+VJmE15Z7oDlCwU58FKGtLoyvPKQr2ZwNGyE
	5Vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=RpoHcPKEvhxSGtCaw31xDuogMPS2E4LDZO1aMAxHpRY=;
	b=iCTfWbhufVWcqjgGul6gZGPnfPqX7MB3UK86Dp/kcZSlRQIcu2h3cMXOAlPzM14OtH
	wayNhejuGtC52sN6ExYoOX3RNriY1rbW2hUj53/WRTA8hNqE/0HOx5bbd1mdqixYZuB1
	5waLkOF7/XOMsngP8uEKZXapSdiYY1L1cF/EYuKETOOnzRegknCVeI0ZMTPT1sAAprF5
	dLEetFO0RK1T0JPplon41J1SyXaRGJ1oWhJ9i/lzoOZ7S2weztXuxrl8NEoAgMwyb39D
	4xeC8/mFtH+DACcgwQEb8ivOGZ7HnzJ2QvqJZsrTP2oAorxsTGOLVWbLjroJg83z1iTs
	iJxQ==
X-Gm-Message-State: ALyK8tL8GSArI0HFDG5AQXb8UDnOPX51ztFY4doh3hOe7w4u8F4uo6yG5dO6AKu+9QW3Sg==
X-Received: by 10.25.23.210 with SMTP id 79mr26154527lfx.200.1469111553839;
	Thu, 21 Jul 2016 07:32:33 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-30.pppoe.spdop.ru.
	[109.252.52.30]) by smtp.gmail.com with ESMTPSA id
	c12sm1887932lfc.40.2016.07.21.07.32.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 07:32:32 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Thu, 21 Jul 2016 17:31:25 +0300
Message-Id: <0db565033afe46a8df6ef4cfbeb6bd1e39b33763.1469110137.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
In-Reply-To: <cover.1469110137.git.digetx@gmail.com>
References: <cover.1469110137.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-devel] [PATCH v15 14/15] arm_mptimer: Convert to use ptimer
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
X-TUID: CbeHHWZpxOE8

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
 hw/timer/arm_mptimer.c         | 148 ++++++++++++++++++++++-------------------
 include/hw/timer/arm_mptimer.h |   5 +-
 2 files changed, 82 insertions(+), 71 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index d66bbf0..2a0fc78 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -20,22 +20,32 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/ptimer.h"
 #include "hw/timer/arm_mptimer.h"
 #include "qapi/error.h"
-#include "qemu/timer.h"
+#include "qemu/main-loop.h"
 #include "qom/cpu.h"
 
+#define PTIMER_POLICY                       \
+    (PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD |  \
+     PTIMER_POLICY_CONTINUOUS_TRIGGER    |  \
+     PTIMER_POLICY_NO_IMMEDIATE_TRIGGER  |  \
+     PTIMER_POLICY_NO_IMMEDIATE_RELOAD)
+
 /* This device implements the per-cpu private timer and watchdog block
  * which is used in both the ARM11MPCore and Cortex-A9MP.
  */
 
 static inline int get_current_cpu(ARMMPTimerState *s)
 {
-    if (current_cpu->cpu_index >= s->num_cpu) {
+    int cpu_id = current_cpu ? current_cpu->cpu_index : 0;
+
+    if (cpu_id >= s->num_cpu) {
         hw_error("arm_mptimer: num-cpu %d but this cpu is %d!\n",
-                 s->num_cpu, current_cpu->cpu_index);
+                 s->num_cpu, cpu_id);
     }
-    return current_cpu->cpu_index;
+
+    return cpu_id;
 }
 
 static inline void timerblock_update_irq(TimerBlock *tb)
@@ -44,33 +54,42 @@ static inline void timerblock_update_irq(TimerBlock *tb)
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
+    /* PTimer would trigger interrupt for periodic timer when counter set
+     * to 0, MPtimer under certain condition only.
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
-    tb->status = 1;
-    if (tb->control & 2) {
-        tb->count = tb->load;
-        timerblock_reload(tb, 0);
-    } else {
-        tb->count = 0;
+    /* Periodic timer with load = 0 and prescaler != 0 would re-trigger
+     * IRQ after one period, otherwise it either stops or wraps around.
+     */
+    if ((tb->control & 2) && (tb->control & 0xff00) == 0 &&
+            ptimer_get_limit(tb->timer) == 0) {
+        ptimer_stop(tb->timer);
     }
+    tb->status = 1;
     timerblock_update_irq(tb);
 }
 
@@ -78,21 +97,11 @@ static uint64_t timerblock_read(void *opaque, hwaddr addr,
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
@@ -106,37 +115,45 @@ static void timerblock_write(void *opaque, hwaddr addr,
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
+         * load = 0, without doing the tick if prescaler = 0.
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
+        if ((control & 3) != (value & 3)) {
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
@@ -186,13 +203,12 @@ static const MemoryRegionOps timerblock_ops = {
 
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
 
@@ -238,7 +254,8 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
      */
     for (i = 0; i < s->num_cpu; i++) {
         TimerBlock *tb = &s->timerblock[i];
-        tb->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timerblock_tick, tb);
+        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
+        tb->timer = ptimer_init(bh, PTIMER_POLICY);
         sysbus_init_irq(sbd, &tb->irq);
         memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
                               "arm_mptimer_timerblock", 0x20);
@@ -248,26 +265,23 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
 
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
2.9.2


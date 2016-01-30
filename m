Received: by 10.25.159.19 with SMTP id i19csp1542361lfe;
        Sat, 30 Jan 2016 08:50:34 -0800 (PST)
X-Received: by 10.140.85.36 with SMTP id m33mr18126182qgd.91.1454172632443;
        Sat, 30 Jan 2016 08:50:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si22459152qhc.14.2016.01.30.08.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jan 2016 08:50:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aPYjH-00071Y-W1
	for alex.bennee@linaro.org; Sat, 30 Jan 2016 11:50:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgr-0002kI-8V
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:48:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aPYgm-0002HB-Nr
	for qemu-devel@nongnu.org; Sat, 30 Jan 2016 11:47:59 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:32898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aPYgm-0002GV-53; Sat, 30 Jan 2016 11:47:56 -0500
Received: by mail-lf0-x244.google.com with SMTP id e36so1788826lfi.0;
	Sat, 30 Jan 2016 08:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7wv/H5BCagyu00DuZbHu9erhDKxoH+SsI6iBbgjF0d8=;
	b=TPj7ZZnMV+8BSFvTPfjhGiIk8gYFYbG1JZVFtcwu0vreIQOSajlTXr6NowlQtGy80a
	RMTWHLWkFdIRCMr4VhriZAkuckYNM56Bb9Fza4upJJh39ZSDF9mGV6rKKN4dqjFLqlh7
	sIRwCoeZcR1QbavVPYeu6EFtlJdVDS3RxWozomN/h7B8kbwE0Yi5YL+ny1quhjA3OGr1
	cZYN6pvRU96fcrkd6yJY/uLhh9VHlWW8/1RB1wU1rQSb6xrWXQEyBrmAzXEUlXNGyVmc
	EzS3TM5DUyU+Cf6c9NptNYQf0s4JljK40D7TWQrIvPpyYyVMQqcA0z4/+iRADMUF2Ngj
	ABXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=7wv/H5BCagyu00DuZbHu9erhDKxoH+SsI6iBbgjF0d8=;
	b=ITrbuoZg5aaKKo0RNjhSgfxsxICGFH5HhkRCfktL7DWx/Mv91D+AtfIQQrdggMGEwk
	2ZWrbFfvLaCWfNQJVxJifZAfSvkRpEC2gIJ9yFLjIxCoBCl5S11g/jWMc/YdVtE334mj
	09A41/ovhyZnX+p4UymJ6gI6ovq21Nr6WEQ0dhio4yV31/inUNMBD13NhdCM9OctMxrZ
	gajD5z9RTmE2iVwGLxY/+dtB+5ZRSvEFxn+XmbDyIhIB18l2U0of3d84zGaj0x6voift
	NraX3nnM6vE254eAlFFAjDy/81V6G/Z0Z0MGeFvZIWQxvqI/hDZ4j42rRNzHuX4OTQdC
	ivCA==
X-Gm-Message-State: AG10YOTn7NDIYFHLVkeud+BDnAolDKYDqR8e682c5lOSZ27U5SnvPe1TY0LFRAjP0gNs9w==
X-Received: by 10.25.166.130 with SMTP id p124mr2790221lfe.120.1454172475382; 
	Sat, 30 Jan 2016 08:47:55 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	b135sm2834417lfe.28.2016.01.30.08.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jan 2016 08:47:54 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat, 30 Jan 2016 19:43:18 +0300
Message-Id: <8050a7dd5370480f4ce06fe5a8ece18a76975283.1454169735.git.digetx@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
In-Reply-To: <cover.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-devel] [PATCH v12 9/9] arm_mptimer: Convert to use ptimer
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
X-TUID: BVMKDkre6WvT

Current ARM MPTimer implementation uses QEMUTimer for the actual timer,
this implementation isn't complete and mostly tries to duplicate of what
generic ptimer is already doing fine.

Conversion to ptimer brings the following benefits and fixes:
	- Simple timer pausing implementation
	- Fixes counter value preservation after stopping the timer
	- Correctly handles prescaler != 0 / counter = 0 / load = 0 cases
	- Code simplification and reduction

Bump VMSD to version 3, since VMState is changed and is not compatible
with the previous implementation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/timer/arm_mptimer.c         | 133 +++++++++++++++++++++--------------------
 include/hw/timer/arm_mptimer.h |   5 +-
 2 files changed, 70 insertions(+), 68 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 5dfab66..f002458 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -19,8 +19,9 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
+#include "hw/ptimer.h"
 #include "hw/timer/arm_mptimer.h"
-#include "qemu/timer.h"
+#include "qemu/main-loop.h"
 #include "qom/cpu.h"
 
 /* This device implements the per-cpu private timer and watchdog block
@@ -42,55 +43,54 @@ static inline void timerblock_update_irq(TimerBlock *tb)
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
@@ -104,37 +104,45 @@ static void timerblock_write(void *opaque, hwaddr addr,
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
@@ -184,13 +192,12 @@ static const MemoryRegionOps timerblock_ops = {
 
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
 
@@ -236,7 +243,8 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
      */
     for (i = 0; i < s->num_cpu; i++) {
         TimerBlock *tb = &s->timerblock[i];
-        tb->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timerblock_tick, tb);
+        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
+        tb->timer = ptimer_init(bh);
         sysbus_init_irq(sbd, &tb->irq);
         memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
                               "arm_mptimer_timerblock", 0x20);
@@ -246,26 +254,23 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
 
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
2.7.0


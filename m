Received: by 10.25.134.130 with SMTP id i124csp1101311lfd;
        Sat, 9 Jan 2016 09:44:49 -0800 (PST)
X-Received: by 10.140.32.194 with SMTP id h60mr151318554qgh.79.1452361486234;
        Sat, 09 Jan 2016 09:44:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n187si106165190qhc.34.2016.01.09.09.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Jan 2016 09:44:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41777 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHxZF-000706-PV
	for alex.bennee@linaro.org; Sat, 09 Jan 2016 12:44:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXW-0003YD-R4
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 12:43:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHxXR-0000kl-Ov
	for qemu-arm@nongnu.org; Sat, 09 Jan 2016 12:42:58 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:34429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aHxXM-0000iA-SI; Sat, 09 Jan 2016 12:42:49 -0500
Received: by mail-lf0-x244.google.com with SMTP id n70so17776653lfn.1;
	Sat, 09 Jan 2016 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=0HwnqjtWW2IwoDO3aUatloe/0QX1L+SeUqOhB2/XflM=;
	b=m1UesSPIwQbQIQUZxoDHYYZjgQpbR64gIsHI2IrVWgH4sVpCvt5jEjhiuzfGpninya
	bd8WeN9wWNMAzSuRLMHTxObFWUBnp3k0DM8s3AM02obwVwvGfXLEh79bGM6mc+IaDs2y
	7vnPOqroc2fzEkiZEAjW3rO1PXHgixixe/kLVx2hdCKNdarsttcC6bqdaS1rYArHXYTQ
	WpfDyzUa9EMeWeQ0l/6h45aJ5bmCa9VwI1rW5kOvstSsY5jLPJ2nPJ/B7hSRu3TpIdaM
	nWlzPVtvOOE/gbfbQ9mOvk7pXipjI/ak6gxDDZHcWMVQJbzUEzXQwmRCFwA8gbA8Vncq
	LFtw==
X-Received: by 10.25.23.232 with SMTP id 101mr274888lfx.68.1452361368187;
	Sat, 09 Jan 2016 09:42:48 -0800 (PST)
Received: from localhost.localdomain (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.gmail.com with ESMTPSA id
	f186sm8406450lfd.26.2016.01.09.09.42.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jan 2016 09:42:47 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sat,  9 Jan 2016 20:39:55 +0300
Message-Id: <c0c346dfae4cc4d823a4bb10000af2af97e44b4d.1452359845.git.digetx@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
In-Reply-To: <cover.1452359845.git.digetx@gmail.com>
References: <cover.1452359845.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Subject: [Qemu-arm] [PATCH v10 7/7] arm_mptimer: Convert to use ptimer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fKybVowHwMCv

Current ARM MPTimer implementation uses QEMUTimer for the actual timer,
this implementation isn't complete and mostly tries to duplicate of what
generic ptimer is already doing fine.

Conversion to ptimer brings the following benefits and fixes:
	- Simple timer pausing implementation
	- Fixes counter value preservation after stopping the timer
	- Correctly handles prescaler != 0 cases
	- Code simplification and reduction

Bump VMSD to version 3, since VMState is changed and is not compatible
with the previous implementation.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 hw/timer/arm_mptimer.c         | 127 ++++++++++++++++++++---------------------
 include/hw/timer/arm_mptimer.h |   5 +-
 2 files changed, 63 insertions(+), 69 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 3e59c2a..5568300 100644
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
@@ -42,33 +43,33 @@ static inline void timerblock_update_irq(TimerBlock *tb)
 }
 
 /* Return conversion factor from mpcore timer ticks to qemu timer ticks.  */
-static inline uint32_t timerblock_scale(TimerBlock *tb)
+static inline uint32_t timerblock_scale(uint32_t control)
 {
-    return (((tb->control >> 8) & 0xff) + 1) * 10;
+    return (((control >> 8) & 0xff) + 1) * 10;
 }
 
-static void timerblock_reload(TimerBlock *tb, int restart)
+static inline void timerblock_set_count(TimerBlock *tb, uint32_t control,
+                                        uint64_t *count)
 {
-    if (tb->count == 0) {
-        return;
+    /* PTimer would immediately trigger interrupt for periodic timer
+     * when counter set to 0, MPtimer under certain condition only.  */
+    if ((control & 3) == 3 && (*count == 0) && (control & 0xff00) == 0) {
+        *count = ptimer_get_limit(tb->timer);
     }
-    if (restart) {
-        tb->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    ptimer_set_count(tb->timer, *count);
+}
+
+static inline void timerblock_run(TimerBlock *tb, uint32_t control, int cond)
+{
+    if (cond) {
+        ptimer_run(tb->timer, !(control & 2));
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
 }
 
@@ -76,21 +77,11 @@ static uint64_t timerblock_read(void *opaque, hwaddr addr,
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
@@ -104,39 +95,48 @@ static void timerblock_write(void *opaque, hwaddr addr,
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
+        /* Setting load to 0 stops the timer if prescaler == 0.  */
+        if ((control & 1) && (value == 0) && (control & 0xff00) == 0) {
+            ptimer_stop(tb->timer);
+            control &= ~1;
         }
-        tb->count = value;
-        if (tb->control & 1) {
-            timerblock_reload(tb, 1);
+        ptimer_set_limit(tb->timer, value, 1);
+        timerblock_run(tb, control, (control & 1));
+        break;
+    case 4: /* Counter.  */
+        /* Setting counter to 0 stops the one-shot timer if prescaler == 0.  */
+        if ((control & 3) == 1 && (value == 0) && (control & 0xff00) == 0) {
+            ptimer_stop(tb->timer);
+            control &= ~1;
         }
+        timerblock_set_count(tb, control, &value);
+        timerblock_run(tb, control, (value != 0) && (control & 1));
         break;
     case 8: /* Control.  */
-        old = tb->control;
-        tb->control = value;
-        if (value & 1) {
-            if ((old & 1) && (tb->count != 0)) {
-                /* Do nothing if timer is ticking right now.  */
-                break;
+        if ((value & 1) && (control & 3) != (value & 3)) {
+            uint64_t count = (value & 0xff00) ? 1 : ptimer_get_count(tb->timer);
+            if ((count == 0) && (value & 2)) {
+                timerblock_set_count(tb, value, &count);
             }
-            if (tb->control & 2) {
-                tb->count = tb->load;
-            }
-            timerblock_reload(tb, 1);
-        } else if (old & 1) {
-            /* Shutdown the timer.  */
-            timer_del(tb->timer);
+            timerblock_run(tb, value, (count != 0));
+        } else if ((control & 1) && !(value & 1)) {
+            ptimer_stop(tb->timer);
+        }
+        if ((control & 0xff00) != (value & 0xff00)) {
+            ptimer_set_period(tb->timer, timerblock_scale(value));
         }
+        tb->control = value;
         break;
     case 12: /* Interrupt status.  */
+        /* Simulate continuous IRQ gen.  */
+        if ((control & 3) == 3 && (control & 0xff00) != 0) {
+            if (ptimer_get_limit(tb->timer) == 0) {
+                break;
+            }
+        }
         tb->status &= ~value;
         timerblock_update_irq(tb);
         break;
@@ -184,13 +184,12 @@ static const MemoryRegionOps timerblock_ops = {
 
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
 
@@ -235,7 +234,8 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
      */
     for (i = 0; i < s->num_cpu; i++) {
         TimerBlock *tb = &s->timerblock[i];
-        tb->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timerblock_tick, tb);
+        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
+        tb->timer = ptimer_init(bh);
         sysbus_init_irq(sbd, &tb->irq);
         memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
                               "arm_mptimer_timerblock", 0x20);
@@ -245,26 +245,23 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
 
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
2.6.4


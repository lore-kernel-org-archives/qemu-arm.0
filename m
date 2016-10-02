Received: by 10.80.163.71 with SMTP id 65csp1171546edn;
        Sun, 2 Oct 2016 09:09:05 -0700 (PDT)
X-Received: by 10.55.179.135 with SMTP id c129mr17302419qkf.98.1475424545127;
        Sun, 02 Oct 2016 09:09:05 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 133si5016278qkh.57.2016.10.02.09.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjK4-0000UE-Ex
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:09:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjBu-0002Xx-KX
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjBr-0003DC-N1
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:37 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35789)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjBr-0003Cg-87; Sun, 02 Oct 2016 12:00:35 -0400
Received: by mail-lf0-x241.google.com with SMTP id s64so7955004lfs.2;
	Sun, 02 Oct 2016 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=KTe2F4n/9Owblv2N3M0QdYcfqEUJ3j+bbradseYu/30=;
	b=Vn6ZdZcbNE3g8hYG6KLzukBTJQxI2vF99hRnoDoKdmoi/FNZIradr1sw0qN5H4oBqJ
	Jab5rLSs1lhxSvJsa+KuiGcKzz0i61cCBHuQvJf/4p9iwoPN3ynQKBxGRWzq58ycIIwA
	g+hrlRqVzFl52sKLthh9pNEX/dB0E3wrvBnWKNX3SYvuhnCndk317w4dEzLmShkmd6hF
	7m/+1zGdfs/buTir5Gg+P+lGHzBs0OQXJ4CQG2/SGVHyZp/fovt4uki6OBH6qeutzTBN
	5JI+l/D0FL/epBxfDkMkOVhDDfqKGue40gvvdhfnyqsEu02EJ6iVBcWAeV49BxQajY0+
	kDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=KTe2F4n/9Owblv2N3M0QdYcfqEUJ3j+bbradseYu/30=;
	b=M/9Wsvls0nKg3w1k9z6Q1CRQSeh0X9PBu9vzViom52Dk9WbQEQIz85EiJ+Ct2TYx+3
	fkjODPO+h/nz7DpsKZkWuCsBfIb6b6abgnLyBpbtZBdGdlJ22ILpE7G7urqPg/1WgSps
	g2jr8t+8F4HeZUSJkw95XZdj0dNICrpIBs7HWIFxP99pUkyFh1s8rFNqsOEDMGRvYc7I
	4oQJnbhdNiyY0vWnqO9/hqNUk4Wtu4z7o9faZZ+HFHYUALwTfU6TZYUx3YBtUmZ7Ho7u
	/bMJNuIEy2oTd3B3lhnju74QQxTp8Km85flpfkR74Js/4GPP3TODaOrv8A9iwaRT4NX6
	6NOg==
X-Gm-Message-State: AA6/9Rl9iClLGU6MdbosVjmVlGtnLo79ZhNTyRcqhypLXf6/mzWxvNP2Eq67Pndd/INFSA==
X-Received: by 10.25.22.77 with SMTP id m74mr6634667lfi.25.1475424019121;
	Sun, 02 Oct 2016 09:00:19 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:18 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:45 +0300
Message-Id: <37f378c33bb5a28d5cd71167a6bd5bff5e59cbc3.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v17 13/14] arm_mptimer: Convert to use ptimer
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
X-TUID: L8fA1IkMUpTd

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
 hw/timer/arm_mptimer.c         | 149 +++++++++++++++++++++++------------------
 include/hw/timer/arm_mptimer.h |   5 +-
 2 files changed, 83 insertions(+), 71 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index d66bbf0..daf6c48 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -20,22 +20,33 @@
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
+     PTIMER_POLICY_NO_IMMEDIATE_RELOAD   |  \
+     PTIMER_POLICY_NO_COUNTER_ROUND_DOWN)
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
@@ -44,33 +55,42 @@ static inline void timerblock_update_irq(TimerBlock *tb)
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
 
@@ -78,21 +98,11 @@ static uint64_t timerblock_read(void *opaque, hwaddr addr,
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
@@ -106,37 +116,45 @@ static void timerblock_write(void *opaque, hwaddr addr,
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
@@ -186,13 +204,12 @@ static const MemoryRegionOps timerblock_ops = {
 
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
 
@@ -238,7 +255,8 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
      */
     for (i = 0; i < s->num_cpu; i++) {
         TimerBlock *tb = &s->timerblock[i];
-        tb->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timerblock_tick, tb);
+        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
+        tb->timer = ptimer_init(bh, PTIMER_POLICY);
         sysbus_init_irq(sbd, &tb->irq);
         memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
                               "arm_mptimer_timerblock", 0x20);
@@ -248,26 +266,23 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
 
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
2.9.3


Received: by 10.182.158.201 with SMTP id ww9csp692825obb;
        Wed, 9 Dec 2015 07:04:21 -0800 (PST)
X-Received: by 10.140.102.10 with SMTP id v10mr7741378qge.63.1449673461313;
        Wed, 09 Dec 2015 07:04:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m205si9216588qhm.111.2015.12.09.07.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 07:04:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6gI1-00087j-1I
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 10:04:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rabin.vincent@axis.com>) id 1a6bxf-0004vl-89
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 05:27:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rabin.vincent@axis.com>) id 1a6bxb-0003Y5-43
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 05:27:03 -0500
Received: from bastet.se.axis.com ([195.60.68.11]:35095)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rabin.vincent@axis.com>) id 1a6bxa-0003XJ-R3
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 05:26:59 -0500
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0108C180EC;
	Wed,  9 Dec 2015 11:26:57 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BkZd9y0fXygo; Wed,  9 Dec 2015 11:26:56 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 039DA180E9;
	Wed,  9 Dec 2015 11:26:56 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id DEC311228;
	Wed,  9 Dec 2015 11:26:55 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id D13B6C0;
	Wed,  9 Dec 2015 11:26:55 +0100 (CET)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id CF40434269;
	Wed,  9 Dec 2015 11:26:55 +0100 (CET)
Received: from lnxrabinv.se.axis.com (10.88.144.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 9 Dec 2015 11:26:55 +0100
From: Rabin Vincent <rabin.vincent@axis.com>
To: <peter.maydell@linaro.org>
Date: Wed, 9 Dec 2015 11:26:47 +0100
Message-ID: <1449656808-16570-1-git-send-email-rabinv@axis.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.60.68.11
X-Mailman-Approved-At: Wed, 09 Dec 2015 10:04:18 -0500
Cc: qemu-arm@nongnu.org, Rabin Vincent <rabinv@axis.com>
Subject: [Qemu-arm] [PATCH 1/2] arm_mptimer: add watchdog mode support
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
X-TUID: J4kOQmPoqCco

Add support for the watchdog mode of the MPTimer.

Signed-off-by: Rabin Vincent <rabinv@axis.com>
---
 hw/timer/arm_mptimer.c         |   49 ++++++++++++++++++++++++++++++++++++----
 include/hw/timer/arm_mptimer.h |    4 ++++
 2 files changed, 49 insertions(+), 4 deletions(-)

diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
index 3e59c2a..2be4551 100644
--- a/hw/timer/arm_mptimer.c
+++ b/hw/timer/arm_mptimer.c
@@ -21,8 +21,11 @@
 
 #include "hw/timer/arm_mptimer.h"
 #include "qemu/timer.h"
+#include "sysemu/sysemu.h"
 #include "qom/cpu.h"
 
+#define TWD_CONTROL_WDOG_MODE   (1 << 3)
+
 /* This device implements the per-cpu private timer and watchdog block
  * which is used in both the ARM11MPCore and Cortex-A9MP.
  */
@@ -38,7 +41,12 @@ static inline int get_current_cpu(ARMMPTimerState *s)
 
 static inline void timerblock_update_irq(TimerBlock *tb)
 {
-    qemu_set_irq(tb->irq, tb->status && (tb->control & 4));
+    if ((tb->control & TWD_CONTROL_WDOG_MODE) && tb->status) {
+        qemu_log_mask(CPU_LOG_RESET, "MPCore Watchdog Reset\n");
+        qemu_system_reset_request();
+    } else {
+        qemu_set_irq(tb->irq, tb->status && (tb->control & 4));
+    }
 }
 
 /* Return conversion factor from mpcore timer ticks to qemu timer ticks.  */
@@ -63,7 +71,7 @@ static void timerblock_tick(void *opaque)
 {
     TimerBlock *tb = (TimerBlock *)opaque;
     tb->status = 1;
-    if (tb->control & 2) {
+    if (!(tb->control & TWD_CONTROL_WDOG_MODE) && (tb->control & 2)) {
         tb->count = tb->load;
         timerblock_reload(tb, 0);
     } else {
@@ -110,6 +118,9 @@ static void timerblock_write(void *opaque, hwaddr addr,
         tb->load = value;
         /* Fall through.  */
     case 4: /* Counter.  */
+        if ((tb->control & TWD_CONTROL_WDOG_MODE) && addr == 4) {
+            return;
+        }
         if ((tb->control & 1) && tb->count) {
             /* Cancel the previous timer.  */
             timer_del(tb->timer);
@@ -121,6 +132,11 @@ static void timerblock_write(void *opaque, hwaddr addr,
         break;
     case 8: /* Control.  */
         old = tb->control;
+        if (tb->wdog) {
+            value |= old & TWD_CONTROL_WDOG_MODE;
+        } else {
+            value &= ~TWD_CONTROL_WDOG_MODE;
+        }
         tb->control = value;
         if (value & 1) {
             if ((old & 1) && (tb->count != 0)) {
@@ -140,6 +156,16 @@ static void timerblock_write(void *opaque, hwaddr addr,
         tb->status &= ~value;
         timerblock_update_irq(tb);
         break;
+    case 20: /* Watchdog disable */
+        if (tb->wdog) {
+            uint32_t last = tb->last_wdog_disable;
+
+            tb->last_wdog_disable = value;
+            if (last == 0x12345678 && value == 0x87654321) {
+                tb->control &= ~TWD_CONTROL_WDOG_MODE;
+            }
+        }
+        break;
     }
 }
 
@@ -182,8 +208,9 @@ static const MemoryRegionOps timerblock_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void timerblock_reset(TimerBlock *tb)
+static void timerblock_reset(TimerBlock *tb, bool wdog)
 {
+    tb->wdog = wdog;
     tb->count = 0;
     tb->load = 0;
     tb->control = 0;
@@ -200,7 +227,7 @@ static void arm_mptimer_reset(DeviceState *dev)
     int i;
 
     for (i = 0; i < ARRAY_SIZE(s->timerblock); i++) {
-        timerblock_reset(&s->timerblock[i]);
+        timerblock_reset(&s->timerblock[i], s->wdog);
     }
 }
 
@@ -213,6 +240,13 @@ static void arm_mptimer_init(Object *obj)
     sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
 }
 
+static void arm_mptimer_wdog_init(Object *obj)
+{
+    ARMMPTimerState *s = ARM_MPTIMER(obj);
+
+    s->wdog = true;
+}
+
 static void arm_mptimer_realize(DeviceState *dev, Error **errp)
 {
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
@@ -292,9 +326,16 @@ static const TypeInfo arm_mptimer_info = {
     .class_init    = arm_mptimer_class_init,
 };
 
+static const TypeInfo arm_mptimer_wdog_info = {
+    .name          = TYPE_ARM_MPTIMER_WDOG,
+    .parent        = TYPE_ARM_MPTIMER,
+    .instance_init = arm_mptimer_wdog_init,
+};
+
 static void arm_mptimer_register_types(void)
 {
     type_register_static(&arm_mptimer_info);
+    type_register_static(&arm_mptimer_wdog_info);
 }
 
 type_init(arm_mptimer_register_types)
diff --git a/include/hw/timer/arm_mptimer.h b/include/hw/timer/arm_mptimer.h
index b34cba0..cd119c1 100644
--- a/include/hw/timer/arm_mptimer.h
+++ b/include/hw/timer/arm_mptimer.h
@@ -31,13 +31,16 @@ typedef struct {
     uint32_t load;
     uint32_t control;
     uint32_t status;
+    uint32_t last_wdog_disable;
     int64_t tick;
+    bool wdog;
     QEMUTimer *timer;
     qemu_irq irq;
     MemoryRegion iomem;
 } TimerBlock;
 
 #define TYPE_ARM_MPTIMER "arm_mptimer"
+#define TYPE_ARM_MPTIMER_WDOG "arm_mptimer_wdog"
 #define ARM_MPTIMER(obj) \
     OBJECT_CHECK(ARMMPTimerState, (obj), TYPE_ARM_MPTIMER)
 
@@ -47,6 +50,7 @@ typedef struct {
     /*< public >*/
 
     uint32_t num_cpu;
+    bool wdog;
     TimerBlock timerblock[ARM_MPTIMER_MAX_CPUS];
     MemoryRegion iomem;
 } ARMMPTimerState;
-- 
1.7.10.4


Received: by 10.25.0.144 with SMTP id 138csp288727lfa;
        Fri, 28 Apr 2017 09:54:24 -0700 (PDT)
X-Received: by 10.237.33.67 with SMTP id 61mr11511089qtc.62.1493398464095;
        Fri, 28 Apr 2017 09:54:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1si6236839qtd.266.2017.04.28.09.54.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 09:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d499z-0004uA-Gy
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 12:54:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498J-0003qw-OI
	for qemu-devel@nongnu.org; Fri, 28 Apr 2017 12:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d498I-00065o-28
	for qemu-devel@nongnu.org; Fri, 28 Apr 2017 12:52:39 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:36092)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d498H-00065E-PY; Fri, 28 Apr 2017 12:52:37 -0400
Received: by mail-pg0-x242.google.com with SMTP id v1so6206805pgv.3;
	Fri, 28 Apr 2017 09:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3xGDtmkf8VCwL9uDsyBLKPnhh4JaVvF/8ZemmZ52mWU=;
	b=orzSPl2/2cy7h80EmnWoL0DSUMJb/2ceDRGj3HlhkVahjqta/Clahr6lHx1fMhKXF8
	hX8DZNLaI8tFJNKtLHYEI8CQw8BT4pk3ZcyTFOR3qT6U2OeahT7Il9ruiK9VMv5O9YMl
	mNAsUXs8ETuJ+2GZXinTKkmZP3ONinAk/UOzcFcYjwMrNYpWNsTi6jkZyTG37as5V7VX
	XprCzr8PSCE644sTFZcfS57cugEOzbnWowLQ2gdTc/JO16vSWi3Tb539UwHT0arXomlT
	yMnQcs8hZT+Vqd8o9vNpQBnCKLb24S2WUUh2i08/pcofJzznm9Zv490XG1axW8zIENlM
	+vDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3xGDtmkf8VCwL9uDsyBLKPnhh4JaVvF/8ZemmZ52mWU=;
	b=nB54GkqWvlzDU9hLDE/1qc6t0JUmqiojRLUbFW+SymnVfE4jzDU13lB8aIcKN7ULPa
	kr4FWJwTskoWibsO9P8hO6W1cmFo6fIoQi1qRqXAxuT9WKlhMi99EGxeXbAe2vixek9l
	ovLo0UW4SauPxy5f4HRuGSUfc4PHW1VsmlxccIqnnBDw2FA0ZUqgeGYpEpChU8tczAId
	bcBfViB41IWFEBV72G7e3PKnZNgkqcImzge6Bdq8bl+GsJfphIQvl2KFMxtiKnV7bPIB
	PvJfC2R6ORlC22t7GFRqpS/IoNFMbtItomHPyOHxJv+47H4J5dCJweswfVk/VwtKMn8f
	mJ6w==
X-Gm-Message-State: AN3rC/7qpht5oZ2zcfDo7y0SAzLkqo6Rq8UM5a7gOc6UudQs6VbtWnZj
	O6RznVz/Mdrbmg==
X-Received: by 10.84.222.135 with SMTP id x7mr16536690pls.50.1493398356652;
	Fri, 28 Apr 2017 09:52:36 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	r86sm11383528pfb.24.2017.04.28.09.52.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Apr 2017 09:52:36 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 28 Apr 2017 22:21:49 +0530
Message-Id: <1493398313-6673-2-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
References: <1493398313-6673-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [Qemu-devel RFC v3 1/5] msf2: Add Smartfusion2 System
 timer
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
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T7okjgE4AduD

Modelled System Timer in Microsemi's Smartfusion2 Soc.
Timer has two 32bit down counters and two interrupts.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/timer/Makefile.objs        |   1 +
 hw/timer/msf2_timer.c         | 250 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/timer/msf2_timer.h |  82 ++++++++++++++
 3 files changed, 333 insertions(+)
 create mode 100644 hw/timer/msf2_timer.c
 create mode 100644 include/hw/timer/msf2_timer.h

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index dd6f27e..0bdf1e1 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
 common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
 
 common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
+common-obj-$(CONFIG_MSF2) += msf2_timer.o
diff --git a/hw/timer/msf2_timer.c b/hw/timer/msf2_timer.c
new file mode 100644
index 0000000..d1dbde5
--- /dev/null
+++ b/hw/timer/msf2_timer.c
@@ -0,0 +1,250 @@
+/*
+ * Timer block model of Microsemi SmartFusion2.
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/timer/msf2_timer.h"
+#include "hw/sysbus.h"
+#include "qemu/log.h"
+#include "qemu/main-loop.h"
+
+#ifndef MSF2_TIMER_ERR_DEBUG
+#define MSF2_TIMER_ERR_DEBUG  0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do { \
+    if (MSF2_TIMER_ERR_DEBUG >= lvl) { \
+        qemu_log("%s: " fmt, __func__, ## args); \
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+static void timer_update_irq(struct Msf2Timer *st)
+{
+    bool isr, ier;
+
+    isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
+    ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
+
+    qemu_set_irq(st->irq, (ier && isr));
+}
+
+static void timer_update(struct Msf2Timer *st)
+{
+    uint64_t count;
+
+    DB_PRINT("timer=%d\n", st->nr);
+
+    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL)) {
+        ptimer_stop(st->ptimer);
+        return;
+    }
+
+    count = st->regs[R_TIM_LOADVAL];
+    ptimer_set_limit(st->ptimer, count, 1);
+    ptimer_run(st->ptimer, 1);
+}
+
+static uint64_t
+timer_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    MSF2TimerState *t = opaque;
+    struct Msf2Timer *st;
+    uint32_t r = 0;
+    unsigned int timer = 0;
+    int isr;
+    int ier;
+
+    addr >>= 2;
+    /*
+     * Two independent timers has same base address.
+     * Based on addr passed figure out which timer is being used.
+     */
+    if (addr >= R_TIM1_MAX) {
+        timer = 1;
+        addr -= R_TIM1_MAX;
+    }
+
+    st = &t->timers[timer];
+
+    switch (addr) {
+    case R_TIM_VAL:
+        r = ptimer_get_count(st->ptimer);
+        DB_PRINT("msf2_timer t=%d read counter=%x\n", timer, r);
+        break;
+
+    case R_TIM_MIS:
+        isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
+        ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
+        r = ier && isr;
+        break;
+
+    default:
+        if (addr < ARRAY_SIZE(st->regs)) {
+            r = st->regs[addr];
+        }
+        break;
+    }
+    DB_PRINT("timer=%d %lu=%x\n", timer, addr * 4, r);
+    return r;
+}
+
+static void
+timer_write(void *opaque, hwaddr addr,
+            uint64_t val64, unsigned int size)
+{
+    MSF2TimerState *t = opaque;
+    struct Msf2Timer *st;
+    unsigned int timer = 0;
+    uint32_t value = val64;
+
+    addr >>= 2;
+    /*
+     * Two independent timers has same base address.
+     * Based on addr passed figure out which timer is being used.
+     */
+    if (addr >= R_TIM1_MAX) {
+        timer = 1;
+        addr -= R_TIM1_MAX;
+    }
+
+    st = &t->timers[timer];
+
+    DB_PRINT("addr=%lu val=%x (timer=%d)\n", addr * 4, value, timer);
+
+    switch (addr) {
+    case R_TIM_CTRL:
+        st->regs[R_TIM_CTRL] = value;
+        timer_update(st);
+        break;
+
+    case R_TIM_RIS:
+        if (value & TIMER_RIS_ACK) {
+            st->regs[R_TIM_RIS] &= ~TIMER_RIS_ACK;
+        }
+        break;
+
+    case R_TIM_LOADVAL:
+        st->regs[R_TIM_LOADVAL] = value;
+        if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
+            timer_update(st);
+        }
+        break;
+
+    case R_TIM_BGLOADVAL:
+        st->regs[R_TIM_BGLOADVAL] = value;
+        st->regs[R_TIM_LOADVAL] = value;
+        break;
+
+    case R_TIM_VAL:
+    case R_TIM_MIS:
+        break;
+
+    case R_TIM_MODE:
+        if (value & TIMER_MODE) {
+            DB_PRINT("64-bit mode not supported\n");
+        }
+        break;
+
+    default:
+        if (addr < ARRAY_SIZE(st->regs)) {
+            st->regs[addr] = value;
+        }
+        break;
+    }
+    timer_update_irq(st);
+}
+
+static const MemoryRegionOps timer_ops = {
+    .read = timer_read,
+    .write = timer_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4
+    }
+};
+
+static void timer_hit(void *opaque)
+{
+    struct Msf2Timer *st = opaque;
+
+    DB_PRINT("%d\n", st->nr);
+    st->regs[R_TIM_RIS] |= TIMER_RIS_ACK;
+
+    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ONESHOT)) {
+        timer_update(st);
+    }
+    timer_update_irq(st);
+}
+
+static void msf2_timer_init(Object *obj)
+{
+    MSF2TimerState *t = MSF2_TIMER(obj);
+    unsigned int i;
+
+    /* Init all the ptimers.  */
+    t->timers = g_malloc0((sizeof t->timers[0]) * NUM_TIMERS);
+    for (i = 0; i < NUM_TIMERS; i++) {
+        struct Msf2Timer *st = &t->timers[i];
+
+        st->nr = i;
+        st->bh = qemu_bh_new(timer_hit, st);
+        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
+        ptimer_set_freq(st->ptimer, t->freq_hz);
+        sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
+    }
+
+    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, TYPE_MSF2_TIMER,
+                          R_TIM_MAX * 4);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
+}
+
+static Property msf2_timer_properties[] = {
+    DEFINE_PROP_UINT32("clock-frequency", MSF2TimerState, freq_hz,
+                       83 * 1000000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void msf2_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->props = msf2_timer_properties;
+}
+
+static const TypeInfo msf2_timer_info = {
+    .name          = TYPE_MSF2_TIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MSF2TimerState),
+    .instance_init = msf2_timer_init,
+    .class_init    = msf2_timer_class_init,
+};
+
+static void msf2_timer_register_types(void)
+{
+    type_register_static(&msf2_timer_info);
+}
+
+type_init(msf2_timer_register_types)
diff --git a/include/hw/timer/msf2_timer.h b/include/hw/timer/msf2_timer.h
new file mode 100644
index 0000000..93d9fb3
--- /dev/null
+++ b/include/hw/timer/msf2_timer.h
@@ -0,0 +1,82 @@
+/*
+ * Microsemi SmartFusion2 Timer.
+ *
+ * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef HW_MSF2_TIMER_H
+#define HW_MSF2_TIMER_H
+
+#include "hw/sysbus.h"
+#include "hw/ptimer.h"
+#include "sysemu/sysemu.h"
+
+#define TYPE_MSF2_TIMER     "msf2-timer"
+#define MSF2_TIMER(obj)     OBJECT_CHECK(MSF2TimerState, \
+                              (obj), TYPE_MSF2_TIMER)
+
+/*
+ * There are two 32-bit down counting timers.
+ * Timers 1 and 2 can be concatenated into a single 64-bit Timer
+ * that operates either in Periodic mode or in One-shot mode.
+ * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit mode.
+ * In 64-bit mode, writing to the 32-bit registers has no effect.
+ * Similarly, in 32-bit mode, writing to the 64-bit mode registers
+ * has no effect. Only two 32-bit timers are supported currently.
+ */
+#define NUM_TIMERS        2
+
+#define R_TIM_VAL         0
+#define R_TIM_LOADVAL     1
+#define R_TIM_BGLOADVAL   2
+#define R_TIM_CTRL        3
+#define R_TIM_RIS         4
+#define R_TIM_MIS         5
+#define R_TIM1_MAX        6
+
+#define R_TIM_MODE       21
+#define R_TIM_MAX        22 /* including 64-bit timer registers */
+
+#define TIMER_CTRL_ENBL     (1 << 0)
+#define TIMER_CTRL_ONESHOT  (1 << 1)
+#define TIMER_CTRL_INTR     (1 << 2)
+#define TIMER_RIS_ACK       (1 << 0)
+#define TIMER_RST_CLR       (1 << 6)
+#define TIMER_MODE          (1 << 0)
+
+struct Msf2Timer {
+    QEMUBH *bh;
+    ptimer_state *ptimer;
+    int nr; /* for debug. */
+
+    uint32_t regs[R_TIM_MAX];
+    qemu_irq irq;
+};
+
+typedef struct MSF2TimerState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    uint32_t freq_hz;
+    struct Msf2Timer *timers;
+} MSF2TimerState;
+
+#endif /* HW_MSF2_TIMER_H */
-- 
2.5.0


Received: by 10.25.0.6 with SMTP id 6csp226914lfa;
        Tue, 9 May 2017 09:45:50 -0700 (PDT)
X-Received: by 10.55.201.26 with SMTP id q26mr1124907qki.107.1494348350095;
        Tue, 09 May 2017 09:45:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494348350; cv=none;
        d=google.com; s=arc-20160816;
        b=jUp9CQRgNORmcxekSnkbfAfMFbNAYTRfd8X27ut13zRCPNO9Vn9SiyYxWqFxNBvimr
         3YTqQNBhGgb9eZXHoKtF6cUHg5m2ENePt7JXrxlz5xwvYKkmFnW20g2LURY3inbsw1ub
         1F5IaXO8LTkH0xw6WtnFnEwyg/CmzGkz3JRZdcb/ML83yG16snyjuaCRoTDDcXj9G+zf
         EFMIxEFzy7ytiqWwS4TG1ycGowrMS8WgcTOcyAEsnudHZb3JY7Jnno25wZPMowzl8uxN
         pD1n3aVcSAb3wctP3NBms8N9ZxO6dvZdxMkh6zwQyhpaWr6U6IxjP2ct9+WWU3rOU/9r
         in7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=V3KQYOddiAEMX0iZzGXiojohagY3CEbYKQHc32KC2po=;
        b=SOJIMHENIoIdUk/GN67EAzXYZEz7CHCTAlASwj4/DA/1mybZ7PcXbvrcnjxAlGKX9G
         ZDkz21ODjmovfGQeKYWozDK/ZY+41R+e9bXoWw+AsagtpBfa2NEw5N32Jm2WY022xSjA
         F0iAafObixbeQXrwH2lqORHHTAb+q4hdkzF+Y2Ex3p3HcOvnw/DqNJrSIUPBfIjvKMzz
         ZfETT8tTl9sxlgKnozQHKTFZ0HPM48Q/M967PykHl7pWIbm1wRzxfMNmYifctsplM+i6
         3PWV34c28Px6KL+I7xIDXprmIcz+Mj8Ah1EjZAjfJOJDduPAZ4L6iDVRhh5J8OGtWixZ
         +TGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d137si511268qkc.269.2017.05.09.09.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 May 2017 09:45:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38200 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d88Gj-00086y-Ho
	for alex.bennee@linaro.org; Tue, 09 May 2017 12:45:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d88GY-00084S-Ka
	for qemu-arm@nongnu.org; Tue, 09 May 2017 12:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d88GX-0005Hn-2e
	for qemu-arm@nongnu.org; Tue, 09 May 2017 12:45:38 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:36814)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d88GS-0005GY-KG; Tue, 09 May 2017 12:45:32 -0400
Received: by mail-pg0-x243.google.com with SMTP id 64so599492pgb.3;
	Tue, 09 May 2017 09:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=V3KQYOddiAEMX0iZzGXiojohagY3CEbYKQHc32KC2po=;
	b=VJyb9StlD8H1PbNBAaT35IStgomRS9Rc3EjLxa1EYkWUpIjeD+G4gA0etGjb/jOpUr
	Za3w9tcpbCagtMqHDsq02VweuCrAFsACCMUgKw4bMuCkcDuFfJlhOCeraSrCOzn5YLU6
	x2IVcujeV+TwHZ1eY2F5MM73BCfm3dStId3zecSatDHnPbVAvFaTrH1NMehkJdf6zcfR
	8FL0o7WK79l2D0Qzq6ra+clEgyHSX8hRHSXyZCAxmqiNBuFhYeq4r/cqNKRlxZ51moc8
	gAB9HY2g8BLKRR4YnWNNC7LXboC/lnuugD5FZ+IXGusGX2aHeBS6KS+TQfrDjdt5mX27
	PwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=V3KQYOddiAEMX0iZzGXiojohagY3CEbYKQHc32KC2po=;
	b=YPCcAjXOm/HgSp1CXYd8X3Eaa+D6dzSKSXNTkcH4YJvJtzqC11wSZd0sBZxBJm9He2
	ibHDmKOJ65ygw8SJURUGBZ8jkGnovDAyDRQCWzs1HRUQGa4Fyw/jO6+CJtF3vJk5/uRL
	yEj3YOL/RoiZFm+Z2BnzGIzmOtw2lSmvbh48aToWTBc3ZDEY3Xy6MDurGABzOWLqii+l
	3aMxLCkQ736XqPQJ1OThLJ5pgkXHTN5VznP9yO1EdWTEEPjIqVgJQL/LwKs3gmzwh+ps
	T5aDZ2z4aRfOKfz0YRvNN2jrfuivmEsGiZZxGPitUrDkD+hy86wSD8zOvx7oLr3GxdZ3
	NpcQ==
X-Gm-Message-State: AODbwcBZ2MAHhKuBQBEYcVlTaW2Pv1fOo8VsX3Q8e6NqYld7An+kCAkN
	S2ae33N4pY7Fbw==
X-Received: by 10.99.124.69 with SMTP id l5mr1153818pgn.227.1494348331391;
	Tue, 09 May 2017 09:45:31 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	o194sm833320pfg.117.2017.05.09.09.45.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 May 2017 09:45:30 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue,  9 May 2017 22:14:42 +0530
Message-Id: <1494348286-10253-2-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [Qemu-devel PATCH 1/5] msf2: Add Smartfusion2 System
 timer
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
Cc: peter.maydell@linaro.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r1fWuTjbK7Xy

Modelled System Timer in Microsemi's Smartfusion2 Soc.
Timer has two 32bit down counters and two interrupts.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
---
 hw/timer/Makefile.objs        |   1 +
 hw/timer/msf2-timer.c         | 252 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/timer/msf2-timer.h |  85 ++++++++++++++
 3 files changed, 338 insertions(+)
 create mode 100644 hw/timer/msf2-timer.c
 create mode 100644 include/hw/timer/msf2-timer.h

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index dd6f27e..bd1ff15 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
 common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
 
 common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
+common-obj-$(CONFIG_MSF2) += msf2-timer.o
diff --git a/hw/timer/msf2-timer.c b/hw/timer/msf2-timer.c
new file mode 100644
index 0000000..466faa6
--- /dev/null
+++ b/hw/timer/msf2-timer.c
@@ -0,0 +1,252 @@
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
+#include "hw/timer/msf2-timer.h"
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
+    uint32_t ret = 0;
+    int timer = 0;
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
+        ret = ptimer_get_count(st->ptimer);
+        break;
+
+    case R_TIM_MIS:
+        isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
+        ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
+        ret = ier & isr;
+        break;
+
+    default:
+        if (addr < ARRAY_SIZE(st->regs)) {
+            ret = st->regs[addr];
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
+                         addr * 4);
+        }
+        break;
+    }
+
+    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32 "\n", timer, addr * 4,
+            ret);
+    return ret;
+}
+
+static void
+timer_write(void *opaque, hwaddr addr,
+            uint64_t val64, unsigned int size)
+{
+    MSF2TimerState *t = opaque;
+    struct Msf2Timer *st;
+    int timer = 0;
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
+    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)\n", addr * 4,
+            value, timer);
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
+            qemu_log_mask(LOG_UNIMP, "64-bit mode not supported\n");
+        }
+        break;
+
+    default:
+        if (addr < ARRAY_SIZE(st->regs)) {
+            st->regs[addr] = value;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
+                         addr * 4);
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
+    int i;
+
+    /* Init all the ptimers.  */
+    t->timers = g_malloc0((sizeof t->timers[0]) * NUM_TIMERS);
+    for (i = 0; i < NUM_TIMERS; i++) {
+        struct Msf2Timer *st = &t->timers[i];
+
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
+                       MSF2_TIMER_FREQ),
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
diff --git a/include/hw/timer/msf2-timer.h b/include/hw/timer/msf2-timer.h
new file mode 100644
index 0000000..10eb2f8
--- /dev/null
+++ b/include/hw/timer/msf2-timer.h
@@ -0,0 +1,85 @@
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
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/ptimer.h"
+#include "sysemu/sysemu.h"
+#include "qemu/log.h"
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
+#define MSF2_TIMER_FREQ   (83 * 1000000)
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


Received: by 10.223.172.38 with SMTP id v35csp620112wrc;
        Thu, 7 Sep 2017 12:26:57 -0700 (PDT)
X-Received: by 10.200.16.151 with SMTP id a23mr653496qtj.16.1504812412065;
        Thu, 07 Sep 2017 12:26:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504812412; cv=none;
        d=google.com; s=arc-20160816;
        b=eEgRmpvuXUfEZPuUrmKO8leS3CIdVUb09tF1NU14ZIJJ+DcLjJUs63IUA9MXwuFIUL
         USQcSQ6AF5Os6A0K3yMWTnpiZTSCjiTfjtII9pIk4XP3g+iFKu0XVz17YCcr/ApxwmH4
         C3AYTY0xN2LeknNZ7lovh40SK3k/n/iWR+qJ8VPzbqvyHhZoW/pbK901RZeowao/7Nx6
         bCGhl25qDHA10wU7p/8I7g9HNeOgljbvgBDXSho+1MMhpWErShwB1afJYcbK/SQrEeJx
         zTZODE0aSW+GDKogJx2+2iiZNZn4OQSBmRN+B8hWx7h8Df6pWxC5ACHpb+zkKxYju0zj
         eSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rYDUhEAMbeLgPAtDNnRzVQNjcZJ/BvND+g5qLvUVVhg=;
        b=AJecPUHWWHQdz/dRAivNRCrQjYikTg98TYKSkAsDnHnqPnLTNBSg9vk9Dpuht0QZU2
         O/Trd1dM/alaFd0Jm6AG3XNIUY8TaaAAPPH1FJ3ItF6+xSPakFxJn3xfmSPdvkHleC1b
         H2z4yiC7kyf9GwU596UL2iWfnIjobU/QBlWONF2juteR7PBB8otRgRO9WqT578PctU8t
         FSrd4E3Jm0wLTCdzPk79ArIx6nX+q7tFoCnlCnnIJIv1ODkfwSnZO7DJ7aZXYCAA7jbq
         SGQPGtZCQ1sa8CU83tAzywOV0nH0junScSyD2J5oG6vgL2SK/3MjAtFJj/VrsN7z8rp6
         pcdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vJ2rVi2I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si84432qkf.143.2017.09.07.12.26.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Sep 2017 12:26:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=vJ2rVi2I;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41899 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dq2Rt-0007xK-Jt
	for alex.bennee@linaro.org; Thu, 07 Sep 2017 15:26:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dq2Pl-0006b8-TX
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 15:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dq2Pg-0004Be-9x
	for qemu-devel@nongnu.org; Thu, 07 Sep 2017 15:24:37 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:33037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dq2Pg-0004B9-2C; Thu, 07 Sep 2017 15:24:32 -0400
Received: by mail-pf0-x243.google.com with SMTP id h4so295689pfk.0;
	Thu, 07 Sep 2017 12:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rYDUhEAMbeLgPAtDNnRzVQNjcZJ/BvND+g5qLvUVVhg=;
	b=vJ2rVi2IrbExCvxIBOuiLmAd/xwHTIgGiFkN2J+GGZ2oo+0y8TbnCcdXZ3i3o7HWn7
	pYsBhHp5f303Fl3sMrqaVJxbrFP34bNr2NHGzLy60+j4/82wM3EDYlMnIOERRkvKLmCe
	NOyDW+zBYP532mGYUZV0lJt2yi5J/vuntX2xAQ1JBdYlMpJEWY4V70zvkgNXF1xTZufz
	CCHBVea8foo/eCNXPoxS81DgrNMAbwROfV841YSMzSSSBrxwMuYxruMdj87aqlZWLAgH
	xN7cKyCsXG9AKilZx0HGAEvl55/lRnzEh01YbEpyWqnvo7sxJUxzdsML645izJPyPeef
	rCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rYDUhEAMbeLgPAtDNnRzVQNjcZJ/BvND+g5qLvUVVhg=;
	b=mA9NXTCWCEYWsQfzsGvwFKjnXJETIemlij5kmrZV8hThtRtOoxFWUaE0rTTw5ZdJl5
	UWRJszmPy/uJmGIZSnUBpBL+DQQcAB8AqFwcdtRmUFmdbZ0YkNYRo+qVMgD3LLiEGqea
	Chz0sVAoqS+6VCjlTYkpyl+6WGhGVW90HLwPjv1xqKygOvCUVisHUnocUACMHGX+vxYz
	Pw5/9o7Hjx9Kkb/+MJs3IUrohX2VjqRzBioWE9sr9CXtBlFIUuJoZRJfYfu6j/6RKLzQ
	7Trg6QXQNM9ERsnk9YcUrBlPIFUcCS1h4roGbGBVos2Edd5Iy/sOz98lpVKkzyf16vhm
	vS7A==
X-Gm-Message-State: AHPjjUg++f1B45RaWloAzn4vCXtFJ2od99Xlud5AaeLA7YUgYDYbKosW
	O5ayIEY2YRkphOpZ
X-Google-Smtp-Source: ADKCNb4+ORL92TYpC2+U4gWlLib6v7XJ9WO4qkjcM06KTnQnZaR8FkPBKdbo5dFWksXq0dt6Jx8mKQ==
X-Received: by 10.159.253.137 with SMTP id q9mr507366pls.16.1504812270895;
	Thu, 07 Sep 2017 12:24:30 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id
	y74sm462919pfa.164.2017.09.07.12.24.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Sep 2017 12:24:30 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri,  8 Sep 2017 00:54:07 +0530
Message-Id: <1504812251-23438-2-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-devel] [Qemu devel v8 PATCH 1/5] msf2: Add Smartfusion2
 System timer
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
	f4bug@amsat.org, alistair23@gmail.com, crosthwaite.peter@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rCcc8A/yBbEJ

Modelled System Timer in Microsemi's Smartfusion2 Soc.
Timer has two 32bit down counters and two interrupts.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/timer/Makefile.objs       |   1 +
 hw/timer/mss-timer.c         | 289 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/timer/mss-timer.h |  64 ++++++++++
 3 files changed, 354 insertions(+)
 create mode 100644 hw/timer/mss-timer.c
 create mode 100644 include/hw/timer/mss-timer.h

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 15cce1c..8c19eac 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -42,3 +42,4 @@ common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
 
 common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
 common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
+common-obj-$(CONFIG_MSF2) += mss-timer.o
diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
new file mode 100644
index 0000000..60f1213
--- /dev/null
+++ b/hw/timer/mss-timer.c
@@ -0,0 +1,289 @@
+/*
+ * Block model of System timer present in
+ * Microsemi's SmartFusion2 and SmartFusion SoCs.
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
+#include "qemu/main-loop.h"
+#include "qemu/log.h"
+#include "hw/timer/mss-timer.h"
+
+#ifndef MSS_TIMER_ERR_DEBUG
+#define MSS_TIMER_ERR_DEBUG  0
+#endif
+
+#define DB_PRINT_L(lvl, fmt, args...) do { \
+    if (MSS_TIMER_ERR_DEBUG >= lvl) { \
+        qemu_log("%s: " fmt "\n", __func__, ## args); \
+    } \
+} while (0);
+
+#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
+
+#define R_TIM_VAL         0
+#define R_TIM_LOADVAL     1
+#define R_TIM_BGLOADVAL   2
+#define R_TIM_CTRL        3
+#define R_TIM_RIS         4
+#define R_TIM_MIS         5
+
+#define TIMER_CTRL_ENBL     (1 << 0)
+#define TIMER_CTRL_ONESHOT  (1 << 1)
+#define TIMER_CTRL_INTR     (1 << 2)
+#define TIMER_RIS_ACK       (1 << 0)
+#define TIMER_RST_CLR       (1 << 6)
+#define TIMER_MODE          (1 << 0)
+
+static void timer_update_irq(struct Msf2Timer *st)
+{
+    bool isr, ier;
+
+    isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
+    ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
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
+timer_read(void *opaque, hwaddr offset, unsigned int size)
+{
+    MSSTimerState *t = opaque;
+    hwaddr addr;
+    struct Msf2Timer *st;
+    uint32_t ret = 0;
+    int timer = 0;
+    int isr;
+    int ier;
+
+    addr = offset >> 2;
+    /*
+     * Two independent timers has same base address.
+     * Based on address passed figure out which timer is being used.
+     */
+    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
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
+        if (addr < R_TIM1_MAX) {
+            ret = st->regs[addr];
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
+            return ret;
+        }
+        break;
+    }
+
+    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32, timer, offset,
+            ret);
+    return ret;
+}
+
+static void
+timer_write(void *opaque, hwaddr offset,
+            uint64_t val64, unsigned int size)
+{
+    MSSTimerState *t = opaque;
+    hwaddr addr;
+    struct Msf2Timer *st;
+    int timer = 0;
+    uint32_t value = val64;
+
+    addr = offset >> 2;
+    /*
+     * Two independent timers has same base address.
+     * Based on addr passed figure out which timer is being used.
+     */
+    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
+        timer = 1;
+        addr -= R_TIM1_MAX;
+    }
+
+    st = &t->timers[timer];
+
+    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)", offset,
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
+    default:
+        if (addr < R_TIM1_MAX) {
+            st->regs[addr] = value;
+        } else {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
+            return;
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
+        .min_access_size = 1,
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
+static void mss_timer_init(Object *obj)
+{
+    MSSTimerState *t = MSS_TIMER(obj);
+    int i;
+
+    /* Init all the ptimers.  */
+    for (i = 0; i < NUM_TIMERS; i++) {
+        struct Msf2Timer *st = &t->timers[i];
+
+        st->bh = qemu_bh_new(timer_hit, st);
+        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
+        ptimer_set_freq(st->ptimer, t->freq_hz);
+        sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
+    }
+
+    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, TYPE_MSS_TIMER,
+                          NUM_TIMERS * R_TIM1_MAX * 4);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
+}
+
+static const VMStateDescription vmstate_timers = {
+    .name = "mss-timer-block",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_PTIMER(ptimer, struct Msf2Timer),
+        VMSTATE_UINT32_ARRAY(regs, struct Msf2Timer, R_TIM1_MAX),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_mss_timer = {
+    .name = TYPE_MSS_TIMER,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(freq_hz, MSSTimerState),
+        VMSTATE_STRUCT_ARRAY(timers, MSSTimerState, NUM_TIMERS, 0,
+                vmstate_timers, struct Msf2Timer),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static Property mss_timer_properties[] = {
+    /* Libero GUI shows 100Mhz as default for clocks */
+    DEFINE_PROP_UINT32("clock-frequency", MSSTimerState, freq_hz,
+                      100 * 1000000),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void mss_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->props = mss_timer_properties;
+    dc->vmsd = &vmstate_mss_timer;
+}
+
+static const TypeInfo mss_timer_info = {
+    .name          = TYPE_MSS_TIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(MSSTimerState),
+    .instance_init = mss_timer_init,
+    .class_init    = mss_timer_class_init,
+};
+
+static void mss_timer_register_types(void)
+{
+    type_register_static(&mss_timer_info);
+}
+
+type_init(mss_timer_register_types)
diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
new file mode 100644
index 0000000..d15d173
--- /dev/null
+++ b/include/hw/timer/mss-timer.h
@@ -0,0 +1,64 @@
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
+#ifndef HW_MSS_TIMER_H
+#define HW_MSS_TIMER_H
+
+#include "hw/sysbus.h"
+#include "hw/ptimer.h"
+
+#define TYPE_MSS_TIMER     "mss-timer"
+#define MSS_TIMER(obj)     OBJECT_CHECK(MSSTimerState, \
+                              (obj), TYPE_MSS_TIMER)
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
+#define R_TIM1_MAX        6
+
+struct Msf2Timer {
+    QEMUBH *bh;
+    ptimer_state *ptimer;
+
+    uint32_t regs[R_TIM1_MAX];
+    qemu_irq irq;
+};
+
+typedef struct MSSTimerState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+    uint32_t freq_hz;
+    struct Msf2Timer timers[NUM_TIMERS];
+} MSSTimerState;
+
+#endif /* HW_MSS_TIMER_H */
-- 
2.5.0


Received: by 10.223.172.38 with SMTP id v35csp4112610wrc;
        Mon, 18 Sep 2017 12:24:02 -0700 (PDT)
X-Received: by 10.237.36.48 with SMTP id r45mr51527708qtc.119.1505762642071;
        Mon, 18 Sep 2017 12:24:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505762642; cv=none;
        d=google.com; s=arc-20160816;
        b=jExBPIMZ17tiR0iPMHa+Mpn9onwH8s2pjGD3pSvWsrWBhUpfwwgKcDZH6Efq2pu5w0
         dJUvRN5ynMC4wafGUhz8YjF5bYmtYSe1yQ21WkTDVl8HG3wAhfxAbmoncNya6S1o7aia
         GoD3JifF/GwkMXESwdfpn4mvoVp/8jbZqCbgiNObq4ywUv1pPbbvum7dUNuqt1yagGWo
         sL34yhB8hMTf+anuxiZ6oX2CoCSAlyyCiyX5KvvYgxF9Jwbc+09ijrvj6mY6KRNXnj79
         yaji7pvg2HpDtohkbNwm7DKqkkKJokq6+Zgjc8Mmi3SSKajpFaRhgucY5EOgkjBaJkXg
         B/zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ziJIct+RJFXAV6RrLF2cXXkrg2mKJVML9mQ+4tNmh6g=;
        b=fwphSkNTpoKDV+JQU21Qj1lOsW8qVCMR2J0Fubm7zrj4qM54O2Xy+xdYEnaQoXObLl
         /YMRNL7yMMDsVSV3NiTo8AAbgXLOLKrxpb+bUmSBCkXNUbxtuJIQFiuyuGV8/zTCX+0t
         nsi+uBvr7xZVHXKTl26E4Uumd7elcLHm6aqY737kSsvToUu8UVjBaheR1bwxCQKqLAmH
         UBfYEVFNv+E8f9DuraADPJhC3g3OVdGNg7jRA8uISVt+B9E4dzK2y7Z4v0+0VdgUFQmP
         A9t74fTCsLFeXoO6yBJY0ywSoi0xsYW4ERDa/vHbJNwCh3o7eQmQnEF4utpcSCywVCGE
         TfOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ADsXqTIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n63si7412177qkd.365.2017.09.18.12.24.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:24:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ADsXqTIu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du1eB-0004ZS-Il
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:23:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1dv-0004Wg-LE
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:23:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1du1dt-00027M-DA
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:23:43 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:36843)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1du1do-00024T-IG; Mon, 18 Sep 2017 15:23:36 -0400
Received: by mail-pf0-x243.google.com with SMTP id f84so563044pfj.3;
	Mon, 18 Sep 2017 12:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ziJIct+RJFXAV6RrLF2cXXkrg2mKJVML9mQ+4tNmh6g=;
	b=ADsXqTIuU+s6Uj7tKP5OT2GacolKep5iSgCCZQnHJ5VBL0+4KKn0UbWwB1Py+61sS2
	rWY0xl8owPhKus5uG0UqCkUBXaCf6iX5AG15zZlCfrs9a/YwrtDFCSb7zSAE5cSrbMl2
	7XqabtSQjPDRrEExcUIqejOVgyBXnZ71OEp490kYEaunSc22GqGw+aO3FcQt+DzcngB7
	PSUtgwiTFQ16xN/5XJFF8vjIFfzCHyaMe+5q79B7q5m5eKPHcrDoDOvVMFVScIUN27Ff
	1zoOodc8f2HC3soimg0HM05UF8js8SAnjwbtCWmoNoWej1QXV5NnTuT8GpUAHhTkcYtv
	1Nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ziJIct+RJFXAV6RrLF2cXXkrg2mKJVML9mQ+4tNmh6g=;
	b=rkhrpQfyvtrC/ROwWOvvevoWmkmsNTQfq8fZg43XG6Ycpqnr9nhBzJAQOSswGzk1BR
	l0JzpntO0D7OlUrC6QyDtN/i/TE4QZ7bQgPCD/eiE2YwRMuxdKD7LSfF6Vs+uj9P9/uO
	ihWrfQiaOZWmlzgQgwuuvj8bQf6XpFABGzy3NfQKVObzR/yQKCgSmM3vVbyO/EBgHj3E
	k6tr1f8RH93735QvqU7Nlw8EGib6Qkxo8ho/qzfS46Bugp6u8hdXi7NR591akxKUitS0
	jYgJ9f4MWbGdMPKLuqbHGlABKGfK24ACbJ8eofKuqgQ+Kk2d+geEcaV7LWzmH/0sTo/Z
	6EWg==
X-Gm-Message-State: AHPjjUimiETobYpOqKmsijb1D8qetTtD9ZZg9dyL763+htfv/JlpXl9J
	0/DBFlOjO12q6SLm
X-Google-Smtp-Source: AOwi7QCFCaos3noBfimTH62mk+hVrCRCpievmeCln6F6pejbjM9oOU5NbsXvFDxX3JF13mvBr3eAyw==
X-Received: by 10.84.179.129 with SMTP id b1mr8563821plc.316.1505762615368;
	Mon, 18 Sep 2017 12:23:35 -0700 (PDT)
Received: from localhost.localdomain ([124.123.70.3])
	by smtp.gmail.com with ESMTPSA id w12sm169701pfk.83.2017.09.18.12.23.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Sep 2017 12:23:34 -0700 (PDT)
From: Subbaraya Sundeep <sundeep.lkml@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 19 Sep 2017 00:53:17 +0530
Message-Id: <1505762601-27143-2-git-send-email-sundeep.lkml@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
References: <1505762601-27143-1-git-send-email-sundeep.lkml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [Qemu devel v10 PATCH 1/5] msf2: Add Smartfusion2 System
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
	f4bug@amsat.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5+a/LzvNkK23

Modelled System Timer in Microsemi's Smartfusion2 Soc.
Timer has two 32bit down counters and two interrupts.

Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


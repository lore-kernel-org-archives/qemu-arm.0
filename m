Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp82891wrm;
        Thu, 17 Oct 2019 15:59:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQncPTnqrrrFRDVNgtFLNmAp+awh9G2tvX3IK/7TNroSkYuuIFs3lvZH4iEELGK4cbIRsp
X-Received: by 2002:aa7:c556:: with SMTP id s22mr6518422edr.105.1571353159938;
        Thu, 17 Oct 2019 15:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571353159; cv=none;
        d=google.com; s=arc-20160816;
        b=plRMWJZWI20UtThAxT//V7sUDzMjMMqzVO3Skgz80aFt0OLTE0kcFy5qxAvNz/idn3
         gtM2I8TmYhQwoV5v3zLBKwlHawj+V4gpbyphyXuKJowCiZ45GF+ktPMD79XCUODYy5EY
         GKyr8SJhxBoc3w6U2I7XlmTtK0Avt112RCtHJIf+dAVFhKpxNRXqmWXHFL3lFwW740o3
         +1r5rUwxcxUgtdDhKvSV6KTDL9X7WdoBRZ2JcDqz/OXXQ3cuehFZNu08kXp9LT6mTIBK
         6y4sSdhV5Mn3Wy42Wv8uWFjKTqj9/u4GfBwycS+EtuFy7nKQ6RxT5aSm6/CBrdmPExB1
         IhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iEJkJA7iDsU1hNDUpdiwUKdaD5rbV1BDDy6YF2uxyVE=;
        b=NLDbzhGrtVGW0/pgbrZjfqfN0ljauk6CneNb0Ko+W6koAdhhWPkFaijxzODsmr/sEm
         6exOw/8Dc0tT6c6B7A1TaWIJ6bJ2G+D+w4//QDmA+Mm6reJbLpFUShBKjRgrwWPiTBKG
         +/EKhWgeQ2GibjvZBqUKIoFGTr4Y8yCR+LIWz6UWMpdFHDdA6vu4kMJOULiX6pxZJckU
         GoEbIRjpYtxX3BnWjh6KHQ+fXURlbD5UGThgNmqb65H8V6aRnSfaN5TNZ8pnp9vE4VRl
         PSAVQ6WF7zwPYjO4rGjaGplQDyHJy958yV/VZZtDCcTz6SRD3ey0xc2ADbaikZEfOkbL
         mQoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=btKlurS4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20si2472725eds.363.2019.10.17.15.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 15:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=btKlurS4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLEjm-000102-Fc
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 18:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41057)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLEin-0000Wx-LR
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 18:58:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLEil-0002NO-Vq
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 18:58:17 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:41522)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iLEil-0002Mm-OS; Thu, 17 Oct 2019 18:58:15 -0400
Received: by mail-wr1-x441.google.com with SMTP id p4so4123729wrm.8;
 Thu, 17 Oct 2019 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iEJkJA7iDsU1hNDUpdiwUKdaD5rbV1BDDy6YF2uxyVE=;
 b=btKlurS4bAU9BkjNlfTCLi3FZMC1w2q5Hgqk+0La+Q6trB2/dNUYx8Js0fq645sxDl
 0hajlXERtjuns9IFNz7oawsUNO6dKnVG6/eN67C4XPyxUvo9FERHNq3vhNyU1bsBosGo
 lXt9w7zYSDQyMDY92XP+M5v2XNYXF95LqIoDZ6Gmz8PNOMBqRhnHyq3G9IYtu346xdRX
 PSd45HxxZbNNKe14rWqSTrPz7xeqZTXeE1eVFVq5QTeVEMwsJbH/1u78EgkLdIre9kQq
 Z6Sr+Ske3jDePr0yLSzOI8IBgg+ne17fmczFf3qUu4OWE8KIw9JqmVmhFyBFMXYAXwfR
 atAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iEJkJA7iDsU1hNDUpdiwUKdaD5rbV1BDDy6YF2uxyVE=;
 b=KpPIRf8ZsrqGqhxGID1EZyMGVHDltfrgSgk5UT6tUBVC/njphwRvcsuRt9+9Hsue8R
 Q+GLraVUztYY8GwehfIkXePMn3AIZHap9x+rLJgpn1i32iP2G/c/2+20hfLRxfXoT26w
 quhaA7nW/0Co1eLOcZv1/GoDVXxtqbj0oK4Bkpb1ZFLxH925+pHFDYYoS5g1NM3vCZyM
 7n2j0JfC5YS0i8aPMzCjKcJi/NiPCODgIKtKuArvEk0h1PVGUTqkJJN86zusOsdOl5kC
 Rg3r3Bnmcn9U//8ATynW7LtE8Vv1QL+jUyG7j1c26ZxfRu0B92YPfxyGuGiG8AlLy2VN
 Rw0w==
X-Gm-Message-State: APjAAAXwwgUzulwqelbVhyL0F6JQfQgwGatM1HQTBVjH7vmnvSuEtPCC
 ubmCnpsfeCw8qZFFL14UEVPs67uR
X-Received: by 2002:a5d:440b:: with SMTP id z11mr4777629wrq.309.1571353094238; 
 Thu, 17 Oct 2019 15:58:14 -0700 (PDT)
Received: from localhost.localdomain (14.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.14])
 by smtp.gmail.com with ESMTPSA id m18sm3993873wrg.97.2019.10.17.15.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 15:58:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/10] hw/timer/bcm2835: Add the BCM2835 SYS_timer
Date: Fri, 18 Oct 2019 00:57:53 +0200
Message-Id: <20191017225800.6946-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191017225800.6946-1-f4bug@amsat.org>
References: <20191017225800.6946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, Pekka Enberg <penberg@iki.fi>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 Pete Batard <pete@akeo.ie>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Clement Deschamps <clement.deschamps@antfield.fr>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FJMdUbSYnVjv

Add the 64-bit free running timer. Do not model the COMPARE register
(no IRQ generated).
This timer is used by Linux kernel and recently U-Boot:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clocksource/bcm2835_timer.c?h=v3.7
https://github.com/u-boot/u-boot/blob/v2019.07/include/configs/rpi.h#L19

Datasheet used:
https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
- Add status/compare* registers
- Add vmstate and reset handler

checkpatch warning:
WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
This is OK because the regex are:

  F: hw/*/bcm283*
  F: include/hw/*/bcm283*
---
 hw/timer/Makefile.objs            |   1 +
 hw/timer/bcm2835_systmr.c         | 166 ++++++++++++++++++++++++++++++
 hw/timer/trace-events             |   5 +
 include/hw/timer/bcm2835_systmr.h |  33 ++++++
 4 files changed, 205 insertions(+)
 create mode 100644 hw/timer/bcm2835_systmr.c
 create mode 100644 include/hw/timer/bcm2835_systmr.h

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 123d92c969..696cda5905 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -47,3 +47,4 @@ common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
 common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
 common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) += cmsdk-apb-dualtimer.o
 common-obj-$(CONFIG_MSF2) += mss-timer.o
+common-obj-$(CONFIG_RASPI) += bcm2835_systmr.o
diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
new file mode 100644
index 0000000000..49b40b55f9
--- /dev/null
+++ b/hw/timer/bcm2835_systmr.c
@@ -0,0 +1,166 @@
+/*
+ * BCM2835 SYS timer emulation
+ *
+ * Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Datasheet: BCM2835 ARM Peripherals (C6357-M-1398)
+ * https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf
+ *
+ * Only the free running 64-bit counter is implemented.
+ * The 4 COMPARE registers and the interruption are not implemented.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/timer.h"
+#include "hw/timer/bcm2835_systmr.h"
+#include "hw/registerfields.h"
+#include "migration/vmstate.h"
+#include "trace.h"
+
+REG32(CTRL_STATUS,  0x00)
+REG32(COUNTER_LOW,  0x04)
+REG32(COUNTER_HIGH, 0x08)
+REG32(COMPARE0,     0x0c)
+REG32(COMPARE1,     0x10)
+REG32(COMPARE2,     0x14)
+REG32(COMPARE3,     0x18)
+
+static void bcm2835_systmr_update_irq(BCM2835SystemTimerState *s)
+{
+    bool enable = !!s->reg.status;
+
+    trace_bcm2835_systmr_irq(enable);
+    qemu_set_irq(s->irq, enable);
+}
+
+static void bcm2835_systmr_update_compare(BCM2835SystemTimerState *s,
+                                          unsigned timer_index)
+{
+    /* TODO fow now, since neither Linux nor U-boot use these timers. */
+    qemu_log_mask(LOG_UNIMP, "COMPARE register %u not implemented\n",
+                  timer_index);
+}
+
+static uint64_t bcm2835_systmr_read(void *opaque, hwaddr offset,
+                                    unsigned size)
+{
+    BCM2835SystemTimerState *s = BCM2835_SYSTIMER(opaque);
+    uint64_t r = 0;
+
+    switch (offset) {
+    case A_CTRL_STATUS:
+        r = s->reg.status;
+        break;
+    case A_COMPARE0 ... A_COMPARE3:
+        r = s->reg.compare[(offset - A_COMPARE0) >> 2];
+        break;
+    case A_COUNTER_LOW:
+    case A_COUNTER_HIGH:
+        /* Free running counter at 1MHz */
+        r = qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);
+        r >>= 8 * (offset - A_COUNTER_LOW);
+        r &= UINT32_MAX;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+    trace_bcm2835_systmr_read(offset, r);
+
+    return r;
+}
+
+static void bcm2835_systmr_write(void *opaque, hwaddr offset,
+                                 uint64_t value, unsigned size)
+{
+    BCM2835SystemTimerState *s = BCM2835_SYSTIMER(opaque);
+
+    trace_bcm2835_systmr_write(offset, value);
+    switch (offset) {
+    case A_CTRL_STATUS:
+        s->reg.status &= ~value; /* Ack */
+        bcm2835_systmr_update_irq(s);
+        break;
+    case A_COMPARE0 ... A_COMPARE3:
+        s->reg.compare[(offset - A_COMPARE0) >> 2] = value;
+        bcm2835_systmr_update_compare(s, (offset - A_COMPARE0) >> 2);
+        break;
+    case A_COUNTER_LOW:
+    case A_COUNTER_HIGH:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: read-only ofs 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps bcm2835_systmr_ops = {
+    .read = bcm2835_systmr_read,
+    .write = bcm2835_systmr_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void bcm2835_systmr_reset(DeviceState *dev)
+{
+    BCM2835SystemTimerState *s = BCM2835_SYSTIMER(dev);
+
+    s->reg.status = 0;
+    for (size_t i = 0; i < ARRAY_SIZE(s->reg.compare); i++) {
+        s->reg.compare[i] = 0;
+    }
+}
+
+static void bcm2835_systmr_realize(DeviceState *dev, Error **errp)
+{
+    BCM2835SystemTimerState *s = BCM2835_SYSTIMER(dev);
+
+    memory_region_init_io(&s->iomem, OBJECT(dev), &bcm2835_systmr_ops,
+                          s, "bcm2835-sys-timer", 0x20);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+}
+
+static const VMStateDescription bcm2835_systmr_vmstate = {
+    .name = "bcm2835_sys_timer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(reg.status, BCM2835SystemTimerState),
+        VMSTATE_UINT32_ARRAY(reg.compare, BCM2835SystemTimerState, 4),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_systmr_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = bcm2835_systmr_realize;
+    dc->reset = bcm2835_systmr_reset;
+    dc->vmsd = &bcm2835_systmr_vmstate;
+}
+
+static const TypeInfo bcm2835_systmr_info = {
+    .name = TYPE_BCM2835_SYSTIMER,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835SystemTimerState),
+    .class_init = bcm2835_systmr_class_init,
+};
+
+static void bcm2835_systmr_register_types(void)
+{
+    type_register_static(&bcm2835_systmr_info);
+}
+
+type_init(bcm2835_systmr_register_types);
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index db02a9142c..0aa399ac69 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -87,3 +87,8 @@ pl031_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
 pl031_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
 pl031_alarm_raised(void) "alarm raised"
 pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
+
+# bcm2835_systmr.c
+bcm2835_systmr_irq(bool enable) "timer irq state %u"
+bcm2835_systmr_read(uint64_t offset, uint64_t data) "timer read: offset 0x%" PRIx64 " data 0x%" PRIx64
+bcm2835_systmr_write(uint64_t offset, uint64_t data) "timer write: offset 0x%" PRIx64 " data 0x%" PRIx64
diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
new file mode 100644
index 0000000000..c0bc5c8127
--- /dev/null
+++ b/include/hw/timer/bcm2835_systmr.h
@@ -0,0 +1,33 @@
+/*
+ * BCM2835 SYS timer emulation
+ *
+ * Copyright (c) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef BCM2835_SYSTIMER_H
+#define BCM2835_SYSTIMER_H
+
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+
+#define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
+#define BCM2835_SYSTIMER(obj) \
+    OBJECT_CHECK(BCM2835SystemTimerState, (obj), TYPE_BCM2835_SYSTIMER)
+
+typedef struct {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    struct {
+        uint32_t status;
+        uint32_t compare[4];
+    } reg;
+} BCM2835SystemTimerState;
+
+#endif
-- 
2.21.0


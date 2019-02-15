Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp782417wrp;
        Fri, 15 Feb 2019 08:07:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZV51iI+Y7rsD5AGyXJ1WRqyO+VLyCF+VLI5o3GWy/H1XMxYMyApIgaJRyAlS2g4l+Xlyv8
X-Received: by 2002:a25:46c5:: with SMTP id t188mr8539175yba.274.1550246871394;
        Fri, 15 Feb 2019 08:07:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550246871; cv=none;
        d=google.com; s=arc-20160816;
        b=DEyvPe8CTYMfXoImkRbu73F+VGIMihtwTgZ0XDdODd51Zwx53zkYWzdTBE5eEXFOqH
         rVqpme4xmlvePq/NaM84rh6+RKy4a8EvYgOMlCe2S+Xpti/MpNaT/sKIOhRqbZ7ExKJn
         OUvqDyzeS5NRk85icgFvSNL1ZN1xqwDQ96uxoIGWeKEjJhsrIyH+YGCwwwQ7o9w50qDm
         0eeuscCgzxAUyWLEO9XYeSXjeplewlHz962TZhTUPgeiul8FUznGrIK6Pxs13w8ZZIxC
         BrRbXVX0AvU3R9N+ftuzWP19eevCSc8CH1MlcjceLZ9rzrhqZ4htpi/K/pfhNFL/h5a2
         8d0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent
         :content-disposition:mime-version:message-id:to:from:dkim-signature
         :date;
        bh=jBrgqUtblbCyVT44wChvxPNmnSqn1hHA0Qs+83CUx1g=;
        b=UVLXV3lYCIvuJx9mNM66TsqQrZA6Vf+b0eFXo3vPAMcMP50+adawoU8wM0uV0sl6cU
         +YWXAqdoYo4VfagpuUrkG54rvqa8JmTOQF3h8BN1Yv9Ofdbos+Ab7pMdFMWEcx108XqB
         gYurOIXlCl3NErzfERYTuM4vMBBQt9i4+VCp12Z3LtUd/bUH1xYWkC0iKoLOc6LKbFY6
         6lXY3IOZnS5D3ob+sPYp3BBQhQXE/PL5bYQK+foQeKEiRadLJ/zkmpVjL1+Qbk9QJtol
         vrs93Zfrlky4JHEFVDublGgqwnu9PH2+ZtLXOg4SazPphGv1wpTztQRWHx6g4HUyTFkp
         OKSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@airmail.cc header.s=mail header.b=gLIsilbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si3596235ywa.160.2019.02.15.08.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Feb 2019 08:07:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@airmail.cc header.s=mail header.b=gLIsilbk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:42141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gug1k-0004Fi-AN
	for alex.bennee@linaro.org; Fri, 15 Feb 2019 11:07:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alnyan@airmail.cc>) id 1guftM-00068Q-G6
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 10:59:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alnyan@airmail.cc>) id 1guftI-0003uQ-Oy
	for qemu-arm@nongnu.org; Fri, 15 Feb 2019 10:59:08 -0500
Received: from cock.li ([185.100.85.212]:34052)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alnyan@airmail.cc>)
	id 1guftH-0003lj-GU; Fri, 15 Feb 2019 10:59:04 -0500
Date: Fri, 15 Feb 2019 17:59:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1550246339; bh=rOySOWPs7Us7/aeiariZe4tMQWxSzV1r8CQYIqlY1Bg=;
	h=Date:From:To:Cc:Subject:From;
	b=gLIsilbkVNygYdeffIO0HZ5ps5hqf6LHBcDLq3DoIlB4YbdYwTSOqPupKtiuhUYW+
	RnmPI2ncYY0KQUsI54ElJLVW8xX9GGfK5JZnglmE9uHO5xB/fO/EQ0fP5FDTuzFdo0
	JxLkX3+UYCLEuwcjrm30yN9RC9suH7lhP2eVo4cQg131MQ9kvd/rHGDpo3J+G6t22k
	BDmou/j0Vs8azIY8bWSfXiYOTVkCx4yWV4CndXt66exLKiMGBeLQ/96p8M3CltqZjW
	zB/sXaZd3IqeGu4F6EAwlSKlWdKTqf0mougZ94/yC8hYD8lf703cBeeidP/22lc7Nb
	39cZxKGmVp1/g==
From: Mark <alnyan@airmail.cc>
To: qemu-devel@nongnu.org
Message-ID: <20190215155919.GA10823@nyan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.100.85.212
Subject: [Qemu-arm] [v4 PATCH] hw/arm/bcm2835_peripherals: add bcm283x arm
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:Raspberry Pi" <qemu-arm@nongnu.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CDZVrDLb46li

Signed-off-by: Mark <alnyan@airmail.cc>
---
 hw/arm/bcm2835_peripherals.c         |  17 ++
 hw/timer/Makefile.objs               |   2 +
 hw/timer/bcm283x_timer.c             | 271 +++++++++++++++++++++++++++
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/timer/bcm283x_timer.h     |  50 +++++
 5 files changed, 342 insertions(+)
 create mode 100644 hw/timer/bcm283x_timer.c
 create mode 100644 include/hw/timer/bcm283x_timer.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 6be7660e8c..e6d4d35496 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -117,6 +117,10 @@ static void bcm2835_peripherals_init(Object *obj)
                                    OBJECT(&s->sdhci.sdbus), &error_abort);
     object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
                                    OBJECT(&s->sdhost.sdbus), &error_abort);
+
+    /* SP804-alike ARM Timer */
+    sysbus_init_child_obj(obj, "bcm283x_timer", OBJECT(&s->bcm283x_timer),
+            sizeof(s->bcm283x_timer), TYPE_BCM283xTimer);
 }

 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
@@ -334,6 +338,19 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+
+    /* SP804-alike ARM Timer */
+    object_property_set_bool(OBJECT(&s->bcm283x_timer), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, ARMCTRL_TIMER0_1_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->bcm283x_timer), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->bcm283x_timer), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
+                               INTERRUPT_ARM_TIMER));
 }

 static void bcm2835_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 0e9a4530f8..09a3706701 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -47,3 +47,5 @@ common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
 common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
 common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) += cmsdk-apb-dualtimer.o
 common-obj-$(CONFIG_MSF2) += mss-timer.o
+
+common-obj-$(CONFIG_RASPI) += bcm283x_timer.o
diff --git a/hw/timer/bcm283x_timer.c b/hw/timer/bcm283x_timer.c
new file mode 100644
index 0000000000..0f696ae61f
--- /dev/null
+++ b/hw/timer/bcm283x_timer.c
@@ -0,0 +1,271 @@
+/*
+ * Broadcom BCM283x ARM timer variant based on ARM SP804
+ * Copyright (c) 2019, Mark <alnyan@airmail.cc>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#include "qemu/osdep.h"
+#include "qemu/timer.h"
+#include "qemu-common.h"
+#include "hw/qdev.h"
+#include "hw/timer/bcm283x_timer.h"
+#include "qemu/main-loop.h"
+#include "qemu/log.h"
+
+#define TIMER_CTRL_32BIT            (1 << 1)
+#define TIMER_CTRL_DIV1             (0 << 2)
+#define TIMER_CTRL_DIV16            (1 << 2)
+#define TIMER_CTRL_DIV256           (2 << 2)
+#define TIMER_CTRL_IE               (1 << 5)
+#define TIMER_CTRL_ENABLE           (1 << 7)
+#define TIMER_CTRL_ENABLE_FREECNTR  (1 << 9)
+
+/* BCM283x's implementation of SP804 ARM timer */
+
+static void bcm283x_timer_set_irq(void *opaque, int irq, int level)
+{
+    BCM283xTimerState *s = BCM283xTimer(opaque);
+
+    s->int_level = level;
+    qemu_set_irq(s->irq, s->int_level);
+}
+
+static void bcm283x_timer_update(BCM283xTimerState *s)
+{
+    if (s->int_level && (s->control & TIMER_CTRL_IE)) {
+        qemu_irq_raise(s->irq);
+    } else {
+        qemu_irq_lower(s->irq);
+    }
+}
+
+static void bcm283x_timer_tick(void *opaque)
+{
+    BCM283xTimerState *s = BCM283xTimer(opaque);
+    s->int_level = 1;
+    bcm283x_timer_update(s);
+}
+
+static void bcm283x_free_timer_tick(void *opaque)
+{
+    /* Do nothing */
+}
+
+static uint64_t bcm283x_timer_read(void *opaque, hwaddr offset, unsigned size)
+{
+    BCM283xTimerState *s = BCM283xTimer(opaque);
+
+    switch (offset >> 2) {
+    case 0: /* Load register */
+    case 6: /* Reload register */
+        return s->limit;
+    case 1: /* Value register */
+        return ptimer_get_count(s->timer);
+    case 2: /* Control register */
+        return s->control;
+    case 3: /* IRQ clear/ACK register */
+        /*
+         * The register is write-only,
+         * but returns reverse "ARMT" string bytes
+         */
+        return 0x544D5241;
+    case 4: /* RAW IRQ register */
+        return s->int_level;
+    case 5: /* Masked IRQ register */
+        if ((s->control & TIMER_CTRL_IE) == 0) {
+            return 0;
+        }
+        return s->int_level;
+    case 8: /* Free-running counter */
+        return ptimer_get_count(s->free_timer);
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset %x\n", __func__, (int) offset);
+        return 0;
+    }
+}
+
+static void bcm283x_timer_write(void *opaque, hwaddr offset, uint64_t value,
+        unsigned size)
+{
+    BCM283xTimerState *s = BCM283xTimer(opaque);
+    uint32_t freq, freecntr_freq;
+
+    switch (offset >> 2) {
+    case 0: /* Load register */
+        s->limit = value;
+        ptimer_set_limit(s->timer, s->limit, 1);
+        break;
+    case 1: /* Value register */
+        /* Read only */
+        break;
+    case 2: /* Control register */
+        if (s->control & TIMER_CTRL_ENABLE) {
+            ptimer_stop(s->timer);
+        }
+
+        s->control = value;
+
+        /* Configure SP804 */
+        freq = BCM283x_SYSTEM_CLOCK_FREQ / (s->prediv + 1);
+        /* Set pre-scaler */
+        switch ((value >> 2) & 3) {
+        case 1: /* 16 */
+            freq >>= 4;
+            break;
+        case 2: /* 256 */
+            freq >>= 8;
+            break;
+        }
+        ptimer_set_limit(s->timer, s->limit, s->control & TIMER_CTRL_ENABLE);
+        ptimer_set_freq(s->timer, freq);
+
+        /* Configure free-running counter */
+        freecntr_freq = BCM283x_SYSTEM_CLOCK_FREQ /
+            (1 + ((value >> 16) & 0xFF));
+        if (s->control & TIMER_CTRL_32BIT) {
+            ptimer_set_limit(s->free_timer, 0xFFFFFFFF,
+                    s->control & TIMER_CTRL_ENABLE_FREECNTR);
+        } else {
+            ptimer_set_limit(s->free_timer, 0xFFFF,
+                    s->control & TIMER_CTRL_ENABLE_FREECNTR);
+        }
+        ptimer_set_freq(s->free_timer, freecntr_freq);
+
+        if (s->control & TIMER_CTRL_ENABLE) {
+            ptimer_run(s->timer, 0);
+        } else {
+            ptimer_stop(s->free_timer);
+        }
+
+        if (s->control & TIMER_CTRL_ENABLE_FREECNTR) {
+            ptimer_run(s->free_timer, 0);
+        } else {
+            ptimer_stop(s->free_timer);
+        }
+        break;
+    case 3: /* IRQ clear/ACK register */
+        s->int_level = 0;
+        break;
+    case 6: /* Reload register */
+        s->limit = value;
+        ptimer_set_limit(s->timer, s->limit, 0);
+        break;
+    case 7: /* Pre-divider register */
+        s->prediv = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset %x\n", __func__, (int) offset);
+        break;
+    }
+
+    bcm283x_timer_update(s);
+}
+
+static const MemoryRegionOps bcm283x_timer_ops = {
+    .read = bcm283x_timer_read,
+    .write = bcm283x_timer_write,
+    .endianness = DEVICE_NATIVE_ENDIAN
+};
+
+static const VMStateDescription vmstate_bcm283x_timer = {
+    .name = "bcm283x_timer",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(control, BCM283xTimerState),
+        VMSTATE_UINT32(limit, BCM283xTimerState),
+        VMSTATE_UINT32(int_level, BCM283xTimerState),
+        VMSTATE_PTIMER(timer, BCM283xTimerState),
+        VMSTATE_PTIMER(free_timer, BCM283xTimerState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm283x_timer_init(Object *obj)
+{
+    BCM283xTimerState *s = BCM283xTimer(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm283x_timer_ops, s,
+            TYPE_BCM283xTimer, 0x100);
+
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void bcm283x_timer_reset(DeviceState *dev)
+{
+    BCM283xTimerState *s = BCM283xTimer(dev);
+
+    s->limit = 0;
+    s->int_level = 0;
+    s->control = TIMER_CTRL_IE | (0x0E << 16);
+    s->prediv = 0x7D;
+
+    /*
+     * Stop the timers.
+     * No need to update freqs/limits as this will automatically be done once
+     * the system writes control register.
+     */
+    ptimer_stop(s->timer);
+    ptimer_stop(s->free_timer);
+}
+
+static void bcm283x_timer_realize(DeviceState *dev, Error **errp)
+{
+    BCM283xTimerState *s = BCM283xTimer(dev);
+    QEMUBH *bh;
+
+    s->limit = 0;
+    s->int_level = 0;
+    s->control = TIMER_CTRL_IE | (0x0E << 16);
+    s->prediv = 0x7D;
+
+    /* Create a regular SP804 timer */
+    bh = qemu_bh_new(bcm283x_timer_tick, s);
+    s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
+    s->irq = qemu_allocate_irq(bcm283x_timer_set_irq, s, 0);
+
+    /* Create a free-running timer */
+    bh = qemu_bh_new(bcm283x_free_timer_tick, s);
+    s->free_timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
+
+    vmstate_register(NULL, -1, &vmstate_bcm283x_timer, s);
+}
+
+static void bcm283x_timer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *k = DEVICE_CLASS(klass);
+
+    k->realize = bcm283x_timer_realize;
+    k->vmsd = &vmstate_bcm283x_timer;
+    k->reset = bcm283x_timer_reset;
+}
+
+static const TypeInfo bcm283x_timer_info = {
+    .name           = TYPE_BCM283xTimer,
+    .parent         = TYPE_SYS_BUS_DEVICE,
+    .instance_size  = sizeof(BCM283xTimerState),
+    .instance_init  = bcm283x_timer_init,
+    .class_init     = bcm283x_timer_class_init
+};
+
+static void bcm283x_timer_register_types(void)
+{
+    type_register_static(&bcm283x_timer_info);
+}
+
+type_init(bcm283x_timer_register_types)
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index f5b193f670..bbe01d1500 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -23,6 +23,7 @@
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
 #include "hw/gpio/bcm2835_gpio.h"
+#include "hw/timer/bcm283x_timer.h"

 #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
 #define BCM2835_PERIPHERALS(obj) \
@@ -48,6 +49,7 @@ typedef struct BCM2835PeripheralState {
     SDHCIState sdhci;
     BCM2835SDHostState sdhost;
     BCM2835GpioState gpio;
+    BCM283xTimerState bcm283x_timer;
 } BCM2835PeripheralState;

 #endif /* BCM2835_PERIPHERALS_H */
diff --git a/include/hw/timer/bcm283x_timer.h b/include/hw/timer/bcm283x_timer.h
new file mode 100644
index 0000000000..99d0ae0f61
--- /dev/null
+++ b/include/hw/timer/bcm283x_timer.h
@@ -0,0 +1,50 @@
+/*
+ * Broadcom BCM283x ARM timer variant based on ARM SP804
+ * Copyright (c) 2019, Mark <alnyan@airmail.cc>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef HW_TIMER_BCM2835_TIMER_H
+#define HW_TIMER_BCM2835_TIMER_H
+
+#include "hw/sysbus.h"
+#include "hw/ptimer.h"
+
+/*
+ * The datasheet stated 252MHz is the system clock value after reset,
+ *  but it may be changed either by device going to sleep mode or
+ *  by kernel configuration
+ */
+#define BCM283x_SYSTEM_CLOCK_FREQ       252000000
+
+#define TYPE_BCM283xTimer "bcm283x_timer"
+#define BCM283xTimer(obj) \
+    OBJECT_CHECK(BCM283xTimerState, (obj), TYPE_BCM283xTimer)
+
+typedef struct {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    qemu_irq irq;
+
+    uint32_t control;
+    uint32_t limit;
+    uint32_t int_level;
+    uint32_t prediv;
+
+    ptimer_state *timer;
+    ptimer_state *free_timer;
+} BCM283xTimerState;
+
+#endif
--
2.20.1


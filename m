Received: by 10.223.197.9 with SMTP id q9csp3513982wrf;
        Tue, 10 Oct 2017 05:41:59 -0700 (PDT)
X-Received: by 10.55.210.71 with SMTP id f68mr12934026qkj.150.1507639319340;
        Tue, 10 Oct 2017 05:41:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507639319; cv=none;
        d=google.com; s=arc-20160816;
        b=zMUpvHMI7AU0uDIz8mNnU2HJ70TLsWpHk5ZmqyE3AG1wtJNy7bjw8EswKL3QsuRbBU
         r+y6K1x5WNatwZ84Nk6LIHJBIdhNGt668tt1gg3qMwYpHbFUZt4b59oE3s7ULsxujOg5
         lLbNgN4kX5Fx6ArRjI/YV4fTDZnuKltaItrhlgamjrxzaTmr49JRyvQYaNO8Ru54nGNg
         aupo2v/r9XyiEAtj74vPCHOY6lFMo1BJT6XJg4/HRD6aL61HpqV4Gdo60CBWbNMckhxt
         Ru9yHed5jvZIcl6QQeoDCbzoYjA2VdTIYj2thS5vawg66FrodZMQmaE+itJ85JQGLNnm
         eAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=EIt7HA0cunfANMKJQl4SX8uEGzwYJcvFyUz3fOxzyb4=;
        b=l4pRWYUdc/2PEwdXxzuxaABuJsX+P6vO4JW4N1CxmynvSmgRAKWDG6PUf/UxHa3U/5
         NeYgBEd0eQjvs+z6ssHdhiVMFUMz/tU7OtFgIK1tX9ELlbJe0X+lCdhdiNfusYWF2UAK
         dKK9SPbX4GJttzFtYYtY7lYbc6Z/14l11Rtvxlt/dkoXif+uNbbmlhr78kk6M/7xovfV
         It+lcLQx2NBlinTRRbxyeIVgH8LvLI13glmraytULCZw1KSRxyeIFpdG6Y0I3tBLOeGV
         e+ixGk1kggfyVXV6V4rqtlrEEsnfuzI3Tg5GrV5B5k6eJ0yjv6TNwAalKnG6JAsLb9X8
         y8jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IZy4BvFo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u56si531048qtu.376.2017.10.10.05.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 05:41:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IZy4BvFo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1trB-0007DU-4O
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 08:41:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44887)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.venries@gmail.com>) id 1e1tpU-0006LO-7R
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 08:40:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas.venries@gmail.com>) id 1e1tpN-0004vU-O1
	for qemu-devel@nongnu.org; Tue, 10 Oct 2017 08:40:12 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:45192)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <thomas.venries@gmail.com>)
	id 1e1tpN-0004sC-DM; Tue, 10 Oct 2017 08:40:05 -0400
Received: by mail-wm0-x243.google.com with SMTP id q124so4772707wmb.0;
	Tue, 10 Oct 2017 05:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EIt7HA0cunfANMKJQl4SX8uEGzwYJcvFyUz3fOxzyb4=;
	b=IZy4BvFouEbNW/n0b8m8s31xc1qgT8db17WnLm3fIKQMJ3tCzv98oi6f7BIy0yEMOG
	dugDI8BnNOyEvqjU/DBn++ek+p5qIsKlgzFraBpxZlJrKfRqbz50dlO61HbxlQrQ0XpI
	ofMvSubdBUWDMQgKVjkzdWVRA4hHm0mUtRmX1/z2/MS6MT9q612g5lM92gqRP5PKM59P
	0w8+BhL2TivRj7i8NJf8zdhy3tVaJhAvXfIOinWQ+MKioTRbyCMFaiw4i50AcQXjOlTD
	gzjD+SK8TG49gl6xOXJf2rnFMMYt2UTujZ3MLG4hw8+2RsHmwzi/O1DxXDpxcA3HVNIG
	V4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EIt7HA0cunfANMKJQl4SX8uEGzwYJcvFyUz3fOxzyb4=;
	b=PFn8Gq2k4c/UIHjAx9PWAUBbWxPCoLh017WAb1hinxOHV3ozigs34rWxVzz/8BQLy4
	7KVZBdOJHwMPND4OHd+Bw3rRs2898eKlnfVykiG3gv7kdNuBQSz8W7txrkPY+uJ4Y0Jl
	x6g7cXJL4xOl+ItXM9pE+8+r6mGSQJhYnola8vUcWPoAUjSedT2PRtCrvW9JuCUpmW/B
	xK+EDZGe0v69eQ1sMBFVNnGBFULgXPekV8vR7zAghyP2hpNsDfMQd9fQKRod7ml0RJQW
	y1njUUArUI3JwxPbdjWCGPd6kXAuPu7kRIDAg1iTJIsp2mFxrjak3dQLY2t2wEvbWmsF
	TIjQ==
X-Gm-Message-State: AMCzsaUsMNOwktII9lOb8orj65Sxuqk6zZNslUkqnuw7quFFbYSfRVRH
	/YaTW7PDGcLvg2cuSl0TFCfUFQ==
X-Google-Smtp-Source: AOwi7QDAAJbkqLJ0635WIAUTov50iUB3XGN9Z+4nTmX2xi+/OtTdS+WCMNJiOjbQ1KyxXwJMwZ4FLw==
X-Received: by 10.28.87.13 with SMTP id l13mr10740513wmb.45.1507639202540;
	Tue, 10 Oct 2017 05:40:02 -0700 (PDT)
Received: from P-ASN-KENPACHI-Thven.dhcp.idf.intranet
	(lns-bzn-39-82-255-32-23.adsl.proxad.net. [82.255.32.23])
	by smtp.gmail.com with ESMTPSA id 10sm8284690wmy.35.2017.10.10.05.40.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Oct 2017 05:40:01 -0700 (PDT)
From: =?UTF-8?q?Thomas=20Venri=C3=A8s?= <thomas.venries@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Oct 2017 14:39:57 +0200
Message-Id: <1507639197-31753-1-git-send-email-thomas.venries@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-devel] [PATCH] bcm2835_systimer: add bcm2835 system timer
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RDZVzosaeCbb

The BCM2835 System Timer is a memory-mapped
peripheral available on the BCM2835 used in the
Raspberry Pi. It features a 64-bit free-running
counter that runs at 1 MHz and four separate
"output compare registers" that can be used to schedule
interrupts.

Signed-off-by: Thomas Venriès <thomas.venries@gmail.com>
---
 hw/arm/bcm2835_peripherals.c         |  21 ++++
 hw/timer/Makefile.objs               |   1 +
 hw/timer/bcm2835_systimer.c          | 187 +++++++++++++++++++++++++++++++++++
 hw/timer/trace-events                |   3 +
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/timer/bcm2835_systimer.h  |  35 +++++++
 6 files changed, 249 insertions(+)
 create mode 100644 hw/timer/bcm2835_systimer.c
 create mode 100644 include/hw/timer/bcm2835_systimer.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd1..d6c02d0 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -90,6 +90,11 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
     qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
 
+    /* System Timer */
+    object_initialize(&s->systimer, sizeof(s->systimer), TYPE_BCM2835_SYSTIMER);
+    object_property_add_child(obj, "systimer", OBJECT(&s->systimer), NULL);
+    qdev_set_parent_bus(DEVICE(&s->systimer), sysbus_get_default());
+
     /* Extended Mass Media Controller */
     object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
     object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
@@ -254,6 +259,22 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
+    /* System Timer */
+    object_property_set_bool(OBJECT(&s->systimer), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systimer), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systimer), 0,
+            qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                INTERRUPT_TIMER1));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systimer), 1,
+            qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
+                INTERRUPT_TIMER3));
+
     /* Extended Mass Media Controller */
     object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
                             &err);
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 8c19eac..b5bbffc 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -29,6 +29,7 @@ obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
 obj-$(CONFIG_OMAP) += omap_gptimer.o
 obj-$(CONFIG_OMAP) += omap_synctimer.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
+obj-$(CONFIG_RASPI) += bcm2835_systimer.o
 obj-$(CONFIG_SH4) += sh_timer.o
 obj-$(CONFIG_DIGIC) += digic-timer.o
 obj-$(CONFIG_MIPS_CPS) += mips_gictimer.o
diff --git a/hw/timer/bcm2835_systimer.c b/hw/timer/bcm2835_systimer.c
new file mode 100644
index 0000000..449cb51
--- /dev/null
+++ b/hw/timer/bcm2835_systimer.c
@@ -0,0 +1,187 @@
+/*
+ * BCM2835 System Timer
+ *
+ * Copyright (C) 2017 Thomas Venriès <thomas.venries@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "qemu/timer.h"
+#include "trace.h"
+#include "hw/timer/bcm2835_systimer.h"
+
+#define ST_SIZE             0x20
+
+#define ST_CONTROL_STATUS   0x00
+#define ST_COUNTER_LO       0x04
+#define ST_COUNTER_HI       0x08
+#define ST_COMPARE0         0x0C
+#define ST_COMPARE1         0x10
+#define ST_COMPARE2         0x14
+#define ST_COMPARE3         0x18
+
+#define TIMER_M0        (1 << 0)
+#define TIMER_M1        (1 << 1)
+#define TIMER_M2        (1 << 2)
+#define TIMER_M3        (1 << 3)
+#define TIMER_MATCH(n)  (1 << n)
+
+static void bcm2835_systimer_interrupt(void *opaque, unsigned timer)
+{
+    BCM2835SysTimerState *s = (BCM2835SysTimerState *)opaque;
+
+    s->ctrl |= TIMER_MATCH(timer);
+    qemu_irq_raise((timer == 1) ? s->irq[0] : s->irq[1]);
+
+    trace_bcm2835_systimer_interrupt(timer);
+}
+
+static void bcm2835_systimer1_cb(void *opaque)
+{
+    bcm2835_systimer_interrupt(opaque, 1);
+}
+
+static void bcm2835_systimer3_cb(void *opaque)
+{
+    bcm2835_systimer_interrupt(opaque, 3);
+}
+
+static uint64_t bcm2835_systimer_read(void *opaque, hwaddr offset,
+                                   unsigned size)
+{
+    BCM2835SysTimerState *s = (BCM2835SysTimerState *)opaque;
+
+    switch (offset) {
+    case ST_CONTROL_STATUS:
+        return s->ctrl;
+    case ST_COUNTER_LO:
+        return (uint64_t)qemu_clock_get_us(QEMU_CLOCK_VIRTUAL) & 0xffffffff;
+    case ST_COUNTER_HI:
+        return (uint64_t)qemu_clock_get_us(QEMU_CLOCK_VIRTUAL) >> 32;
+    case ST_COMPARE0:
+        return s->cmp0;
+    case ST_COMPARE1:
+        return s->cmp1;
+    case ST_COMPARE2:
+        return s->cmp2;
+    case ST_COMPARE3:
+        return s->cmp3;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_systimer_read: Bad offset - [%x]\n",
+                      (int)offset);
+        return 0;
+    }
+}
+
+static void bcm2835_systimer_write(void *opaque, hwaddr offset,
+                                uint64_t value, unsigned size)
+{
+    BCM2835SysTimerState *s = (BCM2835SysTimerState *)opaque;
+
+    switch (offset) {
+    case ST_CONTROL_STATUS:
+        if ((s->ctrl & TIMER_M1) && (value & TIMER_M1)) {
+            qemu_irq_lower(s->irq[0]);
+            s->ctrl &= ~TIMER_M1;
+        }
+        if ((s->ctrl & TIMER_M3) && (value & TIMER_M3)) {
+            qemu_irq_lower(s->irq[1]);
+            s->ctrl &= ~TIMER_M3;
+        }
+        break;
+    case ST_COMPARE0:
+        s->cmp0 = value;
+        break;
+    case ST_COMPARE1:
+        timer_mod(s->timers[0], value);
+        s->cmp1 = value;
+        break;
+    case ST_COMPARE2:
+        s->cmp2 = value;
+        break;
+    case ST_COMPARE3:
+        timer_mod(s->timers[1], value);
+        s->cmp3 = value;
+        break;
+
+    case ST_COUNTER_LO:
+    case ST_COUNTER_HI:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_systimer_write: Read-only offset %x\n",
+                      (int)offset);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_systimer_write: Bad offset %x\n",
+                      (int)offset);
+    }
+}
+
+static const MemoryRegionOps bcm2835_systimer_ops = {
+    .read = bcm2835_systimer_read,
+    .write = bcm2835_systimer_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_systimer = {
+    .name = TYPE_BCM2835_SYSTIMER,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(ctrl, BCM2835SysTimerState),
+        VMSTATE_UINT32(cmp0, BCM2835SysTimerState),
+        VMSTATE_UINT32(cmp1, BCM2835SysTimerState),
+        VMSTATE_UINT32(cmp2, BCM2835SysTimerState),
+        VMSTATE_UINT32(cmp3, BCM2835SysTimerState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_systimer_init(Object *obj)
+{
+    BCM2835SysTimerState *s = BCM2835_SYSTIMER(obj);
+
+    s->ctrl = 0;
+    s->cmp0 = s->cmp1 = s->cmp2 = s->cmp3 = 0;
+
+    s->timers[0] = timer_new_us(QEMU_CLOCK_VIRTUAL, bcm2835_systimer1_cb, s);
+    s->timers[1] = timer_new_us(QEMU_CLOCK_VIRTUAL, bcm2835_systimer3_cb, s);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_systimer_ops, s,
+                          TYPE_BCM2835_SYSTIMER, ST_SIZE);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq[0]);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq[1]);
+}
+
+static void bcm2835_systimer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "BCM2835 System Timer";
+    dc->vmsd = &vmstate_bcm2835_systimer;
+}
+
+static TypeInfo bcm2835_systimer_info = {
+    .name          = TYPE_BCM2835_SYSTIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835SysTimerState),
+    .class_init    = bcm2835_systimer_class_init,
+    .instance_init = bcm2835_systimer_init,
+};
+
+static void bcm2835_systimer_register_types(void)
+{
+    type_register_static(&bcm2835_systimer_info);
+}
+
+type_init(bcm2835_systimer_register_types)
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 640722b..13c89b4 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -60,3 +60,6 @@ systick_write(uint64_t addr, uint32_t value, unsigned size) "systick write addr
 cmsdk_apb_timer_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB timer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB timer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_reset(void) "CMSDK APB timer: reset"
+
+# hw/timer/bcm2535_systimer.c
+bcm2835_systimer_interrupt(unsigned timer) "timer %u"
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 122b286..70a369a 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -20,6 +20,7 @@
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_rng.h"
+#include "hw/timer/bcm2835_systimer.h"
 #include "hw/misc/bcm2835_mbox.h"
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
@@ -46,6 +47,7 @@ typedef struct BCM2835PeripheralState {
     BCM2835PropertyState property;
     BCM2835RngState rng;
     BCM2835MboxState mboxes;
+    BCM2835SysTimerState systimer;
     SDHCIState sdhci;
     BCM2835SDHostState sdhost;
     BCM2835GpioState gpio;
diff --git a/include/hw/timer/bcm2835_systimer.h b/include/hw/timer/bcm2835_systimer.h
new file mode 100644
index 0000000..4086f23
--- /dev/null
+++ b/include/hw/timer/bcm2835_systimer.h
@@ -0,0 +1,35 @@
+/*
+ * BCM2835 System Timer
+ *
+ * Copyright (C) 2017 Thomas Venriès <thomas.venries@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2835_SYSTIMER_H
+#define BCM2835_SYSTIMER_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_BCM2835_SYSTIMER "bcm2835-systimer"
+#define BCM2835_SYSTIMER(obj) \
+        OBJECT_CHECK(BCM2835SysTimerState, (obj), TYPE_BCM2835_SYSTIMER)
+
+#define AVAILABLE_TIMERS    2
+
+typedef struct {
+    SysBusDevice bus;
+    MemoryRegion iomem;
+
+    QEMUTimer *timers[AVAILABLE_TIMERS];
+    qemu_irq irq[AVAILABLE_TIMERS];
+
+    uint32_t ctrl;
+    uint32_t cmp0;
+    uint32_t cmp1;
+    uint32_t cmp2;
+    uint32_t cmp3;
+} BCM2835SysTimerState;
+
+#endif
-- 
2.7.4


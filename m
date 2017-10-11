Received: by 10.223.197.9 with SMTP id q9csp396954wrf;
        Wed, 11 Oct 2017 02:11:31 -0700 (PDT)
X-Received: by 10.55.200.27 with SMTP id c27mr18420041qkj.115.1507713091064;
        Wed, 11 Oct 2017 02:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507713091; cv=none;
        d=google.com; s=arc-20160816;
        b=pYFpsvyqzmmsFIvyO+E++YawJXZY28w8HNnhlIEtaE5OfvZgK/+wWEbu+inpi91mz/
         Cn6oR8oOM9CggxDj3TVPi9zjzy08BIW+BZRc13k2SGxj8xSOwe1zQUEJ3+Xj1MJVBR3r
         pfPKtr0Zq88V8f40iMPOFRiy3g83exZ4dTWoR1MQNOmdTyULguXSNcA7ONkA/UGnmypn
         MTRM8t8pX1CpJUZSorGXhatBUIYUvVEK7r9yLd4bNziBL/C7NARqcNIvLnpKbLhWXPWR
         8OSROhl7FR1ppoxoYM9EIBGMwdHbUietELubjKgvkK4F0OLFzzt3nMBD+0+BhS2Ny+7e
         iAPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=w79Xi4f437o9hBvUBIwmlE9euq6BU1f2Lyg37qZjqMk=;
        b=z5kyAE0a5PdFI7AvUfV8ODs37ScFliRilEWL8g3bGSSFDAJmlOOX17S26/m7gQkLmT
         hL8b0iBEnp+qZgFNyXaXNUqoCKXPjQaFyokhCfoQeHh3wcLWenH9AWYfp+H10EwsL5OT
         UTiQd/lCDCW1uNDevXDwlCWLDKs/op8VyQJam4Zq2FuPY7o24sAaYXZHgZWzmQMZ3xTf
         C/UYDGZhz56udBXHGpUVZlYUY0qf1RxPupdhnq0I+WrXOLlIFJ7hKTj46A02fTgHoeID
         RVCCxtyuVKzR386egK7B04Bde4m+ESFha47lHCAgiDxyPBOv5tweviGes5c6PcF80qw6
         dURw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S823jEDS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y30si7530530qtd.456.2017.10.11.02.11.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 02:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=S823jEDS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2D32-0000qO-LD
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 05:11:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.venries@gmail.com>) id 1e2D1d-00006e-2Q
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 05:10:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas.venries@gmail.com>) id 1e2D1Z-0004G1-0G
	for qemu-devel@nongnu.org; Wed, 11 Oct 2017 05:10:01 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:36757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <thomas.venries@gmail.com>)
	id 1e2D1Y-0004Es-M0; Wed, 11 Oct 2017 05:09:56 -0400
Received: by mail-wr0-x243.google.com with SMTP id l10so692898wre.3;
	Wed, 11 Oct 2017 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w79Xi4f437o9hBvUBIwmlE9euq6BU1f2Lyg37qZjqMk=;
	b=S823jEDSeyqGkLJyJuuoTb34b9aBLixTT0AUaOyGLZ8Nj8BrpzNSIZn76bdyYstrjS
	wJs2lVSEikU4u06CPHsDHkHDPvUxUQStwnyCYD50MmDaC5T7pOnmjzJLl4qJ69HZ7QzL
	BB93MTDJdS7816Y6+WpFPd9ens7bd6EFa3qVTppfmXzIoNLzS66Et23p/MQ0DNeZU8HS
	E/5Lj2yr/ioCWsE80sWlnlLzBbvrJm1TmLufoDjkLIKwPM1f5Z73K2X8pfXEsI7zsYr8
	6PJxbppwSOaXam3InCjCo7Nbnnfomkfe8YoXjlkdz47jAk+fHd39Zh2HnGxDjqWQbWGM
	LIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w79Xi4f437o9hBvUBIwmlE9euq6BU1f2Lyg37qZjqMk=;
	b=Ag1c4JATvjF3zyuYKRggXH3orQhXK+tLDNhdtG6JZt84vGfEOPNbliEN0icuHRyn7w
	nGub83GMAvk1sMpkDBISBxTlGW2hZyEGG+WezIKRXKnePAtE2E/h+PJkHlkszrY2tw7q
	GTXp6FmM7OOoM3RuVlzAU1/VcgQstO3U95+EaIwZJALty8E9SG0uDyi44ddo+tvoCZeD
	4wNPFvEKImlVM/wtYexPlNaCV5tAwQfpsqD/Rgzj+iltasQuxGlVaS1qLOtwpx2wLu+U
	NWH0U1eacUNZiCeSovOkkT8rEMFbKK7n/DXNFPdhR5nkXFpCPy7jYlaCYAu1kXopRVLI
	5o6A==
X-Gm-Message-State: AMCzsaUrken5yzJS1mKS4T3ynG9GYCQ/7TLjBf9NzYiFapVR/xiRasl4
	kosX7JsqEZEVR/oPORI/iXVd8g==
X-Google-Smtp-Source: AOwi7QAok9zBZ91NpQal/ohmFftgnMirKhssvMFxeL5RmlYqDFM8q5Av30lljU3DFtb/Nj0a7vE2IQ==
X-Received: by 10.223.167.7 with SMTP id c7mr2615920wrd.274.1507712995099;
	Wed, 11 Oct 2017 02:09:55 -0700 (PDT)
Received: from P-ASN-KENPACHI-Thven.dhcp.idf.intranet
	(lns-bzn-39-82-255-32-23.adsl.proxad.net. [82.255.32.23])
	by smtp.gmail.com with ESMTPSA id
	c142sm15855800wmh.39.2017.10.11.02.09.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Oct 2017 02:09:54 -0700 (PDT)
From: =?UTF-8?q?Thomas=20Venri=C3=A8s?= <thomas.venries@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Oct 2017 11:09:40 +0200
Message-Id: <1507712980-12135-1-git-send-email-thomas.venries@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: [Qemu-devel] [PATCH] bcm2835_armtimer: add bcm2835 ARM timer
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
X-TUID: lCTeQKbl1766

The ARM Timer is based on a ARM AP804, but it has
a number of differences with the standard SP804.
There is only one timer which runs in continuous
mode with an extra clock pre-divider register
and a 32-bit free running counter.

The extra stop-in-debug-mode control bit is not
implemented.

Signed-off-by: Thomas Venriès <thomas.venries@gmail.com>
---
 hw/arm/bcm2835_peripherals.c         |  18 +++
 hw/timer/Makefile.objs               |   1 +
 hw/timer/bcm2835_armtimer.c          | 271 +++++++++++++++++++++++++++++++++++
 hw/timer/trace-events                |   4 +
 include/hw/arm/bcm2835_peripherals.h |   2 +
 include/hw/timer/bcm2835_armtimer.h  |  35 +++++
 6 files changed, 331 insertions(+)
 create mode 100644 hw/timer/bcm2835_armtimer.c
 create mode 100644 include/hw/timer/bcm2835_armtimer.h

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 12e0dd1..73deb2e 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -90,6 +90,11 @@ static void bcm2835_peripherals_init(Object *obj)
     object_property_add_child(obj, "rng", OBJECT(&s->rng), NULL);
     qdev_set_parent_bus(DEVICE(&s->rng), sysbus_get_default());
 
+    /* ARM Timer */
+    object_initialize(&s->armtimer, sizeof(s->armtimer), TYPE_BCM2835_ARMTIMER);
+    object_property_add_child(obj, "armtimer", OBJECT(&s->armtimer), NULL);
+    qdev_set_parent_bus(DEVICE(&s->armtimer), sysbus_get_default());
+
     /* Extended Mass Media Controller */
     object_initialize(&s->sdhci, sizeof(s->sdhci), TYPE_SYSBUS_SDHCI);
     object_property_add_child(obj, "sdhci", OBJECT(&s->sdhci), NULL);
@@ -254,6 +259,19 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->peri_mr, RNG_OFFSET,
                 sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->rng), 0));
 
+    /* ARM Timer */
+    object_property_set_bool(OBJECT(&s->armtimer), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, ARMCTRL_TIMER0_1_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->armtimer), 0));
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->armtimer), 0,
+        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
+                               INTERRUPT_ARM_TIMER));
+
     /* Extended Mass Media Controller */
     object_property_set_int(OBJECT(&s->sdhci), BCM2835_SDHC_CAPAREG, "capareg",
                             &err);
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 8c19eac..268d485 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -29,6 +29,7 @@ obj-$(CONFIG_EXYNOS4) += exynos4210_rtc.o
 obj-$(CONFIG_OMAP) += omap_gptimer.o
 obj-$(CONFIG_OMAP) += omap_synctimer.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_timer.o
+obj-$(CONFIG_RASPI) += bcm2835_armtimer.o
 obj-$(CONFIG_SH4) += sh_timer.o
 obj-$(CONFIG_DIGIC) += digic-timer.o
 obj-$(CONFIG_MIPS_CPS) += mips_gictimer.o
diff --git a/hw/timer/bcm2835_armtimer.c b/hw/timer/bcm2835_armtimer.c
new file mode 100644
index 0000000..7ea3162
--- /dev/null
+++ b/hw/timer/bcm2835_armtimer.c
@@ -0,0 +1,271 @@
+/*
+ * BCM2835 ARM Timer
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
+#include "qemu/main-loop.h"
+#include "hw/ptimer.h"
+#include "hw/timer/bcm2835_armtimer.h"
+#include "trace.h"
+
+#define ARM_TIMER_REG_SIZE      0x24
+
+/* Register offsets */
+#define ARM_TIMER_LOAD          0x00
+#define ARM_TIMER_VALUE         0x04
+#define ARM_TIMER_CTRL          0x08
+#define ARM_TIMER_INTCLR        0x0C
+#define ARM_TIMER_RAW_IRQ       0x10
+#define ARM_TIMER_MASK_IRQ      0x14
+#define ARM_TIMER_RELOAD        0x18
+#define ARM_TIMER_PREDIVIDER    0x1C
+#define ARM_TIMER_COUNTER       0x20
+
+/* Control register masks */
+#define CTRL_CNT_PRESCALE       (0xFF << 16)
+#define CTRL_CNT_ENABLE         (1 << 9)
+#define CTRL_TIMER_ENABLE       (1 << 7)
+#define CTRL_INT_ENABLE         (1 << 5)
+#define CTRL_TIMER_PRESCALE     (3 << 2)
+#define CTRL_TIMER_SIZE_32BIT   (1 << 1)
+
+#define CTRL_TIMER_WRAP_MODE    0
+
+/* Register reset values */
+#define CTRL_CNT_PRESCALE_RESET     (0x3E << 16)
+#define ARM_TIMER_CTRL_RESET        (CTRL_CNT_PRESCALE_RESET | CTRL_INT_ENABLE)
+#define ARM_TIMER_IE_READ_VALUE     0x544D5241  /* ASCII "ARMT" */
+/*
+   The system clock refers to a 250 MHz frequency by default.
+   This frequency can be changed by setting `core_freq` the `config.txt` file.
+   APB clock runs at half the speed of the system clock also called ARM clock.
+
+   The ARM timer's predivider register is 10 bits wide and can be written
+   or read from. This register has been added as the SP804 expects a 1MHz clock
+   which they do not have. Instead the predivider takes the APB clock
+   and divides it down according to:
+
+       timer_clock = apb_clock / (prediv + 1)
+
+   The need is a 1MHz timer clock frequency and BCM2835 ARM Peripherals
+   documentation mentions the predivider reset value is 0x7D (or 125), so
+   the APB clock refers to a 126MHz frequency.
+
+   Also the additional free-running counter runs from the APB clock and has
+   its own clock predivider controlled by buts 16-23 of the timer control reg:
+
+       frc_clock = apb_clock / (prediv + 1)
+
+   The predivider reset value is 0x3E (or 62), knowing APB clock frequency,
+   the FRN clock refers to a 2MHz frequency by default.
+*/
+#define ARM_APB_FREQ                126000000UL /* Hz */
+#define ARM_TIMER_PREDIVIDER_RESET  125         /* MHz */
+
+static const uint16_t ctrl_prescale [] = { 1, 16, 256, 1 };
+
+static void bcm2835_armtimer_recalibrate(BCM2835ARMTimerState *s, int reload)
+{
+    uint32_t limit;
+
+    /* ARM Dual-Timer Module SP804, section 3.2.1:
+       If the Load Register is set to 0 then an interrupt is generated
+       immediately. */
+    if (reload == 2) {
+        limit = s->reload;
+    } else {
+        limit = (s->ctrl & CTRL_TIMER_SIZE_32BIT) ? 0xFFFFFFFF : 0XFFFF;
+    }
+
+    ptimer_set_limit(s->timer, limit, reload);
+}
+
+static void bcm2835_armtimer_cb(void *opaque)
+{
+    BCM2835ARMTimerState *s = (BCM2835ARMTimerState *)opaque;
+
+    s->raw_irq = 1;
+
+    if (s->ctrl & CTRL_TIMER_ENABLE) {
+        qemu_irq_raise(s->irq);
+        trace_bcm2835_armtimer_interrupt();
+    }
+}
+
+static uint64_t bcm2835_armtimer_read(void *opaque, hwaddr offset,
+                                      unsigned size)
+{
+    BCM2835ARMTimerState *s = (BCM2835ARMTimerState *)opaque;
+
+    switch (offset) {
+    case ARM_TIMER_LOAD:
+    case ARM_TIMER_RELOAD:
+        return s->reload;
+    case ARM_TIMER_VALUE:
+        return ptimer_get_count(s->timer);
+    case ARM_TIMER_CTRL:
+        return s->ctrl;
+    case ARM_TIMER_INTCLR:
+        return ARM_TIMER_IE_READ_VALUE;
+    case ARM_TIMER_RAW_IRQ:
+        return s->raw_irq;
+    case ARM_TIMER_MASK_IRQ:
+        return (s->raw_irq && (s->ctrl & CTRL_INT_ENABLE));
+    case ARM_TIMER_PREDIVIDER:
+        return s->prediv;
+    case ARM_TIMER_COUNTER:
+        return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / s->prescaler;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_armtimer_read: Bad offset - [%x]\n",
+                      (int)offset);
+        return 0;
+    }
+}
+
+static void bcm2835_armtimer_write(void *opaque, hwaddr offset,
+                                   uint64_t value, unsigned size)
+{
+    BCM2835ARMTimerState *s = (BCM2835ARMTimerState *)opaque;
+    uint32_t div;
+
+    switch (offset) {
+    case ARM_TIMER_LOAD:
+        bcm2835_armtimer_recalibrate(s, 2);
+        break;
+    case ARM_TIMER_CTRL:
+        if (s->ctrl & CTRL_TIMER_ENABLE)
+            ptimer_stop(s->timer);
+
+        s->ctrl = value;
+
+        s->prescaler = (ARM_APB_FREQ /
+                            (((s->ctrl & CTRL_CNT_PRESCALE) >> 16) + 1));
+
+        bcm2835_armtimer_recalibrate(s, s->ctrl & CTRL_TIMER_ENABLE);
+
+        div = ctrl_prescale[((s->ctrl & CTRL_TIMER_PRESCALE) >> 2)]
+                    * s->prediv;
+        ptimer_set_freq(s->timer, ARM_APB_FREQ / div);
+
+        if (s->ctrl & CTRL_TIMER_ENABLE)
+            ptimer_run(s->timer, CTRL_TIMER_WRAP_MODE);
+        break;
+    case ARM_TIMER_INTCLR:
+        qemu_irq_lower(s->irq);
+        s->raw_irq = 0;
+        trace_bcm2835_armtimer_ack();
+        break;
+    case ARM_TIMER_RELOAD:
+        /* In Free-running mode the timer counter wraps around to 32 or 16-bit
+           limit (respectively 0xFFFFFFFF or 0xFFFFF) regardless the Reload
+           and Load Register values, except that when the Load Register is
+           written to directly, the current count immediately resets to the 32
+           or 16-bits limit according to the Control Register bit [1]. */
+        s->reload = value;
+        break;
+    case ARM_TIMER_PREDIVIDER:
+        s->prediv = value + 1;
+        if (s->ctrl & CTRL_TIMER_ENABLE) {
+            ptimer_stop(s->timer);
+            div = ctrl_prescale[((s->ctrl & CTRL_TIMER_PRESCALE) >> 2)]
+                        * s->prediv;
+            ptimer_set_freq(s->timer, ARM_APB_FREQ / div);
+            ptimer_run(s->timer, CTRL_TIMER_WRAP_MODE);
+        }
+        break;
+
+    case ARM_TIMER_VALUE:
+    case ARM_TIMER_RAW_IRQ:
+    case ARM_TIMER_MASK_IRQ:
+    case ARM_TIMER_COUNTER:
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_armtimer_write: Bad offset - [%x]\n",
+                      (int)offset);
+    }
+}
+
+static const MemoryRegionOps bcm2835_armtimer_ops = {
+    .read = bcm2835_armtimer_read,
+    .write = bcm2835_armtimer_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_armtimer = {
+    .name = TYPE_BCM2835_ARMTIMER,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(ctrl, BCM2835ARMTimerState),
+        VMSTATE_UINT32(reload, BCM2835ARMTimerState),
+        VMSTATE_UINT32(raw_irq, BCM2835ARMTimerState),
+        VMSTATE_UINT32(msk_irq, BCM2835ARMTimerState),
+        VMSTATE_UINT32(prediv, BCM2835ARMTimerState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_armtimer_init(Object *obj)
+{
+    BCM2835ARMTimerState *s = BCM2835_ARMTIMER(obj);
+    QEMUBH *bh = qemu_bh_new(bcm2835_armtimer_cb, s);
+
+    s->reload = s->raw_irq = s->msk_irq = 0;
+    s->prediv = ARM_TIMER_PREDIVIDER_RESET;
+
+    /* ARM Dual-Timer Module SP804, section 2.2.6:
+       Timer Control Register Initialization :
+           - the timer counter is disabled, Bit[7]=0
+           - 16-bit counter mode is selected, Bit[1]=0
+           - prescalers are set to divide by 1, Bit[2:3]=0x0
+           - interrupts are cleared but enabled, Bit[5]=1
+           - the Load Register is set to zero
+           - the counter Value is set to 0xFFFFFFFF (useless)
+      BCM2835 ARM Peripherals, section 14.2:
+           - free-running mode is always selected, Bit[6]=0 and Bit[0]=0
+             because periodic and one-shot modes are not supported. */
+    s->ctrl = ARM_TIMER_CTRL_RESET;
+
+    s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_armtimer_ops, s,
+                          TYPE_BCM2835_ARMTIMER, ARM_TIMER_REG_SIZE);
+
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
+}
+
+static void bcm2835_armtimer_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "BCM2835 ARM Timer";
+    dc->vmsd = &vmstate_bcm2835_armtimer;
+}
+
+static TypeInfo bcm2835_armtimer_info = {
+    .name          = TYPE_BCM2835_ARMTIMER,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835ARMTimerState),
+    .class_init    = bcm2835_armtimer_class_init,
+    .instance_init = bcm2835_armtimer_init,
+};
+
+static void bcm2835_armtimer_register_types(void)
+{
+    type_register_static(&bcm2835_armtimer_info);
+}
+
+type_init(bcm2835_armtimer_register_types)
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 640722b..d81dd38 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -60,3 +60,7 @@ systick_write(uint64_t addr, uint32_t value, unsigned size) "systick write addr
 cmsdk_apb_timer_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB timer read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB timer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_timer_reset(void) "CMSDK APB timer: reset"
+
+# hw/timer/bcm2535_armtimer.c
+bcm2835_armtimer_interrupt(void) "irq"
+bcm2835_armtimer_ack(void) "ack"
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 122b286..236433b 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -20,6 +20,7 @@
 #include "hw/intc/bcm2835_ic.h"
 #include "hw/misc/bcm2835_property.h"
 #include "hw/misc/bcm2835_rng.h"
+#include "hw/timer/bcm2835_armtimer.h"
 #include "hw/misc/bcm2835_mbox.h"
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
@@ -43,6 +44,7 @@ typedef struct BCM2835PeripheralState {
     BCM2835FBState fb;
     BCM2835DMAState dma;
     BCM2835ICState ic;
+    BCM2835ARMTimerState armtimer;
     BCM2835PropertyState property;
     BCM2835RngState rng;
     BCM2835MboxState mboxes;
diff --git a/include/hw/timer/bcm2835_armtimer.h b/include/hw/timer/bcm2835_armtimer.h
new file mode 100644
index 0000000..cb69f75
--- /dev/null
+++ b/include/hw/timer/bcm2835_armtimer.h
@@ -0,0 +1,35 @@
+/*
+ * BCM2835 ARM Timer
+ *
+ * Copyright (C) 2017 Thomas Venriès <thomas.venries@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2835_ARMTIMER_H
+#define BCM2835_ARMTIMER_H
+
+#include "hw/ptimer.h"
+#include "hw/sysbus.h"
+
+#define TYPE_BCM2835_ARMTIMER "bcm2835-armtimer"
+#define BCM2835_ARMTIMER(obj) \
+        OBJECT_CHECK(BCM2835ARMTimerState, (obj), TYPE_BCM2835_ARMTIMER)
+
+typedef struct {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+
+    ptimer_state *timer;
+    qemu_irq irq;
+
+    uint32_t ctrl;
+    uint32_t raw_irq;
+    uint32_t msk_irq;
+    uint32_t reload;
+    uint32_t prediv;
+    uint32_t prescaler;
+} BCM2835ARMTimerState;
+
+#endif
-- 
2.7.4


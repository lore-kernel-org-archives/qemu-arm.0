Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp10968171wrx;
        Tue, 26 Feb 2019 03:38:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYnqvSJHGz5jl6rdO9SefwPjFzhDFLSZDvuzzWS0z5JvNAhaFJXaYLVIEw67WGjclfJSIEN
X-Received: by 2002:a81:8c9:: with SMTP id 192mr18076318ywi.288.1551181131715;
        Tue, 26 Feb 2019 03:38:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551181131; cv=none;
        d=google.com; s=arc-20160816;
        b=hWd0dlkzJYG7oXw340urVUSnwGC0ymKd6GdSNq0RqEQCGfEMQtNS1U9ejmVFG+OE6h
         9Ey/5kxl7JZqxhYdd4k6HDHQR6fSaJsFCG1QvzWxL9qdt6eQlzyRGqsZUbZDbGjIYaKt
         VUgiNox9nzVKxlSC16FP7mh5hTMWoTEX75nslLLm16RfzftzW0kqy8sLG+vCQO+1ESvN
         ZmlIQBwpNgz+BSWV2mAw5MXMwOhHqb4m/TLiqZ7O1G+beC7TxUxyOwIH8JrXVoT5cil6
         lJ/WWJa0mD+0mhzic9aP9RBNGOmM1JhNbsv3Y1YG5l1zPeUe1CVA6dULe4eiBTqx1fWN
         pYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:mime-version
         :dkim-signature;
        bh=NMpn3jfE/pyVmvAvvK8RF3fnv0ERX2Va1JVKReeocog=;
        b=xTmCbCV81H1lFj2llYx5uQzbtIvXTW5h9CxOfASaOHHUdmYZ4KQB3JQBqMmmZRlbJa
         ISwOvRGm7jahS/hpZ/Ie2hHp9c3HZJrZLgEXC3jhBXRaeXJi7Ag8a3L+Sng5+IXHc64W
         AbZ7JeP4kl0e7q9rB2yRNidQmvWnttRwnJ2ENdp5OKjEUTw4hti8UFeDUw2Z/tDhP0uE
         1lbpYlbPb3CQxD26rt4kghYUAAkkYtiQCMU3MnEZ0GtRGdL2/2IIwy4U8tNzL4njy2Wd
         Ym1e2KWTnSsWSuZebhp6NyUgQJUDp6UfuTU2FxhQN3/VxCKBNaQRomW7njGSE8qyk/Ci
         Uj9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TZxzmYoc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 193si6709277ybr.89.2019.02.26.03.38.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 03:38:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TZxzmYoc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:53345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyb4V-00047i-71
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 06:38:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1gyb4K-00047a-MZ
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 06:38:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1gyb4J-0006TN-89
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 06:38:40 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:38367)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1gyb4I-0006T3-ST; Tue, 26 Feb 2019 06:38:39 -0500
Received: by mail-lj1-x243.google.com with SMTP id j19so10452831ljg.5;
	Tue, 26 Feb 2019 03:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=NMpn3jfE/pyVmvAvvK8RF3fnv0ERX2Va1JVKReeocog=;
	b=TZxzmYocG14MfF6Yul+ry9KsbnfNnjPE5jZT+65P1eeHX3zn2CQ4TWZASvbIHFNwX0
	R85KL2TqKH4fYfWrS7QemHDuM7ieoqiCIe3WMZbZNIuouWOtLx4PV8XsMRjT82tUI763
	ajwzETK2m+AuJ2saYLqUy7TPkbevFfEiMTC1/h4rvOlA26ow2se2uZ+e5mgPsyj8GVWT
	3OZpuEl4rvBlVG2NnHvyLoZkMsF2hsVuvgp9O2EDehM6IiV9HstMn+yA1y69RzoAsO+o
	2AVCb42hmecK4+8yECYzicq4FgGbToa7x0+JQh/RocO0bbtKmgKvPcQ5Z/6tzcoqVdQK
	1JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=NMpn3jfE/pyVmvAvvK8RF3fnv0ERX2Va1JVKReeocog=;
	b=in9Tg7hcOXrSbNamvJHrm5Arbml7/l3wJ47/p2PbJzYmd0Y/BKhmkXiMHZPZsQMyyh
	nlwdKdnBVJlH1Fpg2gokDNetGYT7HFwYevwD7Ego/6xQr8nh1ic57pp2YNtyDvw/a6DX
	DR76U/fXxmsCQf043iGpvA/zp0ZpI6OBMmO7IVbDXRZnIL2Nf1UfQ2EVUa/LSwAXaoIp
	IGsGh3kOys0610C37FXlsezEd1mkQvCtT17XVJDZD/5uinHFa5+g7S82kRGr2gbi5bLo
	2PpdKm7VvFV8a1TbfM0egr0Ezp82iHUJ/12XTgOuIvNKlAhweHoO/3u5RWIKvAn2f3FB
	RRUQ==
X-Gm-Message-State: AHQUAuYLjznk1Nw/kxV4YbqsdccaHqRCXhL8WxDxUOL+PIUjv/YwMgLC
	Gn/UPT3jfUzA9mBxU+7+GIzk5+RUUrv/+ogMtpA=
X-Received: by 2002:a2e:9dd2:: with SMTP id x18mr14273945ljj.109.1551181117262;
	Tue, 26 Feb 2019 03:38:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:8554:0:0:0:0:0 with HTTP; Tue, 26 Feb 2019 03:38:36
	-0800 (PST)
From: bzt <bztemail@gmail.com>
Date: Tue, 26 Feb 2019 12:38:36 +0100
Message-ID: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: [Qemu-arm] [PATCH] Added periodic IRQ support for bcm2836_control
 local timer
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 77YgGvd6jfxk

Dear qemu developers,

Honestly SubmitAPatch is a bit complicated for me, so I'm hoping I've
done everything right. To be sure, you can find my patch here:
https://github.com/bztsrc/qemu-local-timer and diff against the latest
github repo here:
https://github.com/bztsrc/qemu-local-timer/blob/patches/3.1.50.diff

Currently the IRQ_TIMER in bcm2836_control is defined, but not
implemented. This patch adds the basic functionality to qemu by
implementing 3 new registers in bcm2836_control. You can route the
interrupt to one of the cores' IRQ or FIQ line by writing 0x40000024,
and you can set up a periodic interrupt with 38.4MHz frequency by
writing the divider into 0x40000034. Prescaler are not taken into
account. When the IRQ fired, you'll see it in 0x40000040+4*N bit 11
with the rest of the local IRQs, and you can acknowledge it by writing
1<<31 to 0x40000038.

The patch is pretty simple, should be easy to review: it does not
create new classes, does not delete anything, does not change class
interface, and only two files modified, the bcm2836_control.c and it's
header.

Sign-off-by: Zolt=C3=A1n Baldaszti <bztemail@gmail.com>
Subject: [PATCH] Added periodic IRQ support for bcm2836_control local timer

diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
index cfa5bc7365..fbd31de0f1 100644
--- a/hw/intc/bcm2836_control.c
+++ b/hw/intc/bcm2836_control.c
@@ -7,7 +7,11 @@
  * This code is licensed under the GNU GPLv2 and later.
  *
  * At present, only implements interrupt routing, and mailboxes (i.e.,
- * not local timer, PMU interrupt, or AXI counters).
+ * not PMU interrupt, or AXI counters).
+ *
+ * 64-bit ARM Local Timer Copyright (c) 2019. Zolt=C3=A1n Baldaszti
+ * The IRQ_TIMER support is still very basic, does not handle timer access=
,
+ * and such there's no point in enabling it without the interrupt flag set=
.
  *
  * Ref:
  * https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/=
QA7_rev3.4.pdf
@@ -18,6 +22,9 @@
 #include "qemu/log.h"

 #define REG_GPU_ROUTE           0x0c
+#define REG_LOCALTIMERROUTING   0x24
+#define REG_LOCALTIMERCONTROL   0x34
+#define REG_LOCALTIMERACK       0x38
 #define REG_TIMERCONTROL        0x40
 #define REG_MBOXCONTROL         0x50
 #define REG_IRQSRC              0x60
@@ -43,6 +50,13 @@
 #define IRQ_TIMER       11
 #define IRQ_MAX         IRQ_TIMER

+#define LOCALTIMER_FREQ      38400000
+#define LOCALTIMER_INTFLAG   (1 << 31)
+#define LOCALTIMER_RELOAD    (1 << 30)
+#define LOCALTIMER_INTENABLE (1 << 29)
+#define LOCALTIMER_ENABLE    (1 << 28)
+#define LOCALTIMER_VALUE(x)  ((x) & 0xfffffff)
+
 static void deliver_local(BCM2836ControlState *s, uint8_t core, uint8_t ir=
q,
                           uint32_t controlreg, uint8_t controlidx)
 {
@@ -78,6 +92,15 @@ static void bcm2836_control_update(BCM2836ControlState *=
s)
         s->fiqsrc[s->route_gpu_fiq] |=3D (uint32_t)1 << IRQ_GPU;
     }

+    /* handle THE local timer interrupt for one of the cores' IRQ/FIQ */
+    if (s->triggered) {
+        if (s->route_localtimer & 4) {
+            s->fiqsrc[(s->route_localtimer & 3)] |=3D (uint32_t)1 << IRQ_T=
IMER;
+        } else {
+            s->irqsrc[(s->route_localtimer & 3)] |=3D (uint32_t)1 << IRQ_T=
IMER;
+        }
+    }
+
     for (i =3D 0; i < BCM2836_NCORES; i++) {
         /* handle local timer interrupts for this core */
         if (s->timerirqs[i]) {
@@ -162,6 +185,62 @@ static void bcm2836_control_set_gpu_fiq(void
*opaque, int irq, int level)
     bcm2836_control_update(s);
 }

+static void bcm2836_control_local_timer_set_next(void *opaque)
+{
+    BCM2836ControlState *s =3D opaque;
+    uint64_t next_event;
+
+    assert(s->period > 0);
+
+    next_event =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+        (NANOSECONDS_PER_SECOND * s->period / LOCALTIMER_FREQ);
+    timer_mod(s->timer, next_event);
+}
+
+static void bcm2836_control_local_timer_tick(void *opaque)
+{
+    BCM2836ControlState *s =3D opaque;
+
+    bcm2836_control_local_timer_set_next(s);
+
+    if (!s->triggered) {
+        s->triggered =3D 1;
+        bcm2836_control_update(s);
+    }
+}
+
+static void bcm2836_control_local_timer_control(void *opaque, uint32_t val=
)
+{
+    BCM2836ControlState *s =3D opaque;
+
+    s->period =3D LOCALTIMER_VALUE(val);
+    if (val & LOCALTIMER_INTENABLE) {
+        if (!s->timer) {
+            s->timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
+                bcm2836_control_local_timer_tick, s);
+        }
+        bcm2836_control_local_timer_set_next(s);
+    } else {
+        if (s->timer) {
+            timer_del(s->timer);
+            s->timer =3D NULL;
+        }
+        s->triggered =3D 0;
+    }
+}
+
+static void bcm2836_control_local_timer_ack(void *opaque, uint32_t val)
+{
+    BCM2836ControlState *s =3D opaque;
+
+    if (val & LOCALTIMER_INTFLAG) {
+        s->triggered =3D 0;
+    }
+    if (val & LOCALTIMER_RELOAD) {
+        bcm2836_control_local_timer_set_next(s);
+    }
+}
+
 static uint64_t bcm2836_control_read(void *opaque, hwaddr offset,
unsigned size)
 {
     BCM2836ControlState *s =3D opaque;
@@ -170,6 +249,14 @@ static uint64_t bcm2836_control_read(void
*opaque, hwaddr offset, unsigned size)
         assert(s->route_gpu_fiq < BCM2836_NCORES
                && s->route_gpu_irq < BCM2836_NCORES);
         return ((uint32_t)s->route_gpu_fiq << 2) | s->route_gpu_irq;
+    } else if (offset =3D=3D REG_LOCALTIMERROUTING) {
+        return s->route_localtimer;
+    } else if (offset =3D=3D REG_LOCALTIMERCONTROL) {
+        return s->period |
+            (s->timer ? LOCALTIMER_ENABLE | LOCALTIMER_INTENABLE : 0) |
+            (s->triggered ? LOCALTIMER_INTFLAG : 0);
+    } else if (offset =3D=3D REG_LOCALTIMERACK) {
+        return 0;
     } else if (offset >=3D REG_TIMERCONTROL && offset < REG_MBOXCONTROL) {
         return s->timercontrol[(offset - REG_TIMERCONTROL) >> 2];
     } else if (offset >=3D REG_MBOXCONTROL && offset < REG_IRQSRC) {
@@ -195,6 +282,12 @@ static void bcm2836_control_write(void *opaque,
hwaddr offset,
     if (offset =3D=3D REG_GPU_ROUTE) {
         s->route_gpu_irq =3D val & 0x3;
         s->route_gpu_fiq =3D (val >> 2) & 0x3;
+    } else if (offset =3D=3D REG_LOCALTIMERROUTING) {
+        s->route_localtimer =3D val & 7;
+    } else if (offset =3D=3D REG_LOCALTIMERCONTROL) {
+        bcm2836_control_local_timer_control(s, val);
+    } else if (offset =3D=3D REG_LOCALTIMERACK) {
+        bcm2836_control_local_timer_ack(s, val);
     } else if (offset >=3D REG_TIMERCONTROL && offset < REG_MBOXCONTROL) {
         s->timercontrol[(offset - REG_TIMERCONTROL) >> 2] =3D val & 0xff;
     } else if (offset >=3D REG_MBOXCONTROL && offset < REG_IRQSRC) {
@@ -227,6 +320,13 @@ static void bcm2836_control_reset(DeviceState *d)

     s->route_gpu_irq =3D s->route_gpu_fiq =3D 0;

+    s->route_localtimer =3D s->triggered =3D 0;
+    s->period =3D 0;
+    if(s->timer) {
+        timer_del(s->timer);
+        s->timer =3D NULL;
+    }
+
     for (i =3D 0; i < BCM2836_NCORES; i++) {
         s->timercontrol[i] =3D 0;
         s->mailboxcontrol[i] =3D 0;
diff --git a/include/hw/intc/bcm2836_control.h
b/include/hw/intc/bcm2836_control.h
index 613f3c4186..873bd52253 100644
--- a/include/hw/intc/bcm2836_control.h
+++ b/include/hw/intc/bcm2836_control.h
@@ -5,6 +5,9 @@
  * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
+ * 64-bit ARM Local Timer Copyright (c) 2019. Zolt=C3=A1n Baldaszti
+ * Added basic IRQ_TIMER interrupt support
+ *
  * This code is licensed under the GNU GPLv2 and later.
  */

@@ -12,6 +15,7 @@
 #define BCM2836_CONTROL_H

 #include "hw/sysbus.h"
+#include "qemu/timer.h"

 /* 4 mailboxes per core, for 16 total */
 #define BCM2836_NCORES 4
@@ -39,6 +43,12 @@ typedef struct BCM2836ControlState {
     bool gpu_irq, gpu_fiq;
     uint8_t timerirqs[BCM2836_NCORES];

+    /* local timer */
+    uint8_t route_localtimer;
+    uint32_t period;
+    bool triggered;
+    QEMUTimer *timer;
+
     /* interrupt source registers, post-routing (also input-derived;
visible) */
     uint32_t irqsrc[BCM2836_NCORES];
     uint32_t fiqsrc[BCM2836_NCORES];

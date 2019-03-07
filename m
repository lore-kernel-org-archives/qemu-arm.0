Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7301331wrx;
        Thu, 7 Mar 2019 07:58:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxT+f33GkdSaMIJLo6JS80MxoskwSzj4CvAHfarTiEBP2Bs31FVVlAeaUjzJPYIRlDwpstX
X-Received: by 2002:a25:ba87:: with SMTP id s7mr12169514ybg.49.1551974293407;
        Thu, 07 Mar 2019 07:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551974293; cv=none;
        d=google.com; s=arc-20160816;
        b=EyWq8h04sYYrLCoJrLS+Ii9+ytrlBlCe0gKX/oW8XcZ1IciKZoyhA1XKJEXpoy4Gir
         DGZ/Jxv+OYKoOu87nXuZpS4CdqWeRbX58UbQpphKtk4JY7fKpevQvpgYzQCsHMt1TDXQ
         yzHPqB3hmafR6uwdi/NpvF9y7F2VTWuK7LKbkwbJRAo8Mhe8IGziLTZpWEVvoQ+shlBa
         Dnc27uEi9I7ffWP15WB5IJGXMknPKWm2YNcY8tWndZC/JbkpuivP4rOicZoF9oihX9yW
         CcbfuADxBDht6WQVjLR3NKXdmnm72/ma0m2cG+ZgeTLFxJPGJcbnMRAN60mlsJQmFtjT
         xgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=LkQHDH4Sl0IznM+pvfc0ceGRXVpmEVF88k+aJQ34Nww=;
        b=penp39PEbog2HrriCmfh07Vu7kbs9VuWzsv1/vavpkmYa9qr6Oz0uGGE6DugiwgZXu
         dCCI4ehgJLwRimzwQyeY+c33XhGombpV1U44M5FgDmgs3+q3XwZAvtxYGabvRf+F/EgY
         q364u7PoL2/NRNChpByR5csgT4//5jjZf36djjdfd+TPgnXnOJbEowlEuoT8YaCVJF+w
         eaQlRN1r/uhAfrXgGH+/hm2gK8B2prenzCwXJ9fCS+Q8goSzCQzct0hEAzTfK0QK8cJv
         NyhMjVbvWueDD2vrlrXM9h6Z0/tvlgHWx6P4SFVIawlMgErlYI9ABqLA8sOJ+kTiiLRh
         Chyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qUx8DaDN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c203si2842898ybc.271.2019.03.07.07.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 07:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qUx8DaDN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:54369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1vPQ-0005Pc-PL
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 10:58:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1h1vOY-0005MY-PT
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 10:57:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1h1vOW-0007Ca-TE
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 10:57:18 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:45049)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1h1vON-00074f-44; Thu, 07 Mar 2019 10:57:09 -0500
Received: by mail-lj1-x241.google.com with SMTP id q128so14653432ljb.11;
	Thu, 07 Mar 2019 07:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LkQHDH4Sl0IznM+pvfc0ceGRXVpmEVF88k+aJQ34Nww=;
	b=qUx8DaDNTlKHmNk/gbOgNcjBNF2R4NxLZvovYMpEpj6OHEE4yg7qN+gow9UjwXktom
	mttpVUGJlSSFIi1litUAhn9G7tTSqE8smnW7Q7lrug5lKR4m1K3PcmxnowLaPyDHhCUX
	OyH9SgW/mh3l/Pqd0rN1FTdL1WbQbf73eOyC+9qwZwH6pam47n2Lmb2oqE7R9gOLDU6k
	mb6dhQt3LnKbxTOF+iRQZL2qLBjdaCne/Ckk3TmO7lCva2geDB6w7LP5qbBhdVREFuYB
	UaykcWJMSeB93dlgYxqTFtzFiBU8wmLiTiFMhJrf54O/xBl+VVW979N0qC1E6K4AGvXx
	Lf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LkQHDH4Sl0IznM+pvfc0ceGRXVpmEVF88k+aJQ34Nww=;
	b=Mdclxk8E3IVZ+dEVS6Ta7FGMPBiVpbcwgVZHUHR870dqG0cyhQ7BLL2pywzHu/Fg3M
	KqTI6YPyW0/5EZQu/oaNvzgD4fgee+ev7Pp8q6b3IMnW84/zC7Wuiyfzde7dRRjH3FNk
	JkNBNJEQDOyeV6fhOO2NNrAHVSs4lF8nvexKgHKYDq8y//ceeEuzPhGdPzwkxzuc6IHM
	i3niwhCysiujTx0BCfZcufXdwN2QAKJ93CiIo7ch0CjcViOhLQoHtGqjCql8LwiVV6+4
	4vxcD6KFjbzOnp9WmNRoJTsVCww7zQhG22F0YzYTBaYMmt0pnOw/Ev4dCqk10hWsOywE
	Fb3g==
X-Gm-Message-State: APjAAAW1t4k0w/FBC/bGUvtDo8lczqlyNxMssHmLwTki2aSTYhvKas1/
	M4/exsecy8fJ42A7dvWW+prZu9U1n7BNn4p1o1I=
X-Received: by 2002:a2e:9355:: with SMTP id m21mr6195960ljh.172.1551974224495; 
	Thu, 07 Mar 2019 07:57:04 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:8554:0:0:0:0:0 with HTTP;
	Thu, 7 Mar 2019 07:57:03 -0800 (PST)
In-Reply-To: <CAFEAcA9Ycm43h8ekoc1uP_K7eLT98Qg+EFqE3Lvu66cjU5c5_A@mail.gmail.com>
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9UzFdyAFkAuWzcV5x1JDBCTVr=okdLN-MpiduvACt4tw@mail.gmail.com>
	<CADYoBw3yj9yuxUSFuwCqKbTZNFFDF7Je4Kgxt-Rvd71x3JusQA@mail.gmail.com>
	<CAFEAcA_N83yo8xV3hCpVPFOhQj+R95+8fVePjEXgxKZtQPUP3w@mail.gmail.com>
	<CADYoBw00Li2G4srfLvtG4pvBMfyEuDh0AU47wj5BcKOUkfWhKw@mail.gmail.com>
	<CAFEAcA9Ycm43h8ekoc1uP_K7eLT98Qg+EFqE3Lvu66cjU5c5_A@mail.gmail.com>
From: bzt <bztemail@gmail.com>
Date: Thu, 7 Mar 2019 16:57:03 +0100
Message-ID: <CADYoBw1QFQxicJJ9tQa2Ok7PAdWvgtD4MQncdJ0zi4E2vktVhQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-devel] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zhSekQ0wq5T4

Nope. I meant the second patch, sent on 4th Mar, which had all the
things fixed you listed in your review.

But here's the modification for your latest query. This one controls
the timer depending on ENABLE bit. It sets the INTFLAG even if
INTENABLE is not set, and only raises the IRQ if both are set.

Sign-off-by: Zolt=C3=A1n Baldaszti <bztemail@gmail.com>
Subject: [PATCH] Added periodic IRQ support for bcm2836_control local timer
diff --git a/hw/intc/bcm2836_control.c b/hw/intc/bcm2836_control.c
index cfa5bc7365..d75dedbf20 100644
--- a/hw/intc/bcm2836_control.c
+++ b/hw/intc/bcm2836_control.c
@@ -7,7 +7,13 @@
  * This code is licensed under the GNU GPLv2 and later.
  *
  * At present, only implements interrupt routing, and mailboxes (i.e.,
- * not local timer, PMU interrupt, or AXI counters).
+ * not PMU interrupt, or AXI counters).
+ *
+ * ARM Local Timer IRQ Copyright (c) 2019. Zolt=C3=A1n Baldaszti
+ * The IRQ_TIMER support is still very basic, does not provide timer count=
er
+ * access and other timer features, it just generates periodic IRQs. But i=
t
+ * still requires not only the interrupt enable, but the timer enable bit =
to
+ * be set.
  *
  * Ref:
  * https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/=
QA7_rev3.4.pdf
@@ -18,6 +24,9 @@
 #include "qemu/log.h"

 #define REG_GPU_ROUTE           0x0c
+#define REG_LOCALTIMERROUTING   0x24
+#define REG_LOCALTIMERCONTROL   0x34
+#define REG_LOCALTIMERACK       0x38
 #define REG_TIMERCONTROL        0x40
 #define REG_MBOXCONTROL         0x50
 #define REG_IRQSRC              0x60
@@ -43,6 +52,13 @@
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
@@ -78,6 +94,17 @@ static void bcm2836_control_update(BCM2836ControlState *=
s)
         s->fiqsrc[s->route_gpu_fiq] |=3D (uint32_t)1 << IRQ_GPU;
     }

+    /* handle THE local timer interrupt for one of the cores' IRQ/FIQ */
+    if ((s->local_timer_control & LOCALTIMER_INTENABLE) &&
+        (s->local_timer_control & LOCALTIMER_INTFLAG)) {
+        if (s->route_localtimer & 4) {
+            s->fiqsrc[(s->route_localtimer & 3)] |=3D (uint32_t)1 << IRQ_T=
IMER;
+        } else {
+            s->irqsrc[(s->route_localtimer & 3)] |=3D (uint32_t)1 << IRQ_T=
IMER;
+        }
+        s->local_timer_control &=3D ~LOCALTIMER_INTENABLE;
+    }
+
     for (i =3D 0; i < BCM2836_NCORES; i++) {
         /* handle local timer interrupts for this core */
         if (s->timerirqs[i]) {
@@ -162,6 +189,55 @@ static void bcm2836_control_set_gpu_fiq(void
*opaque, int irq, int level)
     bcm2836_control_update(s);
 }

+static void bcm2836_control_local_timer_set_next(void *opaque)
+{
+    BCM2836ControlState *s =3D opaque;
+    uint64_t next_event;
+
+    assert(LOCALTIMER_VALUE(s->local_timer_control) > 0);
+
+    next_event =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
+        muldiv64(LOCALTIMER_VALUE(s->local_timer_control),
+            NANOSECONDS_PER_SECOND, LOCALTIMER_FREQ);
+    timer_mod(&s->timer, next_event);
+}
+
+static void bcm2836_control_local_timer_tick(void *opaque)
+{
+    BCM2836ControlState *s =3D opaque;
+
+    bcm2836_control_local_timer_set_next(s);
+
+    s->local_timer_control |=3D LOCALTIMER_INTFLAG;
+    bcm2836_control_update(s);
+}
+
+static void bcm2836_control_local_timer_control(void *opaque, uint32_t val=
)
+{
+    BCM2836ControlState *s =3D opaque;
+
+    s->local_timer_control =3D val & ~LOCALTIMER_INTFLAG;
+    if (val & LOCALTIMER_ENABLE) {
+        bcm2836_control_local_timer_set_next(s);
+    } else {
+        timer_del(&s->timer);
+    }
+}
+
+static void bcm2836_control_local_timer_ack(void *opaque, uint32_t val)
+{
+    BCM2836ControlState *s =3D opaque;
+
+    if (val & LOCALTIMER_INTFLAG) {
+        s->local_timer_control |=3D LOCALTIMER_INTENABLE;
+        s->local_timer_control &=3D ~LOCALTIMER_INTFLAG;
+    }
+    if ((val & LOCALTIMER_RELOAD) &&
+        (s->local_timer_control & LOCALTIMER_ENABLE)) {
+            bcm2836_control_local_timer_set_next(s);
+    }
+}
+
 static uint64_t bcm2836_control_read(void *opaque, hwaddr offset,
unsigned size)
 {
     BCM2836ControlState *s =3D opaque;
@@ -170,6 +246,12 @@ static uint64_t bcm2836_control_read(void
*opaque, hwaddr offset, unsigned size)
         assert(s->route_gpu_fiq < BCM2836_NCORES
                && s->route_gpu_irq < BCM2836_NCORES);
         return ((uint32_t)s->route_gpu_fiq << 2) | s->route_gpu_irq;
+    } else if (offset =3D=3D REG_LOCALTIMERROUTING) {
+        return s->route_localtimer;
+    } else if (offset =3D=3D REG_LOCALTIMERCONTROL) {
+        return s->local_timer_control;
+    } else if (offset =3D=3D REG_LOCALTIMERACK) {
+        return 0;
     } else if (offset >=3D REG_TIMERCONTROL && offset < REG_MBOXCONTROL) {
         return s->timercontrol[(offset - REG_TIMERCONTROL) >> 2];
     } else if (offset >=3D REG_MBOXCONTROL && offset < REG_IRQSRC) {
@@ -195,6 +277,12 @@ static void bcm2836_control_write(void *opaque,
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
@@ -227,6 +315,10 @@ static void bcm2836_control_reset(DeviceState *d)

     s->route_gpu_irq =3D s->route_gpu_fiq =3D 0;

+    timer_del(&s->timer);
+    s->route_localtimer =3D 0;
+    s->local_timer_control =3D 0;
+
     for (i =3D 0; i < BCM2836_NCORES; i++) {
         s->timercontrol[i] =3D 0;
         s->mailboxcontrol[i] =3D 0;
@@ -263,11 +355,14 @@ static void bcm2836_control_init(Object *obj)
     /* outputs to CPU cores */
     qdev_init_gpio_out_named(dev, s->irq, "irq", BCM2836_NCORES);
     qdev_init_gpio_out_named(dev, s->fiq, "fiq", BCM2836_NCORES);
+
+    /* create a qemu virtual timer */
+    timer_init_ns(&s->timer, QEMU_CLOCK_VIRTUAL,
bcm2836_control_local_timer_tick, s);
 }

 static const VMStateDescription vmstate_bcm2836_control =3D {
     .name =3D TYPE_BCM2836_CONTROL,
-    .version_id =3D 1,
+    .version_id =3D 2,
     .minimum_version_id =3D 1,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(mailboxes, BCM2836ControlState,
@@ -277,6 +372,9 @@ static const VMStateDescription vmstate_bcm2836_control=
 =3D {
         VMSTATE_UINT32_ARRAY(timercontrol, BCM2836ControlState,
BCM2836_NCORES),
         VMSTATE_UINT32_ARRAY(mailboxcontrol, BCM2836ControlState,
                              BCM2836_NCORES),
+        VMSTATE_TIMER_V(timer, BCM2836ControlState, 2),
+        VMSTATE_UINT32_V(local_timer_control, BCM2836ControlState, 2),
+        VMSTATE_UINT8_V(route_localtimer, BCM2836ControlState, 2),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/include/hw/intc/bcm2836_control.h
b/include/hw/intc/bcm2836_control.h
index 613f3c4186..de061b8929 100644
--- a/include/hw/intc/bcm2836_control.h
+++ b/include/hw/intc/bcm2836_control.h
@@ -5,6 +5,9 @@
  * Rasperry Pi 2 emulation and refactoring Copyright (c) 2015, Microsoft
  * Written by Andrew Baumann
  *
+ * ARM Local Timer IRQ Copyright (c) 2019. Zolt=C3=A1n Baldaszti
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
@@ -39,6 +43,11 @@ typedef struct BCM2836ControlState {
     bool gpu_irq, gpu_fiq;
     uint8_t timerirqs[BCM2836_NCORES];

+    /* local timer */
+    QEMUTimer timer;
+    uint32_t local_timer_control;
+    uint8_t route_localtimer;
+
     /* interrupt source registers, post-routing (also input-derived;
visible) */
     uint32_t irqsrc[BCM2836_NCORES];
     uint32_t fiqsrc[BCM2836_NCORES];


On 3/7/19, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Thu, 7 Mar 2019 at 15:27, bzt <bztemail@gmail.com> wrote:
>> Yes, could be. The QA7 spec is not really detailed, and calling both
>> timers simply ARM timers can be misleading. But it's not relevant
>> anyway from the IRQ's point of view. My latest patch checks both bits
>> to be set to generate the IRQ, so it does not really matter. As I've
>> said, this patch adds only the periodic IRQ, and not a full timer
>> emulation.
>>
>> Do you want any modifications on the patch? If so, what exactly? Let
>> me know and I'll update it.
>
> I assume by "latest patch" you mean a planned v3
> that you haven't sent yet?
>
> I think it's probably best to go with my interpretation of
> the specs, if you think it makes sense:
>  * running and stopping the timer is controlled by the
>    "timer enable" bit (and doesn't care about the
>    "interrupt enable" bit)
>  * the timer timing out always sets the "interrupt flag" bit
>  * we set the destination core IRQ/FIQ if the "interrupt flag"
>    and "interrupt enable" bits are both set (we don't care
>    about whether the "timer enable" bit is set for this)
>
> That should be only very minor changes from what you have now.
>
> thanks
> -- PMM
>

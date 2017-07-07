Received: by 10.25.44.15 with SMTP id s15csp2981319lfs;
        Fri, 7 Jul 2017 00:00:33 -0700 (PDT)
X-Received: by 10.200.40.207 with SMTP id j15mr70277574qtj.186.1499410833287;
        Fri, 07 Jul 2017 00:00:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499410833; cv=none;
        d=google.com; s=arc-20160816;
        b=CX9VWwMaJETpmJQVlRmJtcxHwbfb+QY1YwyFCk7qWx/pYnedRL/ZIoshz0+Ab5CDjj
         pjluwm4t1YVvckWg84tFmuIMBwOnA5fvfA9os8vfh0kaYacallibYoHBQrOkXvZVZITc
         ATYPfXIMPY5PkSWqPxwTJ1tn6HiE1WSK9yGUOUu5zeq1SVB8f4moSY+PXc83ThyOP3R0
         lf/MhzsmUY/+EGJSaTfZuwNvJNEwrDpqyvjbWZ6/9q6lnQ0tQEmil6/w9JvlkRVj/kN3
         +N0ngVP85gbwml/eC1cHn8mQpJ42ttzZlCHV6EyKin2AsQYhzbqDen3y+HDZHTdZa3Kw
         tU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fZYltJkyHjohQ0aO8fNgROvkg3D7VUjHbGJDu4xgQG4=;
        b=iYYxZ+ujLa0Auyd5KRFvCShL3i/kuHXHv15ZDAJc979y0QIoqeyXfoGajysjFnhh1z
         d5mw1gr94WBkRj0xOvDGarvOYAFvtY+LnIWxTgMvqqT+FqZuEjSSkOGKBOnQHHyUsve0
         X+r0Iw4zADqIvEKSG0m+T+dojzK8itTVvpenELbpln3Bko0klQ3eF4o+Y6oXWKz6mG79
         NibJ00SSQlUtBDV/WxuOyX2C3NEUWy3WezAYdpDZPxiTFJMmx6bMeOy7YhcfiWmCXwF+
         xsP6pgvXd9Rcd0LhaNpJKID5WSV8lErxP2uylcn+r9x7PEyt6PhLIqRAgStZt6buU6VX
         TfLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=RnKXJdRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r2si2491272qkb.172.2017.07.07.00.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 00:00:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=RnKXJdRK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTNFe-0004tX-C1
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 03:00:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dTNFP-0004n8-NX
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 03:00:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dTNFN-0001Tz-SN
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 03:00:15 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:33265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dTNFD-0001LW-PD; Fri, 07 Jul 2017 03:00:03 -0400
Received: by mail-yb0-x244.google.com with SMTP id 84so1036693ybe.0;
	Fri, 07 Jul 2017 00:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fZYltJkyHjohQ0aO8fNgROvkg3D7VUjHbGJDu4xgQG4=;
	b=RnKXJdRK40qA7qjnOGlDDnLdx+goNcdLZcVqWDx+DqGxHy/K1Oo6vo+WPQmfeQNeN7
	WPlcbd293HS+Fi0P8SBHaKhRcFkLGAqscH7qtZJrCrs3HuHz1wIS/dFgInWxqtFEIdT1
	hT5ZCapLsu4CpU7DcawdoLzWgP7l4kuwM4gawaiLmC92RsZH623b+qqnvW1qPj+XHp+f
	ZjT1FjgU37OCmcfpzG74guDLD8d8kfzidrqDIsQdMJpGnfIXBukcRM+PDpsxiIP7/AAV
	OMui8N3o4akJz8OOHBB2GbNqPuStux61eALfUV8MD89ZIyL09qqxYYmYdPEhq1WXpA1Q
	6ssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fZYltJkyHjohQ0aO8fNgROvkg3D7VUjHbGJDu4xgQG4=;
	b=DPx0mWW3YrxJASNwN+G5JRXciLu3g5uRVezNWnVoxEEx1Is+OmPeN7so14aXEn07sz
	loaHb4msf8HbnuMrnDJP1xskon7YT4hqmx4ulqpXhOWFDG93RGYj811JVkRTf1ZPk71L
	wtFOG8e+wH9NxmuKPntHSpiD9UuHHbvcruByZRdgy+2y0qp9WfdxT1uD9Iyxr7Q7UHtN
	y3A75g3+g8v8ftyoup9CbJ7vxUIp0P4MbJe/59qpeydILrRLScKQfShpO0lfxyjHmgI7
	8ohqj9IGCFekdW1n/TQsGsuhi3ja4aURPWVD8lRAtGJVEJci1dcbVUw803JVYT238cWr
	L57g==
X-Gm-Message-State: AIVw111aYrb1k7XvLEmfdINECQRC70NThD71N23Qy1m3/zlUk8NGD/W/
	M8wg16sqjogVvTmFvWrA4JDKXKIr4g==
X-Received: by 10.37.58.69 with SMTP id h66mr2587374yba.169.1499410803004;
	Fri, 07 Jul 2017 00:00:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.233.5 with HTTP; Fri, 7 Jul 2017 00:00:02 -0700 (PDT)
In-Reply-To: <CAKmqyKORLF24EYEhLMeMqZ7znqVULixQ36OyLZO6V0R_E1gEEQ@mail.gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
	<1499057115-6773-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKOyaJQKOmGK=+jgUOJ5vKeUXJH2OEQmxU-qsD8ftC-25Q@mail.gmail.com>
	<CAKmqyKORLF24EYEhLMeMqZ7znqVULixQ36OyLZO6V0R_E1gEEQ@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 7 Jul 2017 12:30:02 +0530
Message-ID: <CALHRZuohwf6fNp6a5aACTnaWUeFK8PnjebcFvAk0P2a5v1foHQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="001a114bb028491d180553b4c84e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-arm] [Qemu devel v6 PATCH 1/5] msf2: Add Smartfusion2
 System timer
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PaWEgQVDssZd

--001a114bb028491d180553b4c84e
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

On Wed, Jul 5, 2017 at 11:28 PM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Wed, Jul 5, 2017 at 10:56 AM, Alistair Francis <alistair23@gmail.com>
> wrote:
> > On Sun, Jul 2, 2017 at 9:45 PM, Subbaraya Sundeep
> > <sundeep.lkml@gmail.com> wrote:
> >> Modelled System Timer in Microsemi's Smartfusion2 Soc.
> >> Timer has two 32bit down counters and two interrupts.
> >>
> >> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >> ---
> >>  hw/timer/Makefile.objs       |   1 +
> >>  hw/timer/mss-timer.c         | 261 ++++++++++++++++++++++++++++++
> +++++++++++++
> >>  include/hw/timer/mss-timer.h |  67 +++++++++++
> >>  3 files changed, 329 insertions(+)
> >>  create mode 100644 hw/timer/mss-timer.c
> >>  create mode 100644 include/hw/timer/mss-timer.h
> >>
> >> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> >> index dd6f27e..fc4d2da 100644
> >> --- a/hw/timer/Makefile.objs
> >> +++ b/hw/timer/Makefile.objs
> >> @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) +=
> stm32f2xx_timer.o
> >>  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
> >>
> >>  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
> >> +common-obj-$(CONFIG_MSF2) += mss-timer.o
> >> diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
> >> new file mode 100644
> >> index 0000000..e46d118
> >> --- /dev/null
> >> +++ b/hw/timer/mss-timer.c
> >> @@ -0,0 +1,261 @@
> >> +/*
> >> + * Block model of System timer present in
> >> + * Microsemi's SmartFusion2 and SmartFusion SoCs.
> >> + *
> >> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
> >> + *
> >> + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> >> + * of this software and associated documentation files (the
> "Software"), to deal
> >> + * in the Software without restriction, including without limitation
> the rights
> >> + * to use, copy, modify, merge, publish, distribute, sublicense,
> and/or sell
> >> + * copies of the Software, and to permit persons to whom the Software
> is
> >> + * furnished to do so, subject to the following conditions:
> >> + *
> >> + * The above copyright notice and this permission notice shall be
> included in
> >> + * all copies or substantial portions of the Software.
> >> + *
> >> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> >> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> >> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> >> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR OTHER
> >> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> >> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> >> + * THE SOFTWARE.
> >> + */
> >> +
> >> +#include "hw/timer/mss-timer.h"
>
> Also just noticed (this applies to the whole series) that you need the
> headers in the C file.
>
> Move every #include that you can from the mss-timer.h files to this
> file, headers should be local to where they are called. Also make sure
> you include the os-dep header in every file.
>

Ok will fix this.

Thanks,
Sundeep


>
> Thanks,
> Alistair
>
> >> +
> >> +#ifndef MSS_TIMER_ERR_DEBUG
> >> +#define MSS_TIMER_ERR_DEBUG  0
> >> +#endif
> >> +
> >> +#define DB_PRINT_L(lvl, fmt, args...) do { \
> >> +    if (MSS_TIMER_ERR_DEBUG >= lvl) { \
> >> +        qemu_log("%s: " fmt "\n", __func__, ## args); \
> >> +    } \
> >> +} while (0);
> >> +
> >> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
> >> +
> >> +#define R_TIM_VAL         0
> >> +#define R_TIM_LOADVAL     1
> >> +#define R_TIM_BGLOADVAL   2
> >> +#define R_TIM_CTRL        3
> >> +#define R_TIM_RIS         4
> >> +#define R_TIM_MIS         5
> >> +
> >> +#define TIMER_CTRL_ENBL     (1 << 0)
> >> +#define TIMER_CTRL_ONESHOT  (1 << 1)
> >> +#define TIMER_CTRL_INTR     (1 << 2)
> >> +#define TIMER_RIS_ACK       (1 << 0)
> >> +#define TIMER_RST_CLR       (1 << 6)
> >> +#define TIMER_MODE          (1 << 0)
> >> +
> >> +static void timer_update_irq(struct Msf2Timer *st)
> >> +{
> >> +    bool isr, ier;
> >> +
> >> +    isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
> >> +    ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
> >> +    qemu_set_irq(st->irq, (ier && isr));
> >> +}
> >> +
> >> +static void timer_update(struct Msf2Timer *st)
> >> +{
> >> +    uint64_t count;
> >> +
> >> +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL)) {
> >> +        ptimer_stop(st->ptimer);
> >> +        return;
> >> +    }
> >> +
> >> +    count = st->regs[R_TIM_LOADVAL];
> >> +    ptimer_set_limit(st->ptimer, count, 1);
> >> +    ptimer_run(st->ptimer, 1);
> >> +}
> >> +
> >> +static uint64_t
> >> +timer_read(void *opaque, hwaddr offset, unsigned int size)
> >> +{
> >> +    MSSTimerState *t = opaque;
> >> +    hwaddr addr;
> >> +    struct Msf2Timer *st;
> >> +    uint32_t ret = 0;
> >> +    int timer = 0;
> >> +    int isr;
> >> +    int ier;
> >> +
> >> +    addr = offset >> 2;
> >> +    /*
> >> +     * Two independent timers has same base address.
> >> +     * Based on address passed figure out which timer is being used.
> >> +     */
> >> +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
> >> +        timer = 1;
> >> +        addr -= R_TIM1_MAX;
> >> +    }
> >> +
> >> +    st = &t->timers[timer];
> >> +
> >> +    switch (addr) {
> >> +    case R_TIM_VAL:
> >> +        ret = ptimer_get_count(st->ptimer);
> >> +        break;
> >> +
> >> +    case R_TIM_MIS:
> >> +        isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
> >> +        ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
> >> +        ret = ier & isr;
> >> +        break;
> >> +
> >> +    default:
> >> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
> >
> > Shouldn't this just be: addr < R_TIM1_MAX?
> >
> > At this point you have already subjected the offset for multiple timers.
> >
> >> +            ret = st->regs[addr];
> >> +        } else {
> >> +            qemu_log_mask(LOG_GUEST_ERROR,
> >> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
> >
> > Maybe add a return here so you don't print the other debug message after
> this.
> >
> >> +        }
> >> +        break;
> >> +    }
> >> +
> >> +    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32, timer, offset,
> >> +            ret);
> >> +    return ret;
> >> +}
> >> +
> >> +static void
> >> +timer_write(void *opaque, hwaddr offset,
> >> +            uint64_t val64, unsigned int size)
> >> +{
> >> +    MSSTimerState *t = opaque;
> >> +    hwaddr addr;
> >> +    struct Msf2Timer *st;
> >> +    int timer = 0;
> >> +    uint32_t value = val64;
> >> +
> >> +    addr = offset >> 2;
> >> +    /*
> >> +     * Two independent timers has same base address.
> >> +     * Based on addr passed figure out which timer is being used.
> >> +     */
> >> +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
> >> +        timer = 1;
> >> +        addr -= R_TIM1_MAX;
> >> +    }
> >> +
> >> +    st = &t->timers[timer];
> >> +
> >> +    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)",
> offset,
> >> +            value, timer);
> >> +
> >> +    switch (addr) {
> >> +    case R_TIM_CTRL:
> >> +        st->regs[R_TIM_CTRL] = value;
> >> +        timer_update(st);
> >> +        break;
> >> +
> >> +    case R_TIM_RIS:
> >> +        if (value & TIMER_RIS_ACK) {
> >> +            st->regs[R_TIM_RIS] &= ~TIMER_RIS_ACK;
> >> +        }
> >> +        break;
> >> +
> >> +    case R_TIM_LOADVAL:
> >> +        st->regs[R_TIM_LOADVAL] = value;
> >> +        if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
> >> +            timer_update(st);
> >> +        }
> >> +        break;
> >> +
> >> +    case R_TIM_BGLOADVAL:
> >> +        st->regs[R_TIM_BGLOADVAL] = value;
> >> +        st->regs[R_TIM_LOADVAL] = value;
> >> +        break;
> >> +
> >> +    case R_TIM_VAL:
> >> +    case R_TIM_MIS:
> >> +        break;
> >> +
> >> +    default:
> >> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
> >
> > Same comment as above.
> >
> >> +            st->regs[addr] = value;
> >> +        } else {
> >> +            qemu_log_mask(LOG_GUEST_ERROR,
> >> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
> >> +            return;
> >> +        }
> >> +        break;
> >> +    }
> >> +    timer_update_irq(st);
> >> +}
> >
> > Once those comments above are addressed:
> >
> > Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
> >
> > Thanks,
> > Alistair
>

--001a114bb028491d180553b4c84e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Wed, Jul 5, 2017 at 11:28 PM, Alistair Francis <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair=
23@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div c=
lass=3D"HOEnZb"><div class=3D"h5">On Wed, Jul 5, 2017 at 10:56 AM, Alistair=
 Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</=
a>&gt; wrote:<br>
&gt; On Sun, Jul 2, 2017 at 9:45 PM, Subbaraya Sundeep<br>
&gt; &lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt; Modelled System Timer in Microsemi&#39;s Smartfusion2 Soc.<br>
&gt;&gt; Timer has two 32bit down counters and two interrupts.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkm=
l@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
&gt;&gt;=C2=A0 hw/timer/mss-timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 261 =
++++++++++++++++++++++++++++++<wbr>+++++++++++++<br>
&gt;&gt;=C2=A0 include/hw/timer/mss-timer.h |=C2=A0 67 +++++++++++<br>
&gt;&gt;=C2=A0 3 files changed, 329 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 hw/timer/mss-timer.c<br>
&gt;&gt;=C2=A0 create mode 100644 include/hw/timer/mss-timer.h<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs<br>
&gt;&gt; index dd6f27e..fc4d2da 100644<br>
&gt;&gt; --- a/hw/timer/Makefile.objs<br>
&gt;&gt; +++ b/hw/timer/Makefile.objs<br>
&gt;&gt; @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_<wbr>TIMER) +=3D s=
tm32f2xx_timer.o<br>
&gt;&gt;=C2=A0 common-obj-$(CONFIG_ASPEED_<wbr>SOC) +=3D aspeed_timer.o<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o<br>
&gt;&gt; +common-obj-$(CONFIG_MSF2) +=3D mss-timer.o<br>
&gt;&gt; diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000..e46d118<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/hw/timer/mss-timer.c<br>
&gt;&gt; @@ -0,0 +1,261 @@<br>
&gt;&gt; +/*<br>
&gt;&gt; + * Block model of System timer present in<br>
&gt;&gt; + * Microsemi&#39;s SmartFusion2 and SmartFusion SoCs.<br>
&gt;&gt; + *<br>
&gt;&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sun=
deep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;.<br>
&gt;&gt; + *<br>
&gt;&gt; + * Permission is hereby granted, free of charge, to any person ob=
taining a copy<br>
&gt;&gt; + * of this software and associated documentation files (the &quot=
;Software&quot;), to deal<br>
&gt;&gt; + * in the Software without restriction, including without limitat=
ion the rights<br>
&gt;&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, =
and/or sell<br>
&gt;&gt; + * copies of the Software, and to permit persons to whom the Soft=
ware is<br>
&gt;&gt; + * furnished to do so, subject to the following conditions:<br>
&gt;&gt; + *<br>
&gt;&gt; + * The above copyright notice and this permission notice shall be=
 included in<br>
&gt;&gt; + * all copies or substantial portions of the Software.<br>
&gt;&gt; + *<br>
&gt;&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY O=
F ANY KIND, EXPRESS OR<br>
&gt;&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHA=
NTABILITY,<br>
&gt;&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EV=
ENT SHALL<br>
&gt;&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMA=
GES OR OTHER<br>
&gt;&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE=
, ARISING FROM,<br>
&gt;&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS IN<br>
&gt;&gt; + * THE SOFTWARE.<br>
&gt;&gt; + */<br>
&gt;&gt; +<br>
&gt;&gt; +#include &quot;hw/timer/mss-timer.h&quot;<br>
<br>
</div></div>Also just noticed (this applies to the whole series) that you n=
eed the<br>
headers in the C file.<br>
<br>
Move every #include that you can from the mss-timer.h files to this<br>
file, headers should be local to where they are called. Also make sure<br>
you include the os-dep header in every file.<br></blockquote><div><br></div=
><div>Ok will fix this.</div><div><br></div><div>Thanks,</div><div>Sundeep<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Alistair<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;&gt; +<br>
&gt;&gt; +#ifndef MSS_TIMER_ERR_DEBUG<br>
&gt;&gt; +#define MSS_TIMER_ERR_DEBUG=C2=A0 0<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt; +#define DB_PRINT_L(lvl, fmt, args...) do { \<br>
&gt;&gt; +=C2=A0 =C2=A0 if (MSS_TIMER_ERR_DEBUG &gt;=3D lvl) { \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt &quot;\=
n&quot;, __func__, ## args); \<br>
&gt;&gt; +=C2=A0 =C2=A0 } \<br>
&gt;&gt; +} while (0);<br>
&gt;&gt; +<br>
&gt;&gt; +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<br>
&gt;&gt; +<br>
&gt;&gt; +#define R_TIM_VAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;&gt; +#define R_TIM_LOADVAL=C2=A0 =C2=A0 =C2=A01<br>
&gt;&gt; +#define R_TIM_BGLOADVAL=C2=A0 =C2=A02<br>
&gt;&gt; +#define R_TIM_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
&gt;&gt; +#define R_TIM_RIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
&gt;&gt; +#define R_TIM_MIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
&gt;&gt; +<br>
&gt;&gt; +#define TIMER_CTRL_ENBL=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
&gt;&gt; +#define TIMER_CTRL_ONESHOT=C2=A0 (1 &lt;&lt; 1)<br>
&gt;&gt; +#define TIMER_CTRL_INTR=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br>
&gt;&gt; +#define TIMER_RIS_ACK=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br=
>
&gt;&gt; +#define TIMER_RST_CLR=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 6)<br=
>
&gt;&gt; +#define TIMER_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; =
0)<br>
&gt;&gt; +<br>
&gt;&gt; +static void timer_update_irq(struct Msf2Timer *st)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 bool isr, ier;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 isr =3D !!(st-&gt;regs[R_TIM_RIS] &amp; TIMER_RIS_A=
CK);<br>
&gt;&gt; +=C2=A0 =C2=A0 ier =3D !!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL=
_INTR);<br>
&gt;&gt; +=C2=A0 =C2=A0 qemu_set_irq(st-&gt;irq, (ier &amp;&amp; isr));<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void timer_update(struct Msf2Timer *st)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 uint64_t count;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_ENBL=
)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_stop(st-&gt;ptimer);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 count =3D st-&gt;regs[R_TIM_LOADVAL];<br>
&gt;&gt; +=C2=A0 =C2=A0 ptimer_set_limit(st-&gt;ptimer, count, 1);<br>
&gt;&gt; +=C2=A0 =C2=A0 ptimer_run(st-&gt;ptimer, 1);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static uint64_t<br>
&gt;&gt; +timer_read(void *opaque, hwaddr offset, unsigned int size)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 MSSTimerState *t =3D opaque;<br>
&gt;&gt; +=C2=A0 =C2=A0 hwaddr addr;<br>
&gt;&gt; +=C2=A0 =C2=A0 struct Msf2Timer *st;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 int timer =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 int isr;<br>
&gt;&gt; +=C2=A0 =C2=A0 int ier;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 addr =3D offset &gt;&gt; 2;<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Two independent timers has same base addres=
s.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Based on address passed figure out which ti=
mer is being used.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 if ((addr &gt;=3D R_TIM1_MAX) &amp;&amp; (addr &lt;=
 NUM_TIMERS * R_TIM1_MAX)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer =3D 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr -=3D R_TIM1_MAX;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 st =3D &amp;t-&gt;timers[timer];<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt;&gt; +=C2=A0 =C2=A0 case R_TIM_VAL:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ptimer_get_count(st-&gt;ptime=
r);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 case R_TIM_MIS:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 isr =3D !!(st-&gt;regs[R_TIM_RIS] &am=
p; TIMER_RIS_ACK);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ier =3D !!(st-&gt;regs[R_TIM_CTRL] &a=
mp; TIMER_CTRL_INTR);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ier &amp; isr;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; NUM_TIMERS * R_TIM1_MAX=
) {<br>
&gt;<br>
&gt; Shouldn&#39;t this just be: addr &lt; R_TIM1_MAX?<br>
&gt;<br>
&gt; At this point you have already subjected the offset for multiple timer=
s.<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D st-&gt;regs[add=
r];<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST=
_ERROR,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 TYPE_MSS_TIMER&quot;: 64-bit mode not supported\n&quot=
;);<br>
&gt;<br>
&gt; Maybe add a return here so you don&#39;t print the other debug message=
 after this.<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;timer=3D%d 0x%&quot; HWADDR_PRIx &qu=
ot;=3D0x%&quot; PRIx32, timer, offset,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret);<br>
&gt;&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static void<br>
&gt;&gt; +timer_write(void *opaque, hwaddr offset,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val64, unsigne=
d int size)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 MSSTimerState *t =3D opaque;<br>
&gt;&gt; +=C2=A0 =C2=A0 hwaddr addr;<br>
&gt;&gt; +=C2=A0 =C2=A0 struct Msf2Timer *st;<br>
&gt;&gt; +=C2=A0 =C2=A0 int timer =3D 0;<br>
&gt;&gt; +=C2=A0 =C2=A0 uint32_t value =3D val64;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 addr =3D offset &gt;&gt; 2;<br>
&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Two independent timers has same base addres=
s.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Based on addr passed figure out which timer=
 is being used.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 if ((addr &gt;=3D R_TIM1_MAX) &amp;&amp; (addr &lt;=
 NUM_TIMERS * R_TIM1_MAX)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer =3D 1;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr -=3D R_TIM1_MAX;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 st =3D &amp;t-&gt;timers[timer];<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;addr=3D0x%&quot; HWADDR_PRIx &quot; =
val=3D0x%&quot; PRIx32 &quot; (timer=3D%d)&quot;, offset,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value, timer);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt;&gt; +=C2=A0 =C2=A0 case R_TIM_CTRL:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_CTRL] =3D value;<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_update(st);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 case R_TIM_RIS:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; TIMER_RIS_ACK) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_RIS] =
&amp;=3D ~TIMER_RIS_ACK;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 case R_TIM_LOADVAL:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_LOADVAL] =3D value;=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (st-&gt;regs[R_TIM_CTRL] &amp; TIM=
ER_CTRL_ENBL) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_update(st);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 case R_TIM_BGLOADVAL:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_BGLOADVAL] =3D valu=
e;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_LOADVAL] =3D value;=
<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 case R_TIM_VAL:<br>
&gt;&gt; +=C2=A0 =C2=A0 case R_TIM_MIS:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; NUM_TIMERS * R_TIM1_MAX=
) {<br>
&gt;<br>
&gt; Same comment as above.<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[addr] =3D v=
alue;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST=
_ERROR,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 TYPE_MSS_TIMER&quot;: 64-bit mode not supported\n&quot=
;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +=C2=A0 =C2=A0 timer_update_irq(st);<br>
&gt;&gt; +}<br>
&gt;<br>
&gt; Once those comments above are addressed:<br>
&gt;<br>
&gt; Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@x=
ilinx.com">alistair.francis@xilinx.com</a>&gt;<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Alistair<br>
</div></div></blockquote></div><br></div></div>

--001a114bb028491d180553b4c84e--

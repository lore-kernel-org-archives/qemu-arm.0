Received: by 10.223.188.70 with SMTP id a6csp5468398wrh;
        Mon, 28 Aug 2017 22:32:47 -0700 (PDT)
X-Received: by 10.237.60.168 with SMTP id d37mr3907294qtf.3.1503984767865;
        Mon, 28 Aug 2017 22:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503984767; cv=none;
        d=google.com; s=arc-20160816;
        b=osPDBqs61APATYjmiMGNs+YMXuYpFQjSSdqR9nw1g4KvoyvUbxGuQU1iiUOE7g5/5F
         M+CI/Rlyjy+ox0a6huJePteSyrVTGq5r99o25ErHmdR/DAvv0gWqZWJfLmSZFk54pcVT
         tIUZhTm/nAT1elLEnNx3wClRB3WecJvHOtLiUluhTaUcxY86No2roxCoJZblA+w44B0G
         qVwl5qOjeBZ1KCJxv+RkjpX0OJdHnYEitcs/HKCbDz1YKph5z5AX9y49Mj/HC4SeF0lU
         tC3gcOS1LeIyv/kqxuVE7oNiJol5ykqL82xUcQi4KcAGBS+kap2kd+mPKrCw3XKQ+/qu
         WcfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dogtuECe8kgKPJ+oTM5EJMCHdrnQr4ttO3ZRldjeii8=;
        b=HfczE0SAg+2xCDM3d4eaCXyCYuJ3w054dkZuRKFjZ+idhBgmANHHqFkntGLtqCWA+p
         pCXNqb/cqFU4a6VUyFDCWQhX+dHq7ijrgxoI5wElOmTCO4f9zQ1tjAUmZPJjFWwkQTmd
         p6BwZchSY0sTcgn5i/pJN9XTkj0ElTx7eKrgOap7nOOP/elygxSxmK6LkcvMN3JSMh1p
         zd/qTiEBiNnXAG3HKWY+42e9Kt8kHhtvEJ+WuEi6ggVhEjTqikIBdzhheLIQO/fCPKzQ
         BgJCHR4HMO6H2BE5L+UTNM19rsz547zvYaQz8xk47De+040aJkDFQua6k5pyNSIMyNQZ
         irkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TT6NbNFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x36si2053296qtd.452.2017.08.28.22.32.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 22:32:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TT6NbNFl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42855 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmZ8n-0003u1-3w
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 01:32:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmZ8f-0003r2-6p
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 01:32:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dmZ8c-00083V-6I
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 01:32:37 -0400
Received: from mail-ua0-x243.google.com ([2607:f8b0:400c:c08::243]:35659)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dmZ8V-00080z-L4; Tue, 29 Aug 2017 01:32:27 -0400
Received: by mail-ua0-x243.google.com with SMTP id 37so1048854ual.2;
	Mon, 28 Aug 2017 22:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dogtuECe8kgKPJ+oTM5EJMCHdrnQr4ttO3ZRldjeii8=;
	b=TT6NbNFlXxvI9LWbP1wTrbJVHlSl+mNc8vLehaZ/P6C6IH3Vx1eAN1nM1MdhYCqbny
	ayEAjBZmn8FpMfil8fMQKT6/+O277xZ0hGVdZ3nOxhhF51iMk8y6DWQx/VxepgM53PUN
	a3fWfvAk3iIoR7stOad6ipchO9g51IiOpAK8jR+bJt64SrC15A5ZeAufU9wPo3B+AqMW
	reIbX4Ubmg2li49PIaWGOLylHJGZohIqgzoP6VNbLQ87tRSvyeDonrXe8cqONCF70/aQ
	VN8AjaUdBUUuGuVHXHnZv4rqvxsdb3fOHF97jgcPpXV7dya3LFEOWmtlVdB6XS3f7Ghu
	7qSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dogtuECe8kgKPJ+oTM5EJMCHdrnQr4ttO3ZRldjeii8=;
	b=R4rZEQIurWUq52T8sprBgQcLJxrtcuVA6BOLj8L/FHw9nWniv/ymcDl17XWPP+Zun8
	/k7vufDRPOc+/E4ZQnQSFlUe67Y38IVodr1SIJdwlP8t+gEU18Dkv/gqt2JIW6KfB5CF
	Bg2BAJDDKmBBJ4l0YKxHwFvQysbzNUyARDWFz6t+iwaOwVKO7+xQN0efebg5FTINFOA4
	LfOPo3SG142FEniOGr338afl1tqKV5Vmpm5GSt84KsZeegcymE82N4WnjYYnEMAZQQnn
	NXCgHobYgNkZ08sWK6cuDEQUHs1OvDrSnsaRtsdHo/22Xq+E4zqqEHW/82vFSYw3hc7L
	5+xw==
X-Gm-Message-State: AHYfb5ijLt9qF8CAeOe9ShPkW1yLgs5n8cS/7OT03Z54gHCoMhTyryH0
	U6iRQVMq2R44DAVgRTW3FpP/9JfF6A==
X-Google-Smtp-Source: ADKCNb6ktnkmqCq0x52kf+Zrf3sEKV6YSKT18zl3m9u8+rAvkLYVhJf2MtG0nLLzPpJWPDxGwBEVPrAqpyyb0e3UBNk=
X-Received: by 10.176.68.102 with SMTP id m93mr1599075uam.133.1503984746875;
	Mon, 28 Aug 2017 22:32:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.75.196 with HTTP; Mon, 28 Aug 2017 22:32:26 -0700 (PDT)
In-Reply-To: <CAKmqyKNZySCD==0TjOvDjkbWPOk_DR6w2q=MYGutZRQFSmkM6Q@mail.gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKNZySCD==0TjOvDjkbWPOk_DR6w2q=MYGutZRQFSmkM6Q@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Tue, 29 Aug 2017 11:02:26 +0530
Message-ID: <CALHRZuo+Bhp+ps_A0oEgdE7Df+6QSMFt95_nqRijrtbo-SDsWA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="001a114ccd3295d0c40557ddbc05"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::243
Subject: Re: [Qemu-arm] [Qemu devel v7 PATCH 1/5] msf2: Add Smartfusion2
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
X-TUID: GPffHl9BJYme

--001a114ccd3295d0c40557ddbc05
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

On Tue, Aug 29, 2017 at 3:23 AM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Aug 28, 2017 at 9:37 AM, Subbaraya Sundeep
> <sundeep.lkml@gmail.com> wrote:
> > Modelled System Timer in Microsemi's Smartfusion2 Soc.
> > Timer has two 32bit down counters and two interrupts.
> >
> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>
> I had already reviewed this patch in v6. As long as you have made all
> of the changes mentioned their you can add my reviewed-by to the next
> version (as long as there are no other significant changes).
>
> Can you please ensure you do add and keep reviewed-by tags, it's a
> pain to have to do it multiple times.
>

Sorry I was not aware that I can add reviewed by tag myself and send.
I will add your reviewed by since I fixed all your comments.
Do I need to send another version v8 with your Reviewed-by ?

Thanks,
Sundeep


>
> Thanks,
> Alistair
>
> > ---
> >  hw/timer/Makefile.objs       |   1 +
> >  hw/timer/mss-timer.c         | 289 ++++++++++++++++++++++++++++++
> +++++++++++++
> >  include/hw/timer/mss-timer.h |  64 ++++++++++
> >  3 files changed, 354 insertions(+)
> >  create mode 100644 hw/timer/mss-timer.c
> >  create mode 100644 include/hw/timer/mss-timer.h
> >
> > diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> > index 15cce1c..8c19eac 100644
> > --- a/hw/timer/Makefile.objs
> > +++ b/hw/timer/Makefile.objs
> > @@ -42,3 +42,4 @@ common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
> >
> >  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
> >  common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
> > +common-obj-$(CONFIG_MSF2) += mss-timer.o
> > diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
> > new file mode 100644
> > index 0000000..60f1213
> > --- /dev/null
> > +++ b/hw/timer/mss-timer.c
> > @@ -0,0 +1,289 @@
> > +/*
> > + * Block model of System timer present in
> > + * Microsemi's SmartFusion2 and SmartFusion SoCs.
> > + *
> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/main-loop.h"
> > +#include "qemu/log.h"
> > +#include "hw/timer/mss-timer.h"
> > +
> > +#ifndef MSS_TIMER_ERR_DEBUG
> > +#define MSS_TIMER_ERR_DEBUG  0
> > +#endif
> > +
> > +#define DB_PRINT_L(lvl, fmt, args...) do { \
> > +    if (MSS_TIMER_ERR_DEBUG >= lvl) { \
> > +        qemu_log("%s: " fmt "\n", __func__, ## args); \
> > +    } \
> > +} while (0);
> > +
> > +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
> > +
> > +#define R_TIM_VAL         0
> > +#define R_TIM_LOADVAL     1
> > +#define R_TIM_BGLOADVAL   2
> > +#define R_TIM_CTRL        3
> > +#define R_TIM_RIS         4
> > +#define R_TIM_MIS         5
> > +
> > +#define TIMER_CTRL_ENBL     (1 << 0)
> > +#define TIMER_CTRL_ONESHOT  (1 << 1)
> > +#define TIMER_CTRL_INTR     (1 << 2)
> > +#define TIMER_RIS_ACK       (1 << 0)
> > +#define TIMER_RST_CLR       (1 << 6)
> > +#define TIMER_MODE          (1 << 0)
> > +
> > +static void timer_update_irq(struct Msf2Timer *st)
> > +{
> > +    bool isr, ier;
> > +
> > +    isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
> > +    ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
> > +    qemu_set_irq(st->irq, (ier && isr));
> > +}
> > +
> > +static void timer_update(struct Msf2Timer *st)
> > +{
> > +    uint64_t count;
> > +
> > +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL)) {
> > +        ptimer_stop(st->ptimer);
> > +        return;
> > +    }
> > +
> > +    count = st->regs[R_TIM_LOADVAL];
> > +    ptimer_set_limit(st->ptimer, count, 1);
> > +    ptimer_run(st->ptimer, 1);
> > +}
> > +
> > +static uint64_t
> > +timer_read(void *opaque, hwaddr offset, unsigned int size)
> > +{
> > +    MSSTimerState *t = opaque;
> > +    hwaddr addr;
> > +    struct Msf2Timer *st;
> > +    uint32_t ret = 0;
> > +    int timer = 0;
> > +    int isr;
> > +    int ier;
> > +
> > +    addr = offset >> 2;
> > +    /*
> > +     * Two independent timers has same base address.
> > +     * Based on address passed figure out which timer is being used.
> > +     */
> > +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
> > +        timer = 1;
> > +        addr -= R_TIM1_MAX;
> > +    }
> > +
> > +    st = &t->timers[timer];
> > +
> > +    switch (addr) {
> > +    case R_TIM_VAL:
> > +        ret = ptimer_get_count(st->ptimer);
> > +        break;
> > +
> > +    case R_TIM_MIS:
> > +        isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
> > +        ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
> > +        ret = ier & isr;
> > +        break;
> > +
> > +    default:
> > +        if (addr < R_TIM1_MAX) {
> > +            ret = st->regs[addr];
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
> > +            return ret;
> > +        }
> > +        break;
> > +    }
> > +
> > +    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32, timer, offset,
> > +            ret);
> > +    return ret;
> > +}
> > +
> > +static void
> > +timer_write(void *opaque, hwaddr offset,
> > +            uint64_t val64, unsigned int size)
> > +{
> > +    MSSTimerState *t = opaque;
> > +    hwaddr addr;
> > +    struct Msf2Timer *st;
> > +    int timer = 0;
> > +    uint32_t value = val64;
> > +
> > +    addr = offset >> 2;
> > +    /*
> > +     * Two independent timers has same base address.
> > +     * Based on addr passed figure out which timer is being used.
> > +     */
> > +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
> > +        timer = 1;
> > +        addr -= R_TIM1_MAX;
> > +    }
> > +
> > +    st = &t->timers[timer];
> > +
> > +    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)",
> offset,
> > +            value, timer);
> > +
> > +    switch (addr) {
> > +    case R_TIM_CTRL:
> > +        st->regs[R_TIM_CTRL] = value;
> > +        timer_update(st);
> > +        break;
> > +
> > +    case R_TIM_RIS:
> > +        if (value & TIMER_RIS_ACK) {
> > +            st->regs[R_TIM_RIS] &= ~TIMER_RIS_ACK;
> > +        }
> > +        break;
> > +
> > +    case R_TIM_LOADVAL:
> > +        st->regs[R_TIM_LOADVAL] = value;
> > +        if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
> > +            timer_update(st);
> > +        }
> > +        break;
> > +
> > +    case R_TIM_BGLOADVAL:
> > +        st->regs[R_TIM_BGLOADVAL] = value;
> > +        st->regs[R_TIM_LOADVAL] = value;
> > +        break;
> > +
> > +    case R_TIM_VAL:
> > +    case R_TIM_MIS:
> > +        break;
> > +
> > +    default:
> > +        if (addr < R_TIM1_MAX) {
> > +            st->regs[addr] = value;
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
> > +            return;
> > +        }
> > +        break;
> > +    }
> > +    timer_update_irq(st);
> > +}
> > +
> > +static const MemoryRegionOps timer_ops = {
> > +    .read = timer_read,
> > +    .write = timer_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> > +    .valid = {
> > +        .min_access_size = 1,
> > +        .max_access_size = 4
> > +    }
> > +};
> > +
> > +static void timer_hit(void *opaque)
> > +{
> > +    struct Msf2Timer *st = opaque;
> > +
> > +    st->regs[R_TIM_RIS] |= TIMER_RIS_ACK;
> > +
> > +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ONESHOT)) {
> > +        timer_update(st);
> > +    }
> > +    timer_update_irq(st);
> > +}
> > +
> > +static void mss_timer_init(Object *obj)
> > +{
> > +    MSSTimerState *t = MSS_TIMER(obj);
> > +    int i;
> > +
> > +    /* Init all the ptimers.  */
> > +    for (i = 0; i < NUM_TIMERS; i++) {
> > +        struct Msf2Timer *st = &t->timers[i];
> > +
> > +        st->bh = qemu_bh_new(timer_hit, st);
> > +        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
> > +        ptimer_set_freq(st->ptimer, t->freq_hz);
> > +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
> > +    }
> > +
> > +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
> TYPE_MSS_TIMER,
> > +                          NUM_TIMERS * R_TIM1_MAX * 4);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
> > +}
> > +
> > +static const VMStateDescription vmstate_timers = {
> > +    .name = "mss-timer-block",
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_PTIMER(ptimer, struct Msf2Timer),
> > +        VMSTATE_UINT32_ARRAY(regs, struct Msf2Timer, R_TIM1_MAX),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static const VMStateDescription vmstate_mss_timer = {
> > +    .name = TYPE_MSS_TIMER,
> > +    .version_id = 1,
> > +    .minimum_version_id = 1,
> > +    .fields = (VMStateField[]) {
> > +        VMSTATE_UINT32(freq_hz, MSSTimerState),
> > +        VMSTATE_STRUCT_ARRAY(timers, MSSTimerState, NUM_TIMERS, 0,
> > +                vmstate_timers, struct Msf2Timer),
> > +        VMSTATE_END_OF_LIST()
> > +    }
> > +};
> > +
> > +static Property mss_timer_properties[] = {
> > +    /* Libero GUI shows 100Mhz as default for clocks */
> > +    DEFINE_PROP_UINT32("clock-frequency", MSSTimerState, freq_hz,
> > +                      100 * 1000000),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void mss_timer_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc = DEVICE_CLASS(klass);
> > +
> > +    dc->props = mss_timer_properties;
> > +    dc->vmsd = &vmstate_mss_timer;
> > +}
> > +
> > +static const TypeInfo mss_timer_info = {
> > +    .name          = TYPE_MSS_TIMER,
> > +    .parent        = TYPE_SYS_BUS_DEVICE,
> > +    .instance_size = sizeof(MSSTimerState),
> > +    .instance_init = mss_timer_init,
> > +    .class_init    = mss_timer_class_init,
> > +};
> > +
> > +static void mss_timer_register_types(void)
> > +{
> > +    type_register_static(&mss_timer_info);
> > +}
> > +
> > +type_init(mss_timer_register_types)
> > diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
> > new file mode 100644
> > index 0000000..d15d173
> > --- /dev/null
> > +++ b/include/hw/timer/mss-timer.h
> > @@ -0,0 +1,64 @@
> > +/*
> > + * Microsemi SmartFusion2 Timer.
> > + *
> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#ifndef HW_MSS_TIMER_H
> > +#define HW_MSS_TIMER_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "hw/ptimer.h"
> > +
> > +#define TYPE_MSS_TIMER     "mss-timer"
> > +#define MSS_TIMER(obj)     OBJECT_CHECK(MSSTimerState, \
> > +                              (obj), TYPE_MSS_TIMER)
> > +
> > +/*
> > + * There are two 32-bit down counting timers.
> > + * Timers 1 and 2 can be concatenated into a single 64-bit Timer
> > + * that operates either in Periodic mode or in One-shot mode.
> > + * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit
> mode.
> > + * In 64-bit mode, writing to the 32-bit registers has no effect.
> > + * Similarly, in 32-bit mode, writing to the 64-bit mode registers
> > + * has no effect. Only two 32-bit timers are supported currently.
> > + */
> > +#define NUM_TIMERS        2
> > +
> > +#define R_TIM1_MAX        6
> > +
> > +struct Msf2Timer {
> > +    QEMUBH *bh;
> > +    ptimer_state *ptimer;
> > +
> > +    uint32_t regs[R_TIM1_MAX];
> > +    qemu_irq irq;
> > +};
> > +
> > +typedef struct MSSTimerState {
> > +    SysBusDevice parent_obj;
> > +
> > +    MemoryRegion mmio;
> > +    uint32_t freq_hz;
> > +    struct Msf2Timer timers[NUM_TIMERS];
> > +} MSSTimerState;
> > +
> > +#endif /* HW_MSS_TIMER_H */
> > --
> > 2.5.0
> >
>

--001a114ccd3295d0c40557ddbc05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Tue, Aug 29, 2017 at 3:23 AM, Alistair Francis <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair=
23@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">On Mon, Aug 28, 2017 at 9:37 AM, Subbaraya Sundeep<br>
&lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt=
; wrote:<br>
&gt; Modelled System Timer in Microsemi&#39;s Smartfusion2 Soc.<br>
&gt; Timer has two 32bit down counters and two interrupts.<br>
&gt;<br>
&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gm=
ail.com">sundeep.lkml@gmail.com</a>&gt;<br>
<br>
</span>I had already reviewed this patch in v6. As long as you have made al=
l<br>
of the changes mentioned their you can add my reviewed-by to the next<br>
version (as long as there are no other significant changes).<br>
<br>
Can you please ensure you do add and keep reviewed-by tags, it&#39;s a<br>
pain to have to do it multiple times.<br></blockquote><div><br></div><div>S=
orry I was not aware that I can add reviewed by tag myself and send.</div><=
div>I will add your reviewed by since I fixed all your comments.</div><div>=
Do I need to send another version v8 with your Reviewed-by ?</div><div><br>=
</div><div>Thanks,</div><div>Sundeep</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
Thanks,<br>
Alistair<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; ---<br>
&gt;=C2=A0 hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01=
 +<br>
&gt;=C2=A0 hw/timer/mss-timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 289 ++++=
++++++++++++++++++++++++++<wbr>+++++++++++++<br>
&gt;=C2=A0 include/hw/timer/mss-timer.h |=C2=A0 64 ++++++++++<br>
&gt;=C2=A0 3 files changed, 354 insertions(+)<br>
&gt;=C2=A0 create mode 100644 hw/timer/mss-timer.c<br>
&gt;=C2=A0 create mode 100644 include/hw/timer/mss-timer.h<br>
&gt;<br>
&gt; diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs<br>
&gt; index 15cce1c..8c19eac 100644<br>
&gt; --- a/hw/timer/Makefile.objs<br>
&gt; +++ b/hw/timer/Makefile.objs<br>
&gt; @@ -42,3 +42,4 @@ common-obj-$(CONFIG_ASPEED_<wbr>SOC) +=3D aspeed_tim=
er.o<br>
&gt;<br>
&gt;=C2=A0 common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o<br>
&gt;=C2=A0 common-obj-$(CONFIG_CMSDK_APB_<wbr>TIMER) +=3D cmsdk-apb-timer.o=
<br>
&gt; +common-obj-$(CONFIG_MSF2) +=3D mss-timer.o<br>
&gt; diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..60f1213<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/timer/mss-timer.c<br>
&gt; @@ -0,0 +1,289 @@<br>
&gt; +/*<br>
&gt; + * Block model of System timer present in<br>
&gt; + * Microsemi&#39;s SmartFusion2 and SmartFusion SoCs.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;.<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/main-loop.h&quot;<br>
&gt; +#include &quot;qemu/log.h&quot;<br>
&gt; +#include &quot;hw/timer/mss-timer.h&quot;<br>
&gt; +<br>
&gt; +#ifndef MSS_TIMER_ERR_DEBUG<br>
&gt; +#define MSS_TIMER_ERR_DEBUG=C2=A0 0<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#define DB_PRINT_L(lvl, fmt, args...) do { \<br>
&gt; +=C2=A0 =C2=A0 if (MSS_TIMER_ERR_DEBUG &gt;=3D lvl) { \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;%s: &quot; fmt &quot;\n&qu=
ot;, __func__, ## args); \<br>
&gt; +=C2=A0 =C2=A0 } \<br>
&gt; +} while (0);<br>
&gt; +<br>
&gt; +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<br>
&gt; +<br>
&gt; +#define R_TIM_VAL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; +#define R_TIM_LOADVAL=C2=A0 =C2=A0 =C2=A01<br>
&gt; +#define R_TIM_BGLOADVAL=C2=A0 =C2=A02<br>
&gt; +#define R_TIM_CTRL=C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
&gt; +#define R_TIM_RIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04<br>
&gt; +#define R_TIM_MIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
&gt; +<br>
&gt; +#define TIMER_CTRL_ENBL=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
&gt; +#define TIMER_CTRL_ONESHOT=C2=A0 (1 &lt;&lt; 1)<br>
&gt; +#define TIMER_CTRL_INTR=C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 2)<br>
&gt; +#define TIMER_RIS_ACK=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 0)<br>
&gt; +#define TIMER_RST_CLR=C2=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 6)<br>
&gt; +#define TIMER_MODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; 0)<b=
r>
&gt; +<br>
&gt; +static void timer_update_irq(struct Msf2Timer *st)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 bool isr, ier;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 isr =3D !!(st-&gt;regs[R_TIM_RIS] &amp; TIMER_RIS_ACK);=
<br>
&gt; +=C2=A0 =C2=A0 ier =3D !!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_INT=
R);<br>
&gt; +=C2=A0 =C2=A0 qemu_set_irq(st-&gt;irq, (ier &amp;&amp; isr));<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void timer_update(struct Msf2Timer *st)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 uint64_t count;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_ENBL)) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_stop(st-&gt;ptimer);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 count =3D st-&gt;regs[R_TIM_LOADVAL];<br>
&gt; +=C2=A0 =C2=A0 ptimer_set_limit(st-&gt;ptimer, count, 1);<br>
&gt; +=C2=A0 =C2=A0 ptimer_run(st-&gt;ptimer, 1);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static uint64_t<br>
&gt; +timer_read(void *opaque, hwaddr offset, unsigned int size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSSTimerState *t =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 hwaddr addr;<br>
&gt; +=C2=A0 =C2=A0 struct Msf2Timer *st;<br>
&gt; +=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 int timer =3D 0;<br>
&gt; +=C2=A0 =C2=A0 int isr;<br>
&gt; +=C2=A0 =C2=A0 int ier;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 addr =3D offset &gt;&gt; 2;<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Two independent timers has same base address.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0* Based on address passed figure out which timer =
is being used.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if ((addr &gt;=3D R_TIM1_MAX) &amp;&amp; (addr &lt; NUM=
_TIMERS * R_TIM1_MAX)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr -=3D R_TIM1_MAX;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 st =3D &amp;t-&gt;timers[timer];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt; +=C2=A0 =C2=A0 case R_TIM_VAL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ptimer_get_count(st-&gt;ptimer);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_TIM_MIS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 isr =3D !!(st-&gt;regs[R_TIM_RIS] &amp; T=
IMER_RIS_ACK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ier =3D !!(st-&gt;regs[R_TIM_CTRL] &amp; =
TIMER_CTRL_INTR);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ier &amp; isr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; R_TIM1_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D st-&gt;regs[addr];<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 TYPE_MSS_TIMER&quot;: 64-bit mode not supported\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;timer=3D%d 0x%&quot; HWADDR_PRIx &quot;=
=3D0x%&quot; PRIx32, timer, offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret);<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +timer_write(void *opaque, hwaddr offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t val64, unsigned in=
t size)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSSTimerState *t =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 hwaddr addr;<br>
&gt; +=C2=A0 =C2=A0 struct Msf2Timer *st;<br>
&gt; +=C2=A0 =C2=A0 int timer =3D 0;<br>
&gt; +=C2=A0 =C2=A0 uint32_t value =3D val64;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 addr =3D offset &gt;&gt; 2;<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Two independent timers has same base address.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0* Based on addr passed figure out which timer is =
being used.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 if ((addr &gt;=3D R_TIM1_MAX) &amp;&amp; (addr &lt; NUM=
_TIMERS * R_TIM1_MAX)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 addr -=3D R_TIM1_MAX;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 st =3D &amp;t-&gt;timers[timer];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 DB_PRINT(&quot;addr=3D0x%&quot; HWADDR_PRIx &quot; val=
=3D0x%&quot; PRIx32 &quot; (timer=3D%d)&quot;, offset,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 value, timer);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 switch (addr) {<br>
&gt; +=C2=A0 =C2=A0 case R_TIM_CTRL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_CTRL] =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_update(st);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_TIM_RIS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (value &amp; TIMER_RIS_ACK) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_RIS] &amp=
;=3D ~TIMER_RIS_ACK;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_TIM_LOADVAL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_LOADVAL] =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (st-&gt;regs[R_TIM_CTRL] &amp; TIMER_C=
TRL_ENBL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_update(st);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_TIM_BGLOADVAL:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_BGLOADVAL] =3D value;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[R_TIM_LOADVAL] =3D value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 case R_TIM_VAL:<br>
&gt; +=C2=A0 =C2=A0 case R_TIM_MIS:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (addr &lt; R_TIM1_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;regs[addr] =3D value=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERR=
OR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 TYPE_MSS_TIMER&quot;: 64-bit mode not supported\n&quot;);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 timer_update_irq(st);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const MemoryRegionOps timer_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 .read =3D timer_read,<br>
&gt; +=C2=A0 =C2=A0 .write =3D timer_write,<br>
&gt; +=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
&gt; +=C2=A0 =C2=A0 .valid =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .min_access_size =3D 1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 .max_access_size =3D 4<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void timer_hit(void *opaque)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct Msf2Timer *st =3D opaque;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 st-&gt;regs[R_TIM_RIS] |=3D TIMER_RIS_ACK;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_ONESHOT)=
) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_update(st);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 timer_update_irq(st);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void mss_timer_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 MSSTimerState *t =3D MSS_TIMER(obj);<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Init all the ptimers.=C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; NUM_TIMERS; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct Msf2Timer *st =3D &amp;t-&gt;timer=
s[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;bh =3D qemu_bh_new(timer_hit, st);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 st-&gt;ptimer =3D ptimer_init(st-&gt;bh, =
PTIMER_POLICY_DEFAULT);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptimer_set_freq(st-&gt;ptimer, t-&gt;freq=
_hz);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_init_irq(SYS_BUS_<wbr>DEVICE(obj),=
 &amp;st-&gt;irq);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_io(&amp;t-&gt;<wbr>mmio, OBJECT(t), =
&amp;timer_ops, t, TYPE_MSS_TIMER,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 NUM_TIMERS * R_TIM1_MAX * 4);<br>
&gt; +=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_<wbr>DEVICE(obj), &amp;t-&gt;m=
mio);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const VMStateDescription vmstate_timers =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D &quot;mss-timer-block&quot;,<br>
&gt; +=C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_PTIMER(ptimer, struct Msf2Timer),=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, struct Msf2Tim=
er, R_TIM1_MAX),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const VMStateDescription vmstate_mss_timer =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_MSS_TIMER,<br>
&gt; +=C2=A0 =C2=A0 .version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
&gt; +=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32(freq_hz, MSSTimerState),<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_STRUCT_ARRAY(timers, MSSTimerStat=
e, NUM_TIMERS, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vmstate_timer=
s, struct Msf2Timer),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +};<br>
&gt; +<br>
&gt; +static Property mss_timer_properties[] =3D {<br>
&gt; +=C2=A0 =C2=A0 /* Libero GUI shows 100Mhz as default for clocks */<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;clock-<wbr>frequency&quot;, MS=
STimerState, freq_hz,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 100 * 1000000),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void mss_timer_class_init(<wbr>ObjectClass *klass, void *data)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;props =3D mss_timer_properties;<br>
&gt; +=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_mss_timer;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const TypeInfo mss_timer_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_MSS_TI=
MER,<br>
&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_SYS_BUS_DEV=
ICE,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(MSSTimerState),<br>
&gt; +=C2=A0 =C2=A0 .instance_init =3D mss_timer_init,<br>
&gt; +=C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D mss_timer_class_init,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void mss_timer_register_types(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;mss_<wbr>timer_info);<br>
&gt; +}<br>
&gt; +<br>
&gt; +type_init(mss_timer_register_<wbr>types)<br>
&gt; diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer=
.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..d15d173<br>
&gt; --- /dev/null<br>
&gt; +++ b/include/hw/timer/mss-timer.h<br>
&gt; @@ -0,0 +1,64 @@<br>
&gt; +/*<br>
&gt; + * Microsemi SmartFusion2 Timer.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#ifndef HW_MSS_TIMER_H<br>
&gt; +#define HW_MSS_TIMER_H<br>
&gt; +<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +#include &quot;hw/ptimer.h&quot;<br>
&gt; +<br>
&gt; +#define TYPE_MSS_TIMER=C2=A0 =C2=A0 =C2=A0&quot;mss-timer&quot;<br>
&gt; +#define MSS_TIMER(obj)=C2=A0 =C2=A0 =C2=A0OBJECT_CHECK(MSSTimerState,=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (obj), TYPE_MSS_TIMER)<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * There are two 32-bit down counting timers.<br>
&gt; + * Timers 1 and 2 can be concatenated into a single 64-bit Timer<br>
&gt; + * that operates either in Periodic mode or in One-shot mode.<br>
&gt; + * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-b=
it mode.<br>
&gt; + * In 64-bit mode, writing to the 32-bit registers has no effect.<br>
&gt; + * Similarly, in 32-bit mode, writing to the 64-bit mode registers<br=
>
&gt; + * has no effect. Only two 32-bit timers are supported currently.<br>
&gt; + */<br>
&gt; +#define NUM_TIMERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
&gt; +<br>
&gt; +#define R_TIM1_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 6<br>
&gt; +<br>
&gt; +struct Msf2Timer {<br>
&gt; +=C2=A0 =C2=A0 QEMUBH *bh;<br>
&gt; +=C2=A0 =C2=A0 ptimer_state *ptimer;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint32_t regs[R_TIM1_MAX];<br>
&gt; +=C2=A0 =C2=A0 qemu_irq irq;<br>
&gt; +};<br>
&gt; +<br>
&gt; +typedef struct MSSTimerState {<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion mmio;<br>
&gt; +=C2=A0 =C2=A0 uint32_t freq_hz;<br>
&gt; +=C2=A0 =C2=A0 struct Msf2Timer timers[NUM_TIMERS];<br>
&gt; +} MSSTimerState;<br>
&gt; +<br>
&gt; +#endif /* HW_MSS_TIMER_H */<br>
&gt; --<br>
&gt; 2.5.0<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114ccd3295d0c40557ddbc05--

Received: by 10.100.186.194 with SMTP id b60csp4191441pjc;
        Tue, 29 Aug 2017 14:59:07 -0700 (PDT)
X-Received: by 10.200.49.9 with SMTP id g9mr7487909qtb.19.1504043947006;
        Tue, 29 Aug 2017 14:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504043947; cv=none;
        d=google.com; s=arc-20160816;
        b=zWX0M79Fd/pPuSqIotEyCvXwikqEAVFK63ZJiyWbDBkhXo9/nwRRY19gH77XYC4Mxi
         M4LZ82WC/mkX6k5mr4GWV4NzFl7++CwJKQSe1vJJ4m/tspPaxLYCVLlUEup1J8415mqx
         /DOTylS7/Q4VIU6xjd0TL9JIaCKdlZBGzhLzOsO8Y5ZsWJS3ZTkqvDJWeyU56ZDR7IIM
         xvTLGvQwld+rRwVdHVUpFGmFKfqBc037Jj+vuBJK+4SGs0qlY4GQh309Tj8C2XoqP1GK
         749LzeOpzXNvRxe6H8Ge8/ATJ4TDMcoEbP6867dPcWP3vnkBXvd2IeJHJ2ypHQl9pZfn
         rHKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=0mMaRvQMLvANVKS8/1TyDDjz1flSBsv3PqyDI0cY/bM=;
        b=REPOmACi+9MwGzlndJZ77GtjhJ/Ex7NdhSmfsUim0l46H/nNFD9bvqYL28eofzgoFT
         RKHqfWiTm0NuKZwsm/rLQ2rLm0QjnrDF+FWbPpEhmAaF5B7ceKt++uP8JT0qqnGu12Cg
         gGZrKoaH78rmc3u0pa/ZnzLE/dOWVZa1897AzZ8/7sJxuRUXEOZ9vb3vIWTrGM8EsEaP
         xXzMV86mg2tLRaoRHBwWqVZy3KQI+4t2ySxpRFlBqmCRgV4ryiCk0bvhzq4Y2u8LbbLf
         Q0syN5Lcq6swRbLoQnVpM1fqGFcqXcCnusu18eDVqeW2WuNsQXxOVX0J8E6+aSs0YGxv
         s3FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mXHF0XBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y188si3768954qke.371.2017.08.29.14.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Aug 2017 14:59:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mXHF0XBb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmoXI-0003Bu-Gn
	for alex.bennee@linaro.org; Tue, 29 Aug 2017 17:59:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dmoX7-00039x-2X
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 17:58:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dmoX4-0006pk-Tv
	for qemu-arm@nongnu.org; Tue, 29 Aug 2017 17:58:53 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:33423)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dmoX0-0006no-Hi; Tue, 29 Aug 2017 17:58:46 -0400
Received: by mail-wr0-x244.google.com with SMTP id k94so3100688wrc.0;
	Tue, 29 Aug 2017 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0mMaRvQMLvANVKS8/1TyDDjz1flSBsv3PqyDI0cY/bM=;
	b=mXHF0XBbIbbvkgMvcYeb/ZWwZtqjGtVHKJi/sQzZGr9VyQ/FmNKCLVX59wHjypLmzo
	XPDCnhuABIEkLFhUkuea52hVJZ7jd147aiAZgn65Wt2eiSL5XFmLiMvCFZEd2GYlK718
	o0T+wXuKvMlNxkSkYduVFVAFkiPU+hJU2w9YlCy/zDMTKLmjY3xIwo73raf3jBPNV1li
	ovFGjuCPAVj0cgEDn40odj5dD8DMDeinwGO04masJFiMkuevXJ2WKj3Bmp2cZqcpLZOX
	f3ZEE2IlEuV0pIFvd4LVqq+9eVLVUguCF/rDlJOK6/wXpNMeZYDMTnHp1ID3UYvWXpdh
	zIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0mMaRvQMLvANVKS8/1TyDDjz1flSBsv3PqyDI0cY/bM=;
	b=skvREKzxfVaQiF1/k/r/Nj44nsYVnlnVTeqWfi2ek25rSbJWEfweN9quoQi9Eb5BL7
	UhoCoPu1byQ1HYg3YtivjQoEN8BRVrlsv3iVf3PCT+0g6ZQuX+HYiUlDeeWSce8SLwWR
	N/nohFiKAoE8o6rc/NNL7SKSql5BjjTNmzFi13eg1JnoSfsfSU4IH6fuB9Ms1tCk/Xym
	64ykQd/xqocbqavjIjscpBG6eDgpCZgQdoBkKBtzpTOiyyKyE4Ee6EWwgwxcoc9+NdBP
	w3RoAqcPIhhNmXDOqDHQ9puZ636ha7bV9ruuBQgnKGE0q/G/kdLH3yjWXuXPe3G7bXhr
	PIMw==
X-Gm-Message-State: AHYfb5gyhCuR+q4WoTR+8hi7IOW4sMnX47oDkQGLsAY8cXbJg/mJvP3c
	3gTcez+08I6X71FIdR5aJDVnxYCdUA==
X-Received: by 10.223.163.87 with SMTP id d23mr953124wrb.84.1504043923639;
	Tue, 29 Aug 2017 14:58:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Tue, 29 Aug 2017 14:58:12 -0700 (PDT)
In-Reply-To: <CALHRZuo+Bhp+ps_A0oEgdE7Df+6QSMFt95_nqRijrtbo-SDsWA@mail.gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKNZySCD==0TjOvDjkbWPOk_DR6w2q=MYGutZRQFSmkM6Q@mail.gmail.com>
	<CALHRZuo+Bhp+ps_A0oEgdE7Df+6QSMFt95_nqRijrtbo-SDsWA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 29 Aug 2017 14:58:12 -0700
Message-ID: <CAKmqyKMDf+tn6ghdgyd_4qeWHFvDLko2ob8rY8AGM_FQ_YyL_Q@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
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
X-TUID: 64PmpOuh20FV

On Mon, Aug 28, 2017 at 10:32 PM, sundeep subbaraya
<sundeep.lkml@gmail.com> wrote:
> Hi Alistair,
>
> On Tue, Aug 29, 2017 at 3:23 AM, Alistair Francis <alistair23@gmail.com>
> wrote:
>>
>> On Mon, Aug 28, 2017 at 9:37 AM, Subbaraya Sundeep
>> <sundeep.lkml@gmail.com> wrote:
>> > Modelled System Timer in Microsemi's Smartfusion2 Soc.
>> > Timer has two 32bit down counters and two interrupts.
>> >
>> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>
>> I had already reviewed this patch in v6. As long as you have made all
>> of the changes mentioned their you can add my reviewed-by to the next
>> version (as long as there are no other significant changes).
>>
>> Can you please ensure you do add and keep reviewed-by tags, it's a
>> pain to have to do it multiple times.
>
>
> Sorry I was not aware that I can add reviewed by tag myself and send.

You can't just add them, but if someone has reviewded your patch you
should keep it on that patch.

> I will add your reviewed by since I fixed all your comments.
> Do I need to send another version v8 with your Reviewed-by ?

No it's ok. I'll have a look at the other patches. When you do send a
new version just include them then.

Thanks,
Alistair

>
> Thanks,
> Sundeep
>
>>
>>
>> Thanks,
>> Alistair
>>
>> > ---
>> >  hw/timer/Makefile.objs       |   1 +
>> >  hw/timer/mss-timer.c         | 289
>> > +++++++++++++++++++++++++++++++++++++++++++
>> >  include/hw/timer/mss-timer.h |  64 ++++++++++
>> >  3 files changed, 354 insertions(+)
>> >  create mode 100644 hw/timer/mss-timer.c
>> >  create mode 100644 include/hw/timer/mss-timer.h
>> >
>> > diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>> > index 15cce1c..8c19eac 100644
>> > --- a/hw/timer/Makefile.objs
>> > +++ b/hw/timer/Makefile.objs
>> > @@ -42,3 +42,4 @@ common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
>> >
>> >  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
>> >  common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
>> > +common-obj-$(CONFIG_MSF2) += mss-timer.o
>> > diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
>> > new file mode 100644
>> > index 0000000..60f1213
>> > --- /dev/null
>> > +++ b/hw/timer/mss-timer.c
>> > @@ -0,0 +1,289 @@
>> > +/*
>> > + * Block model of System timer present in
>> > + * Microsemi's SmartFusion2 and SmartFusion SoCs.
>> > + *
>> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
>> > + *
>> > + * Permission is hereby granted, free of charge, to any person
>> > obtaining a copy
>> > + * of this software and associated documentation files (the
>> > "Software"), to deal
>> > + * in the Software without restriction, including without limitation
>> > the rights
>> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> > sell
>> > + * copies of the Software, and to permit persons to whom the Software
>> > is
>> > + * furnished to do so, subject to the following conditions:
>> > + *
>> > + * The above copyright notice and this permission notice shall be
>> > included in
>> > + * all copies or substantial portions of the Software.
>> > + *
>> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> > EXPRESS OR
>> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> > MERCHANTABILITY,
>> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> > SHALL
>> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> > OTHER
>> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> > ARISING FROM,
>> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> > DEALINGS IN
>> > + * THE SOFTWARE.
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "qemu/main-loop.h"
>> > +#include "qemu/log.h"
>> > +#include "hw/timer/mss-timer.h"
>> > +
>> > +#ifndef MSS_TIMER_ERR_DEBUG
>> > +#define MSS_TIMER_ERR_DEBUG  0
>> > +#endif
>> > +
>> > +#define DB_PRINT_L(lvl, fmt, args...) do { \
>> > +    if (MSS_TIMER_ERR_DEBUG >= lvl) { \
>> > +        qemu_log("%s: " fmt "\n", __func__, ## args); \
>> > +    } \
>> > +} while (0);
>> > +
>> > +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> > +
>> > +#define R_TIM_VAL         0
>> > +#define R_TIM_LOADVAL     1
>> > +#define R_TIM_BGLOADVAL   2
>> > +#define R_TIM_CTRL        3
>> > +#define R_TIM_RIS         4
>> > +#define R_TIM_MIS         5
>> > +
>> > +#define TIMER_CTRL_ENBL     (1 << 0)
>> > +#define TIMER_CTRL_ONESHOT  (1 << 1)
>> > +#define TIMER_CTRL_INTR     (1 << 2)
>> > +#define TIMER_RIS_ACK       (1 << 0)
>> > +#define TIMER_RST_CLR       (1 << 6)
>> > +#define TIMER_MODE          (1 << 0)
>> > +
>> > +static void timer_update_irq(struct Msf2Timer *st)
>> > +{
>> > +    bool isr, ier;
>> > +
>> > +    isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
>> > +    ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
>> > +    qemu_set_irq(st->irq, (ier && isr));
>> > +}
>> > +
>> > +static void timer_update(struct Msf2Timer *st)
>> > +{
>> > +    uint64_t count;
>> > +
>> > +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL)) {
>> > +        ptimer_stop(st->ptimer);
>> > +        return;
>> > +    }
>> > +
>> > +    count = st->regs[R_TIM_LOADVAL];
>> > +    ptimer_set_limit(st->ptimer, count, 1);
>> > +    ptimer_run(st->ptimer, 1);
>> > +}
>> > +
>> > +static uint64_t
>> > +timer_read(void *opaque, hwaddr offset, unsigned int size)
>> > +{
>> > +    MSSTimerState *t = opaque;
>> > +    hwaddr addr;
>> > +    struct Msf2Timer *st;
>> > +    uint32_t ret = 0;
>> > +    int timer = 0;
>> > +    int isr;
>> > +    int ier;
>> > +
>> > +    addr = offset >> 2;
>> > +    /*
>> > +     * Two independent timers has same base address.
>> > +     * Based on address passed figure out which timer is being used.
>> > +     */
>> > +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
>> > +        timer = 1;
>> > +        addr -= R_TIM1_MAX;
>> > +    }
>> > +
>> > +    st = &t->timers[timer];
>> > +
>> > +    switch (addr) {
>> > +    case R_TIM_VAL:
>> > +        ret = ptimer_get_count(st->ptimer);
>> > +        break;
>> > +
>> > +    case R_TIM_MIS:
>> > +        isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
>> > +        ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
>> > +        ret = ier & isr;
>> > +        break;
>> > +
>> > +    default:
>> > +        if (addr < R_TIM1_MAX) {
>> > +            ret = st->regs[addr];
>> > +        } else {
>> > +            qemu_log_mask(LOG_GUEST_ERROR,
>> > +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
>> > +            return ret;
>> > +        }
>> > +        break;
>> > +    }
>> > +
>> > +    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32, timer, offset,
>> > +            ret);
>> > +    return ret;
>> > +}
>> > +
>> > +static void
>> > +timer_write(void *opaque, hwaddr offset,
>> > +            uint64_t val64, unsigned int size)
>> > +{
>> > +    MSSTimerState *t = opaque;
>> > +    hwaddr addr;
>> > +    struct Msf2Timer *st;
>> > +    int timer = 0;
>> > +    uint32_t value = val64;
>> > +
>> > +    addr = offset >> 2;
>> > +    /*
>> > +     * Two independent timers has same base address.
>> > +     * Based on addr passed figure out which timer is being used.
>> > +     */
>> > +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
>> > +        timer = 1;
>> > +        addr -= R_TIM1_MAX;
>> > +    }
>> > +
>> > +    st = &t->timers[timer];
>> > +
>> > +    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)",
>> > offset,
>> > +            value, timer);
>> > +
>> > +    switch (addr) {
>> > +    case R_TIM_CTRL:
>> > +        st->regs[R_TIM_CTRL] = value;
>> > +        timer_update(st);
>> > +        break;
>> > +
>> > +    case R_TIM_RIS:
>> > +        if (value & TIMER_RIS_ACK) {
>> > +            st->regs[R_TIM_RIS] &= ~TIMER_RIS_ACK;
>> > +        }
>> > +        break;
>> > +
>> > +    case R_TIM_LOADVAL:
>> > +        st->regs[R_TIM_LOADVAL] = value;
>> > +        if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
>> > +            timer_update(st);
>> > +        }
>> > +        break;
>> > +
>> > +    case R_TIM_BGLOADVAL:
>> > +        st->regs[R_TIM_BGLOADVAL] = value;
>> > +        st->regs[R_TIM_LOADVAL] = value;
>> > +        break;
>> > +
>> > +    case R_TIM_VAL:
>> > +    case R_TIM_MIS:
>> > +        break;
>> > +
>> > +    default:
>> > +        if (addr < R_TIM1_MAX) {
>> > +            st->regs[addr] = value;
>> > +        } else {
>> > +            qemu_log_mask(LOG_GUEST_ERROR,
>> > +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
>> > +            return;
>> > +        }
>> > +        break;
>> > +    }
>> > +    timer_update_irq(st);
>> > +}
>> > +
>> > +static const MemoryRegionOps timer_ops = {
>> > +    .read = timer_read,
>> > +    .write = timer_write,
>> > +    .endianness = DEVICE_NATIVE_ENDIAN,
>> > +    .valid = {
>> > +        .min_access_size = 1,
>> > +        .max_access_size = 4
>> > +    }
>> > +};
>> > +
>> > +static void timer_hit(void *opaque)
>> > +{
>> > +    struct Msf2Timer *st = opaque;
>> > +
>> > +    st->regs[R_TIM_RIS] |= TIMER_RIS_ACK;
>> > +
>> > +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ONESHOT)) {
>> > +        timer_update(st);
>> > +    }
>> > +    timer_update_irq(st);
>> > +}
>> > +
>> > +static void mss_timer_init(Object *obj)
>> > +{
>> > +    MSSTimerState *t = MSS_TIMER(obj);
>> > +    int i;
>> > +
>> > +    /* Init all the ptimers.  */
>> > +    for (i = 0; i < NUM_TIMERS; i++) {
>> > +        struct Msf2Timer *st = &t->timers[i];
>> > +
>> > +        st->bh = qemu_bh_new(timer_hit, st);
>> > +        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
>> > +        ptimer_set_freq(st->ptimer, t->freq_hz);
>> > +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
>> > +    }
>> > +
>> > +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
>> > TYPE_MSS_TIMER,
>> > +                          NUM_TIMERS * R_TIM1_MAX * 4);
>> > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
>> > +}
>> > +
>> > +static const VMStateDescription vmstate_timers = {
>> > +    .name = "mss-timer-block",
>> > +    .version_id = 1,
>> > +    .minimum_version_id = 1,
>> > +    .fields = (VMStateField[]) {
>> > +        VMSTATE_PTIMER(ptimer, struct Msf2Timer),
>> > +        VMSTATE_UINT32_ARRAY(regs, struct Msf2Timer, R_TIM1_MAX),
>> > +        VMSTATE_END_OF_LIST()
>> > +    }
>> > +};
>> > +
>> > +static const VMStateDescription vmstate_mss_timer = {
>> > +    .name = TYPE_MSS_TIMER,
>> > +    .version_id = 1,
>> > +    .minimum_version_id = 1,
>> > +    .fields = (VMStateField[]) {
>> > +        VMSTATE_UINT32(freq_hz, MSSTimerState),
>> > +        VMSTATE_STRUCT_ARRAY(timers, MSSTimerState, NUM_TIMERS, 0,
>> > +                vmstate_timers, struct Msf2Timer),
>> > +        VMSTATE_END_OF_LIST()
>> > +    }
>> > +};
>> > +
>> > +static Property mss_timer_properties[] = {
>> > +    /* Libero GUI shows 100Mhz as default for clocks */
>> > +    DEFINE_PROP_UINT32("clock-frequency", MSSTimerState, freq_hz,
>> > +                      100 * 1000000),
>> > +    DEFINE_PROP_END_OF_LIST(),
>> > +};
>> > +
>> > +static void mss_timer_class_init(ObjectClass *klass, void *data)
>> > +{
>> > +    DeviceClass *dc = DEVICE_CLASS(klass);
>> > +
>> > +    dc->props = mss_timer_properties;
>> > +    dc->vmsd = &vmstate_mss_timer;
>> > +}
>> > +
>> > +static const TypeInfo mss_timer_info = {
>> > +    .name          = TYPE_MSS_TIMER,
>> > +    .parent        = TYPE_SYS_BUS_DEVICE,
>> > +    .instance_size = sizeof(MSSTimerState),
>> > +    .instance_init = mss_timer_init,
>> > +    .class_init    = mss_timer_class_init,
>> > +};
>> > +
>> > +static void mss_timer_register_types(void)
>> > +{
>> > +    type_register_static(&mss_timer_info);
>> > +}
>> > +
>> > +type_init(mss_timer_register_types)
>> > diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
>> > new file mode 100644
>> > index 0000000..d15d173
>> > --- /dev/null
>> > +++ b/include/hw/timer/mss-timer.h
>> > @@ -0,0 +1,64 @@
>> > +/*
>> > + * Microsemi SmartFusion2 Timer.
>> > + *
>> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> > + *
>> > + * Permission is hereby granted, free of charge, to any person
>> > obtaining a copy
>> > + * of this software and associated documentation files (the
>> > "Software"), to deal
>> > + * in the Software without restriction, including without limitation
>> > the rights
>> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> > sell
>> > + * copies of the Software, and to permit persons to whom the Software
>> > is
>> > + * furnished to do so, subject to the following conditions:
>> > + *
>> > + * The above copyright notice and this permission notice shall be
>> > included in
>> > + * all copies or substantial portions of the Software.
>> > + *
>> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> > EXPRESS OR
>> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> > MERCHANTABILITY,
>> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> > SHALL
>> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> > OTHER
>> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> > ARISING FROM,
>> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> > DEALINGS IN
>> > + * THE SOFTWARE.
>> > + */
>> > +
>> > +#ifndef HW_MSS_TIMER_H
>> > +#define HW_MSS_TIMER_H
>> > +
>> > +#include "hw/sysbus.h"
>> > +#include "hw/ptimer.h"
>> > +
>> > +#define TYPE_MSS_TIMER     "mss-timer"
>> > +#define MSS_TIMER(obj)     OBJECT_CHECK(MSSTimerState, \
>> > +                              (obj), TYPE_MSS_TIMER)
>> > +
>> > +/*
>> > + * There are two 32-bit down counting timers.
>> > + * Timers 1 and 2 can be concatenated into a single 64-bit Timer
>> > + * that operates either in Periodic mode or in One-shot mode.
>> > + * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit
>> > mode.
>> > + * In 64-bit mode, writing to the 32-bit registers has no effect.
>> > + * Similarly, in 32-bit mode, writing to the 64-bit mode registers
>> > + * has no effect. Only two 32-bit timers are supported currently.
>> > + */
>> > +#define NUM_TIMERS        2
>> > +
>> > +#define R_TIM1_MAX        6
>> > +
>> > +struct Msf2Timer {
>> > +    QEMUBH *bh;
>> > +    ptimer_state *ptimer;
>> > +
>> > +    uint32_t regs[R_TIM1_MAX];
>> > +    qemu_irq irq;
>> > +};
>> > +
>> > +typedef struct MSSTimerState {
>> > +    SysBusDevice parent_obj;
>> > +
>> > +    MemoryRegion mmio;
>> > +    uint32_t freq_hz;
>> > +    struct Msf2Timer timers[NUM_TIMERS];
>> > +} MSSTimerState;
>> > +
>> > +#endif /* HW_MSS_TIMER_H */
>> > --
>> > 2.5.0
>> >
>
>

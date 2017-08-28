Received: by 10.223.188.70 with SMTP id a6csp5049072wrh;
        Mon, 28 Aug 2017 14:54:47 -0700 (PDT)
X-Received: by 10.200.26.150 with SMTP id x22mr2947181qtj.121.1503957287115;
        Mon, 28 Aug 2017 14:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503957287; cv=none;
        d=google.com; s=arc-20160816;
        b=qQmo7bpncAwoR7xHm7pthYDBDXrlIss0B7hE1LfMXG7PzDAp+SSViUwDhCUi3I1NL4
         xcpVI/cJ2mdP2KshwsdFu+J/JFR4Xd9QCWYbriHtDthdKuLGHSVMxVLraVp9J0GpznqG
         b5H8fs+8nTizFZneYA+6uTLDaWfmc7JoOsF4/H9KtOFPq3Btz4EypZhvSBO+MIRJifNa
         6aLG/FsIaIf3INLPo5VncfrlvF3nB7fHAqBCldHNc9JJvRIMlYDWwkHedeVK6h1ioWwV
         t51oevuHxv4LTnmuPyol5IJKiafNJr+aGI1PGvgnRWscSBv/4LsjuL/inf8ypJLYzsED
         zPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=efiokcck4c44RGaGW1ffsSjJ0PciYGBZoeGcb7lfxZM=;
        b=McTXmuw32Fv5SOhFrDiHFMcxlpfNrjRIDtasmaQC//KDoxKA0PT2dEXwhw9OJQM/Cb
         EJwy7DE0vI6bdpGAzlRs9iXypqWGtwhosiCTFmaXBQs4KMxkSouGCMBqsHxxjY+0Hcmk
         pu3gS22mb6YPDIbogI7rh4al9u4RoBoSYxegh02iiam1kpO4YLYSwCieNdUQHnGCLDM4
         mXoNbCSNOkupKwEe3gQSJTw8LL+2B3THhFuf5nRQ0lCLsOJc0G5XrsSOe9KMa9VHKaIE
         PPpDlEvrZy+9vzVhgl4w+giASZ+k/iJmtxI+2FPKy+vXTSsXjq064ds1z7xG3OFls0cf
         RKIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xa3LSXdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d184si1304547qkc.324.2017.08.28.14.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Aug 2017 14:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xa3LSXdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dmRzY-0001lO-NW
	for alex.bennee@linaro.org; Mon, 28 Aug 2017 17:54:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52974)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dmRzQ-0001jW-Qz
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 17:54:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dmRzO-0000td-TU
	for qemu-arm@nongnu.org; Mon, 28 Aug 2017 17:54:36 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:35107)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dmRzJ-0000qh-4b; Mon, 28 Aug 2017 17:54:30 -0400
Received: by mail-wr0-x241.google.com with SMTP id a47so1140393wra.2;
	Mon, 28 Aug 2017 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=efiokcck4c44RGaGW1ffsSjJ0PciYGBZoeGcb7lfxZM=;
	b=Xa3LSXdJtO0eSgiyxJm5/zNZffws525xSQ1VZRtoH6ehh+MA8klmf3+5o+AKK/2Vlg
	8Yqt11JJhh5VU4wSpOwC3TpTic85jfkxF0NkS5ukCLU7nsYUWiepGHbh+bzmVYyPMDj2
	NOPSAKufCNLXLGemguA4ob16x1kvTpqcz8GRh+FKO1N7Jugj6evUHFrnbsB99poTB6df
	6bptu3l4P273zmy4OgUbDK3lTCSZRzHjvI/1hpQRelbaBYCr3CUiR/k3Un3d0VLVupLt
	lskoJgniMjcy+2QOSJ5rerddnoU95lS/+aXY3yh7ZuRdayshxOIX3wlMxGNiBm9kdERW
	LUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=efiokcck4c44RGaGW1ffsSjJ0PciYGBZoeGcb7lfxZM=;
	b=taRFAAdMNec3aE/Df9raKHzAsSJIz1tkfIBdhit2dUWLPr99hm9E0iXvw05PNioYuz
	OzET10hQRjn1iEooSNwsR9dhvttiNCwFtBKxr3YovTY9MHX91hv7SZgSC+HMF0acZXka
	5h7vtB0YC74ISiDqz40UESsXzaThuCxyGy+XcUVZK/WTl3yKGnHkGXjfPrA6kUa4lzZf
	4t35LxW1ZuCi8wqFiv+zPbGRzNSqyEgLnSDz/K2ie5LtIP8BIaTh40b85hkadjrEdLFw
	aKuPuRkC3NKluu9kmnQxkZrG+3xfmR3j5ZmwaMijXjAmF/aA0YOdkaVNjBRPkvGJW+6C
	HU6g==
X-Gm-Message-State: AHYfb5gNLinpA3R4xr+sh1cp1mdZgqWZNxV7MF/ymk6RblmAD4ttyTvT
	k2cuIim+5/qY/Sj7suAWRL1OpyL18A==
X-Received: by 10.223.163.87 with SMTP id d23mr1115054wrb.84.1503957265872;
	Mon, 28 Aug 2017 14:54:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Mon, 28 Aug 2017 14:53:55 -0700 (PDT)
In-Reply-To: <1503938283-12404-2-git-send-email-sundeep.lkml@gmail.com>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-2-git-send-email-sundeep.lkml@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 28 Aug 2017 14:53:55 -0700
Message-ID: <CAKmqyKNZySCD==0TjOvDjkbWPOk_DR6w2q=MYGutZRQFSmkM6Q@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
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
X-TUID: BdliQPpu1oX8

On Mon, Aug 28, 2017 at 9:37 AM, Subbaraya Sundeep
<sundeep.lkml@gmail.com> wrote:
> Modelled System Timer in Microsemi's Smartfusion2 Soc.
> Timer has two 32bit down counters and two interrupts.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>

I had already reviewed this patch in v6. As long as you have made all
of the changes mentioned their you can add my reviewed-by to the next
version (as long as there are no other significant changes).

Can you please ensure you do add and keep reviewed-by tags, it's a
pain to have to do it multiple times.

Thanks,
Alistair

> ---
>  hw/timer/Makefile.objs       |   1 +
>  hw/timer/mss-timer.c         | 289 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/timer/mss-timer.h |  64 ++++++++++
>  3 files changed, 354 insertions(+)
>  create mode 100644 hw/timer/mss-timer.c
>  create mode 100644 include/hw/timer/mss-timer.h
>
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index 15cce1c..8c19eac 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -42,3 +42,4 @@ common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
>
>  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
>  common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
> +common-obj-$(CONFIG_MSF2) += mss-timer.o
> diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
> new file mode 100644
> index 0000000..60f1213
> --- /dev/null
> +++ b/hw/timer/mss-timer.c
> @@ -0,0 +1,289 @@
> +/*
> + * Block model of System timer present in
> + * Microsemi's SmartFusion2 and SmartFusion SoCs.
> + *
> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/log.h"
> +#include "hw/timer/mss-timer.h"
> +
> +#ifndef MSS_TIMER_ERR_DEBUG
> +#define MSS_TIMER_ERR_DEBUG  0
> +#endif
> +
> +#define DB_PRINT_L(lvl, fmt, args...) do { \
> +    if (MSS_TIMER_ERR_DEBUG >= lvl) { \
> +        qemu_log("%s: " fmt "\n", __func__, ## args); \
> +    } \
> +} while (0);
> +
> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
> +
> +#define R_TIM_VAL         0
> +#define R_TIM_LOADVAL     1
> +#define R_TIM_BGLOADVAL   2
> +#define R_TIM_CTRL        3
> +#define R_TIM_RIS         4
> +#define R_TIM_MIS         5
> +
> +#define TIMER_CTRL_ENBL     (1 << 0)
> +#define TIMER_CTRL_ONESHOT  (1 << 1)
> +#define TIMER_CTRL_INTR     (1 << 2)
> +#define TIMER_RIS_ACK       (1 << 0)
> +#define TIMER_RST_CLR       (1 << 6)
> +#define TIMER_MODE          (1 << 0)
> +
> +static void timer_update_irq(struct Msf2Timer *st)
> +{
> +    bool isr, ier;
> +
> +    isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
> +    ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
> +    qemu_set_irq(st->irq, (ier && isr));
> +}
> +
> +static void timer_update(struct Msf2Timer *st)
> +{
> +    uint64_t count;
> +
> +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL)) {
> +        ptimer_stop(st->ptimer);
> +        return;
> +    }
> +
> +    count = st->regs[R_TIM_LOADVAL];
> +    ptimer_set_limit(st->ptimer, count, 1);
> +    ptimer_run(st->ptimer, 1);
> +}
> +
> +static uint64_t
> +timer_read(void *opaque, hwaddr offset, unsigned int size)
> +{
> +    MSSTimerState *t = opaque;
> +    hwaddr addr;
> +    struct Msf2Timer *st;
> +    uint32_t ret = 0;
> +    int timer = 0;
> +    int isr;
> +    int ier;
> +
> +    addr = offset >> 2;
> +    /*
> +     * Two independent timers has same base address.
> +     * Based on address passed figure out which timer is being used.
> +     */
> +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
> +        timer = 1;
> +        addr -= R_TIM1_MAX;
> +    }
> +
> +    st = &t->timers[timer];
> +
> +    switch (addr) {
> +    case R_TIM_VAL:
> +        ret = ptimer_get_count(st->ptimer);
> +        break;
> +
> +    case R_TIM_MIS:
> +        isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
> +        ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
> +        ret = ier & isr;
> +        break;
> +
> +    default:
> +        if (addr < R_TIM1_MAX) {
> +            ret = st->regs[addr];
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
> +            return ret;
> +        }
> +        break;
> +    }
> +
> +    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32, timer, offset,
> +            ret);
> +    return ret;
> +}
> +
> +static void
> +timer_write(void *opaque, hwaddr offset,
> +            uint64_t val64, unsigned int size)
> +{
> +    MSSTimerState *t = opaque;
> +    hwaddr addr;
> +    struct Msf2Timer *st;
> +    int timer = 0;
> +    uint32_t value = val64;
> +
> +    addr = offset >> 2;
> +    /*
> +     * Two independent timers has same base address.
> +     * Based on addr passed figure out which timer is being used.
> +     */
> +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
> +        timer = 1;
> +        addr -= R_TIM1_MAX;
> +    }
> +
> +    st = &t->timers[timer];
> +
> +    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)", offset,
> +            value, timer);
> +
> +    switch (addr) {
> +    case R_TIM_CTRL:
> +        st->regs[R_TIM_CTRL] = value;
> +        timer_update(st);
> +        break;
> +
> +    case R_TIM_RIS:
> +        if (value & TIMER_RIS_ACK) {
> +            st->regs[R_TIM_RIS] &= ~TIMER_RIS_ACK;
> +        }
> +        break;
> +
> +    case R_TIM_LOADVAL:
> +        st->regs[R_TIM_LOADVAL] = value;
> +        if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
> +            timer_update(st);
> +        }
> +        break;
> +
> +    case R_TIM_BGLOADVAL:
> +        st->regs[R_TIM_BGLOADVAL] = value;
> +        st->regs[R_TIM_LOADVAL] = value;
> +        break;
> +
> +    case R_TIM_VAL:
> +    case R_TIM_MIS:
> +        break;
> +
> +    default:
> +        if (addr < R_TIM1_MAX) {
> +            st->regs[addr] = value;
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
> +            return;
> +        }
> +        break;
> +    }
> +    timer_update_irq(st);
> +}
> +
> +static const MemoryRegionOps timer_ops = {
> +    .read = timer_read,
> +    .write = timer_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 4
> +    }
> +};
> +
> +static void timer_hit(void *opaque)
> +{
> +    struct Msf2Timer *st = opaque;
> +
> +    st->regs[R_TIM_RIS] |= TIMER_RIS_ACK;
> +
> +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ONESHOT)) {
> +        timer_update(st);
> +    }
> +    timer_update_irq(st);
> +}
> +
> +static void mss_timer_init(Object *obj)
> +{
> +    MSSTimerState *t = MSS_TIMER(obj);
> +    int i;
> +
> +    /* Init all the ptimers.  */
> +    for (i = 0; i < NUM_TIMERS; i++) {
> +        struct Msf2Timer *st = &t->timers[i];
> +
> +        st->bh = qemu_bh_new(timer_hit, st);
> +        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
> +        ptimer_set_freq(st->ptimer, t->freq_hz);
> +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
> +    }
> +
> +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, TYPE_MSS_TIMER,
> +                          NUM_TIMERS * R_TIM1_MAX * 4);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
> +}
> +
> +static const VMStateDescription vmstate_timers = {
> +    .name = "mss-timer-block",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_PTIMER(ptimer, struct Msf2Timer),
> +        VMSTATE_UINT32_ARRAY(regs, struct Msf2Timer, R_TIM1_MAX),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_mss_timer = {
> +    .name = TYPE_MSS_TIMER,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(freq_hz, MSSTimerState),
> +        VMSTATE_STRUCT_ARRAY(timers, MSSTimerState, NUM_TIMERS, 0,
> +                vmstate_timers, struct Msf2Timer),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static Property mss_timer_properties[] = {
> +    /* Libero GUI shows 100Mhz as default for clocks */
> +    DEFINE_PROP_UINT32("clock-frequency", MSSTimerState, freq_hz,
> +                      100 * 1000000),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void mss_timer_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->props = mss_timer_properties;
> +    dc->vmsd = &vmstate_mss_timer;
> +}
> +
> +static const TypeInfo mss_timer_info = {
> +    .name          = TYPE_MSS_TIMER,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(MSSTimerState),
> +    .instance_init = mss_timer_init,
> +    .class_init    = mss_timer_class_init,
> +};
> +
> +static void mss_timer_register_types(void)
> +{
> +    type_register_static(&mss_timer_info);
> +}
> +
> +type_init(mss_timer_register_types)
> diff --git a/include/hw/timer/mss-timer.h b/include/hw/timer/mss-timer.h
> new file mode 100644
> index 0000000..d15d173
> --- /dev/null
> +++ b/include/hw/timer/mss-timer.h
> @@ -0,0 +1,64 @@
> +/*
> + * Microsemi SmartFusion2 Timer.
> + *
> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#ifndef HW_MSS_TIMER_H
> +#define HW_MSS_TIMER_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/ptimer.h"
> +
> +#define TYPE_MSS_TIMER     "mss-timer"
> +#define MSS_TIMER(obj)     OBJECT_CHECK(MSSTimerState, \
> +                              (obj), TYPE_MSS_TIMER)
> +
> +/*
> + * There are two 32-bit down counting timers.
> + * Timers 1 and 2 can be concatenated into a single 64-bit Timer
> + * that operates either in Periodic mode or in One-shot mode.
> + * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit mode.
> + * In 64-bit mode, writing to the 32-bit registers has no effect.
> + * Similarly, in 32-bit mode, writing to the 64-bit mode registers
> + * has no effect. Only two 32-bit timers are supported currently.
> + */
> +#define NUM_TIMERS        2
> +
> +#define R_TIM1_MAX        6
> +
> +struct Msf2Timer {
> +    QEMUBH *bh;
> +    ptimer_state *ptimer;
> +
> +    uint32_t regs[R_TIM1_MAX];
> +    qemu_irq irq;
> +};
> +
> +typedef struct MSSTimerState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +    uint32_t freq_hz;
> +    struct Msf2Timer timers[NUM_TIMERS];
> +} MSSTimerState;
> +
> +#endif /* HW_MSS_TIMER_H */
> --
> 2.5.0
>

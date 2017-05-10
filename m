Received: by 10.25.0.6 with SMTP id 6csp189357lfa;
        Wed, 10 May 2017 02:41:45 -0700 (PDT)
X-Received: by 10.200.1.142 with SMTP id x14mr4918024qtf.26.1494409305443;
        Wed, 10 May 2017 02:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494409305; cv=none;
        d=google.com; s=arc-20160816;
        b=DuQoKDhcEzJlDwbJR+DDX1lN+ZgwkKWMbwZY3+YwpLymgHiw0oiGhOEP2b6Wkczz/9
         dFIFud897yzLia0OWL38y2Ey6jYfkPv3fXmS5kk1Zy8ffMajGqjez9AbTXeWd326XRgE
         Xt4v7CP3Yz23OnDB0Yq/LYGdXFu+Ez0UF5yT9cUQkAoAIdhj0GVDFDiwQNKR3turF3Jx
         cxuKo0AtMoLlcKObMqqvJ9y+3TdFHlbfpnAhk63PCZk49YCE2eVwWb8rdoCLUPFy92mS
         Yjyo946QBsn6CMCD1YGaswZPuT+VPg716AjIIqWDEblLHxRMqWpC8HSFI4MIHqT2Fo6Q
         H7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=VizpRXcG6/m9kG/Naw+mjGyFeDuDYaO3aZ5JCe3bIiM=;
        b=Tq1clEIsSzZdW1lpNERw/lefrNE94IkVgvbXf67GbsmOjguFD8R498LSwgkDV+LJP1
         H0SMxteXuuYQApfQi7kG/cd2w5n7FhIrSjb7Meb+Zlm/IX+/gJrXM6wgvcxicW7alsxg
         nXgN51pjFPNu0slUnXr/mL/dNZ1jU2OiKcOxygM63zBVOYE94IbFacOmz02ud8zLDI+g
         AsEWcFkdmVL0tCEOyf9xwvfTbZeHLUNiF09wjnCZX3vnTbM1pifTcX2a/RU5CLXbG7kS
         Lp0meXLDCMbTeMCFYE/FNrLxmnQu1/T7TiFTvnOCcLBHvqtbSG1ueitKTXACPGOsOh9n
         jf7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r15si2677039qta.2.2017.05.10.02.41.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 02:41:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41438 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8O7s-0006PT-Re
	for alex.bennee@linaro.org; Wed, 10 May 2017 05:41:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8O7j-0006P7-TH
	for qemu-arm@nongnu.org; Wed, 10 May 2017 05:41:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8O7e-0005Fm-Uw
	for qemu-arm@nongnu.org; Wed, 10 May 2017 05:41:35 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:32807)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8O7e-0005FT-Or; Wed, 10 May 2017 05:41:30 -0400
Received: by mail-qt0-x243.google.com with SMTP id a46so3359624qte.0;
	Wed, 10 May 2017 02:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=VizpRXcG6/m9kG/Naw+mjGyFeDuDYaO3aZ5JCe3bIiM=;
	b=CwgvZVxMAOs1a4fmFyYqkCLJFekkMgqa9nLLZKOBLWHUFPm0xOfPqA6vHHMs1dajd4
	UXhrF/8EkYcCGTotvY3MtaUP+5wAO+Vlm5yQI9JCPRhoxLlS5eKR8gaiO+oik08q9wV6
	zkPoQRPehJawNj/gQEPtcECudy4FnhzCuFBLreCPc0Ouco+rMyDuI32R8lwVWNUQcM+I
	M2Ml5efm5sTNDwx+66r6b3DxCUVZD02R5XEBiaVPAxIhBhsT4JDARstvZ0gVuCDmxitz
	IN5foRgPcze4d5oneptKiNfRoaMyMIf06K1X3LSzbn0VYg4o/1BY4xuizAAKO2RQg27r
	YhsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=VizpRXcG6/m9kG/Naw+mjGyFeDuDYaO3aZ5JCe3bIiM=;
	b=QN4O28noOA4fGW73BCv14KlBkR1FgO4ju8WPOl3N0dCn0an1xOetQ+TNQLLjrnbtre
	Xf5My0RWV5JBhYtbapJyw2Onezmar/CqhHUEIVFoMxp9zSnXHEgfipDglyA+j7x4KUHN
	EXSFnbso74qVOJn9vzzZlHGzvuapEo+wsojnc71TV8pUfUPz9z0dsJNFKKqeRkAs1kRx
	mYGaN9dCgPkitKi7ojqVpPwUP9UjVAN5t/WL+cP4cvbEQFjyf71IpFAKTXQquhsosA0c
	P/HwuSzhVoo91TBH2fsy1TmtgQLyCjw1QF9USBaUrA2KFC7kleknfV/W/i0+BsYkObRi
	lhTA==
X-Gm-Message-State: AODbwcBdRZjcdoidfWL+ySKfRcqRgESvaxvi6qpgbHWQmmtelwLmNgBW
	NlT1GavY/OnB1w==
X-Received: by 10.200.53.77 with SMTP id z13mr4489053qtb.184.1494409289590;
	Wed, 10 May 2017 02:41:29 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	t35sm1759128qta.62.2017.05.10.02.41.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 02:41:28 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-2-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e87597ba-4759-76a5-7b0d-3297d2eb8f79@amsat.org>
Date: Wed, 10 May 2017 06:41:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494348286-10253-2-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [Qemu-devel PATCH 1/5] msf2: Add Smartfusion2 System
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
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nr1O34chp0AC

Hi Subbaraya, nice work!

The timer you are modeling is the mss_timer, which is in particular used 
in the smartfusion2, I'd rather name it mss_timer.c so it can be reused 
by other SoC models.

I added few comments.

On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
> Modelled System Timer in Microsemi's Smartfusion2 Soc.
> Timer has two 32bit down counters and two interrupts.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  hw/timer/Makefile.objs        |   1 +
>  hw/timer/msf2-timer.c         | 252 ++++++++++++++++++++++++++++++++++++++++++
>  include/hw/timer/msf2-timer.h |  85 ++++++++++++++
>  3 files changed, 338 insertions(+)
>  create mode 100644 hw/timer/msf2-timer.c
>  create mode 100644 include/hw/timer/msf2-timer.h
>
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index dd6f27e..bd1ff15 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
>  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
>
>  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
> +common-obj-$(CONFIG_MSF2) += msf2-timer.o
> diff --git a/hw/timer/msf2-timer.c b/hw/timer/msf2-timer.c
> new file mode 100644
> index 0000000..466faa6
> --- /dev/null
> +++ b/hw/timer/msf2-timer.c
> @@ -0,0 +1,252 @@
> +/*
> + * Timer block model of Microsemi SmartFusion2.
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
> +#include "hw/timer/msf2-timer.h"
> +
> +#ifndef MSF2_TIMER_ERR_DEBUG
> +#define MSF2_TIMER_ERR_DEBUG  0
> +#endif
> +
> +#define DB_PRINT_L(lvl, fmt, args...) do { \
> +    if (MSF2_TIMER_ERR_DEBUG >= lvl) { \
> +        qemu_log("%s: " fmt, __func__, ## args); \
> +    } \
> +} while (0);
> +
> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
> +
> +static void timer_update_irq(struct Msf2Timer *st)
> +{
> +    bool isr, ier;
> +
> +    isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
> +    ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
> +
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
> +timer_read(void *opaque, hwaddr addr, unsigned int size)
> +{
> +    MSF2TimerState *t = opaque;
> +    struct Msf2Timer *st;
> +    uint32_t ret = 0;
> +    int timer = 0;
> +    int isr;
> +    int ier;
> +
> +    addr >>= 2;
> +    /*
> +     * Two independent timers has same base address.
> +     * Based on addr passed figure out which timer is being used.
> +     */
> +    if (addr >= R_TIM1_MAX) {
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
> +        if (addr < ARRAY_SIZE(st->regs)) {
> +            ret = st->regs[addr];
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
> +                         addr * 4);
> +        }
> +        break;
> +    }
> +
> +    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32 "\n", timer, addr * 4,
> +            ret);
> +    return ret;
> +}
> +
> +static void
> +timer_write(void *opaque, hwaddr addr,
> +            uint64_t val64, unsigned int size)
> +{
> +    MSF2TimerState *t = opaque;
> +    struct Msf2Timer *st;
> +    int timer = 0;
> +    uint32_t value = val64;
> +
> +    addr >>= 2;
> +    /*
> +     * Two independent timers has same base address.
> +     * Based on addr passed figure out which timer is being used.
> +     */
> +    if (addr >= R_TIM1_MAX) {
> +        timer = 1;
> +        addr -= R_TIM1_MAX;

This is only valid if addr < (NUM_TIMERS * R_TIM1_MAX).

> +    }
> +
> +    st = &t->timers[timer];
> +
> +    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)\n", addr * 4,
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
> +    case R_TIM_MODE:

This case is never reached, if the guest wanted to access register 21, 
since 21 >= R_TIM1_MAX you have now addr = 21 - R_TIM1_MAX = 15.

> +        if (value & TIMER_MODE) {
> +            qemu_log_mask(LOG_UNIMP, "64-bit mode not supported\n");

No need of trailing '\n', be more specific, something like:

     qemu_log_mask(LOG_UNIMP, TYPE_MSF2_TIMER ": 64-bit mode not 
supported");

> +        }
> +        break;
> +
> +    default:

Once the issue "addr -= R_TIM1_MAX" is fixed, this default will catch 
registers 12 .. 20 silently while there are unimplemented!
I'd rather catch them altogether and log some "64-bit mode not supported".

> +        if (addr < ARRAY_SIZE(st->regs)) {
> +            st->regs[addr] = value;
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__,
> +                         addr * 4);
> +        }
> +        break;
> +    }
> +    timer_update_irq(st);

Here if addr >= (NUM_TIMERS * R_TIM1_MAX) you still update Timer1 IRQ, 
while this is unharmful right now this is likely to be break later.

> +}
> +
> +static const MemoryRegionOps timer_ops = {
> +    .read = timer_read,
> +    .write = timer_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,

I believe min_access_size = 1 is valid for any APB device.

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
> +static void msf2_timer_init(Object *obj)
> +{
> +    MSF2TimerState *t = MSF2_TIMER(obj);
> +    int i;
> +
> +    /* Init all the ptimers.  */
> +    t->timers = g_malloc0((sizeof t->timers[0]) * NUM_TIMERS);
> +    for (i = 0; i < NUM_TIMERS; i++) {
> +        struct Msf2Timer *st = &t->timers[i];
> +
> +        st->bh = qemu_bh_new(timer_hit, st);
> +        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
> +        ptimer_set_freq(st->ptimer, t->freq_hz);
> +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
> +    }
> +
> +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, TYPE_MSF2_TIMER,
> +                          R_TIM_MAX * 4);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
> +}
> +
> +static Property msf2_timer_properties[] = {
> +    DEFINE_PROP_UINT32("clock-frequency", MSF2TimerState, freq_hz,
> +                       MSF2_TIMER_FREQ),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void msf2_timer_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->props = msf2_timer_properties;
> +}
> +
> +static const TypeInfo msf2_timer_info = {
> +    .name          = TYPE_MSF2_TIMER,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(MSF2TimerState),
> +    .instance_init = msf2_timer_init,
> +    .class_init    = msf2_timer_class_init,
> +};
> +
> +static void msf2_timer_register_types(void)
> +{
> +    type_register_static(&msf2_timer_info);
> +}
> +
> +type_init(msf2_timer_register_types)
> diff --git a/include/hw/timer/msf2-timer.h b/include/hw/timer/msf2-timer.h
> new file mode 100644
> index 0000000..10eb2f8
> --- /dev/null
> +++ b/include/hw/timer/msf2-timer.h
> @@ -0,0 +1,85 @@
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
> +#ifndef HW_MSF2_TIMER_H
> +#define HW_MSF2_TIMER_H
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/ptimer.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/log.h"
> +
> +#define TYPE_MSF2_TIMER     "msf2-timer"
> +#define MSF2_TIMER(obj)     OBJECT_CHECK(MSF2TimerState, \
> +                              (obj), TYPE_MSF2_TIMER)
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
> +#define MSF2_TIMER_FREQ   (83 * 1000000)

I can not find this value, can you point me to the datasheet? It seems 
SoC specific to me.

> +
> +#define R_TIM_VAL         0
> +#define R_TIM_LOADVAL     1
> +#define R_TIM_BGLOADVAL   2
> +#define R_TIM_CTRL        3
> +#define R_TIM_RIS         4
> +#define R_TIM_MIS         5
> +#define R_TIM1_MAX        6
> +
> +#define R_TIM_MODE       21
> +#define R_TIM_MAX        22 /* including 64-bit timer registers */
> +
> +#define TIMER_CTRL_ENBL     (1 << 0)
> +#define TIMER_CTRL_ONESHOT  (1 << 1)
> +#define TIMER_CTRL_INTR     (1 << 2)
> +#define TIMER_RIS_ACK       (1 << 0)
> +#define TIMER_RST_CLR       (1 << 6)
> +#define TIMER_MODE          (1 << 0)
> +
> +struct Msf2Timer {
> +    QEMUBH *bh;
> +    ptimer_state *ptimer;
> +
> +    uint32_t regs[R_TIM_MAX];
> +    qemu_irq irq;
> +};
> +
> +typedef struct MSF2TimerState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +    uint32_t freq_hz;
> +    struct Msf2Timer *timers;
> +} MSF2TimerState;
> +
> +#endif /* HW_MSF2_TIMER_H */

Regards,

Phil.

Received: by 10.25.0.6 with SMTP id 6csp1799119lfa;
        Tue, 30 May 2017 05:43:52 -0700 (PDT)
X-Received: by 10.55.111.198 with SMTP id k189mr21406803qkc.160.1496148232827;
        Tue, 30 May 2017 05:43:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496148232; cv=none;
        d=google.com; s=arc-20160816;
        b=CGT0B9iVYfomlytHe1PTDsNsTo8BQ7Vxfdkc/FEE2ygTR6+W7Szct5BdYZWB1l+oNn
         W0aHbtoTbsKM57U5iWFznQIyVIL7GfCs+bozvUQ56I4dsotDzk35FB0Bod622JzNxXyl
         Bhg+dQEThryyahVOb2vNo9/yjsUjRh7RL3/dBnas1CWOJKsdNdKuiuS+mT8mx/JtiK+T
         ZkY8EiucgEXZrLEuH9xC8sCL92R7s9eokmMfoi/lxVoCA2+YwcuUJo1Y4LfQTj5WGbek
         9MDdN4BClTaGeiCbe2RxdSVq9hWNjHq0jJrKFFwH8kv6GEOyHojHxlAvj1cJBY+Ho7vw
         ofsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:dkim-signature
         :arc-authentication-results;
        bh=1cUpoPpxUNAeY3NmPU+Ko+E/1RW4aUQGJ/nJRujDJwo=;
        b=IwraXOm+m4XLgV6u76Ky9fNfAXDtgPiy+rANWhz+K+IAlv38A78Kfi4Rx9qmtXs+v1
         mY3wvgFRXnTyAARVpQ90BByv+rxOLBhu+7QiWdb6vakOHwe0amjhLLPyJEAaaXQFpKSZ
         ME3mSveYOCjc1e9IXoNv8jPuE/nXzGPfEKz7+0J4NnY9oMqlW5vGxbQ6mKJiKXZh6F1k
         MpiUgwu6FdlBlw4REPXeaFjpKmvlzKBS6IWG3asjZWvJuv5tKDPPqd8ER6A9w8DC0oot
         Me9CY7fwKDSss6hMh38jpxUGOW4xm51MRuRvi2Ocw+wbEEHsxYrJcOXJ4TBHOJIiny+4
         bemw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q84si8588535qki.124.2017.05.30.05.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 05:43:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFgV6-0006sp-Ag
	for alex.bennee@linaro.org; Tue, 30 May 2017 08:43:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFgUw-0006r5-SL
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:43:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFgUt-0003iC-OA
	for qemu-arm@nongnu.org; Tue, 30 May 2017 08:43:42 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFgUt-0003i6-Hc; Tue, 30 May 2017 08:43:39 -0400
Received: by mail-oi0-x241.google.com with SMTP id w10so15627669oif.1;
	Tue, 30 May 2017 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:references:cc:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=1cUpoPpxUNAeY3NmPU+Ko+E/1RW4aUQGJ/nJRujDJwo=;
	b=NPwjbQgPPOvVJvnhXK3zzRCNHxEo9l0rcVFNPM1p3aC49Aj11BVB7NO3IeGhZjNi5u
	nGpPmM4E8fokIiYW4bvg74Hv1fDnh3VyXCW+FR7MaDgzS36yRu8T6eVd9+fdYrucICXG
	XCl7jsrTxdVn2f5zTTfVfLqxs91U+RU/kS+RrbBtz6CKf9qFs/ZI+VUv6eIyeHU8bN0e
	66wIL9yWz0pfMy6QgNI/k5zgX1KZjmdWWMhfIjVd4kRDZgrjwkV3ptEGpeV31Usjsizv
	cvF23lgZcuMW8B3316gkAywlZqQRpVvbGoo5ixUWOFnXVDn68Kbzu3DHfCOOs/GFnkb1
	RB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:references:cc:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=1cUpoPpxUNAeY3NmPU+Ko+E/1RW4aUQGJ/nJRujDJwo=;
	b=WO40ErQ+J5T/WwoAZaAacPzgpoCuk+5vTiaAlwT/PTLUQGPAJoq3GspzmT4P79zuVf
	IGuzKO3oQb3sdKsvJ2kCjco14r0z2PSXYIKsgHwgxTdDG67loX4e7juooMFVBHMBtP3i
	9T20foEL1cz8sUhIs9rkJ3AX2URUxQXhKSi2cxdnMfiiBpF0OO6W9tJhVsyll0y/Y9rk
	a3jooCI7QQT1peFgCW0wGq3FZfdDbSdvqNFQ6e95pFSvSR0N54qmaLr8cm3tMMxmomsj
	/ZNTUtsFcK+jXWBEl0v6X1ApiVxRgsLU26dr9ghMWsWQ+vDBbi1RF0/GAmPfCoesAiad
	Mtpw==
X-Gm-Message-State: AODbwcARmzgZzYLqY8JyTi2xGsobDeIJx2pBmbmO+J+Z6zkcJxJSLwHi
	lwUS3S9he2eQIw==
X-Received: by 10.157.16.69 with SMTP id o5mr9562022oto.208.1496148218548;
	Tue, 30 May 2017 05:43:38 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id
	w197sm5719149oie.8.2017.05.30.05.43.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 05:43:37 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-2-git-send-email-sundeep.lkml@gmail.com>
Message-ID: <791b5dbc-4a5d-71c7-cd4b-1609b164e648@amsat.org>
Date: Tue, 30 May 2017 09:43:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494949133-2202-2-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 1/5] msf2: Add Smartfusion2
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
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +dJAVqSPasrs

Hi Subbaraya,

I have some comments, see inlined.

On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
> Modelled System Timer in Microsemi's Smartfusion2 Soc.
> Timer has two 32bit down counters and two interrupts.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  hw/timer/Makefile.objs       |   1 +
>  hw/timer/mss-timer.c         | 249 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/timer/mss-timer.h |  80 ++++++++++++++
>  3 files changed, 330 insertions(+)
>  create mode 100644 hw/timer/mss-timer.c
>  create mode 100644 include/hw/timer/mss-timer.h
>
> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> index dd6f27e..fc4d2da 100644
> --- a/hw/timer/Makefile.objs
> +++ b/hw/timer/Makefile.objs
> @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
>  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
>
>  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
> +common-obj-$(CONFIG_MSF2) += mss-timer.o
> diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
> new file mode 100644
> index 0000000..7041965
> --- /dev/null
> +++ b/hw/timer/mss-timer.c
> @@ -0,0 +1,249 @@
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
> +#include "hw/timer/mss-timer.h"
> +
> +#ifndef MSS_TIMER_ERR_DEBUG
> +#define MSS_TIMER_ERR_DEBUG  0
> +#endif
> +
> +#define DB_PRINT_L(lvl, fmt, args...) do { \
> +    if (MSS_TIMER_ERR_DEBUG >= lvl) { \
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
> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
> +            ret = st->regs[addr];
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
> +        }
> +        break;
> +    }
> +
> +    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32 "\n", timer, offset,
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
> +    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)\n", offset,
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
> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
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
> +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, TYPE_MSS_TIMER,
> +                          NUM_TIMERS * R_TIM1_MAX * 4);
> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
> +}
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
> index 0000000..4caacfd
> --- /dev/null
> +++ b/include/hw/timer/mss-timer.h
> @@ -0,0 +1,80 @@
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
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/ptimer.h"
> +#include "sysemu/sysemu.h"
> +#include "qemu/log.h"
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
> +#define R_TIM_VAL         0
> +#define R_TIM_LOADVAL     1
> +#define R_TIM_BGLOADVAL   2
> +#define R_TIM_CTRL        3
> +#define R_TIM_RIS         4
> +#define R_TIM_MIS         5
> +#define R_TIM1_MAX        6
> +

 From here ...

> +#define TIMER_CTRL_ENBL     (1 << 0)
> +#define TIMER_CTRL_ONESHOT  (1 << 1)
> +#define TIMER_CTRL_INTR     (1 << 2)
> +#define TIMER_RIS_ACK       (1 << 0)
> +#define TIMER_RST_CLR       (1 << 6)
> +#define TIMER_MODE          (1 << 0)

.. to here, can go in the .c source file.

I'd also move R_TIM_* to the source, only keeping R_TIM_MAX in this 
header, or also moving it and exposing some TIMER_IO_SIZE of 0x30 instead.

> +
> +struct Msf2Timer {
> +    QEMUBH *bh;
> +    ptimer_state *ptimer;
> +
> +    uint32_t regs[NUM_TIMERS * R_TIM1_MAX];

Beware, you are declaring 2 sets of register for each timer. I think 
it'd be safer to declare these registers once in MSSTimerState, the code 
would get easier.

> +    qemu_irq irq;
> +};
> +
> +typedef struct MSSTimerState {
> +    SysBusDevice parent_obj;
> +
> +    MemoryRegion mmio;
> +    uint32_t freq_hz;
> +    struct Msf2Timer *timers;

The number of timers is fixed (NUM_TIMERS), so you can declare it here 
and avoid to use g_malloc0() in mss_timer_init(), this will get 
allocated before mss_timer_init() using mss_timer_info.instance_size.

This should simplify a bit.

> +} MSSTimerState;
> +
> +#endif /* HW_MSS_TIMER_H */
>

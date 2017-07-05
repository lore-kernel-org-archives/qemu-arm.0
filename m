Received: by 10.25.44.15 with SMTP id s15csp1034275lfs;
        Wed, 5 Jul 2017 10:59:17 -0700 (PDT)
X-Received: by 10.200.52.71 with SMTP id v7mr54940128qtb.214.1499277550299;
        Wed, 05 Jul 2017 10:59:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499277550; cv=none;
        d=google.com; s=arc-20160816;
        b=MYT1/6UGg8rXfEVoOEVsLVPh19Vnz8Dng9+1byBjs3yUsKWxB6ZbCtjvA2mIIgn6RN
         vd7FKDaURatWUfoRR3ekB/Kv5xrFDpUmI3SeXd9waa0svYYvJUt1MmYrM8C4+bEEIuaU
         8RUGtvBdORhxUQXF4mlmZSvNON7/WKMuIKjkARF03K2fTLU7z3bNX+oY84Gzop4R+S4T
         KH//7NlWJK9Jtz6gN2Bg2cFI8mFEHq2H3XNdI4I54kxMVv4J5MzX5nUrRMMn5qjklhUI
         hX63P5VurFqYosvzYsjs3KjNH4ccdZc48Pe0ujvcKg4cv0Ltx7oHh80FLkt55/uww10b
         m+tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QWa69a37q78hpWOr7vpSkoyaQYsBxyGNbY+Dte1aUc0=;
        b=hwbz9/wZTpUp7qDsB7rgwF2BMO1KY64qhPAy1EXKH/3pdC5xnbEhVt4Wez6e7EgjcH
         485oSs4skDlf3Q1SDS6lCMo7hQYNaKgeTo8FH0JvnxtvBl0XU7feTOvvnW6sq/caPlDW
         f3Tm9l77DyZSjNNPvjdvLHi4975z2lhV4b6SqzTYKFoqPqs36dIRVmshvhXSlxU9z1ys
         2PPiiI2w999zCFwQ+1I5t/UnL+n/O156c7AdPOPAcg8D1H9qQB1x8dMyn1f26AtU08lc
         2VFS9PlKn2WN9xGPQ4vGu/yWFzouxVxDP6LHTSkx2hMEr4TS7kTu5TzygAdj1s/JN47p
         VpOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=gv0SWRCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u129si5259763qkc.361.2017.07.05.10.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 10:59:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=gv0SWRCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47495 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSoZv-0001yo-IG
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 13:59:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dSoZq-0001w8-K5
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 13:59:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dSoZp-0000yL-3r
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 13:59:02 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:35248)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dSoZl-0000vK-HH; Wed, 05 Jul 2017 13:58:57 -0400
Received: by mail-wr0-x244.google.com with SMTP id z45so50859530wrb.2;
	Wed, 05 Jul 2017 10:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QWa69a37q78hpWOr7vpSkoyaQYsBxyGNbY+Dte1aUc0=;
	b=gv0SWRCBXBFMBG1W+G3mctjpWilm2xvcb/hxdFNOtn1nKm3OQx/LIu38ZkYmc3C32J
	g0ec+OWaTDI4y6mFNixp9snL1EB7rUAWq+ifud5bVtY8r54QKg4quc376zmV+2pt/nng
	lzFMJUA8nLM2hvGOqTgUXnhDyyzhYz4y8W+eUCfk0O0fcG4IVYjef/w/LHh4iPCAnyop
	MKy6GMJTEKH+67Oer2UGVG9anIf/CZqSpOe+XrXMIgNYkwERd1JweYGgX1XOS2RLkrfN
	TIm3cyfWxGZvUNabgdGZHROZrVDMjRLk3pNmY8hCazD0/vkWGdY/25Z7ronsoMJV9Xl6
	4aKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QWa69a37q78hpWOr7vpSkoyaQYsBxyGNbY+Dte1aUc0=;
	b=mCUlysOuD3MrYGzrmv1L1YaABZfByz3lcfSL4VGXPq+omczFuT/HVEbw3+2CfOs+6w
	1i41Sjsrx1U3pA6knX/xWjdBaLiNDCVi6COKTp7gnutKngJqpe9iAhSJqQpmIZr1h5v0
	KO/NluJSTgnqKiYgXA/jWWRMFO3o0mwdvnTvlJDXrL26H3EIeiL4Vf154ZZvinsnlhlH
	IQhjaayjw0vSg4QW+yuXtMpq7Ue3DlyRS2vhUs81UC8lDxrXkQihYBsFeqCFt1XNBBgG
	wwJlPAJVJOYnVMDCD901w7aH/VIRuQshwMdCXsrnVlhTh0rtmAvy7kr0eCYK2zJ+Yrbv
	7Zfg==
X-Gm-Message-State: AKS2vOxVVZEphBpxry6yO494kjYpWck7SNLWF34kY9l4KxH2GcbqIiYF
	VlZlUC3lpLgtQddRAdZd71drEqjZ6Q==
X-Received: by 10.223.163.197 with SMTP id m5mr39044058wrb.128.1499277536311; 
	Wed, 05 Jul 2017 10:58:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Wed, 5 Jul 2017 10:58:25 -0700 (PDT)
In-Reply-To: <CAKmqyKOyaJQKOmGK=+jgUOJ5vKeUXJH2OEQmxU-qsD8ftC-25Q@mail.gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
	<1499057115-6773-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKOyaJQKOmGK=+jgUOJ5vKeUXJH2OEQmxU-qsD8ftC-25Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Jul 2017 10:58:25 -0700
Message-ID: <CAKmqyKORLF24EYEhLMeMqZ7znqVULixQ36OyLZO6V0R_E1gEEQ@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
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
X-TUID: t7Ei890wpTBT

On Wed, Jul 5, 2017 at 10:56 AM, Alistair Francis <alistair23@gmail.com> wrote:
> On Sun, Jul 2, 2017 at 9:45 PM, Subbaraya Sundeep
> <sundeep.lkml@gmail.com> wrote:
>> Modelled System Timer in Microsemi's Smartfusion2 Soc.
>> Timer has two 32bit down counters and two interrupts.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>  hw/timer/Makefile.objs       |   1 +
>>  hw/timer/mss-timer.c         | 261 +++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/timer/mss-timer.h |  67 +++++++++++
>>  3 files changed, 329 insertions(+)
>>  create mode 100644 hw/timer/mss-timer.c
>>  create mode 100644 include/hw/timer/mss-timer.h
>>
>> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>> index dd6f27e..fc4d2da 100644
>> --- a/hw/timer/Makefile.objs
>> +++ b/hw/timer/Makefile.objs
>> @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
>>  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
>>
>>  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
>> +common-obj-$(CONFIG_MSF2) += mss-timer.o
>> diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
>> new file mode 100644
>> index 0000000..e46d118
>> --- /dev/null
>> +++ b/hw/timer/mss-timer.c
>> @@ -0,0 +1,261 @@
>> +/*
>> + * Block model of System timer present in
>> + * Microsemi's SmartFusion2 and SmartFusion SoCs.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "hw/timer/mss-timer.h"

Also just noticed (this applies to the whole series) that you need the
headers in the C file.

Move every #include that you can from the mss-timer.h files to this
file, headers should be local to where they are called. Also make sure
you include the os-dep header in every file.

Thanks,
Alistair

>> +
>> +#ifndef MSS_TIMER_ERR_DEBUG
>> +#define MSS_TIMER_ERR_DEBUG  0
>> +#endif
>> +
>> +#define DB_PRINT_L(lvl, fmt, args...) do { \
>> +    if (MSS_TIMER_ERR_DEBUG >= lvl) { \
>> +        qemu_log("%s: " fmt "\n", __func__, ## args); \
>> +    } \
>> +} while (0);
>> +
>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> +
>> +#define R_TIM_VAL         0
>> +#define R_TIM_LOADVAL     1
>> +#define R_TIM_BGLOADVAL   2
>> +#define R_TIM_CTRL        3
>> +#define R_TIM_RIS         4
>> +#define R_TIM_MIS         5
>> +
>> +#define TIMER_CTRL_ENBL     (1 << 0)
>> +#define TIMER_CTRL_ONESHOT  (1 << 1)
>> +#define TIMER_CTRL_INTR     (1 << 2)
>> +#define TIMER_RIS_ACK       (1 << 0)
>> +#define TIMER_RST_CLR       (1 << 6)
>> +#define TIMER_MODE          (1 << 0)
>> +
>> +static void timer_update_irq(struct Msf2Timer *st)
>> +{
>> +    bool isr, ier;
>> +
>> +    isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
>> +    ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
>> +    qemu_set_irq(st->irq, (ier && isr));
>> +}
>> +
>> +static void timer_update(struct Msf2Timer *st)
>> +{
>> +    uint64_t count;
>> +
>> +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL)) {
>> +        ptimer_stop(st->ptimer);
>> +        return;
>> +    }
>> +
>> +    count = st->regs[R_TIM_LOADVAL];
>> +    ptimer_set_limit(st->ptimer, count, 1);
>> +    ptimer_run(st->ptimer, 1);
>> +}
>> +
>> +static uint64_t
>> +timer_read(void *opaque, hwaddr offset, unsigned int size)
>> +{
>> +    MSSTimerState *t = opaque;
>> +    hwaddr addr;
>> +    struct Msf2Timer *st;
>> +    uint32_t ret = 0;
>> +    int timer = 0;
>> +    int isr;
>> +    int ier;
>> +
>> +    addr = offset >> 2;
>> +    /*
>> +     * Two independent timers has same base address.
>> +     * Based on address passed figure out which timer is being used.
>> +     */
>> +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
>> +        timer = 1;
>> +        addr -= R_TIM1_MAX;
>> +    }
>> +
>> +    st = &t->timers[timer];
>> +
>> +    switch (addr) {
>> +    case R_TIM_VAL:
>> +        ret = ptimer_get_count(st->ptimer);
>> +        break;
>> +
>> +    case R_TIM_MIS:
>> +        isr = !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
>> +        ier = !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
>> +        ret = ier & isr;
>> +        break;
>> +
>> +    default:
>> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
>
> Shouldn't this just be: addr < R_TIM1_MAX?
>
> At this point you have already subjected the offset for multiple timers.
>
>> +            ret = st->regs[addr];
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
>
> Maybe add a return here so you don't print the other debug message after this.
>
>> +        }
>> +        break;
>> +    }
>> +
>> +    DB_PRINT("timer=%d 0x%" HWADDR_PRIx "=0x%" PRIx32, timer, offset,
>> +            ret);
>> +    return ret;
>> +}
>> +
>> +static void
>> +timer_write(void *opaque, hwaddr offset,
>> +            uint64_t val64, unsigned int size)
>> +{
>> +    MSSTimerState *t = opaque;
>> +    hwaddr addr;
>> +    struct Msf2Timer *st;
>> +    int timer = 0;
>> +    uint32_t value = val64;
>> +
>> +    addr = offset >> 2;
>> +    /*
>> +     * Two independent timers has same base address.
>> +     * Based on addr passed figure out which timer is being used.
>> +     */
>> +    if ((addr >= R_TIM1_MAX) && (addr < NUM_TIMERS * R_TIM1_MAX)) {
>> +        timer = 1;
>> +        addr -= R_TIM1_MAX;
>> +    }
>> +
>> +    st = &t->timers[timer];
>> +
>> +    DB_PRINT("addr=0x%" HWADDR_PRIx " val=0x%" PRIx32 " (timer=%d)", offset,
>> +            value, timer);
>> +
>> +    switch (addr) {
>> +    case R_TIM_CTRL:
>> +        st->regs[R_TIM_CTRL] = value;
>> +        timer_update(st);
>> +        break;
>> +
>> +    case R_TIM_RIS:
>> +        if (value & TIMER_RIS_ACK) {
>> +            st->regs[R_TIM_RIS] &= ~TIMER_RIS_ACK;
>> +        }
>> +        break;
>> +
>> +    case R_TIM_LOADVAL:
>> +        st->regs[R_TIM_LOADVAL] = value;
>> +        if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
>> +            timer_update(st);
>> +        }
>> +        break;
>> +
>> +    case R_TIM_BGLOADVAL:
>> +        st->regs[R_TIM_BGLOADVAL] = value;
>> +        st->regs[R_TIM_LOADVAL] = value;
>> +        break;
>> +
>> +    case R_TIM_VAL:
>> +    case R_TIM_MIS:
>> +        break;
>> +
>> +    default:
>> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
>
> Same comment as above.
>
>> +            st->regs[addr] = value;
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
>> +            return;
>> +        }
>> +        break;
>> +    }
>> +    timer_update_irq(st);
>> +}
>
> Once those comments above are addressed:
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Thanks,
> Alistair

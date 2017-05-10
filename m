Received: by 10.25.0.6 with SMTP id 6csp270872lfa;
        Wed, 10 May 2017 05:37:44 -0700 (PDT)
X-Received: by 10.237.36.75 with SMTP id s11mr5020245qtc.131.1494419864849;
        Wed, 10 May 2017 05:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494419864; cv=none;
        d=google.com; s=arc-20160816;
        b=hm16RppzLrIdNrBfbVrOLH2vTAwTQQfFXvgdAfWnJgix3YVtjNGQttI+ViKGZUc94u
         4IpS4gKffBg6J/3u+AI3OpnUkb7Sr77P1s5LarLMKXwNjnzeD0ip7DxqcUYJCIoy2nLA
         oEtbQG0jaR2qyxaRZpvu/51atDxEFXeBlB/sMtogh9Rhorpd5DK//l95wQwAvXEsVKsb
         7zqtCjsZJwVJSJbmNr9IeT1iUTEtfepy3q5ouJRCuUxTt6KO7mcR/QQdN+KFoEDWgdlb
         KeNil9fA/MWinc0jiIeC0DSx26QEMrC2/duCJ7FeXU42ewzeWU2cdbKt1G6d03C46nZc
         FtKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=2Bb2S26gvaPKksM+cutHYXWQNc5D+zmxf1eJGXCqX/0=;
        b=fsv2yV0bITtU8I2LPmUKTxJuoyFR0GlozWSUm0NGcRZLuiUNWgJf93N+Mc510TCLke
         0g6exHKoXR82HuuEGutNL86154hBShhtf3HPizKMUsX9LbwTFoWXrfyUCeBZQvVU8FpD
         U/3BNy9OLiTAJZ++HSCW8fOFDKN2qXgLDVJnYF5cV01isCC6uw/amwzuHKE4fSEMo7u5
         oYGK/JWMu+R5ULUXebXTYYhUZmpeaHH5bmHQxIEZcJSetPcmAfsWR/yZwHd3DvOyJzz0
         Wx+spsSpG/+2vyYPp+lMRbBVFBVOix2KfgqbJ9IxOlbRfrd+g59c17o1ea2uNHbI6o52
         Cn8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r189si3028704qkb.60.2017.05.10.05.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 05:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8QsC-0004fg-8l
	for alex.bennee@linaro.org; Wed, 10 May 2017 08:37:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d8Qs3-0004ca-KA
	for qemu-arm@nongnu.org; Wed, 10 May 2017 08:37:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d8Qrz-00005v-QY
	for qemu-arm@nongnu.org; Wed, 10 May 2017 08:37:35 -0400
Received: from mail-yw0-x236.google.com ([2607:f8b0:4002:c05::236]:36615)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d8Qrs-0008SG-Kr; Wed, 10 May 2017 08:37:24 -0400
Received: by mail-yw0-x236.google.com with SMTP id b68so14565985ywe.3;
	Wed, 10 May 2017 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2Bb2S26gvaPKksM+cutHYXWQNc5D+zmxf1eJGXCqX/0=;
	b=Nw1c97Um474zC8jYzjiwD0cqExdqajyRIy3OlgczHrqOXf+F5eoeN+MgaVS0YhR2k+
	nU64Z5nWnnTE+frAZkfT7Td9I43WUU3uFbaRRnOLqbrqiicNxBue9NMOnpNeh+EZHOGw
	7Q72erkucSYtEMreciMakTTEH+/F54YfIJNx3HjES/8f0uJKMchcNHa9I08bTs4Sn5S5
	ox7DrNsh98XLkNpqfKny0qXh6c9Pr5UGPp8GUnssx8amZtsQKK+YghPiTFA149YKY752
	151u6XF++KW1tQw9DBuZsUWgSHu69Z73k+52YUQKmJ5Kx7ROvaKfXIgT5zgfcm1ltZjY
	XHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2Bb2S26gvaPKksM+cutHYXWQNc5D+zmxf1eJGXCqX/0=;
	b=mScARv71D8qS7jIrPz3R4CtFmOgaDl2DuOJXVdolXMJc7N20bHYFkRxaKKdBGpitNf
	EEMS/phrLBfoox/Lkl6i+BFoTq59IfvbfPxm3A/de0KqJOuLr7sNlxqd1G+g46N6KFGi
	uWlAKQdHPPv1I/4ZGslFY5ptSPqcPplaLknINBJRrzP7sxD939UqvdzcdCMqDqGin3dN
	ohSf6OAH04Qbgo4yq/OmhsoGhRJdCN94kodlwgrUkEDK//eO6qGF4iY/MYWiq2zKFJbI
	qWfMrwtfLh6DlxJXymn9atrcYkswQm8lMOJrOZsuTh6Pp1ErZYJ5/M0BT54iZ7/1Li+M
	199Q==
X-Gm-Message-State: AODbwcDBXwAkdiPhX9youacHuAcNtmnPKIdXce/Gic5J7mb/j0bGrFzB
	SGKUwbVqIwi2Qwu+yf7QbpPP3+Ny3w==
X-Received: by 10.129.97.195 with SMTP id v186mr4830246ywb.151.1494419843693; 
	Wed, 10 May 2017 05:37:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Wed, 10 May 2017 05:37:23 -0700 (PDT)
In-Reply-To: <e87597ba-4759-76a5-7b0d-3297d2eb8f79@amsat.org>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-2-git-send-email-sundeep.lkml@gmail.com>
	<e87597ba-4759-76a5-7b0d-3297d2eb8f79@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 10 May 2017 18:07:23 +0530
Message-ID: <CALHRZuqfqjEWszkvVQSWAKR5zVbhD36=+Qt_DsVykk41cihO1Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary=001a11490122eddbec054f2abbff
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::236
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LWyEu0CbSekb

--001a11490122eddbec054f2abbff
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Phil,

On Wed, May 10, 2017 at 3:11 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:
> Hi Subbaraya, nice work!
>
> The timer you are modeling is the mss_timer, which is in particular used
in
> the smartfusion2, I'd rather name it mss_timer.c so it can be reused by
> other SoC models.
>
Ok I will change all other file names also to mss. Do I need to change type
names
also to mss?

> I added few comments.
>
>
> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
>>
>> Modelled System Timer in Microsemi's Smartfusion2 Soc.
>> Timer has two 32bit down counters and two interrupts.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> ---
>>  hw/timer/Makefile.objs        |   1 +
>>  hw/timer/msf2-timer.c         | 252
>> ++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/timer/msf2-timer.h |  85 ++++++++++++++
>>  3 files changed, 338 insertions(+)
>>  create mode 100644 hw/timer/msf2-timer.c
>>  create mode 100644 include/hw/timer/msf2-timer.h
>>
>> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>> index dd6f27e..bd1ff15 100644
>> --- a/hw/timer/Makefile.objs
>> +++ b/hw/timer/Makefile.objs
>> @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D
>> stm32f2xx_timer.o
>>  common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o
>>
>>  common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
>> +common-obj-$(CONFIG_MSF2) +=3D msf2-timer.o
>> diff --git a/hw/timer/msf2-timer.c b/hw/timer/msf2-timer.c
>> new file mode 100644
>> index 0000000..466faa6
>> --- /dev/null
>> +++ b/hw/timer/msf2-timer.c
>> @@ -0,0 +1,252 @@
>> +/*
>> + * Timer block model of Microsemi SmartFusion2.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS
>> IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "hw/timer/msf2-timer.h"
>> +
>> +#ifndef MSF2_TIMER_ERR_DEBUG
>> +#define MSF2_TIMER_ERR_DEBUG  0
>> +#endif
>> +
>> +#define DB_PRINT_L(lvl, fmt, args...) do { \
>> +    if (MSF2_TIMER_ERR_DEBUG >=3D lvl) { \
>> +        qemu_log("%s: " fmt, __func__, ## args); \
>> +    } \
>> +} while (0);
>> +
>> +#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)
>> +
>> +static void timer_update_irq(struct Msf2Timer *st)
>> +{
>> +    bool isr, ier;
>> +
>> +    isr =3D !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
>> +    ier =3D !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
>> +
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
>> +    count =3D st->regs[R_TIM_LOADVAL];
>> +    ptimer_set_limit(st->ptimer, count, 1);
>> +    ptimer_run(st->ptimer, 1);
>> +}
>> +
>> +static uint64_t
>> +timer_read(void *opaque, hwaddr addr, unsigned int size)
>> +{
>> +    MSF2TimerState *t =3D opaque;
>> +    struct Msf2Timer *st;
>> +    uint32_t ret =3D 0;
>> +    int timer =3D 0;
>> +    int isr;
>> +    int ier;
>> +
>> +    addr >>=3D 2;
>> +    /*
>> +     * Two independent timers has same base address.
>> +     * Based on addr passed figure out which timer is being used.
>> +     */
>> +    if (addr >=3D R_TIM1_MAX) {
>> +        timer =3D 1;
>> +        addr -=3D R_TIM1_MAX;
>> +    }
>> +
>> +    st =3D &t->timers[timer];
>> +
>> +    switch (addr) {
>> +    case R_TIM_VAL:
>> +        ret =3D ptimer_get_count(st->ptimer);
>> +        break;
>> +
>> +    case R_TIM_MIS:
>> +        isr =3D !!(st->regs[R_TIM_RIS] & TIMER_RIS_ACK);
>> +        ier =3D !!(st->regs[R_TIM_CTRL] & TIMER_CTRL_INTR);
>> +        ret =3D ier & isr;
>> +        break;
>> +
>> +    default:
>> +        if (addr < ARRAY_SIZE(st->regs)) {
>> +            ret =3D st->regs[addr];
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n",
__func__,
>> +                         addr * 4);
>> +        }
>> +        break;
>> +    }
>> +
>> +    DB_PRINT("timer=3D%d 0x%" HWADDR_PRIx "=3D0x%" PRIx32 "\n", timer, =
addr
*
>> 4,
>> +            ret);
>> +    return ret;
>> +}
>> +
>> +static void
>> +timer_write(void *opaque, hwaddr addr,
>> +            uint64_t val64, unsigned int size)
>> +{
>> +    MSF2TimerState *t =3D opaque;
>> +    struct Msf2Timer *st;
>> +    int timer =3D 0;
>> +    uint32_t value =3D val64;
>> +
>> +    addr >>=3D 2;
>> +    /*
>> +     * Two independent timers has same base address.
>> +     * Based on addr passed figure out which timer is being used.
>> +     */
>> +    if (addr >=3D R_TIM1_MAX) {
>> +        timer =3D 1;
>> +        addr -=3D R_TIM1_MAX;
>
>
> This is only valid if addr < (NUM_TIMERS * R_TIM1_MAX).
>
>
Yes you are right. My intention was to treat any address greater than
R_TIM1_MAX as timer 2 and below default case in switch would take care of
addresses which are greater than 2 *  R_TIM1_MAX. As you mentioned there
is problem with 12..20. If guest sends more than 20 say 24 then 24 - 6 =3D =
18
which will be treated as valid but it is not. Thanks for pointing it.

>> +    }
>> +
>> +    st =3D &t->timers[timer];
>> +
>> +    DB_PRINT("addr=3D0x%" HWADDR_PRIx " val=3D0x%" PRIx32 " (timer=3D%d=
)\n",
>> addr * 4,
>> +            value, timer);
>> +
>> +    switch (addr) {
>> +    case R_TIM_CTRL:
>> +        st->regs[R_TIM_CTRL] =3D value;
>> +        timer_update(st);
>> +        break;
>> +
>> +    case R_TIM_RIS:
>> +        if (value & TIMER_RIS_ACK) {
>> +            st->regs[R_TIM_RIS] &=3D ~TIMER_RIS_ACK;
>> +        }
>> +        break;
>> +
>> +    case R_TIM_LOADVAL:
>> +        st->regs[R_TIM_LOADVAL] =3D value;
>> +        if (st->regs[R_TIM_CTRL] & TIMER_CTRL_ENBL) {
>> +            timer_update(st);
>> +        }
>> +        break;
>> +
>> +    case R_TIM_BGLOADVAL:
>> +        st->regs[R_TIM_BGLOADVAL] =3D value;
>> +        st->regs[R_TIM_LOADVAL] =3D value;
>> +        break;
>> +
>> +    case R_TIM_VAL:
>> +    case R_TIM_MIS:
>> +        break;
>> +
>> +    case R_TIM_MODE:
>
>
> This case is never reached, if the guest wanted to access register 21,
since
> 21 >=3D R_TIM1_MAX you have now addr =3D 21 - R_TIM1_MAX =3D 15.
>
Yes. I overlooked it. Will change it.

>> +        if (value & TIMER_MODE) {
>> +            qemu_log_mask(LOG_UNIMP, "64-bit mode not supported\n");
>
>
> No need of trailing '\n', be more specific, something like:
>
>     qemu_log_mask(LOG_UNIMP, TYPE_MSF2_TIMER ": 64-bit mode not
supported");
>
Ok. Will change it.
>> +        }
>> +        break;
>> +
>> +    default:
>
>
> Once the issue "addr -=3D R_TIM1_MAX" is fixed, this default will catch
> registers 12 .. 20 silently while there are unimplemented!
> I'd rather catch them altogether and log some "64-bit mode not supported"=
.
>
Ok. I will change it.

>> +        if (addr < ARRAY_SIZE(st->regs)) {
>> +            st->regs[addr] =3D value;
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                         "%s: Bad offset 0x%" HWADDR_PRIx "\n",
__func__,
>> +                         addr * 4);
>> +        }
>> +        break;
>> +    }
>> +    timer_update_irq(st);
>
>
> Here if addr >=3D (NUM_TIMERS * R_TIM1_MAX) you still update Timer1 IRQ,
while
> this is unharmful right now this is likely to be break later.
>
As long as Interrupt status register and Interrupt enable register are not
modified calling timer_update_irq will not harm. Am I missing something
here?
>> +}
>> +
>> +static const MemoryRegionOps timer_ops =3D {
>> +    .read =3D timer_read,
>> +    .write =3D timer_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +    .valid =3D {
>> +        .min_access_size =3D 4,
>
>
> I believe min_access_size =3D 1 is valid for any APB device.
>
>
Ok. I followed Xilinx soft IP models while writing this. I am really not
sure it is mandatory to put access_size. Can i remove it?

>> +        .max_access_size =3D 4
>> +    }
>> +};
>> +
>> +static void timer_hit(void *opaque)
>> +{
>> +    struct Msf2Timer *st =3D opaque;
>> +
>> +    st->regs[R_TIM_RIS] |=3D TIMER_RIS_ACK;
>> +
>> +    if (!(st->regs[R_TIM_CTRL] & TIMER_CTRL_ONESHOT)) {
>> +        timer_update(st);
>> +    }
>> +    timer_update_irq(st);
>> +}
>> +
>> +static void msf2_timer_init(Object *obj)
>> +{
>> +    MSF2TimerState *t =3D MSF2_TIMER(obj);
>> +    int i;
>> +
>> +    /* Init all the ptimers.  */
>> +    t->timers =3D g_malloc0((sizeof t->timers[0]) * NUM_TIMERS);
>> +    for (i =3D 0; i < NUM_TIMERS; i++) {
>> +        struct Msf2Timer *st =3D &t->timers[i];
>> +
>> +        st->bh =3D qemu_bh_new(timer_hit, st);
>> +        st->ptimer =3D ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
>> +        ptimer_set_freq(st->ptimer, t->freq_hz);
>> +        sysbus_init_irq(SYS_BUS_DEVICE(obj), &st->irq);
>> +    }
>> +
>> +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
>> TYPE_MSF2_TIMER,
>> +                          R_TIM_MAX * 4);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &t->mmio);
>> +}
>> +
>> +static Property msf2_timer_properties[] =3D {
>> +    DEFINE_PROP_UINT32("clock-frequency", MSF2TimerState, freq_hz,
>> +                       MSF2_TIMER_FREQ),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void msf2_timer_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->props =3D msf2_timer_properties;
>> +}
>> +
>> +static const TypeInfo msf2_timer_info =3D {
>> +    .name          =3D TYPE_MSF2_TIMER,
>> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
>> +    .instance_size =3D sizeof(MSF2TimerState),
>> +    .instance_init =3D msf2_timer_init,
>> +    .class_init    =3D msf2_timer_class_init,
>> +};
>> +
>> +static void msf2_timer_register_types(void)
>> +{
>> +    type_register_static(&msf2_timer_info);
>> +}
>> +
>> +type_init(msf2_timer_register_types)
>> diff --git a/include/hw/timer/msf2-timer.h
b/include/hw/timer/msf2-timer.h
>> new file mode 100644
>> index 0000000..10eb2f8
>> --- /dev/null
>> +++ b/include/hw/timer/msf2-timer.h
>> @@ -0,0 +1,85 @@
>> +/*
>> + * Microsemi SmartFusion2 Timer.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS
>> IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef HW_MSF2_TIMER_H
>> +#define HW_MSF2_TIMER_H
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/ptimer.h"
>> +#include "sysemu/sysemu.h"
>> +#include "qemu/log.h"
>> +
>> +#define TYPE_MSF2_TIMER     "msf2-timer"
>> +#define MSF2_TIMER(obj)     OBJECT_CHECK(MSF2TimerState, \
>> +                              (obj), TYPE_MSF2_TIMER)
>> +
>> +/*
>> + * There are two 32-bit down counting timers.
>> + * Timers 1 and 2 can be concatenated into a single 64-bit Timer
>> + * that operates either in Periodic mode or in One-shot mode.
>> + * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit
>> mode.
>> + * In 64-bit mode, writing to the 32-bit registers has no effect.
>> + * Similarly, in 32-bit mode, writing to the 64-bit mode registers
>> + * has no effect. Only two 32-bit timers are supported currently.
>> + */
>> +#define NUM_TIMERS        2
>> +
>> +#define MSF2_TIMER_FREQ   (83 * 1000000)
>
>
> I can not find this value, can you point me to the datasheet? It seems So=
C
> specific to me.
>
It is configured in Microsemi Libero. The SOM kit from Emcraft comes with
this default setting.
I guess this property should be set and passed from board file and not from
SoC.
Am I correct?
Can I attach the datasheet to this thread?

Thank you,
Sundeep
>
>> +
>> +#define R_TIM_VAL         0
>> +#define R_TIM_LOADVAL     1
>> +#define R_TIM_BGLOADVAL   2
>> +#define R_TIM_CTRL        3
>> +#define R_TIM_RIS         4
>> +#define R_TIM_MIS         5
>> +#define R_TIM1_MAX        6
>> +
>> +#define R_TIM_MODE       21
>> +#define R_TIM_MAX        22 /* including 64-bit timer registers */
>> +
>> +#define TIMER_CTRL_ENBL     (1 << 0)
>> +#define TIMER_CTRL_ONESHOT  (1 << 1)
>> +#define TIMER_CTRL_INTR     (1 << 2)
>> +#define TIMER_RIS_ACK       (1 << 0)
>> +#define TIMER_RST_CLR       (1 << 6)
>> +#define TIMER_MODE          (1 << 0)
>> +
>> +struct Msf2Timer {
>> +    QEMUBH *bh;
>> +    ptimer_state *ptimer;
>> +
>> +    uint32_t regs[R_TIM_MAX];
>> +    qemu_irq irq;
>> +};
>> +
>> +typedef struct MSF2TimerState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion mmio;
>> +    uint32_t freq_hz;
>> +    struct Msf2Timer *timers;
>> +} MSF2TimerState;
>> +
>> +#endif /* HW_MSF2_TIMER_H */
>
>
> Regards,
>
> Phil.

--001a11490122eddbec054f2abbff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Phil,<br><br>On Wed, May 10, 2017 at 3:11 PM, Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</=
a>&gt; wrote:<br>&gt; Hi Subbaraya, nice work!<br>&gt;<br>&gt; The timer yo=
u are modeling is the mss_timer, which is in particular used in<br>&gt; the=
 smartfusion2, I&#39;d rather name it mss_timer.c so it can be reused by<br=
>&gt; other SoC models.<br>&gt;<br>Ok I will change all other file names al=
so to mss. Do I need to change type names<br>also to mss?<br><br>&gt; I add=
ed few comments.<br>&gt;<br>&gt;<br>&gt; On 05/09/2017 01:44 PM, Subbaraya =
Sundeep wrote:<br>&gt;&gt;<br>&gt;&gt; Modelled System Timer in Microsemi&#=
39;s Smartfusion2 Soc.<br>&gt;&gt; Timer has two 32bit down counters and tw=
o interrupts.<br>&gt;&gt;<br>&gt;&gt; Signed-off-by: Subbaraya Sundeep &lt;=
<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br=
>&gt;&gt; ---<br>&gt;&gt; =C2=A0hw/timer/Makefile.objs =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| =C2=A0 1 +<br>&gt;&gt; =C2=A0hw/timer/msf2-timer.c =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 252<br>&gt;&gt; ++++++++++++++++++++++++++++++++++++++++++<=
br>&gt;&gt; =C2=A0include/hw/timer/msf2-timer.h | =C2=A085 ++++++++++++++<b=
r>&gt;&gt; =C2=A03 files changed, 338 insertions(+)<br>&gt;&gt; =C2=A0creat=
e mode 100644 hw/timer/msf2-timer.c<br>&gt;&gt; =C2=A0create mode 100644 in=
clude/hw/timer/msf2-timer.h<br>&gt;&gt;<br>&gt;&gt; diff --git a/hw/timer/M=
akefile.objs b/hw/timer/Makefile.objs<br>&gt;&gt; index dd6f27e..bd1ff15 10=
0644<br>&gt;&gt; --- a/hw/timer/Makefile.objs<br>&gt;&gt; +++ b/hw/timer/Ma=
kefile.objs<br>&gt;&gt; @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIM=
ER) +=3D<br>&gt;&gt; stm32f2xx_timer.o<br>&gt;&gt; =C2=A0common-obj-$(CONFI=
G_ASPEED_SOC) +=3D aspeed_timer.o<br>&gt;&gt;<br>&gt;&gt; =C2=A0common-obj-=
$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o<br>&gt;&gt; +common-obj-$(CONFIG_MSF2)=
 +=3D msf2-timer.o<br>&gt;&gt; diff --git a/hw/timer/msf2-timer.c b/hw/time=
r/msf2-timer.c<br>&gt;&gt; new file mode 100644<br>&gt;&gt; index 0000000..=
466faa6<br>&gt;&gt; --- /dev/null<br>&gt;&gt; +++ b/hw/timer/msf2-timer.c<b=
r>&gt;&gt; @@ -0,0 +1,252 @@<br>&gt;&gt; +/*<br>&gt;&gt; + * Timer block mo=
del of Microsemi SmartFusion2.<br>&gt;&gt; + *<br>&gt;&gt; + * Copyright (c=
) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sund=
eep.lkml@gmail.com</a>&gt;.<br>&gt;&gt; + *<br>&gt;&gt; + * Permission is h=
ereby granted, free of charge, to any person obtaining<br>&gt;&gt; a copy<b=
r>&gt;&gt; + * of this software and associated documentation files (the &qu=
ot;Software&quot;),<br>&gt;&gt; to deal<br>&gt;&gt; + * in the Software wit=
hout restriction, including without limitation the<br>&gt;&gt; rights<br>&g=
t;&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, an=
d/or<br>&gt;&gt; sell<br>&gt;&gt; + * copies of the Software, and to permit=
 persons to whom the Software is<br>&gt;&gt; + * furnished to do so, subjec=
t to the following conditions:<br>&gt;&gt; + *<br>&gt;&gt; + * The above co=
pyright notice and this permission notice shall be<br>&gt;&gt; included in<=
br>&gt;&gt; + * all copies or substantial portions of the Software.<br>&gt;=
&gt; + *<br>&gt;&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOU=
T WARRANTY OF ANY KIND,<br>&gt;&gt; EXPRESS OR<br>&gt;&gt; + * IMPLIED, INC=
LUDING BUT NOT LIMITED TO THE WARRANTIES OF<br>&gt;&gt; MERCHANTABILITY,<br=
>&gt;&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO E=
VENT<br>&gt;&gt; SHALL<br>&gt;&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE =
LIABLE FOR ANY CLAIM, DAMAGES OR<br>&gt;&gt; OTHER<br>&gt;&gt; + * LIABILIT=
Y, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<br>&gt;&gt; ARISING=
 FROM,<br>&gt;&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE=
 OR OTHER DEALINGS<br>&gt;&gt; IN<br>&gt;&gt; + * THE SOFTWARE.<br>&gt;&gt;=
 + */<br>&gt;&gt; +<br>&gt;&gt; +#include &quot;hw/timer/msf2-timer.h&quot;=
<br>&gt;&gt; +<br>&gt;&gt; +#ifndef MSF2_TIMER_ERR_DEBUG<br>&gt;&gt; +#defi=
ne MSF2_TIMER_ERR_DEBUG =C2=A00<br>&gt;&gt; +#endif<br>&gt;&gt; +<br>&gt;&g=
t; +#define DB_PRINT_L(lvl, fmt, args...) do { \<br>&gt;&gt; + =C2=A0 =C2=
=A0if (MSF2_TIMER_ERR_DEBUG &gt;=3D lvl) { \<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0qemu_log(&quot;%s: &quot; fmt, __func__, ## args); \<br>&gt;&g=
t; + =C2=A0 =C2=A0} \<br>&gt;&gt; +} while (0);<br>&gt;&gt; +<br>&gt;&gt; +=
#define DB_PRINT(fmt, args...) DB_PRINT_L(1, fmt, ## args)<br>&gt;&gt; +<br=
>&gt;&gt; +static void timer_update_irq(struct Msf2Timer *st)<br>&gt;&gt; +=
{<br>&gt;&gt; + =C2=A0 =C2=A0bool isr, ier;<br>&gt;&gt; +<br>&gt;&gt; + =C2=
=A0 =C2=A0isr =3D !!(st-&gt;regs[R_TIM_RIS] &amp; TIMER_RIS_ACK);<br>&gt;&g=
t; + =C2=A0 =C2=A0ier =3D !!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_INTR)=
;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0qemu_set_irq(st-&gt;irq, (ier &a=
mp;&amp; isr));<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static void timer=
_update(struct Msf2Timer *st)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0uin=
t64_t count;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0if (!(st-&gt;regs[R_T=
IM_CTRL] &amp; TIMER_CTRL_ENBL)) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ptimer_stop(st-&gt;ptimer);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=
urn;<br>&gt;&gt; + =C2=A0 =C2=A0}<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0=
count =3D st-&gt;regs[R_TIM_LOADVAL];<br>&gt;&gt; + =C2=A0 =C2=A0ptimer_set=
_limit(st-&gt;ptimer, count, 1);<br>&gt;&gt; + =C2=A0 =C2=A0ptimer_run(st-&=
gt;ptimer, 1);<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static uint64_t<br=
>&gt;&gt; +timer_read(void *opaque, hwaddr addr, unsigned int size)<br>&gt;=
&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0MSF2TimerState *t =3D opaque;<br>&gt;&gt=
; + =C2=A0 =C2=A0struct Msf2Timer *st;<br>&gt;&gt; + =C2=A0 =C2=A0uint32_t =
ret =3D 0;<br>&gt;&gt; + =C2=A0 =C2=A0int timer =3D 0;<br>&gt;&gt; + =C2=A0=
 =C2=A0int isr;<br>&gt;&gt; + =C2=A0 =C2=A0int ier;<br>&gt;&gt; +<br>&gt;&g=
t; + =C2=A0 =C2=A0addr &gt;&gt;=3D 2;<br>&gt;&gt; + =C2=A0 =C2=A0/*<br>&gt;=
&gt; + =C2=A0 =C2=A0 * Two independent timers has same base address.<br>&gt=
;&gt; + =C2=A0 =C2=A0 * Based on addr passed figure out which timer is bein=
g used.<br>&gt;&gt; + =C2=A0 =C2=A0 */<br>&gt;&gt; + =C2=A0 =C2=A0if (addr =
&gt;=3D R_TIM1_MAX) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0timer =3D 1;=
<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0addr -=3D R_TIM1_MAX;<br>&gt;&gt;=
 + =C2=A0 =C2=A0}<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0st =3D &amp;t-&g=
t;timers[timer];<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0switch (addr) {<b=
r>&gt;&gt; + =C2=A0 =C2=A0case R_TIM_VAL:<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0ret =3D ptimer_get_count(st-&gt;ptimer);<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0case R_TIM=
_MIS:<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0isr =3D !!(st-&gt;regs[R_TIM=
_RIS] &amp; TIMER_RIS_ACK);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0ier =
=3D !!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_INTR);<br>&gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0ret =3D ier &amp; isr;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0default:<br>&gt;&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr &lt; ARRAY_SIZE(st-&gt;regs)) {<b=
r>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D st-&gt;regs[a=
ddr];<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>&gt;&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask(LOG_GUEST_ERROR,<br>&gt=
;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;%s: Bad offset 0x%&quot; HWADDR_PRIx &quot;\n&quot;=
, __func__,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr * 4);<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>&gt;&gt; =
+ =C2=A0 =C2=A0}<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0DB_PRINT(&quot;ti=
mer=3D%d 0x%&quot; HWADDR_PRIx &quot;=3D0x%&quot; PRIx32 &quot;\n&quot;, ti=
mer, addr *<br>&gt;&gt; 4,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ret);<br>&gt;&gt; + =C2=A0 =C2=A0return ret;<br>&gt;&gt; +}<br>&gt;&=
gt; +<br>&gt;&gt; +static void<br>&gt;&gt; +timer_write(void *opaque, hwadd=
r addr,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t val=
64, unsigned int size)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0MSF2TimerS=
tate *t =3D opaque;<br>&gt;&gt; + =C2=A0 =C2=A0struct Msf2Timer *st;<br>&gt=
;&gt; + =C2=A0 =C2=A0int timer =3D 0;<br>&gt;&gt; + =C2=A0 =C2=A0uint32_t v=
alue =3D val64;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0addr &gt;&gt;=3D 2=
;<br>&gt;&gt; + =C2=A0 =C2=A0/*<br>&gt;&gt; + =C2=A0 =C2=A0 * Two independe=
nt timers has same base address.<br>&gt;&gt; + =C2=A0 =C2=A0 * Based on add=
r passed figure out which timer is being used.<br>&gt;&gt; + =C2=A0 =C2=A0 =
*/<br>&gt;&gt; + =C2=A0 =C2=A0if (addr &gt;=3D R_TIM1_MAX) {<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0timer =3D 1;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0addr -=3D R_TIM1_MAX;<br>&gt;<br>&gt;<br>&gt; This is only valid if a=
ddr &lt; (NUM_TIMERS * R_TIM1_MAX).<br>&gt;<br>&gt;<br>Yes you are right. M=
y intention was to treat any address greater than<br>R_TIM1_MAX as timer 2 =
and below default case in switch would take care of<br>addresses which are =
greater than 2 * =C2=A0R_TIM1_MAX. As you mentioned there<div>is problem wi=
th 12..20. If guest sends more than 20 say 24 then 24 - 6 =3D 18</div><div>=
which will be treated as valid but it is not. Thanks for pointing it.<br><d=
iv><br>&gt;&gt; + =C2=A0 =C2=A0}<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0s=
t =3D &amp;t-&gt;timers[timer];<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0DB=
_PRINT(&quot;addr=3D0x%&quot; HWADDR_PRIx &quot; val=3D0x%&quot; PRIx32 &qu=
ot; (timer=3D%d)\n&quot;,<br>&gt;&gt; addr * 4,<br>&gt;&gt; + =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0value, timer);<br>&gt;&gt; +<br>&gt;&gt; + =C2=
=A0 =C2=A0switch (addr) {<br>&gt;&gt; + =C2=A0 =C2=A0case R_TIM_CTRL:<br>&g=
t;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0st-&gt;regs[R_TIM_CTRL] =3D value;<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_update(st);<br>&gt;&gt; + =C2=A0=
 =C2=A0 =C2=A0 =C2=A0break;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0case R=
_TIM_RIS:<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (value &amp; TIMER_RI=
S_ACK) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st-&gt;regs=
[R_TIM_RIS] &amp;=3D ~TIMER_RIS_ACK;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>&gt;&gt; +<br>&gt;&=
gt; + =C2=A0 =C2=A0case R_TIM_LOADVAL:<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0st-&gt;regs[R_TIM_LOADVAL] =3D value;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_ENBL) {<br>&gt;&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_update(st);<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0break=
;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0case R_TIM_BGLOADVAL:<br>&gt;&gt=
; + =C2=A0 =C2=A0 =C2=A0 =C2=A0st-&gt;regs[R_TIM_BGLOADVAL] =3D value;<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0st-&gt;regs[R_TIM_LOADVAL] =3D value;<=
br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>&gt;&gt; +<br>&gt;&gt; +=
 =C2=A0 =C2=A0case R_TIM_VAL:<br>&gt;&gt; + =C2=A0 =C2=A0case R_TIM_MIS:<br=
>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>&gt;&gt; +<br>&gt;&gt; + =
=C2=A0 =C2=A0case R_TIM_MODE:<br>&gt;<br>&gt;<br>&gt; This case is never re=
ached, if the guest wanted to access register 21, since<br>&gt; 21 &gt;=3D =
R_TIM1_MAX you have now addr =3D 21 - R_TIM1_MAX =3D 15.<br>&gt;<br>Yes. I =
overlooked it. Will change it.<br><br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (value &amp; TIMER_MODE) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0qemu_log_mask(LOG_UNIMP, &quot;64-bit mode not supported\n&quo=
t;);<br>&gt;<br>&gt;<br>&gt; No need of trailing &#39;\n&#39;, be more spec=
ific, something like:<br>&gt;<br>&gt; =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP=
, TYPE_MSF2_TIMER &quot;: 64-bit mode not supported&quot;);<br>&gt;<br>Ok. =
Will change it.<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; + =
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0=
default:<br>&gt;<br>&gt;<br>&gt; Once the issue &quot;addr -=3D R_TIM1_MAX&=
quot; is fixed, this default will catch<br>&gt; registers 12 .. 20 silently=
 while there are unimplemented!<br>&gt; I&#39;d rather catch them altogethe=
r and log some &quot;64-bit mode not supported&quot;.<br>&gt;<br>Ok. I will=
 change it.<br><br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (addr &lt; ARRA=
Y_SIZE(st-&gt;regs)) {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0st-&gt;regs[addr] =3D value;<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0} =
else {<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log_mask=
(LOG_GUEST_ERROR,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%s: Bad offset 0x%&quot; HW=
ADDR_PRIx &quot;\n&quot;, __func__,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr * 4);<br>&=
gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0break;<br>&gt;&gt; + =C2=A0 =C2=A0}<br>&gt;&gt; + =C2=A0 =C2=A0timer_=
update_irq(st);<br>&gt;<br>&gt;<br>&gt; Here if addr &gt;=3D (NUM_TIMERS * =
R_TIM1_MAX) you still update Timer1 IRQ, while<br>&gt; this is unharmful ri=
ght now this is likely to be break later.<br>&gt;<br>As long as Interrupt s=
tatus register and Interrupt enable register are not<br>modified calling ti=
mer_update_irq will not harm. Am I missing something here?<br>&gt;&gt; +}<b=
r>&gt;&gt; +<br>&gt;&gt; +static const MemoryRegionOps timer_ops =3D {<br>&=
gt;&gt; + =C2=A0 =C2=A0.read =3D timer_read,<br>&gt;&gt; + =C2=A0 =C2=A0.wr=
ite =3D timer_write,<br>&gt;&gt; + =C2=A0 =C2=A0.endianness =3D DEVICE_NATI=
VE_ENDIAN,<br>&gt;&gt; + =C2=A0 =C2=A0.valid =3D {<br>&gt;&gt; + =C2=A0 =C2=
=A0 =C2=A0 =C2=A0.min_access_size =3D 4,<br>&gt;<br>&gt;<br>&gt; I believe =
min_access_size =3D 1 is valid for any APB device.<br>&gt;<br>&gt;<div>Ok. =
I followed Xilinx soft IP models while writing this. I am really not=C2=A0<=
br></div><div>sure it is mandatory to put access_size. Can i remove it?</di=
v><div>=C2=A0<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_access_size =3D=
 4<br>&gt;&gt; + =C2=A0 =C2=A0}<br>&gt;&gt; +};<br>&gt;&gt; +<br>&gt;&gt; +=
static void timer_hit(void *opaque)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=
=A0struct Msf2Timer *st =3D opaque;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=
=A0st-&gt;regs[R_TIM_RIS] |=3D TIMER_RIS_ACK;<br>&gt;&gt; +<br>&gt;&gt; + =
=C2=A0 =C2=A0if (!(st-&gt;regs[R_TIM_CTRL] &amp; TIMER_CTRL_ONESHOT)) {<br>=
&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0timer_update(st);<br>&gt;&gt; + =C2=
=A0 =C2=A0}<br>&gt;&gt; + =C2=A0 =C2=A0timer_update_irq(st);<br>&gt;&gt; +}=
<br>&gt;&gt; +<br>&gt;&gt; +static void msf2_timer_init(Object *obj)<br>&gt=
;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0MSF2TimerState *t =3D MSF2_TIMER(obj);<=
br>&gt;&gt; + =C2=A0 =C2=A0int i;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0=
/* Init all the ptimers. =C2=A0*/<br>&gt;&gt; + =C2=A0 =C2=A0t-&gt;timers =
=3D g_malloc0((sizeof t-&gt;timers[0]) * NUM_TIMERS);<br>&gt;&gt; + =C2=A0 =
=C2=A0for (i =3D 0; i &lt; NUM_TIMERS; i++) {<br>&gt;&gt; + =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct Msf2Timer *st =3D &amp;t-&gt;timers[i];<br>&gt;&gt; +<b=
r>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0st-&gt;bh =3D qemu_bh_new(timer_hit=
, st);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0st-&gt;ptimer =3D ptimer_in=
it(st-&gt;bh, PTIMER_POLICY_DEFAULT);<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ptimer_set_freq(st-&gt;ptimer, t-&gt;freq_hz);<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0sysbus_init_irq(SYS_BUS_DEVICE(obj), &amp;st-&gt;irq);<=
br>&gt;&gt; + =C2=A0 =C2=A0}<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0memor=
y_region_init_io(&amp;t-&gt;mmio, OBJECT(t), &amp;timer_ops, t,<br>&gt;&gt;=
 TYPE_MSF2_TIMER,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0R_TIM_MAX * 4);<br>&gt;&gt;=
 + =C2=A0 =C2=A0sysbus_init_mmio(SYS_BUS_DEVICE(obj), &amp;t-&gt;mmio);<br>=
&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static Property msf2_timer_propertie=
s[] =3D {<br>&gt;&gt; + =C2=A0 =C2=A0DEFINE_PROP_UINT32(&quot;clock-frequen=
cy&quot;, MSF2TimerState, freq_hz,<br>&gt;&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MSF2_TIMER_FREQ),<br>&=
gt;&gt; + =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>&gt;&gt; +};<br>&gt;&g=
t; +<br>&gt;&gt; +static void msf2_timer_class_init(ObjectClass *klass, voi=
d *data)<br>&gt;&gt; +{<br>&gt;&gt; + =C2=A0 =C2=A0DeviceClass *dc =3D DEVI=
CE_CLASS(klass);<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0dc-&gt;props =3D =
msf2_timer_properties;<br>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +static con=
st TypeInfo msf2_timer_info =3D {<br>&gt;&gt; + =C2=A0 =C2=A0.name =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TYPE_MSF2_TIMER,<br>&gt;&gt; + =C2=A0 =C2=A0=
.parent =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D TYPE_SYS_BUS_DEVICE,<br>&gt;&gt; + =
=C2=A0 =C2=A0.instance_size =3D sizeof(MSF2TimerState),<br>&gt;&gt; + =C2=
=A0 =C2=A0.instance_init =3D msf2_timer_init,<br>&gt;&gt; + =C2=A0 =C2=A0.c=
lass_init =C2=A0 =C2=A0=3D msf2_timer_class_init,<br>&gt;&gt; +};<br>&gt;&g=
t; +<br>&gt;&gt; +static void msf2_timer_register_types(void)<br>&gt;&gt; +=
{<br>&gt;&gt; + =C2=A0 =C2=A0type_register_static(&amp;msf2_timer_info);<br=
>&gt;&gt; +}<br>&gt;&gt; +<br>&gt;&gt; +type_init(msf2_timer_register_types=
)<br>&gt;&gt; diff --git a/include/hw/timer/msf2-timer.h b/include/hw/timer=
/msf2-timer.h<br>&gt;&gt; new file mode 100644<br>&gt;&gt; index 0000000..1=
0eb2f8<br>&gt;&gt; --- /dev/null<br>&gt;&gt; +++ b/include/hw/timer/msf2-ti=
mer.h<br>&gt;&gt; @@ -0,0 +1,85 @@<br>&gt;&gt; +/*<br>&gt;&gt; + * Microsem=
i SmartFusion2 Timer.<br>&gt;&gt; + *<br>&gt;&gt; + * Copyright (c) 2017 Su=
bbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@=
gmail.com</a>&gt;<br>&gt;&gt; + *<br>&gt;&gt; + * Permission is hereby gran=
ted, free of charge, to any person obtaining<br>&gt;&gt; a copy<br>&gt;&gt;=
 + * of this software and associated documentation files (the &quot;Softwar=
e&quot;),<br>&gt;&gt; to deal<br>&gt;&gt; + * in the Software without restr=
iction, including without limitation the<br>&gt;&gt; rights<br>&gt;&gt; + *=
 to use, copy, modify, merge, publish, distribute, sublicense, and/or<br>&g=
t;&gt; sell<br>&gt;&gt; + * copies of the Software, and to permit persons t=
o whom the Software is<br>&gt;&gt; + * furnished to do so, subject to the f=
ollowing conditions:<br>&gt;&gt; + *<br>&gt;&gt; + * The above copyright no=
tice and this permission notice shall be<br>&gt;&gt; included in<br>&gt;&gt=
; + * all copies or substantial portions of the Software.<br>&gt;&gt; + *<b=
r>&gt;&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY=
 OF ANY KIND,<br>&gt;&gt; EXPRESS OR<br>&gt;&gt; + * IMPLIED, INCLUDING BUT=
 NOT LIMITED TO THE WARRANTIES OF<br>&gt;&gt; MERCHANTABILITY,<br>&gt;&gt; =
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT<br>&g=
t;&gt; SHALL<br>&gt;&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR=
 ANY CLAIM, DAMAGES OR<br>&gt;&gt; OTHER<br>&gt;&gt; + * LIABILITY, WHETHER=
 IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,<br>&gt;&gt; ARISING FROM,<br>=
&gt;&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER =
DEALINGS<br>&gt;&gt; IN<br>&gt;&gt; + * THE SOFTWARE.<br>&gt;&gt; + */<br>&=
gt;&gt; +<br>&gt;&gt; +#ifndef HW_MSF2_TIMER_H<br>&gt;&gt; +#define HW_MSF2=
_TIMER_H<br>&gt;&gt; +<br>&gt;&gt; +#include &quot;qemu/osdep.h&quot;<br>&g=
t;&gt; +#include &quot;hw/sysbus.h&quot;<br>&gt;&gt; +#include &quot;hw/pti=
mer.h&quot;<br>&gt;&gt; +#include &quot;sysemu/sysemu.h&quot;<br>&gt;&gt; +=
#include &quot;qemu/log.h&quot;<br>&gt;&gt; +<br>&gt;&gt; +#define TYPE_MSF=
2_TIMER =C2=A0 =C2=A0 &quot;msf2-timer&quot;<br>&gt;&gt; +#define MSF2_TIME=
R(obj) =C2=A0 =C2=A0 OBJECT_CHECK(MSF2TimerState, \<br>&gt;&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(obj), TYPE_MSF2_TIMER)<br>&gt;&gt; +<br>&gt;&gt; +=
/*<br>&gt;&gt; + * There are two 32-bit down counting timers.<br>&gt;&gt; +=
 * Timers 1 and 2 can be concatenated into a single 64-bit Timer<br>&gt;&gt=
; + * that operates either in Periodic mode or in One-shot mode.<br>&gt;&gt=
; + * Writing 1 to the TIM64_MODE register bit 0 sets the Timers in 64-bit<=
br>&gt;&gt; mode.<br>&gt;&gt; + * In 64-bit mode, writing to the 32-bit reg=
isters has no effect.<br>&gt;&gt; + * Similarly, in 32-bit mode, writing to=
 the 64-bit mode registers<br>&gt;&gt; + * has no effect. Only two 32-bit t=
imers are supported currently.<br>&gt;&gt; + */<br>&gt;&gt; +#define NUM_TI=
MERS =C2=A0 =C2=A0 =C2=A0 =C2=A02<br>&gt;&gt; +<br>&gt;&gt; +#define MSF2_T=
IMER_FREQ =C2=A0 (83 * 1000000)<br>&gt;<br>&gt;<br>&gt; I can not find this=
 value, can you point me to the datasheet? It seems SoC<br>&gt; specific to=
 me.<br>&gt;</div><div>It is configured in Microsemi Libero. The SOM kit fr=
om Emcraft comes with this default setting.</div><div>I guess this property=
 should be set and passed from board file and not from SoC.</div><div>Am I =
correct?</div><div>Can I attach the datasheet to this thread?</div><div><br=
></div><div>Thank you,</div><div>Sundeep</div><div>&gt;<br>&gt;&gt; +<br>&g=
t;&gt; +#define R_TIM_VAL =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>&gt;&gt; +#defin=
e R_TIM_LOADVAL =C2=A0 =C2=A0 1<br>&gt;&gt; +#define R_TIM_BGLOADVAL =C2=A0=
 2<br>&gt;&gt; +#define R_TIM_CTRL =C2=A0 =C2=A0 =C2=A0 =C2=A03<br>&gt;&gt;=
 +#define R_TIM_RIS =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>&gt;&gt; +#define R_TI=
M_MIS =C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>&gt;&gt; +#define R_TIM1_MAX =C2=A0 =
=C2=A0 =C2=A0 =C2=A06<br>&gt;&gt; +<br>&gt;&gt; +#define R_TIM_MODE =C2=A0 =
=C2=A0 =C2=A0 21<br>&gt;&gt; +#define R_TIM_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0=
22 /* including 64-bit timer registers */<br>&gt;&gt; +<br>&gt;&gt; +#defin=
e TIMER_CTRL_ENBL =C2=A0 =C2=A0 (1 &lt;&lt; 0)<br>&gt;&gt; +#define TIMER_C=
TRL_ONESHOT =C2=A0(1 &lt;&lt; 1)<br>&gt;&gt; +#define TIMER_CTRL_INTR =C2=
=A0 =C2=A0 (1 &lt;&lt; 2)<br>&gt;&gt; +#define TIMER_RIS_ACK =C2=A0 =C2=A0 =
=C2=A0 (1 &lt;&lt; 0)<br>&gt;&gt; +#define TIMER_RST_CLR =C2=A0 =C2=A0 =C2=
=A0 (1 &lt;&lt; 6)<br>&gt;&gt; +#define TIMER_MODE =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(1 &lt;&lt; 0)<br>&gt;&gt; +<br>&gt;&gt; +struct Msf2Timer {<br>&=
gt;&gt; + =C2=A0 =C2=A0QEMUBH *bh;<br>&gt;&gt; + =C2=A0 =C2=A0ptimer_state =
*ptimer;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0uint32_t regs[R_TIM_MAX];=
<br>&gt;&gt; + =C2=A0 =C2=A0qemu_irq irq;<br>&gt;&gt; +};<br>&gt;&gt; +<br>=
&gt;&gt; +typedef struct MSF2TimerState {<br>&gt;&gt; + =C2=A0 =C2=A0SysBus=
Device parent_obj;<br>&gt;&gt; +<br>&gt;&gt; + =C2=A0 =C2=A0MemoryRegion mm=
io;<br>&gt;&gt; + =C2=A0 =C2=A0uint32_t freq_hz;<br>&gt;&gt; + =C2=A0 =C2=
=A0struct Msf2Timer *timers;<br>&gt;&gt; +} MSF2TimerState;<br>&gt;&gt; +<b=
r>&gt;&gt; +#endif /* HW_MSF2_TIMER_H */<br>&gt;<br>&gt;<br>&gt; Regards,<b=
r>&gt;<br>&gt; Phil.</div></div></div></div>

--001a11490122eddbec054f2abbff--

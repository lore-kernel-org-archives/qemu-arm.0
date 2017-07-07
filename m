Received: by 10.25.44.15 with SMTP id s15csp2981016lfs;
        Fri, 7 Jul 2017 00:00:16 -0700 (PDT)
X-Received: by 10.55.140.71 with SMTP id o68mr67939282qkd.18.1499410816566;
        Fri, 07 Jul 2017 00:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499410816; cv=none;
        d=google.com; s=arc-20160816;
        b=EXaRpERBQ7zy91n93pCIwnQdGR6chjDl3Ovu3Jv7wpNl9TYkZnAgCePh3WRaeweJh7
         sMG9NeB3EaGLwfPAnXiO/pDwpMzP59RUxHeP6TlPTtK5ogngHSw40hVp09VUdmCIMW2T
         j5uWs0TJfHgGVxWwlnviZzrMYIliVGXPeT97Qo7qxOw4dFcY7Q2P8xMSNme5aODDXx47
         8ff3TjLhVygwHej3SOwYwpnYJIlxKrTXVmA2pkTZ4JVmVf21V8lo9fYGsQoMUblEophz
         Sak/04cXq6vXs4G+aq2NE2rLbMcevF1Aq0GOEuzdW08zMXiNXLqyVUkwheQo+h9+bkmL
         4iNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3UPtNgPLAxrSik1KbG/x/AQ/NqAdvOyrpjb8GsVG1Wg=;
        b=ptQ+b0pmOEK1sdINIm57p3s6tBgZqqjhMQ69WEsdlNiv8a3OEPqK2mbkrntl7LvFj+
         iyDoiSUThOBBeJcicS40mW/Ie19evtVUmrcz7neU/wpHbK2bgLVWHRYNbhOxgQPnPyGb
         wX7kSgefGK/pCLnFeCAogWalTLEu/Tfu+Ts6Sqe/nqpVChH4osy+LU3RXB1kbBQ0O/yw
         5UHw4Ur7/2CMYjFoKMjrhE4WYUI8Tza3ymWgS5gdMNb1GsaN+DJ6xvUUH8lXq85gnugO
         h0+aAFGG/5qGUV/Z4+vntxOdYrlpZsSNhisV6LcIMilIVY+0XlAhY666n3GGASNhhSpO
         gRPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.b=GTfw36CM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b73si2417325qkc.387.2017.07.07.00.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 00:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.b=GTfw36CM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTNFN-0004aM-RQ
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 03:00:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dTNEZ-0004IX-HF
	for qemu-devel@nongnu.org; Fri, 07 Jul 2017 02:59:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dTNEX-00017f-EG
	for qemu-devel@nongnu.org; Fri, 07 Jul 2017 02:59:23 -0400
Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242]:35333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dTNEX-000179-7V; Fri, 07 Jul 2017 02:59:21 -0400
Received: by mail-yb0-x242.google.com with SMTP id p203so1027889yba.2;
	Thu, 06 Jul 2017 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ewRT/j6UzcnKAukPm276CcIy3iOXzGqsR89RZl5RyEw=;
	b=GTfw36CMJiO06tzF9LvdF/60jlYhBRtQFKWo8sVkzGFin1uGk/kSuVWAyjWE7H5EZ9
	JWq7x2tB2l6dI2lHlztZBfuT+3Xw80gRP0J1FlVriFkjw2diuE+LB7zHYuBTJvufmrFv
	9xQYjsMQrHswAutzJwwfrHG3zKklvoQ9CCZebuYtsduavvMdoZYgNeAsxSRC3oSk7tW8
	z3YEN5A0d9DeX17hWHKfJthp45aCM7MJ2WT+WPJ37RbLeWvHqBGhUpUJ4XCrjOVsKZ3O
	1XR+U6VIErvcqvH4Y7FGfwbTvWjFmK6OOwc39nhRW11aBEK6boxTqbxuZ+j3FDk9cnRO
	sE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ewRT/j6UzcnKAukPm276CcIy3iOXzGqsR89RZl5RyEw=;
	b=Q1rbMKBgDLA6QyiQCfNDN4rMvaBd70bBdAdryDPkvJiLAdM6ZMjp9ef++ZgFLFSbQr
	GKgrD4UgjgBX6WzVP9U42xfqXHoSv8pkvuLkcwr7Fx7oa6YiBQff3JxgPIygN/c1zPbV
	wVS7/NXUVRKCaBfw+kyW5uRTp8C6ukADGRNxdVvXzS2o54bcXrt6Abs4Oo0x04XiVbfw
	7pkZ4tiPWsA44JZbVHjXNhM7uBybhH4runkZE+Qf2CW/vpG1QX+W4yTG6XhYRRMUVh/H
	CTxI+1XHrzZg8SHMkUwoEG8LC1hr6GcwkvHxPbiGWkq0A5w4agj2n5z+qZEHMoSnueTd
	hAuQ==
X-Gm-Message-State: AIVw111lvrSdMVOe+ZzlmXK7mqHNvYEsay71WHWFk6bewpGb1te1pwow
	YKojARBjkZ2JviSFmUujCYyoyXdCEg==
X-Received: by 10.37.66.142 with SMTP id p136mr3147852yba.240.1499410758685;
	Thu, 06 Jul 2017 23:59:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.233.5 with HTTP; Thu, 6 Jul 2017 23:59:18 -0700 (PDT)
In-Reply-To: <CAKmqyKOyaJQKOmGK=+jgUOJ5vKeUXJH2OEQmxU-qsD8ftC-25Q@mail.gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
	<1499057115-6773-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKOyaJQKOmGK=+jgUOJ5vKeUXJH2OEQmxU-qsD8ftC-25Q@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 7 Jul 2017 12:29:18 +0530
Message-ID: <CALHRZupANibMTMgYAPRZeVEsb3WzA-PAC60yLnJQ1h-faO2aBg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::242
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu devel v6 PATCH 1/5] msf2: Add Smartfusion2
 System timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eBFg5aIJ/na3

Hi Alistair,

On Wed, Jul 5, 2017 at 11:26 PM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Sun, Jul 2, 2017 at 9:45 PM, Subbaraya Sundeep
> <sundeep.lkml@gmail.com> wrote:
> > Modelled System Timer in Microsemi's Smartfusion2 Soc.
> > Timer has two 32bit down counters and two interrupts.
> >
> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > ---
> >  hw/timer/Makefile.objs       |   1 +
> >  hw/timer/mss-timer.c         | 261 ++++++++++++++++++++++++++++++
> +++++++++++++
> >  include/hw/timer/mss-timer.h |  67 +++++++++++
> >  3 files changed, 329 insertions(+)
> >  create mode 100644 hw/timer/mss-timer.c
> >  create mode 100644 include/hw/timer/mss-timer.h
> >
> > diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
> > index dd6f27e..fc4d2da 100644
> > --- a/hw/timer/Makefile.objs
> > +++ b/hw/timer/Makefile.objs
> > @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) +=
> stm32f2xx_timer.o
> >  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
> >
> >  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
> > +common-obj-$(CONFIG_MSF2) += mss-timer.o
> > diff --git a/hw/timer/mss-timer.c b/hw/timer/mss-timer.c
> > new file mode 100644
> > index 0000000..e46d118
> > --- /dev/null
> > +++ b/hw/timer/mss-timer.c
> > @@ -0,0 +1,261 @@
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
> > +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
>
> Shouldn't this just be: addr < R_TIM1_MAX?


> At this point you have already subjected the offset for multiple timers.
>

Yes. You are right. NUM_TIMERS * R_TIM1_MAX will also work but offsets are
already changed so I will change to  addr < R_TIM1_MAX.


> > +            ret = st->regs[addr];
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");
>
> Maybe add a return here so you don't print the other debug message after
> this.
>
> Ok I will change.

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
> > +        if (addr < NUM_TIMERS * R_TIM1_MAX) {
>
> Same comment as above.
>

Ok.

>
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
>
> Once those comments above are addressed:
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>

Thank you.
Sundeep


>
> Thanks,
> Alistair
>

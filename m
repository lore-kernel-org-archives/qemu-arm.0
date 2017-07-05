Received: by 10.25.44.15 with SMTP id s15csp1031890lfs;
        Wed, 5 Jul 2017 10:56:46 -0700 (PDT)
X-Received: by 10.55.198.156 with SMTP id s28mr55011969qkl.222.1499277405922;
        Wed, 05 Jul 2017 10:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499277405; cv=none;
        d=google.com; s=arc-20160816;
        b=Xheit4xoUmbG2YDvvjiUcTtJ+JDXIXBKopmoN4W1onSj3pvtvbvWCmz/JMPRxQCkT1
         q4isEOn/uQ3jtRhoAVGkl71ARjVnfGSKnZ7Q7YATr7jVuVtdpfYyv9wdGgU6+e2K8QlE
         Mca2zkiBzxjm3Ti9OFBmkhQiZv/EHTAbFW8uxRgRI79jTXIE/Omdd8ZP5YBXGeQ4yv6A
         XM0noS/Fqi/pv7bl8PCBz+rskHvv63gfQPNdJ1sORNXVHSsraqzEB1n78oGoJaNQsN3J
         16PdeMFFbAO5fRPz0JfS9YntHyRIta/JvhZL1CUIN0czySKF36b76N9LH8BpcXPMR3BN
         Ov7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=oA6Cpv7Fd8syPCJy0bIlK/Ba2XdpwjG/0jMnJpNK/rc=;
        b=mX2NzZoR3YBBt719lbJUCXFyHgitJnQWmuxMTSPyKeNlJtvlZGOO8GzkPIPEUVmiya
         PanngWdjOe/AyUefjPnq21rXGDGo6e+d0npLXPqU+/AiJDYw/JdIh6TF2o2pBGHN2Y+h
         uYcjR9nBMVMrw+ClquOBnP7Sg0NuQTuRYVGqLjIJOQTr1S8jglZ39nB3tNCTsPuKZJAI
         4CPKnwbSWMxph/29yvt5gy+qWBBlRWHlcHYj77qk7jOkkcbwFFOG+AvOlalM60wcwl0H
         zeSv7QPrjNNPNmeK/wPR1t8ML9gyDRnil+J4eFL44OcKflT520tam4mpla1MyrgqEwk2
         dJrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Ak0PvO2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h5si21463150qtf.378.2017.07.05.10.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 10:56:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=Ak0PvO2c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSoXb-0000wC-8p
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 13:56:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dSoXX-0000uy-JO
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 13:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dSoXW-0008HB-3f
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 13:56:39 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:33795)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dSoXS-0008Er-ST; Wed, 05 Jul 2017 13:56:35 -0400
Received: by mail-wm0-x243.google.com with SMTP id p204so34160801wmg.1;
	Wed, 05 Jul 2017 10:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oA6Cpv7Fd8syPCJy0bIlK/Ba2XdpwjG/0jMnJpNK/rc=;
	b=Ak0PvO2cgpzhgaFESTOB6XdEeTnNhpyW0mDbNDkmAFmRHteUXXR26ZknW+aQI2tKUQ
	21I1gkp2IH089IChvFr2hh4oLeWzpKrHC0YILEsulPaNcVulA1U/erPdqkOfg9WakwS+
	9xQkGnnxm616CpKiHBB4ZGlakU+iWTHHSojMQ26CuvBCZLUrN2eJZf4Wjra4gAkOIVL3
	x6YYN5jHCBcXi1N/arZtYSIOPxXD1Y7lQ3c2oTw5Yi+MSw9Z4Zw90jTNq0tgiEeuDLu+
	2rJFI8gBMBMzjZvWM8VwD60i4+7A4WF7z1CgnYPzsmMCXoUINUc6AkVEhtbBjn4FQjKo
	YenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oA6Cpv7Fd8syPCJy0bIlK/Ba2XdpwjG/0jMnJpNK/rc=;
	b=jGYM/xhKqEa8JrsZb58/q4dZzjX38iMW4BBobwvJo7OucOdtnlHFJZJRR42C6Qa4fE
	rOv5UorbkASFnTiiJL9+V1XH6osewZAY5ZRSYfYAeFcQc0dfqYq7FEyqBUAv+9lCzO4K
	GqVL9RUbLjd4USdWXM8kK4oQWCWpQy/HjYKjMuI+/JfGdppYaxCCSzKaMZ57PgRYBE9T
	Fj1Slc6QCHqxZVuz6L2hmojPE1I/n+o1vM5VSvAJQK79wi2Tnt+LoqhAbFmWE83z0Dmu
	6xjOn4MhNmC6JIukq9BhA4dXWW5mkBHU13qWHnwUZuDohiS/LdPRWRbQROn0NPDc1ckg
	BttA==
X-Gm-Message-State: AKS2vOwx+Ccw2iRHW2ZZKq2NoA/4kP6Ta9Bh4LzuYyM0MuMpecAh4Cc7
	vgV7BenNKvI5cd1yjcBQMV68g4eF+A==
X-Received: by 10.28.203.79 with SMTP id b76mr24467686wmg.81.1499277393525;
	Wed, 05 Jul 2017 10:56:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Wed, 5 Jul 2017 10:56:02 -0700 (PDT)
In-Reply-To: <1499057115-6773-2-git-send-email-sundeep.lkml@gmail.com>
References: <1499057115-6773-1-git-send-email-sundeep.lkml@gmail.com>
	<1499057115-6773-2-git-send-email-sundeep.lkml@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Jul 2017 10:56:02 -0700
Message-ID: <CAKmqyKOyaJQKOmGK=+jgUOJ5vKeUXJH2OEQmxU-qsD8ftC-25Q@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::243
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
X-TUID: lXPnb9lISOkG

On Sun, Jul 2, 2017 at 9:45 PM, Subbaraya Sundeep
<sundeep.lkml@gmail.com> wrote:
> Modelled System Timer in Microsemi's Smartfusion2 Soc.
> Timer has two 32bit down counters and two interrupts.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  hw/timer/Makefile.objs       |   1 +
>  hw/timer/mss-timer.c         | 261 +++++++++++++++++++++++++++++++++++++++++++
>  include/hw/timer/mss-timer.h |  67 +++++++++++
>  3 files changed, 329 insertions(+)
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
> index 0000000..e46d118
> --- /dev/null
> +++ b/hw/timer/mss-timer.c
> @@ -0,0 +1,261 @@
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
> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {

Shouldn't this just be: addr < R_TIM1_MAX?

At this point you have already subjected the offset for multiple timers.

> +            ret = st->regs[addr];
> +        } else {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                        TYPE_MSS_TIMER": 64-bit mode not supported\n");

Maybe add a return here so you don't print the other debug message after this.

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
> +        if (addr < NUM_TIMERS * R_TIM1_MAX) {

Same comment as above.

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

Once those comments above are addressed:

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp5663817wrx;
        Thu, 21 Feb 2019 03:42:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaG3yTtJjLAm2BVWdrxun/vsO14veg3sHPHIFXE0dD0RCw8gdvjotnUReclnsqysFlYIGnU
X-Received: by 2002:a0d:c944:: with SMTP id l65mr12460115ywd.34.1550749354163;
        Thu, 21 Feb 2019 03:42:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550749354; cv=none;
        d=google.com; s=arc-20160816;
        b=oaqzvUty5qfZf74mZK3Nit+EgmjttUojR7FmtMOik4yk4zQcBNtYkWSHFd08d84fB+
         y0H/lYUVVJlnY0dJLU7sX4vM+3y1ucit4naQkol1M1G3hwGtOfpMHnAKggoiwdW7GXLL
         qVaamCTd7l2atbkF4z72vTkTjhRP5DeCHyYJVA4XPe0XdcEz6B5tB9cu82T+QtGg0hYI
         1HfpZUnUPAEbSo4MG2cdl9+eN8ff32CILOVfX59hg/ult4Pb+nZpzb4PuUPszf4pKI7h
         dOOhg31TXNvDiFcJ9R7c1ZPrb6WBdlSHJ0U+X2cwt+EtcwUiKaLi3hfZVHq+A3GC0/ts
         QH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+sq5v6rJ8LRuBQFgqBnosN7tEhY8tgz4b/3L5QFP+eM=;
        b=oVKNrJm9O85FTt2k0PhxRXVXS7F00RItzMh3Kn7LGJ7zGaWQ3vXOgn8fRGMbnwqALY
         yKJUW3IYVpNq/qk7otr5teEVk4j8dVfBCH908erilqyVwMmw7Oj2Pc+9TxXwCOwVRSNK
         +Oz+w0/eR31vt/atYzQ6HpHigX9V9kiy667lvd5Sxm9QDPrgb3yPUwNZiMdmGf8MCGEz
         41uzUL/bshMhCRd6NiIGAUWFiRwEt2aw9Fcz9aqT29dr4O+HQNLxXWg4rOsuYo99l/TT
         7hnISEDohKL8BvnX5OaOySr0qpinRS+W9szROb4BZCDwNYNUXZcMWlgtmLxssON7Y6qv
         j9tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lq5lxMsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191si12476812ybr.410.2019.02.21.03.42.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Feb 2019 03:42:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lq5lxMsi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58892 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwmkL-0006tn-LU
	for alex.bennee@linaro.org; Thu, 21 Feb 2019 06:42:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gwmZt-0006ou-9d
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 06:31:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gwmZq-0005C0-CX
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 06:31:44 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40958)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gwmZo-000592-5y
	for qemu-arm@nongnu.org; Thu, 21 Feb 2019 06:31:42 -0500
Received: by mail-ot1-x343.google.com with SMTP id v20so12632845otk.7
	for <qemu-arm@nongnu.org>; Thu, 21 Feb 2019 03:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+sq5v6rJ8LRuBQFgqBnosN7tEhY8tgz4b/3L5QFP+eM=;
	b=Lq5lxMsi1ybsH1fxagrgc/+0npJ1dfWCDZTkTrt5A0/JCPG6eJsIp0QKl51Ouybuk1
	jm4oRFn5BMFMqtckICYw/cmu2F62Jm2WyTKGE6vNiVbRQRppq1OZ1UqjjENbCAW5sCrE
	l/7PX08Aj9VnomrhNvI969Kosd3HEHzHzFnjhyB55k2JWU1tPZrSCgB1+J0Q0heM9kX/
	wuC8Ha+hUpTr8BihEMI4h2KoEijrOXffdxy1WMBChLpmF+YriWamkSGuXM1bBUrV+jb5
	UgCygOyiGCowxv4JmMjxn4tGw5eVo8KcCzsHAQmYOXtwM1q13CsNiK2gNtMd2jsQ4WFM
	k8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+sq5v6rJ8LRuBQFgqBnosN7tEhY8tgz4b/3L5QFP+eM=;
	b=roZSRsaqtomrz5eYaCEe0oRkqgKxIV7kUPzMwBKpE+YqKMNsmgx9q/GTdHF/SBgwzu
	sZxToCO5DKIkBdCcyKfkVBCbIEAT5NhSLDrWu6wFZ046uniHJSz98EmJNatn2thClu6I
	Uebu2xty4jbCWqhJdFwPhfELdOES6GknYN/6GsKUWCHQ1KTUNmPm1japdHoykVLkpPCL
	m+FKxYKywGNkrRo1iLYr4nz5OzW+Zkn9lS8abC2+FGuzNOWjZESiuW6t+NheVXxYnJ7c
	4l2beFthPAtMJBvfrabd8U6W2H2UYxrrum6Prlfq1jlB5YNB3ftCukvdzmeRMKsHizbJ
	YWew==
X-Gm-Message-State: AHQUAubYVth4+juu18FOH8022IXM/ICZVK1oXh0yPrmYcDG8CMZyN7wj
	iKB1gs2cgVeG7zdWfA/sLjEx+2BvpDG4ooBw8rGS4w==
X-Received: by 2002:a9d:4e8b:: with SMTP id v11mr7980462otk.316.1550748695415; 
	Thu, 21 Feb 2019 03:31:35 -0800 (PST)
MIME-Version: 1.0
References: <20190215155919.GA10823@nyan>
In-Reply-To: <20190215155919.GA10823@nyan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Feb 2019 11:31:24 +0000
Message-ID: <CAFEAcA9yEBy-=-2oSDqAXLffGjU7Aa9MeVtYFCU29qxerWb23A@mail.gmail.com>
To: Mark <alnyan@airmail.cc>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [v4 PATCH] hw/arm/bcm2835_peripherals: add bcm283x
 arm timer
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
Cc: "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IAAHIeoCwSna

On Fri, 15 Feb 2019 at 15:59, Mark <alnyan@airmail.cc> wrote:
>
> Signed-off-by: Mark <alnyan@airmail.cc>
> ---

Hi Mark; thanks for this patch.


> --- /dev/null
> +++ b/hw/timer/bcm283x_timer.c
> @@ -0,0 +1,271 @@
> +/*
> + * Broadcom BCM283x ARM timer variant based on ARM SP804
> + * Copyright (c) 2019, Mark <alnyan@airmail.cc>

Could we have your full name in the Copyright and
Signed-off-by: lines, please? (Unless you do only have
a single name; I know some people don't have two names...)

> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version
> + * 2 of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License along
> + * with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/timer.h"
> +#include "qemu-common.h"
> +#include "hw/qdev.h"
> +#include "hw/timer/bcm283x_timer.h"
> +#include "qemu/main-loop.h"
> +#include "qemu/log.h"
> +
> +#define TIMER_CTRL_32BIT            (1 << 1)
> +#define TIMER_CTRL_DIV1             (0 << 2)
> +#define TIMER_CTRL_DIV16            (1 << 2)
> +#define TIMER_CTRL_DIV256           (2 << 2)
> +#define TIMER_CTRL_IE               (1 << 5)
> +#define TIMER_CTRL_ENABLE           (1 << 7)
> +#define TIMER_CTRL_ENABLE_FREECNTR  (1 << 9)

You might like to look at the include/hw/registerfields.h macros,
which would let you define these register fields like this:

FIELD(CTRL, 32BIT, 1, 1)
FIELD(CTRL, DIV, 2, 2)
FIELD(CTRL, IE, 5, 1)

...
and defines macros R_CTRL_32BIT_MASK, R_CTRL_32BIT_SHIFT, and
R_CTRL_32BIT_LENGTH, etc for you. You can also then say
  FIELD_EX32(s->control, CTRL, DIV)
to get the value of the DIV field in the register, or
  s->control = FIELD_DP32(s->control, CTRL, DIV, 2);
to write 2 into the DIV field.

I think this ends up easier to read than doing raw bit
shifting and masking, but it's up to you.

You can also use the REG32() macro to define symbolic
names for register offsets:
REG32(FOO, 0x04)
defines A_FOO to be 0x04 (the address offset of the register)
and R_FOO to be 0x1 (the integer offset, useful if you're
keeping register values in a uint32_t array, though you
aren't here and I wouldn't recommend that for this case).

> +
> +/* BCM283x's implementation of SP804 ARM timer */
> +
> +static void bcm283x_timer_set_irq(void *opaque, int irq, int level)
> +{
> +    BCM283xTimerState *s = BCM283xTimer(opaque);
> +
> +    s->int_level = level;
> +    qemu_set_irq(s->irq, s->int_level);
> +}
> +
> +static void bcm283x_timer_update(BCM283xTimerState *s)
> +{
> +    if (s->int_level && (s->control & TIMER_CTRL_IE)) {
> +        qemu_irq_raise(s->irq);
> +    } else {
> +        qemu_irq_lower(s->irq);
> +    }
> +}
> +
> +static void bcm283x_timer_tick(void *opaque)
> +{
> +    BCM283xTimerState *s = BCM283xTimer(opaque);
> +    s->int_level = 1;
> +    bcm283x_timer_update(s);
> +}
> +
> +static void bcm283x_free_timer_tick(void *opaque)
> +{
> +    /* Do nothing */
> +}
> +
> +static uint64_t bcm283x_timer_read(void *opaque, hwaddr offset, unsigned size)
> +{
> +    BCM283xTimerState *s = BCM283xTimer(opaque);
> +
> +    switch (offset >> 2) {
> +    case 0: /* Load register */
> +    case 6: /* Reload register */
> +        return s->limit;
> +    case 1: /* Value register */
> +        return ptimer_get_count(s->timer);
> +    case 2: /* Control register */
> +        return s->control;
> +    case 3: /* IRQ clear/ACK register */
> +        /*
> +         * The register is write-only,
> +         * but returns reverse "ARMT" string bytes
> +         */
> +        return 0x544D5241;
> +    case 4: /* RAW IRQ register */
> +        return s->int_level;
> +    case 5: /* Masked IRQ register */
> +        if ((s->control & TIMER_CTRL_IE) == 0) {
> +            return 0;
> +        }
> +        return s->int_level;
> +    case 8: /* Free-running counter */
> +        return ptimer_get_count(s->free_timer);
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset %x\n", __func__, (int) offset);
> +        return 0;
> +    }
> +}
> +
> +static void bcm283x_timer_write(void *opaque, hwaddr offset, uint64_t value,
> +        unsigned size)
> +{
> +    BCM283xTimerState *s = BCM283xTimer(opaque);
> +    uint32_t freq, freecntr_freq;
> +
> +    switch (offset >> 2) {
> +    case 0: /* Load register */
> +        s->limit = value;
> +        ptimer_set_limit(s->timer, s->limit, 1);
> +        break;
> +    case 1: /* Value register */
> +        /* Read only */

You could log this as a LOG_GUEST_ERROR if you like.

> +        break;
> +    case 2: /* Control register */
> +        if (s->control & TIMER_CTRL_ENABLE) {
> +            ptimer_stop(s->timer);
> +        }
> +
> +        s->control = value;
> +
> +        /* Configure SP804 */
> +        freq = BCM283x_SYSTEM_CLOCK_FREQ / (s->prediv + 1);
> +        /* Set pre-scaler */
> +        switch ((value >> 2) & 3) {
> +        case 1: /* 16 */
> +            freq >>= 4;
> +            break;
> +        case 2: /* 256 */
> +            freq >>= 8;
> +            break;
> +        }
> +        ptimer_set_limit(s->timer, s->limit, s->control & TIMER_CTRL_ENABLE);
> +        ptimer_set_freq(s->timer, freq);
> +
> +        /* Configure free-running counter */
> +        freecntr_freq = BCM283x_SYSTEM_CLOCK_FREQ /
> +            (1 + ((value >> 16) & 0xFF));
> +        if (s->control & TIMER_CTRL_32BIT) {
> +            ptimer_set_limit(s->free_timer, 0xFFFFFFFF,
> +                    s->control & TIMER_CTRL_ENABLE_FREECNTR);
> +        } else {
> +            ptimer_set_limit(s->free_timer, 0xFFFF,
> +                    s->control & TIMER_CTRL_ENABLE_FREECNTR);
> +        }
> +        ptimer_set_freq(s->free_timer, freecntr_freq);
> +
> +        if (s->control & TIMER_CTRL_ENABLE) {
> +            ptimer_run(s->timer, 0);
> +        } else {
> +            ptimer_stop(s->free_timer);

I don't understand this logic. In the SP804 implementation
the control register is handled by:
   if CTRL_ENABLE bit is already set {
       stop the timer
   }
   update the timer parameters;
   if CTRL_ENABLE bit is set in new register value {
       start the timer
   }
which is done to avoid complications with changing timer
parameters while the underlying ptimer is running.

The if/else here is weird because it stops the free timer
in the else clause, but the condition being checked seems
to be the control bit for the other timer.

I would have expected the logic here to be a bit like:

  if CTRL_ENABLE bit set in old register value {
     stop main timer
  }
  if FREECNTR enable bit set in old register value {
     stop free timer
  }
  update parameters for both timers
  if CTRL_ENABLE bit set in new register value {
     start main timer
  }
  if FREECNTR enable bit set in new register value {
     start free timer
  }

(Optionally: don't do the stop-and-restart of timer X
unless the config for it is actually being changed,
so we don't mess with the accuracy of timer X unnecessarily
while we're reconfiguring timer Y.)

> +        }
> +
> +        if (s->control & TIMER_CTRL_ENABLE_FREECNTR) {
> +            ptimer_run(s->free_timer, 0);
> +        } else {
> +            ptimer_stop(s->free_timer);
> +        }
> +        break;
> +    case 3: /* IRQ clear/ACK register */
> +        s->int_level = 0;
> +        break;
> +    case 6: /* Reload register */
> +        s->limit = value;
> +        ptimer_set_limit(s->timer, s->limit, 0);
> +        break;
> +    case 7: /* Pre-divider register */
> +        s->prediv = value;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset %x\n", __func__, (int) offset);
> +        break;
> +    }
> +
> +    bcm283x_timer_update(s);
> +}
> +
> +static const MemoryRegionOps bcm283x_timer_ops = {
> +    .read = bcm283x_timer_read,
> +    .write = bcm283x_timer_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN
> +};
> +
> +static const VMStateDescription vmstate_bcm283x_timer = {
> +    .name = "bcm283x_timer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(control, BCM283xTimerState),
> +        VMSTATE_UINT32(limit, BCM283xTimerState),
> +        VMSTATE_UINT32(int_level, BCM283xTimerState),

You've forgotten prediv, I think.

> +        VMSTATE_PTIMER(timer, BCM283xTimerState),
> +        VMSTATE_PTIMER(free_timer, BCM283xTimerState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void bcm283x_timer_init(Object *obj)
> +{
> +    BCM283xTimerState *s = BCM283xTimer(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init_io(&s->iomem, obj, &bcm283x_timer_ops, s,
> +            TYPE_BCM283xTimer, 0x100);
> +
> +    sysbus_init_mmio(sbd, &s->iomem);
> +    sysbus_init_irq(sbd, &s->irq);
> +}
> +
> +static void bcm283x_timer_reset(DeviceState *dev)
> +{
> +    BCM283xTimerState *s = BCM283xTimer(dev);
> +
> +    s->limit = 0;
> +    s->int_level = 0;
> +    s->control = TIMER_CTRL_IE | (0x0E << 16);

The spec says the reset value of the free-running counter
prescaler is 0x3E -- is it wrong ? (I know that doc does
have a pile of errors.)

> +    s->prediv = 0x7D;
> +
> +    /*
> +     * Stop the timers.
> +     * No need to update freqs/limits as this will automatically be done once
> +     * the system writes control register.
> +     */
> +    ptimer_stop(s->timer);
> +    ptimer_stop(s->free_timer);
> +}
> +
> +static void bcm283x_timer_realize(DeviceState *dev, Error **errp)
> +{
> +    BCM283xTimerState *s = BCM283xTimer(dev);
> +    QEMUBH *bh;
> +
> +    s->limit = 0;
> +    s->int_level = 0;
> +    s->control = TIMER_CTRL_IE | (0x0E << 16);
> +    s->prediv = 0x7D;

You can delete these four lines, as they are handled by the
reset function.

> +
> +    /* Create a regular SP804 timer */
> +    bh = qemu_bh_new(bcm283x_timer_tick, s);
> +    s->timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);

PTIMER_POLICY_DEFAULT is very rarely what you actually
want -- see the comments in include/hw/ptimer.h, which
discuss what you should set to get the same behaviour as
the hardware in various edge cases.

> +    s->irq = qemu_allocate_irq(bcm283x_timer_set_irq, s, 0);

I know this code has come from the sp804 code, but it's
actually wrong (and I should fix the sp804). qemu_allocate_irq()
is for interrupt lines that come into a device, not for ones
that go out from it, like this one. The call happens to have
no visible bad effects because what it does will be overrriden
later when the board code wires up the interrupt to the
interrupt controller. (There will be a tiny memory leak.)

You can just delete the qemu_allocate_irq() call here, and
the bcm283x_timer_set_irq() function.

> +
> +    /* Create a free-running timer */
> +    bh = qemu_bh_new(bcm283x_free_timer_tick, s);
> +    s->free_timer = ptimer_init(bh, PTIMER_POLICY_DEFAULT);
> +
> +    vmstate_register(NULL, -1, &vmstate_bcm283x_timer, s);

You don't need this call to vmstate_register(), because the
setting of k->vmsd below handles registering the vmstate for you.

> +}
> +
> +static void bcm283x_timer_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *k = DEVICE_CLASS(klass);
> +
> +    k->realize = bcm283x_timer_realize;
> +    k->vmsd = &vmstate_bcm283x_timer;
> +    k->reset = bcm283x_timer_reset;
> +}
> +
> +static const TypeInfo bcm283x_timer_info = {
> +    .name           = TYPE_BCM283xTimer,
> +    .parent         = TYPE_SYS_BUS_DEVICE,
> +    .instance_size  = sizeof(BCM283xTimerState),
> +    .instance_init  = bcm283x_timer_init,
> +    .class_init     = bcm283x_timer_class_init

It's generally best to put a trailing ',' even after the
last line in a struct initializer like this -- it means that
if we add another line below it later we don't need to edit
the preceding line just to add the comma.

> +};

thanks
-- PMM

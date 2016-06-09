Received: by 10.25.27.66 with SMTP id b63csp455720lfb;
        Thu, 9 Jun 2016 11:18:16 -0700 (PDT)
X-Received: by 10.55.42.211 with SMTP id q80mr11165802qkq.110.1465496295439;
        Thu, 09 Jun 2016 11:18:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o92si4054620qte.124.2016.06.09.11.18.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Jun 2016 11:18:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bB4X0-0008W1-Mg
	for alex.bennee@linaro.org; Thu, 09 Jun 2016 14:18:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46425)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4Uf-0007G3-5n
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:15:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4UZ-0000Bl-5R
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:15:48 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35961)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bB4UX-0000BN-Rz
	for qemu-devel@nongnu.org; Thu, 09 Jun 2016 14:15:43 -0400
Received: by mail-vk0-x22d.google.com with SMTP id g67so66390949vkb.3
	for <qemu-devel@nongnu.org>; Thu, 09 Jun 2016 11:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uZ7HE8XXGB1EitSdZpyGsB8d3dAtsWo9lnq0J+xHAM0=;
	b=SPe2ZGnJEv1U18+Hv/vUAlg6AfLQyV57SXwresXSiFJKJcYrubZdaIKXTgi88EHETu
	CjcJtP0YlnfGyGcZFynY6aMI/d+ClN2gBNuKmg3qQzWnioyO+MzLfe6VyIfDFhYn4wog
	L84aMvz70ZDt8kaY1Ana8igHkp+PZAnAjFf4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uZ7HE8XXGB1EitSdZpyGsB8d3dAtsWo9lnq0J+xHAM0=;
	b=FI/XyDUaQa7Rz20JF1PVZ4L4Ix+1iGaqyNbgLf201WfBjJz+YUGFwB2yj4519+25MN
	Z4ghZ3+sO/7XgVq2PYfm87TUwOFGyrfCl0/7jgExtCCBwuObCAweFYX4jXRRYbkWRMiy
	1Jq+frWBf0VOVxSpI0fHso07COcxxfBZ3JZfxB04j8zd+HiEf7eql9Qqn3Az/zKZ+/gZ
	AbHcru8IWkEbw3qe4lAHE/Bw+lYMZDUuy3PlvBxQiagNDtde4VA4OHOuSsWPHn7slbJ+
	XE04Fsra5Fsy7rvfioja7JPL8X9LOE+718BOa+aWWEl3BnAnA28BUZQWNYM4mN9VJRFY
	MkAw==
X-Gm-Message-State: ALyK8tK7u9V82TDIMqP3SSxPmUrkNmCJpqzgqdNqgrYU+FIhNK/bcy0av5q0UqHoH8W1R5ZWPVUOvt6IFTQnzSPn
X-Received: by 10.176.5.227 with SMTP id e90mr5568038uae.4.1465496141052; Thu,
	09 Jun 2016 11:15:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Thu, 9 Jun 2016 11:15:21 -0700 (PDT)
In-Reply-To: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
References: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2016 19:15:21 +0100
Message-ID: <CAFEAcA8+3trGJ=6K8fFX4-2Z1N+ZUiBKUcSTR6fYnQtMfNs3rw@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-devel] [PATCH] hw/timer: Add value matching support to
 aspeed_timer
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /lPKlG4higfH

On 27 May 2016 at 06:08, Andrew Jeffery <andrew@aj.id.au> wrote:
> Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=y on the
> palmetto-bmc machine. Two match registers are provided for each timer.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>
> The change pulls out ptimer in favour of the regular timer infrastructure. As a
> consequence it implements the conversions between ticks and time which feels a
> little tedious. Any comments there would be appreciated.

Couple of minor comments below.

>  hw/timer/aspeed_timer.c         | 135 ++++++++++++++++++++++++++++++----------
>  include/hw/timer/aspeed_timer.h |   6 +-
>  2 files changed, 105 insertions(+), 36 deletions(-)
>
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 4b94808821b4..905de0f788b2 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -9,13 +9,12 @@
>   * the COPYING file in the top-level directory.
>   */
>
> +#include <math.h>
>  #include "qemu/osdep.h"

osdep.h must always be the first include.

> -#include "hw/ptimer.h"
>  #include "hw/sysbus.h"
>  #include "hw/timer/aspeed_timer.h"
>  #include "qemu-common.h"
>  #include "qemu/bitops.h"
> -#include "qemu/main-loop.h"
>  #include "qemu/timer.h"
>  #include "qemu/log.h"
>  #include "trace.h"
> @@ -77,21 +76,99 @@ static inline bool timer_can_pulse(AspeedTimer *t)
>      return t->id >= TIMER_FIRST_CAP_PULSE;
>  }
>
> +static inline bool timer_external_clock(AspeedTimer *t)
> +{
> +    return timer_ctrl_status(t, op_external_clock);
> +}
> +
> +static double clock_rates[] = { TIMER_CLOCK_APB_HZ, TIMER_CLOCK_EXT_HZ };
> +
> +static inline double calculate_rate(struct AspeedTimer *t)
> +{
> +    return clock_rates[timer_external_clock(t)];
> +}
> +
> +static inline double calculate_period(struct AspeedTimer *t)
> +{
> +    return NANOSECONDS_PER_SECOND / calculate_rate(t);
> +}
> +
> +static inline uint32_t calculate_ticks(struct AspeedTimer *t, uint64_t now_ns)
> +{
> +    uint64_t delta_ns = now_ns - MIN(now_ns, t->start);
> +    uint32_t ticks = (uint32_t) floor(delta_ns / calculate_period(t));

Do we really need to do this with floating point ?

> +
> +    return t->reload - MIN(t->reload, ticks);
> +}
> +
> +static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
> +{
> +    uint64_t delta_ns;
> +
> +    ticks = MIN(t->reload, ticks);
> +    delta_ns = (uint64_t) floor((t->reload - ticks) * calculate_period(t));
> +
> +    return t->start + delta_ns;
> +}
> +
> +static uint64_t calculate_next(struct AspeedTimer *t)
> +{
> +    uint64_t now;
> +    uint64_t next;
> +    int i;
> +    /* We don't know the relationship between the values in the match
> +     * registers, so sort using MAX/MIN/zero. We sort in that order as the
> +     * timer counts down to zero. */
> +    uint64_t seq[] = {
> +        MAX(t->match[0], t->match[1]),
> +        MIN(t->match[0], t->match[1]),
> +        0,
> +    };
> +
> +    now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    for (i = 0; i < ARRAY_SIZE(seq); i++) {
> +        next = calculate_time(t, seq[i]);
> +        if (now < next) {
> +            return next;
> +        }
> +    }
> +
> +    {
> +        uint64_t reload_ns;
> +
> +        reload_ns = (uint64_t) floor(t->reload * calculate_period(t));
> +        t->start = now - ((now - t->start) % reload_ns);
> +    }
> +
> +    return calculate_next(t);

Why is this recursing ?

> +}
> +
>  static void aspeed_timer_expire(void *opaque)
>  {
>      AspeedTimer *t = opaque;
> +    bool interrupt = false;
> +    uint32_t ticks;
>
> -    /* Only support interrupts on match values of zero for the moment - this is
> -     * sufficient to boot an aspeed_defconfig Linux kernel.
> -     *
> -     * TODO: matching on arbitrary values (see e.g. hw/timer/a9gtimer.c)
> -     */
> -    bool match = !(t->match[0] && t->match[1]);
> -    bool interrupt = timer_overflow_interrupt(t) || match;
> -    if (timer_enabled(t) && interrupt) {
> +    if (!timer_enabled(t)) {
> +        return;
> +    }
> +
> +    ticks = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
> +
> +    if (!ticks) {
> +        interrupt = timer_overflow_interrupt(t) || !t->match[0] || !t->match[1];
> +    } else if (ticks <= MIN(t->match[0], t->match[1])) {
> +        interrupt = true;
> +    } else if (ticks <= MAX(t->match[0], t->match[1])) {
> +        interrupt = true;
> +    }
> +
> +    if (interrupt) {
>          t->level = !t->level;
>          qemu_set_irq(t->irq, t->level);
>      }
> +
> +    timer_mod(&t->timer, calculate_next(t));
>  }
>
>  static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
> @@ -100,7 +177,7 @@ static uint64_t aspeed_timer_get_value(AspeedTimer *t, int reg)
>
>      switch (reg) {
>      case TIMER_REG_STATUS:
> -        value = ptimer_get_count(t->timer);
> +        value = calculate_ticks(t, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL));
>          break;
>      case TIMER_REG_RELOAD:
>          value = t->reload;
> @@ -160,24 +237,21 @@ static void aspeed_timer_set_value(AspeedTimerCtrlState *s, int timer, int reg,
>      switch (reg) {
>      case TIMER_REG_STATUS:
>          if (timer_enabled(t)) {
> -            ptimer_set_count(t->timer, value);
> +            uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +            int64_t delta = (int64_t) value - (int64_t) calculate_ticks(t, now);
> +
> +            t->start += delta * calculate_period(t);
> +            timer_mod(&t->timer, calculate_next(t));
>          }
>          break;
>      case TIMER_REG_RELOAD:
>          t->reload = value;
> -        ptimer_set_limit(t->timer, value, 1);
>          break;
>      case TIMER_REG_MATCH_FIRST:
>      case TIMER_REG_MATCH_SECOND:
> -        if (value) {
> -            /* Non-zero match values are unsupported. As such an interrupt will
> -             * always be triggered when the timer reaches zero even if the
> -             * overflow interrupt control bit is clear.
> -             */
> -            qemu_log_mask(LOG_UNIMP, "%s: Match value unsupported by device: "
> -                    "0x%" PRIx32 "\n", __func__, value);
> -        } else {
> -            t->match[reg - 2] = value;
> +        t->match[reg - 2] = value;
> +        if (timer_enabled(t)) {
> +            timer_mod(&t->timer, calculate_next(t));
>          }
>          break;
>      default:
> @@ -196,21 +270,16 @@ static void aspeed_timer_ctrl_enable(AspeedTimer *t, bool enable)
>  {
>      trace_aspeed_timer_ctrl_enable(t->id, enable);
>      if (enable) {
> -        ptimer_run(t->timer, 0);
> +        t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +        timer_mod(&t->timer, calculate_next(t));
>      } else {
> -        ptimer_stop(t->timer);
> -        ptimer_set_limit(t->timer, t->reload, 1);
> +        timer_del(&t->timer);
>      }
>  }
>
>  static void aspeed_timer_ctrl_external_clock(AspeedTimer *t, bool enable)
>  {
>      trace_aspeed_timer_ctrl_external_clock(t->id, enable);
> -    if (enable) {
> -        ptimer_set_freq(t->timer, TIMER_CLOCK_EXT_HZ);
> -    } else {
> -        ptimer_set_freq(t->timer, TIMER_CLOCK_APB_HZ);
> -    }

>  }
>
>  static void aspeed_timer_ctrl_overflow_interrupt(AspeedTimer *t, bool enable)
> @@ -351,12 +420,10 @@ static const MemoryRegionOps aspeed_timer_ops = {
>
>  static void aspeed_init_one_timer(AspeedTimerCtrlState *s, uint8_t id)
>  {
> -    QEMUBH *bh;
>      AspeedTimer *t = &s->timers[id];
>
>      t->id = id;
> -    bh = qemu_bh_new(aspeed_timer_expire, t);
> -    t->timer = ptimer_init(bh);
> +    timer_init_ns(&t->timer, QEMU_CLOCK_VIRTUAL, aspeed_timer_expire, t);
>  }
>
>  static void aspeed_timer_realize(DeviceState *dev, Error **errp)
> @@ -404,7 +471,7 @@ static const VMStateDescription vmstate_aspeed_timer = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT8(id, AspeedTimer),
>          VMSTATE_INT32(level, AspeedTimer),
> -        VMSTATE_PTIMER(timer, AspeedTimer),
> +        VMSTATE_TIMER(timer, AspeedTimer),
>          VMSTATE_UINT32(reload, AspeedTimer),
>          VMSTATE_UINT32_ARRAY(match, AspeedTimer, 2),
>          VMSTATE_END_OF_LIST()

You need to bump the vmstate version_id and minimum_version_id if
you change the format (and then the version number you use in the
VMSTATE_STRUCT_ARRAY that refers to this one).

> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
> index 44dc2f89d5c6..970fea83143c 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -22,7 +22,8 @@
>  #ifndef ASPEED_TIMER_H
>  #define ASPEED_TIMER_H
>
> -#include "hw/ptimer.h"
> +#include "qemu/typedefs.h"

osdep.h gives you typedefs.h, so don't include it here.

> +#include "qemu/timer.h"
>
>  #define ASPEED_TIMER(obj) \
>      OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
> @@ -33,15 +34,16 @@ typedef struct AspeedTimer {
>      qemu_irq irq;
>
>      uint8_t id;
> +    QEMUTimer timer;
>
>      /**
>       * Track the line level as the ASPEED timers implement edge triggered
>       * interrupts, signalling with both the rising and falling edge.
>       */
>      int32_t level;
> -    ptimer_state *timer;
>      uint32_t reload;
>      uint32_t match[2];
> +    uint64_t start;
>  } AspeedTimer;
>
>  typedef struct AspeedTimerCtrlState {
> --
> 2.7.4

thanks
-- PMM

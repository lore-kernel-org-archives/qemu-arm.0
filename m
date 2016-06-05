Received: by 10.25.27.66 with SMTP id b63csp1121691lfb;
        Sun, 5 Jun 2016 09:21:29 -0700 (PDT)
X-Received: by 10.140.85.8 with SMTP id m8mr11423344qgd.7.1465143689080;
        Sun, 05 Jun 2016 09:21:29 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q185si8529503qkb.158.2016.06.05.09.21.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 Jun 2016 09:21:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       dkim=fail (test mode) header.i=@jms.id.au;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9ano-00072w-Hr
	for alex.bennee@linaro.org; Sun, 05 Jun 2016 12:21:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1b9an1-0006ij-0s
	for qemu-devel@nongnu.org; Sun, 05 Jun 2016 12:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1b9amx-0007g5-Vb
	for qemu-devel@nongnu.org; Sun, 05 Jun 2016 12:20:37 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33167)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>)
	id 1b9amx-0007g0-HW; Sun, 05 Jun 2016 12:20:35 -0400
Received: by mail-qt0-x241.google.com with SMTP id p26so1047914qtc.0;
	Sun, 05 Jun 2016 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=/INNb1Es+mbHFuMrSweJDMvTWSrdpcCfV1HNwyeO2Vk=;
	b=OPB3kozIKOCDocS4wveM7rnTb8cfi9hUGRDajnt8+6HhchCuuDyG9ltrj/2HE4QxLX
	I2y6zEGMNduG9dP5BS/U/a6Je3uiXIJfDjVrBQbyh+NVGIEKz/5OhVET2mVMNvy6RbJU
	CZAFVgr6xpMkflWG6rY7aViAgRovtAvl98gzL1NDy/54DK2M651/2LKQ1hzDRRn86BT3
	2iOrDbBklW+Cuhs9iiTgg6S3qsLPcDJjBMVUPZWMDLnY+G1RtPU1tc4guYiMXE02TWZe
	f7KG5wu8P1oTJAnDDvKP4tMaL7Y469+Mr1xDqo7iz7VyNh+h8X0JcYCyU8xIBEsL1ebH
	0Itg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=/INNb1Es+mbHFuMrSweJDMvTWSrdpcCfV1HNwyeO2Vk=;
	b=ZCoYEhHgNrSmdIVGC3RpOzXHMDWiaBuBL3g5iu7rVTglYP5QGpid33HCZTavGArwJI
	VU9wOpzyTQMvTNWHIEZPxX5sB6IGxEsakIqoPg5Gz9A5CNLZ17WsVPdO+kt9KqkjAcov
	QD/6tep+fr4rmM2hV7DE8eA4JG16ayvXanbGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=/INNb1Es+mbHFuMrSweJDMvTWSrdpcCfV1HNwyeO2Vk=;
	b=SVsv+7CzNwtAvVnFE5WclP7NbY2Ox3Qy+prkONniv3P0TDlA5VYg4YQv6BJMQYKEKE
	jF4SsGcGgMLoiluqg0wDECsHwGjGpCM2WfrLPGkn2/UjyovKqeTZvDoMCUlFHhzaQXoi
	hFo4/D9VmVhWDjle28Fnwpdjf4XNazE0vL2Bn4rFoZeXZv7RxmyLHXMhZpgvuzhvvJNN
	7QtifDRho3JeXDQ/HsFpqY/WHoh9bvnO+TnHzyWgxW1l/3grJYtjVTsKAv03SO1aJ5/G
	l4dBSqpt/fFtiRHY3yAdAsbllirCpTpz0XbgsNK4BJveVcqPXsz0YWngvrJSyOFSP7vr
	YnPA==
X-Gm-Message-State: ALyK8tK+/IH4tO0ILJPzNNycoc1B80BRGE289nMcMcOzA90XKVU1xtiZyv5aqiyYUnF4HidwLEm+Y/DEtjxWYg==
X-Received: by 10.237.53.100 with SMTP id b33mr12234527qte.59.1465143634517;
	Sun, 05 Jun 2016 09:20:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.44.196 with HTTP; Sun, 5 Jun 2016 09:20:15 -0700 (PDT)
In-Reply-To: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
References: <1464325706-11221-1-git-send-email-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Sun, 5 Jun 2016 11:20:15 -0500
X-Google-Sender-Auth: 7oIornlTYHy8qVXacHOaYlQ0zpE
Message-ID: <CACPK8Xc+RiHa44sS7jSA=4JTWWmO0iTqb-Q4MEqk-5u6iWfXug@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::241
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jPrS9CTKwWVt

On Fri, May 27, 2016 at 12:08 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Value matching allows Linux to boot with CONFIG_NO_HZ_IDLE=y on the
> palmetto-bmc machine. Two match registers are provided for each timer.

Thanks for doing this. We now boot faster in my testing.

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Joel Stanley <joel@jms.id.au>

> ---
>
> The change pulls out ptimer in favour of the regular timer infrastructure. As a
> consequence it implements the conversions between ticks and time which feels a
> little tedious. Any comments there would be appreciated.
>
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
>

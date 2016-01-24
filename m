Received: by 10.25.159.19 with SMTP id i19csp645300lfe;
        Sat, 23 Jan 2016 21:25:40 -0800 (PST)
X-Received: by 10.55.71.135 with SMTP id u129mr13936020qka.26.1453613140351;
        Sat, 23 Jan 2016 21:25:40 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b71si16970953qkj.116.2016.01.23.21.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jan 2016 21:25:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aNDBD-0005CC-JW
	for alex.bennee@linaro.org; Sun, 24 Jan 2016 00:25:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNDBA-00058Q-GM
	for qemu-arm@nongnu.org; Sun, 24 Jan 2016 00:25:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aNDB8-0007oK-UO
	for qemu-arm@nongnu.org; Sun, 24 Jan 2016 00:25:36 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:34412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aNDB5-0007mF-9T; Sun, 24 Jan 2016 00:25:31 -0500
Received: by mail-wm0-x22f.google.com with SMTP id u188so29212845wmu.1;
	Sat, 23 Jan 2016 21:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gfUdpgqbCiE5yk3dsgVEiWKf5fyCSKELNnDM7r1M6JM=;
	b=O9rfOs3TRP58RBlVTx+PANd1RpWUQVg4x/jvdDuS/hflP1VkDBultiE18NL0nY1utP
	2IbR1OjgKZ0yXEb66U23/PjhvjtecPjCBOJjrnNWI99oK9T0w2rEh1/xGLwmoqxsKNGo
	rR9j8IleLp1pz1ScRg8VqlEFmyi1YIvX7KmbmP0QvA+ALyyoReD2q8MoyLQ9K6BfDZlK
	IUx5M1f/q7G76tYdev83awC5wVLk30+l2T29ovkVAOpK+lEde3ttUJx+vSoCO6s0QgPG
	AX3n9OSuWyOob5JorGH79o0AZSJlHMWTywVetFVnhwZ9pEOHpcq3/RdLJA3cYhytKnsC
	9P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=gfUdpgqbCiE5yk3dsgVEiWKf5fyCSKELNnDM7r1M6JM=;
	b=hJq6KdULQltkoWDcZS8QloZT/iC96juGmSEczImirJHhyexGXWgQc0toayS5U3DCCG
	N9XK3z+EsPGmlsxKKlvw6Trh2IzKBSJC7pTry8nq1yJ2x8nNgRjHLaXgQcOghdI54hXM
	z+3NyuXip6w8oFMugOYpTEFT44al8QxyGZxNaWhtyCHbMAyq52G0xgTD2iNXF8mAqJD2
	/5emwXcRVqjjNZf7cEHaV0rb+DZeuoIXSMEtGXsW6TsJ+N7eF33fDaIB5ga93PKslqyf
	uedW2hQTiLkJ5tIYtWraNaOpU5b3UcwAYexxxkSixJAQ41d/jsbw75epTqXo4WK7yYhg
	zD+Q==
X-Gm-Message-State: AG10YORt5Xj0lHmlyvb5zerVey8GN0EbE5wJ5VP6hRqj7Q1Q1ZxyOIW1nqkHaS3ydNPSUPFJtEJjnMzi1zFx1g==
MIME-Version: 1.0
X-Received: by 10.28.184.136 with SMTP id i130mr10946865wmf.96.1453613130360; 
	Sat, 23 Jan 2016 21:25:30 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Sat, 23 Jan 2016 21:25:30 -0800 (PST)
In-Reply-To: <7b18c0c2ca44c938a198f56094327ab695f09f9b.1453402860.git.digetx@gmail.com>
References: <cover.1453402860.git.digetx@gmail.com>
	<7b18c0c2ca44c938a198f56094327ab695f09f9b.1453402860.git.digetx@gmail.com>
Date: Sat, 23 Jan 2016 21:25:30 -0800
Message-ID: <CAPokK=rc9z+VA42t-yMYndo=+ZSXKgL03TJoffZS+dgzY7WGgg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v11 7/7] arm_mptimer: Convert to use ptimer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RqgwoRovuyf5

On Thu, Jan 21, 2016 at 11:03 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> Current ARM MPTimer implementation uses QEMUTimer for the actual timer,
> this implementation isn't complete and mostly tries to duplicate of what
> generic ptimer is already doing fine.
>
> Conversion to ptimer brings the following benefits and fixes:
>         - Simple timer pausing implementation
>         - Fixes counter value preservation after stopping the timer
>         - Correctly handles prescaler != 0 cases
>         - Code simplification and reduction
>
> Bump VMSD to version 3, since VMState is changed and is not compatible
> with the previous implementation.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/timer/arm_mptimer.c         | 131 +++++++++++++++++++++--------------------
>  include/hw/timer/arm_mptimer.h |   5 +-
>  2 files changed, 67 insertions(+), 69 deletions(-)
>
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index 3e59c2a..a5f46df 100644
> --- a/hw/timer/arm_mptimer.c
> +++ b/hw/timer/arm_mptimer.c
> @@ -19,8 +19,9 @@
>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include "hw/ptimer.h"
>  #include "hw/timer/arm_mptimer.h"
> -#include "qemu/timer.h"
> +#include "qemu/main-loop.h"
>  #include "qom/cpu.h"
>
>  /* This device implements the per-cpu private timer and watchdog block
> @@ -42,33 +43,34 @@ static inline void timerblock_update_irq(TimerBlock *tb)
>  }
>
>  /* Return conversion factor from mpcore timer ticks to qemu timer ticks.  */
> -static inline uint32_t timerblock_scale(TimerBlock *tb)
> +static inline uint32_t timerblock_scale(uint32_t control)
>  {
> -    return (((tb->control >> 8) & 0xff) + 1) * 10;
> +    return (((control >> 8) & 0xff) + 1) * 10;
>  }
>
> -static void timerblock_reload(TimerBlock *tb, int restart)
> +static inline void timerblock_set_count(struct ptimer_state *timer,
> +                                        uint32_t control, uint64_t *count)
>  {
> -    if (tb->count == 0) {
> -        return;
> +    /* PTimer would immediately trigger interrupt for periodic timer
> +     * when counter set to 0, MPtimer under certain condition only.  */

newline before */

> +    if ((control & 3) == 3 && (*count == 0) && (control & 0xff00) == 0) {
> +        *count = ptimer_get_limit(timer);
>      }
> -    if (restart) {
> -        tb->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    ptimer_set_count(timer, *count);
> +}
> +
> +static inline void timerblock_run(struct ptimer_state *timer, uint32_t control,
> +                                  bool cond)

drop cond ...

> +{
> +    if (cond) {

... control & 1 ...

> +        ptimer_run(timer, !(control & 2));
>      }
> -    tb->tick += (int64_t)tb->count * timerblock_scale(tb);
> -    timer_mod(tb->timer, tb->tick);
>  }
>
>  static void timerblock_tick(void *opaque)
>  {
>      TimerBlock *tb = (TimerBlock *)opaque;
>      tb->status = 1;
> -    if (tb->control & 2) {
> -        tb->count = tb->load;
> -        timerblock_reload(tb, 0);
> -    } else {
> -        tb->count = 0;
> -    }
>      timerblock_update_irq(tb);
>  }
>
> @@ -76,21 +78,11 @@ static uint64_t timerblock_read(void *opaque, hwaddr addr,
>                                  unsigned size)
>  {
>      TimerBlock *tb = (TimerBlock *)opaque;
> -    int64_t val;
>      switch (addr) {
>      case 0: /* Load */
> -        return tb->load;
> +        return ptimer_get_limit(tb->timer);
>      case 4: /* Counter.  */
> -        if (((tb->control & 1) == 0) || (tb->count == 0)) {
> -            return 0;
> -        }
> -        /* Slow and ugly, but hopefully won't happen too often.  */
> -        val = tb->tick - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -        val /= timerblock_scale(tb);
> -        if (val < 0) {
> -            val = 0;
> -        }
> -        return val;
> +        return ptimer_get_count(tb->timer);
>      case 8: /* Control.  */
>          return tb->control;
>      case 12: /* Interrupt status.  */
> @@ -104,39 +96,51 @@ static void timerblock_write(void *opaque, hwaddr addr,
>                               uint64_t value, unsigned size)
>  {
>      TimerBlock *tb = (TimerBlock *)opaque;
> -    int64_t old;
> +    uint32_t control = tb->control;
>      switch (addr) {
>      case 0: /* Load */
> -        tb->load = value;
> -        /* Fall through.  */
> -    case 4: /* Counter.  */
> -        if ((tb->control & 1) && tb->count) {
> -            /* Cancel the previous timer.  */
> -            timer_del(tb->timer);
> +        /* Setting load to 0 stops the timer if prescaler == 0.  */
> +        if ((control & 1) && (value == 0) && (control & 0xff00) == 0) {
> +            ptimer_stop(tb->timer);
> +            control &= ~1;
>          }
> -        tb->count = value;
> -        if (tb->control & 1) {
> -            timerblock_reload(tb, 1);
> +        ptimer_set_limit(tb->timer, value, 1);
> +        timerblock_run(tb->timer, control, (control & 1));
> +        break;
> +    case 4: /* Counter.  */
> +        /* Setting counter to 0 stops the one-shot timer if prescaler == 0
> +         * and periodic if load = 0.  */

newline before */

> +        if ((control & 1) && (value == 0) && (control & 0xff00) == 0) {
> +            if (!(control & 2) || ptimer_get_limit(tb->timer) == 0) {

comment doesn't look to match code. The code looks like:

"setting counter to 0 while prescaler == 0 will disable the timer if
it is either oneshot, or periodic with load == 0",

whearas your comment read as if it only applies to one-shot timers.

ifs can be merged.

> +                ptimer_stop(tb->timer);
> +                control &= ~1;
> +            }
>          }
> +        timerblock_set_count(tb->timer, control, &value);

... and just add in the extra if in here with if (value != 0). The
boolean cond argument that just conditionalizes the whole thing is a
bit un-usual and the three call sites all pass in (control & 1) in
addition to the full raw control.

> +        timerblock_run(tb->timer, control, (value != 0) && (control & 1));
>          break;
>      case 8: /* Control.  */
> -        old = tb->control;
> -        tb->control = value;
> -        if (value & 1) {
> -            if ((old & 1) && (tb->count != 0)) {
> -                /* Do nothing if timer is ticking right now.  */
> -                break;
> +        if ((value & 1) && (control & 3) != (value & 3)) {
> +            uint64_t count = (value & 0xff00) ? 1 : ptimer_get_count(tb->timer);
> +            if ((count == 0) && (value & 2)) {
> +                timerblock_set_count(tb->timer, value, &count);

This looks like a weird corner-case, what does it do exactly? I can't
follow it so it needs a comment :)

Regards,
Peter

>              }
> -            if (tb->control & 2) {
> -                tb->count = tb->load;
> -            }
> -            timerblock_reload(tb, 1);
> -        } else if (old & 1) {
> -            /* Shutdown the timer.  */
> -            timer_del(tb->timer);
> +            timerblock_run(tb->timer, value, (count != 0));
> +        } else if ((control & 1) && !(value & 1)) {
> +            ptimer_stop(tb->timer);
> +        }
> +        if ((control & 0xff00) != (value & 0xff00)) {
> +            ptimer_set_period(tb->timer, timerblock_scale(value));
>          }
> +        tb->control = value;
>          break;
>      case 12: /* Interrupt status.  */
> +        /* Simulate continuous IRQ gen.  */
> +        if ((control & 3) == 3 && (control & 0xff00) != 0) {
> +            if (ptimer_get_limit(tb->timer) == 0) {
> +                break;
> +            }
> +        }
>          tb->status &= ~value;
>          timerblock_update_irq(tb);
>          break;
> @@ -184,13 +188,12 @@ static const MemoryRegionOps timerblock_ops = {
>
>  static void timerblock_reset(TimerBlock *tb)
>  {
> -    tb->count = 0;
> -    tb->load = 0;
>      tb->control = 0;
>      tb->status = 0;
> -    tb->tick = 0;
>      if (tb->timer) {
> -        timer_del(tb->timer);
> +        ptimer_stop(tb->timer);
> +        ptimer_set_limit(tb->timer, 0, 1);
> +        ptimer_set_period(tb->timer, timerblock_scale(0));
>      }
>  }
>
> @@ -235,7 +238,8 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
>       */
>      for (i = 0; i < s->num_cpu; i++) {
>          TimerBlock *tb = &s->timerblock[i];
> -        tb->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timerblock_tick, tb);
> +        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
> +        tb->timer = ptimer_init(bh);
>          sysbus_init_irq(sbd, &tb->irq);
>          memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
>                                "arm_mptimer_timerblock", 0x20);
> @@ -245,26 +249,23 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
>
>  static const VMStateDescription vmstate_timerblock = {
>      .name = "arm_mptimer_timerblock",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>      .fields = (VMStateField[]) {
> -        VMSTATE_UINT32(count, TimerBlock),
> -        VMSTATE_UINT32(load, TimerBlock),
>          VMSTATE_UINT32(control, TimerBlock),
>          VMSTATE_UINT32(status, TimerBlock),
> -        VMSTATE_INT64(tick, TimerBlock),
> -        VMSTATE_TIMER_PTR(timer, TimerBlock),
> +        VMSTATE_PTIMER(timer, TimerBlock),
>          VMSTATE_END_OF_LIST()
>      }
>  };
>
>  static const VMStateDescription vmstate_arm_mptimer = {
>      .name = "arm_mptimer",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>      .fields = (VMStateField[]) {
>          VMSTATE_STRUCT_VARRAY_UINT32(timerblock, ARMMPTimerState, num_cpu,
> -                                     2, vmstate_timerblock, TimerBlock),
> +                                     3, vmstate_timerblock, TimerBlock),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> diff --git a/include/hw/timer/arm_mptimer.h b/include/hw/timer/arm_mptimer.h
> index b34cba0..c46d8d2 100644
> --- a/include/hw/timer/arm_mptimer.h
> +++ b/include/hw/timer/arm_mptimer.h
> @@ -27,12 +27,9 @@
>
>  /* State of a single timer or watchdog block */
>  typedef struct {
> -    uint32_t count;
> -    uint32_t load;
>      uint32_t control;
>      uint32_t status;
> -    int64_t tick;
> -    QEMUTimer *timer;
> +    struct ptimer_state *timer;
>      qemu_irq irq;
>      MemoryRegion iomem;
>  } TimerBlock;
> --
> 2.7.0
>

Received: by 10.25.208.211 with SMTP id h202csp2154511lfg;
        Tue, 8 Mar 2016 13:03:24 -0800 (PST)
X-Received: by 10.55.80.68 with SMTP id e65mr38867028qkb.46.1457471004108;
        Tue, 08 Mar 2016 13:03:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68si4851205qkv.24.2016.03.08.13.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Mar 2016 13:03:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37343 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adOmp-0001eK-Jf
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 16:03:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1adOmm-0001e8-M1
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 16:03:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1adOmk-0007q7-Sm
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 16:03:20 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:37665)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1adOmk-0007pS-IO; Tue, 08 Mar 2016 16:03:18 -0500
Received: by mail-wm0-x234.google.com with SMTP id p65so44738195wmp.0;
	Tue, 08 Mar 2016 13:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=d7wUHuCMOGICcHBgYVr+t3HczIwG0Qo4IQVhZYHHsqs=;
	b=uUivDFle3IQPMMb3gI+Hu7UMVxpaLIVlzv9l8Nt5ISAlrSYGhrZUcfXppxYcaHDWnv
	CmZteZU+8NUbUj1yuTlLJbWBFdo2yE02CGj+Q1mxN2bTrCndx5nqaR1IXnJYEGJH9382
	8YncsXTA5M4LuJkgpmCDP0mgac07NSJ/537P6yR1z6bxkYO04pH9LAgHfRJ1H20JWomk
	bLu9Uzofq0hM9i6sAnMO54aSxirLWEZ1ZaQCu68NX2RK9vdPZQZDzVHimnFd5OXrMVw6
	lKjsjwdfQwQxJVwr0dNHWBJHcFPHJAv1xDkAq90PBUy2dWqAtEIK16o/fO2J+fJ/CuSb
	/Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=d7wUHuCMOGICcHBgYVr+t3HczIwG0Qo4IQVhZYHHsqs=;
	b=TCrk/JjwHRSMSDkXX4u06N9/WBTYPg7xHFmjjcM7gCImwBAYsXciZvFjh6Ew7s7lGm
	0169dc4yUaNmrw++BABzlyMqr4CFeJKHqGcpsxZbTf0FXEKR2qIFeAw1Pd3ELc6eKc3H
	iXUHXfngSjXSuE/KjwCxNpFNXJZvSLGNp/Mct9J5W10PNZfF5+HL1dWP9xOPn+rQmUy5
	6l0FS/1mxmzTLKOooLKiwbUxDSbR5cUkHmJLAaQjCCN5O1neaIsuI8iM+orv9xr1ZaXq
	vM0dlvRtNzCUDJnI+n++1+D1HSjph/85GPTVvTZ8R6KvWUfiVnHoJ/8ToKhZRCjDOsJf
	IWNQ==
X-Gm-Message-State: AD7BkJJYDYfte6OaFUABbJTaxEqDzgEGMb74S5b/TOY9xnSODBLIPC70QplffC5l3UC/EBtCZxwlWpGiy1uV+Q==
MIME-Version: 1.0
X-Received: by 10.28.146.209 with SMTP id u200mr20437604wmd.59.1457470997343; 
	Tue, 08 Mar 2016 13:03:17 -0800 (PST)
Received: by 10.28.157.21 with HTTP; Tue, 8 Mar 2016 13:03:17 -0800 (PST)
In-Reply-To: <8050a7dd5370480f4ce06fe5a8ece18a76975283.1454169735.git.digetx@gmail.com>
References: <cover.1454169735.git.digetx@gmail.com>
	<8050a7dd5370480f4ce06fe5a8ece18a76975283.1454169735.git.digetx@gmail.com>
Date: Tue, 8 Mar 2016 13:03:17 -0800
Message-ID: <CAPokK=oPJUfH-qs6=n=boBbqQ5807oa9jUbiNxGDV-9ieMgXxQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v12 9/9] arm_mptimer: Convert to use ptimer
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
X-TUID: uWsWDSLbZL77

On Sat, Jan 30, 2016 at 8:43 AM, Dmitry Osipenko <digetx@gmail.com> wrote:
> Current ARM MPTimer implementation uses QEMUTimer for the actual timer,
> this implementation isn't complete and mostly tries to duplicate of what
> generic ptimer is already doing fine.
>
> Conversion to ptimer brings the following benefits and fixes:
>         - Simple timer pausing implementation
>         - Fixes counter value preservation after stopping the timer
>         - Correctly handles prescaler != 0 / counter = 0 / load = 0 cases
>         - Code simplification and reduction
>
> Bump VMSD to version 3, since VMState is changed and is not compatible
> with the previous implementation.
>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Im a little rusty on some of the corner cases that have come out of
your test suite, but the general idea is solid, and it adds those
missing features that got the whole discussion started.

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
>  hw/timer/arm_mptimer.c         | 133 +++++++++++++++++++++--------------------
>  include/hw/timer/arm_mptimer.h |   5 +-
>  2 files changed, 70 insertions(+), 68 deletions(-)
>
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index 5dfab66..f002458 100644
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
> @@ -42,55 +43,54 @@ static inline void timerblock_update_irq(TimerBlock *tb)
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
> +     * when counter set to 0, MPtimer under certain condition only.
> +     */
> +    if ((control & 3) == 3 && (control & 0xff00) == 0 && *count == 0) {
> +        *count = ptimer_get_limit(timer);
>      }
> -    if (restart) {
> -        tb->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> +    ptimer_set_count(timer, *count);
> +}
> +
> +static inline void timerblock_run(struct ptimer_state *timer,
> +                                  uint32_t control, uint32_t load)
> +{
> +    if ((control & 1) && ((control & 0xff00) || load != 0)) {
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
> +    /* Periodic timer with load = 0 and prescaler != 0 would re-trigger
> +     * IRQ after one period, otherwise it either stops or wraps around.
> +     */
> +    if ((tb->control & 2) && (tb->control & 0xff00) &&
> +            ptimer_get_limit(tb->timer) == 0) {
> +        ptimer_run(tb->timer, 0);
> +    }
>  }
>
>  static uint64_t timerblock_read(void *opaque, hwaddr addr,
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
> @@ -104,37 +104,45 @@ static void timerblock_write(void *opaque, hwaddr addr,
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
> +        /* Setting load to 0 stops the timer without doing the tick if
> +         * prescaler = 0.
> +         */
> +        if ((control & 1) && (control & 0xff00) == 0 && value == 0) {
> +            ptimer_stop(tb->timer);
>          }
> -        tb->count = value;
> -        if (tb->control & 1) {
> -            timerblock_reload(tb, 1);
> +        ptimer_set_limit(tb->timer, value, 1);
> +        timerblock_run(tb->timer, control, value);
> +        break;
> +    case 4: /* Counter.  */
> +        /* Setting counter to 0 stops the one-shot timer, or periodic with
> +         * load == 0, without doing the tick if prescaler = 0.
> +         */
> +        if ((control & 1) && (control & 0xff00) == 0 && value == 0 &&
> +                (!(control & 2) || ptimer_get_limit(tb->timer) == 0)) {
> +            ptimer_stop(tb->timer);
>          }
> +        timerblock_set_count(tb->timer, control, &value);
> +        timerblock_run(tb->timer, control, value);
>          break;
>      case 8: /* Control.  */
> -        old = tb->control;
> -        tb->control = value;
> +        if ((control & 1) && !(value & 1)) {
> +            ptimer_stop(tb->timer);
> +        }
> +        if ((control & 0xff00) != (value & 0xff00)) {
> +            ptimer_set_period(tb->timer, timerblock_scale(value));
> +        }
>          if (value & 1) {
> -            if ((old & 1) && (tb->count != 0)) {
> -                /* Do nothing if timer is ticking right now.  */
> -                break;
> +            uint64_t count = ptimer_get_count(tb->timer);
> +            /* Re-load periodic timer counter if needed.  */
> +            if ((value & 2) && count == 0) {
> +                timerblock_set_count(tb->timer, value, &count);
>              }
> -            if (tb->control & 2) {
> -                tb->count = tb->load;
> -            }
> -            timerblock_reload(tb, 1);
> -        } else if (old & 1) {
> -            /* Shutdown the timer.  */
> -            timer_del(tb->timer);
> +            timerblock_run(tb->timer, value, count);
>          }
> +        tb->control = value;
>          break;
>      case 12: /* Interrupt status.  */
>          tb->status &= ~value;
> @@ -184,13 +192,12 @@ static const MemoryRegionOps timerblock_ops = {
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
> @@ -236,7 +243,8 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
>       */
>      for (i = 0; i < s->num_cpu; i++) {
>          TimerBlock *tb = &s->timerblock[i];
> -        tb->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timerblock_tick, tb);
> +        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
> +        tb->timer = ptimer_init(bh);
>          sysbus_init_irq(sbd, &tb->irq);
>          memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
>                                "arm_mptimer_timerblock", 0x20);
> @@ -246,26 +254,23 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
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

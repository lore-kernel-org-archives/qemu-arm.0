Received: by 10.182.158.201 with SMTP id ww9csp11769254obb;
        Wed, 6 Jan 2016 05:18:22 -0800 (PST)
X-Received: by 10.140.43.9 with SMTP id d9mr128301529qga.51.1452086302042;
        Wed, 06 Jan 2016 05:18:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v28si112637927qkl.123.2016.01.06.05.18.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jan 2016 05:18:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aGnyn-0003fz-Mk
	for alex.bennee@linaro.org; Wed, 06 Jan 2016 08:18:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGnyQ-0003O9-9I
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 08:17:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aGnyN-000184-0u
	for qemu-devel@nongnu.org; Wed, 06 Jan 2016 08:17:58 -0500
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:35756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aGnyM-000180-PH; Wed, 06 Jan 2016 08:17:54 -0500
Received: by mail-pf0-x233.google.com with SMTP id 78so242010470pfw.2;
	Wed, 06 Jan 2016 05:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iIw0+JNJmav067plJ9/cftblulQm4/hjpC/uK4z7Kak=;
	b=0iCbhLEt8f22tzFGAZ9visXWDSxA1MZznYoV9OUQauwY/TjgJWxsKhhTO9LMnytNNt
	2liDoT1JQPikS+SWbadTJUi2n6lCPCKby2mZ6Cg14wkbvBp/uBOTmsBPPtImPnO8ww/w
	S2LekNTU55/AmCOJRiwrXcq2uO+A4uFnXGG9dLKS/fsoWx/Y1xFToZAHqhQpDZEKup8K
	0be87lqHebKuZrkJyJ2z3HWPdz5jSdoE8dMqHox772eYUrhzfyCa44NwP1jmtJIi0Po/
	K3PnUpNLtWinA0WlsPOwXYcuYTSbaf09i5lXcvmm2IfmH6RH52kc5vLyDejZesoDsiFA
	X18g==
X-Received: by 10.98.70.12 with SMTP id t12mr116431537pfa.38.1452086274264;
	Wed, 06 Jan 2016 05:17:54 -0800 (PST)
Received: from pcrost-box (pa49-197-174-152.pa.qld.optusnet.com.au.
	[49.197.174.152]) by smtp.gmail.com with ESMTPSA id
	sv8sm140897441pab.13.2016.01.06.05.17.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 05:17:53 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 6 Jan 2016 05:17:44 -0800
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20160106131744.GE4227@pcrost-box>
References: <cover.1451960508.git.digetx@gmail.com>
	<c4dafbd33c4428495d20d9b2228033ed5868b63b.1451960508.git.digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4dafbd33c4428495d20d9b2228033ed5868b63b.1451960508.git.digetx@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::233
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v8 4/4] arm_mptimer: Convert to use ptimer
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R54C+2uwxxuG

On Tue, Jan 05, 2016 at 05:33:29AM +0300, Dmitry Osipenko wrote:
> Current ARM MPTimer implementation uses QEMUTimer for the actual timer,
> this implementation isn't complete and mostly tries to duplicate of what
> generic ptimer is already doing fine.
> 
> Conversion to ptimer brings the following benefits and fixes:
> 	- Simple timer pausing implementation
> 	- Fixes counter value preservation after stopping the timer
> 	- Code simplification and reduction
> 
> Bump VMSD to version 3, since VMState is changed and is not compatible
> with the previous implementation.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  hw/timer/arm_mptimer.c         | 110 ++++++++++++++++++-----------------------
>  include/hw/timer/arm_mptimer.h |   4 +-
>  2 files changed, 49 insertions(+), 65 deletions(-)
> 
> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
> index 3e59c2a..c06da5e 100644
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
> @@ -47,28 +48,10 @@ static inline uint32_t timerblock_scale(TimerBlock *tb)
>      return (((tb->control >> 8) & 0xff) + 1) * 10;
>  }
>  
> -static void timerblock_reload(TimerBlock *tb, int restart)
> -{
> -    if (tb->count == 0) {
> -        return;
> -    }
> -    if (restart) {
> -        tb->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
> -    }
> -    tb->tick += (int64_t)tb->count * timerblock_scale(tb);
> -    timer_mod(tb->timer, tb->tick);
> -}
> -
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
> @@ -76,21 +59,11 @@ static uint64_t timerblock_read(void *opaque, hwaddr addr,
>                                  unsigned size)
>  {
>      TimerBlock *tb = (TimerBlock *)opaque;
> -    int64_t val;
>      switch (addr) {
>      case 0: /* Load */
>          return tb->load;
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
> @@ -100,6 +73,19 @@ static uint64_t timerblock_read(void *opaque, hwaddr addr,
>      }
>  }
>  
> +static void timerblock_run(TimerBlock *tb, uint64_t count, int set_count)
> +{
> +    if (set_count) {
> +        if (((tb->control & 3) == 3) && (count == 0)) {

Parentheses around == expressions should not be needed.

> +            count = tb->load;
> +        }
> +        ptimer_set_count(tb->timer, count);
> +    }
> +    if ((tb->control & 1) && (count != 0)) {

This can check against tb->load instead of count to avoid dummy
pass of tb->load to this fn ...

> +        ptimer_run(tb->timer, !(tb->control & 2));
> +    }
> +}
> +
>  static void timerblock_write(void *opaque, hwaddr addr,
>                               uint64_t value, unsigned size)
>  {
> @@ -108,32 +94,34 @@ static void timerblock_write(void *opaque, hwaddr addr,
>      switch (addr) {
>      case 0: /* Load */
>          tb->load = value;
> -        /* Fall through.  */
> -    case 4: /* Counter.  */
> -        if ((tb->control & 1) && tb->count) {
> -            /* Cancel the previous timer.  */
> -            timer_del(tb->timer);
> +        /* Setting load to 0 stops the timer.  */
> +        if (tb->load == 0) {
> +            ptimer_stop(tb->timer);
>          }
> -        tb->count = value;
> -        if (tb->control & 1) {
> -            timerblock_reload(tb, 1);
> +        ptimer_set_limit(tb->timer, tb->load, 1);
> +        timerblock_run(tb, tb->load, 0);
> +        break;
> +    case 4: /* Counter.  */
> +        /* Setting counter to 0 stops the one-shot timer.  */
> +        if (!(tb->control & 2) && (value == 0)) {
> +            ptimer_stop(tb->timer);
>          }
> +        timerblock_run(tb, value, 1);

... then this would just need to be elsed.

>          break;
>      case 8: /* Control.  */
>          old = tb->control;
>          tb->control = value;
> -        if (value & 1) {
> -            if ((old & 1) && (tb->count != 0)) {
> -                /* Do nothing if timer is ticking right now.  */
> -                break;
> -            }
> -            if (tb->control & 2) {
> -                tb->count = tb->load;
> -            }
> -            timerblock_reload(tb, 1);
> -        } else if (old & 1) {
> -            /* Shutdown the timer.  */
> -            timer_del(tb->timer);
> +        /* Timer mode switch requires ptimer to be stopped.  */

Is it worth adding this to ptimer? It seems ptimer can now handle
every other case of running configuration change except this one
case.

> +        if ((old & 3) != (tb->control & 3)) {
> +            ptimer_stop(tb->timer);
> +        }
> +        if (!(tb->control & 1)) {
> +            break;
> +        }
> +        ptimer_set_period(tb->timer, timerblock_scale(tb));
> +        if ((old & 3) != (tb->control & 3)) {
> +            value = ptimer_get_count(tb->timer);
> +            timerblock_run(tb, value, 1);

Is this reachable when the load value is still 0?

Following on from the suggested refactor before, I think timerblock_run
should split off the count set to a new helper. Then this is

timerblock_setcount(tb, value);
timerblock_run(tb);

and the boolean arg and dummy pass of tb->load as count are unneeded.

Regards,
Peter

>          }
>          break;
>      case 12: /* Interrupt status.  */
> @@ -184,13 +172,12 @@ static const MemoryRegionOps timerblock_ops = {
>  
>  static void timerblock_reset(TimerBlock *tb)
>  {
> -    tb->count = 0;
>      tb->load = 0;
>      tb->control = 0;
>      tb->status = 0;
> -    tb->tick = 0;
>      if (tb->timer) {
> -        timer_del(tb->timer);
> +        ptimer_stop(tb->timer);
> +        ptimer_set_limit(tb->timer, 0, 1);
>      }
>  }
>  
> @@ -235,7 +222,8 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
>       */
>      for (i = 0; i < s->num_cpu; i++) {
>          TimerBlock *tb = &s->timerblock[i];
> -        tb->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, timerblock_tick, tb);
> +        QEMUBH *bh = qemu_bh_new(timerblock_tick, tb);
> +        tb->timer = ptimer_init(bh);
>          sysbus_init_irq(sbd, &tb->irq);
>          memory_region_init_io(&tb->iomem, OBJECT(s), &timerblock_ops, tb,
>                                "arm_mptimer_timerblock", 0x20);
> @@ -245,26 +233,24 @@ static void arm_mptimer_realize(DeviceState *dev, Error **errp)
>  
>  static const VMStateDescription vmstate_timerblock = {
>      .name = "arm_mptimer_timerblock",
> -    .version_id = 2,
> -    .minimum_version_id = 2,
> +    .version_id = 3,
> +    .minimum_version_id = 3,
>      .fields = (VMStateField[]) {
> -        VMSTATE_UINT32(count, TimerBlock),
>          VMSTATE_UINT32(load, TimerBlock),
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
> index b34cba0..93db61b 100644
> --- a/include/hw/timer/arm_mptimer.h
> +++ b/include/hw/timer/arm_mptimer.h
> @@ -27,12 +27,10 @@
>  
>  /* State of a single timer or watchdog block */
>  typedef struct {
> -    uint32_t count;
>      uint32_t load;
>      uint32_t control;
>      uint32_t status;
> -    int64_t tick;
> -    QEMUTimer *timer;
> +    struct ptimer_state *timer;
>      qemu_irq irq;
>      MemoryRegion iomem;
>  } TimerBlock;
> -- 
> 2.6.4
> 

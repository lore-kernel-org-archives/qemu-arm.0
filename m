Received: by 10.182.158.201 with SMTP id ww9csp619489obb;
        Thu, 7 Jan 2016 06:41:21 -0800 (PST)
X-Received: by 10.55.77.2 with SMTP id a2mr136342669qkb.108.1452177681772;
        Thu, 07 Jan 2016 06:41:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o33si13787266qge.42.2016.01.07.06.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 06:41:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58953 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHBkf-0001U3-BI
	for alex.bennee@linaro.org; Thu, 07 Jan 2016 09:41:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHBkc-0001Tw-QJ
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 09:41:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1aHBkW-0002a3-Gs
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 09:41:18 -0500
Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f]:34241)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1aHBkW-0002Zl-4Q; Thu, 07 Jan 2016 09:41:12 -0500
Received: by mail-lf0-x22f.google.com with SMTP id y184so333410204lfc.1;
	Thu, 07 Jan 2016 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=5u+Z+xi4xk53x4dvn/uMZAC9F3yt/8seVG22dZMotLw=;
	b=GjYAnEGJx8jncjp8S0CmyUa7St0iBtfMz4x0JuTu69XNKodUx2dAJSY7+uk6ky8Try
	mb3YMdfhCX+34Kye7Xx6iSr+FnHjYj0u5x2QhDQGbrOCaPxbxhN2a6R1M3oU25aKKrn9
	vuLWtMK+SttprWrLj+4AqYsK8caUE29JrV0fZTC182Dgcnzud/MfzXaWGlKVSujOrp/8
	T09ZbufF/VbRSiYdxo4CACUipMIYjHKWAB/qx17noH3wtDTENZso+3iy6fZdS40LknnO
	0VTi374eUZbejhOeYt0pT2BYKrlBcEjKuRfUIG2y7YdX5Eq5YSqfHrjBIfg/ZsxMWlO2
	PxPQ==
X-Received: by 10.25.143.143 with SMTP id r137mr34181328lfd.93.1452177670958; 
	Thu, 07 Jan 2016 06:41:10 -0800 (PST)
Received: from [192.168.1.145] (ppp46-138-151-163.pppoe.spdop.ru.
	[46.138.151.163]) by smtp.googlemail.com with ESMTPSA id
	wu10sm17991282lbb.44.2016.01.07.06.41.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 06:41:10 -0800 (PST)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1451960508.git.digetx@gmail.com>
	<c4dafbd33c4428495d20d9b2228033ed5868b63b.1451960508.git.digetx@gmail.com>
	<20160106131744.GE4227@pcrost-box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <568E78F2.4010200@gmail.com>
Date: Thu, 7 Jan 2016 17:40:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <20160106131744.GE4227@pcrost-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::22f
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v8 4/4] arm_mptimer: Convert to use ptimer
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
X-TUID: U4822WHdWAlZ

06.01.2016 16:17, Peter Crosthwaite пишет:
> On Tue, Jan 05, 2016 at 05:33:29AM +0300, Dmitry Osipenko wrote:
>> Current ARM MPTimer implementation uses QEMUTimer for the actual timer,
>> this implementation isn't complete and mostly tries to duplicate of what
>> generic ptimer is already doing fine.
>>
>> Conversion to ptimer brings the following benefits and fixes:
>> 	- Simple timer pausing implementation
>> 	- Fixes counter value preservation after stopping the timer
>> 	- Code simplification and reduction
>>
>> Bump VMSD to version 3, since VMState is changed and is not compatible
>> with the previous implementation.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   hw/timer/arm_mptimer.c         | 110 ++++++++++++++++++-----------------------
>>   include/hw/timer/arm_mptimer.h |   4 +-
>>   2 files changed, 49 insertions(+), 65 deletions(-)
>>
>> diff --git a/hw/timer/arm_mptimer.c b/hw/timer/arm_mptimer.c
>> index 3e59c2a..c06da5e 100644
>> --- a/hw/timer/arm_mptimer.c
>> +++ b/hw/timer/arm_mptimer.c
>> @@ -19,8 +19,9 @@
>>    * with this program; if not, see <http://www.gnu.org/licenses/>.
>>    */
>>
>> +#include "hw/ptimer.h"
>>   #include "hw/timer/arm_mptimer.h"
>> -#include "qemu/timer.h"
>> +#include "qemu/main-loop.h"
>>   #include "qom/cpu.h"
>>
>>   /* This device implements the per-cpu private timer and watchdog block
>> @@ -47,28 +48,10 @@ static inline uint32_t timerblock_scale(TimerBlock *tb)
>>       return (((tb->control >> 8) & 0xff) + 1) * 10;
>>   }
>>
>> -static void timerblock_reload(TimerBlock *tb, int restart)
>> -{
>> -    if (tb->count == 0) {
>> -        return;
>> -    }
>> -    if (restart) {
>> -        tb->tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> -    }
>> -    tb->tick += (int64_t)tb->count * timerblock_scale(tb);
>> -    timer_mod(tb->timer, tb->tick);
>> -}
>> -
>>   static void timerblock_tick(void *opaque)
>>   {
>>       TimerBlock *tb = (TimerBlock *)opaque;
>>       tb->status = 1;
>> -    if (tb->control & 2) {
>> -        tb->count = tb->load;
>> -        timerblock_reload(tb, 0);
>> -    } else {
>> -        tb->count = 0;
>> -    }
>>       timerblock_update_irq(tb);
>>   }
>>
>> @@ -76,21 +59,11 @@ static uint64_t timerblock_read(void *opaque, hwaddr addr,
>>                                   unsigned size)
>>   {
>>       TimerBlock *tb = (TimerBlock *)opaque;
>> -    int64_t val;
>>       switch (addr) {
>>       case 0: /* Load */
>>           return tb->load;
>>       case 4: /* Counter.  */
>> -        if (((tb->control & 1) == 0) || (tb->count == 0)) {
>> -            return 0;
>> -        }
>> -        /* Slow and ugly, but hopefully won't happen too often.  */
>> -        val = tb->tick - qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>> -        val /= timerblock_scale(tb);
>> -        if (val < 0) {
>> -            val = 0;
>> -        }
>> -        return val;
>> +        return ptimer_get_count(tb->timer);
>>       case 8: /* Control.  */
>>           return tb->control;
>>       case 12: /* Interrupt status.  */
>> @@ -100,6 +73,19 @@ static uint64_t timerblock_read(void *opaque, hwaddr addr,
>>       }
>>   }
>>
>> +static void timerblock_run(TimerBlock *tb, uint64_t count, int set_count)
>> +{
>> +    if (set_count) {
>> +        if (((tb->control & 3) == 3) && (count == 0)) {
>
> Parentheses around == expressions should not be needed.
>
>> +            count = tb->load;
>> +        }
>> +        ptimer_set_count(tb->timer, count);
>> +    }
>> +    if ((tb->control & 1) && (count != 0)) {
>
> This can check against tb->load instead of count to avoid dummy
> pass of tb->load to this fn ...
>
>> +        ptimer_run(tb->timer, !(tb->control & 2));
>> +    }
>> +}
>> +
>>   static void timerblock_write(void *opaque, hwaddr addr,
>>                                uint64_t value, unsigned size)
>>   {
>> @@ -108,32 +94,34 @@ static void timerblock_write(void *opaque, hwaddr addr,
>>       switch (addr) {
>>       case 0: /* Load */
>>           tb->load = value;
>> -        /* Fall through.  */
>> -    case 4: /* Counter.  */
>> -        if ((tb->control & 1) && tb->count) {
>> -            /* Cancel the previous timer.  */
>> -            timer_del(tb->timer);
>> +        /* Setting load to 0 stops the timer.  */
>> +        if (tb->load == 0) {
>> +            ptimer_stop(tb->timer);
>>           }
>> -        tb->count = value;
>> -        if (tb->control & 1) {
>> -            timerblock_reload(tb, 1);
>> +        ptimer_set_limit(tb->timer, tb->load, 1);
>> +        timerblock_run(tb, tb->load, 0);
>> +        break;
>> +    case 4: /* Counter.  */
>> +        /* Setting counter to 0 stops the one-shot timer.  */
>> +        if (!(tb->control & 2) && (value == 0)) {
>> +            ptimer_stop(tb->timer);
>>           }
>> +        timerblock_run(tb, value, 1);
>
> ... then this would just need to be elsed.
>
>>           break;
>>       case 8: /* Control.  */
>>           old = tb->control;
>>           tb->control = value;
>> -        if (value & 1) {
>> -            if ((old & 1) && (tb->count != 0)) {
>> -                /* Do nothing if timer is ticking right now.  */
>> -                break;
>> -            }
>> -            if (tb->control & 2) {
>> -                tb->count = tb->load;
>> -            }
>> -            timerblock_reload(tb, 1);
>> -        } else if (old & 1) {
>> -            /* Shutdown the timer.  */
>> -            timer_del(tb->timer);
>> +        /* Timer mode switch requires ptimer to be stopped.  */
>
> Is it worth adding this to ptimer? It seems ptimer can now handle
> every other case of running configuration change except this one
> case.
>

Yeah, should make code cleaner as well.

>> +        if ((old & 3) != (tb->control & 3)) {
>> +            ptimer_stop(tb->timer);
>> +        }
>> +        if (!(tb->control & 1)) {
>> +            break;
>> +        }
>> +        ptimer_set_period(tb->timer, timerblock_scale(tb));
>> +        if ((old & 3) != (tb->control & 3)) {
>> +            value = ptimer_get_count(tb->timer);
>> +            timerblock_run(tb, value, 1);
>
> Is this reachable when the load value is still 0?
>
> Following on from the suggested refactor before, I think timerblock_run
> should split off the count set to a new helper. Then this is
>
> timerblock_setcount(tb, value);
> timerblock_run(tb);
>
> and the boolean arg and dummy pass of tb->load as count are unneeded.
>

What about to just inline timerblock_run? It would allow compiler to eliminate 
dead code.

-- 
Dmitry

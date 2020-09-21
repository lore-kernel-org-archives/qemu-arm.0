Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4252791lfq;
        Mon, 21 Sep 2020 12:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuNe2ijNWw367V9NmWDeTNY1CgndsuNLfnr2dBttl/ynFC0y9elZwskQQCK5Oq+4Q+G7V0
X-Received: by 2002:a25:b45:: with SMTP id 66mr1905494ybl.2.1600717213837;
        Mon, 21 Sep 2020 12:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600717213; cv=none;
        d=google.com; s=arc-20160816;
        b=mNhXfXtWwDWTGygKAChFuihU6lNJJEdsJ+6HeM5lK9M5BpQlnVjYfpmErFNUvcEtuL
         lrz8XH0Fcf3+1ustKVDwKMFQBOlAQium+Je0LR6UpNESvNo872+GMtjwU2dVg1nvZgbU
         Z7GT29nqQ+ty0JGg6qA5ma8VzIXc3rEslB0sWNGgshV++bwRoYE5+jyeSBPhZYEqYZfB
         yrPvE6SjebgRSR+Yj0kQJl0gmTy3vgj+/xI3iJh3XRv2AMbDgjV1NP5v2PngIpp2UbbA
         kqI4ynPK7OyaNAW3DabLBUB4unrZUBfJhHYGFuQXRAmh7VBuT+79c08l1DyXDLsHqq5t
         2PvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=A8cn/oZOpOWRTCTjgZSGgcp8pU6Sd0lJoIcpSgT9hLU=;
        b=SG8xzYqRR84r6sk13Xh7ZOAv1dkzsCbevjZWGJq5IfyGNwT7EKMGDuaOYf6/lKLzIj
         qfeaiq8mIfdXF15hAwIvgNcmPK+2y4/gUsgmmNfEa/tL+n+2HWnxNdC864Xw2fVScI05
         KUt1w6sGWmqqiaQ8UacCwSKhVJ4B6HACwRhTbKriALSNlfUZq6N6l/I9wEG9KXgaXDy9
         OPsx9Mhn8VeBzliNhtWKFlaPNsNHhvcbj9KP4BmAn+yn4ZyMYdnDELmGrC2G04h0drFn
         p8e14F52kpq3FdPzn2alrw0RpU8OG9qbS4LB+iJ+EmHXgrMOisxVNvS4TsAEIxZED4J0
         /Y+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=s5oWaTvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si7430033ybp.43.2020.09.21.12.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 12:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=s5oWaTvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kKRfY-0000Gn-Al
	for alex.bennee@linaro.org; Mon, 21 Sep 2020 15:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKReJ-0008Vr-D5; Mon, 21 Sep 2020 15:38:57 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kKReF-0007bl-42; Mon, 21 Sep 2020 15:38:55 -0400
Received: from [172.17.10.14] (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 14EA021CC5;
 Mon, 21 Sep 2020 19:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1600717127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A8cn/oZOpOWRTCTjgZSGgcp8pU6Sd0lJoIcpSgT9hLU=;
 b=s5oWaTvG5hK/j1FCIwJeKBXJH1yd2fvdfZiM0X1+l74euMQlmcT9iKiBtBtJQw072kFhF5
 jZRLB/IFb4YdxRMYyX7qKtVirCBQrCa1GNZlpy7CTbipwk718tL2MflPF0tbSLl4lxJuUH
 5OkdwItTzJnyCKyXa/tyCtZXSL7LMoI=
Subject: Re: [PATCH v2 4/5] hw/timer/bcm2835: Support the timer COMPARE
 registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200921035257.434532-1-f4bug@amsat.org>
 <20200921035257.434532-5-f4bug@amsat.org>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <49f67ca8-7a4e-c698-3deb-e53ee942cf06@greensocs.com>
Date: Mon, 21 Sep 2020 21:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921035257.434532-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 15:38:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Paul Zimmerman <pauldzim@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BB3BObeUQbJi

Hi Phil,

On 9/21/20 5:52 AM, Philippe Mathieu-Daudé wrote:
> This peripheral has 1 free-running timer and 4 compare registers.
> 
> Only the free-running timer is implemented. Add support the
> COMPARE registers (each register is wired to an IRQ).
> 
> Reference: "BCM2835 ARM Peripherals" datasheet [*]
>              chapter 12 "System Timer":
> 
>    The System Timer peripheral provides four 32-bit timer channels
>    and a single 64-bit free running counter. Each channel has an
>    output compare register, which is compared against the 32 least
>    significant bits of the free running counter values. When the
>    two values match, the system timer peripheral generates a signal
>    to indicate a match for the appropriate channel. The match signal
>    is then fed into the interrupt controller.
> 
> This peripheral is used since Linux 3.7, commit ee4af5696720
> ("ARM: bcm2835: add system timer").
> 
> [*] https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/hw/timer/bcm2835_systmr.h | 11 +++++++--
>   hw/timer/bcm2835_systmr.c         | 41 +++++++++++++++++++------------
>   hw/timer/trace-events             |  4 ++-
>   3 files changed, 37 insertions(+), 19 deletions(-)
> 
> diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
> index e0db9e9e12b..17fdd9d67b2 100644
> --- a/include/hw/timer/bcm2835_systmr.h
> +++ b/include/hw/timer/bcm2835_systmr.h
> @@ -11,6 +11,7 @@
>   
>   #include "hw/sysbus.h"
>   #include "hw/irq.h"
> +#include "qemu/timer.h"
>   #include "qom/object.h"
>   
>   #define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
> @@ -20,18 +21,24 @@ DECLARE_INSTANCE_CHECKER(BCM2835SystemTimerState, BCM2835_SYSTIMER,
>   
>   #define BCM2835_SYSTIMER_COUNT 4
>   
> +typedef struct {
> +    unsigned id;
> +    QEMUTimer timer;
> +    qemu_irq irq;
> +    BCM2835SystemTimerState *state;
> +} BCM2835SystemTimerCompare;
> +
>   struct BCM2835SystemTimerState {
>       /*< private >*/
>       SysBusDevice parent_obj;
>   
>       /*< public >*/
>       MemoryRegion iomem;
> -    qemu_irq irq;
> -
>       struct {
>           uint32_t ctrl_status;
>           uint32_t compare[BCM2835_SYSTIMER_COUNT];
>       } reg;
> +    BCM2835SystemTimerCompare tmr[BCM2835_SYSTIMER_COUNT];
>   };
>   
>   #endif
> diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
> index b234e83824f..43e644f5e45 100644
> --- a/hw/timer/bcm2835_systmr.c
> +++ b/hw/timer/bcm2835_systmr.c
> @@ -28,20 +28,13 @@ REG32(COMPARE1,     0x10)
>   REG32(COMPARE2,     0x14)
>   REG32(COMPARE3,     0x18)
>   
> -static void bcm2835_systmr_update_irq(BCM2835SystemTimerState *s)
> +static void bcm2835_systmr_timer_expire(void *opaque)
>   {
> -    bool enable = !!s->reg.ctrl_status;
> +    BCM2835SystemTimerCompare *tmr = opaque;
>   
> -    trace_bcm2835_systmr_irq(enable);
> -    qemu_set_irq(s->irq, enable);
> -}
> -
> -static void bcm2835_systmr_update_compare(BCM2835SystemTimerState *s,
> -                                          unsigned timer_index)
> -{
> -    /* TODO fow now, since neither Linux nor U-boot use these timers. */
> -    qemu_log_mask(LOG_UNIMP, "COMPARE register %u not implemented\n",
> -                  timer_index);
> +    trace_bcm2835_systmr_timer_expired(tmr->id);
> +    tmr->state->reg.ctrl_status |= 1 << tmr->id;
> +    qemu_set_irq(tmr->irq, 1);
>   }
>   
>   static uint64_t bcm2835_systmr_read(void *opaque, hwaddr offset,
> @@ -78,16 +71,25 @@ static void bcm2835_systmr_write(void *opaque, hwaddr offset,
>                                    uint64_t value, unsigned size)
>   {
>       BCM2835SystemTimerState *s = BCM2835_SYSTIMER(opaque);
> +    int index;
>   
>       trace_bcm2835_systmr_write(offset, value);
>       switch (offset) {
>       case A_CTRL_STATUS:
>           s->reg.ctrl_status &= ~value; /* Ack */
> -        bcm2835_systmr_update_irq(s);
> +        for (index = 0; index < ARRAY_SIZE(s->tmr); index++) {
> +            if (extract32(value, index, 1)) {
> +                trace_bcm2835_systmr_irq_ack(index);
> +                qemu_set_irq(s->tmr[index].irq, 0);
> +            }
> +        }
>           break;
>       case A_COMPARE0 ... A_COMPARE3:
> -        s->reg.compare[(offset - A_COMPARE0) >> 2] = value;
> -        bcm2835_systmr_update_compare(s, (offset - A_COMPARE0) >> 2);
> +        index = (offset - A_COMPARE0) >> 2;
> +        s->reg.compare[index] = value;
> +        timer_mod(&s->tmr[index].timer, value);
I think "value" is wrong here. timer_mod takes an absolute time value. 
Here "value" is a 32 bits truncated view of "current_time + some_time".
> +        trace_bcm2835_systmr_run(index,
> +                                 value - qemu_clock_get_us(QEMU_CLOCK_VIRTUAL));
Here also.

I think you can do something like (untested):
            {
                uint64_t now, triggers_at;
                uint32_t clo, triggers_in;

                index = (offset - A_COMPARE0) >> 2;
                s->reg.compare[index] = value;

                /* get the current clock and its truncated 32 bits view */
                now = qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);
                clo = now;

                /* will overflow in case clo > value. We still get the 
correct value on 32 bits (which is "UINT32_MAX - (clo - value)") */
                triggers_in = value - clo;

                /* timer_mod takes an absolute time value, go back to 64 
bits values */
                triggers_at = now + triggers_in;
                timer_mod(&s->tmr[index].timer, triggers_at);

                trace_bcm2835_systmr_run(index, triggers_in);
            }


The rest is OK to me.

-- 
Luc

>           break;
>       case A_COUNTER_LOW:
>       case A_COUNTER_HIGH:
> @@ -125,7 +127,14 @@ static void bcm2835_systmr_realize(DeviceState *dev, Error **errp)
>       memory_region_init_io(&s->iomem, OBJECT(dev), &bcm2835_systmr_ops,
>                             s, "bcm2835-sys-timer", 0x20);
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> -    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> +
> +    for (size_t i = 0; i < ARRAY_SIZE(s->tmr); i++) {
> +        s->tmr[i].id = i;
> +        s->tmr[i].state = s;
> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->tmr[i].irq);
> +        timer_init_us(&s->tmr[i].timer, QEMU_CLOCK_VIRTUAL,
> +                      bcm2835_systmr_timer_expire, &s->tmr[i]);
> +    }
>   }
>   
>   static const VMStateDescription bcm2835_systmr_vmstate = {
> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
> index b996d992000..f4ca31d4951 100644
> --- a/hw/timer/trace-events
> +++ b/hw/timer/trace-events
> @@ -77,9 +77,11 @@ nrf51_timer_write(uint8_t timer_id, uint64_t addr, uint32_t value, unsigned size
>   nrf51_timer_set_count(uint8_t timer_id, uint8_t counter_id, uint32_t value) "timer %u counter %u count 0x%" PRIx32
>   
>   # bcm2835_systmr.c
> -bcm2835_systmr_irq(bool enable) "timer irq state %u"
> +bcm2835_systmr_timer_expired(unsigned id) "timer #%u expired"
> +bcm2835_systmr_irq_ack(unsigned id) "timer #%u acked"
>   bcm2835_systmr_read(uint64_t offset, uint64_t data) "timer read: offset 0x%" PRIx64 " data 0x%" PRIx64
>   bcm2835_systmr_write(uint64_t offset, uint64_t data) "timer write: offset 0x%" PRIx64 " data 0x%" PRIx64
> +bcm2835_systmr_run(unsigned id, uint64_t delay_us) "timer #%u expiring in %"PRIu64" us"
>   
>   # avr_timer16.c
>   avr_timer16_read(uint8_t addr, uint8_t value) "timer16 read addr:%u value:%u"
> 

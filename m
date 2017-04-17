Received: by 10.25.0.144 with SMTP id 138csp1212445lfa;
        Mon, 17 Apr 2017 03:21:38 -0700 (PDT)
X-Received: by 10.55.94.130 with SMTP id s124mr6983935qkb.141.1492424498407;
        Mon, 17 Apr 2017 03:21:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l126si10507155qkc.129.2017.04.17.03.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Apr 2017 03:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d03mr-0002rD-RO
	for alex.bennee@linaro.org; Mon, 17 Apr 2017 06:21:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d03mk-0002pq-TD
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 06:21:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d03mj-0002Zf-9U
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 06:21:30 -0400
Received: from mail-yb0-x241.google.com ([2607:f8b0:4002:c09::241]:34213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d03mf-0002Xu-Gk; Mon, 17 Apr 2017 06:21:25 -0400
Received: by mail-yb0-x241.google.com with SMTP id m133so5244872ybb.1;
	Mon, 17 Apr 2017 03:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OwfWKM/VDbjSozatX+nLN1CNen5obIZ6UxV5cU/sQjA=;
	b=W1gKyn9Hh1VoMnnMmCq1JVLnk0ca50ZiEqveL9ni2SSzs0kA6fnlI+buAyGhyCu+i2
	Iy2yn69uhsK7DXoaiskcOJrHDrVYk5fSmZnQqG/EFRUKz80MyVbKJ9oWgfVXKdabR0Tq
	7rEaa8zd1f5CFYu8GS9aE2jXJqmAZiuLsoP0IBUer3NE11svEvpGW5MppRUAgOlt/h3R
	/1ELB+99g3B/6Dat05OTNkRS2CHx23AtgaxZop8UgI7PW1mUHBcXdo8id7qbX4A8UXZW
	D7af9sdMo9+ZJVMGGix5bHtLiCkOsYv9RrAglF8viO5O4RUHwUiDLljbT9mu1H33XikY
	e90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OwfWKM/VDbjSozatX+nLN1CNen5obIZ6UxV5cU/sQjA=;
	b=GKsWhqX02tnJdHr70dNas+rbFCq+dyMRM7H1IMQ/rbhe4BStAmknyl4R5a3NZqK7P4
	3UUaFHf2bXco90GoFlWvRYl0/j7OwcWIcfB9qt5hR/QjtXtF/LZs8LZuQuia3kgPnOrD
	IUe05n4VftceCedT5LZMEA21FD8GJZBd15tbs3IvP1+GflBH1mQFCtFldwNXycHfNY9/
	BwMl3ES7/85oUNgOBKyZOhT21g61i0XYJioJJehY2jFwVqj747BT2F9R0Ux3dSVhr0t7
	KyKRKpUKjPvS6SZ90gpkvd7wD9MwhXp11x92uydQcFmYzxhARC6PV7gLDoYHNTpEMqrX
	8F5w==
X-Gm-Message-State: AN3rC/5JRurN2Tnu7BBy8CnVk5ahIidR3Stzl2Rsp11vilJ/rwwmRPm7
	2gTxl53DZvDHe3Mn9xkLl+6YUDwjvg==
X-Received: by 10.37.87.2 with SMTP id l2mr15149925ybb.142.1492424484544; Mon,
	17 Apr 2017 03:21:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Mon, 17 Apr 2017 03:21:24 -0700 (PDT)
In-Reply-To: <CAKmqyKMW-aTdzvTH5sir1BPx6U9XtgiZZ7TVigooXLFMY=UEQg@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<1491736758-19540-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKMW-aTdzvTH5sir1BPx6U9XtgiZZ7TVigooXLFMY=UEQg@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 17 Apr 2017 15:51:24 +0530
Message-ID: <CALHRZuroavWhKmiZEC6eCh0KFif0dWuQWi=QprH122QnAGjnpA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel RFC v2 1/4] msf2: Add
 Smartfusion2 System timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G/m8XOwrODVN

Hii Alistair,

On Sat, Apr 15, 2017 at 2:58 AM, Alistair Francis <alistair23@gmail.com> wrote:
> On Sun, Apr 9, 2017 at 4:19 AM, Subbaraya Sundeep
> <sundeep.lkml@gmail.com> wrote:
>> Modelled System Timer in Microsemi's Smartfusion2 Soc.
>> Timer has two 32bit down counters and two interrupts.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>
> Hey Sundeep,
>
> I have some comments inline below.
>
>> ---
>>  hw/timer/Makefile.objs |   1 +
>>  hw/timer/msf2_timer.c  | 273 +++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 274 insertions(+)
>>  create mode 100644 hw/timer/msf2_timer.c
>>
>> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>> index dd6f27e..0bdf1e1 100644
>> --- a/hw/timer/Makefile.objs
>> +++ b/hw/timer/Makefile.objs
>> @@ -41,3 +41,4 @@ common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
>>  common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
>>
>>  common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
>> +common-obj-$(CONFIG_MSF2) += msf2_timer.o
>> diff --git a/hw/timer/msf2_timer.c b/hw/timer/msf2_timer.c
>> new file mode 100644
>> index 0000000..962ada4
>> --- /dev/null
>> +++ b/hw/timer/msf2_timer.c
>> @@ -0,0 +1,273 @@
>> +/*
>> + * Timer block model of Microsemi SmartFusion2.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>> + * of this software and associated documentation files (the "Software"), to deal
>> + * in the Software without restriction, including without limitation the rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>> + * copies of the Software, and to permit persons to whom the Software is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/ptimer.h"
>> +#include "qemu/log.h"
>> +#include "qemu/main-loop.h"
>> +
>> +#define D(x)
>
> Don't use this for debug prints, you want something more along the
> lines of what is at the top of hw/misc/stm32f2xx_syscfg.c. Basically
> wrap around the qemu_log() function.

Ok I will use qemu_log like in hw/misc/stm32f2xx_syscfg.c
>
>> +
>> +#define NUM_TIMERS     2
>> +
>> +#define R_VAL          0
>> +#define R_LOADVAL      1
>> +#define R_BGLOADVAL    2
>> +#define R_CTRL         3
>> +#define R_RIS          4
>> +#define R_MIS          5
>> +#define R_MAX          6
>> +
>> +#define TIMER_CTRL_ENBL     (1 << 0)
>> +#define TIMER_CTRL_ONESHOT  (1 << 1)
>> +#define TIMER_CTRL_INTR     (1 << 2)
>> +#define TIMER_RIS_ACK       (1 << 0)
>> +#define TIMER_RST_CLR       (1 << 6)
>> +
>> +struct msf2_timer {
>> +    QEMUBH *bh;
>> +    ptimer_state *ptimer;
>> +    void *parent;
>> +    int nr; /* for debug.  */
>> +
>> +    unsigned long timer_div;
>> +
>> +    uint32_t regs[R_MAX];
>> +    qemu_irq irq;
>> +};
>
> Structs in QEMU should always be named in CamelCase.

Ok I will change.
>
>> +
>> +#define TYPE_MSF2_TIMER "msf2-timer"
>> +#define MSF2_TIMER(obj) \
>> +    OBJECT_CHECK(struct timerblock, (obj), TYPE_MSF2_TIMER)
>> +
>> +struct timerblock {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion mmio;
>> +    uint32_t freq_hz;
>> +    struct msf2_timer *timers;
>> +};
>> +
>> +static inline unsigned int timer_from_addr(hwaddr addr)
>> +{
>> +    /* Timers get a 6x32bit control reg area each.  */
>> +    return addr / R_MAX;
>> +}
>> +
>> +static void timer_update_irq(struct msf2_timer *st)
>> +{
>> +    int isr;
>> +    int ier;
>
> I'd declare these both on the same line and declare them as bools.

Ok I will change.
>
>> +
>> +    isr = !!(st->regs[R_RIS] & TIMER_RIS_ACK);
>> +    ier = !!(st->regs[R_CTRL] & TIMER_CTRL_INTR);
>> +
>> +    qemu_set_irq(st->irq, (ier && isr));
>> +}
>> +
>> +static uint64_t
>> +timer_read(void *opaque, hwaddr addr, unsigned int size)
>> +{
>> +    struct timerblock *t = opaque;
>> +    struct msf2_timer *st;
>> +    uint32_t r = 0;
>> +    unsigned int timer;
>> +    int isr;
>> +    int ier;
>> +
>> +    addr >>= 2;
>> +    timer = timer_from_addr(addr);
>> +    st = &t->timers[timer];
>> +
>> +    if (timer) {
>> +        addr -= 6;
>> +    }
>
> Isn't this timer logic just checking if (addr >> 2) == R_MAX and if it
> is set (addr >> 2) back to zero? This seems an overly complex way to
> check that.
I did not get you clearly. Do you want me to write like this:
unsigned int timer = 0;

addr >>= 2;
if (addr >= R_MAX) {
    timer = 1;
    addr =  addr - R_MAX;
}

>
>> +
>> +    switch (addr) {
>> +    case R_VAL:
>> +        r = ptimer_get_count(st->ptimer);
>> +        D(qemu_log("msf2_timer t=%d read counter=%x\n", timer, r));
>> +        break;
>> +
>> +    case R_MIS:
>> +        isr = !!(st->regs[R_RIS] & TIMER_RIS_ACK);
>> +        ier = !!(st->regs[R_CTRL] & TIMER_CTRL_INTR);
>> +        r = ier && isr;
>> +        break;
>> +
>> +    default:
>> +        if (addr < ARRAY_SIZE(st->regs)) {
>> +            r = st->regs[addr];
>> +        }
>> +        break;
>> +    }
>> +    D(fprintf(stderr, "%s timer=%d %x=%x\n", __func__, timer, addr * 4, r));
>> +    return r;
>> +}
>> +
>> +static void timer_update(struct msf2_timer *st)
>> +{
>> +    uint64_t count;
>> +
>> +    D(fprintf(stderr, "%s timer=%d\n", __func__, st->nr));
>> +
>> +    if (!(st->regs[R_CTRL] & TIMER_CTRL_ENBL)) {
>> +        ptimer_stop(st->ptimer);
>> +        return;
>> +    }
>> +
>> +    count = st->regs[R_LOADVAL];
>> +    ptimer_set_limit(st->ptimer, count, 1);
>> +    ptimer_run(st->ptimer, 1);
>> +}
>
> The update function should be above the read/write functions.
>
Ok I will change

>> +
>> +static void
>> +timer_write(void *opaque, hwaddr addr,
>> +            uint64_t val64, unsigned int size)
>> +{
>> +    struct timerblock *t = opaque;
>> +    struct msf2_timer *st;
>> +    unsigned int timer;
>> +    uint32_t value = val64;
>> +
>> +    addr >>= 2;
>> +    timer = timer_from_addr(addr);
>> +    st = &t->timers[timer];
>> +    D(fprintf(stderr, "%s addr=%x val=%x (timer=%d)\n",
>> +             __func__, addr * 4, value, timer));
>> +
>> +    if (timer) {
>> +        addr -= 6;
>> +    }
>
> Same comment from the read function.
>
>> +
>> +    switch (addr) {
>> +    case R_CTRL:
>> +        st->regs[R_CTRL] = value;
>> +        timer_update(st);
>> +        break;
>> +
>> +    case R_RIS:
>> +        if (value & TIMER_RIS_ACK) {
>> +            st->regs[R_RIS] &= ~TIMER_RIS_ACK;
>> +        }
>> +        break;
>> +
>> +    case R_LOADVAL:
>> +        st->regs[R_LOADVAL] = value;
>> +        if (st->regs[R_CTRL] & TIMER_CTRL_ENBL) {
>> +            timer_update(st);
>> +        }
>> +        break;
>> +
>> +    case R_BGLOADVAL:
>> +        st->regs[R_BGLOADVAL] = value;
>> +        st->regs[R_LOADVAL] = value;
>> +        break;
>> +
>> +    case R_VAL:
>> +    case R_MIS:
>> +        break;
>> +
>> +    default:
>> +        if (addr < ARRAY_SIZE(st->regs)) {
>> +            st->regs[addr] = value;
>> +        }
>> +        break;
>> +    }
>> +    timer_update_irq(st);
>> +}
>> +
>> +static const MemoryRegionOps timer_ops = {
>> +    .read = timer_read,
>> +    .write = timer_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +    .valid = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 4
>> +    }
>> +};
>> +
>> +static void timer_hit(void *opaque)
>> +{
>> +    struct msf2_timer *st = opaque;
>> +    D(fprintf(stderr, "%s %d\n", __func__, st->nr));
>> +    st->regs[R_RIS] |= TIMER_RIS_ACK;
>> +
>> +    if (!(st->regs[R_CTRL] & TIMER_CTRL_ONESHOT)) {
>> +        timer_update(st);
>> +    }
>> +    timer_update_irq(st);
>> +}
>> +
>> +static void msf2_timer_realize(DeviceState *dev, Error **errp)
>> +{
>> +    struct timerblock *t = MSF2_TIMER(dev);
>> +    unsigned int i;
>> +
>> +    /* Init all the ptimers.  */
>> +    t->timers = g_malloc0((sizeof t->timers[0]) * NUM_TIMERS);
>> +    for (i = 0; i < NUM_TIMERS; i++) {
>> +        struct msf2_timer *st = &t->timers[i];
>> +
>> +        st->parent = t;
>> +        st->nr = i;
>> +        st->bh = qemu_bh_new(timer_hit, st);
>> +        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
>> +        ptimer_set_freq(st->ptimer, t->freq_hz);
>> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &st->irq);
>> +    }
>> +
>> +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, "msf2-timer",
>> +                          R_MAX * 4 * NUM_TIMERS);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &t->mmio);
>
> This should be in the devices init() function.

I referred Xilinx soft IP models for writing these models and used
same boilerplate code.
I am not clear about realize and init functions yet. Can you please
give a brief about them.
Don't we need to use realize function for new models?

Thanks,
Sundeep
>
> Thanks,
>
> Alistair
>
>> +}
>> +
>> +static Property msf2_timer_properties[] = {
>> +    DEFINE_PROP_UINT32("clock-frequency", struct timerblock, freq_hz,
>> +                                                                83 * 1000000),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void msf2_timer_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->realize = msf2_timer_realize;
>> +    dc->props = msf2_timer_properties;
>> +}
>> +
>> +static const TypeInfo msf2_timer_info = {
>> +    .name          = TYPE_MSF2_TIMER,
>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(struct timerblock),
>> +    .class_init    = msf2_timer_class_init,
>> +};
>> +
>> +static void msf2_timer_register_types(void)
>> +{
>> +    type_register_static(&msf2_timer_info);
>> +}
>> +
>> +type_init(msf2_timer_register_types)
>> --
>> 2.5.0
>>
>>

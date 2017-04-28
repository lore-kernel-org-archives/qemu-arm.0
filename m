Received: by 10.25.0.144 with SMTP id 138csp223147lfa;
        Fri, 28 Apr 2017 07:20:30 -0700 (PDT)
X-Received: by 10.55.91.133 with SMTP id p127mr10660095qkb.280.1493389230360;
        Fri, 28 Apr 2017 07:20:30 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si6094230qkf.216.2017.04.28.07.20.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 07:20:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d46l3-0007sH-Pu
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 10:20:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d46kC-0007WN-Ny
	for qemu-devel@nongnu.org; Fri, 28 Apr 2017 10:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d46kB-0003EC-Dm
	for qemu-devel@nongnu.org; Fri, 28 Apr 2017 10:19:36 -0400
Received: from mail-yw0-x22b.google.com ([2607:f8b0:4002:c05::22b]:33409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d46kB-0003DX-7P; Fri, 28 Apr 2017 10:19:35 -0400
Received: by mail-yw0-x22b.google.com with SMTP id 203so31296757ywe.0;
	Fri, 28 Apr 2017 07:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XXM57jZ/iVZ5lQaY8i4FmXr4Bkev0fWwJIg0Cn2oR1U=;
	b=SaDL51gKkR1fQa1XGdJcUNlbB5oGAfMa0I0K9w+FFI0tBr+gh5jjaJykLnlhbuGIuP
	30hjbDeX8ldTCDm5Ffqko9iagpEF7CnTrPBft0cxyPynEnQdQSpHG6wWOg70/u6p0M6s
	4hF/1HJMwiximpod/v+lB+lw0ja6QSwpA8yrHdk6ZqbIi2KiGYUvg7RJSrAI7fvb6T2g
	Nilu0qffQBwKOFwN+kzh9XZAdrL2egk3u4724KhKGvHncYSXXEtB2pOg9Zs/C2mh+Tsb
	QG5zVLuxFwZ2enBqsxPIdXY/8bBPCSYAKZpGFfAr09RLNVNdc6VpNw2juteoiP4FyXKJ
	BmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XXM57jZ/iVZ5lQaY8i4FmXr4Bkev0fWwJIg0Cn2oR1U=;
	b=ElodT7ofvKfEh6Pd8yauDkotC81HKbqy1SapGjV0Z3JyI0zRrexjzqAD4BzQ5mb6d8
	lyG23qJ0C9GPo0pcaIkFXsyUXwpPGg74iETqwpDOfpgbJZhZUZm2fTCn0xbdefeI8q3p
	EY7rJU3bgSeqvhiTFfnFoDueMlXl88IKaJsbTpDdd5AGgAU5PTYs7X/HYvk5MRwgawSo
	y4BUVLQ2k3UBTxV0vbuPm1aX39rXqyDYT9zQz8FupK3VAChl1lJByzqymxvqKNDO97V4
	k3vRvgtsyAeUiJFmuI87JJ1oI4CN+pVrGmuVAXPg6mrrmFhBVbVZIuOaBoEMVf1RBp9Y
	xyeA==
X-Gm-Message-State: AN3rC/6fycWENcz+cUlKrmcOoeRo/AB5z/lFvQ5mFQs5eTpHh5LCPnmK
	LpNJsNUiAK6nvi08hfJJpmo0Y8MHjg==
X-Received: by 10.13.212.79 with SMTP id w76mr9689888ywd.52.1493389173946;
	Fri, 28 Apr 2017 07:19:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Fri, 28 Apr 2017 07:19:33 -0700 (PDT)
In-Reply-To: <CAKmqyKN_bMZDqZ_LXiDqcsV1Znos5bHWrapcYSA01mX+kv23aw@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<1491736758-19540-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKMW-aTdzvTH5sir1BPx6U9XtgiZZ7TVigooXLFMY=UEQg@mail.gmail.com>
	<CALHRZuroavWhKmiZEC6eCh0KFif0dWuQWi=QprH122QnAGjnpA@mail.gmail.com>
	<CAKmqyKMT9Bn7OPU+h6o2Xj4DZXrVSBHr=jtR6jMSvhph0koegA@mail.gmail.com>
	<CALHRZuqgxQtiGwtPfm3qgm0ywpC4OdBkdSNKLO_Zzxtw2_cmHQ@mail.gmail.com>
	<CAKmqyKN_bMZDqZ_LXiDqcsV1Znos5bHWrapcYSA01mX+kv23aw@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 28 Apr 2017 19:49:33 +0530
Message-ID: <CALHRZuqvz8cQT=oCcAqdyP6Fyi-M4Mk=eoGBWATazS42uoV=7A@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::22b
Subject: Re: [Qemu-devel] [Qemu-devel RFC v2 1/4] msf2: Add Smartfusion2
 System timer
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bKfdn8IJeaqy

Hi Alistair,

On Fri, Apr 28, 2017 at 12:23 AM, Alistair Francis <alistair23@gmail.com> wrote:
> On Tue, Apr 25, 2017 at 3:36 AM, sundeep subbaraya
> <sundeep.lkml@gmail.com> wrote:
>> Hi Alistair,
>>
>> On Mon, Apr 24, 2017 at 11:14 PM, Alistair Francis <alistair23@gmail.com> wrote:
>>>>>> +
>>>>>> +    isr = !!(st->regs[R_RIS] & TIMER_RIS_ACK);
>>>>>> +    ier = !!(st->regs[R_CTRL] & TIMER_CTRL_INTR);
>>>>>> +
>>>>>> +    qemu_set_irq(st->irq, (ier && isr));
>>>>>> +}
>>>>>> +
>>>>>> +static uint64_t
>>>>>> +timer_read(void *opaque, hwaddr addr, unsigned int size)
>>>>>> +{
>>>>>> +    struct timerblock *t = opaque;
>>>>>> +    struct msf2_timer *st;
>>>>>> +    uint32_t r = 0;
>>>>>> +    unsigned int timer;
>>>>>> +    int isr;
>>>>>> +    int ier;
>>>>>> +
>>>>>> +    addr >>= 2;
>>>>>> +    timer = timer_from_addr(addr);
>>>>>> +    st = &t->timers[timer];
>>>>>> +
>>>>>> +    if (timer) {
>>>>>> +        addr -= 6;
>>>>>> +    }
>>>>>
>>>>> Isn't this timer logic just checking if (addr >> 2) == R_MAX and if it
>>>>> is set (addr >> 2) back to zero? This seems an overly complex way to
>>>>> check that.
>>>> I did not get you clearly. Do you want me to write like this:
>>>> unsigned int timer = 0;
>>>>
>>>> addr >>= 2;
>>>> if (addr >= R_MAX) {
>>>>     timer = 1;
>>>>     addr =  addr - R_MAX;
>>>> }
>>>
>>> Yeah, I think this is clearer then what you had earlier.
>>>
>>> Although why do you have to subtract R_MAX, shouldn't it just be an
>>> error if accessing values larger then R_MAX?
>>
>> Sorry I forgot about replying to this in earlier mail.
>> There are two independent timer blocks accessing same base address.
>> Based on offset passed in read/write functions we figure out
>> which block has to be handled.
>> 0x0 to 0x14 -> timer1
>> 0x18 to 0x2C -> timer2
>> Here R_MAX is 0x18 hence addr >= R_MAX is valid and refers to timer2.
>> Although I missed the bounds checking 0 < addr < 0x2C. I will add that
>> check in read and
>> write functions.
>
> Ok, when you send the next version can you explain this in comments
> that way it's clear what you are trying to do.

Sure Alistair.

Thanks,
Sundeep
>
> Thanks,
>
> Alistair
>
>>
>> Thanks,
>> Sundeep
>>>
>>>>
>>>>>
>>>>>> +
>>>>>> +    switch (addr) {
>>>>>> +    case R_VAL:
>>>>>> +        r = ptimer_get_count(st->ptimer);
>>>>>> +        D(qemu_log("msf2_timer t=%d read counter=%x\n", timer, r));
>>>>>> +        break;
>>>>>> +
>>>>>> +    case R_MIS:
>>>>>> +        isr = !!(st->regs[R_RIS] & TIMER_RIS_ACK);
>>>>>> +        ier = !!(st->regs[R_CTRL] & TIMER_CTRL_INTR);
>>>>>> +        r = ier && isr;
>>>>>> +        break;
>>>>>> +
>>>>>> +    default:
>>>>>> +        if (addr < ARRAY_SIZE(st->regs)) {
>>>>>> +            r = st->regs[addr];
>>>>>> +        }
>>>>>> +        break;
>>>>>> +    }
>>>>>> +    D(fprintf(stderr, "%s timer=%d %x=%x\n", __func__, timer, addr * 4, r));
>>>>>> +    return r;
>>>>>> +}
>>>>>> +
>>>>>> +static void timer_update(struct msf2_timer *st)
>>>>>> +{
>>>>>> +    uint64_t count;
>>>>>> +
>>>>>> +    D(fprintf(stderr, "%s timer=%d\n", __func__, st->nr));
>>>>>> +
>>>>>> +    if (!(st->regs[R_CTRL] & TIMER_CTRL_ENBL)) {
>>>>>> +        ptimer_stop(st->ptimer);
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>> +    count = st->regs[R_LOADVAL];
>>>>>> +    ptimer_set_limit(st->ptimer, count, 1);
>>>>>> +    ptimer_run(st->ptimer, 1);
>>>>>> +}
>>>>>
>>>>> The update function should be above the read/write functions.
>>>>>
>>>> Ok I will change
>>>>
>>>>>> +
>>>>>> +static void
>>>>>> +timer_write(void *opaque, hwaddr addr,
>>>>>> +            uint64_t val64, unsigned int size)
>>>>>> +{
>>>>>> +    struct timerblock *t = opaque;
>>>>>> +    struct msf2_timer *st;
>>>>>> +    unsigned int timer;
>>>>>> +    uint32_t value = val64;
>>>>>> +
>>>>>> +    addr >>= 2;
>>>>>> +    timer = timer_from_addr(addr);
>>>>>> +    st = &t->timers[timer];
>>>>>> +    D(fprintf(stderr, "%s addr=%x val=%x (timer=%d)\n",
>>>>>> +             __func__, addr * 4, value, timer));
>>>>>> +
>>>>>> +    if (timer) {
>>>>>> +        addr -= 6;
>>>>>> +    }
>>>>>
>>>>> Same comment from the read function.
>>>>>
>>>>>> +
>>>>>> +    switch (addr) {
>>>>>> +    case R_CTRL:
>>>>>> +        st->regs[R_CTRL] = value;
>>>>>> +        timer_update(st);
>>>>>> +        break;
>>>>>> +
>>>>>> +    case R_RIS:
>>>>>> +        if (value & TIMER_RIS_ACK) {
>>>>>> +            st->regs[R_RIS] &= ~TIMER_RIS_ACK;
>>>>>> +        }
>>>>>> +        break;
>>>>>> +
>>>>>> +    case R_LOADVAL:
>>>>>> +        st->regs[R_LOADVAL] = value;
>>>>>> +        if (st->regs[R_CTRL] & TIMER_CTRL_ENBL) {
>>>>>> +            timer_update(st);
>>>>>> +        }
>>>>>> +        break;
>>>>>> +
>>>>>> +    case R_BGLOADVAL:
>>>>>> +        st->regs[R_BGLOADVAL] = value;
>>>>>> +        st->regs[R_LOADVAL] = value;
>>>>>> +        break;
>>>>>> +
>>>>>> +    case R_VAL:
>>>>>> +    case R_MIS:
>>>>>> +        break;
>>>>>> +
>>>>>> +    default:
>>>>>> +        if (addr < ARRAY_SIZE(st->regs)) {
>>>>>> +            st->regs[addr] = value;
>>>>>> +        }
>>>>>> +        break;
>>>>>> +    }
>>>>>> +    timer_update_irq(st);
>>>>>> +}
>>>>>> +
>>>>>> +static const MemoryRegionOps timer_ops = {
>>>>>> +    .read = timer_read,
>>>>>> +    .write = timer_write,
>>>>>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>>>>> +    .valid = {
>>>>>> +        .min_access_size = 4,
>>>>>> +        .max_access_size = 4
>>>>>> +    }
>>>>>> +};
>>>>>> +
>>>>>> +static void timer_hit(void *opaque)
>>>>>> +{
>>>>>> +    struct msf2_timer *st = opaque;
>>>>>> +    D(fprintf(stderr, "%s %d\n", __func__, st->nr));
>>>>>> +    st->regs[R_RIS] |= TIMER_RIS_ACK;
>>>>>> +
>>>>>> +    if (!(st->regs[R_CTRL] & TIMER_CTRL_ONESHOT)) {
>>>>>> +        timer_update(st);
>>>>>> +    }
>>>>>> +    timer_update_irq(st);
>>>>>> +}
>>>>>> +
>>>>>> +static void msf2_timer_realize(DeviceState *dev, Error **errp)
>>>>>> +{
>>>>>> +    struct timerblock *t = MSF2_TIMER(dev);
>>>>>> +    unsigned int i;
>>>>>> +
>>>>>> +    /* Init all the ptimers.  */
>>>>>> +    t->timers = g_malloc0((sizeof t->timers[0]) * NUM_TIMERS);
>>>>>> +    for (i = 0; i < NUM_TIMERS; i++) {
>>>>>> +        struct msf2_timer *st = &t->timers[i];
>>>>>> +
>>>>>> +        st->parent = t;
>>>>>> +        st->nr = i;
>>>>>> +        st->bh = qemu_bh_new(timer_hit, st);
>>>>>> +        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
>>>>>> +        ptimer_set_freq(st->ptimer, t->freq_hz);
>>>>>> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &st->irq);
>>>>>> +    }
>>>>>> +
>>>>>> +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, "msf2-timer",
>>>>>> +                          R_MAX * 4 * NUM_TIMERS);
>>>>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &t->mmio);
>>>>>
>>>>> This should be in the devices init() function.
>>>>
>>>> I referred Xilinx soft IP models for writing these models and used
>>>> same boilerplate code.
>>>> I am not clear about realize and init functions yet. Can you please
>>>> give a brief about them.
>>>
>>> Basically the simple explanation is that init is called when the
>>> object is created and realize is called when the object is realized.
>>>
>>> Generally for devices it will go something like this:
>>>  1. init
>>>  2. Set properties
>>>  3. Connect things
>>>  4. realize
>>>  5. Map to memory
>>>
>>>> Don't we need to use realize function for new models?
>>>
>>> AFAIK we still put things like: sysbus_init_irq(),
>>> memory_region_init_io() and sysbus_init_mmio() in the init function.
>>>
>>> I don't think we are at a stage yet to not use init functions.
>>>
>>> Thanks,
>>>
>>> Alistair
>>>
>>>>
>>>> Thanks,
>>>> Sundeep
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Alistair
>>>>>
>>>>>> +}
>>>>>> +
>>>>>> +static Property msf2_timer_properties[] = {
>>>>>> +    DEFINE_PROP_UINT32("clock-frequency", struct timerblock, freq_hz,
>>>>>> +                                                                83 * 1000000),
>>>>>> +    DEFINE_PROP_END_OF_LIST(),
>>>>>> +};
>>>>>> +
>>>>>> +static void msf2_timer_class_init(ObjectClass *klass, void *data)
>>>>>> +{
>>>>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>>>>> +
>>>>>> +    dc->realize = msf2_timer_realize;
>>>>>> +    dc->props = msf2_timer_properties;
>>>>>> +}
>>>>>> +
>>>>>> +static const TypeInfo msf2_timer_info = {
>>>>>> +    .name          = TYPE_MSF2_TIMER,
>>>>>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>>>>>> +    .instance_size = sizeof(struct timerblock),
>>>>>> +    .class_init    = msf2_timer_class_init,
>>>>>> +};
>>>>>> +
>>>>>> +static void msf2_timer_register_types(void)
>>>>>> +{
>>>>>> +    type_register_static(&msf2_timer_info);
>>>>>> +}
>>>>>> +
>>>>>> +type_init(msf2_timer_register_types)
>>>>>> --
>>>>>> 2.5.0
>>>>>>
>>>>>>

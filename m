Received: by 10.25.0.144 with SMTP id 138csp1519541lfa;
        Mon, 24 Apr 2017 10:44:56 -0700 (PDT)
X-Received: by 10.237.41.199 with SMTP id o65mr29374104qtd.239.1493055896786;
        Mon, 24 Apr 2017 10:44:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d23si3563605qta.288.2017.04.24.10.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Apr 2017 10:44:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d2i2i-000497-7B
	for alex.bennee@linaro.org; Mon, 24 Apr 2017 13:44:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1d2i2a-00047V-37
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 13:44:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1d2i2Y-0007xg-Ug
	for qemu-arm@nongnu.org; Mon, 24 Apr 2017 13:44:48 -0400
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:34662)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1d2i2W-0007vX-39; Mon, 24 Apr 2017 13:44:44 -0400
Received: by mail-oi0-x235.google.com with SMTP id x184so144675234oia.1;
	Mon, 24 Apr 2017 10:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oil1hRA4iwrHUcVJ/v0VuvaKFxMS6TQqmZCinFB0lcU=;
	b=BFI2O+MTbEzVhIV6LDI1IvOhRSoQ3V8wrMYOxNbNbAnyWNQinnm4OrHm1r6Bi7KY9e
	VUwsVCi3g5EUab9PUGeJeVAdZ0NeYwYWHvUF5rdWMqYNJKGmBB6ymCuyd6sFfm5F+MtP
	7MVby85xzFBRUzR8+TIQy6dhRFIiAaOWVt8JoI0vVDwfeOB3g69nBRVr8mBgc2Gh0ct4
	utaIJvzcGfJo9gXoqoU3qjApKxfmz9fr3MCkaynbm6FAmjmY8/cayHQAD0WH7NllFiar
	zSWWWoJ/+RnbKRzczwEbtobJL7Uphimm6iAGqV3LvAjz8y8jTUj2MykBC/eDy+10Vl2G
	EA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oil1hRA4iwrHUcVJ/v0VuvaKFxMS6TQqmZCinFB0lcU=;
	b=qOrdvJ8yup6PhwxHe8ILJMaPB9sssUE7CNERaFsp7iH0/rd7cVwE3RUJ2ROURDtKuu
	pLvgGCSg/fFv/CCCRpP9sIVwA/afATjWeQi+Zbil8AEKi5Ijfa+4skWv+lLFi2kpkTjr
	ofkKXktdXGfQTf5uqLdCovMvQlDymOeidTjeGH6wEbUjT8HBRhFnzIc/o2p3zD9oPfHQ
	zpLoL6v01Myvjm/Ibo9153VJev+2QD86TSpMXe2wPj9X3J3I3nrFmL2kN9REg1bdf044
	bQNcphVE7fvGkwN907NsNqJaOoX2L3d7bVQyZZKyap4BMKVjmv72IbVGa5NJkiRxSvll
	XK9g==
X-Gm-Message-State: AN3rC/7vBKk1Pwgrdn0NdwNaetuLMgdB1VZ480AzAAKqRkXvqMsQd5Sy
	vAwC3qFPYudXZUVLWgSCF/+5Ft633A==
X-Received: by 10.157.33.13 with SMTP id i13mr12651236otb.109.1493055883068;
	Mon, 24 Apr 2017 10:44:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.44.229 with HTTP; Mon, 24 Apr 2017 10:44:12 -0700 (PDT)
In-Reply-To: <CALHRZuroavWhKmiZEC6eCh0KFif0dWuQWi=QprH122QnAGjnpA@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<1491736758-19540-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKMW-aTdzvTH5sir1BPx6U9XtgiZZ7TVigooXLFMY=UEQg@mail.gmail.com>
	<CALHRZuroavWhKmiZEC6eCh0KFif0dWuQWi=QprH122QnAGjnpA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Apr 2017 10:44:12 -0700
Message-ID: <CAKmqyKMT9Bn7OPU+h6o2Xj4DZXrVSBHr=jtR6jMSvhph0koegA@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
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
X-TUID: lLLax2un8RC8

>>> +
>>> +    isr = !!(st->regs[R_RIS] & TIMER_RIS_ACK);
>>> +    ier = !!(st->regs[R_CTRL] & TIMER_CTRL_INTR);
>>> +
>>> +    qemu_set_irq(st->irq, (ier && isr));
>>> +}
>>> +
>>> +static uint64_t
>>> +timer_read(void *opaque, hwaddr addr, unsigned int size)
>>> +{
>>> +    struct timerblock *t = opaque;
>>> +    struct msf2_timer *st;
>>> +    uint32_t r = 0;
>>> +    unsigned int timer;
>>> +    int isr;
>>> +    int ier;
>>> +
>>> +    addr >>= 2;
>>> +    timer = timer_from_addr(addr);
>>> +    st = &t->timers[timer];
>>> +
>>> +    if (timer) {
>>> +        addr -= 6;
>>> +    }
>>
>> Isn't this timer logic just checking if (addr >> 2) == R_MAX and if it
>> is set (addr >> 2) back to zero? This seems an overly complex way to
>> check that.
> I did not get you clearly. Do you want me to write like this:
> unsigned int timer = 0;
>
> addr >>= 2;
> if (addr >= R_MAX) {
>     timer = 1;
>     addr =  addr - R_MAX;
> }

Yeah, I think this is clearer then what you had earlier.

Although why do you have to subtract R_MAX, shouldn't it just be an
error if accessing values larger then R_MAX?

>
>>
>>> +
>>> +    switch (addr) {
>>> +    case R_VAL:
>>> +        r = ptimer_get_count(st->ptimer);
>>> +        D(qemu_log("msf2_timer t=%d read counter=%x\n", timer, r));
>>> +        break;
>>> +
>>> +    case R_MIS:
>>> +        isr = !!(st->regs[R_RIS] & TIMER_RIS_ACK);
>>> +        ier = !!(st->regs[R_CTRL] & TIMER_CTRL_INTR);
>>> +        r = ier && isr;
>>> +        break;
>>> +
>>> +    default:
>>> +        if (addr < ARRAY_SIZE(st->regs)) {
>>> +            r = st->regs[addr];
>>> +        }
>>> +        break;
>>> +    }
>>> +    D(fprintf(stderr, "%s timer=%d %x=%x\n", __func__, timer, addr * 4, r));
>>> +    return r;
>>> +}
>>> +
>>> +static void timer_update(struct msf2_timer *st)
>>> +{
>>> +    uint64_t count;
>>> +
>>> +    D(fprintf(stderr, "%s timer=%d\n", __func__, st->nr));
>>> +
>>> +    if (!(st->regs[R_CTRL] & TIMER_CTRL_ENBL)) {
>>> +        ptimer_stop(st->ptimer);
>>> +        return;
>>> +    }
>>> +
>>> +    count = st->regs[R_LOADVAL];
>>> +    ptimer_set_limit(st->ptimer, count, 1);
>>> +    ptimer_run(st->ptimer, 1);
>>> +}
>>
>> The update function should be above the read/write functions.
>>
> Ok I will change
>
>>> +
>>> +static void
>>> +timer_write(void *opaque, hwaddr addr,
>>> +            uint64_t val64, unsigned int size)
>>> +{
>>> +    struct timerblock *t = opaque;
>>> +    struct msf2_timer *st;
>>> +    unsigned int timer;
>>> +    uint32_t value = val64;
>>> +
>>> +    addr >>= 2;
>>> +    timer = timer_from_addr(addr);
>>> +    st = &t->timers[timer];
>>> +    D(fprintf(stderr, "%s addr=%x val=%x (timer=%d)\n",
>>> +             __func__, addr * 4, value, timer));
>>> +
>>> +    if (timer) {
>>> +        addr -= 6;
>>> +    }
>>
>> Same comment from the read function.
>>
>>> +
>>> +    switch (addr) {
>>> +    case R_CTRL:
>>> +        st->regs[R_CTRL] = value;
>>> +        timer_update(st);
>>> +        break;
>>> +
>>> +    case R_RIS:
>>> +        if (value & TIMER_RIS_ACK) {
>>> +            st->regs[R_RIS] &= ~TIMER_RIS_ACK;
>>> +        }
>>> +        break;
>>> +
>>> +    case R_LOADVAL:
>>> +        st->regs[R_LOADVAL] = value;
>>> +        if (st->regs[R_CTRL] & TIMER_CTRL_ENBL) {
>>> +            timer_update(st);
>>> +        }
>>> +        break;
>>> +
>>> +    case R_BGLOADVAL:
>>> +        st->regs[R_BGLOADVAL] = value;
>>> +        st->regs[R_LOADVAL] = value;
>>> +        break;
>>> +
>>> +    case R_VAL:
>>> +    case R_MIS:
>>> +        break;
>>> +
>>> +    default:
>>> +        if (addr < ARRAY_SIZE(st->regs)) {
>>> +            st->regs[addr] = value;
>>> +        }
>>> +        break;
>>> +    }
>>> +    timer_update_irq(st);
>>> +}
>>> +
>>> +static const MemoryRegionOps timer_ops = {
>>> +    .read = timer_read,
>>> +    .write = timer_write,
>>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>>> +    .valid = {
>>> +        .min_access_size = 4,
>>> +        .max_access_size = 4
>>> +    }
>>> +};
>>> +
>>> +static void timer_hit(void *opaque)
>>> +{
>>> +    struct msf2_timer *st = opaque;
>>> +    D(fprintf(stderr, "%s %d\n", __func__, st->nr));
>>> +    st->regs[R_RIS] |= TIMER_RIS_ACK;
>>> +
>>> +    if (!(st->regs[R_CTRL] & TIMER_CTRL_ONESHOT)) {
>>> +        timer_update(st);
>>> +    }
>>> +    timer_update_irq(st);
>>> +}
>>> +
>>> +static void msf2_timer_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    struct timerblock *t = MSF2_TIMER(dev);
>>> +    unsigned int i;
>>> +
>>> +    /* Init all the ptimers.  */
>>> +    t->timers = g_malloc0((sizeof t->timers[0]) * NUM_TIMERS);
>>> +    for (i = 0; i < NUM_TIMERS; i++) {
>>> +        struct msf2_timer *st = &t->timers[i];
>>> +
>>> +        st->parent = t;
>>> +        st->nr = i;
>>> +        st->bh = qemu_bh_new(timer_hit, st);
>>> +        st->ptimer = ptimer_init(st->bh, PTIMER_POLICY_DEFAULT);
>>> +        ptimer_set_freq(st->ptimer, t->freq_hz);
>>> +        sysbus_init_irq(SYS_BUS_DEVICE(dev), &st->irq);
>>> +    }
>>> +
>>> +    memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, "msf2-timer",
>>> +                          R_MAX * 4 * NUM_TIMERS);
>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &t->mmio);
>>
>> This should be in the devices init() function.
>
> I referred Xilinx soft IP models for writing these models and used
> same boilerplate code.
> I am not clear about realize and init functions yet. Can you please
> give a brief about them.

Basically the simple explanation is that init is called when the
object is created and realize is called when the object is realized.

Generally for devices it will go something like this:
 1. init
 2. Set properties
 3. Connect things
 4. realize
 5. Map to memory

> Don't we need to use realize function for new models?

AFAIK we still put things like: sysbus_init_irq(),
memory_region_init_io() and sysbus_init_mmio() in the init function.

I don't think we are at a stage yet to not use init functions.

Thanks,

Alistair

>
> Thanks,
> Sundeep
>>
>> Thanks,
>>
>> Alistair
>>
>>> +}
>>> +
>>> +static Property msf2_timer_properties[] = {
>>> +    DEFINE_PROP_UINT32("clock-frequency", struct timerblock, freq_hz,
>>> +                                                                83 * 1000000),
>>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> +static void msf2_timer_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +
>>> +    dc->realize = msf2_timer_realize;
>>> +    dc->props = msf2_timer_properties;
>>> +}
>>> +
>>> +static const TypeInfo msf2_timer_info = {
>>> +    .name          = TYPE_MSF2_TIMER,
>>> +    .parent        = TYPE_SYS_BUS_DEVICE,
>>> +    .instance_size = sizeof(struct timerblock),
>>> +    .class_init    = msf2_timer_class_init,
>>> +};
>>> +
>>> +static void msf2_timer_register_types(void)
>>> +{
>>> +    type_register_static(&msf2_timer_info);
>>> +}
>>> +
>>> +type_init(msf2_timer_register_types)
>>> --
>>> 2.5.0
>>>
>>>

Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp769978wrm;
        Wed, 9 Oct 2019 04:06:36 -0700 (PDT)
X-Received: by 2002:a05:600c:d8:: with SMTP id u24mr2117153wmm.18.1570619196174;
        Wed, 09 Oct 2019 04:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570619196; cv=none;
        d=google.com; s=arc-20160816;
        b=xK/Ef1dytykn8gmJYcNo9OzNlR2yuNTM5rkKs88LP/INOA8WEIgxVjM5XzCEH7P2Fz
         q++WHLMT6NFeNA5gjEeLXdkKAf4I1aeMsKudHWvUa6eDFPcItuVbgkZXT/6empGOMkB5
         D0cDf1x2qWtFo4zRGc1GpsDZ2ACq0h3LPfd8j/muQ+GOEsLtG/C5GVygJOd1uHYwthWt
         UIOCczz1/woFdNvjSVaFfeYFI/0EeNjIyIPHQCoaxuvZOmEx3sn89FqoqOV5eUdeIZy9
         1pwWoKZ5T7LBOLWb2V48SC3RB8e8lPxKdHV2OdGQ6lHAlCuCRmtx4RKhFYS56BtbzJnI
         4X0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=nzmgl8chC2EBQZOlHe9JCwW5SDbT1V6/vDCyrlUt0EY=;
        b=zFKJED4SI6EOf+ao66O2SUYRBrKh7CV0N83K7obFW/kTDyEBRqbPD7NHhICuoT+Obo
         OsBZP3WmDsZeLFHgoxxFP0mx1Rg1TYBD9VwocEV4bzdRAbXHKr/C0hBe7Eh9KTBiq6W7
         v8HqyJ1z7SkHi2XKJbIpMGvXXw3IwbmZuAj5BaL0Z3BXZVnGx9tKZXJ+yS16GiAKVYhB
         DNR21F/4iYaLA3zDkaWo6OCN6aphHR+YBG8uovjy9eBZKZcqGwbBEMWPqcu3P8wTgAU5
         yKgtfEwB9VYD6vn4v62XvZAeAEcf+otOxXiD8hnkqVWj5hgwr74D5InUnxTqWTpE7fUj
         6nrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=d0IuCXn5;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x3sor1435155wrp.28.2019.10.09.04.06.35
        (Google Transport Security);
        Wed, 09 Oct 2019 04:06:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=d0IuCXn5;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nzmgl8chC2EBQZOlHe9JCwW5SDbT1V6/vDCyrlUt0EY=;
        b=d0IuCXn5cb6eS9o7vHnaQz+IazpcWBNOM5099Paist2p8LL3qZ71Upv6KW1dHHFkXo
         02/9PEZepRspo6et1V4e2qUWykOjUacBSsGSy1Y3e0wDhIX8Yx3Jq6W7iDvbuB96X0eb
         Z4NhJRGEtHi9rKuvZU2PJ4KrP6cWxvJcZz05vUA9pFtUJfT+PIDYLl+A0hZS0IHiYWc3
         ix64qK+RWWxfJmbTAi+g6c/1c2LNprkTdx/yI8DAi30+jaScm19wrouEpXe+G6olsn0S
         q8JmAQZlIdx/83TJ5REByJz9oqmA+kvJbonNr8SVrSwBDtPlJ3eMVxuTiQNLPmKJlorl
         Cg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nzmgl8chC2EBQZOlHe9JCwW5SDbT1V6/vDCyrlUt0EY=;
        b=fmMc6bZDQKTGBtQLa0v4/73WWnrey2WI53YyzdSHTUAU8Wn7DvrMgELWL7jTc86Ma6
         dU1n5/RYC6ofwCQGBs6IHpPr9y4y0RtUgGU0bFKJpF9qS3Vra1HSWsuIMXBR55X4ej+u
         Ey/+0AfntlZSShcve/68riDr5QobRFwVdGkzFnWGpKfG22EW6FxGE6LUAb5cAFY4I1CL
         B+nkML9S7Gl6mTIP9cQ+FkkZXwjHHQOh2hW8aCJhXOFdcinLy3T3jwONsiJYjYc4FMqm
         c6qqEi0cogmJiVp07y7RW/sIS5P9pQ7vczZZJ5QXF3iw+n0RUv8uVphV7WrzBJ8ID10/
         jlVg==
X-Gm-Message-State: APjAAAXVQ6EsCwdifpajI4IH/u7YnlbR2HCC7B7Dgq+c35CILGvikeXw
	snPQbP8WFgz3MO16KsRokxQ=
X-Google-Smtp-Source: APXvYqxa4QHzPccGiL3QrzEF9melrwv68AS2yKfAdHnnrRi1AiCbYAYLCc/H4/g5ALAFim+P/PtJmg==
X-Received: by 2002:a5d:6250:: with SMTP id m16mr2369738wrv.322.1570619195483;
        Wed, 09 Oct 2019 04:06:35 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id v16sm1755230wrt.12.2019.10.09.04.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 04:06:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 10/19] hw/timer/bcm2835: Add the BCM2835 SYS_timer
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Zolt=c3=a1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>, Pekka Enberg <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-11-f4bug@amsat.org> <87tv8ji921.fsf@linaro.org>
 <40327e41-3f13-1099-7ad2-1b64557d0d68@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75421f6b-4b17-71e4-4fc1-31a2103ad2c7@amsat.org>
Date: Wed, 9 Oct 2019 13:06:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <40327e41-3f13-1099-7ad2-1b64557d0d68@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2jmGEKXmPa2C

On 10/8/19 4:53 PM, Philippe Mathieu-Daudé wrote:
> On 10/8/19 4:52 PM, Alex Bennée wrote:
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> Add the 64-bit free running timer. Do not model the COMPARE register
>>> (no IRQ generated).
>>> This timer is used by U-Boot and recent Linux kernels:
>>> https://github.com/u-boot/u-boot/blob/v2019.07/include/configs/rpi.h#L19
>>>
>>> Datasheet used:
>>> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf 
>>>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> Since which kernels? 4.19 seems to use it.
>>>
>>> checkpatch warning:
>>> WARNING: added, moved or deleted file(s), does MAINTAINERS need 
>>> updating?
>>> This is OK because the regex are:
>>>
>>>    F: hw/*/bcm283*
>>>    F: include/hw/*/bcm283*
>>> ---
>>>   hw/timer/Makefile.objs            |   1 +
>>>   hw/timer/bcm2835_systmr.c         | 100 ++++++++++++++++++++++++++++++
>>>   hw/timer/trace-events             |   4 ++
>>>   include/hw/timer/bcm2835_systmr.h |  30 +++++++++
>>>   4 files changed, 135 insertions(+)
>>>   create mode 100644 hw/timer/bcm2835_systmr.c
>>>   create mode 100644 include/hw/timer/bcm2835_systmr.h
>>>
>>> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>>> index 123d92c969..696cda5905 100644
>>> --- a/hw/timer/Makefile.objs
>>> +++ b/hw/timer/Makefile.objs
>>> @@ -47,3 +47,4 @@ common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
>>>   common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
>>>   common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) += cmsdk-apb-dualtimer.o
>>>   common-obj-$(CONFIG_MSF2) += mss-timer.o
>>> +common-obj-$(CONFIG_RASPI) += bcm2835_systmr.o
>>> diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
>>> new file mode 100644
>>> index 0000000000..c4d2b488bd
>>> --- /dev/null
>>> +++ b/hw/timer/bcm2835_systmr.c
>>> @@ -0,0 +1,100 @@
>>> +/*
>>> + * BCM2835 SYS timer emulation
>>> + *
>>> + * Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 or
>>> + * (at your option) any later version.
>>> + *
>>> + * Datasheet: BCM2835 ARM Peripherals (C6357-M-1398)
>>> + * 
>>> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf 
>>>
>>> + *
>>> + * Only the free running 64-bit counter is implemented.
>>> + * The 4 COMPARE registers and the interruption are not implemented.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/timer.h"
>>> +#include "qemu/log.h"
>>> +#include "hw/registerfields.h"
>>> +#include "hw/timer/bcm2835_systmr.h"
>>> +#include "trace.h"
>>> +
>>> +REG32(CTRL_STATUS,  0x00)
>>> +REG32(COUNTER_LOW,  0x04)
>>> +REG32(COUNTER_HIGH, 0x08)
>>> +REG32(COMPARE0,     0x0c)
>>> +REG32(COMPARE1,     0x10)
>>> +REG32(COMPARE2,     0x14)
>>> +REG32(COMPARE3,     0x18)
>>> +
>>> +static uint64_t bcm2835_sys_timer_read(void *opaque, hwaddr offset,
>>> +                                       unsigned size)
>>> +{
>>> +    uint64_t r = 0;
>>> +
>>> +    switch (offset) {
>>> +    case A_CTRL_STATUS:
>>> +    case A_COMPARE0 ... A_COMPARE3:
>>
>> Probably worth a LOG_UNIMP in here if we are not going to do it.

Checking the datasheet again, returning 0 is correct (as long as the 
gest doesn't write them) since we don't implement the COMPARE registers.

I'll see if I can implement them.

>>> +        break;
>>> +    case A_COUNTER_LOW:
>>> +    case A_COUNTER_HIGH:
>>> +        /* Free running counter at 1MHz */
>>> +        r = qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);
>>> +        r >>= 8 * (offset - A_COUNTER_LOW);
>>> +        r &= UINT32_MAX;
>>> +        break;
>>> +    default:
>>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad offset 0x%" 
>>> HWADDR_PRIx "\n",
>>> +                      __func__, offset);
>>> +        break;
>>> +    }
>>> +    trace_bcm2835_sys_timer_read(offset, r);
>>> +
>>> +    return r;
>>> +}
>>> +
>>> +static void bcm2835_sys_timer_write(void *opaque, hwaddr offset,
>>> +                                    uint64_t value, unsigned size)
>>> +{
>>> +    trace_bcm2835_sys_timer_write(offset, value);
>>> +
>>> +    qemu_log_mask(LOG_UNIMP, "%s: bad offset 0x%" HWADDR_PRIx "\n",
>>> +                  __func__, offset);
>>> +}
>>> +
>>> +static const MemoryRegionOps bcm2835_sys_timer_ops = {
>>> +    .read = bcm2835_sys_timer_read,
>>> +    .write = bcm2835_sys_timer_write,
>>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>>> +    .impl = {
>>> +        .min_access_size = 4,
>>> +        .max_access_size = 4,
>>> +    },
>>> +};
>>> +
>>> +static void bcm2835_sys_timer_init(Object *obj)
>>> +{
>>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>>> +    BCM2835SysTimerState *s = BCM2835_SYSTIMER(obj);
>>> +
>>> +    memory_region_init_io(&s->iomem, obj, &bcm2835_sys_timer_ops,
>>> +                          s, "bcm2835-sys-timer", 0x20);
>>> +    sysbus_init_mmio(sbd, &s->iomem);
>>> +    sysbus_init_irq(sbd, &s->irq);
>>> +}
>>> +
>>> +static const TypeInfo bcm2835_sys_timer_info = {
>>> +    .name = TYPE_BCM2835_SYSTIMER,
>>> +    .parent = TYPE_SYS_BUS_DEVICE,
>>> +    .instance_size = sizeof(BCM2835SysTimerState),
>>> +    .instance_init = bcm2835_sys_timer_init,
>>> +};
>>> +
>>> +static void bcm2835_sys_timer_register_types(void)
>>> +{
>>> +    type_register_static(&bcm2835_sys_timer_info);
>>> +}
>>> +
>>> +type_init(bcm2835_sys_timer_register_types);
>>> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
>>> index db02a9142c..81967a1a19 100644
>>> --- a/hw/timer/trace-events
>>> +++ b/hw/timer/trace-events
>>> @@ -87,3 +87,7 @@ pl031_read(uint32_t addr, uint32_t value) "addr 
>>> 0x%08x value 0x%08x"
>>>   pl031_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
>>>   pl031_alarm_raised(void) "alarm raised"
>>>   pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
>>> +
>>> +# bcm2835_systmr.c
>>> +bcm2835_sys_timer_read(uint64_t offset, uint64_t data) "timer read: 
>>> offset 0x%" PRIx64 " data 0x%" PRIx64
>>> +bcm2835_sys_timer_write(uint64_t offset, uint64_t data) "timer 
>>> write: offset 0x%" PRIx64 " data 0x%" PRIx64
>>> diff --git a/include/hw/timer/bcm2835_systmr.h 
>>> b/include/hw/timer/bcm2835_systmr.h
>>> new file mode 100644
>>> index 0000000000..6ac7f8ec5a
>>> --- /dev/null
>>> +++ b/include/hw/timer/bcm2835_systmr.h
>>> @@ -0,0 +1,30 @@
>>> +/*
>>> + * BCM2835 SYS timer emulation
>>> + *
>>> + * Copyright (c) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> + *
>>> + *  This program is free software; you can redistribute it and/or 
>>> modify
>>> + *  it under the terms of the GNU General Public License version 2 or
>>> + *  (at your option) any later version.
>>> + */
>>> +
>>> +#ifndef BCM2835_SYSTIMER_H
>>> +#define BCM2835_SYSTIMER_H
>>> +
>>> +#include "hw/sysbus.h"
>>> +#include "hw/irq.h"
>>> +
>>> +#define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
>>> +#define BCM2835_SYSTIMER(obj) \
>>> +    OBJECT_CHECK(BCM2835SysTimerState, (obj), TYPE_BCM2835_SYSTIMER)
>>> +
>>> +typedef struct {
>>> +    /*< private >*/
>>> +    SysBusDevice parent_obj;
>>> +
>>> +    /*< public >*/
>>> +    MemoryRegion iomem;
>>> +    qemu_irq irq;
>>> +} BCM2835SysTimerState;
>>> +
>>> +#endif
>>
>>
>> -- 
>> Alex Bennée
>>

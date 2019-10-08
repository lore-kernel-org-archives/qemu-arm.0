Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5263955wrm;
        Tue, 8 Oct 2019 07:54:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgnsztppIVUxjbGH3zHjKp4wBUeqAQqJDpJuUZTwnJqt2bx1D9jm34OZJhX62ftZN2UqIl
X-Received: by 2002:a02:a808:: with SMTP id f8mr6021649jaj.42.1570546442093;
        Tue, 08 Oct 2019 07:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570546442; cv=none;
        d=google.com; s=arc-20160816;
        b=Vs20SAi5kqnWC2ycz1eheVs1zl5GCfb7MQo/eyS1bdmo1NkIWCKnU0tqUWGePPu4T1
         YVlTh/jCpMmshTwP/XOkbFhnKzLnQzN7BBLDuRnBF8oddsaEhS+Vk0IV28vf9OYfUQUL
         eo/qo6ztznd3F2VmgBaOlmy1e/crY5sqk7klApnsGn6uoTEqz7f2/bG/yj3cOU4YpZpD
         FULyXVc51UntTcGzmZBThXqUqlrYaDUH8BCtayJTsTCQXuGpuDdws0WLRXRYZ0a+bnaP
         QHXWXG/lg7UOmjjl7M3U8JieR0oG098taElioAZBwdbrTgisYnqiIIqJQAmgQI+nUqtX
         5/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=aWbzS96ziQi5mF36h9g7JEe270fSYH2pm8dcQZ3Acbc=;
        b=ffMGBKNSdd+8WxTGJY6giRqq/eUWPPECui/Io+thOIl59Mw7E4u8nTo1yKLl04ugp3
         Z9RFQljxwk/qp8geTjxL6+sDLH53qwoQtatq2khmFF4ApTE5L8oiMtVDKg9TO2TVCPdv
         HFXyFznFc1poALUWuTQgpVdUEJuMMDq46Pe1BknIJSs7SJjmIF0BR9oLJu0vAH6CEcQ3
         QsjgwJ2TaP02fj3hYbhafGMOTDprvfRlnj/ADHmfJEmfDo8an+vOworLUw2B9sC+Q/yu
         kfRAEgPjbJPHDvmBtsBd0VXHYQWUlHpZFlHq/6jc2TTFx7o2ExQRiHZVe+YZUyC/GFcX
         fsJg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g13si21932319jaa.79.2019.10.08.07.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 07:54:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15CC52CE90A
	for <alex.bennee@linaro.org>; Tue,  8 Oct 2019 14:54:01 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id k4so9111696wru.1
        for <alex.bennee@linaro.org>; Tue, 08 Oct 2019 07:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aWbzS96ziQi5mF36h9g7JEe270fSYH2pm8dcQZ3Acbc=;
        b=AdzlhU57amGtR4vYzL8xvjgEkvNc2TyvVoDySTTyE4hL8E1bDCMqkuNPErEpWXMR5O
         opRYRX6RMSm8aj9QIpRb2OI0xlXGoKrvu50AA+Ef0/UGDKk4+RnnUPDdaqj0L0S68LbT
         cst931jnjuZbm/puix4IxYJevI/HY6wSI78a4f1l9+fgxm9kMFpFDoR6BewTnZZf1keR
         2lPY7wDn7Hv7qiYai0lDpqucM2ZBW4A+upAccCHdnL4N0Oq8NJQrknVX0PhERncvU+au
         jmtPWV9s1X6cwOlV5hsRcNQUEqq+gTcRY98TAw7yrS6ccqP7kEDNE73rCeDvlwVzgTqN
         tI/Q==
X-Gm-Message-State: APjAAAWSFd3DovNxbg0JCNq5C5x9fKJA4DuYwdPeNjLuMqZm+UiJZbgU
	L8eFZDQLUYl5DmjDdnc9bwuPmTW+UGfCk35vHbvOvTRCxg5k9iRvOdxHg+goWjg8lD2ALE63NiC
	LmqtMx99T+6K6xe3g
X-Received: by 2002:a5d:574f:: with SMTP id q15mr15716702wrw.362.1570546439631;
        Tue, 08 Oct 2019 07:53:59 -0700 (PDT)
X-Received: by 2002:a5d:574f:: with SMTP id q15mr15716682wrw.362.1570546439403;
        Tue, 08 Oct 2019 07:53:59 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id p85sm3746285wme.23.2019.10.08.07.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 07:53:58 -0700 (PDT)
Subject: Re: [PATCH 10/19] hw/timer/bcm2835: Add the BCM2835 SYS_timer
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Zolt=c3=a1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>, Pekka Enberg <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-11-f4bug@amsat.org> <87tv8ji921.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <40327e41-3f13-1099-7ad2-1b64557d0d68@redhat.com>
Date: Tue, 8 Oct 2019 16:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <87tv8ji921.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: N48/h88yUHPx

On 10/8/19 4:52 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Add the 64-bit free running timer. Do not model the COMPARE register
>> (no IRQ generated).
>> This timer is used by U-Boot and recent Linux kernels:
>> https://github.com/u-boot/u-boot/blob/v2019.07/include/configs/rpi.h#L19
>>
>> Datasheet used:
>> https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Since which kernels? 4.19 seems to use it.
>>
>> checkpatch warning:
>> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>> This is OK because the regex are:
>>
>>    F: hw/*/bcm283*
>>    F: include/hw/*/bcm283*
>> ---
>>   hw/timer/Makefile.objs            |   1 +
>>   hw/timer/bcm2835_systmr.c         | 100 ++++++++++++++++++++++++++++++
>>   hw/timer/trace-events             |   4 ++
>>   include/hw/timer/bcm2835_systmr.h |  30 +++++++++
>>   4 files changed, 135 insertions(+)
>>   create mode 100644 hw/timer/bcm2835_systmr.c
>>   create mode 100644 include/hw/timer/bcm2835_systmr.h
>>
>> diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
>> index 123d92c969..696cda5905 100644
>> --- a/hw/timer/Makefile.objs
>> +++ b/hw/timer/Makefile.objs
>> @@ -47,3 +47,4 @@ common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
>>   common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
>>   common-obj-$(CONFIG_CMSDK_APB_DUALTIMER) += cmsdk-apb-dualtimer.o
>>   common-obj-$(CONFIG_MSF2) += mss-timer.o
>> +common-obj-$(CONFIG_RASPI) += bcm2835_systmr.o
>> diff --git a/hw/timer/bcm2835_systmr.c b/hw/timer/bcm2835_systmr.c
>> new file mode 100644
>> index 0000000000..c4d2b488bd
>> --- /dev/null
>> +++ b/hw/timer/bcm2835_systmr.c
>> @@ -0,0 +1,100 @@
>> +/*
>> + * BCM2835 SYS timer emulation
>> + *
>> + * Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 or
>> + * (at your option) any later version.
>> + *
>> + * Datasheet: BCM2835 ARM Peripherals (C6357-M-1398)
>> + * https://www.raspberrypi.org/app/uploads/2012/02/BCM2835-ARM-Peripherals.pdf
>> + *
>> + * Only the free running 64-bit counter is implemented.
>> + * The 4 COMPARE registers and the interruption are not implemented.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/timer.h"
>> +#include "qemu/log.h"
>> +#include "hw/registerfields.h"
>> +#include "hw/timer/bcm2835_systmr.h"
>> +#include "trace.h"
>> +
>> +REG32(CTRL_STATUS,  0x00)
>> +REG32(COUNTER_LOW,  0x04)
>> +REG32(COUNTER_HIGH, 0x08)
>> +REG32(COMPARE0,     0x0c)
>> +REG32(COMPARE1,     0x10)
>> +REG32(COMPARE2,     0x14)
>> +REG32(COMPARE3,     0x18)
>> +
>> +static uint64_t bcm2835_sys_timer_read(void *opaque, hwaddr offset,
>> +                                       unsigned size)
>> +{
>> +    uint64_t r = 0;
>> +
>> +    switch (offset) {
>> +    case A_CTRL_STATUS:
>> +    case A_COMPARE0 ... A_COMPARE3:
> 
> Probably worth a LOG_UNIMP in here if we are not going to do it.

Correct :)

>> +        break;
>> +    case A_COUNTER_LOW:
>> +    case A_COUNTER_HIGH:
>> +        /* Free running counter at 1MHz */
>> +        r = qemu_clock_get_us(QEMU_CLOCK_VIRTUAL);
>> +        r >>= 8 * (offset - A_COUNTER_LOW);
>> +        r &= UINT32_MAX;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: bad offset 0x%" HWADDR_PRIx "\n",
>> +                      __func__, offset);
>> +        break;
>> +    }
>> +    trace_bcm2835_sys_timer_read(offset, r);
>> +
>> +    return r;
>> +}
>> +
>> +static void bcm2835_sys_timer_write(void *opaque, hwaddr offset,
>> +                                    uint64_t value, unsigned size)
>> +{
>> +    trace_bcm2835_sys_timer_write(offset, value);
>> +
>> +    qemu_log_mask(LOG_UNIMP, "%s: bad offset 0x%" HWADDR_PRIx "\n",
>> +                  __func__, offset);
>> +}
>> +
>> +static const MemoryRegionOps bcm2835_sys_timer_ops = {
>> +    .read = bcm2835_sys_timer_read,
>> +    .write = bcm2835_sys_timer_write,
>> +    .endianness = DEVICE_LITTLE_ENDIAN,
>> +    .impl = {
>> +        .min_access_size = 4,
>> +        .max_access_size = 4,
>> +    },
>> +};
>> +
>> +static void bcm2835_sys_timer_init(Object *obj)
>> +{
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> +    BCM2835SysTimerState *s = BCM2835_SYSTIMER(obj);
>> +
>> +    memory_region_init_io(&s->iomem, obj, &bcm2835_sys_timer_ops,
>> +                          s, "bcm2835-sys-timer", 0x20);
>> +    sysbus_init_mmio(sbd, &s->iomem);
>> +    sysbus_init_irq(sbd, &s->irq);
>> +}
>> +
>> +static const TypeInfo bcm2835_sys_timer_info = {
>> +    .name = TYPE_BCM2835_SYSTIMER,
>> +    .parent = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(BCM2835SysTimerState),
>> +    .instance_init = bcm2835_sys_timer_init,
>> +};
>> +
>> +static void bcm2835_sys_timer_register_types(void)
>> +{
>> +    type_register_static(&bcm2835_sys_timer_info);
>> +}
>> +
>> +type_init(bcm2835_sys_timer_register_types);
>> diff --git a/hw/timer/trace-events b/hw/timer/trace-events
>> index db02a9142c..81967a1a19 100644
>> --- a/hw/timer/trace-events
>> +++ b/hw/timer/trace-events
>> @@ -87,3 +87,7 @@ pl031_read(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
>>   pl031_write(uint32_t addr, uint32_t value) "addr 0x%08x value 0x%08x"
>>   pl031_alarm_raised(void) "alarm raised"
>>   pl031_set_alarm(uint32_t ticks) "alarm set for %u ticks"
>> +
>> +# bcm2835_systmr.c
>> +bcm2835_sys_timer_read(uint64_t offset, uint64_t data) "timer read: offset 0x%" PRIx64 " data 0x%" PRIx64
>> +bcm2835_sys_timer_write(uint64_t offset, uint64_t data) "timer write: offset 0x%" PRIx64 " data 0x%" PRIx64
>> diff --git a/include/hw/timer/bcm2835_systmr.h b/include/hw/timer/bcm2835_systmr.h
>> new file mode 100644
>> index 0000000000..6ac7f8ec5a
>> --- /dev/null
>> +++ b/include/hw/timer/bcm2835_systmr.h
>> @@ -0,0 +1,30 @@
>> +/*
>> + * BCM2835 SYS timer emulation
>> + *
>> + * Copyright (c) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
>> + *
>> + *  This program is free software; you can redistribute it and/or modify
>> + *  it under the terms of the GNU General Public License version 2 or
>> + *  (at your option) any later version.
>> + */
>> +
>> +#ifndef BCM2835_SYSTIMER_H
>> +#define BCM2835_SYSTIMER_H
>> +
>> +#include "hw/sysbus.h"
>> +#include "hw/irq.h"
>> +
>> +#define TYPE_BCM2835_SYSTIMER "bcm2835-sys-timer"
>> +#define BCM2835_SYSTIMER(obj) \
>> +    OBJECT_CHECK(BCM2835SysTimerState, (obj), TYPE_BCM2835_SYSTIMER)
>> +
>> +typedef struct {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +
>> +    /*< public >*/
>> +    MemoryRegion iomem;
>> +    qemu_irq irq;
>> +} BCM2835SysTimerState;
>> +
>> +#endif
> 
> 
> --
> Alex Bennée
> 

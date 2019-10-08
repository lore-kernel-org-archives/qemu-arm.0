Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5053453wrm;
        Tue, 8 Oct 2019 04:42:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXLUucsAbwvZqKKjQB464dalkGciM4VIbEfXDc8+BBjV8+P82QNj+jfsXpkNrh5lYMVjBD
X-Received: by 2002:a92:cd50:: with SMTP id v16mr34423865ilq.157.1570534936769;
        Tue, 08 Oct 2019 04:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570534936; cv=none;
        d=google.com; s=arc-20160816;
        b=ch/29BWuMfh9UL4qwEdC+hKa0/viFvTYPW2sXJBzpG/+dnmddZ1rahkNsIKcTwqXy3
         f2VrWsiXwRjBpnLalTLLe8tWk1aobQ9fXkG9uxWR5E/7m1Nv53yUKAO3gUd/V5RGqv47
         5hr0hGKwv5XGwiUoTz7L17QV3eIYl1RjgbTN5+kBKYNxtoMeqAiVI0HhbornaF8/1NtZ
         jGRkWMjj4nwudeaoEc1Qlf3xJxBHXJm3Ddy1D9z4ttxlOdK21vWK9vKDBgGdGYJP/Gmu
         4LNOizOoEIdMtBsdYHFQ8Er3kGtW0gOCC1VKvfWSklSUOKKPsaWzY+wfbrjHDb+YeYd6
         XlSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ytok/+hvwJ6x72CSB3VsUVDvdl0dedDDZWl56ciu6zY=;
        b=TKHAoRDXrIEHCTT2WdME0Kiaf8pKJZT3gIq/RTTxUOjmFudCgTImX+omDXlpt7aJxl
         RTk0aqIS0tiUlP2ctJ4yby1GjRNXBzyC9DyWfQZKnuJazq1tDvraTdv8lakrqQfszYH7
         KSlVg7X02CrjBVmNeX1patd/Bw8cAPbdZrjQZG8Nq85S3dsqxE+w8YLgJpn2RDFtPUBp
         IgDudAvZDpPT1dcEjDgMejGj/yu46zr2MFN7K1j5JNUu4r7iIWrptXegY9ERKoIPGIHE
         kVt8Ha4VjVSIQzh8Tc+qFNC1yLp6aUBtBU6G4CowAEBvJnCoTAkQF4uJf1WSYa5MQWIK
         /4PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h12si21068074jam.30.2019.10.08.04.42.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 04:42:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BABEC51EFD
	for <alex.bennee@linaro.org>; Tue,  8 Oct 2019 11:42:15 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id s25so878205wmh.1
        for <alex.bennee@linaro.org>; Tue, 08 Oct 2019 04:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ytok/+hvwJ6x72CSB3VsUVDvdl0dedDDZWl56ciu6zY=;
        b=of9TaAT043g67hktNw1J2/ydj1SuHb/Ip+UFOzh7Iq/BPFSWa8QqUeXGGSe9s75lBZ
         ijRhHZlcE9CBiZgUF9FXataXq67N4sf95ipoU4GdiJ2wljSdzHC3p6R5EG0FQjp1VcS0
         YcxY1eo7Lh6bhsT/JbI8Z1QqRkyl/XWYkEQzAqTO97gxvbnQT3tWHQ0zKEk7htOExAia
         3VouoOlfTJuf9WWBwY9DqyjcetGUaxD5Wp1BlZFZfBzT4fDqJmz2yHSfsbM40lcCkVSv
         mVAlWQQ4DKeUgMGpHvam62GUFKPxZk9ApbkBrl/eROcFh9K8LF2n9+ldbJf5/3UQ4c8Z
         FSEg==
X-Gm-Message-State: APjAAAUS4pgIApa9DLmoBFCVn97EBAHsfexopIPJicbe5JUpzihpeFGl
	MdyU0iudYHoXi4PtPBGT++lbIFMiKlVT08ouqoDdjpHcKLxelRF263VbuBWbq6n+a5j2cjC6Mov
	RrOwHfATT5uMT9ywp
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr3326283wmj.91.1570534934441;
        Tue, 08 Oct 2019 04:42:14 -0700 (PDT)
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr3326271wmj.91.1570534934182;
        Tue, 08 Oct 2019 04:42:14 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id w18sm2589801wmc.9.2019.10.08.04.42.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2019 04:42:13 -0700 (PDT)
Subject: Re: [PATCH 08/19] hw/misc/bcm2835_thermal: Add a dummy BCM2835
 thermal sensor
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Zolt=c3=a1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>, Pekka Enberg <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-9-f4bug@amsat.org> <87v9szii4o.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e75a3602-496b-107c-8bdb-c847982547be@redhat.com>
Date: Tue, 8 Oct 2019 13:42:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <87v9szii4o.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uja2ByY6aczI

On 10/8/19 1:36 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> We will soon implement the SYS_timer. This timer is used by Linux
>> in the thermal subsystem, so once available, the subsystem will be
>> enabled and poll the temperature sensors. We need to provide the
>> minimum required to keep Linux booting.
>>
>> Add a dummy thermal sensor returning ~25°C based on:
>> https://github.com/raspberrypi/linux/blob/rpi-5.3.y/drivers/thermal/broadcom/bcm2835_thermal.c
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> checkpatch warning:
>> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>> This is OK because the regex are:
>>
>>    F: hw/*/bcm283*
>>    F: include/hw/*/bcm283*
>> ---
>>   hw/misc/Makefile.objs             |   1 +
>>   hw/misc/bcm2835_thermal.c         | 109 ++++++++++++++++++++++++++++++
>>   include/hw/misc/bcm2835_thermal.h |  27 ++++++++
>>   3 files changed, 137 insertions(+)
>>   create mode 100644 hw/misc/bcm2835_thermal.c
>>   create mode 100644 include/hw/misc/bcm2835_thermal.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index a150680966..c89f3816a5 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -53,6 +53,7 @@ common-obj-$(CONFIG_OMAP) += omap_tap.o
>>   common-obj-$(CONFIG_RASPI) += bcm2835_mbox.o
>>   common-obj-$(CONFIG_RASPI) += bcm2835_property.o
>>   common-obj-$(CONFIG_RASPI) += bcm2835_rng.o
>> +common-obj-$(CONFIG_RASPI) += bcm2835_thermal.o
>>   common-obj-$(CONFIG_SLAVIO) += slavio_misc.o
>>   common-obj-$(CONFIG_ZYNQ) += zynq_slcr.o
>>   common-obj-$(CONFIG_ZYNQ) += zynq-xadc.o
>> diff --git a/hw/misc/bcm2835_thermal.c b/hw/misc/bcm2835_thermal.c
>> new file mode 100644
>> index 0000000000..bac23f21ea
>> --- /dev/null
>> +++ b/hw/misc/bcm2835_thermal.c
>> @@ -0,0 +1,109 @@
>> +/*
>> + * BCM2835 dummy thermal sensor
>> + *
>> + * Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +#include "qemu/osdep.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/misc/bcm2835_thermal.h"
>> +#include "qemu/log.h"
>> +#include "qapi/error.h"
>> +#include "hw/registerfields.h"
>> +
>> +REG32(CTL, 0)
>> +FIELD(CTL, POWER_DOWN, 0, 1)
>> +FIELD(CTL, RESET, 1, 1)
>> +FIELD(CTL, BANDGAP_CTRL, 2, 3)
>> +FIELD(CTL, INTERRUPT_ENABLE, 5, 1)
>> +FIELD(CTL, DIRECT, 6, 1)
>> +FIELD(CTL, INTERRUPT_CLEAR, 7, 1)
>> +FIELD(CTL, HOLD, 8, 10)
>> +FIELD(CTL, RESET_DELAY, 18, 8)
>> +FIELD(CTL, REGULATOR_ENABLE, 26, 1)
>> +
>> +REG32(STAT, 4)
>> +FIELD(STAT, DATA, 0, 10)
>> +FIELD(STAT, VALID, 10, 1)
>> +FIELD(STAT, INTERRUPT, 11, 1)
>> +
>> +#define THERMAL_OFFSET_C 412
>> +#define THERMAL_COEFF  (-0.538f)
>> +
>> +static uint16_t bcm2835_thermal_temp2adc(int temp_C)
>> +{
>> +    return (temp_C - THERMAL_OFFSET_C) / THERMAL_COEFF;
>> +}
>> +
>> +static uint64_t bcm2835_thermal_read(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    Bcm2835ThermalState *s = BCM2835_THERMAL(opaque);
>> +    uint32_t val = 0;
>> +
>> +    switch (addr) {
>> +    case A_CTL:
>> +        val = s->ctl;
>> +        break;
>> +    case A_STAT:
>> +        val = FIELD_DP32(bcm2835_thermal_temp2adc(25), STAT, VALID, true);
>> +        break;
>> +    default:
>> +        g_assert_not_reached();
> 
> Will a unaligned read already have faulted and delivered an exception to
> the guest? As this access it controlled by the guest it could
> potentially take down QEMU. Perhaps it should be a LOG_GUEST_ERROR as
> bellow?

MemoryRegionOps::(valid|impl).unaligned default to false, so unaligned 
accesses won't reach this device, the guest will get a MEMTX_DECODE_ERROR.

>> +    }
>> +    return val;
>> +}
>> +
>> +static void bcm2835_thermal_write(void *opaque, hwaddr addr,
>> +                                  uint64_t value, unsigned size)
>> +{
>> +    Bcm2835ThermalState *s = BCM2835_THERMAL(opaque);
>> +
>> +    switch (addr) {
>> +    case A_CTL:
>> +        s->ctl = value;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: write 0x%" PRIx64
>> +                                       " to 0x%" HWADDR_PRIx "\n",
>> +                       __func__, value, addr);
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps bcm2835_thermal_ops = {
>> +    .read = bcm2835_thermal_read,
>> +    .write = bcm2835_thermal_write,
>> +    .impl.max_access_size = 4,
>> +    .valid.min_access_size = 4,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +static void bcm2835_thermal_realize(DeviceState *dev, Error **errp)
>> +{
>> +    Bcm2835ThermalState *s = BCM2835_THERMAL(dev);
>> +
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &bcm2835_thermal_ops,
>> +                          s, TYPE_BCM2835_THERMAL, 8);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
>> +}
>> +
>> +static void bcm2835_thermal_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +
>> +    dc->realize = bcm2835_thermal_realize;
>> +}
>> +
>> +static const TypeInfo bcm2835_thermal_info = {
>> +    .name = TYPE_BCM2835_THERMAL,
>> +    .parent = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size = sizeof(Bcm2835ThermalState),
>> +    .class_init = bcm2835_thermal_class_init,
>> +};
>> +
>> +static void bcm2835_thermal_register_types(void)
>> +{
>> +    type_register_static(&bcm2835_thermal_info);
>> +}
>> +
>> +type_init(bcm2835_thermal_register_types)
>> diff --git a/include/hw/misc/bcm2835_thermal.h b/include/hw/misc/bcm2835_thermal.h
>> new file mode 100644
>> index 0000000000..f85cce7214
>> --- /dev/null
>> +++ b/include/hw/misc/bcm2835_thermal.h
>> @@ -0,0 +1,27 @@
>> +/*
>> + * BCM2835 dummy thermal sensor
>> + *
>> + * Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +#ifndef HW_MISC_BCM2835_THERMAL_H
>> +#define HW_MISC_BCM2835_THERMAL_H
>> +
>> +#include "hw/qdev-properties.h"
>> +#include "hw/sysbus.h"
>> +
>> +#define TYPE_BCM2835_THERMAL "bcm2835-thermal"
>> +
>> +#define BCM2835_THERMAL(obj) \
>> +    OBJECT_CHECK(Bcm2835ThermalState, (obj), TYPE_BCM2835_THERMAL)
>> +
>> +typedef struct {
>> +    /*< private >*/
>> +    SysBusDevice parent_obj;
>> +    /*< public >*/
>> +    MemoryRegion iomem;
>> +    uint32_t ctl;
>> +} Bcm2835ThermalState;
>> +
>> +#endif
> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

Thanks :)

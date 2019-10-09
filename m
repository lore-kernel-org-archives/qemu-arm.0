Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp590145wrm;
        Wed, 9 Oct 2019 00:39:09 -0700 (PDT)
X-Received: by 2002:adf:cd88:: with SMTP id q8mr1738871wrj.223.1570606749313;
        Wed, 09 Oct 2019 00:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570606749; cv=none;
        d=google.com; s=arc-20160816;
        b=DaYgp6xPlWUUX79ziENDRm5Spqk0dK17yKHQr40IfODJuhGKbxAAy3Ki2OBEbUgegR
         snzJ/pfKpG5TxqHbi+34wGUez/5YwsGQbl/LGB/aMH2w6f5e+XL5iZN/M32s4tFlF6vL
         uclPWsNQuq17AjaG6kMsYPblc/wfUDb92QhPUfphK872H5cx6jaYvGiQcUCwk5zzWBPs
         9JilbnoybLAUqYGdump3gvEdzQj5QYZRVJbIfbLKjGrUNAj44Wiuj0L6ibfebGBdh8Rw
         jMjtjGxUBbBZ0WheIp3JhG/MN0kvpBsOQ17dupMSXTiLvW+zZM/+Yor7te3foyrH0RCc
         gY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=8zCFhaOYo4JvZDuTR8LT8ZeRH1glJIoNVNvHzaX7Cqs=;
        b=N1gcqZyflRWxF6v0TzR3FtQXSAPuI3Rh8MUDALtIRDDAKftSpzDtBe6pKGjhAMYkup
         WTi0ya4/OnT0WEiTeJ1vKPKO4/ztX2srr743q0QPq/3zlT1bBKY52VJ9D0tG66j0mPA1
         Ge+vonRt+6yHjrkPP2i1dHlgnLZVG2+xWwItISC0swmMtp3laXfYHTshEmIG2wVTfoQL
         +hKYIkiq17yIq2kQMkKGhG7/uV2wSImjw77DYcNIcNfHe6xT8CJ41vLe7dTcW1HCb1Wy
         gNLtYLguj+592Q2bfdZb/KgiC/PNTYgfyLZtGU2nFzAByQWHtzXeKYGSiLdwii/U2Xnj
         k/Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=a4VU4Lpm;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t124sor707149wmb.1.2019.10.09.00.39.09
        (Google Transport Security);
        Wed, 09 Oct 2019 00:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=a4VU4Lpm;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8zCFhaOYo4JvZDuTR8LT8ZeRH1glJIoNVNvHzaX7Cqs=;
        b=a4VU4LpmOcvKddw9FNgq6jUIm9m3OHkTQZoJSIfuAgwIZJL33jZPT9qa5rYVcGPHhK
         nWXJDNiKq4b+jqj//mjMZl2HGYM801289uhhZKspOa1NbU1AAyQAnxpB9h4aqGcHcUvO
         pgd0IZ3JTy0nOmt0QGFVOOMDAY8mM3ncYQlC9UCD9gGQcpQjdJxuzNkrk/QEFbq2YpPJ
         Ju3wqHPVmH20nPHgVpUQ8NPZAgmefgIX1AtB9rRpwUyXifjKzErY+Iu2EZeUrGJ9yhLc
         1zGcOVCM6VbI1EUz26u+YNBZQr6QXDmQja8siopQ6u2ZsmwJz6mLPXzYtX2Te8VoeAyE
         L1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8zCFhaOYo4JvZDuTR8LT8ZeRH1glJIoNVNvHzaX7Cqs=;
        b=LfpFHSoUzAjl08vGsDG1AS041iyCUbC2ffDaPHt2LqRiDslY1QJK/DWrJkuKkHfr8B
         iiyINhIEJwLrwtgxraNm38e9DQDipmybtXTk+QqBoilYxagPkqVDy9r10cDqNLCEKoPH
         nTpLHHSPSvCyKuWvKTxSqemqkdtPZcNQDaPv63NO1f+0WCJuLHo0CrFf34KZuvxBk9g3
         7q2nwxGJ2GPG/2P6q8wFRK6Gy5pO0tRxyJcMATzPpj5+Zxz8TUi0PpTX2dDTsMak55RZ
         oONA+peoxgEMbv4LjiYDjqguTLFJYqHfLXYUFz5KL4jUkBXWnPELeCKrSc9bYrxPyYgb
         6OLQ==
X-Gm-Message-State: APjAAAVtrQQwt2VMCLUaQziQ75vrtFZxKAtKouiWJ9sfE5FzaYKD98H7
	Xs7W1kh6gecd2gCEU1bDgK0=
X-Google-Smtp-Source: APXvYqxCyh6EsXBbQxydeZWUVX3A0jT3NOAhxJHLS7Fsfw/nct2c84Y2/WnTkW5f3/eyCuWkKp8Xvg==
X-Received: by 2002:a1c:5946:: with SMTP id n67mr1540645wmb.93.1570606748866;
        Wed, 09 Oct 2019 00:39:08 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.46])
        by smtp.gmail.com with ESMTPSA id u6sm1264547wrt.92.2019.10.09.00.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2019 00:39:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 11/19] hw/arm/bcm2835_peripherals: Use the SYS_timer
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Zolt=c3=a1n_Baldaszti?= <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-12-f4bug@amsat.org> <87sgo3i7n1.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c4886680-45aa-b039-4baf-b413493f3890@amsat.org>
Date: Wed, 9 Oct 2019 09:39:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <87sgo3i7n1.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: e+WrikzzC88G

On 10/8/19 5:22 PM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Connect the recently added SYS_timer.
>> Now U-Boot does not hang anymore polling a free running counter
>> stuck at 0.
>> This timer is also used by the Linux kernel thermal subsystem.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/arm/bcm2835_peripherals.c         | 21 ++++++++++++++++++++-
>>   include/hw/arm/bcm2835_peripherals.h |  3 ++-
>>   2 files changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
>> index 70bf927a02..965f4c1f3d 100644
>> --- a/hw/arm/bcm2835_peripherals.c
>> +++ b/hw/arm/bcm2835_peripherals.c
>> @@ -58,6 +58,10 @@ static void bcm2835_peripherals_init(Object *obj)
>>       /* Interrupt Controller */
>>       sysbus_init_child_obj(obj, "ic", &s->ic, sizeof(s->ic), TYPE_BCM2835_IC);
>>
>> +    /* SYS Timer */
>> +    sysbus_init_child_obj(obj, "systimer", &s->systmr, sizeof(s->systmr),
>> +                          TYPE_BCM2835_SYSTIMER);
>> +
>>       /* UART0 */
>>       sysbus_init_child_obj(obj, "uart0", &s->uart0, sizeof(s->uart0),
>>                             TYPE_PL011);
>> @@ -171,6 +175,22 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>>                   sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ic), 0));
>>       sysbus_pass_irq(SYS_BUS_DEVICE(s), SYS_BUS_DEVICE(&s->ic));
>>
>> +    /* Sys Timer */
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
> 
> This looks like an extra check because err is checked above and hasn't
> been messed with since.

Oops good catch. Looking at older branch I had this property:

     object_property_set_uint(OBJECT(&s->systmr), 1000000, "freq_hz", &err);

but then when I removed it I forgot to clean the error check. Thanks!

>> +    object_property_set_bool(OBJECT(&s->systmr), true, "realized", &err);
>> +    if (err) {
>> +        error_propagate(errp, err);
>> +        return;
>> +    }
>> +    memory_region_add_subregion(&s->peri_mr, ST_OFFSET,
>> +                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systmr), 0));
>> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systmr), 0,
>> +        qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_ARM_IRQ,
>> +                               INTERRUPT_ARM_TIMER));
>> +
>>       /* UART0 */
>>       qdev_prop_set_chr(DEVICE(&s->uart0), "chardev", serial_hd(0));
>>       object_property_set_bool(OBJECT(&s->uart0), true, "realized", &err);
>> @@ -352,7 +372,6 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
>>       }
>>
>>       create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
>> -    create_unimp(s, &s->systmr, "bcm2835-systimer", ST_OFFSET, 0x20);
>>       create_unimp(s, &s->cprman, "bcm2835-cprman", CPRMAN_OFFSET, 0x1000);
>>       create_unimp(s, &s->a2w, "bcm2835-a2w", A2W_OFFSET, 0x1000);
>>       create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
>> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
>> index be7ad9b499..5b9fc89453 100644
>> --- a/include/hw/arm/bcm2835_peripherals.h
>> +++ b/include/hw/arm/bcm2835_peripherals.h
>> @@ -24,6 +24,7 @@
>>   #include "hw/sd/sdhci.h"
>>   #include "hw/sd/bcm2835_sdhost.h"
>>   #include "hw/gpio/bcm2835_gpio.h"
>> +#include "hw/timer/bcm2835_systmr.h"
>>   #include "hw/misc/unimp.h"
>>
>>   #define TYPE_BCM2835_PERIPHERALS "bcm2835-peripherals"
>> @@ -39,7 +40,7 @@ typedef struct BCM2835PeripheralState {
>>       MemoryRegion ram_alias[4];
>>       qemu_irq irq, fiq;
>>
>> -    UnimplementedDeviceState systmr;
>> +    BCM2835SysTimerState systmr;
>>       UnimplementedDeviceState armtmr;
>>       UnimplementedDeviceState cprman;
>>       UnimplementedDeviceState a2w;
> 
> 
> --
> Alex Bennée
> 

Received: by 10.223.172.38 with SMTP id v35csp3754360wrc;
        Mon, 18 Sep 2017 06:27:34 -0700 (PDT)
X-Received: by 10.200.26.52 with SMTP id v49mr17765090qtj.155.1505741254140;
        Mon, 18 Sep 2017 06:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505741254; cv=none;
        d=google.com; s=arc-20160816;
        b=QvTY3Jl5soyx6LgAytExHfyE1AZSZvWaHNXWS64Pxf+4BxZrbNkJi1yK0WSMkn55NR
         7NoQO6n3J0hRbYFzz59LQVdmApLmn1ESQlixPfaGXO1IRC/22Lrl7Pk6frwCilxIj4UW
         ZHvzBA8sgjOi/PfECwfLd2FigN9Xpz0BsDKqloA5vGfNB1BklZFumzaqeg85Bs4369JJ
         pi2th9HaF0GRdw/TLMNtisFenftlIbdTTVGi2zqguswGH0E5/2OSsaxll/WPQo1m245Q
         8HwHhJV9IueiaQ8SImFAcAucCb657p5CzWaMBvb9Dgy4MWFOOHeiVQ6hhQ25TIOaj/YA
         0uKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=41ySk0/p0kWmyNkN0ndYZomOaSSS0uA2qvPl0sLOsPg=;
        b=CZ7z/kLVT2XcWRLk73pGmKppRo84+1S4/UW7fh6Tz6XvPI39GAKnElS+UHZ/OGY+4D
         4UoSw+83bnlcM7EjaPgRGyaHfcGMEn82NcblvKVIyuRLC1PIT6NT+q8+GlJ9Lb8fFQvy
         NPXZhTbiqHeNBJkcUbdybfpxK4Mt8kYx4hMQYifRpCkTR+NK805rW06xsJddYUizBCmI
         WIaqeoaCjBgmKF8gIksJaLC9MRzY/vgF1Nbz5zTliNVfhYtFrVHRZA8tIZ7D4yd8hr2o
         OHVkmJxhgXJiSqhL/vTmlORXwRwp9IXd8y8PBSdqhYlCFHsSJH/gsWuTe0EXFdVmoc++
         Qd4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lgiau+In;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si7194078qtd.441.2017.09.18.06.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 06:27:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Lgiau+In;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36638 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtw5C-0006Mp-N0
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 09:27:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtw4z-0006J2-GT
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 09:27:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtw4r-00085a-Vp
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 09:27:17 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:53703)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dtw4l-00083Q-LQ; Mon, 18 Sep 2017 09:27:03 -0400
Received: by mail-vk0-x233.google.com with SMTP id m140so239981vka.10;
	Mon, 18 Sep 2017 06:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=41ySk0/p0kWmyNkN0ndYZomOaSSS0uA2qvPl0sLOsPg=;
	b=Lgiau+In9hh5fx69GaW8CXcdkGxqfj3y/tQs11ARjDRMazjLxWT2YG5UUBO+ep5Pz9
	D1N0/kaYpXZKrPKPR+BiyIWAZH0pgojtK8ZAmgVKGxv5KjdyOeq6U0ZeUEAPlOHPI1hg
	clc2NYxegKO6EuBgT06xRSibn+Ht3ZLuKBzNfqYMstMamfUkw5AEucHxt60KAODVDUmK
	kuyc6k8PPC0ok2kLJ5hyKULmcXDpc3PL2BVEg4IimiwFteFk7VMsgR28FGP17l95P1O7
	Umzo8N7qox5LUnpXxK1g4f8muw7efGPmxvGui09hMR175JEQEWBqWReHgZTLSMzwCzL4
	5u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=41ySk0/p0kWmyNkN0ndYZomOaSSS0uA2qvPl0sLOsPg=;
	b=GQwSqkA2dR9vmwxcCoEZCsvkXLjY8aroUqGFtlwHsbQaOzUlBesjyR0KfhX71nIEtS
	Wz9yMuesipACP7UAo4JwMgSySJYEjVVJOR78eZCg3LB8XNaO1Neubm776Hi2JSkHEr9f
	w+pV+gE0ffgkpe2gPYEoXzzhK+GAbFoZHLq66pLD/ukACLpBV9jwZxl4xsCE5RfZ/RwT
	QG1WXHo7EYU1GSlv//lHphVnZtI/3sb4ZWntWamLBF7t4TrafTUOUvaEgT6yFuG7WNpt
	gmPTF3IXmKCdMUVCWIs4jPc5bRII5UefYHb1K6XiY3SFyXS9I1sY7IVRcLnXNtvU046S
	Jqxg==
X-Gm-Message-State: AHPjjUjM3PcAgEP/hQJOs94x/fsAGa1X72Fyv05Q0xuR7p2snr6ntHrD
	kCVYIOD6t7dGhSOeJ2ds+4AOtnE4eh8BCrDaLzE=
X-Google-Smtp-Source: AOwi7QDiMLbpKzEgli2Q4C3n4UEq83Xgvr2fss99AihlokmBE00/nSXf6EJisoItxlKURYx32MX8mRPTqw9IBfkIYBo=
X-Received: by 10.31.195.195 with SMTP id t186mr1050092vkf.198.1505741223040; 
	Mon, 18 Sep 2017 06:27:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Mon, 18 Sep 2017 06:27:02 -0700 (PDT)
In-Reply-To: <CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
	<2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
	<CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 18 Sep 2017 18:57:02 +0530
Message-ID: <CALHRZurNLqH_6Xbh9SKtCA0fuk-CFEZeqBMwYXV=+UaZB4k1Bg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a114e6bc8b91c28055976b2aa"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-arm] [Qemu devel v9 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7xotD0BHbgoF

--001a114e6bc8b91c28055976b2aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Mon, Sep 18, 2017 at 3:47 PM, sundeep subbaraya <sundeep.lkml@gmail.com>
wrote:

> Hi Philippe,
>
> On Mon, Sep 18, 2017 at 6:31 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org>
> wrote:
>
>> Hi Sundeep, Peter,
>>
>>
>> On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
>>
>>> Added Sytem register block of Smartfusion2.
>>> This block has PLL registers which are accessed by guest.
>>>
>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>>   hw/misc/Makefile.objs         |   1 +
>>>   hw/misc/msf2-sysreg.c         | 168 ++++++++++++++++++++++++++++++
>>> ++++++++++++
>>>   hw/misc/trace-events          |   5 ++
>>>   include/hw/misc/msf2-sysreg.h |  77 +++++++++++++++++++
>>>   4 files changed, 251 insertions(+)
>>>   create mode 100644 hw/misc/msf2-sysreg.c
>>>   create mode 100644 include/hw/misc/msf2-sysreg.h
>>>
>>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>>> index 29fb922..e8f0a02 100644
>>> --- a/hw/misc/Makefile.objs
>>> +++ b/hw/misc/Makefile.objs
>>> @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
>>>   obj-$(CONFIG_AUX) +=3D auxbus.o
>>>   obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
>>>   obj-y +=3D mmio_interface.o
>>> +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o
>>> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
>>> new file mode 100644
>>> index 0000000..dc3597b
>>> --- /dev/null
>>> +++ b/hw/misc/msf2-sysreg.c
>>> @@ -0,0 +1,168 @@
>>> +/*
>>> + * System Register block model of Microsemi SmartFusion2.
>>> + *
>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> + *
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * as published by the Free Software Foundation; either version
>>> + * 2 of the License, or (at your option) any later version.
>>> + *
>>> + * You should have received a copy of the GNU General Public License
>>> along
>>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include "qemu/log.h"
>>> +#include "hw/misc/msf2-sysreg.h"
>>> +#include "trace.h"
>>> +
>>> +static inline int msf2_divbits(uint32_t div)
>>> +{
>>> +    int ret =3D 0;
>>> +
>>> +    switch (div) {
>>> +    case 1:
>>> +        ret =3D 0;
>>> +        break;
>>> +    case 2:
>>> +        ret =3D 1;
>>> +        break;
>>> +    case 4:
>>> +        ret =3D 2;
>>> +        break;
>>> +    case 8:
>>> +        ret =3D 4;
>>> +        break;
>>> +    case 16:
>>> +        ret =3D 5;
>>> +        break;
>>> +    case 32:
>>> +        ret =3D 6;
>>> +        break;
>>> +    default:
>>> +        break;
>>>
>>
>> eh?
>>
>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void msf2_sysreg_reset(DeviceState *d)
>>> +{
>>> +    MSF2SysregState *s =3D MSF2_SYSREG(d);
>>> +
>>> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] =3D 0x021A2358;
>>> +    s->regs[MSSDDR_PLL_STATUS] =3D 0x3;
>>> +    s->regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s->apb0div) << 5 |
>>>
>>
>> ctz32(s->apb0div) << 5 ...
>
>
> I will modify like below:
> div0 =3D s->apb0div < 8 ? ctz32(s->apb0div) : ctz32(s->apb0div) + 1;
> div1 =3D s->apb1div < 8 ? ctz32(s->apb1div) : ctz32(s->apb1div) + 1;
> s->regs[MSSDDR_FACC1_CR] =3D div0 << 5 | div1 << 2;
>
>
>>
>> +                               msf2_divbits(s->apb1div) << 2;
>>> +}
>>> +
>>> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>>> +    unsigned size)
>>> +{
>>> +    MSF2SysregState *s =3D opaque;
>>> +    uint32_t ret =3D 0;
>>> +
>>> +    offset >>=3D 2;
>>> +    if (offset < ARRAY_SIZE(s->regs)) {
>>> +        ret =3D s->regs[offset];
>>> +        trace_msf2_sysreg_read(offset << 2, ret);
>>> +    } else {
>>> +        qemu_log_mask(LOG_GUEST_ERROR,
>>> +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
>>> +                    offset << 2);
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>>> +                          uint64_t val, unsigned size)
>>> +{
>>> +    MSF2SysregState *s =3D opaque;
>>> +    uint32_t newval =3D val;
>>> +
>>> +    offset >>=3D 2;
>>> +
>>> +    switch (offset) {
>>> +    case MSSDDR_PLL_STATUS:
>>> +        trace_msf2_sysreg_write_pll_status();
>>> +        break;
>>> +
>>> +    case ESRAM_CR:
>>> +    case DDR_CR:
>>> +    case ENVM_REMAP_BASE_CR:
>>> +        if (newval !=3D s->regs[offset]) {
>>> +            qemu_log_mask(LOG_UNIMP,
>>> +                       TYPE_MSF2_SYSREG": remapping not supported\n");
>>>
>>
>> I'd rather exit here than continue with inconsistent cpu, Peter what do
>> you recommend?
>
>
Could you please suggest.

Thanks,
Sundeep

>
>>
>> +        }
>>> +        break;
>>> +
>>> +    default:
>>> +        if (offset < ARRAY_SIZE(s->regs)) {
>>> +            trace_msf2_sysreg_write(offset << 2, newval,
>>> s->regs[offset]);
>>> +            s->regs[offset] =3D newval;
>>> +        } else {
>>> +            qemu_log_mask(LOG_GUEST_ERROR,
>>> +                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n",
>>> __func__,
>>> +                        offset << 2);
>>> +        }
>>> +        break;
>>> +    }
>>> +}
>>> +
>>> +static const MemoryRegionOps sysreg_ops =3D {
>>> +    .read =3D msf2_sysreg_read,
>>> +    .write =3D msf2_sysreg_write,
>>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>>> +};
>>> +
>>> +static void msf2_sysreg_init(Object *obj)
>>> +{
>>> +    MSF2SysregState *s =3D MSF2_SYSREG(obj);
>>> +
>>> +    memory_region_init_io(&s->iomem, obj, &sysreg_ops, s,
>>> TYPE_MSF2_SYSREG,
>>> +                          MSF2_SYSREG_MMIO_SIZE);
>>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
>>> +}
>>> +
>>> +static const VMStateDescription vmstate_msf2_sysreg =3D {
>>> +    .name =3D TYPE_MSF2_SYSREG,
>>> +    .version_id =3D 1,
>>> +    .minimum_version_id =3D 1,
>>> +    .fields =3D (VMStateField[]) {
>>> +        VMSTATE_UINT32_ARRAY(regs, MSF2SysregState,
>>> MSF2_SYSREG_MMIO_SIZE / 4),
>>> +        VMSTATE_END_OF_LIST()
>>> +    }
>>> +};
>>> +
>>> +static Property msf2_sysreg_properties[] =3D {
>>> +    /* default divisors in Libero GUI */
>>> +    DEFINE_PROP_UINT32("apb0divisor", MSF2SysregState, apb0div, 2),
>>> +    DEFINE_PROP_UINT32("apb1divisor", MSF2SysregState, apb1div, 2),
>>>
>>
>> DEFINE_PROP_UINT8() is enough for both.
>>
>> Beware these divisors must be power of 2, and maximum 32.
>
> This can be checked in msf2_sysreg_realize() ...
>
>
> Ok
>
>>
>>
>> +    DEFINE_PROP_END_OF_LIST(),
>>> +};
>>> +
>>> +static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>>> +
>>> +    dc->vmsd =3D &vmstate_msf2_sysreg;
>>> +    dc->reset =3D msf2_sysreg_reset;
>>>
>>
>> ... which would go here:
>>
>>        dc->realize =3D msf2_sysreg_realize;
>>
>> Ok.
>
>>
>> +    dc->props =3D msf2_sysreg_properties;
>>> +}
>>> +
>>> +static const TypeInfo msf2_sysreg_info =3D {
>>> +    .name  =3D TYPE_MSF2_SYSREG,
>>> +    .parent =3D TYPE_SYS_BUS_DEVICE,
>>> +    .class_init =3D msf2_sysreg_class_init,
>>> +    .instance_size  =3D sizeof(MSF2SysregState),
>>> +    .instance_init =3D msf2_sysreg_init,
>>> +};
>>> +
>>> +static void msf2_sysreg_register_types(void)
>>> +{
>>> +    type_register_static(&msf2_sysreg_info);
>>> +}
>>> +
>>> +type_init(msf2_sysreg_register_types)
>>> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
>>> index 3313585..616579a 100644
>>> --- a/hw/misc/trace-events
>>> +++ b/hw/misc/trace-events
>>> @@ -61,3 +61,8 @@ mps2_scc_reset(void) "MPS2 SCC: reset"
>>>   mps2_scc_leds(char led7, char led6, char led5, char led4, char led3,
>>> char led2, char led1, char led0) "MPS2 SCC LEDs: %c%c%c%c%c%c%c%c"
>>>   mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t value=
)
>>> "MPS2 SCC config write: function %d device %d data 0x%" PRIx32
>>>   mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value)
>>> "MPS2 SCC config read: function %d device %d data 0x%" PRIx32
>>> +
>>> +# hw/misc/msf2-sysreg.c
>>> +msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev)
>>> "msf2-sysreg write: addr 0x%08" HWADDR_PRIx " data 0x%" PRIx32 " prev 0=
x%"
>>> PRIx32
>>> +msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: add=
r
>>> 0x%08" HWADDR_PRIx " data 0x%08" PRIx32
>>> +msf2_sysreg_write_pll_status(void) "Invalid write to read only PLL
>>> status register"
>>> diff --git a/include/hw/misc/msf2-sysreg.h
>>> b/include/hw/misc/msf2-sysreg.h
>>> new file mode 100644
>>> index 0000000..231f827
>>> --- /dev/null
>>> +++ b/include/hw/misc/msf2-sysreg.h
>>> @@ -0,0 +1,77 @@
>>> +/*
>>> + * Microsemi SmartFusion2 SYSREG
>>> + *
>>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person
>>> obtaining a copy
>>> + * of this software and associated documentation files (the
>>> "Software"), to deal
>>> + * in the Software without restriction, including without limitation
>>> the rights
>>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/o=
r
>>> sell
>>> + * copies of the Software, and to permit persons to whom the Software =
is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be
>>> included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>>> EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>>> MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>>> SHALL
>>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R
>>> OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>> ARISING FROM,
>>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>> DEALINGS IN
>>> + * THE SOFTWARE.
>>> + */
>>> +
>>> +#ifndef HW_MSF2_SYSREG_H
>>> +#define HW_MSF2_SYSREG_H
>>> +
>>> +#include "hw/sysbus.h"
>>> +
>>> +enum {
>>> +    ESRAM_CR        =3D 0x00 / 4,
>>> +    ESRAM_MAX_LAT,
>>> +    DDR_CR,
>>> +    ENVM_CR,
>>> +    ENVM_REMAP_BASE_CR,
>>> +    ENVM_REMAP_FAB_CR,
>>> +    CC_CR,
>>> +    CC_REGION_CR,
>>> +    CC_LOCK_BASE_ADDR_CR,
>>> +    CC_FLUSH_INDX_CR,
>>> +    DDRB_BUF_TIMER_CR,
>>> +    DDRB_NB_ADDR_CR,
>>> +    DDRB_NB_SIZE_CR,
>>> +    DDRB_CR,
>>> +
>>> +    SOFT_RESET_CR  =3D 0x48 / 4,
>>> +    M3_CR,
>>> +
>>> +    GPIO_SYSRESET_SEL_CR =3D 0x58 / 4,
>>> +
>>> +    MDDR_CR =3D 0x60 / 4,
>>> +
>>> +    MSSDDR_PLL_STATUS_LOW_CR =3D 0x90 / 4,
>>> +    MSSDDR_PLL_STATUS_HIGH_CR,
>>> +    MSSDDR_FACC1_CR,
>>> +    MSSDDR_FACC2_CR,
>>> +
>>> +    MSSDDR_PLL_STATUS =3D 0x150 / 4,
>>> +};
>>> +
>>> +#define MSF2_SYSREG_MMIO_SIZE     0x300
>>> +
>>> +#define TYPE_MSF2_SYSREG          "msf2-sysreg"
>>> +#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj),
>>> TYPE_MSF2_SYSREG)
>>> +
>>> +typedef struct MSF2SysregState {
>>> +    SysBusDevice parent_obj;
>>> +
>>> +    MemoryRegion iomem;
>>> +
>>> +    uint32_t apb0div;
>>> +    uint32_t apb1div;
>>>
>>
>> uint8_t for both
>
>
> Ok.
>
>>
>>
>> +
>>> +    uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];
>>> +} MSF2SysregState;
>>> +
>>> +#endif /* HW_MSF2_SYSREG_H */
>>>
>>>
>> Acked-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>
> Thank you,
> Sundeep
>

--001a114e6bc8b91c28055976b2aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Mon, Sep 18, 2017 at 3:47 PM, sundeep subbaraya <span dir=3D"lt=
r">&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blank">sundeep.=
lkml@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote"><div><div class=3D"h5">On Mon, Sep 18, 2017 at 6:31 AM, Philippe Ma=
thieu-Daud=C3=A9 <span dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" t=
arget=3D"_blank">f4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Sundeep, Peter,<div><div class=3D"m_-31=
32541284269682418gmail-h5"><br>
<br>
On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
Added Sytem register block of Smartfusion2.<br>
This block has PLL registers which are accessed by guest.<br>
<br>
Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gmail.c=
om" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xilinx=
.com" target=3D"_blank">alistair.francis@xilinx.com</a>&gt;<br>
---<br>
=C2=A0 hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0 hw/misc/msf2-sysreg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 168 +++++++=
+++++++++++++++++++++++<wbr>++++++++++++<br>
=C2=A0 hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A05 ++<br>
=C2=A0 include/hw/misc/msf2-sysreg.h |=C2=A0 77 +++++++++++++++++++<br>
=C2=A0 4 files changed, 251 insertions(+)<br>
=C2=A0 create mode 100644 hw/misc/msf2-sysreg.c<br>
=C2=A0 create mode 100644 include/hw/misc/msf2-sysreg.h<br>
<br>
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs<br>
index 29fb922..e8f0a02 100644<br>
--- a/hw/misc/Makefile.objs<br>
+++ b/hw/misc/Makefile.objs<br>
@@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o<br>
=C2=A0 obj-$(CONFIG_AUX) +=3D auxbus.o<br>
=C2=A0 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o<br>
=C2=A0 obj-y +=3D mmio_interface.o<br>
+obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o<br>
diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c<br>
new file mode 100644<br>
index 0000000..dc3597b<br>
--- /dev/null<br>
+++ b/hw/misc/msf2-sysreg.c<br>
@@ -0,0 +1,168 @@<br>
+/*<br>
+ * System Register block model of Microsemi SmartFusion2.<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or<br>
+ * modify it under the terms of the GNU General Public License<br>
+ * as published by the Free Software Foundation; either version<br>
+ * 2 of the License, or (at your option) any later version.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License along=
<br>
+ * with this program; if not, see &lt;<a href=3D"http://www.gnu.org/licens=
es/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses/</a>&=
gt;<wbr>.<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/log.h&quot;<br>
+#include &quot;hw/misc/msf2-sysreg.h&quot;<br>
+#include &quot;trace.h&quot;<br>
+<br>
+static inline int msf2_divbits(uint32_t div)<br>
+{<br>
+=C2=A0 =C2=A0 int ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 switch (div) {<br>
+=C2=A0 =C2=A0 case 1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 4:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 8:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 4;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 16:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 5;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case 32:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 6;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
</blockquote>
<br></div></div>
eh?<span class=3D"m_-3132541284269682418gmail-"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void msf2_sysreg_reset(DeviceState *d)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D MSF2_SYSREG(d);<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS_LOW_<wbr>CR] =3D 0x021A2358;<br=
>
+=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_PLL_STATUS] =3D 0x3;<br>
+=C2=A0 =C2=A0 s-&gt;regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s-&gt;apb0div) =
&lt;&lt; 5 |<br>
</blockquote>
<br></span>
ctz32(s-&gt;apb0div) &lt;&lt; 5 ...</blockquote><div><br></div></div></div>=
<div>I will modify like below:</div><div>div0 =3D s-&gt;apb0div &lt; 8 ? ct=
z32(s-&gt;apb0div) : ctz32(s-&gt;apb0div) + 1;</div><div>div1 =3D s-&gt;apb=
1div &lt; 8 ? ctz32(s-&gt;apb1div) : ctz32(s-&gt;apb1div) + 1;<br></div><di=
v>s-&gt;regs[MSSDDR_FACC1_CR] =3D div0 &lt;&lt; 5 | div1 &lt;&lt; 2;<br></d=
iv><div><div class=3D"h5"><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div><div class=3D"m_-3132541284269682418gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msf2_divbits(s-&gt;apb1div) &lt;&lt; =
2;<br>
+}<br>
+<br>
+static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t ret =3D 0;<br>
+<br>
+=C2=A0 =C2=A0 offset &gt;&gt;=3D 2;<br>
+=C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D s-&gt;regs[offset];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_msf2_sysreg_read(offset &lt;&lt; 2, ret)=
;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;%s: Bad offset 0x%08&quot; HWADDR_PRIx &quot;\n&quot;, __func__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offs=
et &lt;&lt; 2);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static void msf2_sysreg_write(void *opaque, hwaddr offset,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 uint64_t val, unsigned size)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D opaque;<br>
+=C2=A0 =C2=A0 uint32_t newval =3D val;<br>
+<br>
+=C2=A0 =C2=A0 offset &gt;&gt;=3D 2;<br>
+<br>
+=C2=A0 =C2=A0 switch (offset) {<br>
+=C2=A0 =C2=A0 case MSSDDR_PLL_STATUS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_msf2_sysreg_write_pll_st<wbr>atus();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 case ESRAM_CR:<br>
+=C2=A0 =C2=A0 case DDR_CR:<br>
+=C2=A0 =C2=A0 case ENVM_REMAP_BASE_CR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (newval !=3D s-&gt;regs[offset]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0TYPE_MSF2_SYSREG&quot;: remapping not supported\n&quot;);<br>
</blockquote>
<br></div></div>
I&#39;d rather exit here than continue with inconsistent cpu, Peter what do=
 you recommend?</blockquote></div></div></div></div></div></blockquote><div=
><br></div><div>Could you please suggest.</div><div><br></div><div>Thanks,<=
/div><div>Sundeep=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr=
"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div><div class=3D"=
h5"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"m_=
-3132541284269682418gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (offset &lt; ARRAY_SIZE(s-&gt;regs)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_msf2_sysreg_write(offset &=
lt;&lt; 2, newval, s-&gt;regs[offset]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;regs[offset] =3D newval;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_GUEST_ERROR,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;%s: Bad offset 0x%08&quot; HWADDR_PRIx &quot;\n&quot;, __f=
unc__,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 offset &lt;&lt; 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static const MemoryRegionOps sysreg_ops =3D {<br>
+=C2=A0 =C2=A0 .read =3D msf2_sysreg_read,<br>
+=C2=A0 =C2=A0 .write =3D msf2_sysreg_write,<br>
+=C2=A0 =C2=A0 .endianness =3D DEVICE_NATIVE_ENDIAN,<br>
+};<br>
+<br>
+static void msf2_sysreg_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 MSF2SysregState *s =3D MSF2_SYSREG(obj);<br>
+<br>
+=C2=A0 =C2=A0 memory_region_init_io(&amp;s-&gt;iome<wbr>m, obj, &amp;sysre=
g_ops, s, TYPE_MSF2_SYSREG,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 MSF2_SYSREG_MMIO_SIZE);<br>
+=C2=A0 =C2=A0 sysbus_init_mmio(SYS_BUS_DEVIC<wbr>E(obj), &amp;s-&gt;iomem)=
;<br>
+}<br>
+<br>
+static const VMStateDescription vmstate_msf2_sysreg =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_MSF2_SYSREG,<br>
+=C2=A0 =C2=A0 .version_id =3D 1,<br>
+=C2=A0 =C2=A0 .minimum_version_id =3D 1,<br>
+=C2=A0 =C2=A0 .fields =3D (VMStateField[]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_UINT32_ARRAY(regs, MSF2SysregState, MS=
F2_SYSREG_MMIO_SIZE / 4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 VMSTATE_END_OF_LIST()<br>
+=C2=A0 =C2=A0 }<br>
+};<br>
+<br>
+static Property msf2_sysreg_properties[] =3D {<br>
+=C2=A0 =C2=A0 /* default divisors in Libero GUI */<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;apb0diviso<wbr>r&quot;, MSF2SysregS=
tate, apb0div, 2),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_UINT32(&quot;apb1diviso<wbr>r&quot;, MSF2SysregS=
tate, apb1div, 2),<br>
</blockquote>
<br></div></div>
DEFINE_PROP_UINT8() is enough for both.<br>
<br>
Beware these divisors must be power of 2, and maximum 32.</blockquote><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
This can be checked in msf2_sysreg_realize() ...</blockquote><div><br></div=
></div></div><div>Ok=C2=A0<br></div><span class=3D""><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><span class=3D"m_-3132541284269682418gmail-"><b=
r>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void msf2_sysreg_class_init(ObjectC<wbr>lass *klass, void *data)<br=
>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_msf2_sysreg;<br>
+=C2=A0 =C2=A0 dc-&gt;reset =3D msf2_sysreg_reset;<br>
</blockquote>
<br></span>
... which would go here:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0dc-&gt;realize =3D msf2_sysreg_realize;<div><div=
 class=3D"m_-3132541284269682418gmail-h5"><br></div></div></blockquote></sp=
an><div>Ok.</div><div><div class=3D"h5"><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div><div class=3D"m_-3132541284269682418gmail-h5">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 dc-&gt;props =3D msf2_sysreg_properties;<br>
+}<br>
+<br>
+static const TypeInfo msf2_sysreg_info =3D {<br>
+=C2=A0 =C2=A0 .name=C2=A0 =3D TYPE_MSF2_SYSREG,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_SYS_BUS_DEVICE,<br>
+=C2=A0 =C2=A0 .class_init =3D msf2_sysreg_class_init,<br>
+=C2=A0 =C2=A0 .instance_size=C2=A0 =3D sizeof(MSF2SysregState),<br>
+=C2=A0 =C2=A0 .instance_init =3D msf2_sysreg_init,<br>
+};<br>
+<br>
+static void msf2_sysreg_register_types(voi<wbr>d)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;msf2_sys<wbr>reg_info);<br>
+}<br>
+<br>
+type_init(msf2_sysreg_registe<wbr>r_types)<br>
diff --git a/hw/misc/trace-events b/hw/misc/trace-events<br>
index 3313585..616579a 100644<br>
--- a/hw/misc/trace-events<br>
+++ b/hw/misc/trace-events<br>
@@ -61,3 +61,8 @@ mps2_scc_reset(void) &quot;MPS2 SCC: reset&quot;<br>
=C2=A0 mps2_scc_leds(char led7, char led6, char led5, char led4, char led3,=
 char led2, char led1, char led0) &quot;MPS2 SCC LEDs: %c%c%c%c%c%c%c%c&quo=
t;<br>
=C2=A0 mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t valu=
e) &quot;MPS2 SCC config write: function %d device %d data 0x%&quot; PRIx32=
<br>
=C2=A0 mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value=
) &quot;MPS2 SCC config read: function %d device %d data 0x%&quot; PRIx32<b=
r>
+<br>
+# hw/misc/msf2-sysreg.c<br>
+msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev) &quot;msf2=
-sysreg write: addr 0x%08&quot; HWADDR_PRIx &quot; data 0x%&quot; PRIx32 &q=
uot; prev 0x%&quot; PRIx32<br>
+msf2_sysreg_read(uint64_t offset, uint32_t val) &quot;msf2-sysreg read: ad=
dr 0x%08&quot; HWADDR_PRIx &quot; data 0x%08&quot; PRIx32<br>
+msf2_sysreg_write_pll_status(<wbr>void) &quot;Invalid write to read only P=
LL status register&quot;<br>
diff --git a/include/hw/misc/msf2-sysreg.<wbr>h b/include/hw/misc/msf2-sysr=
eg.<wbr>h<br>
new file mode 100644<br>
index 0000000..231f827<br>
--- /dev/null<br>
+++ b/include/hw/misc/msf2-sysreg.<wbr>h<br>
@@ -0,0 +1,77 @@<br>
+/*<br>
+ * Microsemi SmartFusion2 SYSREG<br>
+ *<br>
+ * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml=
@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;<br>
+ *<br>
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy<br>
+ * of this software and associated documentation files (the &quot;Software=
&quot;), to deal<br>
+ * in the Software without restriction, including without limitation the r=
ights<br>
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll<br>
+ * copies of the Software, and to permit persons to whom the Software is<b=
r>
+ * furnished to do so, subject to the following conditions:<br>
+ *<br>
+ * The above copyright notice and this permission notice shall be included=
 in<br>
+ * all copies or substantial portions of the Software.<br>
+ *<br>
+ * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY KIN=
D, EXPRESS OR<br>
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY=
,<br>
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL=
<br>
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER<br>
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,<br>
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN<br>
+ * THE SOFTWARE.<br>
+ */<br>
+<br>
+#ifndef HW_MSF2_SYSREG_H<br>
+#define HW_MSF2_SYSREG_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+<br>
+enum {<br>
+=C2=A0 =C2=A0 ESRAM_CR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D 0x00 / 4,<br>
+=C2=A0 =C2=A0 ESRAM_MAX_LAT,<br>
+=C2=A0 =C2=A0 DDR_CR,<br>
+=C2=A0 =C2=A0 ENVM_CR,<br>
+=C2=A0 =C2=A0 ENVM_REMAP_BASE_CR,<br>
+=C2=A0 =C2=A0 ENVM_REMAP_FAB_CR,<br>
+=C2=A0 =C2=A0 CC_CR,<br>
+=C2=A0 =C2=A0 CC_REGION_CR,<br>
+=C2=A0 =C2=A0 CC_LOCK_BASE_ADDR_CR,<br>
+=C2=A0 =C2=A0 CC_FLUSH_INDX_CR,<br>
+=C2=A0 =C2=A0 DDRB_BUF_TIMER_CR,<br>
+=C2=A0 =C2=A0 DDRB_NB_ADDR_CR,<br>
+=C2=A0 =C2=A0 DDRB_NB_SIZE_CR,<br>
+=C2=A0 =C2=A0 DDRB_CR,<br>
+<br>
+=C2=A0 =C2=A0 SOFT_RESET_CR=C2=A0 =3D 0x48 / 4,<br>
+=C2=A0 =C2=A0 M3_CR,<br>
+<br>
+=C2=A0 =C2=A0 GPIO_SYSRESET_SEL_CR =3D 0x58 / 4,<br>
+<br>
+=C2=A0 =C2=A0 MDDR_CR =3D 0x60 / 4,<br>
+<br>
+=C2=A0 =C2=A0 MSSDDR_PLL_STATUS_LOW_CR =3D 0x90 / 4,<br>
+=C2=A0 =C2=A0 MSSDDR_PLL_STATUS_HIGH_CR,<br>
+=C2=A0 =C2=A0 MSSDDR_FACC1_CR,<br>
+=C2=A0 =C2=A0 MSSDDR_FACC2_CR,<br>
+<br>
+=C2=A0 =C2=A0 MSSDDR_PLL_STATUS =3D 0x150 / 4,<br>
+};<br>
+<br>
+#define MSF2_SYSREG_MMIO_SIZE=C2=A0 =C2=A0 =C2=A00x300<br>
+<br>
+#define TYPE_MSF2_SYSREG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;msf2-sysr=
eg&quot;<br>
+#define MSF2_SYSREG(obj)=C2=A0 OBJECT_CHECK(MSF2SysregState, (obj), TYPE_M=
SF2_SYSREG)<br>
+<br>
+typedef struct MSF2SysregState {<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+<br>
+=C2=A0 =C2=A0 uint32_t apb0div;<br>
+=C2=A0 =C2=A0 uint32_t apb1div;<br>
</blockquote>
<br></div></div>
uint8_t for both</blockquote><div><br></div></div></div><div>Ok.=C2=A0</div=
><span class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span c=
lass=3D"m_-3132541284269682418gmail-"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];<br>
+} MSF2SysregState;<br>
+<br>
+#endif /* HW_MSF2_SYSREG_H */<br>
<br>
</blockquote>
<br></span>
Acked-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org=
" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.or=
g" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
</blockquote></span></div><br></div><div class=3D"gmail_extra">Thank you,</=
div><div class=3D"gmail_extra">Sundeep</div></div>
</blockquote></div><br></div></div>

--001a114e6bc8b91c28055976b2aa--

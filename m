Received: by 10.223.172.38 with SMTP id v35csp3592095wrc;
        Mon, 18 Sep 2017 03:22:16 -0700 (PDT)
X-Received: by 10.55.48.8 with SMTP id w8mr19750174qkw.139.1505730136723;
        Mon, 18 Sep 2017 03:22:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505730136; cv=none;
        d=google.com; s=arc-20160816;
        b=dwDUSXsMa5IPgLIfOGottBlReNzGOjkPbz899s/SJgrUJ+Y0IBQGrpSMNPpcP0Vlgx
         Hr9lI9RlxolgowKvAQuMDHwn7LhqlFcsuU5HmmKRRh67jpVjEckYZ8xKpzizn2kF7l/5
         c+qbIHM1U4xoT3DfNgdI1WrrNXNFNpApTOV+vOMJaiGQUpupZzBpF5WHj6gKbUvFKnm0
         ZlDaRj8hmGX91AigvNDOV7lNx0w785kQ/NUd5tZWuSl4nK+HPA+V/jcM3/g6zyURf001
         PGZRB8SD0zIM41GtyVOtQV/7uVOB30Y6q7c85z2UiMWP9FrpfSI6nR4kIb0xyrM6By2T
         Tvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=5Gzh2xHg4unIQLVBjxaEJElsvGyGpFCFWJeFbkxrUbI=;
        b=vlWcAi36rD64yNgaOCZiFT3jbrGQvxOAmHIomAP4TeVtvwAdBVW/H6C+nrcjBPzHAF
         63XuOd3MalviGaVo84LpPCirpU6ZaHMkkbSztW9PfCtpnE3EesNvFcODsrJ0cV1Ll73y
         9Sr4UH+s43rlM0/jnsNFwe33o2wf4PK+oAHhtq2UFKLVOFva3yEoKdqzsPV9XC1qzqUB
         yRPaoAvOn4NcuoGdIl4pbnN+awtf5kpIciLBj58FyJa8OPhL8bD0EOTPgRSiWd3HAtDc
         0VULMkGXsJ29Jct5/I//jNiI3cS2hXBaWDsyNSYka2kxOx55ic6txIqwrz9nLBl0cDY/
         YT7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=qoSHx3rH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u42si6827109qtu.66.2017.09.18.03.22.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 03:22:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gmail.com header.s=20161025 header.b=qoSHx3rH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:35607 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dttBu-0000r1-93
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 06:22:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtt7l-00068b-8Y
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 06:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtt7i-0004NT-6H
	for qemu-devel@nongnu.org; Mon, 18 Sep 2017 06:17:57 -0400
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:50699)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dtt7h-0004ND-Ts; Mon, 18 Sep 2017 06:17:54 -0400
Received: by mail-ua0-x233.google.com with SMTP id g34so17076uah.7;
	Mon, 18 Sep 2017 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8EfOjb+yEtGyj5H4/WJa7ga0yrtCPlk8L1akeAOahdo=;
	b=qoSHx3rH3IgqrEMEC1APxgr9h5wOtvQHuxaAU6o4zEYyDT9cxJAK0x/2BjLCwWthRl
	F80vPQeJR52FKpK1w1EMQfZaUXBO3xgKn3QCV0ZJH+Y7bHXGMnIrHkLcnvmreXFwJNd6
	+AWrAQu7qxz0IClrNb41vZOuk8W9y59CtQwwOPqB9uMKcWHRIMKVEpWC8QE5f4BDFhuO
	0xtyVk6a1ZvG+Osrgc/SmCiEv6AQhk0m5mmAyp+d4++yFzxqPUP+LoW/az+upLbCjJOO
	V0WRivJbNBkHVpk8lcmNhe6tN+OWPtZCEbPsGnX4o6w2MhUH1lFemWgFF8oxiwrwxvri
	xykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8EfOjb+yEtGyj5H4/WJa7ga0yrtCPlk8L1akeAOahdo=;
	b=TykW6/mfyiQCnZDvjkdo9sCuwRg10y0APafLzQjzjC072WbDRUdT3tgxXfbYkfKSRn
	Grx0mbqoaotffBd/1ANmsgVskN5azqCphsjRtvuQ6jwWjrp5hxgeMCTdr+bN4aKdaqyb
	gyN5PbiArrf4dzAoHR8c8O8huLQ1wE6SG2Mxx6nf3o0cIzwijJ5OnafL67fekqEPUXg7
	QccpJHjYfS4Bi66bybUyJ5ISFa1V44JSHhaIhUiRMmxKrHlnm46etTt2dJTZa8rw9r/6
	ARcQZNmtZhXuzO1O8OZ1W8whYgG2s6vS8Q4KW6lM5YuizYZ++r6qCep/zCpsSChchmZ0
	VQ2Q==
X-Gm-Message-State: AHPjjUiGR1wmSos2/+QfV9asJ8xKS+QBlf3pIr8cvkp9Xom79POPUbL9
	4BlN9gFyWIdmVSHD+/GJbDd54f4/4WTLhRhK7DQ=
X-Google-Smtp-Source: AOwi7QC2zkPnDeF2oX2ct17VrSGdjVh0zRP/dtwp5yS2sisOiyUx+Fb5O9+wXlCu5e+6RHQPh51bZPnysVx/mHlm6Co=
X-Received: by 10.176.76.214 with SMTP id e22mr29293528uag.16.1505729873340;
	Mon, 18 Sep 2017 03:17:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Mon, 18 Sep 2017 03:17:52 -0700 (PDT)
In-Reply-To: <2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
References: <1505494753-10837-1-git-send-email-sundeep.lkml@gmail.com>
	<1505494753-10837-3-git-send-email-sundeep.lkml@gmail.com>
	<2c6a4136-fb80-2000-940c-1df5e718cbf1@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 18 Sep 2017 15:47:52 +0530
Message-ID: <CALHRZurRLysJCRwvm+SbJUn8YBAst_Q38RCzJkmT4z=mfnYuiQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::233
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu devel v9 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5aae675YwRW4

Hi Philippe,

On Mon, Sep 18, 2017 at 6:31 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Sundeep, Peter,
>
>
> On 09/15/2017 01:59 PM, Subbaraya Sundeep wrote:
>
>> Added Sytem register block of Smartfusion2.
>> This block has PLL registers which are accessed by guest.
>>
>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>   hw/misc/Makefile.objs         |   1 +
>>   hw/misc/msf2-sysreg.c         | 168 ++++++++++++++++++++++++++++++
>> ++++++++++++
>>   hw/misc/trace-events          |   5 ++
>>   include/hw/misc/msf2-sysreg.h |  77 +++++++++++++++++++
>>   4 files changed, 251 insertions(+)
>>   create mode 100644 hw/misc/msf2-sysreg.c
>>   create mode 100644 include/hw/misc/msf2-sysreg.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index 29fb922..e8f0a02 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -59,3 +59,4 @@ obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
>>   obj-$(CONFIG_AUX) +=3D auxbus.o
>>   obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
>>   obj-y +=3D mmio_interface.o
>> +obj-$(CONFIG_MSF2) +=3D msf2-sysreg.o
>> diff --git a/hw/misc/msf2-sysreg.c b/hw/misc/msf2-sysreg.c
>> new file mode 100644
>> index 0000000..dc3597b
>> --- /dev/null
>> +++ b/hw/misc/msf2-sysreg.c
>> @@ -0,0 +1,168 @@
>> +/*
>> + * System Register block model of Microsemi SmartFusion2.
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> along
>> + * with this program; if not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "hw/misc/msf2-sysreg.h"
>> +#include "trace.h"
>> +
>> +static inline int msf2_divbits(uint32_t div)
>> +{
>> +    int ret =3D 0;
>> +
>> +    switch (div) {
>> +    case 1:
>> +        ret =3D 0;
>> +        break;
>> +    case 2:
>> +        ret =3D 1;
>> +        break;
>> +    case 4:
>> +        ret =3D 2;
>> +        break;
>> +    case 8:
>> +        ret =3D 4;
>> +        break;
>> +    case 16:
>> +        ret =3D 5;
>> +        break;
>> +    case 32:
>> +        ret =3D 6;
>> +        break;
>> +    default:
>> +        break;
>>
>
> eh?
>
> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void msf2_sysreg_reset(DeviceState *d)
>> +{
>> +    MSF2SysregState *s =3D MSF2_SYSREG(d);
>> +
>> +    s->regs[MSSDDR_PLL_STATUS_LOW_CR] =3D 0x021A2358;
>> +    s->regs[MSSDDR_PLL_STATUS] =3D 0x3;
>> +    s->regs[MSSDDR_FACC1_CR] =3D msf2_divbits(s->apb0div) << 5 |
>>
>
> ctz32(s->apb0div) << 5 ...


I will modify like below:
div0 =3D s->apb0div < 8 ? ctz32(s->apb0div) : ctz32(s->apb0div) + 1;
div1 =3D s->apb1div < 8 ? ctz32(s->apb1div) : ctz32(s->apb1div) + 1;
s->regs[MSSDDR_FACC1_CR] =3D div0 << 5 | div1 << 2;


>
> +                               msf2_divbits(s->apb1div) << 2;
>> +}
>> +
>> +static uint64_t msf2_sysreg_read(void *opaque, hwaddr offset,
>> +    unsigned size)
>> +{
>> +    MSF2SysregState *s =3D opaque;
>> +    uint32_t ret =3D 0;
>> +
>> +    offset >>=3D 2;
>> +    if (offset < ARRAY_SIZE(s->regs)) {
>> +        ret =3D s->regs[offset];
>> +        trace_msf2_sysreg_read(offset << 2, ret);
>> +    } else {
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                    "%s: Bad offset 0x%08" HWADDR_PRIx "\n", __func__,
>> +                    offset << 2);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void msf2_sysreg_write(void *opaque, hwaddr offset,
>> +                          uint64_t val, unsigned size)
>> +{
>> +    MSF2SysregState *s =3D opaque;
>> +    uint32_t newval =3D val;
>> +
>> +    offset >>=3D 2;
>> +
>> +    switch (offset) {
>> +    case MSSDDR_PLL_STATUS:
>> +        trace_msf2_sysreg_write_pll_status();
>> +        break;
>> +
>> +    case ESRAM_CR:
>> +    case DDR_CR:
>> +    case ENVM_REMAP_BASE_CR:
>> +        if (newval !=3D s->regs[offset]) {
>> +            qemu_log_mask(LOG_UNIMP,
>> +                       TYPE_MSF2_SYSREG": remapping not supported\n");
>>
>
> I'd rather exit here than continue with inconsistent cpu, Peter what do
> you recommend?
>
>
> +        }
>> +        break;
>> +
>> +    default:
>> +        if (offset < ARRAY_SIZE(s->regs)) {
>> +            trace_msf2_sysreg_write(offset << 2, newval,
>> s->regs[offset]);
>> +            s->regs[offset] =3D newval;
>> +        } else {
>> +            qemu_log_mask(LOG_GUEST_ERROR,
>> +                        "%s: Bad offset 0x%08" HWADDR_PRIx "\n",
>> __func__,
>> +                        offset << 2);
>> +        }
>> +        break;
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps sysreg_ops =3D {
>> +    .read =3D msf2_sysreg_read,
>> +    .write =3D msf2_sysreg_write,
>> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +static void msf2_sysreg_init(Object *obj)
>> +{
>> +    MSF2SysregState *s =3D MSF2_SYSREG(obj);
>> +
>> +    memory_region_init_io(&s->iomem, obj, &sysreg_ops, s,
>> TYPE_MSF2_SYSREG,
>> +                          MSF2_SYSREG_MMIO_SIZE);
>> +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->iomem);
>> +}
>> +
>> +static const VMStateDescription vmstate_msf2_sysreg =3D {
>> +    .name =3D TYPE_MSF2_SYSREG,
>> +    .version_id =3D 1,
>> +    .minimum_version_id =3D 1,
>> +    .fields =3D (VMStateField[]) {
>> +        VMSTATE_UINT32_ARRAY(regs, MSF2SysregState,
>> MSF2_SYSREG_MMIO_SIZE / 4),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static Property msf2_sysreg_properties[] =3D {
>> +    /* default divisors in Libero GUI */
>> +    DEFINE_PROP_UINT32("apb0divisor", MSF2SysregState, apb0div, 2),
>> +    DEFINE_PROP_UINT32("apb1divisor", MSF2SysregState, apb1div, 2),
>>
>
> DEFINE_PROP_UINT8() is enough for both.
>
> Beware these divisors must be power of 2, and maximum 32.

This can be checked in msf2_sysreg_realize() ...


Ok

>
>
> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void msf2_sysreg_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
>> +
>> +    dc->vmsd =3D &vmstate_msf2_sysreg;
>> +    dc->reset =3D msf2_sysreg_reset;
>>
>
> ... which would go here:
>
>        dc->realize =3D msf2_sysreg_realize;
>
> Ok.

>
> +    dc->props =3D msf2_sysreg_properties;
>> +}
>> +
>> +static const TypeInfo msf2_sysreg_info =3D {
>> +    .name  =3D TYPE_MSF2_SYSREG,
>> +    .parent =3D TYPE_SYS_BUS_DEVICE,
>> +    .class_init =3D msf2_sysreg_class_init,
>> +    .instance_size  =3D sizeof(MSF2SysregState),
>> +    .instance_init =3D msf2_sysreg_init,
>> +};
>> +
>> +static void msf2_sysreg_register_types(void)
>> +{
>> +    type_register_static(&msf2_sysreg_info);
>> +}
>> +
>> +type_init(msf2_sysreg_register_types)
>> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
>> index 3313585..616579a 100644
>> --- a/hw/misc/trace-events
>> +++ b/hw/misc/trace-events
>> @@ -61,3 +61,8 @@ mps2_scc_reset(void) "MPS2 SCC: reset"
>>   mps2_scc_leds(char led7, char led6, char led5, char led4, char led3,
>> char led2, char led1, char led0) "MPS2 SCC LEDs: %c%c%c%c%c%c%c%c"
>>   mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t value)
>> "MPS2 SCC config write: function %d device %d data 0x%" PRIx32
>>   mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value)
>> "MPS2 SCC config read: function %d device %d data 0x%" PRIx32
>> +
>> +# hw/misc/msf2-sysreg.c
>> +msf2_sysreg_write(uint64_t offset, uint32_t val, uint32_t prev)
>> "msf2-sysreg write: addr 0x%08" HWADDR_PRIx " data 0x%" PRIx32 " prev 0x=
%"
>> PRIx32
>> +msf2_sysreg_read(uint64_t offset, uint32_t val) "msf2-sysreg read: addr
>> 0x%08" HWADDR_PRIx " data 0x%08" PRIx32
>> +msf2_sysreg_write_pll_status(void) "Invalid write to read only PLL
>> status register"
>> diff --git a/include/hw/misc/msf2-sysreg.h b/include/hw/misc/msf2-sysreg=
.
>> h
>> new file mode 100644
>> index 0000000..231f827
>> --- /dev/null
>> +++ b/include/hw/misc/msf2-sysreg.h
>> @@ -0,0 +1,77 @@
>> +/*
>> + * Microsemi SmartFusion2 SYSREG
>> + *
>> + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtainin=
g
>> a copy
>> + * of this software and associated documentation files (the "Software")=
,
>> to deal
>> + * in the Software without restriction, including without limitation th=
e
>> rights
>> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> sell
>> + * copies of the Software, and to permit persons to whom the Software i=
s
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be
>> included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> ARISING FROM,
>> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> DEALINGS IN
>> + * THE SOFTWARE.
>> + */
>> +
>> +#ifndef HW_MSF2_SYSREG_H
>> +#define HW_MSF2_SYSREG_H
>> +
>> +#include "hw/sysbus.h"
>> +
>> +enum {
>> +    ESRAM_CR        =3D 0x00 / 4,
>> +    ESRAM_MAX_LAT,
>> +    DDR_CR,
>> +    ENVM_CR,
>> +    ENVM_REMAP_BASE_CR,
>> +    ENVM_REMAP_FAB_CR,
>> +    CC_CR,
>> +    CC_REGION_CR,
>> +    CC_LOCK_BASE_ADDR_CR,
>> +    CC_FLUSH_INDX_CR,
>> +    DDRB_BUF_TIMER_CR,
>> +    DDRB_NB_ADDR_CR,
>> +    DDRB_NB_SIZE_CR,
>> +    DDRB_CR,
>> +
>> +    SOFT_RESET_CR  =3D 0x48 / 4,
>> +    M3_CR,
>> +
>> +    GPIO_SYSRESET_SEL_CR =3D 0x58 / 4,
>> +
>> +    MDDR_CR =3D 0x60 / 4,
>> +
>> +    MSSDDR_PLL_STATUS_LOW_CR =3D 0x90 / 4,
>> +    MSSDDR_PLL_STATUS_HIGH_CR,
>> +    MSSDDR_FACC1_CR,
>> +    MSSDDR_FACC2_CR,
>> +
>> +    MSSDDR_PLL_STATUS =3D 0x150 / 4,
>> +};
>> +
>> +#define MSF2_SYSREG_MMIO_SIZE     0x300
>> +
>> +#define TYPE_MSF2_SYSREG          "msf2-sysreg"
>> +#define MSF2_SYSREG(obj)  OBJECT_CHECK(MSF2SysregState, (obj),
>> TYPE_MSF2_SYSREG)
>> +
>> +typedef struct MSF2SysregState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion iomem;
>> +
>> +    uint32_t apb0div;
>> +    uint32_t apb1div;
>>
>
> uint8_t for both


Ok.

>
>
> +
>> +    uint32_t regs[MSF2_SYSREG_MMIO_SIZE / 4];
>> +} MSF2SysregState;
>> +
>> +#endif /* HW_MSF2_SYSREG_H */
>>
>>
> Acked-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Thank you,
Sundeep

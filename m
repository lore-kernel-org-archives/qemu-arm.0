Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1743151lff;
        Sun, 19 Jan 2020 10:47:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqwAzzRfEqpJ7PLpbQ8Pbfs5IKy72jLj8Eh8KnRwYj5Q/SqJhjuszMlMarADjx1ldPRFaDbo
X-Received: by 2002:a0d:c346:: with SMTP id f67mr35286559ywd.266.1579459625002;
        Sun, 19 Jan 2020 10:47:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579459624; cv=none;
        d=google.com; s=arc-20160816;
        b=dul2XWPeWulcioMAxnSsk4Ukbpk78bkRPY3kaek+HBCxP5p9WKrBpxgWmtsiS79bDL
         SnGeusG77tBnV4/ssO01ubsPeGjoIRvlJq79d7qXNpjbqhgJtNsQVycGRVnqDPOpY65x
         5pRaFAcuTYmnF5fNrKQB8va5tWz3g+9HCy5BksTQNCmj8fOhSagHSMWZ+nF1MmXwZyDE
         /mnsvVoTi1lvxC0sIYhcQge5jkPEjlEBNX5HvkF96YqD4SKKJVTiGyGmFy4tGUc4k26j
         HB8VhLSZDCI6IjFlYOsTjg1S9eYlprKLR0RBwFWzjzlcuC02TaVZgoXGUaegUhRxMkSu
         mZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=LE/q5yvxqv7Q8XCUxJJXLU/JCG6qkxCi/ZXGUijAMJg=;
        b=mK/9OeWkwB0sHk6X+P6p18TmB22taYfhhlShPZGI4fo3dTLcrgI1QF5oNnhcco+YOA
         GjLnNzkeYlU5iv/Z/YNETEsdKkmkFBrQIACiTH6MivkKZ/Ezd3wfmdyibKEwoTgHHTYT
         wMdglKtBEqlCeI1bZqFzYwaCJYXdV6MuRd/6SIDsPnQbODXctxKCS+IALNJAWS4ZkmCu
         Efupmbfk5gYk420ufm6SnLrG0lijbryrXUsDIiQv9du5VG1UTh6AC2UYupJto/lhuOrH
         JoEdYf9CAOVztxrUMhfcaJDZE8mn46O5InA7VhrL5CuYf+GbpWq3/JY17bD/C2Y9nlP0
         AeCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=asaF0Tnl;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id d192si18863210ybf.48.2020.01.19.10.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:47:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=asaF0Tnl;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579459624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LE/q5yvxqv7Q8XCUxJJXLU/JCG6qkxCi/ZXGUijAMJg=;
	b=asaF0TnluPO9olddomZfmYCAYtvbrBKzCdLXmh+gFFxcTBGoLM4elWvYVEiZo90cvCcQVQ
	6tcSUC6EM3OKjRDZIXw/+c8w++YA3CH0mMTeTVSDJX0IoYFuAClmXOLFVImAPPCYq8DL7w
	Y4AXO8Kda7gt11ma5QrL/0/AwwgqutY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-rYb91JXMOFy35-CwmMhVZQ-1; Sun, 19 Jan 2020 13:47:03 -0500
Received: by mail-wr1-f71.google.com with SMTP id z15so13110644wrw.0
        for <alex.bennee@linaro.org>; Sun, 19 Jan 2020 10:47:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FVsyQQgvSdHZ32HeTbvkoq/lb4K42LgK9xjUFLt9On0=;
        b=fHF7qnCR4TWEoHieZA/PNTWivg0lFM7wbaJv4cFVKwTweYFvEkvvIdyT0gKQNUWdR4
         Av06JaOwNYj79BZ81grZfAl/LcOZ88mEreR61a8sHjVPKi3riD8YH4sWB/9H+dHn4rmV
         VbTQk/AtHlhmxD2QrL1X7flitdzHzAyG4wi2b3+LMw/+ErqiD7I+geYoGF/Nxf/0H+ao
         aUqFp7reRIdf7n66qg6e1O2nyoMV89UL5aB7B7+YXYT5+wXmaxYfDexWoYyQp2uJnuwk
         /DGt9iFvOgDIzUjIHJuQvZkNplrk4Tn7AZR3nGLVSpecHwwnWIKhhFHhlb8GmcwR4oOh
         saDA==
X-Gm-Message-State: APjAAAVmaAM39NiyUIYL12K16wiq/7F+cHzF20q4BS6ebtQI2EDCCdiv
	gM3moyZBEj8A7CaqYlyy8tqE8RuBbw3Cv9z1QS68QWnx8VIlQH+zCEP/xXn7JrjTD2j4rjJB945
	wjiDNTonBqsCjwR4I
X-Received: by 2002:a1c:2394:: with SMTP id j142mr15708849wmj.25.1579459621806;
        Sun, 19 Jan 2020 10:47:01 -0800 (PST)
X-Received: by 2002:a1c:2394:: with SMTP id j142mr15708833wmj.25.1579459621516;
        Sun, 19 Jan 2020 10:47:01 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id n14sm19443064wmi.26.2020.01.19.10.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:47:00 -0800 (PST)
Subject: Re: [PATCH v4 05/20] hw/arm/allwinner-h3: add System Control module
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, b.galvani@gmail.com,
 jasowang@redhat.com, alex.bennee@linaro.org, imammedo@redhat.com
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-6-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <defe710d-34b8-1057-5730-98f7e017ea52@redhat.com>
Date: Sun, 19 Jan 2020 19:46:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200119005102.3847-6-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: rYb91JXMOFy35-CwmMhVZQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: SyHjvftxsCk2

On 1/19/20 1:50 AM, Niek Linnenbank wrote:
> The Allwinner H3 System on Chip has an System Control
> module that provides system wide generic controls and
> device information. This commit adds support for the
> Allwinner H3 System Control module.
>=20
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>   include/hw/arm/allwinner-h3.h          |   3 +
>   include/hw/misc/allwinner-h3-sysctrl.h |  67 ++++++++++++
>   hw/arm/allwinner-h3.c                  |   9 +-
>   hw/misc/allwinner-h3-sysctrl.c         | 140 +++++++++++++++++++++++++
>   hw/misc/Makefile.objs                  |   1 +
>   5 files changed, 219 insertions(+), 1 deletion(-)
>   create mode 100644 include/hw/misc/allwinner-h3-sysctrl.h
>   create mode 100644 hw/misc/allwinner-h3-sysctrl.c
>=20
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.=
h
> index 4f4dcbcd17..43500c4262 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -40,6 +40,7 @@
>   #include "hw/timer/allwinner-a10-pit.h"
>   #include "hw/intc/arm_gic.h"
>   #include "hw/misc/allwinner-h3-ccu.h"
> +#include "hw/misc/allwinner-h3-sysctrl.h"
>   #include "target/arm/cpu.h"
>  =20
>   /**
> @@ -56,6 +57,7 @@ enum {
>       AW_H3_SRAM_A1,
>       AW_H3_SRAM_A2,
>       AW_H3_SRAM_C,
> +    AW_H3_SYSCTRL,
>       AW_H3_EHCI0,
>       AW_H3_OHCI0,
>       AW_H3_EHCI1,
> @@ -108,6 +110,7 @@ typedef struct AwH3State {
>       const hwaddr *memmap;
>       AwA10PITState timer;
>       AwH3ClockCtlState ccu;
> +    AwH3SysCtrlState sysctrl;
>       GICState gic;
>       MemoryRegion sram_a1;
>       MemoryRegion sram_a2;
> diff --git a/include/hw/misc/allwinner-h3-sysctrl.h b/include/hw/misc/all=
winner-h3-sysctrl.h
> new file mode 100644
> index 0000000000..af4119e026
> --- /dev/null
> +++ b/include/hw/misc/allwinner-h3-sysctrl.h
> @@ -0,0 +1,67 @@
> +/*
> + * Allwinner H3 System Control emulation
> + *
> + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef HW_MISC_ALLWINNER_H3_SYSCTRL_H
> +#define HW_MISC_ALLWINNER_H3_SYSCTRL_H
> +
> +#include "qom/object.h"
> +#include "hw/sysbus.h"
> +
> +/**
> + * @name Constants
> + * @{
> + */
> +
> +/** Highest register address used by System Control device */
> +#define AW_H3_SYSCTRL_REGS_MAXADDR   (0x30)
> +
> +/** Total number of known registers */
> +#define AW_H3_SYSCTRL_REGS_NUM       ((AW_H3_SYSCTRL_REGS_MAXADDR / \
> +                                      sizeof(uint32_t)) + 1)
> +
> +/** @} */
> +
> +/**
> + * @name Object model
> + * @{
> + */
> +
> +#define TYPE_AW_H3_SYSCTRL    "allwinner-h3-sysctrl"
> +#define AW_H3_SYSCTRL(obj) \
> +    OBJECT_CHECK(AwH3SysCtrlState, (obj), TYPE_AW_H3_SYSCTRL)
> +
> +/** @} */
> +
> +/**
> + * Allwinner H3 System Control object instance state
> + */
> +typedef struct AwH3SysCtrlState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    /** Maps I/O registers in physical memory */
> +    MemoryRegion iomem;
> +
> +    /** Array of hardware registers */
> +    uint32_t regs[AW_H3_SYSCTRL_REGS_NUM];
> +
> +} AwH3SysCtrlState;
> +
> +#endif /* HW_MISC_ALLWINNER_H3_SYSCTRL_H */
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index f360625ee9..600cfa2c11 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -37,6 +37,7 @@ const hwaddr allwinner_h3_memmap[] =3D {
>       [AW_H3_SRAM_A1]    =3D 0x00000000,
>       [AW_H3_SRAM_A2]    =3D 0x00044000,
>       [AW_H3_SRAM_C]     =3D 0x00010000,
> +    [AW_H3_SYSCTRL]    =3D 0x01c00000,
>       [AW_H3_EHCI0]      =3D 0x01c1a000,
>       [AW_H3_OHCI0]      =3D 0x01c1a400,
>       [AW_H3_EHCI1]      =3D 0x01c1b000,
> @@ -66,7 +67,6 @@ struct AwH3Unimplemented {
>   } unimplemented[] =3D {
>       { "d-engine",  0x01000000, 4 * MiB },
>       { "d-inter",   0x01400000, 128 * KiB },
> -    { "syscon",    0x01c00000, 4 * KiB },
>       { "dma",       0x01c02000, 4 * KiB },
>       { "nfdc",      0x01c03000, 4 * KiB },
>       { "ts",        0x01c06000, 4 * KiB },
> @@ -192,6 +192,9 @@ static void allwinner_h3_init(Object *obj)
>  =20
>       sysbus_init_child_obj(obj, "ccu", &s->ccu, sizeof(s->ccu),
>                             TYPE_AW_H3_CCU);
> +
> +    sysbus_init_child_obj(obj, "sysctrl", &s->sysctrl, sizeof(s->sysctrl=
),
> +                          TYPE_AW_H3_SYSCTRL);
>   }
>  =20
>   static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> @@ -301,6 +304,10 @@ static void allwinner_h3_realize(DeviceState *dev, E=
rror **errp)
>       qdev_init_nofail(DEVICE(&s->ccu));
>       sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW_H3_CCU]);
>  =20
> +    /* System Control */
> +    qdev_init_nofail(DEVICE(&s->sysctrl));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctrl), 0, s->memmap[AW_H3_SYSC=
TRL]);
> +
>       /* Universal Serial Bus */
>       sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
>                            qdev_get_gpio_in(DEVICE(&s->gic),
> diff --git a/hw/misc/allwinner-h3-sysctrl.c b/hw/misc/allwinner-h3-sysctr=
l.c
> new file mode 100644
> index 0000000000..1d07efa880
> --- /dev/null
> +++ b/hw/misc/allwinner-h3-sysctrl.c
> @@ -0,0 +1,140 @@
> +/*
> + * Allwinner H3 System Control emulation
> + *
> + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "hw/sysbus.h"
> +#include "migration/vmstate.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "hw/misc/allwinner-h3-sysctrl.h"
> +
> +/* System Control register offsets */
> +enum {
> +    REG_VER               =3D 0x24,  /* Version */
> +    REG_EMAC_PHY_CLK      =3D 0x30,  /* EMAC PHY Clock */
> +};
> +
> +#define REG_INDEX(offset)   (offset / sizeof(uint32_t))
> +
> +/* System Control register reset values */
> +enum {
> +    REG_VER_RST           =3D 0x0,
> +    REG_EMAC_PHY_CLK_RST  =3D 0x58000,
> +};
> +
> +static uint64_t allwinner_h3_sysctrl_read(void *opaque, hwaddr offset,
> +                                          unsigned size)
> +{
> +    const AwH3SysCtrlState *s =3D AW_H3_SYSCTRL(opaque);
> +    const uint32_t idx =3D REG_INDEX(offset);
> +
> +    if (idx >=3D AW_H3_SYSCTRL_REGS_NUM) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\=
n",
> +                      __func__, (uint32_t)offset);
> +        return 0;
> +    }
> +
> +    return s->regs[idx];
> +}
> +
> +static void allwinner_h3_sysctrl_write(void *opaque, hwaddr offset,
> +                                       uint64_t val, unsigned size)
> +{
> +    AwH3SysCtrlState *s =3D AW_H3_SYSCTRL(opaque);
> +    const uint32_t idx =3D REG_INDEX(offset);
> +
> +    if (idx >=3D AW_H3_SYSCTRL_REGS_NUM) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\=
n",
> +                      __func__, (uint32_t)offset);
> +        return;
> +    }
> +
> +    switch (offset) {
> +    case REG_VER:       /* Version */
> +        break;
> +    default:
> +        s->regs[idx] =3D (uint32_t) val;
> +        break;
> +    }
> +}
> +
> +static const MemoryRegionOps allwinner_h3_sysctrl_ops =3D {
> +    .read =3D allwinner_h3_sysctrl_read,
> +    .write =3D allwinner_h3_sysctrl_write,
> +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 4,
> +        .max_access_size =3D 4,
> +    },
> +    .impl.min_access_size =3D 4,
> +};
> +
> +static void allwinner_h3_sysctrl_reset(DeviceState *dev)
> +{
> +    AwH3SysCtrlState *s =3D AW_H3_SYSCTRL(dev);
> +
> +    /* Set default values for registers */
> +    s->regs[REG_INDEX(REG_VER)] =3D REG_VER_RST;
> +    s->regs[REG_INDEX(REG_EMAC_PHY_CLK)] =3D REG_EMAC_PHY_CLK_RST;
> +}
> +
> +static void allwinner_h3_sysctrl_init(Object *obj)
> +{
> +    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
> +    AwH3SysCtrlState *s =3D AW_H3_SYSCTRL(obj);
> +
> +    /* Memory mapping */
> +    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_h3_sysctrl_op=
s, s,
> +                           TYPE_AW_H3_SYSCTRL, 4 * KiB);
> +    sysbus_init_mmio(sbd, &s->iomem);
> +}
> +
> +static const VMStateDescription allwinner_h3_sysctrl_vmstate =3D {
> +    .name =3D "allwinner-h3-sysctrl",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, AwH3SysCtrlState, AW_H3_SYSCTRL_REGS_=
NUM),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static void allwinner_h3_sysctrl_class_init(ObjectClass *klass, void *da=
ta)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->reset =3D allwinner_h3_sysctrl_reset;
> +    dc->vmsd =3D &allwinner_h3_sysctrl_vmstate;
> +}
> +
> +static const TypeInfo allwinner_h3_sysctrl_info =3D {
> +    .name          =3D TYPE_AW_H3_SYSCTRL,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .instance_init =3D allwinner_h3_sysctrl_init,
> +    .instance_size =3D sizeof(AwH3SysCtrlState),
> +    .class_init    =3D allwinner_h3_sysctrl_class_init,
> +};
> +
> +static void allwinner_h3_sysctrl_register(void)
> +{
> +    type_register_static(&allwinner_h3_sysctrl_info);
> +}
> +
> +type_init(allwinner_h3_sysctrl_register)
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 5e635b74d5..63b2e528f9 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -29,6 +29,7 @@ common-obj-$(CONFIG_MACIO) +=3D macio/
>   common-obj-$(CONFIG_IVSHMEM_DEVICE) +=3D ivshmem.o
>  =20
>   common-obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3-ccu.o
> +common-obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3-sysctrl.o
>   common-obj-$(CONFIG_REALVIEW) +=3D arm_sysctl.o
>   common-obj-$(CONFIG_NSERIES) +=3D cbus.o
>   common-obj-$(CONFIG_ECCMEMCTL) +=3D eccmemctl.o
>=20

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>

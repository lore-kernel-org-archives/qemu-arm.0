Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp665530njc;
        Thu, 8 Aug 2024 14:31:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAl1zbMoP4jUbBKGlaS9gFZbDFix7aoB7+thFGRmYax/tAVTd/N1slzrpbjx3xddCJNn7diExc9PgbyDye0gsgkiLthXhA
X-Received: by 2002:a05:600c:4f0d:b0:426:61af:e1d3 with SMTP id 5b1f17b1804b1-4290af1a583mr23578675e9.31.1723152689119;
        Thu, 08 Aug 2024 14:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723152689; cv=none;
        d=google.com; s=arc-20160816;
        b=DXnBepGl63J1OCbO0mMpbt7Y9D5iZh0nD/bPSsfOw6XoUtGNfx7pACRTV2FC2TWtTh
         6zKibZIMMMn5VbGCBpItZ0kCANzGEdFHDYCDxtr+awqLI/1urGBXByJGdzj04GwEPlFg
         1XcMSkUHdRDHn5c/dm+LKArGJJGY5awILNwU1Io4RDTylrpCHuSYfWKbFHPRwisjoJuf
         iIZo3qyTJa40aWbNNK0oJ5ieTvrIagMrC1sjtx2js32+Dhg3CFxPiIxS4sgaYaS5bb41
         zZsIdOoF7CTJqQKjByTYbXbtScaoFZ/QdWCrpUxJSbapEg2QGY9+bniK42HbFqYgGy3x
         OGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9nrlELFiylQQuaLhTjTy3FG7+PcbPPj5pusZyzUY4Zk=;
        fh=fiSGIIOqeeY420mrUK4kz843a4ibLWlWzKkn5pYzlXs=;
        b=rxrIxyFnZnyMX1oYsU1XV7i1zmy43TtEZU9is63WsoyOn+qmJZM4J8otulwLwyMoX9
         ntx/lZWQLZqSS7hGs/SDBaTsWgq0cKhPCts2h//ROVw4+sf83Rfudo01pycRNtmd0oWK
         kCop0/MFVVQQEqCtgoPNZgK5uUYf4s0CWQSEy2CwxEyBYD8DrD68eUXloM2l/AA7XNmq
         dTSlzsQ3wUewJFHqelg9rY02aOkjyA23F1QNr6tA0XHjkEwrdP8Lbw7ZLMH/FTtrVd4R
         IafydM21qPj5FThl4kUji19PVG4fbXVooMBZEC+eovCsHhT1hbcPtR7jRHNoAUBU1KyH
         9bog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Odl/J1o9";
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <tavip@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4290c0dd7f3sor4925685e9.5.2024.08.08.14.31.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Aug 2024 14:31:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="Odl/J1o9";
       spf=pass (google.com: domain of tavip@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=tavip@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723152688; x=1723757488; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nrlELFiylQQuaLhTjTy3FG7+PcbPPj5pusZyzUY4Zk=;
        b=Odl/J1o96XCLGEnkkWPmWSUcuWHxOgb/2xM/aZMqgVS6QvAIMT5oHupImqvfebiRJ/
         hUCR1YdmKZWnxgFEmZi0vUnK8zs8ScFdPh3dpwVRwUwQchkf/Ohu6eyY3Zwi952aGIOk
         9PzAhge4t6GtfIuuZzGSG2Oklo04BHBEFdhV1MLUU6PeEpcDbl727gc1YGoT/4JJ2OfQ
         ercCFa6nSDwriUvcVR6Fp1WPdpE2e5Zm0LPesdalrzERwit0ME8XzJPWgHpsOW8hphi8
         A/izxdFR/VQIsuph6FBK4d4GuqUC9jkd23pIBg1d86ZSRHGwYnDH/uZLSh5gsv1Ki7af
         WrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723152688; x=1723757488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nrlELFiylQQuaLhTjTy3FG7+PcbPPj5pusZyzUY4Zk=;
        b=WPRbRRgLgnREBSF0FfDCw0D89KSPyMMaV/WNDUBYSOpKiN5jgRCUgePdwHpUBAGqI8
         UjQVLm/lGUbHjuM3oZXDhFBMNk/BP2HeGaOdRxfzvOKkNqMdG7V/GNQrIhghvfp4hQwh
         pbL2WWgDUJ1OG5MOj6lhIzO50bL8XFhMqxciez2Jow2bznH+JehqeSBG+3OP9H9kpMMP
         2JZpXd1zl9SnPxM1qOaixRisdBW6gAN7iV83INze+IuGceMHCav0AosZQawesHI+h5k6
         mLR3GaFE0Y892tD46O5Wvjkeq0XZp59MsrTIvUGJ83pf4V9MDZBCQjt6nz0nLPGig+KR
         lHSA==
X-Forwarded-Encrypted: i=1; AJvYcCUvAJB7TM+Gb71GPieCx+RbBJ2KwnXYUsgfIu3Vo65kl1oSOhWupd2kCU1KEAg6QjqxHu69dOmTgTyeQVZ1yBAqs49sGmwy
X-Gm-Message-State: AOJu0YyL3mMhzShCKXXjeo8qUf50vr7X27wWE6qX9pUcUetC5JMiq3lP
	vfs/JmdADMY/rR/NAMGd6O7/9+uJhbxmKodzI0k8/ln9aAvebBlMRnB+xR3bg4IjVRTCbe68Vao
	DrUq6xOoD6eRqQNm/snhfGna4ajtoqEaS19xbamVUjKvJ6f4DiG/bAtk=
X-Google-Smtp-Source: AGHT+IEergXdvEAtIYUeR2yoMvnlh0ogme+ju6n8zd1aWrRUsjOopXCxQ6Ms11E9ElnDxCDLuGhlICrJSX2CJ+oeE3Q=
X-Received: by 2002:a05:600c:5117:b0:426:6220:cb57 with SMTP id
 5b1f17b1804b1-4290af0b1f2mr22805025e9.25.1723152688243; Thu, 08 Aug 2024
 14:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com> <20240805201719.2345596-21-tavip@google.com>
 <d31e1020-ce8d-40d9-ac8c-1dd8a0294073@linaro.org>
In-Reply-To: <d31e1020-ce8d-40d9-ac8c-1dd8a0294073@linaro.org>
From: Octavian Purdila <tavip@google.com>
Date: Thu, 8 Aug 2024 14:31:15 -0700
Message-ID: <CAGWr4cQ0rv=83srF4NdJQ3ppP8mUu4qoCxU+nPtrBEL+TbgwqQ@mail.gmail.com>
Subject: Re: [RFC PATCH 20/23] hw/ssi: add support for flexspi
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, stefanst@google.com, 
	pbonzini@redhat.com, alex.bennee@linaro.org, thuth@redhat.com, 
	peter.maydell@linaro.org, marcandre.lureau@redhat.com, alistair@alistair23.me, 
	berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: e7y3+cpLrovH

On Wed, Aug 7, 2024 at 10:11=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Octavian,
>

Hi Philippe,

Thanks for the review!

> On 5/8/24 22:17, Octavian Purdila wrote:
> > This is mostly a stub which completes SPI transactions as noops
> > by masking out the error interrupts and never clearing the IPCMDDONE
> > interrupt.
> >
> > Although incomplete, this allows software that uses NXP's mcuxpresso
> > SDK to run the SDK board initialization functions.
> >
> > It also supports AHB memory access, aka XIP, for now as simple RAM
> > memory regions.
> >
> > Signed-off-by: Octavian Purdila <tavip@google.com>
> > ---
> >   hw/arm/svd/meson.build   |   4 +
> >   hw/ssi/Kconfig           |   4 +
> >   hw/ssi/flexspi.c         | 216 ++++++++++++++++++++++++++++++++++++++=
+
> >   hw/ssi/meson.build       |   1 +
> >   hw/ssi/trace-events      |   4 +
> >   include/hw/ssi/flexspi.h |  34 ++++++
> >   6 files changed, 263 insertions(+)
> >   create mode 100644 hw/ssi/flexspi.c
> >   create mode 100644 include/hw/ssi/flexspi.h
>
>
> > diff --git a/hw/ssi/flexspi.c b/hw/ssi/flexspi.c
> > new file mode 100644
> > index 0000000000..305d1a5bac
> > --- /dev/null
> > +++ b/hw/ssi/flexspi.c
> > @@ -0,0 +1,216 @@
> > +/*
> > + * QEMU model for FLEXSPI
> > + *
> > + * Copyright (c) 2024 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/mmap-alloc.h"
> > +#include "qemu/log.h"
> > +#include "qemu/module.h"
> > +#include "qemu/units.h"
> > +#include "hw/irq.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/qdev-properties-system.h"
> > +#include "migration/vmstate.h"
> > +#include "exec/address-spaces.h"
> > +#include "hw/regs.h"
> > +#include "hw/ssi/flexspi.h"
> > +#include "hw/arm/svd/flexspi.h"
> > +
> > +#include "trace.h"
> > +
> > +#define reg(field) offsetof(FLEXSPI_Type, field)
> > +#define regi(x) (reg(x) / sizeof(uint32_t))
> > +#define REG_NO (sizeof(FLEXSPI_Type) / sizeof(uint32_t))
> > +
> > +static FLEXSPI_REGISTER_NAMES_ARRAY(reg_names);
> > +
> > +static void flexspi_reset(DeviceState *dev)
> > +{
> > +    FlexSpiState *s =3D FLEXSPI(dev);
> > +
> > +    memset(&s->regs, 0, sizeof(s->regs));
> > +
> > +    flexspi_reset_registers(&s->regs);
> > +
> > +    /* idle immediately after reset */
> > +    s->regs.STS0_b.SEQIDLE =3D 1;
> > +}
> > +
> > +static MemTxResult flexspi_read(void *opaque, hwaddr addr,
> > +                                     uint64_t *data, unsigned size,
> > +                                     MemTxAttrs attrs)
> > +{
> > +    FlexSpiState *s =3D opaque;
> > +    MemTxResult ret =3D MEMTX_OK;
> > +
> > +    if (!reg32_aligned_access(addr, size)) {
> > +        ret =3D MEMTX_ERROR;
> > +        goto out;
> > +    }
> > +
> > +    switch (addr) {
> > +    default:
> > +        *data =3D reg32_read(&s->regs, addr);
> > +        break;
> > +    }
> > +
> > +out:
> > +    trace_flexspi_reg_read(DEVICE(s)->id, reg_names[addr], addr, *data=
);
> > +    return ret;
> > +}
> > +
> > +static uint32_t wr_mask[REG_NO] =3D {
> > +    [regi(MCR0)] =3D BITS(31, 14) | BITS(12, 8) | BITS(5, 4) | BITS(1,=
 0),
> > +    [regi(MCR1)] =3D BITS(31, 0),
> > +    [regi(MCR2)] =3D BITS(31, 24) | BIT(11),
> > +    [regi(AHBCR)] =3D BIT(10) | BITS(7, 2) | BIT(0),
> > +    [regi(INTEN)] =3D BITS(13, 0),
> > +    /*
> > +     * TODO: once SPI transfers are implemented restore mask to:
> > +     *
> > +     * [regi(INTR)] =3D BIT(16) | BITS(12, 0).
> > +     *
> > +     * In the meantime this INTR mask allows for fake SPI transfers.
> > +     */
> > +    [regi(INTR)] =3D BIT(0),
> > +    [regi(LUTKEY)] =3D BITS(31, 0),
> > +    [regi(LUTCR)] =3D BITS(1, 0),
> > +    [regi(AHBRXBUF0CR0)] =3D BIT(31) | BITS(26, 24) | BITS(19, 16) | B=
ITS(7, 0),
> > +    [regi(AHBRXBUF1CR0)] =3D BIT(31) | BITS(26, 24) | BITS(19, 16) | B=
ITS(7, 0),
> > +    [regi(AHBRXBUF2CR0)] =3D BIT(31) | BITS(26, 24) | BITS(19, 16) | B=
ITS(7, 0),
> > +    [regi(AHBRXBUF3CR0)] =3D BIT(31) | BITS(26, 24) | BITS(19, 16) | B=
ITS(7, 0),
> > +    [regi(AHBRXBUF4CR0)] =3D BIT(31) | BITS(26, 24) | BITS(19, 16) | B=
ITS(7, 0),
> > +    [regi(AHBRXBUF5CR0)] =3D BIT(31) | BITS(26, 24) | BITS(19, 16) | B=
ITS(7, 0),
> > +    [regi(AHBRXBUF6CR0)] =3D BIT(31) | BITS(26, 24) | BITS(19, 16) | B=
ITS(7, 0),
> > +    [regi(AHBRXBUF7CR0)] =3D BIT(31) | BITS(26, 24) | BITS(19, 16) | B=
ITS(7, 0),
> > +    [regi(FLSHA1CR0)] =3D BITS(22, 0),
> > +    [regi(FLSHA2CR0)] =3D BITS(22, 0),
> > +    [regi(FLSHB1CR0)] =3D BITS(22, 0),
> > +    [regi(FLSHB2CR0)] =3D BITS(22, 0),
> > +    [regi(FLSHCR1A1)] =3D BITS(31, 0),
> > +    [regi(FLSHCR1A2)] =3D BITS(31, 0),
> > +    [regi(FLSHCR1B1)] =3D BITS(31, 0),
> > +    [regi(FLSHCR1B2)] =3D BITS(31, 0),
> > +    [regi(FLSHCR2A1)] =3D BITS(30, 13) | BITS(11, 5) | BITS(3, 0),
> > +    [regi(FLSHCR2A2)] =3D BITS(30, 13) | BITS(11, 5) | BITS(3, 0),
> > +    [regi(FLSHCR2B1)] =3D BITS(30, 13) | BITS(11, 5) | BITS(3, 0),
> > +    [regi(FLSHCR2B2)] =3D BITS(30, 13) | BITS(11, 5) | BITS(3, 0),
> > +    [regi(FLSHCR4)] =3D BITS(3, 2) | BIT(0),
> > +    [regi(IPCR0)] =3D BITS(31, 0),
> > +    [regi(IPCR1)] =3D BIT(31) | BITS(26, 24) | BITS(19, 0),
> > +    [regi(IPCMD)] =3D BIT(1),
> > +    [regi(DLPR)] =3D BITS(31, 0),
> > +    [regi(IPRXFCR)] =3D BITS(8, 0),
> > +    [regi(IPTXFCR)] =3D BITS(8, 0),
> > +    [regi(DLLCRA)] =3D BITS(14, 8) | BITS(6, 3) | BITS(1, 0),
> > +    [regi(DLLCRB)] =3D BITS(14, 8) | BITS(6, 3) | BITS(1, 0),
> > +    [regi(HADDRSTART)] =3D BITS(31, 12) | BIT(0),
> > +    [regi(HADDREND)] =3D BITS(31, 12),
> > +    [regi(HADDROFFSET)] =3D BITS(31, 12),
> > +};
> > +
> > +static MemTxResult flexspi_write(void *opaque, hwaddr addr,
> > +                                      uint64_t value, unsigned size,
> > +                                      MemTxAttrs attrs)
> > +{
> > +    FlexSpiState *s =3D opaque;
> > +    MemTxResult ret =3D MEMTX_OK;
> > +
> > +    trace_flexspi_reg_write(DEVICE(s)->id, reg_names[addr], addr, valu=
e);
> > +
> > +    if (!reg32_aligned_access(addr, size)) {
> > +        ret =3D MEMTX_ERROR;
> > +        goto out;
> > +    }
> > +
> > +    switch (addr) {
> > +    case reg(MCR0):
> > +    {
> > +        reg32_write(&s->regs, addr, value, wr_mask);
> > +
> > +        if (s->regs.MCR0_b.SWRESET) {
> > +            s->regs.MCR0_b.SWRESET =3D 0;
> > +        }
> > +        break;
> > +    }
> > +
> > +    default:
> > +        reg32_write(&s->regs, addr, value, wr_mask);
> > +        break;
> > +    }
> > +
> > +out:
> > +    return ret;
> > +}
> > +
> > +static const MemoryRegionOps flexspi_ops =3D {
> > +    .read_with_attrs =3D flexspi_read,
> > +    .write_with_attrs =3D flexspi_write,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
>
> I'm not a fan of your reg32_aligned_access() method, I'd rather
> use the generic path with:
>
>      .valid =3D {
>          .max_access_size =3D 4,
>          .min_access_size =3D 4,
>          .unaligned =3D false
>      },
>

Noted. I will switch to use this approach where possible.

Note that flexcom_spi allows 8/16/32 bit access on some registers, so
I would still like to keep the reg32_aligned_access() method for that
case, unless there is a better option.

> > +};
> > +
> > +static Property flexspi_properties[] =3D {
> > +    DEFINE_PROP_UINT32("mmap_base", FlexSpiState, mmap_base, 0),
> > +    DEFINE_PROP_UINT32("mmap_size", FlexSpiState, mmap_size, 0),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > +
> > +static void flexspi_init(Object *obj)
> > +{
> > +    FlexSpiState *s =3D FLEXSPI(obj);
> > +
> > +    memory_region_init_io(&s->mmio, obj, &flexspi_ops, s, TYPE_FLEXSPI=
,
> > +                          sizeof(FLEXSPI_Type));
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
> > +}
> > +
> > +static void flexspi_realize(DeviceState *dev, Error **errp)
> > +{
> > +    FlexSpiState *s =3D FLEXSPI(dev);
> > +
> > +    if (s->mmap_size) {
> > +        memory_region_init_ram(&s->mem, OBJECT(s), DEVICE(s)->id, s->m=
map_size,
> > +                               NULL);
> > +        memory_region_add_subregion(get_system_memory(), s->mmap_base,=
 &s->mem);
>
> Where is this region used?
>

These regions are enabled in rt500.c when instantiating the flexspi
peripherals. As implemented now they are backed by RAM, the full
implementation should translate accesses to spi commands to FLASH or
PSRAM devices.

We need the memory regions because even the simplest NXP SDK examples
are using the memory mapped flexspi0 region.

> > +    }
> > +}
> > +
> > +static void flexspi_class_init(ObjectClass *klass, void *data)
> > +{
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
> > +    dc->reset =3D flexspi_reset;
> > +    dc->realize =3D flexspi_realize;
> > +    device_class_set_props(dc, flexspi_properties);
> > +}
> > +
> > +static const TypeInfo flexspi_info =3D {
> > +    .name          =3D TYPE_FLEXSPI,
> > +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> > +    .instance_size =3D sizeof(FlexSpiState),
> > +    .instance_init =3D flexspi_init,
> > +    .class_init    =3D flexspi_class_init,
> > +};
> > +
> > +static void flexspi_register_types(void)
> > +{
> > +    int i;
> > +
> > +    for (i =3D 0; i < 32; i++) {
> > +        wr_mask[regi(TFDR[i])] =3D BITS(31, 0);
> > +    }
> > +    for (i =3D 0; i < 64; i++) {
> > +        wr_mask[regi(LUT[i])] =3D BITS(31, 0);
> > +    }
> > +
> > +    type_register_static(&flexspi_info);
> > +}
> > +
> > +type_init(flexspi_register_types)
> > diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
> > index 57d3e14727..c5b7e0a6e2 100644
> > --- a/hw/ssi/meson.build
> > +++ b/hw/ssi/meson.build
> > @@ -13,3 +13,4 @@ system_ss.add(when: 'CONFIG_OMAP', if_true: files('om=
ap_spi.c'))
> >   system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
> >   system_ss.add(when: 'CONFIG_BCM2835_SPI', if_true: files('bcm2835_spi=
.c'))
> >   system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm_spi.c=
'))
> > +system_ss.add(when: 'CONFIG_FLEXSPI', if_true: files('flexspi.c'))
> > diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
> > index 5caa1c17ac..d623022a79 100644
> > --- a/hw/ssi/trace-events
> > +++ b/hw/ssi/trace-events
> > @@ -40,3 +40,7 @@ flexcomm_spi_fifostat(const char *id, uint32_t fifost=
at, uint32_t fifoinstat) "%
> >   flexcomm_spi_irq(const char *id, bool irq, bool fifoirqs, bool perirq=
s, bool enabled) "%s: %d %d %d %d"
> >   flexcomm_spi_chr_rx_space(const char *id, uint32_t rx) "%s: %d"
> >   flexcomm_spi_chr_rx(const char *id) "%s"
> > +
> > +# flexspi.c
> > +flexspi_reg_read(const char *id, const char *reg_name, uint32_t addr, =
uint32_t val) " %s: %s[0x%04x] -> 0x%08x"
> > +flexspi_reg_write(const char *id, const char *reg_name, uint32_t addr,=
 uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
> > diff --git a/include/hw/ssi/flexspi.h b/include/hw/ssi/flexspi.h
> > new file mode 100644
> > index 0000000000..f5fea9dee9
> > --- /dev/null
> > +++ b/include/hw/ssi/flexspi.h
> > @@ -0,0 +1,34 @@
> > +/*
> > + * QEMU model for FLEXSPI
> > + *
> > + * Copyright (c) 2024 Google LLC
> > + *
> > + * SPDX-License-Identifier: GPL-2.0-or-later
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or =
later.
> > + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +#ifndef HW_RT500_FLEXSPI_H
> > +#define HW_RT500_FLEXSPI_H
> > +
> > +#include "hw/sysbus.h"
> > +#include "hw/ssi/ssi.h"
> > +#include "hw/arm/svd/flexspi.h"
> > +
> > +#define TYPE_FLEXSPI "flexspi"
> > +#define FLEXSPI(obj) OBJECT_CHECK(FlexSpiState, (obj), TYPE_FLEXSPI)
> > +
> > +typedef struct {
> > +    /* <private> */
> > +    SysBusDevice parent_obj;
> > +
> > +    /* <public> */
> > +    MemoryRegion mmio;
> > +    FLEXSPI_Type regs;
> > +    MemoryRegion mem;
> > +    uint32_t mmap_base;
> > +    uint32_t mmap_size;
>
> We usually use uint64_t for MR base/size. I.e., althought your SoC
> address space is 32-bit, this model could be use in another one,
> mapped at a 64-bit base.
>

I will fix it, thanks.

> > +} FlexSpiState;
> > +
> > +#endif /* HW_RT500_FLEXSPI_H */
>

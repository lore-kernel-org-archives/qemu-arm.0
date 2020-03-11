Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k18sm21951233wru.94.2020.03.11.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 13:04:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6D35E1FF7E;
	Wed, 11 Mar 2020 20:04:02 +0000 (GMT)
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
 <20200310213203.18730-8-nieklinnenbank@gmail.com>
 <87k13rgfqe.fsf@linaro.org>
 <CAPan3WrXM=bc33rEndzYeN5-xX7WpR1D5wbVBf8Yx=P3cTx5tA@mail.gmail.com>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud?=
 =?utf-8?Q?=C3=A9?=
 <philmd@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>, Jason Wang
 <jasowang@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v7 07/18] hw/arm/allwinner: add Security Identifier device
In-reply-to: <CAPan3WrXM=bc33rEndzYeN5-xX7WpR1D5wbVBf8Yx=P3cTx5tA@mail.gmail.com>
Date: Wed, 11 Mar 2020 20:04:02 +0000
Message-ID: <87fteefykt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: U+VWI3++U24z


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> On Wed, Mar 11, 2020 at 2:53 PM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>
>>
>> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>>
>> > The Security Identifier device found in various Allwinner System on Ch=
ip
>> > designs gives applications a per-board unique identifier. This commit
>> > adds support for the Allwinner Security Identifier using a 128-bit
>> > UUID value as input.
>> >
>> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> > ---
>> >  include/hw/arm/allwinner-h3.h   |   3 +
>> >  include/hw/misc/allwinner-sid.h |  60 ++++++++++++
>> >  hw/arm/allwinner-h3.c           |  11 ++-
>> >  hw/arm/orangepi.c               |   9 ++
>> >  hw/misc/allwinner-sid.c         | 168 ++++++++++++++++++++++++++++++++
>> >  hw/misc/Makefile.objs           |   1 +
>> >  hw/misc/trace-events            |   4 +
>> >  7 files changed, 255 insertions(+), 1 deletion(-)
>> >  create mode 100644 include/hw/misc/allwinner-sid.h
>> >  create mode 100644 hw/misc/allwinner-sid.c
>> >
>> > diff --git a/include/hw/arm/allwinner-h3.h
>> b/include/hw/arm/allwinner-h3.h
>> > index dc729176ab..85416d9d64 100644
>> > --- a/include/hw/arm/allwinner-h3.h
>> > +++ b/include/hw/arm/allwinner-h3.h
>> > @@ -42,6 +42,7 @@
>> >  #include "hw/misc/allwinner-h3-ccu.h"
>> >  #include "hw/misc/allwinner-cpucfg.h"
>> >  #include "hw/misc/allwinner-h3-sysctrl.h"
>> > +#include "hw/misc/allwinner-sid.h"
>> >  #include "target/arm/cpu.h"
>> >
>> >  /**
>> > @@ -59,6 +60,7 @@ enum {
>> >      AW_H3_SRAM_A2,
>> >      AW_H3_SRAM_C,
>> >      AW_H3_SYSCTRL,
>> > +    AW_H3_SID,
>> >      AW_H3_EHCI0,
>> >      AW_H3_OHCI0,
>> >      AW_H3_EHCI1,
>> > @@ -114,6 +116,7 @@ typedef struct AwH3State {
>> >      AwH3ClockCtlState ccu;
>> >      AwCpuCfgState cpucfg;
>> >      AwH3SysCtrlState sysctrl;
>> > +    AwSidState sid;
>> >      GICState gic;
>> >      MemoryRegion sram_a1;
>> >      MemoryRegion sram_a2;
>> > diff --git a/include/hw/misc/allwinner-sid.h
>> b/include/hw/misc/allwinner-sid.h
>> > new file mode 100644
>> > index 0000000000..4c1fa4762b
>> > --- /dev/null
>> > +++ b/include/hw/misc/allwinner-sid.h
>> > @@ -0,0 +1,60 @@
>> > +/*
>> > + * Allwinner Security ID emulation
>> > + *
>> > + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
>> > + *
>> > + * This program is free software: you can redistribute it and/or modi=
fy
>> > + * it under the terms of the GNU General Public License as published =
by
>> > + * the Free Software Foundation, either version 2 of the License, or
>> > + * (at your option) any later version.
>> > + *
>> > + * This program is distributed in the hope that it will be useful,
>> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> > + * GNU General Public License for more details.
>> > + *
>> > + * You should have received a copy of the GNU General Public License
>> > + * along with this program.  If not, see <http://www.gnu.org/licenses/
>> >.
>> > + */
>> > +
>> > +#ifndef HW_MISC_ALLWINNER_SID_H
>> > +#define HW_MISC_ALLWINNER_SID_H
>> > +
>> > +#include "qom/object.h"
>> > +#include "hw/sysbus.h"
>> > +#include "qemu/uuid.h"
>> > +
>> > +/**
>> > + * Object model
>> > + * @{
>> > + */
>> > +
>> > +#define TYPE_AW_SID    "allwinner-sid"
>> > +#define AW_SID(obj) \
>> > +    OBJECT_CHECK(AwSidState, (obj), TYPE_AW_SID)
>> > +
>> > +/** @} */
>> > +
>> > +/**
>> > + * Allwinner Security ID object instance state
>> > + */
>> > +typedef struct AwSidState {
>> > +    /*< private >*/
>> > +    SysBusDevice parent_obj;
>> > +    /*< public >*/
>> > +
>> > +    /** Maps I/O registers in physical memory */
>> > +    MemoryRegion iomem;
>> > +
>> > +    /** Control register defines how and what to read */
>> > +    uint32_t control;
>> > +
>> > +    /** RdKey register contains the data retrieved by the device */
>> > +    uint32_t rdkey;
>> > +
>> > +    /** Stores the emulated device identifier */
>> > +    QemuUUID identifier;
>> > +
>> > +} AwSidState;
>> > +
>> > +#endif /* HW_MISC_ALLWINNER_SID_H */
>> > diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
>> > index b9a5597f2a..deeea63f5f 100644
>> > --- a/hw/arm/allwinner-h3.c
>> > +++ b/hw/arm/allwinner-h3.c
>> > @@ -38,6 +38,7 @@ const hwaddr allwinner_h3_memmap[] =3D {
>> >      [AW_H3_SRAM_A2]    =3D 0x00044000,
>> >      [AW_H3_SRAM_C]     =3D 0x00010000,
>> >      [AW_H3_SYSCTRL]    =3D 0x01c00000,
>> > +    [AW_H3_SID]        =3D 0x01c14000,
>> >      [AW_H3_EHCI0]      =3D 0x01c1a000,
>> >      [AW_H3_OHCI0]      =3D 0x01c1a400,
>> >      [AW_H3_EHCI1]      =3D 0x01c1b000,
>> > @@ -78,7 +79,6 @@ struct AwH3Unimplemented {
>> >      { "mmc0",      0x01c0f000, 4 * KiB },
>> >      { "mmc1",      0x01c10000, 4 * KiB },
>> >      { "mmc2",      0x01c11000, 4 * KiB },
>> > -    { "sid",       0x01c14000, 1 * KiB },
>> >      { "crypto",    0x01c15000, 4 * KiB },
>> >      { "msgbox",    0x01c17000, 4 * KiB },
>> >      { "spinlock",  0x01c18000, 4 * KiB },
>> > @@ -198,6 +198,11 @@ static void allwinner_h3_init(Object *obj)
>> >
>> >      sysbus_init_child_obj(obj, "cpucfg", &s->cpucfg, sizeof(s->cpucfg=
),
>> >                            TYPE_AW_CPUCFG);
>> > +
>> > +    sysbus_init_child_obj(obj, "sid", &s->sid, sizeof(s->sid),
>> > +                          TYPE_AW_SID);
>> > +    object_property_add_alias(obj, "identifier", OBJECT(&s->sid),
>> > +                              "identifier", &error_abort);
>> >  }
>> >
>> >  static void allwinner_h3_realize(DeviceState *dev, Error **errp)
>> > @@ -315,6 +320,10 @@ static void allwinner_h3_realize(DeviceState *dev,
>> Error **errp)
>> >      qdev_init_nofail(DEVICE(&s->cpucfg));
>> >      sysbus_mmio_map(SYS_BUS_DEVICE(&s->cpucfg), 0,
>> s->memmap[AW_H3_CPUCFG]);
>> >
>> > +    /* Security Identifier */
>> > +    qdev_init_nofail(DEVICE(&s->sid));
>> > +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sid), 0, s->memmap[AW_H3_SID]);
>> > +
>> >      /* Universal Serial Bus */
>> >      sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
>> >                           qdev_get_gpio_in(DEVICE(&s->gic),
>> > diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
>> > index 3fcec1944e..c92fab3eac 100644
>> > --- a/hw/arm/orangepi.c
>> > +++ b/hw/arm/orangepi.c
>> > @@ -65,6 +65,15 @@ static void orangepi_init(MachineState *machine)
>> >      object_property_set_int(OBJECT(h3), 24 * 1000 * 1000, "clk1-freq",
>> >                              &error_abort);
>> >
>> > +    /* Setup SID properties. Currently using a default fixed SID
>> identifier. */
>> > +    if (qemu_uuid_is_null(&h3->sid.identifier)) {
>> > +        qdev_prop_set_string(DEVICE(h3), "identifier",
>> > +                             "02c00081-1111-2222-3333-000044556677");
>> > +    } else if (ldl_be_p(&h3->sid.identifier.data[0]) !=3D 0x02c00081)=
 {
>> > +        fprintf(stderr, "WARNING: Security Identifier value does "
>> > +                        "not include H3 prefix\n");
>> > +    }
>> > +
>>
>> Should this be a LOG_GUEST_ERROR?
>>
>
> Hi Alex,
>
> This warning is basically to inform the user when overriding the SID
> identifier manually with -global,
> that the identifier specified by the user does not contain the H3 SoC
> prefix. Real hardware always has
> that particular prefix in its identifier value, and it might be so that
> software running on the emulated hardware
> depends on it. So its basically a proactive warning to inform the user, a=
nd
> not an error of wrong behavior caused by the guest software.

Ahh in that case I would suggest warn_report instead of a plain printf.
That should come out in all the right places but won't error out like
error_report.

>
>
>>
>> Otherwise:
>>
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>
> Assuming the above explanation is sufficient, I'll add your review tag,
> thanks!

Using warn_report instead will be fine.

--=20
Alex Benn=C3=A9e

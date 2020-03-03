Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a70sm3778943wme.28.2020.03.03.04.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 04:01:16 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B4A971FF87;
	Tue,  3 Mar 2020 12:01:15 +0000 (GMT)
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-6-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v6 05/18] hw/arm/allwinner-h3: add System Control module
In-reply-to: <20200301215029.15196-6-nieklinnenbank@gmail.com>
Date: Tue, 03 Mar 2020 12:01:15 +0000
Message-ID: <87ftep7ilw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dTGySXajDqdz


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> The Allwinner H3 System on Chip has an System Control
> module that provides system wide generic controls and
> device information. This commit adds support for the
> Allwinner H3 System Control module.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  include/hw/arm/allwinner-h3.h          |   3 +
>  include/hw/misc/allwinner-h3-sysctrl.h |  67 ++++++++++++
>  hw/arm/allwinner-h3.c                  |   9 +-
>  hw/misc/allwinner-h3-sysctrl.c         | 140 +++++++++++++++++++++++++
>  hw/misc/Makefile.objs                  |   1 +
>  5 files changed, 219 insertions(+), 1 deletion(-)
>  create mode 100644 include/hw/misc/allwinner-h3-sysctrl.h
>  create mode 100644 hw/misc/allwinner-h3-sysctrl.c
>
> diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-h3.h
> index 4f4dcbcd17..43500c4262 100644
> --- a/include/hw/arm/allwinner-h3.h
> +++ b/include/hw/arm/allwinner-h3.h
> @@ -40,6 +40,7 @@
>  #include "hw/timer/allwinner-a10-pit.h"
>  #include "hw/intc/arm_gic.h"
>  #include "hw/misc/allwinner-h3-ccu.h"
> +#include "hw/misc/allwinner-h3-sysctrl.h"
>  #include "target/arm/cpu.h"
>=20=20
>  /**
> @@ -56,6 +57,7 @@ enum {
>      AW_H3_SRAM_A1,
>      AW_H3_SRAM_A2,
>      AW_H3_SRAM_C,
> +    AW_H3_SYSCTRL,
>      AW_H3_EHCI0,
>      AW_H3_OHCI0,
>      AW_H3_EHCI1,
> @@ -108,6 +110,7 @@ typedef struct AwH3State {
>      const hwaddr *memmap;
>      AwA10PITState timer;
>      AwH3ClockCtlState ccu;
> +    AwH3SysCtrlState sysctrl;
>      GICState gic;
>      MemoryRegion sram_a1;
>      MemoryRegion sram_a2;
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
> index c205f06738..0aa46712db 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -37,6 +37,7 @@ const hwaddr allwinner_h3_memmap[] =3D {
>      [AW_H3_SRAM_A1]    =3D 0x00000000,
>      [AW_H3_SRAM_A2]    =3D 0x00044000,
>      [AW_H3_SRAM_C]     =3D 0x00010000,
> +    [AW_H3_SYSCTRL]    =3D 0x01c00000,
>      [AW_H3_EHCI0]      =3D 0x01c1a000,
>      [AW_H3_OHCI0]      =3D 0x01c1a400,
>      [AW_H3_EHCI1]      =3D 0x01c1b000,
> @@ -66,7 +67,6 @@ struct AwH3Unimplemented {
>  } unimplemented[] =3D {
>      { "d-engine",  0x01000000, 4 * MiB },
>      { "d-inter",   0x01400000, 128 * KiB },
> -    { "syscon",    0x01c00000, 4 * KiB },
>      { "dma",       0x01c02000, 4 * KiB },
>      { "nfdc",      0x01c03000, 4 * KiB },
>      { "ts",        0x01c06000, 4 * KiB },
> @@ -192,6 +192,9 @@ static void allwinner_h3_init(Object *obj)
>=20=20
>      sysbus_init_child_obj(obj, "ccu", &s->ccu, sizeof(s->ccu),
>                            TYPE_AW_H3_CCU);
> +
> +    sysbus_init_child_obj(obj, "sysctrl", &s->sysctrl, sizeof(s->sysctrl=
),
> +                          TYPE_AW_H3_SYSCTRL);
>  }
>=20=20
>  static void allwinner_h3_realize(DeviceState *dev, Error **errp)
> @@ -301,6 +304,10 @@ static void allwinner_h3_realize(DeviceState *dev, E=
rror **errp)
>      qdev_init_nofail(DEVICE(&s->ccu));
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccu), 0, s->memmap[AW_H3_CCU]);
>=20=20
> +    /* System Control */
> +    qdev_init_nofail(DEVICE(&s->sysctrl));
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctrl), 0, s->memmap[AW_H3_SYSC=
TRL]);
> +
>      /* Universal Serial Bus */
>      sysbus_create_simple(TYPE_AW_H3_EHCI, s->memmap[AW_H3_EHCI0],
>                           qdev_get_gpio_in(DEVICE(&s->gic),
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
>  common-obj-$(CONFIG_IVSHMEM_DEVICE) +=3D ivshmem.o
>=20=20
>  common-obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3-ccu.o
> +common-obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3-sysctrl.o
>  common-obj-$(CONFIG_REALVIEW) +=3D arm_sysctl.o
>  common-obj-$(CONFIG_NSERIES) +=3D cbus.o
>  common-obj-$(CONFIG_ECCMEMCTL) +=3D eccmemctl.o


--=20
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u20sm3148031wmj.14.2020.03.03.03.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 03:02:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BEBD21FF87;
	Tue,  3 Mar 2020 11:02:40 +0000 (GMT)
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-3-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v6 02/18] hw/arm: add Xunlong Orange Pi PC machine
In-reply-to: <20200301215029.15196-3-nieklinnenbank@gmail.com>
Date: Tue, 03 Mar 2020 11:02:40 +0000
Message-ID: <87sgip7lbj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: azzY1+nKcPvv


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
> based embedded computer with mainline support in both U-Boot
> and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
> 1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
> various other I/O. This commit add support for the Xunlong
> Orange Pi PC machine.
>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Tested-by: KONRAD Frederic <frederic.konrad@adacore.com>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/orangepi.c    | 89 ++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS          |  1 +
>  hw/arm/Makefile.objs |  2 +-
>  3 files changed, 91 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/orangepi.c
>
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> new file mode 100644
> index 0000000000..19adfca917
> --- /dev/null
> +++ b/hw/arm/orangepi.c
> @@ -0,0 +1,89 @@
> +/*
> + * Orange Pi emulation
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
> +#include "exec/address-spaces.h"
> +#include "qapi/error.h"
> +#include "cpu.h"
> +#include "hw/sysbus.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/arm/allwinner-h3.h"
> +#include "sysemu/sysemu.h"
> +
> +static struct arm_boot_info orangepi_binfo =3D {
> +    .nb_cpus =3D AW_H3_NUM_CPUS,
> +};
> +
> +static void orangepi_init(MachineState *machine)
> +{
> +    AwH3State *h3;
> +
> +    /* BIOS is not supported by this board */
> +    if (bios_name) {
> +        error_report("BIOS not supported for this machine");
> +        exit(1);
> +    }
> +
> +    /* This board has fixed size RAM */
> +    if (machine->ram_size !=3D 1 * GiB) {
> +        error_report("This machine can only be used with 1GiB of RAM");
> +        exit(1);
> +    }
> +
> +    /* Only allow Cortex-A7 for this board */
> +    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) !=3D 0=
) {
> +        error_report("This board can only be used with cortex-a7 CPU");
> +        exit(1);
> +    }
> +
> +    h3 =3D AW_H3(object_new(TYPE_AW_H3));
> +
> +    /* Setup timer properties */
> +    object_property_set_int(OBJECT(h3), 32768, "clk0-freq",
> +                            &error_abort);
> +    object_property_set_int(OBJECT(h3), 24 * 1000 * 1000, "clk1-freq",
> +                            &error_abort);
> +
> +    /* Mark H3 object realized */
> +    object_property_set_bool(OBJECT(h3), true, "realized", &error_abort);
> +
> +    /* SDRAM */
> +    memory_region_add_subregion(get_system_memory(), h3->memmap[AW_H3_SD=
RAM],
> +                                machine->ram);
> +
> +    orangepi_binfo.loader_start =3D h3->memmap[AW_H3_SDRAM];
> +    orangepi_binfo.ram_size =3D machine->ram_size;
> +    arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
> +}
> +
> +static void orangepi_machine_init(MachineClass *mc)
> +{
> +    mc->desc =3D "Orange Pi PC";
> +    mc->init =3D orangepi_init;
> +    mc->min_cpus =3D AW_H3_NUM_CPUS;
> +    mc->max_cpus =3D AW_H3_NUM_CPUS;
> +    mc->default_cpus =3D AW_H3_NUM_CPUS;
> +    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a7");
> +    mc->default_ram_size =3D 1 * GiB;
> +    mc->default_ram_id =3D "orangepi.ram";
> +}
> +
> +DEFINE_MACHINE("orangepi-pc", orangepi_machine_init)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d5c0c25cc4..02ecba8d9c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -496,6 +496,7 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/allwinner-h3*
>  F: include/hw/*/allwinner-h3*
> +F: hw/arm/orangepi.c
>=20=20
>  ARM PrimeCell and CMSDK devices
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index ae577e875f..534a6a119e 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -35,7 +35,7 @@ obj-$(CONFIG_DIGIC) +=3D digic.o
>  obj-$(CONFIG_OMAP) +=3D omap1.o omap2.o
>  obj-$(CONFIG_STRONGARM) +=3D strongarm.o
>  obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubieboard.o
> -obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o
> +obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o orangepi.o
>  obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836.o raspi.o
>  obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
>  obj-$(CONFIG_STM32F405_SOC) +=3D stm32f405_soc.o


--=20
Alex Benn=C3=A9e

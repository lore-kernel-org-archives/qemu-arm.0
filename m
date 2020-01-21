Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1696637lfp;
        Tue, 21 Jan 2020 08:39:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqyq3bw5WaDwLjAmbFhapeyKEFWmit624UcNN/Po5L5vaey6fkek6FhwQ43FG0rdqeLoW8VS
X-Received: by 2002:a50:ab5b:: with SMTP id t27mr4761511edc.229.1579624758387;
        Tue, 21 Jan 2020 08:39:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579624758; cv=none;
        d=google.com; s=arc-20160816;
        b=FDb9yaTXdzh2xNQouHJMgwH8cha4qK9ZUJ7TxHURt0fSjfybTQEil+yrVAdd4Dd9Zr
         paxQd3TEbPeRFf64uqdFiHafT8qrGiHcAZAZgkJKuLc+jV2+l7aFwbJ/2GgVJcIhuk2p
         W+aLtlKbyfY+/C6qIOgPgqObeKjBHAxsgRasmTrkn+WSUyMRmw9b0Ga2R39ygsoABtzE
         IfjTjBGMx8Cm7cLJnhR3k3AZmW2XTxCck2TrotTlaIeuaugRMGYG/70uXcTN0SyypIo7
         I5dI5fKd44Bt47GqJJ+iXJ/0S025BHMTiuaijXeRO2D+ahXeW4+Np5JWFUDwKsQuk2Vf
         +fDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=6Mwmb7BtJNDzUahKcdyRnWr+HAupBvyLDcrKAXcj7sc=;
        b=gaz0XQ0AGfN9t0XFIRbmmeIdYushji1SRb79sM877y+lUptVIexKoxWqsQMBqrDe3x
         PfhlfLFWLUw1LSGvHGq4qq5RU1b63daeTAyS92YdP+NmJBT8RTLVk6pvpiHNItZ+TrlH
         zyJHv+F6NiXqo7TBYPMmLNuGglI939lYmeWTCi8GotTfga00A1zbrdflzTWdfmL8HIiH
         5x0ZIfRKa5A6ojC5kSZou3agosFCYYlRScU+Cb8KJ7t9unWpogDQvtfHTLcG+nCeNsyI
         Adixhy2lqXhSHEI4nivHPV5ixwiIHlP5j+n3eohrQzGr/MTAC1Ee1oz+J8CFW7jK6/wU
         iloQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TT2T8uvR;
       spf=pass (google.com: domain of imammedo@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id w20si23726405eje.236.2020.01.21.08.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jan 2020 08:39:18 -0800 (PST)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TT2T8uvR;
       spf=pass (google.com: domain of imammedo@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579624757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Mwmb7BtJNDzUahKcdyRnWr+HAupBvyLDcrKAXcj7sc=;
	b=TT2T8uvRSZuFxQJhQ9y0Rai4Af5YX5C1M2xeOFSCqhdG0qp89zRM9il8GqEji54EGQjW6z
	6qs4JbtkMqlg+J7+zABspGo0L9FSI0ng6httOZUx0pZl64Qhy6Qfi0QCbIUv6uCp7QkI7I
	fhhG72DlDxjs1nsvZdymOfkoDCZi5+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-_RuNqAiFMOWg4dpLlUHVvg-1; Tue, 21 Jan 2020 11:39:14 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24309800D53;
	Tue, 21 Jan 2020 16:39:13 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-204-20.brq.redhat.com [10.40.204.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1898A5C1C3;
	Tue, 21 Jan 2020 16:39:07 +0000 (UTC)
Date: Tue, 21 Jan 2020 17:39:06 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 jasowang@redhat.com, b.galvani@gmail.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Subject: Re: [PATCH v4 02/20] hw/arm: add Xunlong Orange Pi PC machine
Message-ID: <20200121173906.626c700b@Igors-MacBook-Pro>
In-Reply-To: <20200119005102.3847-3-nieklinnenbank@gmail.com>
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
	<20200119005102.3847-3-nieklinnenbank@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: _RuNqAiFMOWg4dpLlUHVvg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yk5W7Xh4Ii29

On Sun, 19 Jan 2020 01:50:44 +0100
Niek Linnenbank <nieklinnenbank@gmail.com> wrote:

> The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
> based embedded computer with mainline support in both U-Boot
> and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
> 1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
> various other I/O. This commit add support for the Xunlong
> Orange Pi PC machine.
>=20
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Tested-by: KONRAD Frederic <frederic.konrad@adacore.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/orangepi.c    | 93 ++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS          |  1 +
>  hw/arm/Makefile.objs |  2 +-
>  3 files changed, 95 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/orangepi.c
>=20
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> new file mode 100644
> index 0000000000..866f5f7cd6
> --- /dev/null
> +++ b/hw/arm/orangepi.c
> @@ -0,0 +1,93 @@
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
> +typedef struct OrangePiState {
> +    AwH3State *h3;
> +    MemoryRegion sdram;
> +} OrangePiState;
> +
> +static void orangepi_init(MachineState *machine)
> +{
> +    OrangePiState *s =3D g_new(OrangePiState, 1);
> +
> +    /* BIOS is not supported by this board */
> +    if (bios_name) {
> +        error_report("BIOS not supported for this machine");
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
> +    s->h3 =3D AW_H3(object_new(TYPE_AW_H3));
> +
> +    /* Setup timer properties */
> +    object_property_set_int(OBJECT(s->h3), 32768, "clk0-freq",
> +                            &error_abort);
> +    object_property_set_int(OBJECT(s->h3), 24 * 1000 * 1000, "clk1-freq"=
,
> +                            &error_abort);
> +
> +    /* Mark H3 object realized */
> +    object_property_set_bool(OBJECT(s->h3), true, "realized", &error_abo=
rt);
> +
> +    /* SDRAM */
> +    if (machine->ram_size !=3D 1 * GiB) {
> +        error_report("This machine can only be used with 1GiB of RAM");
> +        exit(1);
> +    }
> +    memory_region_allocate_system_memory(&s->sdram, NULL, "sdram",
> +                                         machine->ram_size);
> +    memory_region_add_subregion(get_system_memory(), s->h3->memmap[AW_H3=
_SDRAM],
> +                                &s->sdram);
> +
> +    orangepi_binfo.loader_start =3D s->h3->memmap[AW_H3_SDRAM];
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
> +}
> +
> +DEFINE_MACHINE("orangepi-pc", orangepi_machine_init)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 225582704d..e99797eec9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -487,6 +487,7 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/*/allwinner-h3*
>  F: include/hw/*/allwinner-h3*
> +F: hw/arm/orangepi.c
> =20
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

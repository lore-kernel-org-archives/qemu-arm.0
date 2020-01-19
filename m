Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1711666lff;
        Sun, 19 Jan 2020 10:04:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7eXOWfJG8EKzspylLYDkkqAjP63wDXM4lYb4/2/Xo5XOFkDQt1rV1s9M3Qn81xf3SF2C4
X-Received: by 2002:a25:b787:: with SMTP id n7mr27343563ybh.423.1579457050421;
        Sun, 19 Jan 2020 10:04:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579457050; cv=none;
        d=google.com; s=arc-20160816;
        b=s/ExxR19UyBstX0Mve7NNPK5sz4ZTXXjX3un4rmQgDZvod75o6zF1kuW5gxEvg9p4+
         /rWkYVyE5jlLuLT85UDzu1n6Cz+Ebki/crii3RbBzUPHIV673YaqwLfRV7iuy7AE/Az9
         rbMq8XqhboGg48MTID+C/oSnA7ujNoes9yR0RTyjKs8nV5NnghOMH5s/XCefjWp9DnMp
         6pBO3to2FMvYHK1y6xXb0a5bONuyNHSTJrsJmT1wKghJll1m2EYgMUTFixKwCR8vFUm/
         Z1UdujUtcweISM3vy8fTnGJhi5roSENJ28eRs+7Xga61VD9wxGJdj6pOd+IsYynRB/I4
         GPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=VKpRt6WXMiAtRDpyYcjqqPoBX+R7zBEtvktmFhFji/0=;
        b=tDrvBbgYMc6/uUZRWPw350vcXjnhdjoALvIksgliXUESRN5VQZtHd8LXxx5TXKiUUA
         JCZiF+GIsdLygfgGTtJhCfF4JqpZrkhyxIRr30Jf+Xfs5utNYU63uIHbMDsnsVAAoCdO
         r3maTPeBGcUcaT77u/C+DqEgVHyqpb2OeZCv6C6efmkX0HewxJ2FwdwlwsMyRAmBBHxq
         Rw2XCTzHsDe5g5NWafbVTfGQMI6bIEjuxI7ZLX7JNOzsZpZeEJi4jx/joXjOl4jPbFZf
         IRCoAqzWo0F27h3n4e0cY7AGMLpnbT74OY+wUtI7CyqaeZg8ixwMzWKZgGHIX8tmdKov
         4z1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FczKg1p8;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id q7si13838824ybm.440.2020.01.19.10.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:04:10 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FczKg1p8;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579457049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKpRt6WXMiAtRDpyYcjqqPoBX+R7zBEtvktmFhFji/0=;
	b=FczKg1p8/ddj02+9KlaggKSibDRYNv4CTOJ4c3T+yg75dO+MMhX/QMkOvS+rqpk9vKw0w2
	sQHVrsEloKqt7oOnt7Z1Fik4eblJTp5hCXrkRM17wEMNfbnBmBPo6ISCGWqDTVr+VFx7GU
	vIpUi3Tc4g0r0kxUTyhWcOllkZJwNIE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-Cz95C81QMvi777NtL0kYeA-1; Sun, 19 Jan 2020 13:04:08 -0500
Received: by mail-wr1-f70.google.com with SMTP id h30so13003142wrh.5
        for <alex.bennee@linaro.org>; Sun, 19 Jan 2020 10:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IafRIbDewu+M7dVHNRNXVWJPVzzMRLLzuBNgYEE88/I=;
        b=ZM6CU67yyjPQz3DEDXnlRGyEIh9A3az+TBzsHq+qC0HgNqaDBqZKqbtMK6Etg/UMPW
         Ic4JYlkn42WerhhA5zokWqFaY64lkjcr03FMKkbhxW7E+aJND2U/RteA6rpwaOENDx+e
         ZZPLIDRuWI/besADwQheVEaO67zb56hptCMegy7uystlE5BmjxwwbP4aZPDlwTmmVOe9
         OYUwbHHuexjpfEXZKzF5k5T721HQWyDvAmu78UI8oYFd8C/ytkathUdeQkLVV8nKgM6A
         9aAVIjL+Rob9tI6oChffEAez7O9pskkCHyJH7cDdVLJVzWVh8WGHlwIw5SiYHDfabGEY
         km5Q==
X-Gm-Message-State: APjAAAVlt1fkNNavxF35wZv+LXyj8/gKCkYCJ5ZSobtjdhLvt0PiTF/X
	3xphuw9JuvT7IF0yhONc1DILz3ipnzNQSrDAbz/UELXAMCzNbzpsjYA0ozyJRlnTjdkgW1VFoKK
	MBrUXKA6Cbi+RpI+v
X-Received: by 2002:a1c:1d16:: with SMTP id d22mr15182912wmd.158.1579457047198;
        Sun, 19 Jan 2020 10:04:07 -0800 (PST)
X-Received: by 2002:a1c:1d16:: with SMTP id d22mr15182900wmd.158.1579457046972;
        Sun, 19 Jan 2020 10:04:06 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id q3sm1307685wmc.47.2020.01.19.10.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 10:04:06 -0800 (PST)
Subject: Re: [PATCH v4 02/20] hw/arm: add Xunlong Orange Pi PC machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, b.galvani@gmail.com,
 jasowang@redhat.com, alex.bennee@linaro.org, imammedo@redhat.com
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-3-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6dd9ce64-8126-2849-fcf1-fff71582b8f9@redhat.com>
Date: Sun, 19 Jan 2020 19:04:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200119005102.3847-3-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: Cz95C81QMvi777NtL0kYeA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: u/a9kLB5Vp6V

On 1/19/20 1:50 AM, Niek Linnenbank wrote:
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
> ---
>   hw/arm/orangepi.c    | 93 ++++++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS          |  1 +
>   hw/arm/Makefile.objs |  2 +-
>   3 files changed, 95 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/orangepi.c
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

I'd move this check earlier, eventually between the bios/cpu checks.

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
>   S: Maintained
>   F: hw/*/allwinner-h3*
>   F: include/hw/*/allwinner-h3*
> +F: hw/arm/orangepi.c
>  =20
>   ARM PrimeCell and CMSDK devices
>   M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index ae577e875f..534a6a119e 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -35,7 +35,7 @@ obj-$(CONFIG_DIGIC) +=3D digic.o
>   obj-$(CONFIG_OMAP) +=3D omap1.o omap2.o
>   obj-$(CONFIG_STRONGARM) +=3D strongarm.o
>   obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubieboard.o
> -obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o
> +obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o orangepi.o
>   obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836.o raspi.o
>   obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
>   obj-$(CONFIG_STM32F405_SOC) +=3D stm32f405_soc.o
>=20

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

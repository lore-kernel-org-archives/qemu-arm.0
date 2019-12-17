Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5639148lff;
        Mon, 16 Dec 2019 23:31:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqzyLviKP6lIRWnX4cL3gwP1eQK5pGvQd9WQWBBsods8ZxytJMGzEVNp2wDzkicjNsxE78Ee
X-Received: by 2002:a05:620a:1fa:: with SMTP id x26mr3548483qkn.311.1576567909074;
        Mon, 16 Dec 2019 23:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576567909; cv=none;
        d=google.com; s=arc-20160816;
        b=1FPBRaRibAQXaeZFEAyg/lCfH9I9f2k6G7k17O3coXaq9iAkY3yc/2BV1fz1oJBoJT
         OZFDUdViYob1S7l6TsM6AGa54MzaBYPFYCUJxN5BLy4zVb6x+AxapW9K9CJAjN28A0T0
         4ShWubvwXiDgnq1sfMUUqUm7+57ykZX0ntPofhHB3G/ZoYHpzeikSf7Bp8QTJog6Gt5S
         ulCpDl4/GutDddyT+rzvL+tt+2X0NiKQhauntk2HIImDvBYwWwe1fDUa7mU7RdKPojVx
         wamXHCKmByxRZdbxWA7HTz3SH136J2hAw7u1AwGKdLAuG+kmXwYrKRG2fNXNlQmRWHeA
         qJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=YWv0Llfn7dROsegtFFeCrO56Iky73i9iWCS3NkUK/BI=;
        b=AgG7XL6tEF/tnYWwZhM3V7dynJXzzyj2A5xJX51kr4Yzol3Uf2kSOJQ2RnVz2Ioz56
         gGrbKeLROEv7LVKHH6FzXtK49FyE1tjc6y7rzVb/4JVoO2jSe7PVpkHhVd+Rej6DmIFE
         fBb1wB3tChZzJX6cOYK4zgYFTWqUmG5vZ5LTLrTg/u5my0deNTFanF9e5ZgakmgGvdft
         Nt5C0kiYjCVV7eapMhf3YUcYOK8edWF0UNrdSWVA2rsy6U+A5sQRTsmEL5FOgNzHVNUA
         sb2zgXui3g+TgTu+0dEFPN2RNUpUAKd3K2A1aL0dP2HyOYHxR74SQyvhxgX92e2lv82S
         TQOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QUVxa81j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19si10879081qtp.51.2019.12.16.23.31.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2019 23:31:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QUVxa81j;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ih7Ke-0001mI-BX
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 02:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37619)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ih7KU-0001m5-8a
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 02:31:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ih7KQ-0007zL-BJ
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 02:31:36 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:57803
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ih7KP-0007vB-TI
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 02:31:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576567892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWv0Llfn7dROsegtFFeCrO56Iky73i9iWCS3NkUK/BI=;
 b=QUVxa81jTnV9S6YBTCsR3VLMmghHp0bkvj7DiNTxPV5nVZ75BDL8+N3pTAEDpYupf5ryw6
 7VS1WE1vZo6rmppTIK2ZLkBhigpJgqngFfsIO8H1PXWs7fGJLEMpxg98BzttqGPHTUOPt9
 GnKGGkJNk2AeTW0BJl07OsRW5n2yqB0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-ZB4KCPvSMpmAvob2LVA5qw-1; Tue, 17 Dec 2019 02:31:30 -0500
Received: by mail-wr1-f70.google.com with SMTP id r2so4968288wrp.7
 for <qemu-arm@nongnu.org>; Mon, 16 Dec 2019 23:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+/p5mxZm9f6iZxjoybYRbCKaEHdIIuhPPwXkJHaaYUQ=;
 b=cfiboP80RyC1Za08eWXNgM54PB7oiCDwuyEhyRhuawaDn1Y+Hkoqqd1jMIWlpKvUFW
 9/L91sMKSJt2o1TUIu5EGSihgZP3Xzj1xl6DSGicue2CcFnaqKozftwJzcALjZIg2M3L
 MPYGL/kQF3rTn7OMK/laGDAuquHcbBY84n5C3ccR6cRkMxiqAWEAlyNeKYGS5E15q0dR
 ZYAPy2lUm1y9tJaxNgHuaOo191Z9puM5bu6qvcCn48CutV5mXgOkC0wP3cnL3ZCvXbEr
 5DMCm85ghkLbeV1zHChXajJghz56gyjr+o0PGpUyFH+FTwweEX4tc3znGOSTNFVqCo7o
 t7xA==
X-Gm-Message-State: APjAAAWz4XmOO+Zxy2KN3q2/mgHfB/DR20csWBKJYE0atmI3E7N8ZbxZ
 IAiDfCe55EuwArJ5Y658ALp/zPiA6biTUk5uQ3JXpZdTUeldO7/mb9NhOcTBBZEFXOj145iXQrS
 GRp1+l25Qb159
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr34322294wro.375.1576567889609; 
 Mon, 16 Dec 2019 23:31:29 -0800 (PST)
X-Received: by 2002:adf:f1cb:: with SMTP id z11mr34322233wro.375.1576567888869; 
 Mon, 16 Dec 2019 23:31:28 -0800 (PST)
Received: from [192.168.1.35] (34.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.34])
 by smtp.gmail.com with ESMTPSA id t1sm1990179wma.43.2019.12.16.23.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 23:31:28 -0800 (PST)
Subject: Re: [PATCH v2 02/10] hw: arm: add Xunlong Orange Pi PC machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org
References: <20191216233519.29030-1-nieklinnenbank@gmail.com>
 <20191216233519.29030-3-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e66415e1-7dcc-9fa3-7ff3-6526087be799@redhat.com>
Date: Tue, 17 Dec 2019 08:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191216233519.29030-3-nieklinnenbank@gmail.com>
Content-Language: en-US
X-MC-Unique: ZB4KCPvSMpmAvob2LVA5qw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: otKEPhjJsx7D

Hi Niek,

On 12/17/19 12:35 AM, Niek Linnenbank wrote:
> The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
> based embedded computer with mainline support in both U-Boot
> and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
> 512MB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
> various other I/O. This commit add support for the Xunlong
> Orange Pi PC machine.
>=20
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Tested-by: KONRAD Frederic <frederic.konrad@adacore.com>
> ---
>   hw/arm/orangepi.c    | 101 +++++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS          |   1 +
>   hw/arm/Makefile.objs |   2 +-
>   3 files changed, 103 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/orangepi.c
>=20
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> new file mode 100644
> index 0000000000..62cefc8c06
> --- /dev/null
> +++ b/hw/arm/orangepi.c
> @@ -0,0 +1,101 @@
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
> +#include "exec/address-spaces.h"
> +#include "qapi/error.h"
> +#include "cpu.h"
> +#include "hw/sysbus.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/arm/allwinner-h3.h"
> +
> +static struct arm_boot_info orangepi_binfo =3D {
> +    .board_id =3D -1,
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
> +    object_property_set_int(OBJECT(&s->h3->timer), 32768, "clk0-freq",
> +                            &error_abort);

You access the timer object which is contained inside the soc object,=20
but the soc isn't realized yet... I wonder if this is OK. Usually what=20
we do is, either:
- add a 'xtal-freq-hz' property to the SoC, set it here in the board,=20
then in soc::realize() set the property to the timer
- add an alias in the SoC to the timer 'freq-hz' property:
     object_property_add_alias(soc, "xtal-freq-hz", OBJECT(&s->timer),
                                    "freq-hz", &error_abort);

Also, if you use &error_abort, a failure in object_property_set_int()=20
triggers abort(). See "qapi/error.h":

  * If @errp is &error_abort, print a suitable message and abort().
  * If @errp is &error_fatal, print a suitable message and exit(1).

> +    if (error_abort !=3D NULL) {
> +        error_reportf_err(error_abort, "Couldn't set clk0 frequency: ");
> +        exit(1);
> +    }

So this if() block is useless.

> +
> +    object_property_set_int(OBJECT(&s->h3->timer), 24000000, "clk1-freq"=
,
> +                            &error_abort);
> +    if (error_abort !=3D NULL) {
> +        error_reportf_err(error_abort, "Couldn't set clk1 frequency: ");
> +        exit(1);
> +    }

Similarly, remove if() block.

> +
> +    /* Mark H3 object realized */
> +    object_property_set_bool(OBJECT(s->h3), true, "realized", &error_abo=
rt);
> +    if (error_abort !=3D NULL) {
> +        error_reportf_err(error_abort, "Couldn't realize Allwinner H3: "=
);
> +        exit(1);
> +    }

Similarly, remove if() block.

> +
> +    /* RAM */
> +    if (machine->ram_size > 1 * GiB) {
> +        error_report("Requested ram size is too large for this machine: =
"
> +                     "maximum is 1GB");

Per http://www.orangepi.org/orangepipc/ this board comes with a specific=20
amount of RAM. I'd enforce the default (1GiB) and refuse other cases.

I noticed this by testing your series, without specifying the memory=20
size you suggested in the cover (512) it defaults to 128 MiB, and the=20
Raspian userland fails:

[ ***  ] (2 of 4) A start job is running for=85Persistent Storage (37s /=20
2min 1s)
[  *** ] (2 of 4) A start job is running for=85Persistent Storage (38s /=20
2min 1s)
[  OK  ] Started Flush Journal to Persistent Storage.
Starting Create Volatile Files and Directories...
Starting Armbian ZRAM config...
[    **] (3 of 6) A start job is running for=85s and Directories (55s / no=
=20
limit)
[     *] (3 of 6) A start job is running for=85s and Directories (55s / no=
=20
limit)
[    **] (3 of 6) A start job is running for=85s and Directories (56s / no=
=20
limit)
[  OK  ] Started Create Volatile Files and Directories.
[***   ] (5 of 6) A start job is running for=85 ZRAM config (1min 10s /=20
1min 19s)
[**    ] (5 of 6) A start job is running for=85 ZRAM config (1min 12s /=20
1min 19s)
[*     ] (5 of 6) A start job is running for=85 ZRAM config (1min 13s /=20
1min 19s)
[FAILED] Failed to start Armbian ZRAM config.
See 'systemctl status armbian-zram-config.service' for details.

> +        exit(1);
> +    }
> +    memory_region_allocate_system_memory(&s->sdram, NULL, "orangepi.ram"=
,

There is only one type of ram on this machine, I'd simply name this "sdram"=
.

> +                                         machine->ram_size);
> +    memory_region_add_subregion(get_system_memory(), s->h3->memmap[AW_H3=
_SDRAM],
> +                                &s->sdram);
> +
> +    /* Load target kernel */
> +    orangepi_binfo.loader_start =3D s->h3->memmap[AW_H3_SDRAM];
> +    orangepi_binfo.ram_size =3D machine->ram_size;
> +    orangepi_binfo.nb_cpus  =3D AW_H3_NUM_CPUS;
> +    arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);

I wonder if we should tell the user '-bios' is not supported on this=20
machine.

> +}
> +
> +static void orangepi_machine_init(MachineClass *mc)
> +{
> +    mc->desc =3D "Orange Pi PC";
> +    mc->init =3D orangepi_init;
> +    mc->units_per_default_bus =3D 1;

Maybe "units_per_default_bus =3D 1" belongs to patch 9 "add SD/MMC host=20
controller".

> +    mc->min_cpus =3D AW_H3_NUM_CPUS;
> +    mc->max_cpus =3D AW_H3_NUM_CPUS;
> +    mc->default_cpus =3D AW_H3_NUM_CPUS;
> +    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a7");

Please add:

        mc->default_ram_size =3D 1 * GiB;

> +}
> +
> +DEFINE_MACHINE("orangepi-pc", orangepi_machine_init)
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aae1a049b4..db682e49ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -486,6 +486,7 @@ L: qemu-arm@nongnu.org
>   S: Maintained
>   F: hw/*/allwinner-h3*
>   F: include/hw/*/allwinner-h3*
> +F: hw/arm/orangepi.c
>  =20
>   ARM PrimeCell and CMSDK devices
>   M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 956e496052..8d5ea453d5 100644
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -34,7 +34,7 @@ obj-$(CONFIG_DIGIC) +=3D digic.o
>   obj-$(CONFIG_OMAP) +=3D omap1.o omap2.o
>   obj-$(CONFIG_STRONGARM) +=3D strongarm.o
>   obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubieboard.o
> -obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o
> +obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o orangepi.o
>   obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836.o raspi.o
>   obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
>   obj-$(CONFIG_XLNX_ZYNQMP_ARM) +=3D xlnx-zynqmp.o xlnx-zcu102.o
>=20


Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3276074lfp;
        Sun, 2 Feb 2020 14:47:48 -0800 (PST)
X-Received: by 2002:a5e:8417:: with SMTP id h23mr16257664ioj.17.1580683668052;
        Sun, 02 Feb 2020 14:47:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580683668; cv=none;
        d=google.com; s=arc-20160816;
        b=MaD6SSmnhzhr5zr1ckU8uF921N5rdrNvlVXcAvq4+uaH/aMmTCUZNzqcfCNuPzndwr
         t1NDmoEijEBL992nD2r88JjEQQEf8NpPdWlwAfzBTxOWuqJtsHOfxedN8pVVWRDhdXDN
         Y1OHd1qYULhYU7HvA5NJzUVzyxZrpFsvOWULrWIM0YtW97HkVuK6/ljgWgQwVR21UbKM
         eJJRUbtrj5a+C/KyHL64dKDdKAmn+/HeWDBzfZGnCkf6HUlEHwfCOHXeC9DtWO97WMct
         48RXDfu8uFcABDW2jJvRnzaOWHGTyfiCZKZYLbPMnuzgYUqlg0E6bQ5sMizX2RVfvWnp
         +4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gmCYa385pea/JeSMYrSTjZ6v3PvAilauHA5ORn8pv8o=;
        b=upMpVym/MD8OFjE7sArHDaStNmMY6vCWvTWHDKz3TqXGyNEPqP2p5Ez9M65rCcFrsl
         6kyY5iaigPcwVr9QRQ1elNp2Z8zoLisha484SmZG5eln7sqPmdxJhF0Q6+/xUtEtSNKY
         txqCuAb8j8cKwUbhJ0L+VwyBV0eHTIvXwMGhLHNXn+61UCZeDElvYoECtujZUQE1o2ne
         EMSulPBLVlSvPQlSEaMPhYSPbWYpVGz5Xh7EQlWikfRSuaEImWR/YKIwCjfoKWyeUbDn
         ukSrL38iimgeb2Kqt6qytmMi4Q/ath5JEM9idBE+qqeUkmdr58+q2hZG/suQQ4M7QAZD
         i84Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=it7s9jdW;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g3sor8808003iop.51.2020.02.02.14.47.47
        (Google Transport Security);
        Sun, 02 Feb 2020 14:47:48 -0800 (PST)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=it7s9jdW;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gmCYa385pea/JeSMYrSTjZ6v3PvAilauHA5ORn8pv8o=;
        b=it7s9jdWwRXvN02qA0jDTNQiZhK+R+KHxqIB+MSslq8fYqk2fa1XJWFMAN0H57sSjl
         FC9LLW3Dnf9/3/ecwyPSsMK6J0G1dmZZ/cAQn+n0bjbJhO/V18m2O1EH95KC/KAV1fQY
         jSawnCI0cNA1uDCwHzKRHpzxrN5WtqPPcpPntf1HQehR4sssxUBI4K6nn7MPm7DaVuaR
         d/sXmJ2r25YTRSIXLFb7ZPg0Mn/GWScSu81dSoIWZ83yeb85WxBfQ21Kxn9+o3V6FsNk
         fFvqFAPH5XMo1RER4o9EJ6i3cBP8SOYg/TTFMJ13mGy4Ui649+t9ng6U7LEX5R/4drDN
         AxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gmCYa385pea/JeSMYrSTjZ6v3PvAilauHA5ORn8pv8o=;
        b=n0jRm/pZNKSJ3X2EUeP5Dts8vQmToxDfs7wteN6nJibdsXdvOc6+Ddduthzfp9+8Q+
         p+JIuNUa4pdqwFZ0qDIzm0flFGLOkGZ4Kf03FS3jqBtrFBqNIW0SK9LvvKnBWSTclIF5
         elDWYsJ+04mqqPRNBkqpUJeufaeynx1NmGXGFKDrvzkUsYW5lZVjuzMsGDCx6JpDljOi
         CHmynBBnt5EYD0lCdWpHkuTQ04MrFuEuHlT1lydJZwdPHS9s5a7Q8M5wpkx/GMRQnbX7
         fqqayGzmZHcrX2P0pis5jWLiXwIZU3iN3syQth/dvmt9LMivjZLR/mCrR587nh7AgvnY
         Vjuw==
X-Gm-Message-State: APjAAAWO2vqtCcDhT62XMr9MLKn5PP69GqUyo9xjENedNI/xoBNtvgBO
	YfUk9vHWh/CAE+1MQG1LUkP8GocE9hKsoYzlZVM=
X-Google-Smtp-Source: APXvYqzjnil2mUx36k1nhQolNCE4agoeA7CjWxWPCL8GLErprQTXx24No+vHzazZJ97lXZTp30iKq+epWaR2qGT+DUM=
X-Received: by 2002:a6b:6f01:: with SMTP id k1mr17100672ioc.28.1580683667515;
 Sun, 02 Feb 2020 14:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-3-nieklinnenbank@gmail.com> <6dd9ce64-8126-2849-fcf1-fff71582b8f9@redhat.com>
In-Reply-To: <6dd9ce64-8126-2849-fcf1-fff71582b8f9@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sun, 2 Feb 2020 23:47:36 +0100
Message-ID: <CAPan3WouMvrNq+5gN5Ja3wQVSBMBWxUC0qtdnisjHxMyBB2aMQ@mail.gmail.com>
Subject: Re: [PATCH v4 02/20] hw/arm: add Xunlong Orange Pi PC machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Beniamino Galvani <b.galvani@gmail.com>, jasowang@redhat.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000812d24059d9f98ad"
X-TUID: Tfu+ka0iwOM/

--000000000000812d24059d9f98ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 19, 2020 at 7:04 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 1/19/20 1:50 AM, Niek Linnenbank wrote:
> > The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
> > based embedded computer with mainline support in both U-Boot
> > and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
> > 1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
> > various other I/O. This commit add support for the Xunlong
> > Orange Pi PC machine.
> >
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > Tested-by: KONRAD Frederic <frederic.konrad@adacore.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >   hw/arm/orangepi.c    | 93 +++++++++++++++++++++++++++++++++++++++++++=
+
> >   MAINTAINERS          |  1 +
> >   hw/arm/Makefile.objs |  2 +-
> >   3 files changed, 95 insertions(+), 1 deletion(-)
> >   create mode 100644 hw/arm/orangepi.c
> >
> > diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> > new file mode 100644
> > index 0000000000..866f5f7cd6
> > --- /dev/null
> > +++ b/hw/arm/orangepi.c
> > @@ -0,0 +1,93 @@
> > +/*
> > + * Orange Pi emulation
> > + *
> > + * Copyright (C) 2019 Niek Linnenbank <nieklinnenbank@gmail.com>
> > + *
> > + * This program is free software: you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation, either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/units.h"
> > +#include "exec/address-spaces.h"
> > +#include "qapi/error.h"
> > +#include "cpu.h"
> > +#include "hw/sysbus.h"
> > +#include "hw/boards.h"
> > +#include "hw/qdev-properties.h"
> > +#include "hw/arm/allwinner-h3.h"
> > +#include "sysemu/sysemu.h"
> > +
> > +static struct arm_boot_info orangepi_binfo =3D {
> > +    .nb_cpus =3D AW_H3_NUM_CPUS,
> > +};
> > +
> > +typedef struct OrangePiState {
> > +    AwH3State *h3;
> > +    MemoryRegion sdram;
> > +} OrangePiState;
> > +
> > +static void orangepi_init(MachineState *machine)
> > +{
> > +    OrangePiState *s =3D g_new(OrangePiState, 1);
> > +
> > +    /* BIOS is not supported by this board */
> > +    if (bios_name) {
> > +        error_report("BIOS not supported for this machine");
> > +        exit(1);
> > +    }
> > +
> > +    /* Only allow Cortex-A7 for this board */
> > +    if (strcmp(machine->cpu_type, ARM_CPU_TYPE_NAME("cortex-a7")) !=3D=
 0)
> {
> > +        error_report("This board can only be used with cortex-a7 CPU")=
;
> > +        exit(1);
> > +    }
> > +
> > +    s->h3 =3D AW_H3(object_new(TYPE_AW_H3));
> > +
> > +    /* Setup timer properties */
> > +    object_property_set_int(OBJECT(s->h3), 32768, "clk0-freq",
> > +                            &error_abort);
> > +    object_property_set_int(OBJECT(s->h3), 24 * 1000 * 1000,
> "clk1-freq",
> > +                            &error_abort);
> > +
> > +    /* Mark H3 object realized */
> > +    object_property_set_bool(OBJECT(s->h3), true, "realized",
> &error_abort);
> > +
> > +    /* SDRAM */
> > +    if (machine->ram_size !=3D 1 * GiB) {
> > +        error_report("This machine can only be used with 1GiB of RAM")=
;
> > +        exit(1);
> > +    }
>
> I'd move this check earlier, eventually between the bios/cpu checks.
>

Sure, I'll move it between the bios/cpu checks.

Regards,
Niek


>
> > +    memory_region_allocate_system_memory(&s->sdram, NULL, "sdram",
> > +                                         machine->ram_size);
> > +    memory_region_add_subregion(get_system_memory(),
> s->h3->memmap[AW_H3_SDRAM],
> > +                                &s->sdram);
> > +
> > +    orangepi_binfo.loader_start =3D s->h3->memmap[AW_H3_SDRAM];
> > +    orangepi_binfo.ram_size =3D machine->ram_size;
> > +    arm_load_kernel(ARM_CPU(first_cpu), machine, &orangepi_binfo);
> > +}
> > +
> > +static void orangepi_machine_init(MachineClass *mc)
> > +{
> > +    mc->desc =3D "Orange Pi PC";
> > +    mc->init =3D orangepi_init;
> > +    mc->min_cpus =3D AW_H3_NUM_CPUS;
> > +    mc->max_cpus =3D AW_H3_NUM_CPUS;
> > +    mc->default_cpus =3D AW_H3_NUM_CPUS;
> > +    mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a7");
> > +    mc->default_ram_size =3D 1 * GiB;
> > +}
> > +
> > +DEFINE_MACHINE("orangepi-pc", orangepi_machine_init)
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 225582704d..e99797eec9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -487,6 +487,7 @@ L: qemu-arm@nongnu.org
> >   S: Maintained
> >   F: hw/*/allwinner-h3*
> >   F: include/hw/*/allwinner-h3*
> > +F: hw/arm/orangepi.c
> >
> >   ARM PrimeCell and CMSDK devices
> >   M: Peter Maydell <peter.maydell@linaro.org>
> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > index ae577e875f..534a6a119e 100644
> > --- a/hw/arm/Makefile.objs
> > +++ b/hw/arm/Makefile.objs
> > @@ -35,7 +35,7 @@ obj-$(CONFIG_DIGIC) +=3D digic.o
> >   obj-$(CONFIG_OMAP) +=3D omap1.o omap2.o
> >   obj-$(CONFIG_STRONGARM) +=3D strongarm.o
> >   obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubieboard.o
> > -obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o
> > +obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o orangepi.o
> >   obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836.o raspi.o
> >   obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o
> >   obj-$(CONFIG_STM32F405_SOC) +=3D stm32f405_soc.o
> >
>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
>
--=20
Niek Linnenbank

--000000000000812d24059d9f98ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 19, 2020 at 7:04 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On 1/19/20 1:50 AM, Niek Linnenbank wrote:<br>
&gt; The Xunlong Orange Pi PC is an Allwinner H3 System on Chip<br>
&gt; based embedded computer with mainline support in both U-Boot<br>
&gt; and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,<br>
&gt; 1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and<br>
&gt; various other I/O. This commit add support for the Xunlong<br>
&gt; Orange Pi PC machine.<br>
&gt; <br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; Tested-by: KONRAD Frederic &lt;<a href=3D"mailto:frederic.konrad@adaco=
re.com" target=3D"_blank">frederic.konrad@adacore.com</a>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@=
redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/arm/orangepi.c=C2=A0 =C2=A0 | 93 ++++++++++++++++++++++=
++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<=
br>
&gt;=C2=A0 =C2=A0hw/arm/Makefile.objs |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 95 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 hw/arm/orangepi.c<br>
&gt; <br>
&gt; diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..866f5f7cd6<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/arm/orangepi.c<br>
&gt; @@ -0,0 +1,93 @@<br>
&gt; +/*<br>
&gt; + * Orange Pi emulation<br>
&gt; + *<br>
&gt; + * Copyright (C) 2019 Niek Linnenbank &lt;<a href=3D"mailto:nieklinne=
nbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software: you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License as published =
by<br>
&gt; + * the Free Software Foundation, either version 2 of the License, or<=
br>
&gt; + * (at your option) any later version.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qemu/units.h&quot;<br>
&gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;cpu.h&quot;<br>
&gt; +#include &quot;hw/sysbus.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt; +#include &quot;hw/qdev-properties.h&quot;<br>
&gt; +#include &quot;hw/arm/allwinner-h3.h&quot;<br>
&gt; +#include &quot;sysemu/sysemu.h&quot;<br>
&gt; +<br>
&gt; +static struct arm_boot_info orangepi_binfo =3D {<br>
&gt; +=C2=A0 =C2=A0 .nb_cpus =3D AW_H3_NUM_CPUS,<br>
&gt; +};<br>
&gt; +<br>
&gt; +typedef struct OrangePiState {<br>
&gt; +=C2=A0 =C2=A0 AwH3State *h3;<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion sdram;<br>
&gt; +} OrangePiState;<br>
&gt; +<br>
&gt; +static void orangepi_init(MachineState *machine)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 OrangePiState *s =3D g_new(OrangePiState, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* BIOS is not supported by this board */<br>
&gt; +=C2=A0 =C2=A0 if (bios_name) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;BIOS not supported for=
 this machine&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Only allow Cortex-A7 for this board */<br>
&gt; +=C2=A0 =C2=A0 if (strcmp(machine-&gt;cpu_type, ARM_CPU_TYPE_NAME(&quo=
t;cortex-a7&quot;)) !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;This board can only be=
 used with cortex-a7 CPU&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s-&gt;h3 =3D AW_H3(object_new(TYPE_AW_H3));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Setup timer properties */<br>
&gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(s-&gt;h3), 32768, &quot;=
clk0-freq&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; +=C2=A0 =C2=A0 object_property_set_int(OBJECT(s-&gt;h3), 24 * 1000 * 1=
000, &quot;clk1-freq&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_abort);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Mark H3 object realized */<br>
&gt; +=C2=A0 =C2=A0 object_property_set_bool(OBJECT(s-&gt;h3), true, &quot;=
realized&quot;, &amp;error_abort);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* SDRAM */<br>
&gt; +=C2=A0 =C2=A0 if (machine-&gt;ram_size !=3D 1 * GiB) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;This machine can only =
be used with 1GiB of RAM&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
I&#39;d move this check earlier, eventually between the bios/cpu checks.<br=
></blockquote><div><br></div><div>Sure, I&#39;ll move it between the bios/c=
pu checks.</div><div><br></div><div>Regards,</div><div>Niek<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 memory_region_allocate_system_memory(&amp;s-&gt;sdram, =
NULL, &quot;sdram&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0machine-&gt;ram_size);<br>
&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(get_system_memory(), s-&gt;=
h3-&gt;memmap[AW_H3_SDRAM],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;s-&gt;sdram);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 orangepi_binfo.loader_start =3D s-&gt;h3-&gt;memmap[AW_=
H3_SDRAM];<br>
&gt; +=C2=A0 =C2=A0 orangepi_binfo.ram_size =3D machine-&gt;ram_size;<br>
&gt; +=C2=A0 =C2=A0 arm_load_kernel(ARM_CPU(first_cpu), machine, &amp;orang=
epi_binfo);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void orangepi_machine_init(MachineClass *mc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;Orange Pi PC&quot;;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;init =3D orangepi_init;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;min_cpus =3D AW_H3_NUM_CPUS;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;max_cpus =3D AW_H3_NUM_CPUS;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;default_cpus =3D AW_H3_NUM_CPUS;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;default_cpu_type =3D ARM_CPU_TYPE_NAME(&quot;cor=
tex-a7&quot;);<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;default_ram_size =3D 1 * GiB;<br>
&gt; +}<br>
&gt; +<br>
&gt; +DEFINE_MACHINE(&quot;orangepi-pc&quot;, orangepi_machine_init)<br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 225582704d..e99797eec9 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -487,6 +487,7 @@ L: <a href=3D"mailto:qemu-arm@nongnu.org" target=
=3D"_blank">qemu-arm@nongnu.org</a><br>
&gt;=C2=A0 =C2=A0S: Maintained<br>
&gt;=C2=A0 =C2=A0F: hw/*/allwinner-h3*<br>
&gt;=C2=A0 =C2=A0F: include/hw/*/allwinner-h3*<br>
&gt; +F: hw/arm/orangepi.c<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0ARM PrimeCell and CMSDK devices<br>
&gt;=C2=A0 =C2=A0M: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs<br>
&gt; index ae577e875f..534a6a119e 100644<br>
&gt; --- a/hw/arm/Makefile.objs<br>
&gt; +++ b/hw/arm/Makefile.objs<br>
&gt; @@ -35,7 +35,7 @@ obj-$(CONFIG_DIGIC) +=3D digic.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_OMAP) +=3D omap1.o omap2.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_STRONGARM) +=3D strongarm.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_ALLWINNER_A10) +=3D allwinner-a10.o cubieboar=
d.o<br>
&gt; -obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o<br>
&gt; +obj-$(CONFIG_ALLWINNER_H3) +=3D allwinner-h3.o orangepi.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_RASPI) +=3D bcm2835_peripherals.o bcm2836.o r=
aspi.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_STM32F205_SOC) +=3D stm32f205_soc.o<br>
&gt;=C2=A0 =C2=A0obj-$(CONFIG_STM32F405_SOC) +=3D stm32f405_soc.o<br>
&gt; <br>
<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.=
com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
<br>
</blockquote></div><div><br>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></div></div></d=
iv>

--000000000000812d24059d9f98ad--

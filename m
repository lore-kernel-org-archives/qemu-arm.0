Received: by 10.25.0.6 with SMTP id 6csp1250349lfa;
        Sun, 28 May 2017 22:26:56 -0700 (PDT)
X-Received: by 10.55.161.209 with SMTP id k200mr835647qke.28.1496035616394;
        Sun, 28 May 2017 22:26:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496035616; cv=none;
        d=google.com; s=arc-20160816;
        b=j1fSGMZo2gvwffL9qmhRR2VFuolM15BXQX1JKjmsq2zKtw/SqR8DKM3qDmX4QVLvxu
         TJm2CZdLss4apWaWZEWEhSjmXoo+GLuGixbcMkvaYe9xz7RW98Y81UKh/v0PLmiSNEIk
         2WcLa3YNHk9s6caL0Mzmky1yzlGZ1t0AwrZQIy/08sV8OZxlvvB4B1xc5sVMmCY3uzsv
         mcOu9UQdWlRtQc3xxAG72uvMyDbq0sfMdA/acwGwkXGrxlEVdZIrakFVx9ZXsgtaWdvG
         IqPsPYWrfs3j62ipgPH4T1sLuPqpLBSRBZLc9EUvxAJQOAbW53gWjDQHfiWyoIgxsI4c
         FKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OXCLWAaLGoFRn5/7XtPrSdzs7zrn20iyJZDUMzemU/Y=;
        b=gwJkQPhPsSmS99QyIaxFoLALG0OfAHpLgdHOjkEZ3rrc9KOjhL+rLlDbotS1BeHk2+
         hMSOgVG8tJXb2eCZc2sET5AeL7R8gAZCkbRAKQnedf89FTJP6zcN6u3C9kziZX0lwmk5
         loX1kpKVe4bKrz/vtKGEndWOtqPBY4/rBC/oxZIBHR9FdmsO6qpDw9H/C1nVtnFFgwVD
         hv0CT6B9lDeiF29ZueNq4XLJte6L860SIDXEh3akGqSlYxNax45tFsAgSMosY+girD08
         pA0WwE9rH6xLZefPrh3/z8GQlrDmHoGmPACiRJ+x3der0jT+xzwtAupb6LSIss8KaOBl
         8bCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14si8478752qte.15.2017.05.28.22.26.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 28 May 2017 22:26:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFDCh-0002j2-18
	for alex.bennee@linaro.org; Mon, 29 May 2017 01:26:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dFDCb-0002h5-UZ
	for qemu-arm@nongnu.org; Mon, 29 May 2017 01:26:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dFDCa-0001Lf-Av
	for qemu-arm@nongnu.org; Mon, 29 May 2017 01:26:49 -0400
Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244]:35479)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dFDCW-0001LE-0B; Mon, 29 May 2017 01:26:44 -0400
Received: by mail-yw0-x244.google.com with SMTP id p144so3845934ywp.2;
	Sun, 28 May 2017 22:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OXCLWAaLGoFRn5/7XtPrSdzs7zrn20iyJZDUMzemU/Y=;
	b=WUl75JrjNMbbv/sPpC+MCgyk0kVaPzZksvqaCGTJxIeqkfUZYX4Getp2/bhZ5BYLcd
	lVTQNIpW5iVZQr/92wRSvXq6hXKxTyDW7ir82vTdvwLr316qoUaipArA71kgNJ8zPQdf
	W7nzT8gwt2AefR9UvoJp4733AxJGm1bfi9qC7wFVs52olTpsHuSAy4sy2k3LlIDrG42U
	f8NpvCFLdcklbf4mzsgMd/fBMwnZJZOSRyfZwp9I8Uxs6xHoDJks9VXf+MKqekiWV8DE
	KbR9nPbuZ4S/bXp1k0idCCuSdRNkEujNywZZqH1LazbyllWyF9X/AcGK8MAxX7vstb0F
	pNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OXCLWAaLGoFRn5/7XtPrSdzs7zrn20iyJZDUMzemU/Y=;
	b=suD+r7L6Bab3UHNYY+EQqdRvAfzcZwQXEMh6h23B+Mg6nBs4vKkxL4UuXgJqqTHydF
	uc6w2Nj81w6lVAIFEHGfglhCuXeoNxcB/xdk16nQdy4yggnKXoO6trCCg2rljKa7alP6
	TaIg0p+vsjLO2V/1qSLu4Ukh7K20OQE6m3XIP3VlFX6w5FLc8xfPix/tPYcL2WpSw+QA
	j5RGDi4/XPTf/jCjJDhkyO6HbDMSNxdH6hFEv3eLV50GXKqvbNRmzz382PKnEF8LnzgR
	ksT1VNsU5H/JTAVL93b3AJ7CeMiNzzgh7EtEE8y+1TViUg/QfCQ7NUMjz6F5X+JNZyDd
	QPig==
X-Gm-Message-State: AODbwcB203tyMa0dBku+bK5iTQwClUZq+ACIwlwTVYbf+/ztjIajY1ie
	uFQDdBLZyRW0MW4TGowV8+FXvgO5hw==
X-Received: by 10.13.201.193 with SMTP id l184mr11414817ywd.151.1496035603225; 
	Sun, 28 May 2017 22:26:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.195 with HTTP; Sun, 28 May 2017 22:26:42 -0700 (PDT)
In-Reply-To: <CAKmqyKPwRaXsgcuGC28x_pA9CYA-tcCnSBGNX1Qv3d3cXX8rsg@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPwRaXsgcuGC28x_pA9CYA-tcCnSBGNX1Qv3d3cXX8rsg@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 29 May 2017 10:56:42 +0530
Message-ID: <CALHRZupvtuE7oVdPa+kpaxP+ZrkHNzdJJV+fJq9nW1nHKX=5OA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="001a114e68aab3b9fb0550a2ee79"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::244
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 52pJ/2DQFiJy

--001a114e68aab3b9fb0550a2ee79
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

On Sat, May 27, 2017 at 5:30 AM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep
> <sundeep.lkml@gmail.com> wrote:
> > Emulated Emcraft's Smartfusion2 System On Module starter
> > kit.
> >
> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > ---
> >  hw/arm/Makefile.objs |  1 +
> >  hw/arm/msf2-som.c    | 89 ++++++++++++++++++++++++++++++
> ++++++++++++++++++++++
> >  2 files changed, 90 insertions(+)
> >  create mode 100644 hw/arm/msf2-som.c
> >
> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> > index c828061..4b02093 100644
> > --- a/hw/arm/Makefile.objs
> > +++ b/hw/arm/Makefile.objs
> > @@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o stellaris.o
> >  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
> >  obj-$(CONFIG_ACPI) += virt-acpi-build.o
> >  obj-y += netduino2.o
> > +obj-y += msf2-som.o
>
> This should be obj-$(CONFIG_MSF2).
>

Ok will change it.

>
> >  obj-y += sysbus-fdt.o
> >
> >  obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
> > diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> > new file mode 100644
> > index 0000000..cd2b759
> > --- /dev/null
> > +++ b/hw/arm/msf2-som.c
> > @@ -0,0 +1,89 @@
> > +/*
> > + * SmartFusion2 SOM starter kit(from Emcraft) emulation.
> > + *
> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> obtaining a copy
> > + * of this software and associated documentation files (the
> "Software"), to deal
> > + * in the Software without restriction, including without limitation
> the rights
> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell
> > + * copies of the Software, and to permit persons to whom the Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be
> included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> ARISING FROM,
> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> DEALINGS IN
> > + * THE SOFTWARE.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "hw/boards.h"
> > +#include "hw/arm/msf2-soc.h"
> > +#include "hw/arm/arm.h"
> > +#include "exec/address-spaces.h"
> > +
> > +#define DDR_BASE_ADDRESS      0xA0000000
> > +#define DDR_SIZE              (64 * M_BYTE)
> > +
> > +static void emcraft_sf2_init(MachineState *machine)
> > +{
> > +    DeviceState *dev;
> > +    DeviceState *spi_flash;
> > +    MSF2State *soc;
> > +    DriveInfo *dinfo = drive_get_next(IF_MTD);
> > +    qemu_irq cs_line;
> > +    SSIBus *spi_bus;
> > +    MemoryRegion *sysmem = get_system_memory();
> > +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
> > +
> > +    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
> > +                           &error_fatal);
> > +    vmstate_register_ram_global(ddr);
> > +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
>
> The user can use -m to specify the amount of RAM to create in the
> machine. Unless this board only ever includes 64MB of RAM you should
> use that option (you will need to sanity check it though). If the
> board only ever has 64MB it might be worth printing a warning to the
> user if they specify an something. Although there might be a default
> if they don't use -m, which makes it hard to print out a warning
> message.
>

This -m confuses me. Why is it necessary for an embedded board? RAM chip
is fixed and not extendable. Whereas normal PC may have extra RAM slots.
If another board has more RAM then we would instantiate another machine for
it
with that RAM size. Please explain. Maybe I am thinking in wrong direction.

Thanks,
Sundeep

>
> > +
> > +    dev = qdev_create(NULL, TYPE_MSF2_SOC);
> > +    qdev_prop_set_string(dev, "part-name", "M2S010");
> > +    qdev_prop_set_uint64(dev, "eNVM-size", M2S010_ENVM_SIZE);
> > +    qdev_prop_set_uint64(dev, "eSRAM-size", M2S010_ESRAM_SIZE);
> > +
> > +    /*
> > +     * pclk0 and pclk1 are configurable in Libero.
> > +     * Emcraft's SoM kit comes with these settings by default.
> > +     */
> > +    qdev_prop_set_uint32(dev, "pclk0", 71 * 1000000);
> > +    qdev_prop_set_uint32(dev, "pclk1", 71 * 1000000);
> > +
> > +    object_property_set_bool(OBJECT(dev), true, "realized",
> &error_fatal);
> > +
> > +    soc = MSF2_SOC(dev);
> > +
> > +    /* Attach SPI flash to SPI0 controller */
> > +    spi_bus = (SSIBus *)qdev_get_child_bus(dev, "spi0");
> > +    spi_flash = ssi_create_slave_no_init(spi_bus, "s25sl12801");
> > +    qdev_prop_set_uint8(spi_flash, "spansion-cr2nv", 1);
> > +    if (dinfo) {
> > +        qdev_prop_set_drive(spi_flash, "drive",
> blk_by_legacy_dinfo(dinfo),
> > +                                    &error_fatal);
> > +    }
> > +    qdev_init_nofail(spi_flash);
>
> Can you just set realized instead?
>

Ok I will check and change.

Thanks,
Sundeep


>
> Thanks,
> Alistair
>
> > +    cs_line = qdev_get_gpio_in_named(spi_flash, SSI_GPIO_CS, 0);
> > +    sysbus_connect_irq(SYS_BUS_DEVICE(&soc->spi[0]), 1, cs_line);
> > +
> > +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> > +                       soc->envm_size);
> > +}
> > +
> > +static void emcraft_sf2_machine_init(MachineClass *mc)
> > +{
> > +    mc->desc = "SmartFusion2 SOM kit from Emcraft";
> > +    mc->init = emcraft_sf2_init;
> > +}
> > +
> > +DEFINE_MACHINE("smartfusion2-som", emcraft_sf2_machine_init)
> > --
> > 2.5.0
> >
>

--001a114e68aab3b9fb0550a2ee79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Sat, May 27, 2017 at 5:30 AM, Alistair Francis <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair=
23@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span =
class=3D"">On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep<br>
&lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt=
; wrote:<br>
&gt; Emulated Emcraft&#39;s Smartfusion2 System On Module starter<br>
&gt; kit.<br>
&gt;<br>
&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep.lkml@gm=
ail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/Makefile.objs |=C2=A0 1 +<br>
&gt;=C2=A0 hw/arm/msf2-som.c=C2=A0 =C2=A0 | 89 ++++++++++++++++++++++++++++=
++<wbr>++++++++++++++++++++++<br>
&gt;=C2=A0 2 files changed, 90 insertions(+)<br>
&gt;=C2=A0 create mode 100644 hw/arm/msf2-som.c<br>
&gt;<br>
&gt; diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs<br>
&gt; index c828061..4b02093 100644<br>
&gt; --- a/hw/arm/Makefile.objs<br>
&gt; +++ b/hw/arm/Makefile.objs<br>
&gt; @@ -5,6 +5,7 @@ obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stella=
ris.o<br>
&gt;=C2=A0 obj-y +=3D tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o =
z2.o<br>
&gt;=C2=A0 obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o<br>
&gt;=C2=A0 obj-y +=3D netduino2.o<br>
&gt; +obj-y +=3D msf2-som.o<br>
<br>
</span>This should be obj-$(CONFIG_MSF2).<br></blockquote><div><br></div><d=
iv>Ok will change it.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt;=C2=A0 obj-y +=3D sysbus-fdt.o<br>
&gt;<br>
&gt;=C2=A0 obj-y +=3D armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_p=
ic.o<br>
&gt; diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..cd2b759<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/arm/msf2-som.c<br>
&gt; @@ -0,0 +1,89 @@<br>
&gt; +/*<br>
&gt; + * SmartFusion2 SOM starter kit(from Emcraft) emulation.<br>
&gt; + *<br>
&gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailto:sundeep=
.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy<br>
&gt; + * of this software and associated documentation files (the &quot;Sof=
tware&quot;), to deal<br>
&gt; + * in the Software without restriction, including without limitation =
the rights<br>
&gt; + * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell<br>
&gt; + * copies of the Software, and to permit persons to whom the Software=
 is<br>
&gt; + * furnished to do so, subject to the following conditions:<br>
&gt; + *<br>
&gt; + * The above copyright notice and this permission notice shall be inc=
luded in<br>
&gt; + * all copies or substantial portions of the Software.<br>
&gt; + *<br>
&gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF AN=
Y KIND, EXPRESS OR<br>
&gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL<br>
&gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER<br>
&gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,<br>
&gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN<br>
&gt; + * THE SOFTWARE.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt; +#include &quot;qapi/error.h&quot;<br>
&gt; +#include &quot;hw/boards.h&quot;<br>
&gt; +#include &quot;hw/arm/msf2-soc.h&quot;<br>
&gt; +#include &quot;hw/arm/arm.h&quot;<br>
&gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt; +<br>
&gt; +#define DDR_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A0 0xA0000000<br>
&gt; +#define DDR_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (64 =
* M_BYTE)<br>
&gt; +<br>
&gt; +static void emcraft_sf2_init(MachineState *machine)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt; +=C2=A0 =C2=A0 DeviceState *spi_flash;<br>
&gt; +=C2=A0 =C2=A0 MSF2State *soc;<br>
&gt; +=C2=A0 =C2=A0 DriveInfo *dinfo =3D drive_get_next(IF_MTD);<br>
&gt; +=C2=A0 =C2=A0 qemu_irq cs_line;<br>
&gt; +=C2=A0 =C2=A0 SSIBus *spi_bus;<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion *sysmem =3D get_system_memory();<br>
&gt; +=C2=A0 =C2=A0 MemoryRegion *ddr =3D g_new(MemoryRegion, 1);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 memory_region_init_ram(ddr, NULL, &quot;ddr-ram&quot;, =
DDR_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
&gt; +=C2=A0 =C2=A0 vmstate_register_ram_global(<wbr>ddr);<br>
&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>sysmem, DDR_BASE_ADDRE=
SS, ddr);<br>
<br>
</div></div>The user can use -m to specify the amount of RAM to create in t=
he<br>
machine. Unless this board only ever includes 64MB of RAM you should<br>
use that option (you will need to sanity check it though). If the<br>
board only ever has 64MB it might be worth printing a warning to the<br>
user if they specify an something. Although there might be a default<br>
if they don&#39;t use -m, which makes it hard to print out a warning<br>
message.<br></blockquote><div><br></div><div>This -m confuses me. Why is it=
 necessary for an embedded board? RAM chip</div><div>is fixed and not exten=
dable. Whereas normal PC may have extra RAM slots.</div><div>If another boa=
rd has more RAM then we would instantiate another machine for it=C2=A0</div=
><div>with that RAM size. Please explain. Maybe I am thinking in wrong dire=
ction.</div><div><br></div><div>Thanks,</div><div>Sundeep</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dev =3D qdev_create(NULL, TYPE_MSF2_SOC);<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_string(dev, &quot;part-name&quot;, &quot;=
M2S010&quot;);<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint64(dev, &quot;eNVM-size&quot;, M2S010=
_ENVM_SIZE);<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint64(dev, &quot;eSRAM-size&quot;, M2S01=
0_ESRAM_SIZE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* pclk0 and pclk1 are configurable in Libero.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Emcraft&#39;s SoM kit comes with these settings=
 by default.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;pclk0&quot;, 71 * 10000=
00);<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(dev, &quot;pclk1&quot;, 71 * 10000=
00);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 object_property_set_bool(<wbr>OBJECT(dev), true, &quot;=
realized&quot;, &amp;error_fatal);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 soc =3D MSF2_SOC(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Attach SPI flash to SPI0 controller */<br>
&gt; +=C2=A0 =C2=A0 spi_bus =3D (SSIBus *)qdev_get_child_bus(dev, &quot;spi=
0&quot;);<br>
&gt; +=C2=A0 =C2=A0 spi_flash =3D ssi_create_slave_no_init(spi_<wbr>bus, &q=
uot;s25sl12801&quot;);<br>
&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint8(spi_flash, &quot;spansion-cr2nv&quo=
t;, 1);<br>
&gt; +=C2=A0 =C2=A0 if (dinfo) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_drive(spi_flash, &quot;driv=
e&quot;, blk_by_legacy_dinfo(dinfo),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;error_fatal);=
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 qdev_init_nofail(spi_flash);<br>
<br>
</div></div>Can you just set realized instead?<br></blockquote><div><br></d=
iv><div>Ok I will check and change.</div><div><br></div><div>Thanks,</div><=
div>Sundeep</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Alistair<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 cs_line =3D qdev_get_gpio_in_named(spi_<wbr>flash, SSI_=
GPIO_CS, 0);<br>
&gt; +=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_<wbr>DEVICE(&amp;soc-&gt;spi=
[0]), 1, cs_line);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 armv7m_load_kernel(ARM_CPU(<wbr>first_cpu), machine-&gt=
;kernel_filename,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0soc-&gt;envm_size);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void emcraft_sf2_machine_init(<wbr>MachineClass *mc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;SmartFusion2 SOM kit from Emcraft=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;init =3D emcraft_sf2_init;<br>
&gt; +}<br>
&gt; +<br>
&gt; +DEFINE_MACHINE(&quot;smartfusion2-<wbr>som&quot;, emcraft_sf2_machine=
_init)<br>
&gt; --<br>
&gt; 2.5.0<br>
&gt;<br>
</div></div></blockquote></div><br></div></div>

--001a114e68aab3b9fb0550a2ee79--

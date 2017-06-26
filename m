Received: by 10.25.15.197 with SMTP id 66csp1467684lfp;
        Mon, 26 Jun 2017 09:02:14 -0700 (PDT)
X-Received: by 10.200.36.194 with SMTP id t2mr1274517qtt.147.1498492934091;
        Mon, 26 Jun 2017 09:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498492934; cv=none;
        d=google.com; s=arc-20160816;
        b=fQAyCqKsTBl2FGQLisZX8u1cLFZcjl00v/UeOpfL5vYS5nQnVD6yUfB+LofGkG5qfR
         GXBW9eSatjP/FeZDSqcgO4sycfFea59HdH5a+1XdhAUlsrcluwPzKy3hquHLfBb5UboX
         TVDWr3flIMZSJuHamnGjzCrkiu4rEar8T07rb/wjHaOutv+9tHbLFhZ+i6O5axMpxkQk
         QMD5feu08so36d8maRtg5Lj265WjUQNlRD6o2jMAQAEFBxaMrX3vZOQ5CnnF294cnsI0
         Cs1o/TtWd+Fp2Z86N0B77uFGF389LrWjjxLmKeEShgikjzXEfAXuUSs4keQx1mslAWJ+
         BNyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=LTedwvIlGWafVTMSJSjW41nfgOtFc6gNluxFjiZlrmY=;
        b=F0PmNQlnaQJ6cTgZdgsrWmqQH48avZ9mrNh33WTMbQVilZBvwprMAdoDSp6Rvp5uir
         BWlo8tvsfPxq30uhErdYcJk3i0yoPtY5LauJrZTE79hIB23Z/gVqSt8W/yw5DLsspg6J
         5aV5MF+hDtyuGbjXhcmrWQXfhYeJZPlVlm/t0YkKupKIesZ0hJIO+nTvJf2WpFwKnHTl
         nc/5Hrs5JTwYDtpAI/WCbdpOn84rPdSbGb//kR65C/EQazg4wjYvlUScFV6HONu9wB2X
         EKYnp7FTeZgdaDht/8q1kHAaa4EBUBrdYrbnofZvEmH3VcphkXIf1nI6dFeGuZ/acLtZ
         tBkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=aM1iXsqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 56si362678qtw.329.2017.06.26.09.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Jun 2017 09:02:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=aM1iXsqK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPWSp-0005dh-3r
	for alex.bennee@linaro.org; Mon, 26 Jun 2017 12:02:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dPWSf-0005ZR-4u
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 12:02:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dPWSd-00088Y-6l
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 12:02:01 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:34799)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dPWSY-00082L-BR; Mon, 26 Jun 2017 12:01:54 -0400
Received: by mail-yb0-x244.google.com with SMTP id b189so240532yba.1;
	Mon, 26 Jun 2017 09:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LTedwvIlGWafVTMSJSjW41nfgOtFc6gNluxFjiZlrmY=;
	b=aM1iXsqK/Utai0eOuAD8hhhD3hTywYD0WVwK028WBlQN+InSIC6utglTk047udYGpU
	JVnobhVGbK0EtRTPXgELUQHt2Smo762QixSMIxUzvElCz3kzTcIKtoMushOGXLpoHOmh
	Q9inm2K4EsEggjp/EPWy9yS+0vynKxeqrCUCMtMfY8fLzZDfpg1Yoa+hTttg+W46QnYf
	YYbZkdopVnk4jCmwEcZb/BqiV95gXoL769yGBhgx7Ev9JeYsazNHMnmFxtIKm9m4lJnK
	p057qiu9XcIAJbmcwqzhC0T5qXLoVY2Alaydr1XhcyraTfSCaLahbMi9iEhHI3T1OQ12
	CzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LTedwvIlGWafVTMSJSjW41nfgOtFc6gNluxFjiZlrmY=;
	b=ofcliTUtD5yM51ganZnwuB+yIRUdtenjfx9ZugYVzf1rY3BoCav8gfpIepYREenZSF
	23G7KJT5khn8fPjo0NGhS2SqM/ojxLTE/QBJRNWV8Ekq731sqkk9uHzobcXWvnbPLF8D
	pO9xq+vg3P2KsezANXO2f7ozUC4mLSykfVvZ/2fLPE6C2QOKr8iUsAGkNrok0LLWsoOY
	ZA0rkubNysu4tJ8rs6DN5861TYU3YLmQwjTjmghH3iTeZ6ftgm+S7DvFMpBmw82vZGyZ
	H+75LZyCn6+/ZWID53ZhBXcPQ2lzZvDGiyVRZDNAntFNro/F9o3GAUeuqCfVvvb5z46k
	C9bQ==
X-Gm-Message-State: AKS2vOzr2eOErpMDCFw4BZInkS8HC5uwmvqeCxf/Z/mlvxDHtxEKtBLP
	xQZaWpb6tDkHzDbvz49xiQosrsnvTA==
X-Received: by 10.37.2.148 with SMTP id 142mr665657ybc.198.1498492909998; Mon,
	26 Jun 2017 09:01:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.65 with HTTP; Mon, 26 Jun 2017 09:01:49 -0700 (PDT)
In-Reply-To: <CAKmqyKNA9VUV311XACwpt15PKas5HbBNM0Vdi5Z60q_HGhioTA@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPwRaXsgcuGC28x_pA9CYA-tcCnSBGNX1Qv3d3cXX8rsg@mail.gmail.com>
	<CALHRZupvtuE7oVdPa+kpaxP+ZrkHNzdJJV+fJq9nW1nHKX=5OA@mail.gmail.com>
	<CAKmqyKNA9VUV311XACwpt15PKas5HbBNM0Vdi5Z60q_HGhioTA@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 26 Jun 2017 21:31:49 +0530
Message-ID: <CALHRZurUtRV+3=L0PCADuj2BLbu2i1=MQomx2vbEiJSt1TNb+Q@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="001a113d4aa49970b40552df1154"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
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
X-TUID: AEIx112xGxSs

--001a113d4aa49970b40552df1154
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

On Wed, May 31, 2017 at 4:02 AM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Sun, May 28, 2017 at 10:26 PM, sundeep subbaraya
> <sundeep.lkml@gmail.com> wrote:
> > Hi Alistair,
> >
> > On Sat, May 27, 2017 at 5:30 AM, Alistair Francis <alistair23@gmail.com>
> > wrote:
> >>
> >> On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep
> >> <sundeep.lkml@gmail.com> wrote:
> >> > Emulated Emcraft's Smartfusion2 System On Module starter
> >> > kit.
> >> >
> >> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >> > ---
> >> >  hw/arm/Makefile.objs |  1 +
> >> >  hw/arm/msf2-som.c    | 89
> >> > ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >> >  2 files changed, 90 insertions(+)
> >> >  create mode 100644 hw/arm/msf2-som.c
> >> >
> >> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> >> > index c828061..4b02093 100644
> >> > --- a/hw/arm/Makefile.objs
> >> > +++ b/hw/arm/Makefile.objs
> >> > @@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o
> >> > stellaris.o
> >> >  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
> >> >  obj-$(CONFIG_ACPI) += virt-acpi-build.o
> >> >  obj-y += netduino2.o
> >> > +obj-y += msf2-som.o
> >>
> >> This should be obj-$(CONFIG_MSF2).
> >
> >
> > Ok will change it.
> >>
> >>
> >> >  obj-y += sysbus-fdt.o
> >> >
> >> >  obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
> >> > diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> >> > new file mode 100644
> >> > index 0000000..cd2b759
> >> > --- /dev/null
> >> > +++ b/hw/arm/msf2-som.c
> >> > @@ -0,0 +1,89 @@
> >> > +/*
> >> > + * SmartFusion2 SOM starter kit(from Emcraft) emulation.
> >> > + *
> >> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >> > + *
> >> > + * Permission is hereby granted, free of charge, to any person
> >> > obtaining a copy
> >> > + * of this software and associated documentation files (the
> >> > "Software"), to deal
> >> > + * in the Software without restriction, including without limitation
> >> > the rights
> >> > + * to use, copy, modify, merge, publish, distribute, sublicense,
> and/or
> >> > sell
> >> > + * copies of the Software, and to permit persons to whom the Software
> >> > is
> >> > + * furnished to do so, subject to the following conditions:
> >> > + *
> >> > + * The above copyright notice and this permission notice shall be
> >> > included in
> >> > + * all copies or substantial portions of the Software.
> >> > + *
> >> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> >> > EXPRESS OR
> >> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> >> > MERCHANTABILITY,
> >> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
> >> > SHALL
> >> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
> OR
> >> > OTHER
> >> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> >> > ARISING FROM,
> >> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> >> > DEALINGS IN
> >> > + * THE SOFTWARE.
> >> > + */
> >> > +
> >> > +#include "qemu/osdep.h"
> >> > +#include "qapi/error.h"
> >> > +#include "hw/boards.h"
> >> > +#include "hw/arm/msf2-soc.h"
> >> > +#include "hw/arm/arm.h"
> >> > +#include "exec/address-spaces.h"
> >> > +
> >> > +#define DDR_BASE_ADDRESS      0xA0000000
> >> > +#define DDR_SIZE              (64 * M_BYTE)
> >> > +
> >> > +static void emcraft_sf2_init(MachineState *machine)
> >> > +{
> >> > +    DeviceState *dev;
> >> > +    DeviceState *spi_flash;
> >> > +    MSF2State *soc;
> >> > +    DriveInfo *dinfo = drive_get_next(IF_MTD);
> >> > +    qemu_irq cs_line;
> >> > +    SSIBus *spi_bus;
> >> > +    MemoryRegion *sysmem = get_system_memory();
> >> > +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
> >> > +
> >> > +    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
> >> > +                           &error_fatal);
> >> > +    vmstate_register_ram_global(ddr);
> >> > +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
> >>
> >> The user can use -m to specify the amount of RAM to create in the
> >> machine. Unless this board only ever includes 64MB of RAM you should
> >> use that option (you will need to sanity check it though). If the
> >> board only ever has 64MB it might be worth printing a warning to the
> >> user if they specify an something. Although there might be a default
> >> if they don't use -m, which makes it hard to print out a warning
> >> message.
> >
> >
> > This -m confuses me. Why is it necessary for an embedded board? RAM chip
> > is fixed and not extendable. Whereas normal PC may have extra RAM slots.
> > If another board has more RAM then we would instantiate another machine
> for
> > it
> > with that RAM size. Please explain. Maybe I am thinking in wrong
> direction.
>
> I agree with you, it doesn't make sense for every board. For some
> embedded boards it does make sense (ZynqMP can have a customisable
> amount of memory) but for most it doesn't make too much sense.
>
> In saying that it is a commonly used QEMU option, if you can find a
> way to report a warning if the user tries to specify a custom amount
> of memory I think that would be beneficial as QEMU will just ignore
> their input. I have a feeling that the ram_size variable will be set
> even if the user doesn't specify anything, which we don't want to
> report a warning on.
>

Do we need to report and exit if user specifies custom amount of memory?

Thanks,
Sundeep

>
> Thanks,
> Alistair
>
> >
> > Thanks,
> > Sundeep
>

--001a113d4aa49970b40552df1154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, May 31, 2017 at 4:02 AM, Alistair Francis <span di=
r=3D"ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">ali=
stair23@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div class=3D"HOEnZb"><div class=3D"h5">On Sun, May 28, 2017 at 10:26 PM, su=
ndeep subbaraya<br>
&lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt=
; wrote:<br>
&gt; Hi Alistair,<br>
&gt;<br>
&gt; On Sat, May 27, 2017 at 5:30 AM, Alistair Francis &lt;<a href=3D"mailt=
o:alistair23@gmail.com">alistair23@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep<br>
&gt;&gt; &lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt; &gt; Emulated Emcraft&#39;s Smartfusion2 System On Module starter<=
br>
&gt;&gt; &gt; kit.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sundee=
p.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 hw/arm/Makefile.objs |=C2=A0 1 +<br>
&gt;&gt; &gt;=C2=A0 hw/arm/msf2-som.c=C2=A0 =C2=A0 | 89<br>
&gt;&gt; &gt; ++++++++++++++++++++++++++++++<wbr>++++++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 2 files changed, 90 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 hw/arm/msf2-som.c<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs<br>
&gt;&gt; &gt; index c828061..4b02093 100644<br>
&gt;&gt; &gt; --- a/hw/arm/Makefile.objs<br>
&gt;&gt; &gt; +++ b/hw/arm/Makefile.objs<br>
&gt;&gt; &gt; @@ -5,6 +5,7 @@ obj-y +=3D omap_sx1.o palm.o realview.o spitz=
.o<br>
&gt;&gt; &gt; stellaris.o<br>
&gt;&gt; &gt;=C2=A0 obj-y +=3D tosa.o versatilepb.o vexpress.o virt.o xilin=
x_zynq.o z2.o<br>
&gt;&gt; &gt;=C2=A0 obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o<br>
&gt;&gt; &gt;=C2=A0 obj-y +=3D netduino2.o<br>
&gt;&gt; &gt; +obj-y +=3D msf2-som.o<br>
&gt;&gt;<br>
&gt;&gt; This should be obj-$(CONFIG_MSF2).<br>
&gt;<br>
&gt;<br>
&gt; Ok will change it.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 obj-y +=3D sysbus-fdt.o<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 obj-y +=3D armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o=
 pxa2xx_pic.o<br>
&gt;&gt; &gt; diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 0000000..cd2b759<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/hw/arm/msf2-som.c<br>
&gt;&gt; &gt; @@ -0,0 +1,89 @@<br>
&gt;&gt; &gt; +/*<br>
&gt;&gt; &gt; + * SmartFusion2 SOM starter kit(from Emcraft) emulation.<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=3D"mailt=
o:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * Permission is hereby granted, free of charge, to any pers=
on<br>
&gt;&gt; &gt; obtaining a copy<br>
&gt;&gt; &gt; + * of this software and associated documentation files (the<=
br>
&gt;&gt; &gt; &quot;Software&quot;), to deal<br>
&gt;&gt; &gt; + * in the Software without restriction, including without li=
mitation<br>
&gt;&gt; &gt; the rights<br>
&gt;&gt; &gt; + * to use, copy, modify, merge, publish, distribute, sublice=
nse, and/or<br>
&gt;&gt; &gt; sell<br>
&gt;&gt; &gt; + * copies of the Software, and to permit persons to whom the=
 Software<br>
&gt;&gt; &gt; is<br>
&gt;&gt; &gt; + * furnished to do so, subject to the following conditions:<=
br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * The above copyright notice and this permission notice sha=
ll be<br>
&gt;&gt; &gt; included in<br>
&gt;&gt; &gt; + * all copies or substantial portions of the Software.<br>
&gt;&gt; &gt; + *<br>
&gt;&gt; &gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRA=
NTY OF ANY KIND,<br>
&gt;&gt; &gt; EXPRESS OR<br>
&gt;&gt; &gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF<b=
r>
&gt;&gt; &gt; MERCHANTABILITY,<br>
&gt;&gt; &gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN =
NO EVENT<br>
&gt;&gt; &gt; SHALL<br>
&gt;&gt; &gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,=
 DAMAGES OR<br>
&gt;&gt; &gt; OTHER<br>
&gt;&gt; &gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHE=
RWISE,<br>
&gt;&gt; &gt; ARISING FROM,<br>
&gt;&gt; &gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR O=
THER<br>
&gt;&gt; &gt; DEALINGS IN<br>
&gt;&gt; &gt; + * THE SOFTWARE.<br>
&gt;&gt; &gt; + */<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt; +#include &quot;hw/boards.h&quot;<br>
&gt;&gt; &gt; +#include &quot;hw/arm/msf2-soc.h&quot;<br>
&gt;&gt; &gt; +#include &quot;hw/arm/arm.h&quot;<br>
&gt;&gt; &gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +#define DDR_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A0 0xA0000000<br>
&gt;&gt; &gt; +#define DDR_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (64 * M_BYTE)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +static void emcraft_sf2_init(MachineState *machine)<br>
&gt;&gt; &gt; +{<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 DeviceState *spi_flash;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 MSF2State *soc;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 DriveInfo *dinfo =3D drive_get_next(IF_MTD);<b=
r>
&gt;&gt; &gt; +=C2=A0 =C2=A0 qemu_irq cs_line;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 SSIBus *spi_bus;<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *sysmem =3D get_system_memory();<=
br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *ddr =3D g_new(MemoryRegion, 1);<=
br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 memory_region_init_ram(ddr, NULL, &quot;ddr-ra=
m&quot;, DDR_SIZE,<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 vmstate_register_ram_global(<wbr>ddr);<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>sysmem, DDR_B=
ASE_ADDRESS, ddr);<br>
&gt;&gt;<br>
&gt;&gt; The user can use -m to specify the amount of RAM to create in the<=
br>
&gt;&gt; machine. Unless this board only ever includes 64MB of RAM you shou=
ld<br>
&gt;&gt; use that option (you will need to sanity check it though). If the<=
br>
&gt;&gt; board only ever has 64MB it might be worth printing a warning to t=
he<br>
&gt;&gt; user if they specify an something. Although there might be a defau=
lt<br>
&gt;&gt; if they don&#39;t use -m, which makes it hard to print out a warni=
ng<br>
&gt;&gt; message.<br>
&gt;<br>
&gt;<br>
&gt; This -m confuses me. Why is it necessary for an embedded board? RAM ch=
ip<br>
&gt; is fixed and not extendable. Whereas normal PC may have extra RAM slot=
s.<br>
&gt; If another board has more RAM then we would instantiate another machin=
e for<br>
&gt; it<br>
&gt; with that RAM size. Please explain. Maybe I am thinking in wrong direc=
tion.<br>
<br>
</div></div>I agree with you, it doesn&#39;t make sense for every board. Fo=
r some<br>
embedded boards it does make sense (ZynqMP can have a customisable<br>
amount of memory) but for most it doesn&#39;t make too much sense.<br>
<br>
In saying that it is a commonly used QEMU option, if you can find a<br>
way to report a warning if the user tries to specify a custom amount<br>
of memory I think that would be beneficial as QEMU will just ignore<br>
their input. I have a feeling that the ram_size variable will be set<br>
even if the user doesn&#39;t specify anything, which we don&#39;t want to<b=
r>
report a warning on.<br></blockquote><div><br></div><div>Do we need to repo=
rt and exit if user specifies custom amount of memory?<br><br></div><div>Th=
anks,<br></div><div>Sundeep <br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Alistair<br>
<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Sundeep<br>
</blockquote></div><br></div></div>

--001a113d4aa49970b40552df1154--

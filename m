Received: by 10.25.227.6 with SMTP id a6csp2643635lfh;
        Tue, 27 Jun 2017 23:04:32 -0700 (PDT)
X-Received: by 10.55.167.1 with SMTP id q1mr11510266qke.223.1498629872816;
        Tue, 27 Jun 2017 23:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498629872; cv=none;
        d=google.com; s=arc-20160816;
        b=EgRJb8kbnL2wbQJMuxKQ4O3pl9RimWFmBcQBwygqtEZEmymcbxYlA5ZcF2FOkoiH3R
         FwaDnISGv/FhvdL+avwJ6NmwM+M9zgzmm7dj+1cUwFO/+S3uBLVxMwGV/qBC3v5KB1gm
         XpdWIIt37pLrsfWKb+Hjbj0cVFMcdvdBr4NeHfrgb38oYagbj1jozOe183gWn9aT4bL5
         jBc+Cg8GaXnLoA8SQlqRRrpTjdN+AeF4SLbpCuURrD/LLqrDsl4arXZL73azIoMesh+6
         55Zn1PqsvKE0cqKmw1A81JNJS1htbWxatuNdgoxYH6vhmMxNZc7S11PlU8esMyflU1Wx
         gESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=v88Jx+AX66KG3XsCRaP67/m3vNhgRTlNX3ZOWaXQtYk=;
        b=CQEWA3+TfmYh9SyfVPQ5Whw1c1ni43mG0+dZPw8YHKsaaXUqiIrAxBe9p0Q5rh/wuO
         Kb9wP+XHOEDWoJDd2Jx48vAHxUFULkqg8xmD2YoVY1fSXXq8/+40SVynrDyHQSea+0EZ
         0ryfY86VmCZRrYaJxi4zYn7WXcow3uAv41W5LYiIN/pI1XgxH/NLGyfOZ/ZgfUKR0OfN
         yhGWhaxNVegb/F2BlnKQ1hvQfQyni/fa+QpORi+Paw2J9apFhsdb3nNd2+g67cBMUy3E
         eDJCA5tq73KK7Fku8VqnuOwSWwYwouZcw+mpFHzhcbxvUngQRgudNAC6WK+Nfm22oIVJ
         +jZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=T+4eMiV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a96si1334145qkh.92.2017.06.27.23.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Jun 2017 23:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=T+4eMiV4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59352 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dQ65W-0007a8-6P
	for alex.bennee@linaro.org; Wed, 28 Jun 2017 02:04:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dQ65M-0007Xw-22
	for qemu-arm@nongnu.org; Wed, 28 Jun 2017 02:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dQ65J-0005ps-RA
	for qemu-arm@nongnu.org; Wed, 28 Jun 2017 02:04:20 -0400
Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242]:33585)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dQ65F-0005m9-AS; Wed, 28 Jun 2017 02:04:13 -0400
Received: by mail-yb0-x242.google.com with SMTP id 84so2223557ybe.0;
	Tue, 27 Jun 2017 23:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v88Jx+AX66KG3XsCRaP67/m3vNhgRTlNX3ZOWaXQtYk=;
	b=T+4eMiV4eu2pQtNdW+h35W033fFia1oGVXJ2YAtw3KEoTeNW0zd11kWR0Z+3/AYIoN
	4s7Ekljwc4ekNgWkjwa7VBbk8kWnqGNneBpoCCkoRPwqpsnAijXI+b7Oy0/+2U468tK2
	rCuWdK+23vfVOgyLHLKrmg2q8Ftya9MSjwuGkC11dGoViFONtAhIx1YLyaUpUbTIriX4
	HJhM9VhaR4bxNKYBOm85WCUuRH+DCimTrZ8+hByIEcJhGHyMsGP9r5vcmeh9XESvKpCp
	utKsMk7t1/MkwRI6rNA2VNkv6FwNHCpTVuyMPorvjU/mGFki3enuc6kj+QCSKy9cUSyt
	DCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v88Jx+AX66KG3XsCRaP67/m3vNhgRTlNX3ZOWaXQtYk=;
	b=C9KLlDJPZMfU18HwNlNU+0IddCfUqYQbf1kgTPHIjJ4jy0cRcB68XMlLgIci4PSlrN
	8w2A6uvMNzD/bsRX8e7RvCPCTewfvJYmwPRhJ+gO7xxpXXj03o1zFDKz+1ZJglgjFrjV
	O2QDAoT9Drs2QZH1P/uPpU53yN17AD+TomKLpsTlcHcbHmUXLyfG3FRJJAZxq256qryt
	LFuAyAXjyFe+4l4/4/fdHxsziJAbPQ8TcAc65Spw+z0jwIYqhRmxjDcFjpPY5QUI51oW
	oN5sS72jzIiMglfLyYhMudHcxUiTbRYtjrasajjNS/mUXn5FuS/+FxmxRfcqFkB7oW/l
	hQvg==
X-Gm-Message-State: AKS2vOwsEFxaXlmIFx7t+z20qLBE3b1HRmLGCYFFlIx0oOUmoco+a1Pu
	OFvYv+kbjCzG16rqpA35uOaldJ4Liw==
X-Received: by 10.37.39.4 with SMTP id n4mr6785490ybn.107.1498629851178; Tue,
	27 Jun 2017 23:04:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.166.140 with HTTP; Tue, 27 Jun 2017 23:04:10 -0700 (PDT)
In-Reply-To: <CAKmqyKOcWFNKusosunD=MF3x0B=8=n2q9MLZmx5QzXrMxeH-FQ@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPwRaXsgcuGC28x_pA9CYA-tcCnSBGNX1Qv3d3cXX8rsg@mail.gmail.com>
	<CALHRZupvtuE7oVdPa+kpaxP+ZrkHNzdJJV+fJq9nW1nHKX=5OA@mail.gmail.com>
	<CAKmqyKNA9VUV311XACwpt15PKas5HbBNM0Vdi5Z60q_HGhioTA@mail.gmail.com>
	<CALHRZurUtRV+3=L0PCADuj2BLbu2i1=MQomx2vbEiJSt1TNb+Q@mail.gmail.com>
	<CAKmqyKOcWFNKusosunD=MF3x0B=8=n2q9MLZmx5QzXrMxeH-FQ@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 28 Jun 2017 11:34:10 +0530
Message-ID: <CALHRZuqK20RW2+w7JmrONgUToAad6qts1NAG9LJChNn1n7BW0g@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="94eb2c135b4eedf34c0552fef372"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::242
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
X-TUID: qBxE4+j91a+r

--94eb2c135b4eedf34c0552fef372
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

On Tue, Jun 27, 2017 at 4:19 AM, Alistair Francis <alistair23@gmail.com>
wrote:

> On Mon, Jun 26, 2017 at 9:01 AM, sundeep subbaraya
> <sundeep.lkml@gmail.com> wrote:
> > Hi Alistair,
> >
> > On Wed, May 31, 2017 at 4:02 AM, Alistair Francis <alistair23@gmail.com>
> > wrote:
> >>
> >> On Sun, May 28, 2017 at 10:26 PM, sundeep subbaraya
> >> <sundeep.lkml@gmail.com> wrote:
> >> > Hi Alistair,
> >> >
> >> > On Sat, May 27, 2017 at 5:30 AM, Alistair Francis <
> alistair23@gmail.com>
> >> > wrote:
> >> >>
> >> >> On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep
> >> >> <sundeep.lkml@gmail.com> wrote:
> >> >> > Emulated Emcraft's Smartfusion2 System On Module starter
> >> >> > kit.
> >> >> >
> >> >> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >> >> > ---
> >> >> >  hw/arm/Makefile.objs |  1 +
> >> >> >  hw/arm/msf2-som.c    | 89
> >> >> > ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >> >> >  2 files changed, 90 insertions(+)
> >> >> >  create mode 100644 hw/arm/msf2-som.c
> >> >> >
> >> >> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> >> >> > index c828061..4b02093 100644
> >> >> > --- a/hw/arm/Makefile.objs
> >> >> > +++ b/hw/arm/Makefile.objs
> >> >> > @@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o
> >> >> > stellaris.o
> >> >> >  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
> >> >> >  obj-$(CONFIG_ACPI) += virt-acpi-build.o
> >> >> >  obj-y += netduino2.o
> >> >> > +obj-y += msf2-som.o
> >> >>
> >> >> This should be obj-$(CONFIG_MSF2).
> >> >
> >> >
> >> > Ok will change it.
> >> >>
> >> >>
> >> >> >  obj-y += sysbus-fdt.o
> >> >> >
> >> >> >  obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
> >> >> > diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> >> >> > new file mode 100644
> >> >> > index 0000000..cd2b759
> >> >> > --- /dev/null
> >> >> > +++ b/hw/arm/msf2-som.c
> >> >> > @@ -0,0 +1,89 @@
> >> >> > +/*
> >> >> > + * SmartFusion2 SOM starter kit(from Emcraft) emulation.
> >> >> > + *
> >> >> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >> >> > + *
> >> >> > + * Permission is hereby granted, free of charge, to any person
> >> >> > obtaining a copy
> >> >> > + * of this software and associated documentation files (the
> >> >> > "Software"), to deal
> >> >> > + * in the Software without restriction, including without
> limitation
> >> >> > the rights
> >> >> > + * to use, copy, modify, merge, publish, distribute, sublicense,
> >> >> > and/or
> >> >> > sell
> >> >> > + * copies of the Software, and to permit persons to whom the
> >> >> > Software
> >> >> > is
> >> >> > + * furnished to do so, subject to the following conditions:
> >> >> > + *
> >> >> > + * The above copyright notice and this permission notice shall be
> >> >> > included in
> >> >> > + * all copies or substantial portions of the Software.
> >> >> > + *
> >> >> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> >> >> > EXPRESS OR
> >> >> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> >> >> > MERCHANTABILITY,
> >> >> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
> EVENT
> >> >> > SHALL
> >> >> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> DAMAGES
> >> >> > OR
> >> >> > OTHER
> >> >> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> >> >> > ARISING FROM,
> >> >> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> >> >> > DEALINGS IN
> >> >> > + * THE SOFTWARE.
> >> >> > + */
> >> >> > +
> >> >> > +#include "qemu/osdep.h"
> >> >> > +#include "qapi/error.h"
> >> >> > +#include "hw/boards.h"
> >> >> > +#include "hw/arm/msf2-soc.h"
> >> >> > +#include "hw/arm/arm.h"
> >> >> > +#include "exec/address-spaces.h"
> >> >> > +
> >> >> > +#define DDR_BASE_ADDRESS      0xA0000000
> >> >> > +#define DDR_SIZE              (64 * M_BYTE)
> >> >> > +
> >> >> > +static void emcraft_sf2_init(MachineState *machine)
> >> >> > +{
> >> >> > +    DeviceState *dev;
> >> >> > +    DeviceState *spi_flash;
> >> >> > +    MSF2State *soc;
> >> >> > +    DriveInfo *dinfo = drive_get_next(IF_MTD);
> >> >> > +    qemu_irq cs_line;
> >> >> > +    SSIBus *spi_bus;
> >> >> > +    MemoryRegion *sysmem = get_system_memory();
> >> >> > +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
> >> >> > +
> >> >> > +    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
> >> >> > +                           &error_fatal);
> >> >> > +    vmstate_register_ram_global(ddr);
> >> >> > +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
> >> >>
> >> >> The user can use -m to specify the amount of RAM to create in the
> >> >> machine. Unless this board only ever includes 64MB of RAM you should
> >> >> use that option (you will need to sanity check it though). If the
> >> >> board only ever has 64MB it might be worth printing a warning to the
> >> >> user if they specify an something. Although there might be a default
> >> >> if they don't use -m, which makes it hard to print out a warning
> >> >> message.
> >> >
> >> >
> >> > This -m confuses me. Why is it necessary for an embedded board? RAM
> chip
> >> > is fixed and not extendable. Whereas normal PC may have extra RAM
> slots.
> >> > If another board has more RAM then we would instantiate another
> machine
> >> > for
> >> > it
> >> > with that RAM size. Please explain. Maybe I am thinking in wrong
> >> > direction.
> >>
> >> I agree with you, it doesn't make sense for every board. For some
> >> embedded boards it does make sense (ZynqMP can have a customisable
> >> amount of memory) but for most it doesn't make too much sense.
> >>
> >> In saying that it is a commonly used QEMU option, if you can find a
> >> way to report a warning if the user tries to specify a custom amount
> >> of memory I think that would be beneficial as QEMU will just ignore
> >> their input. I have a feeling that the ram_size variable will be set
> >> even if the user doesn't specify anything, which we don't want to
> >> report a warning on.
> >
> >
> > Do we need to report and exit if user specifies custom amount of memory?
>
> I had a quick look at other ARM machines and it looks like a lot of
> them use the ram_size variable from the machine to set the size of the
> memory, but some have just hard coded values.
>
> I'm not sure if there is an accepted "right" way to do this. If the
> board only ever has 64MB of memory then it's probably ok to just hard
> code it. Like you said, I don't think user have a high expectation of
> adjusting the memory in embedded boards.
>

Thank you, I will drop the -m option.

Regards,
Sundeep


>
> Thanks,
> Alistair
>

--94eb2c135b4eedf34c0552fef372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alistair,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Tue, Jun 27, 2017 at 4:19 AM, Alistair Francis <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair=
23@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon=
, Jun 26, 2017 at 9:01 AM, sundeep subbaraya<br>
<div><div class=3D"h5">&lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundee=
p.lkml@gmail.com</a>&gt; wrote:<br>
&gt; Hi Alistair,<br>
&gt;<br>
&gt; On Wed, May 31, 2017 at 4:02 AM, Alistair Francis &lt;<a href=3D"mailt=
o:alistair23@gmail.com">alistair23@gmail.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Sun, May 28, 2017 at 10:26 PM, sundeep subbaraya<br>
&gt;&gt; &lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.c=
om</a>&gt; wrote:<br>
&gt;&gt; &gt; Hi Alistair,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Sat, May 27, 2017 at 5:30 AM, Alistair Francis &lt;<a href=
=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a>&gt;<br>
&gt;&gt; &gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkm=
l@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; Emulated Emcraft&#39;s Smartfusion2 System On Module=
 starter<br>
&gt;&gt; &gt;&gt; &gt; kit.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mail=
to:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 hw/arm/Makefile.objs |=C2=A0 1 +<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 hw/arm/msf2-som.c=C2=A0 =C2=A0 | 89<br>
&gt;&gt; &gt;&gt; &gt; ++++++++++++++++++++++++++++++<wbr>+++++++++++++++++=
+++++<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 2 files changed, 90 insertions(+)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 hw/arm/msf2-som.c<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.=
objs<br>
&gt;&gt; &gt;&gt; &gt; index c828061..4b02093 100644<br>
&gt;&gt; &gt;&gt; &gt; --- a/hw/arm/Makefile.objs<br>
&gt;&gt; &gt;&gt; &gt; +++ b/hw/arm/Makefile.objs<br>
&gt;&gt; &gt;&gt; &gt; @@ -5,6 +5,7 @@ obj-y +=3D omap_sx1.o palm.o realvie=
w.o spitz.o<br>
&gt;&gt; &gt;&gt; &gt; stellaris.o<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 obj-y +=3D tosa.o versatilepb.o vexpress.o vir=
t.o xilinx_zynq.o z2.o<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 obj-y +=3D netduino2.o<br>
&gt;&gt; &gt;&gt; &gt; +obj-y +=3D msf2-som.o<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; This should be obj-$(CONFIG_MSF2).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Ok will change it.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 obj-y +=3D sysbus-fdt.o<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 obj-y +=3D armv7m.o exynos4210.o pxa2xx.o pxa2=
xx_gpio.o pxa2xx_pic.o<br>
&gt;&gt; &gt;&gt; &gt; diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c<b=
r>
&gt;&gt; &gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt;&gt; &gt; index 0000000..cd2b759<br>
&gt;&gt; &gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt;&gt; &gt; +++ b/hw/arm/msf2-som.c<br>
&gt;&gt; &gt;&gt; &gt; @@ -0,0 +1,89 @@<br>
&gt;&gt; &gt;&gt; &gt; +/*<br>
&gt;&gt; &gt;&gt; &gt; + * SmartFusion2 SOM starter kit(from Emcraft) emula=
tion.<br>
&gt;&gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt;&gt; &gt; + * Copyright (c) 2017 Subbaraya Sundeep &lt;<a href=
=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt;&gt; &gt; + * Permission is hereby granted, free of charge, to=
 any person<br>
&gt;&gt; &gt;&gt; &gt; obtaining a copy<br>
&gt;&gt; &gt;&gt; &gt; + * of this software and associated documentation fi=
les (the<br>
&gt;&gt; &gt;&gt; &gt; &quot;Software&quot;), to deal<br>
&gt;&gt; &gt;&gt; &gt; + * in the Software without restriction, including w=
ithout limitation<br>
&gt;&gt; &gt;&gt; &gt; the rights<br>
&gt;&gt; &gt;&gt; &gt; + * to use, copy, modify, merge, publish, distribute=
, sublicense,<br>
&gt;&gt; &gt;&gt; &gt; and/or<br>
&gt;&gt; &gt;&gt; &gt; sell<br>
&gt;&gt; &gt;&gt; &gt; + * copies of the Software, and to permit persons to=
 whom the<br>
&gt;&gt; &gt;&gt; &gt; Software<br>
&gt;&gt; &gt;&gt; &gt; is<br>
&gt;&gt; &gt;&gt; &gt; + * furnished to do so, subject to the following con=
ditions:<br>
&gt;&gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt;&gt; &gt; + * The above copyright notice and this permission n=
otice shall be<br>
&gt;&gt; &gt;&gt; &gt; included in<br>
&gt;&gt; &gt;&gt; &gt; + * all copies or substantial portions of the Softwa=
re.<br>
&gt;&gt; &gt;&gt; &gt; + *<br>
&gt;&gt; &gt;&gt; &gt; + * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITH=
OUT WARRANTY OF ANY KIND,<br>
&gt;&gt; &gt;&gt; &gt; EXPRESS OR<br>
&gt;&gt; &gt;&gt; &gt; + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRAN=
TIES OF<br>
&gt;&gt; &gt;&gt; &gt; MERCHANTABILITY,<br>
&gt;&gt; &gt;&gt; &gt; + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGE=
MENT. IN NO EVENT<br>
&gt;&gt; &gt;&gt; &gt; SHALL<br>
&gt;&gt; &gt;&gt; &gt; + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR A=
NY CLAIM, DAMAGES<br>
&gt;&gt; &gt;&gt; &gt; OR<br>
&gt;&gt; &gt;&gt; &gt; OTHER<br>
&gt;&gt; &gt;&gt; &gt; + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TOR=
T OR OTHERWISE,<br>
&gt;&gt; &gt;&gt; &gt; ARISING FROM,<br>
&gt;&gt; &gt;&gt; &gt; + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE=
 USE OR OTHER<br>
&gt;&gt; &gt;&gt; &gt; DEALINGS IN<br>
&gt;&gt; &gt;&gt; &gt; + * THE SOFTWARE.<br>
&gt;&gt; &gt;&gt; &gt; + */<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +#include &quot;qemu/osdep.h&quot;<br>
&gt;&gt; &gt;&gt; &gt; +#include &quot;qapi/error.h&quot;<br>
&gt;&gt; &gt;&gt; &gt; +#include &quot;hw/boards.h&quot;<br>
&gt;&gt; &gt;&gt; &gt; +#include &quot;hw/arm/msf2-soc.h&quot;<br>
&gt;&gt; &gt;&gt; &gt; +#include &quot;hw/arm/arm.h&quot;<br>
&gt;&gt; &gt;&gt; &gt; +#include &quot;exec/address-spaces.h&quot;<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +#define DDR_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A0 0xA000=
0000<br>
&gt;&gt; &gt;&gt; &gt; +#define DDR_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (64 * M_BYTE)<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +static void emcraft_sf2_init(MachineState *machine)=
<br>
&gt;&gt; &gt;&gt; &gt; +{<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 DeviceState *spi_flash;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 MSF2State *soc;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 DriveInfo *dinfo =3D drive_get_next(I=
F_MTD);<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 qemu_irq cs_line;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 SSIBus *spi_bus;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *sysmem =3D get_system_m=
emory();<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 MemoryRegion *ddr =3D g_new(MemoryReg=
ion, 1);<br>
&gt;&gt; &gt;&gt; &gt; +<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 memory_region_init_ram(ddr, NULL, &qu=
ot;ddr-ram&quot;, DDR_SIZE,<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 vmstate_register_ram_global(<wbr>ddr)=
;<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>sysm=
em, DDR_BASE_ADDRESS, ddr);<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The user can use -m to specify the amount of RAM to creat=
e in the<br>
&gt;&gt; &gt;&gt; machine. Unless this board only ever includes 64MB of RAM=
 you should<br>
&gt;&gt; &gt;&gt; use that option (you will need to sanity check it though)=
. If the<br>
&gt;&gt; &gt;&gt; board only ever has 64MB it might be worth printing a war=
ning to the<br>
&gt;&gt; &gt;&gt; user if they specify an something. Although there might b=
e a default<br>
&gt;&gt; &gt;&gt; if they don&#39;t use -m, which makes it hard to print ou=
t a warning<br>
&gt;&gt; &gt;&gt; message.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This -m confuses me. Why is it necessary for an embedded boar=
d? RAM chip<br>
&gt;&gt; &gt; is fixed and not extendable. Whereas normal PC may have extra=
 RAM slots.<br>
&gt;&gt; &gt; If another board has more RAM then we would instantiate anoth=
er machine<br>
&gt;&gt; &gt; for<br>
&gt;&gt; &gt; it<br>
&gt;&gt; &gt; with that RAM size. Please explain. Maybe I am thinking in wr=
ong<br>
&gt;&gt; &gt; direction.<br>
&gt;&gt;<br>
&gt;&gt; I agree with you, it doesn&#39;t make sense for every board. For s=
ome<br>
&gt;&gt; embedded boards it does make sense (ZynqMP can have a customisable=
<br>
&gt;&gt; amount of memory) but for most it doesn&#39;t make too much sense.=
<br>
&gt;&gt;<br>
&gt;&gt; In saying that it is a commonly used QEMU option, if you can find =
a<br>
&gt;&gt; way to report a warning if the user tries to specify a custom amou=
nt<br>
&gt;&gt; of memory I think that would be beneficial as QEMU will just ignor=
e<br>
&gt;&gt; their input. I have a feeling that the ram_size variable will be s=
et<br>
&gt;&gt; even if the user doesn&#39;t specify anything, which we don&#39;t =
want to<br>
&gt;&gt; report a warning on.<br>
&gt;<br>
&gt;<br>
&gt; Do we need to report and exit if user specifies custom amount of memor=
y?<br>
<br>
</div></div>I had a quick look at other ARM machines and it looks like a lo=
t of<br>
them use the ram_size variable from the machine to set the size of the<br>
memory, but some have just hard coded values.<br>
<br>
I&#39;m not sure if there is an accepted &quot;right&quot; way to do this. =
If the<br>
board only ever has 64MB of memory then it&#39;s probably ok to just hard<b=
r>
code it. Like you said, I don&#39;t think user have a high expectation of<b=
r>
adjusting the memory in embedded boards.<br></blockquote><div><br></div><di=
v>Thank you, I will drop the -m option.</div><div><br></div><div>Regards,</=
div><div>Sundeep</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Alistair<br>
</blockquote></div><br></div></div>

--94eb2c135b4eedf34c0552fef372--

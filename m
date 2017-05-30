Received: by 10.25.0.6 with SMTP id 6csp56903lfa;
        Tue, 30 May 2017 15:33:07 -0700 (PDT)
X-Received: by 10.55.120.199 with SMTP id t190mr24305982qkc.235.1496183587815;
        Tue, 30 May 2017 15:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496183587; cv=none;
        d=google.com; s=arc-20160816;
        b=X4F/C+ebXeeab2s+XDO//0KSGIDVQ7d/8oZl6Luqa3SNzYOW8tIs+VnK443SLojDH6
         CCJGuGbkNQrHIKDtbNIRGwqVzuEQ+5Xe1ajZekaWBB4i9qWzBIemx6IUiTK6AFdIwF6n
         /Pa83DquQq+83TbStTQ/WZZFVpodHa5X7HPVJMn9OI56OMN4sLwadrBlybKup8V/QkVP
         evaLN+/h1/xxeczv/wXU0Drv2NdMzQhmr2TcPg7dLAEqHrIUHIgptLvBLy0h8hKpuCdp
         syB6QnAciGUh2iaqLyhgTCJ6xfEFfjFUochRGLXNrpaEcshnkiEG1XYziLW8wNoYzKYg
         OxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=kh/a91FEIk68s7E5O5vneGCPBVrebHnBv+L62yy7LpA=;
        b=O3B6oHldwWNQgQUJbT6z4iSpBN4/qZIBM5n9a5gGTIHHsx9DltcExnIaXfriHr2xhR
         6lmQJYbEGMcXdvwZotxR05jXpzRCIwTRQww/5A+lm8FHjOKcxZWHkGCjX4739nQ7Pjmt
         koxnHehz3vKHd0blijLYyEryF5fL8mZCsBvK+Ssp/EXfd0d3dncBvidOBuETX7HRYdNK
         FMPmpkXug8e+ITRZSlIAWqZ7nPh3N5/SPNAcpCpXHjr7iU9FCa7WXVNIPPPxLl95W3WD
         7ABg5PNAGtzbIjb9X7kTUC2hmGcsBDk93pNHLKN33obXj2K/IW9HW5FPsOtFXOh4ZhZQ
         8K6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u25si13866356qtu.127.2017.05.30.15.33.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 15:33:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFphJ-0008WV-5U
	for alex.bennee@linaro.org; Tue, 30 May 2017 18:33:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dFphB-0008Ug-S4
	for qemu-arm@nongnu.org; Tue, 30 May 2017 18:32:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dFphA-0000Op-Jn
	for qemu-arm@nongnu.org; Tue, 30 May 2017 18:32:57 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33736)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dFph7-0000OW-Qb; Tue, 30 May 2017 18:32:53 -0400
Received: by mail-oi0-x242.google.com with SMTP id h4so18098772oib.0;
	Tue, 30 May 2017 15:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kh/a91FEIk68s7E5O5vneGCPBVrebHnBv+L62yy7LpA=;
	b=hwyF2EzsmcaGWrO/CP1S3XlEyPYxtxiOdxqijP/wZEAkg69QV2f5S9ReVD3ihhEzYl
	FCpvFXxSsCyZ8eW/qAteS9jwzyr+dOoi9GBDws6+r3UvV3lqTNm/fgXbftkdt340Efmt
	hLUaf1GWJuQJrgeWCOXDjiVyYVfGu8ivTYWTjcw96yn11X3yXWuPGt2QCzymw3U19V7n
	n8+gRLQAMyC3WjPh10YqZukacekzrTuIm+VokMj3sNi58k7AbQWOZlgBYvIlBMpBiXSu
	wNUNHv4Sss3LZBJrvFfaGPxfvfYYJNjgr8S4zGxzNE40UdSiunxp3fqc/g+aPqWpV07m
	c8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kh/a91FEIk68s7E5O5vneGCPBVrebHnBv+L62yy7LpA=;
	b=q2+nrua1ji8LRIXiuAG2HnwY4zzHLYHfgIuxTIoJ1WufNeSQKBjnTJ65qMO1Ij1v1z
	M3/YN/rdkYS0izm1E/xVUOiNU5rWOK2LP4RXOZ6z/2j/hzWVlCY2hOwsFTkVze4cwc/1
	D64J8bDcrlxWb3NeH0yfMzy12SxSFEeOVKFKpbTz04GZ83GfY9p0OCKPF324blqVR48z
	H8GqK8HanAsXrvB9hDCTQ8PBKV6blnxzF4vreLb7OqEd1yeECyDdmUifmaai9B/OnJH4
	Ue1TsOnW8K94O+Zjvvf4Ggg/eGM2VFJlWbNMowUSzxlgsBwRo8LtRxCKGdGPDV0uM3px
	Qzbw==
X-Gm-Message-State: AODbwcC/CEbs/kS3kq+TSgsMrXexCRIiaiDMiFAr8ekOMUO/9+7aKJGR
	Q+VYNqpaLDyIvsLhEfXM9snI0G9YOQ==
X-Received: by 10.202.104.36 with SMTP id d36mr11007945oic.61.1496183572964;
	Tue, 30 May 2017 15:32:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.2.37 with HTTP; Tue, 30 May 2017 15:32:22 -0700 (PDT)
In-Reply-To: <CALHRZupvtuE7oVdPa+kpaxP+ZrkHNzdJJV+fJq9nW1nHKX=5OA@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPwRaXsgcuGC28x_pA9CYA-tcCnSBGNX1Qv3d3cXX8rsg@mail.gmail.com>
	<CALHRZupvtuE7oVdPa+kpaxP+ZrkHNzdJJV+fJq9nW1nHKX=5OA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 May 2017 15:32:22 -0700
Message-ID: <CAKmqyKNA9VUV311XACwpt15PKas5HbBNM0Vdi5Z60q_HGhioTA@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
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
X-TUID: Xne/3804q9Pl

On Sun, May 28, 2017 at 10:26 PM, sundeep subbaraya
<sundeep.lkml@gmail.com> wrote:
> Hi Alistair,
>
> On Sat, May 27, 2017 at 5:30 AM, Alistair Francis <alistair23@gmail.com>
> wrote:
>>
>> On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep
>> <sundeep.lkml@gmail.com> wrote:
>> > Emulated Emcraft's Smartfusion2 System On Module starter
>> > kit.
>> >
>> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> > ---
>> >  hw/arm/Makefile.objs |  1 +
>> >  hw/arm/msf2-som.c    | 89
>> > ++++++++++++++++++++++++++++++++++++++++++++++++++++
>> >  2 files changed, 90 insertions(+)
>> >  create mode 100644 hw/arm/msf2-som.c
>> >
>> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> > index c828061..4b02093 100644
>> > --- a/hw/arm/Makefile.objs
>> > +++ b/hw/arm/Makefile.objs
>> > @@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o
>> > stellaris.o
>> >  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>> >  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>> >  obj-y += netduino2.o
>> > +obj-y += msf2-som.o
>>
>> This should be obj-$(CONFIG_MSF2).
>
>
> Ok will change it.
>>
>>
>> >  obj-y += sysbus-fdt.o
>> >
>> >  obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
>> > diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
>> > new file mode 100644
>> > index 0000000..cd2b759
>> > --- /dev/null
>> > +++ b/hw/arm/msf2-som.c
>> > @@ -0,0 +1,89 @@
>> > +/*
>> > + * SmartFusion2 SOM starter kit(from Emcraft) emulation.
>> > + *
>> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> > + *
>> > + * Permission is hereby granted, free of charge, to any person
>> > obtaining a copy
>> > + * of this software and associated documentation files (the
>> > "Software"), to deal
>> > + * in the Software without restriction, including without limitation
>> > the rights
>> > + * to use, copy, modify, merge, publish, distribute, sublicense, and/or
>> > sell
>> > + * copies of the Software, and to permit persons to whom the Software
>> > is
>> > + * furnished to do so, subject to the following conditions:
>> > + *
>> > + * The above copyright notice and this permission notice shall be
>> > included in
>> > + * all copies or substantial portions of the Software.
>> > + *
>> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> > EXPRESS OR
>> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> > MERCHANTABILITY,
>> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> > SHALL
>> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> > OTHER
>> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> > ARISING FROM,
>> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> > DEALINGS IN
>> > + * THE SOFTWARE.
>> > + */
>> > +
>> > +#include "qemu/osdep.h"
>> > +#include "qapi/error.h"
>> > +#include "hw/boards.h"
>> > +#include "hw/arm/msf2-soc.h"
>> > +#include "hw/arm/arm.h"
>> > +#include "exec/address-spaces.h"
>> > +
>> > +#define DDR_BASE_ADDRESS      0xA0000000
>> > +#define DDR_SIZE              (64 * M_BYTE)
>> > +
>> > +static void emcraft_sf2_init(MachineState *machine)
>> > +{
>> > +    DeviceState *dev;
>> > +    DeviceState *spi_flash;
>> > +    MSF2State *soc;
>> > +    DriveInfo *dinfo = drive_get_next(IF_MTD);
>> > +    qemu_irq cs_line;
>> > +    SSIBus *spi_bus;
>> > +    MemoryRegion *sysmem = get_system_memory();
>> > +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
>> > +
>> > +    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
>> > +                           &error_fatal);
>> > +    vmstate_register_ram_global(ddr);
>> > +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
>>
>> The user can use -m to specify the amount of RAM to create in the
>> machine. Unless this board only ever includes 64MB of RAM you should
>> use that option (you will need to sanity check it though). If the
>> board only ever has 64MB it might be worth printing a warning to the
>> user if they specify an something. Although there might be a default
>> if they don't use -m, which makes it hard to print out a warning
>> message.
>
>
> This -m confuses me. Why is it necessary for an embedded board? RAM chip
> is fixed and not extendable. Whereas normal PC may have extra RAM slots.
> If another board has more RAM then we would instantiate another machine for
> it
> with that RAM size. Please explain. Maybe I am thinking in wrong direction.

I agree with you, it doesn't make sense for every board. For some
embedded boards it does make sense (ZynqMP can have a customisable
amount of memory) but for most it doesn't make too much sense.

In saying that it is a commonly used QEMU option, if you can find a
way to report a warning if the user tries to specify a custom amount
of memory I think that would be beneficial as QEMU will just ignore
their input. I have a feeling that the ram_size variable will be set
even if the user doesn't specify anything, which we don't want to
report a warning on.

Thanks,
Alistair

>
> Thanks,
> Sundeep

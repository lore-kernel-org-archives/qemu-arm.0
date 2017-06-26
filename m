Received: by 10.25.15.197 with SMTP id 66csp1807199lfp;
        Mon, 26 Jun 2017 15:49:52 -0700 (PDT)
X-Received: by 10.237.54.71 with SMTP id e65mr3426875qtb.146.1498517392597;
        Mon, 26 Jun 2017 15:49:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498517392; cv=none;
        d=google.com; s=arc-20160816;
        b=LG95uxhR4qnUbEgWPfecSxVZfogb9644TPSjHShVxzdfbMRbdd8p5QP5Spt+61R675
         cbiGsNbBApeM26tCpYdNnZ1RXGsIvlUV7F6jcgHVe8jLBy+l+0JUrbU4gBlK22zVQYxp
         RpEwS0CEfbfcpnHl9AmHmJDkW+ULazeWTf9tjW5tpNWLTtr8ug6Xuak6C9jvU3mLPOe4
         Q2CIHZ7jhIlEQLITPefFgEMaXcbGTrWntVCvdOp/s8s8+5x1I3q6mv66+tVkuHCs27Be
         LEe7N6J1MKwi5g4pkEoWftW1j5hg7TWNtARpvmolWXqrUs4OwbVsauX8QUuoBRpncMAE
         kHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qHe0ZRvCKdtziF1pnudkKvPYWih/hQx4b936utGwf2A=;
        b=qx95u1CSsTY/czYqztv8H4DkTl1dKRg5CttASC+9Trc6yKIaBsqomWAbTzOsIGlAl5
         MYOroxDi8BT6FupIjN9bsMbTF98U++TtRgDoqCoNa/TH3FEqx+2BpK/85eUE9koLxoVv
         Gy2vjklrVeMlr9vHkvkmtc3FIp3is0yh9L3aKBQDwOZ8jl+Hfeyz6MR9CM+ogILjMIrJ
         GyVzpSPs7MoJC8GLG77gx4hOMMlcCMQ5QNaMP5NFAlhBtWYQ1GsXTFiAyxLhC7T2rAWF
         9sxbKmwASYqtrz2NecSubBWxnb+UysZ9fn9cK9aZtxkGAssMkNKFPP/9zQQsChnLgLu8
         jDGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=JX+rhOeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h53si1254260qtb.180.2017.06.26.15.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Jun 2017 15:49:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=JX+rhOeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49346 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPcpJ-00043M-TY
	for alex.bennee@linaro.org; Mon, 26 Jun 2017 18:49:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dPcpF-00041q-OQ
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 18:49:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dPcpE-0000dr-2T
	for qemu-arm@nongnu.org; Mon, 26 Jun 2017 18:49:45 -0400
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:33461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dPcpA-0000bW-Rm; Mon, 26 Jun 2017 18:49:41 -0400
Received: by mail-wr0-x244.google.com with SMTP id x23so30523247wrb.0;
	Mon, 26 Jun 2017 15:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qHe0ZRvCKdtziF1pnudkKvPYWih/hQx4b936utGwf2A=;
	b=JX+rhOeWtuLVHzUhuLlbZADDX2CiSlMC771UtduXROiBqzIvaz6iOHAbRdmcWcL3ET
	7Z+wKpnib/1Hz3J44eO1WPSqT+oP04gESAMZbjCM2N1YxKcMw43mHFwR/3TTxFTquVMF
	31XYEc9BloWKJjOobWl+QGwO/kBy6phTUS0DcUaFhQMKKrrWILLZ3nsLiojXFH8gBvzV
	WXj+URooOofSJyd/vqOQXFqrJpePVoUo6REFKQxO7WJrYzTPBzbO1IJPYhVQlaAeQnjD
	g4WuneaV9Okvx6JNJfU8pCLxHZKkJKVU774V8R6QNMk+ZkEH+GrPlEJ24sCZlJE9wwBr
	7zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qHe0ZRvCKdtziF1pnudkKvPYWih/hQx4b936utGwf2A=;
	b=NN9bFnTjp9fjPft/ah6UCtBVgE7TVe7IgBA+xsKx3tlJ+QkwsoFJ5e6R9r+BvEHNdw
	Hb14aWnnmZiDq+uQ+mKTqgq+9/q3a0vx3TBHcbISNIGgtJHG7Ln3Eamth2Lr9Zzue5vJ
	+uPNpfI6y6e56WKGu22E+hvQ1c1U5IQxp//JgdHWcBfnUIUStCbaQY9NYXdcayRL+K8N
	YGhx5k0sNUmC8LDIDkSj78rbbCWNNqsJz0aZYhNsBECvKEkv05vGxaCMJ8GCxWR/6TOd
	XcWYAkcs4diCoJGThkbnePgR0j9Lu6XSL9UBhXfpA683SgOvRY8QMQ0P53EgAxhsJEev
	w5uw==
X-Gm-Message-State: AKS2vOzMneoDd1z9jqosQANgSkoaefyVGOkE81pDouFiIwswjeV5SgmR
	3u71r6Hcl0lnur5WvlaPmeZCDRlBRg==
X-Received: by 10.223.176.61 with SMTP id f58mr14273118wra.74.1498517379566;
	Mon, 26 Jun 2017 15:49:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.88 with HTTP; Mon, 26 Jun 2017 15:49:08 -0700 (PDT)
In-Reply-To: <CALHRZurUtRV+3=L0PCADuj2BLbu2i1=MQomx2vbEiJSt1TNb+Q@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<1494949133-2202-6-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKPwRaXsgcuGC28x_pA9CYA-tcCnSBGNX1Qv3d3cXX8rsg@mail.gmail.com>
	<CALHRZupvtuE7oVdPa+kpaxP+ZrkHNzdJJV+fJq9nW1nHKX=5OA@mail.gmail.com>
	<CAKmqyKNA9VUV311XACwpt15PKas5HbBNM0Vdi5Z60q_HGhioTA@mail.gmail.com>
	<CALHRZurUtRV+3=L0PCADuj2BLbu2i1=MQomx2vbEiJSt1TNb+Q@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Jun 2017 15:49:08 -0700
Message-ID: <CAKmqyKOcWFNKusosunD=MF3x0B=8=n2q9MLZmx5QzXrMxeH-FQ@mail.gmail.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
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
X-TUID: 5LvWQ37rcoFm

On Mon, Jun 26, 2017 at 9:01 AM, sundeep subbaraya
<sundeep.lkml@gmail.com> wrote:
> Hi Alistair,
>
> On Wed, May 31, 2017 at 4:02 AM, Alistair Francis <alistair23@gmail.com>
> wrote:
>>
>> On Sun, May 28, 2017 at 10:26 PM, sundeep subbaraya
>> <sundeep.lkml@gmail.com> wrote:
>> > Hi Alistair,
>> >
>> > On Sat, May 27, 2017 at 5:30 AM, Alistair Francis <alistair23@gmail.com>
>> > wrote:
>> >>
>> >> On Tue, May 16, 2017 at 8:38 AM, Subbaraya Sundeep
>> >> <sundeep.lkml@gmail.com> wrote:
>> >> > Emulated Emcraft's Smartfusion2 System On Module starter
>> >> > kit.
>> >> >
>> >> > Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> >> > ---
>> >> >  hw/arm/Makefile.objs |  1 +
>> >> >  hw/arm/msf2-som.c    | 89
>> >> > ++++++++++++++++++++++++++++++++++++++++++++++++++++
>> >> >  2 files changed, 90 insertions(+)
>> >> >  create mode 100644 hw/arm/msf2-som.c
>> >> >
>> >> > diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
>> >> > index c828061..4b02093 100644
>> >> > --- a/hw/arm/Makefile.objs
>> >> > +++ b/hw/arm/Makefile.objs
>> >> > @@ -5,6 +5,7 @@ obj-y += omap_sx1.o palm.o realview.o spitz.o
>> >> > stellaris.o
>> >> >  obj-y += tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
>> >> >  obj-$(CONFIG_ACPI) += virt-acpi-build.o
>> >> >  obj-y += netduino2.o
>> >> > +obj-y += msf2-som.o
>> >>
>> >> This should be obj-$(CONFIG_MSF2).
>> >
>> >
>> > Ok will change it.
>> >>
>> >>
>> >> >  obj-y += sysbus-fdt.o
>> >> >
>> >> >  obj-y += armv7m.o exynos4210.o pxa2xx.o pxa2xx_gpio.o pxa2xx_pic.o
>> >> > diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
>> >> > new file mode 100644
>> >> > index 0000000..cd2b759
>> >> > --- /dev/null
>> >> > +++ b/hw/arm/msf2-som.c
>> >> > @@ -0,0 +1,89 @@
>> >> > +/*
>> >> > + * SmartFusion2 SOM starter kit(from Emcraft) emulation.
>> >> > + *
>> >> > + * Copyright (c) 2017 Subbaraya Sundeep <sundeep.lkml@gmail.com>
>> >> > + *
>> >> > + * Permission is hereby granted, free of charge, to any person
>> >> > obtaining a copy
>> >> > + * of this software and associated documentation files (the
>> >> > "Software"), to deal
>> >> > + * in the Software without restriction, including without limitation
>> >> > the rights
>> >> > + * to use, copy, modify, merge, publish, distribute, sublicense,
>> >> > and/or
>> >> > sell
>> >> > + * copies of the Software, and to permit persons to whom the
>> >> > Software
>> >> > is
>> >> > + * furnished to do so, subject to the following conditions:
>> >> > + *
>> >> > + * The above copyright notice and this permission notice shall be
>> >> > included in
>> >> > + * all copies or substantial portions of the Software.
>> >> > + *
>> >> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> >> > EXPRESS OR
>> >> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>> >> > MERCHANTABILITY,
>> >> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT
>> >> > SHALL
>> >> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES
>> >> > OR
>> >> > OTHER
>> >> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> >> > ARISING FROM,
>> >> > + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> >> > DEALINGS IN
>> >> > + * THE SOFTWARE.
>> >> > + */
>> >> > +
>> >> > +#include "qemu/osdep.h"
>> >> > +#include "qapi/error.h"
>> >> > +#include "hw/boards.h"
>> >> > +#include "hw/arm/msf2-soc.h"
>> >> > +#include "hw/arm/arm.h"
>> >> > +#include "exec/address-spaces.h"
>> >> > +
>> >> > +#define DDR_BASE_ADDRESS      0xA0000000
>> >> > +#define DDR_SIZE              (64 * M_BYTE)
>> >> > +
>> >> > +static void emcraft_sf2_init(MachineState *machine)
>> >> > +{
>> >> > +    DeviceState *dev;
>> >> > +    DeviceState *spi_flash;
>> >> > +    MSF2State *soc;
>> >> > +    DriveInfo *dinfo = drive_get_next(IF_MTD);
>> >> > +    qemu_irq cs_line;
>> >> > +    SSIBus *spi_bus;
>> >> > +    MemoryRegion *sysmem = get_system_memory();
>> >> > +    MemoryRegion *ddr = g_new(MemoryRegion, 1);
>> >> > +
>> >> > +    memory_region_init_ram(ddr, NULL, "ddr-ram", DDR_SIZE,
>> >> > +                           &error_fatal);
>> >> > +    vmstate_register_ram_global(ddr);
>> >> > +    memory_region_add_subregion(sysmem, DDR_BASE_ADDRESS, ddr);
>> >>
>> >> The user can use -m to specify the amount of RAM to create in the
>> >> machine. Unless this board only ever includes 64MB of RAM you should
>> >> use that option (you will need to sanity check it though). If the
>> >> board only ever has 64MB it might be worth printing a warning to the
>> >> user if they specify an something. Although there might be a default
>> >> if they don't use -m, which makes it hard to print out a warning
>> >> message.
>> >
>> >
>> > This -m confuses me. Why is it necessary for an embedded board? RAM chip
>> > is fixed and not extendable. Whereas normal PC may have extra RAM slots.
>> > If another board has more RAM then we would instantiate another machine
>> > for
>> > it
>> > with that RAM size. Please explain. Maybe I am thinking in wrong
>> > direction.
>>
>> I agree with you, it doesn't make sense for every board. For some
>> embedded boards it does make sense (ZynqMP can have a customisable
>> amount of memory) but for most it doesn't make too much sense.
>>
>> In saying that it is a commonly used QEMU option, if you can find a
>> way to report a warning if the user tries to specify a custom amount
>> of memory I think that would be beneficial as QEMU will just ignore
>> their input. I have a feeling that the ram_size variable will be set
>> even if the user doesn't specify anything, which we don't want to
>> report a warning on.
>
>
> Do we need to report and exit if user specifies custom amount of memory?

I had a quick look at other ARM machines and it looks like a lot of
them use the ram_size variable from the machine to set the size of the
memory, but some have just hard coded values.

I'm not sure if there is an accepted "right" way to do this. If the
board only ever has 64MB of memory then it's probably ok to just hard
code it. Like you said, I don't think user have a high expectation of
adjusting the memory in embedded boards.

Thanks,
Alistair

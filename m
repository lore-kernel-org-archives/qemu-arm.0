Received: by 10.25.227.6 with SMTP id a6csp1296425lfh;
        Sun, 2 Jul 2017 10:40:25 -0700 (PDT)
X-Received: by 10.237.36.115 with SMTP id s48mr39658332qtc.137.1499017225598;
        Sun, 02 Jul 2017 10:40:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499017225; cv=none;
        d=google.com; s=arc-20160816;
        b=fivZmQ71WmyU6t7gYWZjpfx7c/jSAjBAA7ejm7NzNqk5Msk38BK1c4ZBXBxOJ+bPu9
         erPFM/czDFYVfxJi0c+Pra0TTbDblIuHuTxLDqIpq4N7pXFtZ2CkSH2DBeS9B6dVFU3k
         fl/+UEQ5GIRjYhOeCHRrtHOQXT6weoCb+GhShCSS27h13jQ9311P+Mf9zBlLYUcT3QPX
         0QAB4LchxAXVtZLiGXER05lbQHSnU2buomUjIfHBus5VMUVOPX4MziVDhARJqWt1dQe2
         KjwZX+/DqcW7BSnnaQn1JMndS3Hv/uQE4Y8k5fgtEg/4qem2TY8GkaZqHe7ZW3mWn3Ie
         Dtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Hbp8BWXZezqEtjgWsiWqWfwrEi3ukrG5dJeGTXxiSDo=;
        b=n8hb5P6xW1+0lruUbeMPFOsk8APkNNYs+I+oYV0sfcFAAJtOOlY0zPoRli3ZuB/iAo
         Pmaj2K9lEBb+R0s7HBkPAUwBR7tTiJvSLGB0NfcDeDK+BOUPmpa5zfEQaB1rFa0jwF1K
         OYoyCNfSzNLItKbhgCVXwjaSwzLWO5ztGPcd7vBRuxHQxUQJhRtjqL09RWDADHHOeHGL
         Y350flyde2SWT07AmPma+enYVwd78EZAo+c04dhMNv8ib+4gF3d6CnArK8y9nzP0ze4J
         MeidygPiuM/8P4VWIg6kDaWEs/nUgV+FOxauTT30ZEKiKJCatJBNeTevdWmnf1COsmo5
         MVkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=nYvoNbSM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p188si12770116qkc.290.2017.07.02.10.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Jul 2017 10:40:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=nYvoNbSM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRir8-0000p8-Pu
	for alex.bennee@linaro.org; Sun, 02 Jul 2017 13:40:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRiqt-0000dF-VY
	for qemu-arm@nongnu.org; Sun, 02 Jul 2017 13:40:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dRiqr-0007ce-45
	for qemu-arm@nongnu.org; Sun, 02 Jul 2017 13:40:07 -0400
Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244]:36333)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dRiql-0007YX-Qj; Sun, 02 Jul 2017 13:39:59 -0400
Received: by mail-yw0-x244.google.com with SMTP id l21so7773593ywb.3;
	Sun, 02 Jul 2017 10:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Hbp8BWXZezqEtjgWsiWqWfwrEi3ukrG5dJeGTXxiSDo=;
	b=nYvoNbSM/t1MDouuAAkHFlPOZeuV5VMjzFYEYaSgHfXp5I0srxCXx+SlGRj9YIbwEc
	hHhG/Ml1fbMV3fcUVqiQuJT6eesi2YILqaGhycRot6vCdpe4oilSyFJSBx6J8KETumFG
	kMS/dZ5v0nuPDDPCqfdYFkVm6WQ1h3O4c6SB1XqXW/+TGzs4UHUu6Ky45bujG0D6VCQq
	UPAcAAzmr8vLQAVhmoFdDbaXY4GktRS4YSJi3YmUweZIonx8Mmnxk8btlNSKfEl8AVYH
	s0ogQkcZ95vW1v+MxgEMoXlM+gpNQM99ZzpqFCraVt9ORj8yDJ7ubyI5uT90egnsFaSN
	g3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Hbp8BWXZezqEtjgWsiWqWfwrEi3ukrG5dJeGTXxiSDo=;
	b=IjIs/VaUo7ueGYwkdNnqxOLjiEN93rYCnUwKFhGGy64ejq2IOJiZnbpATc0wScps6Q
	RZry7Ite/XUZiLay61FqSWSXw6cB6WRGc+3RraAI8HO7hGMGzaQuzZi8ipbq40U2OEDQ
	oAJxYpCQn0kEaNcovrZ/qCeEBBlLfClyJlGk2tUKf1P7yew/hW5jQI6r9NHzhUVp2gUF
	7coAy4AX4CSJMrJoPPxn+ojBFP6JuRFf+2iImed7F7sIzM2IAsGYwwGlVsJaFmdv+JAW
	NnoRioHjgjGN9yONxMDf3lOrKM8Y6v6PfH0SQj+QLk2DLGvkooCvgGKSBwvwMJbjw+b4
	gHzg==
X-Gm-Message-State: AKS2vOxwL8nLnnODRIYWCObu8i9rjEx+qd4FckK0uKaA5c1w7WlMro9R
	tPeYU3oMm0bfUqFK2+Jsx8DfYepvBg==
X-Received: by 10.13.194.4 with SMTP id e4mr25885522ywd.151.1499017197508;
	Sun, 02 Jul 2017 10:39:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.233.5 with HTTP; Sun, 2 Jul 2017 10:39:56 -0700 (PDT)
In-Reply-To: <CALHRZuoFU6vmnEBobVEqesApB6qm6cmNQfm9oVMG2RaooNEh7Q@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
	<CALHRZur8Uh0JCnOoY-_mUU_fyzbUgxbmWKtfOoB-GTYR5UcEnQ@mail.gmail.com>
	<CALHRZuoVHFOYV345JmvSkfJHsVjS7Wv_ySzAUtwo1D7eyoS_XQ@mail.gmail.com>
	<648515bf-ba1e-3d7f-d5bd-51b243f8c29f@amsat.org>
	<CALHRZuoihb2Oiu9adm=2gPUf-LFdkBR9qw1iV+ohL6kp0t5d=A@mail.gmail.com>
	<CALHRZuoFU6vmnEBobVEqesApB6qm6cmNQfm9oVMG2RaooNEh7Q@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Sun, 2 Jul 2017 23:09:56 +0530
Message-ID: <CALHRZuosbYEcBYgjRu+45RZD6e7VWL5hQErAB7rJNEQ7ZdPguA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a114edbd291dbf405535923b1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::244
Subject: Re: [Qemu-arm] [Qemu devel v5 PATCH 0/5] Add support for
 Smartfusion2 SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +44u0SDKaOuo

--001a114edbd291dbf405535923b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Mon, Jun 26, 2017 at 9:41 PM, sundeep subbaraya <sundeep.lkml@gmail.com>
wrote:

> Hi Philippe,
>
> On Fri, Jun 9, 2017 at 12:51 PM, sundeep subbaraya <sundeep.lkml@gmail.co=
m
> > wrote:
>
>> Hi Philippe,
>>
>> On Wed, May 31, 2017 at 11:06 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org
>> > wrote:
>>
>>> Hi Sundeep,
>>>
>>> On 05/29/2017 02:28 AM, sundeep subbaraya wrote:
>>>
>>>> Hi Philippe,
>>>>
>>>> Any update on this? I will wait for your comments too
>>>> and send next iteration fixing Alistair comments.
>>>>
>>>
>>> Sorry I'm supposed to be in holidays ;)
>>>
>>
>> Ohh sorry currently am in vacation :)
>>
>>>
>>>
>>>> Thanks,
>>>> Sundeep
>>>>
>>>> On Wed, May 17, 2017 at 3:09 PM, sundeep subbaraya
>>>> <sundeep.lkml@gmail.com <mailto:sundeep.lkml@gmail.com>> wrote:
>>>>
>>>>     Hi Philippe,
>>>>
>>>>     On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daud=C3=A9
>>>>     <f4bug@amsat.org <mailto:f4bug@amsat.org>> wrote:
>>>>
>>>>         Hi Sundeep,
>>>>
>>>>         This patchset is way cleaner!
>>>>         I had a fast look and I like it, I'll try to make some time so=
on
>>>>         to review details and test it.
>>>>
>>>>
>>>>     Thank you
>>>>
>>>>
>>>>
>>>>
>>>>         Is your work interested on U-Boot or more focused in Linux
>>>> kernel?
>>>>
>>>>
>>>>     I am interested more in kernel. I had to look into u-boot for firs=
t
>>>>     time for Qemu only.
>>>>     I worked only on FPGAs(load kernel with debugger) till now so neve=
r
>>>>     got a chance to look into u-boot.
>>>>
>>>>
>>>>         If you compile QEMU with libfdt support you can use the -dtb
>>>>         option to pass the blob to the kernel directly, bypassing the
>>>>         bootloader.
>>>>
>>>>     Yeah for armv7m I could not find any thing like that in tree.
>>>>
>>>>
>>>>         If you need a bootloader you may give a look at coreboot which
>>>>         supports dts well, see how Vladimir Serbinenko used Linux's dt
>>>>         to boot a QEMU Versatile Express board:
>>>>         https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-Feb
>>>> ruary/040899.html
>>>>         <https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-Fe
>>>> bruary/040899.html>
>>>>
>>>>     Cool. I will look into it.
>>>>
>>>>     Thanks,
>>>>     Sundeep
>>>>
>>>>
>>>>         Regards,
>>>>
>>>>         Phil.
>>>>
>>>>
>>>>         On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>>>>
>>>>             Hi Qemu-devel,
>>>>
>>>>             I am trying to add Smartfusion2 SoC.
>>>>             SoC is from Microsemi and System on Module(SOM)
>>>>             board is from Emcraft systems. Smartfusion2 has hardened
>>>>             Microcontroller(Cortex-M3)based Sub System and FPGA fabric=
.
>>>>             At the moment only system timer, sysreg and SPI
>>>>             controller are modelled.
>>>>
>>>>             Testing:
>>>>             ./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial
>>>>             mon:stdio \
>>>>             -kernel u-boot.bin -display none -drive
>>>>             file=3Dspi.bin,if=3Dmtd,format=3Draw
>>>>
>>>
>>> I'm not sure the timer is working correctly, U-Boot loops with this
>>> pattern:
>>>
>>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000220
>>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000220
>>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000220
>>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000020
>>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000020
>>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000000
>>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000000
>>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000020
>>> msf2_sysreg_read: addr: 0x00000048 data: 0x00000020
>>> msf2_sysreg_write: addr: 0x00000048 data: 0x00000220
>>>
>>> I checked the images and Linux is booting. But as you mentioned I
> changed u-boot
> for boot delay and have seen this issue. Actually it is taking too long
> for a second.
> Smartfusion2 timer is working fine(Linux) whereas u-boot is using Systick
> for auto-boot
> timer. I did not understand quite correctly about ARM Systick in Qemu. Ho=
w
> do we
> specify frequency of the Systick timer? How Systick is configured to use
> CPU frequency
> since qemu cpu speed is not constant? How frequency has to be specified
> for
> using external clock as Systick input?
>

I figured out that systick uses cpu clock as clock source and
system_clock_scale
need to be set in msf2-soc.c. There is a bug in u-boot where it uses cpu
clock as
systick input but configures systick in external clock mode. I have tested
the modified
u-boot on real hardware too and it works fine. I am calculating
system_clock_scale
as below:
If CPU clock is X MHz then system_clock_scale =3D (1 / X) * 1000

Tested with different frequencies and they are yielding same results.

Please correct me if am wrong. I will send next iteration of patches.

Thanks,
Sundeep

>
> Please help me understand this.
>
> Thanks,
> Sundeep
>
>
>>
>>>>             Binaries u-boot.bin and spi.bin are at:
>>>>
>>>
>>> you can compress spi.bin!
>>>
>>> can you share u-boot.elf with debug symbols too?
>>>
>>
>> Sure. I have tested binaries before pushing. Did you compile the u-boot
>> again?
>> Please wait for a few days I will check and provide once am back.
>>
>> Thanks,
>> Sundeep
>>
>>>
>>> Regards,
>>>
>>> Phil.
>>>
>>>             https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
>>>>
>>>>             <https://github.com/Subbaraya-
>>>> Sundeep/qemu-test-binaries.git>
>>>>
>>>>             U-boot is from Emcraft with modified
>>>>                 - SPI driver not to use PDMA.
>>>>                 - ugly hack to pass dtb to kernel in r1.
>>>>             @
>>>>             https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git
>>>>             <https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.gi=
t
>>>> >
>>>>
>>>>             Linux is 4.5 linux with Smartfusion2 SoC dts and clocksour=
ce
>>>>             driver added by myself @
>>>>             https://github.com/Subbaraya-Sundeep/linux.git
>>>>             <https://github.com/Subbaraya-Sundeep/linux.git>
>>>>
>>>>             v5
>>>>                 As per Philippe comments:
>>>>                     Added abort in Sysreg if guest tries to remap memo=
ry
>>>>                     other than default mapping.
>>>>                     Use of CONFIG_MSF2 in Makefile for soc.c
>>>>                     Fixed incorrect logic in timer model.
>>>>                     Renamed msf2-timer.c -> mss-timer.c
>>>>                             msf2-spi.c -> mss-spi.c also type names
>>>>                     Renamed function msf2_init->emcraft_sf2_init in
>>>>             msf2-som.c
>>>>                     Added part-name,eNVM-size,eSRAM-size,pclk0 and
>>>> pclk1
>>>>                         properties to soc.
>>>>                     Pass soc part-name,memory size and clock rate
>>>>             properties from som.
>>>>             v4:
>>>>                 Fixed build failure by using PRIx macros.
>>>>             v3:
>>>>                 Added SoC file and board file as per Alistair comments=
.
>>>>             v2:
>>>>                 Added SPI controller so that u-boot loads kernel from
>>>>             spi flash.
>>>>             v1:
>>>>                 Initial patch set with timer and sysreg
>>>>
>>>>             Thanks,
>>>>             Sundeep
>>>>
>>>>             Subbaraya Sundeep (5):
>>>>               msf2: Add Smartfusion2 System timer
>>>>               msf2: Microsemi Smartfusion2 System Register block.
>>>>               msf2: Add Smartfusion2 SPI controller
>>>>               msf2: Add Smartfusion2 SoC.
>>>>               msf2: Add Emcraft's Smartfusion2 SOM kit.
>>>>
>>>>              default-configs/arm-softmmu.mak |   1 +
>>>>              hw/arm/Makefile.objs            |   2 +
>>>>              hw/arm/msf2-soc.c               | 201 +++++++++++++++++++=
++
>>>>              hw/arm/msf2-som.c               |  89 ++++++++++
>>>>              hw/misc/Makefile.objs           |   1 +
>>>>              hw/misc/msf2-sysreg.c           | 161 +++++++++++++++++
>>>>              hw/ssi/Makefile.objs            |   1 +
>>>>              hw/ssi/mss-spi.c                | 378
>>>>             ++++++++++++++++++++++++++++++++++++++++
>>>>              hw/timer/Makefile.objs          |   1 +
>>>>              hw/timer/mss-timer.c            | 249
>>>>             ++++++++++++++++++++++++++
>>>>              include/hw/arm/msf2-soc.h       |  69 ++++++++
>>>>              include/hw/misc/msf2-sysreg.h   |  80 +++++++++
>>>>              include/hw/ssi/mss-spi.h        | 104 +++++++++++
>>>>              include/hw/timer/mss-timer.h    |  80 +++++++++
>>>>              14 files changed, 1417 insertions(+)
>>>>              create mode 100644 hw/arm/msf2-soc.c
>>>>              create mode 100644 hw/arm/msf2-som.c
>>>>              create mode 100644 hw/misc/msf2-sysreg.c
>>>>              create mode 100644 hw/ssi/mss-spi.c
>>>>              create mode 100644 hw/timer/mss-timer.c
>>>>              create mode 100644 include/hw/arm/msf2-soc.h
>>>>              create mode 100644 include/hw/misc/msf2-sysreg.h
>>>>              create mode 100644 include/hw/ssi/mss-spi.h
>>>>              create mode 100644 include/hw/timer/mss-timer.h
>>>>
>>>>
>>>>
>>>>
>>
>

--001a114edbd291dbf405535923b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Mon, Jun 26, 2017 at 9:41 PM, sundeep subbaraya <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blank">=
sundeep.lkml@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr">Hi Philippe,<br><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote"><div><div class=3D"h5">On Fri, Jun 9, 2017 at 12:51 PM,=
 sundeep subbaraya <span dir=3D"ltr">&lt;<a href=3D"mailto:sundeep.lkml@gma=
il.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Philippe,<div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote"><span>On Wed, May 31, 2017 at 11:=
06 AM, Philippe Mathieu-Daud=C3=A9 <span dir=3D"ltr">&lt;<a href=3D"mailto:=
f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Hi Sundeep,<span><br>
<br>
On 05/29/2017 02:28 AM, sundeep subbaraya wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Philippe,<br>
<br>
Any update on this? I will wait for your comments too<br>
and send next iteration fixing Alistair comments.<br>
</blockquote>
<br></span>
Sorry I&#39;m supposed to be in holidays ;)<br></blockquote><div>=C2=A0</di=
v></span><div>Ohh sorry currently am in vacation :) =C2=A0</div><div><div c=
lass=3D"m_4823940190284808434h5"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span>
<br>
Thanks,<br>
Sundeep<br>
<br>
On Wed, May 17, 2017 at 3:09 PM, sundeep subbaraya<br></span><span>
&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blank">sundeep.lkm=
l@gmail.com</a> &lt;mailto:<a href=3D"mailto:sundeep.lkml@gmail.com" target=
=3D"_blank">sundeep.lkml@gmail.com</a><wbr>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Hi Philippe,<br>
<br>
=C2=A0 =C2=A0 On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daud=C3=A9<=
br></span><div><div class=3D"m_4823940190284808434m_779071728205758721h5">
=C2=A0 =C2=A0 &lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bu=
g@amsat.org</a> &lt;mailto:<a href=3D"mailto:f4bug@amsat.org" target=3D"_bl=
ank">f4bug@amsat.org</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi Sundeep,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 This patchset is way cleaner!<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 I had a fast look and I like it, I&#39;ll try t=
o make some time soon<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to review details and test it.<br>
<br>
<br>
=C2=A0 =C2=A0 Thank you<br>
<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Is your work interested on U-Boot or more focus=
ed in Linux kernel?<br>
<br>
<br>
=C2=A0 =C2=A0 I am interested more in kernel. I had to look into u-boot for=
 first<br>
=C2=A0 =C2=A0 time for Qemu only.<br>
=C2=A0 =C2=A0 I worked only on FPGAs(load kernel with debugger) till now so=
 never<br>
=C2=A0 =C2=A0 got a chance to look into u-boot.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 If you compile QEMU with libfdt support you can=
 use the -dtb<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 option to pass the blob to the kernel directly,=
 bypassing the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bootloader.<br>
<br>
=C2=A0 =C2=A0 Yeah for armv7m I could not find any thing like that in tree.=
<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 If you need a bootloader you may give a look at=
 coreboot which<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 supports dts well, see how Vladimir Serbinenko =
used Linux&#39;s dt<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 to boot a QEMU Versatile Express board:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://mail.coreboot.org/pipermail/=
coreboot-gerrit/2016-February/040899.html" rel=3D"noreferrer" target=3D"_bl=
ank">https://mail.coreboot.org/pipe<wbr>rmail/coreboot-gerrit/2016-Feb<wbr>=
ruary/040899.html</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://mail.coreboot.org/piperm=
ail/coreboot-gerrit/2016-February/040899.html" rel=3D"noreferrer" target=3D=
"_blank">https://mail.coreboot.org/pip<wbr>ermail/coreboot-gerrit/2016-Fe<w=
br>bruary/040899.html</a>&gt;<br>
<br>
=C2=A0 =C2=A0 Cool. I will look into it.<br>
<br>
=C2=A0 =C2=A0 Thanks,<br>
=C2=A0 =C2=A0 Sundeep<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Regards,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Phil.<br>
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote=
:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi Qemu-devel,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 I am trying to add Smartfusion2 S=
oC.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SoC is from Microsemi and System =
on Module(SOM)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 board is from Emcraft systems. Sm=
artfusion2 has hardened<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Microcontroller(Cortex-M3)base<wb=
r>d Sub System and FPGA fabric.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 At the moment only system timer, =
sysreg and SPI<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 controller are modelled.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Testing:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ./arm-softmmu/qemu-system-arm -M =
smartfusion2-som -serial<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mon:stdio \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -kernel u-boot.bin -display none =
-drive<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=3Dspi.bin,if=3Dmtd,format=3D=
raw<br>
</div></div></blockquote>
<br>
I&#39;m not sure the timer is working correctly, U-Boot loops with this pat=
tern:<br>
<br>
msf2_sysreg_read: addr: 0x00000048 data: 0x00000220<br>
msf2_sysreg_write: addr: 0x00000048 data: 0x00000220<br>
msf2_sysreg_read: addr: 0x00000048 data: 0x00000220<br>
msf2_sysreg_write: addr: 0x00000048 data: 0x00000020<br>
msf2_sysreg_read: addr: 0x00000048 data: 0x00000020<br>
msf2_sysreg_write: addr: 0x00000048 data: 0x00000000<br>
msf2_sysreg_read: addr: 0x00000048 data: 0x00000000<br>
msf2_sysreg_write: addr: 0x00000048 data: 0x00000020<br>
msf2_sysreg_read: addr: 0x00000048 data: 0x00000020<br>
msf2_sysreg_write: addr: 0x00000048 data: 0x00000220<span><br>
<br></span></blockquote></div></div></div></div></div></blockquote></div></=
div><div>I checked the images and Linux is booting. But as you mentioned I =
changed u-boot<br></div><div>for boot delay and have seen this issue. Actua=
lly it is taking too long for a second.<br></div><div>Smartfusion2 timer is=
 working fine(Linux) whereas u-boot is using Systick for auto-boot<br></div=
><div>timer. I did not understand quite correctly about ARM Systick in Qemu=
. How do we<br></div><div>specify frequency of the Systick timer? How Systi=
ck is configured to use CPU frequency<br></div><div>since qemu cpu speed is=
 not constant? How frequency has to be specified for <br>using external clo=
ck as Systick input?<br></div></div></div></div></blockquote><div><br></div=
><div>I figured out that systick uses cpu clock as clock source and system_=
clock_scale<br></div><div>need to be set in msf2-soc.c. There is a bug in u=
-boot where it uses cpu clock as<br></div><div>systick input but configures=
 systick in external clock mode. I have tested the modified <br>u-boot on r=
eal hardware too and it works fine. I am calculating system_clock_scale<br>=
</div><div>as below:<br></div><div>If CPU clock is X MHz then system_clock_=
scale =3D (1 / X) * 1000<br></div><div><br></div><div>Tested with different=
 frequencies and they are yielding same results.<br><br></div><div>Please c=
orrect me if am wrong. I will send next iteration of patches.<br><br></div>=
<div>Thanks,<br></div><div>Sundeep<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><div=
>=C2=A0<br></div><div>Please help me understand this.<br><br></div><div>Tha=
nks,<br></div><div>Sundeep<br></div><div><div class=3D"h5"><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"=
><div class=3D"gmail_quote"><div><div class=3D"m_4823940190284808434h5"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Binaries u-boot.bin and spi.bin a=
re at:<br>
</blockquote>
<br></span>
you can compress spi.bin!<br>
<br>
can you share u-boot.elf with debug symbols too?<br></blockquote><div><br><=
/div></div></div><div>Sure. I have tested binaries before pushing. Did you =
compile the u-boot again?</div><div>Please wait for a few days I will check=
 and provide once am back.</div><div><br></div><div>Thanks,</div><div>Sunde=
ep</div><div><div class=3D"m_4823940190284808434h5"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
Regards,<br>
<br>
Phil.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/Sub=
baraya-Sundeep/qemu-test-binaries.git" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/Subbaraya-S<wbr>undeep/qemu-test-binaries.git</a><div><=
div class=3D"m_4823940190284808434m_779071728205758721h5"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://github.com=
/Subbaraya-Sundeep/qemu-test-binaries.git" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/Subbaraya-<wbr>Sundeep/qemu-test-binaries.git</a><w=
br>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 U-boot is from Emcraft with modif=
ied<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - SPI driver not to=
 use PDMA.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - ugly hack to pass=
 dtb to kernel in r1.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/Sub=
baraya-Sundeep/emcraft-uboot-sf2.git" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/Subbaraya-S<wbr>undeep/emcraft-uboot-sf2.git</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://github.com=
/Subbaraya-Sundeep/emcraft-uboot-sf2.git" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/Subbaraya-<wbr>Sundeep/emcraft-uboot-sf2.git</a>&gt;=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Linux is 4.5 linux with Smartfusi=
on2 SoC dts and clocksource<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 driver added by myself @<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/Sub=
baraya-Sundeep/linux.git" rel=3D"noreferrer" target=3D"_blank">https://gith=
ub.com/Subbaraya-S<wbr>undeep/linux.git</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://github.com=
/Subbaraya-Sundeep/linux.git" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/Subbaraya-<wbr>Sundeep/linux.git</a>&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v5<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 As per Philippe com=
ments:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Added=
 abort in Sysreg if guest tries to remap memory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 other=
 than default mapping.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Use o=
f CONFIG_MSF2 in Makefile for soc.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fixed=
 incorrect logic in timer model.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Renam=
ed msf2-timer.c -&gt; mss-timer.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 msf2-spi.c -&gt; mss-spi.c also type names<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Renam=
ed function msf2_init-&gt;emcraft_sf2_init in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msf2-som.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Added=
 part-name,eNVM-size,eSRAM-size<wbr>,pclk0 and pclk1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 properties to soc.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Pass =
soc part-name,memory size and clock rate<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 properties from som.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v4:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fixed build failure=
 by using PRIx macros.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v3:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Added SoC file and =
board file as per Alistair comments.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Added SPI controlle=
r so that u-boot loads kernel from<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi flash.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v1:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Initial patch set w=
ith timer and sysreg<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanks,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Sundeep<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Subbaraya Sundeep (5):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msf2: Add Smartfusion2 Sys=
tem timer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msf2: Microsemi Smartfusio=
n2 System Register block.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msf2: Add Smartfusion2 SPI=
 controller<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msf2: Add Smartfusion2 SoC=
.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msf2: Add Emcraft&#39;s Sm=
artfusion2 SOM kit.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default-configs/arm-softmmu=
.m<wbr>ak |=C2=A0 =C2=A01 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw/arm/Makefile.objs=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw/arm/msf2-soc.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 201 +++++++++++++++++++++<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw/arm/msf2-som.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 89 ++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw/misc/Makefile.objs=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw/misc/msf2-sysreg.c=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 161 +++++++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw/ssi/Makefile.objs=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw/ssi/mss-spi.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 378<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++++++++++++++++++++++++++++++<wb=
r>++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw/timer/Makefile.objs=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw/timer/mss-timer.c=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 249<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++++++++++++++++++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/hw/arm/msf2-soc.h=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 69 ++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/hw/misc/msf2-sysreg=
.h<wbr>=C2=A0 =C2=A0|=C2=A0 80 +++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/hw/ssi/mss-spi.h=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 104 +++++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/hw/timer/mss-timer.=
h=C2=A0 =C2=A0 |=C2=A0 80 +++++++++<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014 files changed, 1417 inse=
rtions(+)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 hw/arm/m=
sf2-soc.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 hw/arm/m=
sf2-som.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 hw/misc/=
msf2-sysreg.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 hw/ssi/m=
ss-spi.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 hw/timer=
/mss-timer.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 include/=
hw/arm/msf2-soc.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 include/=
hw/misc/msf2-sysreg.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 include/=
hw/ssi/mss-spi.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0create mode 100644 include/=
hw/timer/mss-timer.h<br>
<br>
<br>
<br>
</div></div></blockquote>
</blockquote></div></div></div><br></div></div>
</blockquote></div></div></div><br></div></div>
</blockquote></div><br></div></div>

--001a114edbd291dbf405535923b1--

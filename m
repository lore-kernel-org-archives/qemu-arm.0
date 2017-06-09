Received: by 10.25.0.23 with SMTP id 23csp2927007lfa;
        Fri, 9 Jun 2017 00:21:45 -0700 (PDT)
X-Received: by 10.55.37.210 with SMTP id l79mr44093769qkl.227.1496992905443;
        Fri, 09 Jun 2017 00:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496992905; cv=none;
        d=google.com; s=arc-20160816;
        b=XvseMs9r4gcMOUIFjllOm8SR5Hq9XsnXH/UQ6hYIa8FtVEuJh9FN8ALKGa4ducc/hI
         ++gH5w2zLBnBRPYfIwxKf6/goeRRaPNMLM9RMwl02LYe7KZquEf8Tinv8cxoptvy/880
         KEvFo+NApl6Ag5idHvA+v9S01NzAP0/aTuN1Us+RkmRvaH829e3BY/ancmy/+NaOlg8h
         RhtiQgcXgTgGzmLQ81ztbG068XFiImtGEoKjfVYJ61oxjYdcM6QemWvNIJcH7nFCx9Ak
         6ozGpxXlFfCiQx3kwrqAP00w5biF+BdDPj6oa87qpRn+gKdiznLZW5XiUD2Kv62JU1GL
         GVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Dh56UVt8Cq0US+XMN0vLVAFMOzj1Qb6i8PQpiz/Wt5Q=;
        b=Wt7xs8IvyXWkkbxViY8xYQqvTX9l9kDZ1PQSfI5QL1fIih2D/W2UT0mJhHCVdFj91+
         GDF7z9NN8eYiR+S8LAyktCHPcpGJ7BezxRyufHxObKffsdVWFJbOkOSu0iaVLUKeV0de
         Ljag+kWK8lemuWn90xAdFibwgtHwsk+qiMT1Yq/uuTXymBP2utqtMnWzmv/PPPHJyJKs
         oQnfs1CQkYIZIkjVtekmQ3snLdbkhPcdfaYIXUQrgQ/j+lqGRku29z7W3CwWqpNBZE/Z
         xlfjxJ5tA0lhlwKNHAyB192a9t5Hol9escMSu3GT15U3/5KeWCsrIhELoHZ6YFqpr5ko
         OIDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s34si274240qta.167.2017.06.09.00.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Jun 2017 00:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJEEo-0008Fp-Nk
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 03:21:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dJEEi-0008DJ-9y
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 03:21:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dJEEg-00087S-DP
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 03:21:36 -0400
Received: from mail-yw0-x242.google.com ([2607:f8b0:4002:c05::242]:33707)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dJEEb-00086Y-NV; Fri, 09 Jun 2017 03:21:29 -0400
Received: by mail-yw0-x242.google.com with SMTP id y64so3075534ywe.0;
	Fri, 09 Jun 2017 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Dh56UVt8Cq0US+XMN0vLVAFMOzj1Qb6i8PQpiz/Wt5Q=;
	b=rYbBoCAEXNfuqRBaJyPjYojfb6rn20+Mvc7VTpMXQuW3j0kHLAbPBVSQEa4iWqxboB
	rNDvGO3ORxp2VUFX306OOLOezf1vbDTaXkfN2v2IZuNhm5VzgwsUly2n7xdjP6AeYEGY
	9bFCpNKbue8nBgsJcA8iTzKcyQemaD2u+NWOj97BCAc+1+6/hrcbwh4pS7rtVBLkQ7w7
	gWM2GTzyKb+ZgAbGmJRK5g6UTyhZ0Nh3HTAAkBJ3uWjZYgtC+6xuFD7uT/iHhVVtjJ0U
	z1UQXoXnMpNA35chY/ld3l5Rxm1kal2SNST4pZM71Sq38nY1lgp1XnW77u/IvF6Qr5/6
	xPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Dh56UVt8Cq0US+XMN0vLVAFMOzj1Qb6i8PQpiz/Wt5Q=;
	b=D5ke+o6ZQ+nFMytqxJEpr7BolgXeMIsjT0ZRZoc+eHDiZHbqXdI9T036peQuLZHB28
	eUDsuR0E7TMkUGCJhen2mTgII6YJsl9JLMTrhvmdXYv5aZG9f3kyy51qmXMtu3Ot7NMD
	HUxZ1lot4ezU570xZXkYRQBCrZIKrDH8873wM/u3UGCJpxsumMp9POkvt6pSysSe6mBZ
	mICYITsz4UKO1UGMAMEBNvsN0iIvrQOizGtg4hDxtEEKpd8pBaUVK0ej6Jhhv2yNHdOy
	pmSCKJeFYmmqAG1tsB0POjs2utKi2fXogiAWQuah/LXeZr2WCZ0Pc5/7aEhs4M1gOJFt
	J8WQ==
X-Gm-Message-State: AODbwcBK17jLSbyk1/Tb11Xx/977IJThCA1PW+FUtaDHKqTX6JbmzJCk
	ABz+IeLtPsXpaQT1jthwm+w+k6F0Eg==
X-Received: by 10.13.192.5 with SMTP id b5mr14587145ywd.52.1496992887394; Fri,
	09 Jun 2017 00:21:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.199 with HTTP; Fri, 9 Jun 2017 00:21:26 -0700 (PDT)
In-Reply-To: <648515bf-ba1e-3d7f-d5bd-51b243f8c29f@amsat.org>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
	<CALHRZur8Uh0JCnOoY-_mUU_fyzbUgxbmWKtfOoB-GTYR5UcEnQ@mail.gmail.com>
	<CALHRZuoVHFOYV345JmvSkfJHsVjS7Wv_ySzAUtwo1D7eyoS_XQ@mail.gmail.com>
	<648515bf-ba1e-3d7f-d5bd-51b243f8c29f@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 9 Jun 2017 12:51:26 +0530
Message-ID: <CALHRZuoihb2Oiu9adm=2gPUf-LFdkBR9qw1iV+ohL6kp0t5d=A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a114e3f9848f18b055181d127"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::242
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
X-TUID: hWvdUHsBAR/h

--001a114e3f9848f18b055181d127
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Wed, May 31, 2017 at 11:06 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org>
wrote:

> Hi Sundeep,
>
> On 05/29/2017 02:28 AM, sundeep subbaraya wrote:
>
>> Hi Philippe,
>>
>> Any update on this? I will wait for your comments too
>> and send next iteration fixing Alistair comments.
>>
>
> Sorry I'm supposed to be in holidays ;)
>

Ohh sorry currently am in vacation :)

>
>
>> Thanks,
>> Sundeep
>>
>> On Wed, May 17, 2017 at 3:09 PM, sundeep subbaraya
>> <sundeep.lkml@gmail.com <mailto:sundeep.lkml@gmail.com>> wrote:
>>
>>     Hi Philippe,
>>
>>     On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daud=C3=A9
>>     <f4bug@amsat.org <mailto:f4bug@amsat.org>> wrote:
>>
>>         Hi Sundeep,
>>
>>         This patchset is way cleaner!
>>         I had a fast look and I like it, I'll try to make some time soon
>>         to review details and test it.
>>
>>
>>     Thank you
>>
>>
>>
>>
>>         Is your work interested on U-Boot or more focused in Linux kerne=
l?
>>
>>
>>     I am interested more in kernel. I had to look into u-boot for first
>>     time for Qemu only.
>>     I worked only on FPGAs(load kernel with debugger) till now so never
>>     got a chance to look into u-boot.
>>
>>
>>         If you compile QEMU with libfdt support you can use the -dtb
>>         option to pass the blob to the kernel directly, bypassing the
>>         bootloader.
>>
>>     Yeah for armv7m I could not find any thing like that in tree.
>>
>>
>>         If you need a bootloader you may give a look at coreboot which
>>         supports dts well, see how Vladimir Serbinenko used Linux's dt
>>         to boot a QEMU Versatile Express board:
>>         https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-
>> February/040899.html
>>         <https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-
>> February/040899.html>
>>
>>     Cool. I will look into it.
>>
>>     Thanks,
>>     Sundeep
>>
>>
>>         Regards,
>>
>>         Phil.
>>
>>
>>         On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>>
>>             Hi Qemu-devel,
>>
>>             I am trying to add Smartfusion2 SoC.
>>             SoC is from Microsemi and System on Module(SOM)
>>             board is from Emcraft systems. Smartfusion2 has hardened
>>             Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
>>             At the moment only system timer, sysreg and SPI
>>             controller are modelled.
>>
>>             Testing:
>>             ./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial
>>             mon:stdio \
>>             -kernel u-boot.bin -display none -drive
>>             file=3Dspi.bin,if=3Dmtd,format=3Draw
>>
>
> I'm not sure the timer is working correctly, U-Boot loops with this
> pattern:
>
> msf2_sysreg_read: addr: 0x00000048 data: 0x00000220
> msf2_sysreg_write: addr: 0x00000048 data: 0x00000220
> msf2_sysreg_read: addr: 0x00000048 data: 0x00000220
> msf2_sysreg_write: addr: 0x00000048 data: 0x00000020
> msf2_sysreg_read: addr: 0x00000048 data: 0x00000020
> msf2_sysreg_write: addr: 0x00000048 data: 0x00000000
> msf2_sysreg_read: addr: 0x00000048 data: 0x00000000
> msf2_sysreg_write: addr: 0x00000048 data: 0x00000020
> msf2_sysreg_read: addr: 0x00000048 data: 0x00000020
> msf2_sysreg_write: addr: 0x00000048 data: 0x00000220
>
>
>>             Binaries u-boot.bin and spi.bin are at:
>>
>
> you can compress spi.bin!
>
> can you share u-boot.elf with debug symbols too?
>

Sure. I have tested binaries before pushing. Did you compile the u-boot
again?
Please wait for a few days I will check and provide once am back.

Thanks,
Sundeep

>
> Regards,
>
> Phil.
>
>             https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
>>
>>             <https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git=
>
>>
>>             U-boot is from Emcraft with modified
>>                 - SPI driver not to use PDMA.
>>                 - ugly hack to pass dtb to kernel in r1.
>>             @
>>             https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git
>>             <https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git>
>>
>>             Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource
>>             driver added by myself @
>>             https://github.com/Subbaraya-Sundeep/linux.git
>>             <https://github.com/Subbaraya-Sundeep/linux.git>
>>
>>             v5
>>                 As per Philippe comments:
>>                     Added abort in Sysreg if guest tries to remap memory
>>                     other than default mapping.
>>                     Use of CONFIG_MSF2 in Makefile for soc.c
>>                     Fixed incorrect logic in timer model.
>>                     Renamed msf2-timer.c -> mss-timer.c
>>                             msf2-spi.c -> mss-spi.c also type names
>>                     Renamed function msf2_init->emcraft_sf2_init in
>>             msf2-som.c
>>                     Added part-name,eNVM-size,eSRAM-size,pclk0 and pclk1
>>                         properties to soc.
>>                     Pass soc part-name,memory size and clock rate
>>             properties from som.
>>             v4:
>>                 Fixed build failure by using PRIx macros.
>>             v3:
>>                 Added SoC file and board file as per Alistair comments.
>>             v2:
>>                 Added SPI controller so that u-boot loads kernel from
>>             spi flash.
>>             v1:
>>                 Initial patch set with timer and sysreg
>>
>>             Thanks,
>>             Sundeep
>>
>>             Subbaraya Sundeep (5):
>>               msf2: Add Smartfusion2 System timer
>>               msf2: Microsemi Smartfusion2 System Register block.
>>               msf2: Add Smartfusion2 SPI controller
>>               msf2: Add Smartfusion2 SoC.
>>               msf2: Add Emcraft's Smartfusion2 SOM kit.
>>
>>              default-configs/arm-softmmu.mak |   1 +
>>              hw/arm/Makefile.objs            |   2 +
>>              hw/arm/msf2-soc.c               | 201 +++++++++++++++++++++
>>              hw/arm/msf2-som.c               |  89 ++++++++++
>>              hw/misc/Makefile.objs           |   1 +
>>              hw/misc/msf2-sysreg.c           | 161 +++++++++++++++++
>>              hw/ssi/Makefile.objs            |   1 +
>>              hw/ssi/mss-spi.c                | 378
>>             ++++++++++++++++++++++++++++++++++++++++
>>              hw/timer/Makefile.objs          |   1 +
>>              hw/timer/mss-timer.c            | 249
>>             ++++++++++++++++++++++++++
>>              include/hw/arm/msf2-soc.h       |  69 ++++++++
>>              include/hw/misc/msf2-sysreg.h   |  80 +++++++++
>>              include/hw/ssi/mss-spi.h        | 104 +++++++++++
>>              include/hw/timer/mss-timer.h    |  80 +++++++++
>>              14 files changed, 1417 insertions(+)
>>              create mode 100644 hw/arm/msf2-soc.c
>>              create mode 100644 hw/arm/msf2-som.c
>>              create mode 100644 hw/misc/msf2-sysreg.c
>>              create mode 100644 hw/ssi/mss-spi.c
>>              create mode 100644 hw/timer/mss-timer.c
>>              create mode 100644 include/hw/arm/msf2-soc.h
>>              create mode 100644 include/hw/misc/msf2-sysreg.h
>>              create mode 100644 include/hw/ssi/mss-spi.h
>>              create mode 100644 include/hw/timer/mss-timer.h
>>
>>
>>
>>

--001a114e3f9848f18b055181d127
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Wed, May 31, 2017 at 11:06 AM, Philippe Mathieu-Daud=C3=A9 <=
span dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f=
4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi S=
undeep,<span class=3D""><br>
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
v><div>Ohh sorry currently am in vacation :) =C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">
<br>
Thanks,<br>
Sundeep<br>
<br>
On Wed, May 17, 2017 at 3:09 PM, sundeep subbaraya<br></span><span class=3D=
"">
&lt;<a href=3D"mailto:sundeep.lkml@gmail.com" target=3D"_blank">sundeep.lkm=
l@gmail.com</a> &lt;mailto:<a href=3D"mailto:sundeep.lkml@gmail.com" target=
=3D"_blank">sundeep.lkml@gmail.com</a><wbr>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Hi Philippe,<br>
<br>
=C2=A0 =C2=A0 On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daud=C3=A9<=
br></span><div><div class=3D"h5">
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
ank">https://mail.coreboot.org/pipe<wbr>rmail/coreboot-gerrit/2016-<wbr>Feb=
ruary/040899.html</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"https://mail.coreboot.org/piperm=
ail/coreboot-gerrit/2016-February/040899.html" rel=3D"noreferrer" target=3D=
"_blank">https://mail.coreboot.org/pip<wbr>ermail/coreboot-gerrit/2016-<wbr=
>February/040899.html</a>&gt;<br>
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
msf2_sysreg_write: addr: 0x00000048 data: 0x00000220<span class=3D""><br>
<br>
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
/div><div>Sure. I have tested binaries before pushing. Did you compile the =
u-boot again?</div><div>Please wait for a few days I will check and provide=
 once am back.</div><div><br></div><div>Thanks,</div><div>Sundeep</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
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
div class=3D"h5"><br>
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
.<wbr>h=C2=A0 =C2=A0|=C2=A0 80 +++++++++<br>
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
</blockquote></div><br></div></div>

--001a114e3f9848f18b055181d127--

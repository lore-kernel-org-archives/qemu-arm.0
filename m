Received: by 10.25.0.6 with SMTP id 6csp139120lfa;
        Wed, 17 May 2017 02:39:37 -0700 (PDT)
X-Received: by 10.55.114.4 with SMTP id n4mr1872011qkc.259.1495013977825;
        Wed, 17 May 2017 02:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495013977; cv=none;
        d=google.com; s=arc-20160816;
        b=E+V5C7RM3sL8tsb+k61rBglNqawNncuSy4ZH99hUIcJvvV1KbSrKlZ+7wWqr36zO+2
         elraBGRUyqYHhWmY6kTGFyTp4ToNF5gs0hbUyA0VuvZ6TDkejAdI7MllhBaT36/tFs2I
         HkVVyaclwLe0bamXmGr/XtDFpEqhkEVUakqvudqx/uj10Cn5YuQXGaPBVTYiR/gMzQrm
         Swu9BZ0gJ/34OSMs/8ZUFx56JtumAlXMaEII8YcSn3nNDcIBUlyT0kABXAhDty+RG6Eo
         G3Ei6Nvvue+CvK/oTwNZ7dCkNstHJNCBFV4PA77PvenrAsaZkVegfsmlCkizNBAuK+A4
         PBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lwwnnR6tSAS2EsszpHsEcXhmOA2r41QJUhjpOPGuhyw=;
        b=h2ZoJhkNsZs1DCsVEPs+7coMVWBDV+oZQQpfACBdczVpAdDKzUUpgODzYP49cjZJMx
         iJKKkslREajTmc+Lwz+28Fg6WCRuLVFgXq7ZAHQ/unVCah29D7hpjHzieDNfyb6YHulP
         2AiGnQ+lQ0yS3pEY2UvUi8Mni9AhP2RwV6UL5PVGZMZUSM6NzPoxaubKxWLEQJqo0OBE
         cYYzYdL5rS3/2GolhzkX7DLqZbXC6+BTglp/JMhIoak++OEzLLfzQT3HxeHEY0MOuyEd
         Ur3WqyhLJqBVTCVo3lr2076E7zZAPubYxUu1E4nDbtM4/aQFokEhifd1e+UuLPUi7CGq
         CwhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h42si1658060qtc.247.2017.05.17.02.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 02:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAvQf-0006um-7n
	for alex.bennee@linaro.org; Wed, 17 May 2017 05:39:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAvQX-0006sw-5u
	for qemu-arm@nongnu.org; Wed, 17 May 2017 05:39:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAvQV-00054v-KH
	for qemu-arm@nongnu.org; Wed, 17 May 2017 05:39:29 -0400
Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244]:33482)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dAvQQ-00053X-TY; Wed, 17 May 2017 05:39:23 -0400
Received: by mail-yw0-x244.google.com with SMTP id 203so465253ywe.0;
	Wed, 17 May 2017 02:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lwwnnR6tSAS2EsszpHsEcXhmOA2r41QJUhjpOPGuhyw=;
	b=p9rx5+Oe1q5mjh2s6SQd57mxE4m7c5eg1M8kvHi1TtgLPXXg4NxNf4JcSWzwNwGJPT
	q82u7aPAEhO47aZ8IJStOE+vAhezcT3GdH8Zsr3Q9x0FlFY7J1HWX0p/7OFL45+FTblU
	7GOmXRvwX1jrBryp3T2uGLJh4Se9P86hA+VIVpjZN+AeHb9JvjYaAhdAyDmJfsNWEh/I
	bokXU91wAWBPptDY44E3Md4JPi0icOVVEkDETEgMiwWsxECpJnx8czzB+PAOINlXozj9
	Taqx62AyfrpXNHr8mSdNDNDVnAd16CJm2wZnVCDX/GGOw2niJCwUsX3MOo18FMWcJ4c3
	4jBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lwwnnR6tSAS2EsszpHsEcXhmOA2r41QJUhjpOPGuhyw=;
	b=g5RLycqPKP2joECCr/6DakW7omLLmsViz+DRFSAfGcRAcVQqzD1GLEoXINV0CccexT
	zDFSXLHnVv06nixlaNi9as0cS2eF7o6YU1h8AvxPkz9Ei4fFr2/Q7RR+Yflro5gSjUg8
	oIVXX+rEb7ideeICe9aGCoq2aRxHp8fANfsjmfbtR4cJl3e7kpP0eE/UEzJ/wKE0vPC/
	iB/V7h9qM3ZP7QLaEUn43Dr0eeh6oTOdycRZ7TG4Afv6SYWWMbAGIYbLyhQTSKYvorZd
	uJrOc7VJjrXJHImVpPGenz+8OC12Ue13B1b7ijv2/lfFhCmP4LZ97nnJV1djmtzop8jE
	U0gA==
X-Gm-Message-State: AODbwcC9L7fB07Zty9Rrxm5QqdXyOyJyGfivYOGJCvnWt7hbvHk09SCa
	oiesELFu/UYkFvRLZfRlcXxytfK5rQ==
X-Received: by 10.129.68.31 with SMTP id r31mr1767112ywa.2.1495013962111; Wed,
	17 May 2017 02:39:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Wed, 17 May 2017 02:39:21 -0700 (PDT)
In-Reply-To: <d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 17 May 2017 15:09:21 +0530
Message-ID: <CALHRZur8Uh0JCnOoY-_mUU_fyzbUgxbmWKtfOoB-GTYR5UcEnQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="f403045eb89c25615a054fb51035"
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
X-TUID: BzIuzEh4u7Zv

--f403045eb89c25615a054fb51035
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Sundeep,
>
> This patchset is way cleaner!
> I had a fast look and I like it, I'll try to make some time soon to revie=
w
> details and test it.


Thank you

>


> Is your work interested on U-Boot or more focused in Linux kernel?
>

I am interested more in kernel. I had to look into u-boot for first time
for Qemu only.
I worked only on FPGAs(load kernel with debugger) till now so never got a
chance to look into u-boot.

>
> If you compile QEMU with libfdt support you can use the -dtb option to
> pass the blob to the kernel directly, bypassing the bootloader.
>
> Yeah for armv7m I could not find any thing like that in tree.


> If you need a bootloader you may give a look at coreboot which supports
> dts well, see how Vladimir Serbinenko used Linux's dt to boot a QEMU
> Versatile Express board:
> https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-
> February/040899.html
>
> Cool. I will look into it.

Thanks,
Sundeep


> Regards,
>
> Phil.
>
>
> On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>
>> Hi Qemu-devel,
>>
>> I am trying to add Smartfusion2 SoC.
>> SoC is from Microsemi and System on Module(SOM)
>> board is from Emcraft systems. Smartfusion2 has hardened
>> Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
>> At the moment only system timer, sysreg and SPI
>> controller are modelled.
>>
>> Testing:
>> ./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial mon:stdio \
>> -kernel u-boot.bin -display none -drive file=3Dspi.bin,if=3Dmtd,format=
=3Draw
>>
>> Binaries u-boot.bin and spi.bin are at:
>> https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
>>
>> U-boot is from Emcraft with modified
>>     - SPI driver not to use PDMA.
>>     - ugly hack to pass dtb to kernel in r1.
>> @
>> https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git
>>
>> Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource
>> driver added by myself @
>> https://github.com/Subbaraya-Sundeep/linux.git
>>
>> v5
>>     As per Philippe comments:
>>         Added abort in Sysreg if guest tries to remap memory
>>         other than default mapping.
>>         Use of CONFIG_MSF2 in Makefile for soc.c
>>         Fixed incorrect logic in timer model.
>>         Renamed msf2-timer.c -> mss-timer.c
>>                 msf2-spi.c -> mss-spi.c also type names
>>         Renamed function msf2_init->emcraft_sf2_init in msf2-som.c
>>         Added part-name,eNVM-size,eSRAM-size,pclk0 and pclk1
>>             properties to soc.
>>         Pass soc part-name,memory size and clock rate properties from so=
m.
>> v4:
>>     Fixed build failure by using PRIx macros.
>> v3:
>>     Added SoC file and board file as per Alistair comments.
>> v2:
>>     Added SPI controller so that u-boot loads kernel from spi flash.
>> v1:
>>     Initial patch set with timer and sysreg
>>
>> Thanks,
>> Sundeep
>>
>> Subbaraya Sundeep (5):
>>   msf2: Add Smartfusion2 System timer
>>   msf2: Microsemi Smartfusion2 System Register block.
>>   msf2: Add Smartfusion2 SPI controller
>>   msf2: Add Smartfusion2 SoC.
>>   msf2: Add Emcraft's Smartfusion2 SOM kit.
>>
>>  default-configs/arm-softmmu.mak |   1 +
>>  hw/arm/Makefile.objs            |   2 +
>>  hw/arm/msf2-soc.c               | 201 +++++++++++++++++++++
>>  hw/arm/msf2-som.c               |  89 ++++++++++
>>  hw/misc/Makefile.objs           |   1 +
>>  hw/misc/msf2-sysreg.c           | 161 +++++++++++++++++
>>  hw/ssi/Makefile.objs            |   1 +
>>  hw/ssi/mss-spi.c                | 378 ++++++++++++++++++++++++++++++
>> ++++++++++
>>  hw/timer/Makefile.objs          |   1 +
>>  hw/timer/mss-timer.c            | 249 ++++++++++++++++++++++++++
>>  include/hw/arm/msf2-soc.h       |  69 ++++++++
>>  include/hw/misc/msf2-sysreg.h   |  80 +++++++++
>>  include/hw/ssi/mss-spi.h        | 104 +++++++++++
>>  include/hw/timer/mss-timer.h    |  80 +++++++++
>>  14 files changed, 1417 insertions(+)
>>  create mode 100644 hw/arm/msf2-soc.c
>>  create mode 100644 hw/arm/msf2-som.c
>>  create mode 100644 hw/misc/msf2-sysreg.c
>>  create mode 100644 hw/ssi/mss-spi.c
>>  create mode 100644 hw/timer/mss-timer.c
>>  create mode 100644 include/hw/arm/msf2-soc.h
>>  create mode 100644 include/hw/misc/msf2-sysreg.h
>>  create mode 100644 include/hw/ssi/mss-spi.h
>>  create mode 100644 include/hw/timer/mss-timer.h
>>
>>

--f403045eb89c25615a054fb51035
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daud=C3=A9 <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4=
bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Su=
ndeep,<br>
<br>
This patchset is way cleaner!<br>
I had a fast look and I like it, I&#39;ll try to make some time soon to rev=
iew details and test it.</blockquote><div><br></div><div>Thank you=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">=C2=A0</blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
Is your work interested on U-Boot or more focused in Linux kernel?<br></blo=
ckquote><div><br></div><div>I am interested more in kernel. I had to look i=
nto u-boot for first time for Qemu only.</div><div>I worked only on FPGAs(l=
oad kernel with debugger) till now so never got a chance to look into u-boo=
t. =C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
<br>
If you compile QEMU with libfdt support you can use the -dtb option to pass=
 the blob to the kernel directly, bypassing the bootloader.<br>
<br></blockquote><div>Yeah for armv7m I could not find any thing like that =
in tree.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
If you need a bootloader you may give a look at coreboot which supports dts=
 well, see how Vladimir Serbinenko used Linux&#39;s dt to boot a QEMU Versa=
tile Express board:<br>
<a href=3D"https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-Februar=
y/040899.html" rel=3D"noreferrer" target=3D"_blank">https://mail.coreboot.o=
rg/pipe<wbr>rmail/coreboot-gerrit/2016-<wbr>February/040899.html</a><br>
<br></blockquote><div>Cool. I will look into it.</div><div><br></div><div>T=
hanks,</div><div>Sundeep</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
Regards,<br>
<br>
Phil.<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hi Qemu-devel,<br>
<br>
I am trying to add Smartfusion2 SoC.<br>
SoC is from Microsemi and System on Module(SOM)<br>
board is from Emcraft systems. Smartfusion2 has hardened<br>
Microcontroller(Cortex-M3)base<wbr>d Sub System and FPGA fabric.<br>
At the moment only system timer, sysreg and SPI<br>
controller are modelled.<br>
<br>
Testing:<br>
./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial mon:stdio \<br>
-kernel u-boot.bin -display none -drive file=3Dspi.bin,if=3Dmtd,format=3Dra=
w<br>
<br>
Binaries u-boot.bin and spi.bin are at:<br>
<a href=3D"https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/Subbaraya-S<wbr>undeep=
/qemu-test-binaries.git</a><br>
<br>
U-boot is from Emcraft with modified<br>
=C2=A0 =C2=A0 - SPI driver not to use PDMA.<br>
=C2=A0 =C2=A0 - ugly hack to pass dtb to kernel in r1.<br>
@<br>
<a href=3D"https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/Subbaraya-S<wbr>undeep=
/emcraft-uboot-sf2.git</a><br>
<br>
Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource<br>
driver added by myself @<br>
<a href=3D"https://github.com/Subbaraya-Sundeep/linux.git" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/Subbaraya-S<wbr>undeep/linux.git</a=
><br>
<br>
v5<br>
=C2=A0 =C2=A0 As per Philippe comments:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Added abort in Sysreg if guest tries to remap m=
emory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 other than default mapping.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Use of CONFIG_MSF2 in Makefile for soc.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Fixed incorrect logic in timer model.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Renamed msf2-timer.c -&gt; mss-timer.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msf2-spi.c -&gt; ms=
s-spi.c also type names<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Renamed function msf2_init-&gt;emcraft_sf2_init=
 in msf2-som.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Added part-name,eNVM-size,eSRAM-size<wbr>,pclk0=
 and pclk1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 properties to soc.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Pass soc part-name,memory size and clock rate p=
roperties from som.<br>
v4:<br>
=C2=A0 =C2=A0 Fixed build failure by using PRIx macros.<br>
v3:<br>
=C2=A0 =C2=A0 Added SoC file and board file as per Alistair comments.<br>
v2:<br>
=C2=A0 =C2=A0 Added SPI controller so that u-boot loads kernel from spi fla=
sh.<br>
v1:<br>
=C2=A0 =C2=A0 Initial patch set with timer and sysreg<br>
<br>
Thanks,<br>
Sundeep<br>
<br>
Subbaraya Sundeep (5):<br>
=C2=A0 msf2: Add Smartfusion2 System timer<br>
=C2=A0 msf2: Microsemi Smartfusion2 System Register block.<br>
=C2=A0 msf2: Add Smartfusion2 SPI controller<br>
=C2=A0 msf2: Add Smartfusion2 SoC.<br>
=C2=A0 msf2: Add Emcraft&#39;s Smartfusion2 SOM kit.<br>
<br>
=C2=A0default-configs/arm-softmmu.m<wbr>ak |=C2=A0 =C2=A01 +<br>
=C2=A0hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A02 +<br>
=C2=A0hw/arm/msf2-soc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 201 +++++++++++++++++++++<br>
=C2=A0hw/arm/msf2-som.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 89 ++++++++++<br>
=C2=A0hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A0hw/misc/msf2-sysreg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 161 +=
++++++++++++++++<br>
=C2=A0hw/ssi/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 +<br>
=C2=A0hw/ssi/mss-spi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 378 ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
=C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0hw/timer/mss-timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 249 +=
+++++++++++++++++++++++++<br>
=C2=A0include/hw/arm/msf2-soc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 69 ++++++=
++<br>
=C2=A0include/hw/misc/msf2-sysreg.<wbr>h=C2=A0 =C2=A0|=C2=A0 80 +++++++++<b=
r>
=C2=A0include/hw/ssi/mss-spi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 104 +++++++++++=
<br>
=C2=A0include/hw/timer/mss-timer.h=C2=A0 =C2=A0 |=C2=A0 80 +++++++++<br>
=C2=A014 files changed, 1417 insertions(+)<br>
=C2=A0create mode 100644 hw/arm/msf2-soc.c<br>
=C2=A0create mode 100644 hw/arm/msf2-som.c<br>
=C2=A0create mode 100644 hw/misc/msf2-sysreg.c<br>
=C2=A0create mode 100644 hw/ssi/mss-spi.c<br>
=C2=A0create mode 100644 hw/timer/mss-timer.c<br>
=C2=A0create mode 100644 include/hw/arm/msf2-soc.h<br>
=C2=A0create mode 100644 include/hw/misc/msf2-sysreg.h<br>
=C2=A0create mode 100644 include/hw/ssi/mss-spi.h<br>
=C2=A0create mode 100644 include/hw/timer/mss-timer.h<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--f403045eb89c25615a054fb51035--

Received: by 10.223.172.38 with SMTP id v35csp1523697wrc;
        Wed, 20 Sep 2017 23:12:05 -0700 (PDT)
X-Received: by 10.55.152.198 with SMTP id a189mr1509479qke.190.1505974325242;
        Wed, 20 Sep 2017 23:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505974325; cv=none;
        d=google.com; s=arc-20160816;
        b=yh5M13VCzsDD3yyL46mY6pyteo+KBUbqb5cB9k69i7NWwTEXHKX5Fu2pKd4wCxKy97
         nNiu6fxR2R1YkuSioxM4ZplkmErpqKDkcsR0DXN7GbISKzj4c9/hWzSWoSTUOPSoRK6E
         jeCglW2fUG4XM3YKl4P3vlMYT7vpNmGtcBqUiY0XFFXYEBT5XHZw1DcykJgVYeqDBh3L
         DDmVqvKk3YRUVGVaNL3vbuWmLuNp4kAPDBL5sNhic4FixN++YH7cTabzyuGWLiT3cZ7c
         fd1l4KhL/EL/wFOK3gsdBvCnBNpt3ygT6jqTFSaZAw1RzLwIXSmmDkTFDJNgOvzhbiNi
         uMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lVMrr6Qs6xrpuCTNaPbLRD/ZtmffvOW6fjQC2MRq/mQ=;
        b=bK9OS5OuhdHfExyptWcfmzvyJHd16KsjB4HjejVqAd0uLJxZ0iw44DZL/TQ5dRip9+
         9wUkp2D2S0VJ5LGg3kAie1pLFEzJHbRpoylu7Z9lI2v3BWRxfpFTVB1QmFjie32ixJE9
         aPW4twHBLrB8htMr1FQeJffWp7S+yY3ug81hBQTvDSj6FBMlP/E4x4coH/RhhPEV0lIe
         JacAsN4876YDQaGuY6H+g7m1UEmQJNNoXbJzxFrP8+kUqaoWUpXZPAeiOd+4Sxz4xF8q
         CIcTMFOlBXOXN7LBy0axX89EDWb5NMajAEhgZ7A+tg2TFDtQlt7qafbe8pUT3F1YAbFr
         8WSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KlORNHAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 15si487453qtt.156.2017.09.20.23.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Sep 2017 23:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KlORNHAB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duuiQ-0005DH-QU
	for alex.bennee@linaro.org; Thu, 21 Sep 2017 02:12:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1duuiG-0005BK-Q1
	for qemu-arm@nongnu.org; Thu, 21 Sep 2017 02:11:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1duuiE-0006Bv-Sa
	for qemu-arm@nongnu.org; Thu, 21 Sep 2017 02:11:52 -0400
Received: from mail-ua0-x243.google.com ([2607:f8b0:400c:c08::243]:38205)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1duuiB-0006Ap-0X; Thu, 21 Sep 2017 02:11:47 -0400
Received: by mail-ua0-x243.google.com with SMTP id l24so1464717uaa.5;
	Wed, 20 Sep 2017 23:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lVMrr6Qs6xrpuCTNaPbLRD/ZtmffvOW6fjQC2MRq/mQ=;
	b=KlORNHABGWJHoSY6DPx4BwHErsNLTDIpcGKW5oAYlIxonK239LHLwfmUM+rjfbyDSX
	ahKS2iJPPSuPeHuDyTl9QigYupCoFc4nJ5UjwVnb5VoOUzkB5+/+yS5q3xKudf7OiJbJ
	0amwv0GRexQQni8VN9pde3haOv2Wzi9lLTFYm4YcrfkaUK8mhjJ2FuCJaPF1ps99nyox
	/c6nWJSK1ywUmnw6GkPfvW+h4Gi0rBqiRYoBcNLb/5yK4HZOZcs01IJrDxnLr+iWG6iH
	7C4vTHvLPlPc4gQJaEvG6MkXwyy8kD6VFtWXt5ejmWIk2Bfi/JpTuCG7P555n/bM20bW
	mSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lVMrr6Qs6xrpuCTNaPbLRD/ZtmffvOW6fjQC2MRq/mQ=;
	b=TIBFtdbalGPZhIO9uwnKz+CNWJzuWZrv5yOs8Oksj496P7IGpaKm5uTEIXVzY9zaOW
	KaX9Wwi5w7wfVBpHYRd2yIJMJ0qgbn5Q4A2DJmBSQD37JXfUdQvV2FAiQT9xSPDe86vz
	QVo/QuDiMYFzQFcOsQgM0xIKxUuD9yUsPr4i5r/yOSyaLaPdbOXpUngCfz/zZ9iUQ1D0
	gJvTexvPoGQE6Urpm5a2JKDqC0RCD1tSaKWk6zE22R48jhb/gj760XMz9cmLC56HqfIS
	VghRRkaUwvdo3MmTUrKjjXJaHpXlGDqp0yiGkQIRgC58i6s+KG+2O5WpI4LRmXNpA0S+
	WtxQ==
X-Gm-Message-State: AHPjjUipTmbeIUQC+rHcmra6pjPS1r8GzqugutgWrl1/C5UodTgvMA7f
	s+60B0pGhVr4gn21MHi3YqckRS6ih0ySoRM5q4Y=
X-Google-Smtp-Source: AOwi7QDPVdEkufPZERc/C1xa3I3BecLBKlgfHr6QLFLv/Dy5J84SnYCwR5PqZ8vZVW2wzlKPhtS9wFkdehjy6/mohv4=
X-Received: by 10.176.68.196 with SMTP id n62mr1000409uan.159.1505974305170;
	Wed, 20 Sep 2017 23:11:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Wed, 20 Sep 2017 23:11:44 -0700 (PDT)
In-Reply-To: <20170920201737.25723-1-f4bug@amsat.org>
References: <20170920201737.25723-1-f4bug@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Thu, 21 Sep 2017 11:41:44 +0530
Message-ID: <CALHRZupkDOR0ztSZ8xiiq0jo8uCNsth26s==iJnG2Zff=_MT1Q@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a114f667e802a7b0559acf7a5"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::243
Subject: Re: [Qemu-arm] [PATCH v11 0/5] Add support for Smartfusion2 SoC
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
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qu0Du5NrJokh

--001a114f667e802a7b0559acf7a5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Philippe :)

Sundeep

On Thu, Sep 21, 2017 at 1:47 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Peter,
>
> Now than Igor's patch landed, I respin Sundeep's series updating it to wo=
rk
> after the "arm: drop intermediate cpu_model -> cpu type parsing and use c=
pu
> type directly" patch.
>
> v11:
> - msf2-soc.c: add a check for null m3clk
> - msf2-soc.c, msf2-som.c: drop cpu_model to directly use cpu type
>
> --
>
> Sundeep original cover:
>
> I am trying to add Smartfusion2 SoC.
> SoC is from Microsemi and System on Module(SOM)
> board is from Emcraft systems. Smartfusion2 has hardened
> Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
> At the moment only system timer, sysreg and SPI
> controller are modelled.
>
> Testing:
> ./arm-softmmu/qemu-system-arm -M emcraft-sf2 -serial mon:stdio \
> -kernel u-boot.bin -display none -drive file=3Dspi.bin,if=3Dmtd,format=3D=
raw
>
> Binaries u-boot.bin and spi.bin are at:
> https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
>
> U-boot is from Emcraft with modified
>     - SPI driver not to use PDMA.
>     - ugly hack to pass dtb to kernel in r1.
> @
> https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git
>
> Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource
> driver added by myself @
> https://github.com/Subbaraya-Sundeep/linux.git
>
> v10:
>     Added msf2_sysreg_realize in msf2-sysreg.c
>     modified unimplemented devices names:
>         pdma->dma and hpdma->hs-dma
>     used uint8_t for apb divisors properties
>     simplified msf2_divbits() using ctz32()
>
> v9:
>     used trace instead of DB_PRINT in msf2-sysreg.c
>     used LOG_UNIMP for non guest errors in msf2-sysreg.c
>     added unimplemented devices in msf2-soc.c
>     removed .alias suffix in alias memory region name for eNVM
>     removed mc->ignore_memory_transaction_failures in msf2-som.c
>
> v8:
>     memory_region_init_ram to memory_region_init_rom in soc
>     %s/emcraft_sf2_init/emcraft_sf2_s2s010_init/g in som
>     Added mc->ignore_memory_transaction_failures =3D true in som
>         as per latest commit.
>     Code simplifications as suggested by Alistair in sysreg and ssi.
>
> v7:
>     Removed vmstate_register_ram_global as per latest commit
>     Moved header files to C which are local to C source files
>     Removed abort() from msf2-sysreg.c
>     Added VMStateDescription in mss-timer.c
>
> v6:
>     Moved some defines from header files to source files
>     Added properties m3clk, apb0div, apb0div1 properties
>     to soc.
>     Added properties apb0divisor, apb1divisor to sysreg
>     Update system_clock_source in msf2-soc.c
>     Changed machine name smartfusion2-som->emcraft-sf2
>
> v5
>     As per Philippe comments:
>         Added abort in Sysreg if guest tries to remap memory
>         other than default mapping.
>         Use of CONFIG_MSF2 in Makefile for soc.c
>         Fixed incorrect logic in timer model.
>         Renamed msf2-timer.c -> mss-timer.c
>                 msf2-spi.c -> mss-spi.c also type names
>         Renamed function msf2_init->emcraft_sf2_init in msf2-som.c
>         Added part-name,eNVM-size,eSRAM-size,pclk0 and pclk1
>             properties to soc.
>         Pass soc part-name,memory size and clock rate properties from som=
.
> v4:
>     Fixed build failure by using PRIx macros.
> v3:
>     Added SoC file and board file as per Alistair comments.
> v2:
>     Added SPI controller so that u-boot loads kernel from spi flash.
> v1:
>     Initial patch set with timer and sysreg
>
> Thanks,
> Sundeep
>
> Subbaraya Sundeep (5):
>   msf2: Add Smartfusion2 System timer
>   msf2: Microsemi Smartfusion2 System Register block
>   msf2: Add Smartfusion2 SPI controller
>   msf2: Add Smartfusion2 SoC
>   msf2: Add Emcraft's Smartfusion2 SOM kit
>
>  default-configs/arm-softmmu.mak |   1 +
>  include/hw/arm/msf2-soc.h       |  67 +++++++
>  include/hw/misc/msf2-sysreg.h   |  77 ++++++++
>  include/hw/ssi/mss-spi.h        |  58 ++++++
>  include/hw/timer/mss-timer.h    |  64 +++++++
>  hw/arm/msf2-soc.c               | 238 +++++++++++++++++++++++
>  hw/arm/msf2-som.c               | 105 +++++++++++
>  hw/misc/msf2-sysreg.c           | 160 ++++++++++++++++
>  hw/ssi/mss-spi.c                | 404 ++++++++++++++++++++++++++++++
> ++++++++++
>  hw/timer/mss-timer.c            | 289 ++++++++++++++++++++++++++++
>  hw/arm/Makefile.objs            |   1 +
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/trace-events            |   5 +
>  hw/ssi/Makefile.objs            |   1 +
>  hw/timer/Makefile.objs          |   1 +
>  15 files changed, 1472 insertions(+)
>  create mode 100644 include/hw/arm/msf2-soc.h
>  create mode 100644 include/hw/misc/msf2-sysreg.h
>  create mode 100644 include/hw/ssi/mss-spi.h
>  create mode 100644 include/hw/timer/mss-timer.h
>  create mode 100644 hw/arm/msf2-soc.c
>  create mode 100644 hw/arm/msf2-som.c
>  create mode 100644 hw/misc/msf2-sysreg.c
>  create mode 100644 hw/ssi/mss-spi.c
>  create mode 100644 hw/timer/mss-timer.c
>
> --
> 2.14.1
>
>

--001a114f667e802a7b0559acf7a5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Philippe :)<div><br></div><div>Sundeep</div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Sep 21, 20=
17 at 1:47 AM, Philippe Mathieu-Daud=C3=A9 <span dir=3D"ltr">&lt;<a href=3D=
"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Hi Peter,<br>
<br>
Now than Igor&#39;s patch landed, I respin Sundeep&#39;s series updating it=
 to work<br>
after the &quot;arm: drop intermediate cpu_model -&gt; cpu type parsing and=
 use cpu<br>
type directly&quot; patch.<br>
<br>
v11:<br>
- msf2-soc.c: add a check for null m3clk<br>
- msf2-soc.c, msf2-som.c: drop cpu_model to directly use cpu type<br>
<br>
--<br>
<br>
Sundeep original cover:<br>
<br>
I am trying to add Smartfusion2 SoC.<br>
SoC is from Microsemi and System on Module(SOM)<br>
board is from Emcraft systems. Smartfusion2 has hardened<br>
Microcontroller(Cortex-M3)<wbr>based Sub System and FPGA fabric.<br>
At the moment only system timer, sysreg and SPI<br>
controller are modelled.<br>
<br>
Testing:<br>
./arm-softmmu/qemu-system-arm -M emcraft-sf2 -serial mon:stdio \<br>
-kernel u-boot.bin -display none -drive file=3Dspi.bin,if=3Dmtd,format=3Dra=
w<br>
<br>
Binaries u-boot.bin and spi.bin are at:<br>
<a href=3D"https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/Subbaraya-<wbr>Sundeep=
/qemu-test-binaries.git</a><br>
<br>
U-boot is from Emcraft with modified<br>
=C2=A0 =C2=A0 - SPI driver not to use PDMA.<br>
=C2=A0 =C2=A0 - ugly hack to pass dtb to kernel in r1.<br>
@<br>
<a href=3D"https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/Subbaraya-<wbr>Sundeep=
/emcraft-uboot-sf2.git</a><br>
<br>
Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource<br>
driver added by myself @<br>
<a href=3D"https://github.com/Subbaraya-Sundeep/linux.git" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/Subbaraya-<wbr>Sundeep/linux.git</a=
><br>
<br>
v10:<br>
=C2=A0 =C2=A0 Added msf2_sysreg_realize in msf2-sysreg.c<br>
=C2=A0 =C2=A0 modified unimplemented devices names:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pdma-&gt;dma and hpdma-&gt;hs-dma<br>
=C2=A0 =C2=A0 used uint8_t for apb divisors properties<br>
=C2=A0 =C2=A0 simplified msf2_divbits() using ctz32()<br>
<br>
v9:<br>
=C2=A0 =C2=A0 used trace instead of DB_PRINT in msf2-sysreg.c<br>
=C2=A0 =C2=A0 used LOG_UNIMP for non guest errors in msf2-sysreg.c<br>
=C2=A0 =C2=A0 added unimplemented devices in msf2-soc.c<br>
=C2=A0 =C2=A0 removed .alias suffix in alias memory region name for eNVM<br=
>
=C2=A0 =C2=A0 removed mc-&gt;ignore_memory_transaction_<wbr>failures in msf=
2-som.c<br>
<br>
v8:<br>
=C2=A0 =C2=A0 memory_region_init_ram to memory_region_init_rom in soc<br>
=C2=A0 =C2=A0 %s/emcraft_sf2_init/emcraft_<wbr>sf2_s2s010_init/g in som<br>
=C2=A0 =C2=A0 Added mc-&gt;ignore_memory_transaction_<wbr>failures =3D true=
 in som<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 as per latest commit.<br>
=C2=A0 =C2=A0 Code simplifications as suggested by Alistair in sysreg and s=
si.<br>
<br>
v7:<br>
=C2=A0 =C2=A0 Removed vmstate_register_ram_global as per latest commit<br>
=C2=A0 =C2=A0 Moved header files to C which are local to C source files<br>
=C2=A0 =C2=A0 Removed abort() from msf2-sysreg.c<br>
=C2=A0 =C2=A0 Added VMStateDescription in mss-timer.c<br>
<br>
v6:<br>
=C2=A0 =C2=A0 Moved some defines from header files to source files<br>
=C2=A0 =C2=A0 Added properties m3clk, apb0div, apb0div1 properties<br>
=C2=A0 =C2=A0 to soc.<br>
=C2=A0 =C2=A0 Added properties apb0divisor, apb1divisor to sysreg<br>
=C2=A0 =C2=A0 Update system_clock_source in msf2-soc.c<br>
=C2=A0 =C2=A0 Changed machine name smartfusion2-som-&gt;emcraft-sf2<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Added part-name,eNVM-size,eSRAM-<wbr>size,pclk0=
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
=C2=A0 msf2: Microsemi Smartfusion2 System Register block<br>
=C2=A0 msf2: Add Smartfusion2 SPI controller<br>
=C2=A0 msf2: Add Smartfusion2 SoC<br>
=C2=A0 msf2: Add Emcraft&#39;s Smartfusion2 SOM kit<br>
<br>
=C2=A0default-configs/arm-softmmu.<wbr>mak |=C2=A0 =C2=A01 +<br>
=C2=A0include/hw/arm/msf2-soc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 67 ++++++=
+<br>
=C2=A0include/hw/misc/msf2-sysreg.h=C2=A0 =C2=A0|=C2=A0 77 ++++++++<br>
=C2=A0include/hw/ssi/mss-spi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 58 ++++++=
<br>
=C2=A0include/hw/timer/mss-timer.h=C2=A0 =C2=A0 |=C2=A0 64 +++++++<br>
=C2=A0hw/arm/msf2-soc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 238 +++++++++++++++++++++++<br>
=C2=A0hw/arm/msf2-som.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 105 +++++++++++<br>
=C2=A0hw/misc/msf2-sysreg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 160 +=
+++++++++++++++<br>
=C2=A0hw/ssi/mss-spi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 404 ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
=C2=A0hw/timer/mss-timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 289 +=
+++++++++++++++++++++++++++<br>
=C2=A0hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 +<br>
=C2=A0hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A0hw/misc/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A05 +<br>
=C2=A0hw/ssi/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 +<br>
=C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A015 files changed, 1472 insertions(+)<br>
=C2=A0create mode 100644 include/hw/arm/msf2-soc.h<br>
=C2=A0create mode 100644 include/hw/misc/msf2-sysreg.h<br>
=C2=A0create mode 100644 include/hw/ssi/mss-spi.h<br>
=C2=A0create mode 100644 include/hw/timer/mss-timer.h<br>
=C2=A0create mode 100644 hw/arm/msf2-soc.c<br>
=C2=A0create mode 100644 hw/arm/msf2-som.c<br>
=C2=A0create mode 100644 hw/misc/msf2-sysreg.c<br>
=C2=A0create mode 100644 hw/ssi/mss-spi.c<br>
=C2=A0create mode 100644 hw/timer/mss-timer.c<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.14.1<br>
<br>
</font></span></blockquote></div><br></div>

--001a114f667e802a7b0559acf7a5--

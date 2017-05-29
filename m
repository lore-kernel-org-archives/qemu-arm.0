Received: by 10.25.0.6 with SMTP id 6csp1250652lfa;
        Sun, 28 May 2017 22:28:22 -0700 (PDT)
X-Received: by 10.55.12.129 with SMTP id 123mr6866782qkm.180.1496035702412;
        Sun, 28 May 2017 22:28:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496035702; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcDoTUjOiJwrELx1Mg/nIKHmzr6D6+sPKxft+EEXv6wLpzgxLunh2TUgqm0GWvQ96Q
         N9soqmIXGWG2QGYLRCY9/TpBqzwleCt6YXUG2HkH6cFSKAdhkw8cx55tbX+lhxUhgCLa
         EwpyFzGSKyluFHq69a6R/4ukxm8r66AG5o8BdXjT/d3F21I4ue+Q420yYzgKTERfXbbT
         zr6y13P11YmON0jQGaAwsVFFU1mLtZEyVtbSjui/3ii4iJlOXd3HSiuD9rFIe3648HK9
         +Ga1G2MT56gz22sCLAZD8/I1tAXxMLABUdOJOYd57bBlHBU2ptXoFJD5OA1MefPQU3GM
         tGCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=yQky/HyYMa12V364OEjg9McwrER2lvmPphRhQ3I36pQ=;
        b=PVqeqz983RFJFD8tPE7iOEcGj9GF4BZqSooWXgRhminpn4G/Zy+FM0vxWTg2upvYJV
         vH5/HErii+P3ZORbuLbDu699UDYl3eU0fc/7xKaVczebh/H0iLf6eteN/i2uAn0Md5xy
         sYgIrPJk1YHDkwp+HYmwlD2+961gqLWvzQsSQlZpLI8/3ztEQvlKb04/eX9XH/XiaRSi
         RMh4StOGeY/oCY04ZCs77aikFjZ7DhmRPNmQaDEbonkZsx4R2/r5XELCVOcQDpnbaO/2
         dpEmUraq85GiGwphw3xbOEPCiXAY/lrEkXgfqltwIPWwRDb2cWxvTmF6OvZ8M/hbK8yA
         sBBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f82si1579187qkh.85.2017.05.28.22.28.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 28 May 2017 22:28:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFDE5-0003h0-SR
	for alex.bennee@linaro.org; Mon, 29 May 2017 01:28:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dFDDy-0003fe-C3
	for qemu-arm@nongnu.org; Mon, 29 May 2017 01:28:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dFDDw-0001aB-Hd
	for qemu-arm@nongnu.org; Mon, 29 May 2017 01:28:14 -0400
Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242]:35446)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dFDDs-0001YD-HJ; Mon, 29 May 2017 01:28:08 -0400
Received: by mail-yb0-x242.google.com with SMTP id 130so1974511ybl.2;
	Sun, 28 May 2017 22:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yQky/HyYMa12V364OEjg9McwrER2lvmPphRhQ3I36pQ=;
	b=igxKO9jvcaowPuZovLsVEQ7L4s36c35wP+pRRrgNbzYgPns0JPkHRzgXWFxyMFYa2U
	wAu/vA7vvrkjtYBmdTvd4bbMnaoQKde8v3Tc+Xf5uAoi6C/DSDPrST1LieFRETYQKh7v
	hwv4pLPQW8vQGDw2EaJO8fqeFAC+q4ApQwI/MfssAgr8xRBv3JdLa4LyVnt6W/MF5r6k
	zwxbvm+HERt4j2VdwwRFbTwPBHPvnSiEcB0zR6HNbwjDQ9ltXB9qC+H0RpR60tryHdU1
	1Dya81/x1xKKIkufTzBEIXB3Na1QI+Mp4YggiA3JtCJynwXmJTaqr1tIeyTthrHev5PW
	gNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yQky/HyYMa12V364OEjg9McwrER2lvmPphRhQ3I36pQ=;
	b=EIjiExpYq8peofRAuq7by5jiv3U2VRZTjtpOTd55ubqJsWD+Y0qlgK1IjnUJZ/1UDZ
	F8Wuj9RPWvJ460WEgC7sduQ65KiRf3Mt4WND0OYYevmbpfScUZFWzc9D4ltplkscd458
	uO5BmxX2zLU5bs/D/fh499PRsOiH8M2hkhOH0eFx7LMEuJPFt65jXcuK29gFRjv9SKVI
	LW26zHwfeRY9xxRgSlujoRaJO7Pwl4H69h8COgyEzo562B+wDMzi21OkwdSaD7vtLpZw
	KLY0OWJTnQXdFb5iy1frnw2AUg896isbOTfN8uDkf9t/XZ5pd2jRHo+6MtKMGRJuk5wj
	3onA==
X-Gm-Message-State: AODbwcAD5Yzu+EgtFEIUkUo8Uy2uMSsss5J0vzp3aEux3lrUwDlkDMBa
	FMsnEzYJSbxFZ+zTTG9B212vmyTM7w==
X-Received: by 10.37.45.33 with SMTP id t33mr9043969ybt.146.1496035687847;
	Sun, 28 May 2017 22:28:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.195 with HTTP; Sun, 28 May 2017 22:28:07 -0700 (PDT)
In-Reply-To: <CALHRZur8Uh0JCnOoY-_mUU_fyzbUgxbmWKtfOoB-GTYR5UcEnQ@mail.gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
	<CALHRZur8Uh0JCnOoY-_mUU_fyzbUgxbmWKtfOoB-GTYR5UcEnQ@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 29 May 2017 10:58:07 +0530
Message-ID: <CALHRZuoVHFOYV345JmvSkfJHsVjS7Wv_ySzAUtwo1D7eyoS_XQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="94eb2c1b15a0bedd590550a2f38a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::242
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
X-TUID: Tf2ei61SIAlY

--94eb2c1b15a0bedd590550a2f38a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

Any update on this? I will wait for your comments too
and send next iteration fixing Alistair comments.

Thanks,
Sundeep

On Wed, May 17, 2017 at 3:09 PM, sundeep subbaraya <sundeep.lkml@gmail.com>
wrote:

> Hi Philippe,
>
> On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org>
> wrote:
>
>> Hi Sundeep,
>>
>> This patchset is way cleaner!
>> I had a fast look and I like it, I'll try to make some time soon to
>> review details and test it.
>
>
> Thank you
>
>>
>
>
>> Is your work interested on U-Boot or more focused in Linux kernel?
>>
>
> I am interested more in kernel. I had to look into u-boot for first time
> for Qemu only.
> I worked only on FPGAs(load kernel with debugger) till now so never got a
> chance to look into u-boot.
>
>>
>> If you compile QEMU with libfdt support you can use the -dtb option to
>> pass the blob to the kernel directly, bypassing the bootloader.
>>
>> Yeah for armv7m I could not find any thing like that in tree.
>
>
>> If you need a bootloader you may give a look at coreboot which supports
>> dts well, see how Vladimir Serbinenko used Linux's dt to boot a QEMU
>> Versatile Express board:
>> https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-Feb
>> ruary/040899.html
>>
>> Cool. I will look into it.
>
> Thanks,
> Sundeep
>
>
>> Regards,
>>
>> Phil.
>>
>>
>> On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>>
>>> Hi Qemu-devel,
>>>
>>> I am trying to add Smartfusion2 SoC.
>>> SoC is from Microsemi and System on Module(SOM)
>>> board is from Emcraft systems. Smartfusion2 has hardened
>>> Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
>>> At the moment only system timer, sysreg and SPI
>>> controller are modelled.
>>>
>>> Testing:
>>> ./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial mon:stdio \
>>> -kernel u-boot.bin -display none -drive file=3Dspi.bin,if=3Dmtd,format=
=3Draw
>>>
>>> Binaries u-boot.bin and spi.bin are at:
>>> https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
>>>
>>> U-boot is from Emcraft with modified
>>>     - SPI driver not to use PDMA.
>>>     - ugly hack to pass dtb to kernel in r1.
>>> @
>>> https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git
>>>
>>> Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource
>>> driver added by myself @
>>> https://github.com/Subbaraya-Sundeep/linux.git
>>>
>>> v5
>>>     As per Philippe comments:
>>>         Added abort in Sysreg if guest tries to remap memory
>>>         other than default mapping.
>>>         Use of CONFIG_MSF2 in Makefile for soc.c
>>>         Fixed incorrect logic in timer model.
>>>         Renamed msf2-timer.c -> mss-timer.c
>>>                 msf2-spi.c -> mss-spi.c also type names
>>>         Renamed function msf2_init->emcraft_sf2_init in msf2-som.c
>>>         Added part-name,eNVM-size,eSRAM-size,pclk0 and pclk1
>>>             properties to soc.
>>>         Pass soc part-name,memory size and clock rate properties from
>>> som.
>>> v4:
>>>     Fixed build failure by using PRIx macros.
>>> v3:
>>>     Added SoC file and board file as per Alistair comments.
>>> v2:
>>>     Added SPI controller so that u-boot loads kernel from spi flash.
>>> v1:
>>>     Initial patch set with timer and sysreg
>>>
>>> Thanks,
>>> Sundeep
>>>
>>> Subbaraya Sundeep (5):
>>>   msf2: Add Smartfusion2 System timer
>>>   msf2: Microsemi Smartfusion2 System Register block.
>>>   msf2: Add Smartfusion2 SPI controller
>>>   msf2: Add Smartfusion2 SoC.
>>>   msf2: Add Emcraft's Smartfusion2 SOM kit.
>>>
>>>  default-configs/arm-softmmu.mak |   1 +
>>>  hw/arm/Makefile.objs            |   2 +
>>>  hw/arm/msf2-soc.c               | 201 +++++++++++++++++++++
>>>  hw/arm/msf2-som.c               |  89 ++++++++++
>>>  hw/misc/Makefile.objs           |   1 +
>>>  hw/misc/msf2-sysreg.c           | 161 +++++++++++++++++
>>>  hw/ssi/Makefile.objs            |   1 +
>>>  hw/ssi/mss-spi.c                | 378 ++++++++++++++++++++++++++++++
>>> ++++++++++
>>>  hw/timer/Makefile.objs          |   1 +
>>>  hw/timer/mss-timer.c            | 249 ++++++++++++++++++++++++++
>>>  include/hw/arm/msf2-soc.h       |  69 ++++++++
>>>  include/hw/misc/msf2-sysreg.h   |  80 +++++++++
>>>  include/hw/ssi/mss-spi.h        | 104 +++++++++++
>>>  include/hw/timer/mss-timer.h    |  80 +++++++++
>>>  14 files changed, 1417 insertions(+)
>>>  create mode 100644 hw/arm/msf2-soc.c
>>>  create mode 100644 hw/arm/msf2-som.c
>>>  create mode 100644 hw/misc/msf2-sysreg.c
>>>  create mode 100644 hw/ssi/mss-spi.c
>>>  create mode 100644 hw/timer/mss-timer.c
>>>  create mode 100644 include/hw/arm/msf2-soc.h
>>>  create mode 100644 include/hw/misc/msf2-sysreg.h
>>>  create mode 100644 include/hw/ssi/mss-spi.h
>>>  create mode 100644 include/hw/timer/mss-timer.h
>>>
>>>
>

--94eb2c1b15a0bedd590550a2f38a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div><br></div><div>Any update on this? I will=
 wait for your comments too=C2=A0</div><div>and send next iteration fixing =
Alistair comments.</div><div><br></div><div>Thanks,</div><div>Sundeep</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, May=
 17, 2017 at 3:09 PM, sundeep subbaraya <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:sundeep.lkml@gmail.com" target=3D"_blank">sundeep.lkml@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi Phil=
ippe,<div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=
=3D"">On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daud=C3=A9 <span di=
r=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@am=
sat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Sundeep,=
<br>
<br>
This patchset is way cleaner!<br>
I had a fast look and I like it, I&#39;ll try to make some time soon to rev=
iew details and test it.</blockquote><div><br></div></span><div>Thank you=
=C2=A0</div><span class=3D""><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0</blockqu=
ote><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">
<br>
Is your work interested on U-Boot or more focused in Linux kernel?<br></blo=
ckquote><div><br></div></span><div>I am interested more in kernel. I had to=
 look into u-boot for first time for Qemu only.</div><div>I worked only on =
FPGAs(load kernel with debugger) till now so never got a chance to look int=
o u-boot. =C2=A0</div><span class=3D""><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
If you compile QEMU with libfdt support you can use the -dtb option to pass=
 the blob to the kernel directly, bypassing the bootloader.<br>
<br></blockquote></span><div>Yeah for armv7m I could not find any thing lik=
e that in tree.</div><span class=3D""><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
If you need a bootloader you may give a look at coreboot which supports dts=
 well, see how Vladimir Serbinenko used Linux&#39;s dt to boot a QEMU Versa=
tile Express board:<br>
<a href=3D"https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-Februar=
y/040899.html" rel=3D"noreferrer" target=3D"_blank">https://mail.coreboot.o=
rg/pipe<wbr>rmail/coreboot-gerrit/2016-Feb<wbr>ruary/040899.html</a><br>
<br></blockquote></span><div>Cool. I will look into it.</div><div><br></div=
><div>Thanks,</div><div>Sundeep</div><div><div class=3D"h5"><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
Regards,<br>
<br>
Phil.<div class=3D"m_2437337762082094847HOEnZb"><div class=3D"m_24373377620=
82094847h5"><br>
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
=C2=A0include/hw/misc/msf2-sysreg.h<wbr>=C2=A0 =C2=A0|=C2=A0 80 +++++++++<b=
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
</div></div></blockquote></div></div></div><br></div></div>
</blockquote></div><br></div>

--94eb2c1b15a0bedd590550a2f38a--

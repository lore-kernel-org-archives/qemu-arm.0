Received: by 10.25.0.6 with SMTP id 6csp354561lfa;
        Wed, 10 May 2017 08:24:47 -0700 (PDT)
X-Received: by 10.200.49.1 with SMTP id g1mr5895258qtb.118.1494429887039;
        Wed, 10 May 2017 08:24:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494429887; cv=none;
        d=google.com; s=arc-20160816;
        b=eHBocy5QRDLIiZZ1Lmumj63xydV6zvzgkGaRkSWMAsCO9m8IRE1Drr0QE3U44XIT7h
         JcLHp9A95nUCgVwFSIEO2K5YZ7tg9AwpbGGsRdvTmM2wcAF4AbFy1KTvIJA2Am806khT
         ygaeLR5Vmzw6on8mXXHYsx6j197yoGpjmy78ogygpVJdeUauyC8WSe0NXfDfDvzy1qqR
         6lhyq3RdvLgG7/DbRpnJ/8uLdLtyHOM3hGPCYra4x+bhUIttIdYBsxQi/0t2k3MDRtRx
         lBo2zQZ2nh2mzAf8xU9rIMV7KFM7omCb67a2PhUq85HJ3ftqZnx9Axz1sn2NAfg+BB0a
         7nuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=S9cFssnghWdMUKvxhtnZF6whGaQQolqC59kX9BLLvw0=;
        b=N4hZfzr0kCHqr0b+ENXK0HI8v3s0g+TwNGN2+/e+5nPycXRtOTqdRulSQ6x30rcnfZ
         GvQ2cKARRtDtKSKFvaboBw5QZPergyzs9oCBgl0Zo62LwW8O2XgNpN5pedC1Nj5irh1y
         3de8aYYwLb1FbmPcWQoz0UgSklnRrcajrgnHsGai3fPD3Wxi7g3c76tSUHoCTNjeY2ED
         M4S0cPH8uN1qzy540wdsmw+dNOaIUQ++B4+yuRo3/kFuZspdBHONcrBOBJewH8a22r1A
         oFdC7NjcgNiJ2+h2EZYazW3Ygjnw2Of0IK2oPqv0mLKj5BShHN4bSsXRazZ/T6MYHUN6
         AceA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m12si3494913qkm.6.2017.05.10.08.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 08:24:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43309 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8TTq-0006Zu-Df
	for alex.bennee@linaro.org; Wed, 10 May 2017 11:24:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d8TTl-0006Yb-Ep
	for qemu-arm@nongnu.org; Wed, 10 May 2017 11:24:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d8TTk-00029Z-0t
	for qemu-arm@nongnu.org; Wed, 10 May 2017 11:24:41 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:33786)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d8TTg-00028l-IY; Wed, 10 May 2017 11:24:36 -0400
Received: by mail-yb0-x244.google.com with SMTP id d72so1272609ybh.0;
	Wed, 10 May 2017 08:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S9cFssnghWdMUKvxhtnZF6whGaQQolqC59kX9BLLvw0=;
	b=ciSYTsHi0YKWFFz9ad2nXXFL71SS8Ix3hmZIasVjh4tT84LSE/ASFShgJquc9T4CXy
	HnlfzDKpR5NO5+pwSxeft7Qon6pLlVV9GSshhttH2VxnQiKXOPFTw5+5+zsmBT6joQsn
	2cmT/5cpMjdeYZPb76vjm0ZDnVthmNSv2cq0DYvQHzgSiI/nTluUKZzU+CS3ZbXGjG2C
	AGqKl3xTTzbhikJLp1glH5TnhtjQ/XvNt/K7I7qY4rOGI9K8sV+MMWt2I+0kkn/6vxw1
	6IpizcTFYq7Kg7EYZGK5w8+/5akXDvZY4P1Tsvr1LjPCV41q0W2eCNrRYVvNFHuoGoWy
	YCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S9cFssnghWdMUKvxhtnZF6whGaQQolqC59kX9BLLvw0=;
	b=sNcWhrwe4aoGsgupcDOD682EQqJNE1oYvRtWlZvmX34cxURC55az8ztp38R+wHbzO4
	Qid/J2XOjXzy8K69SYtRde+0V4Lww1Q/iQmq4cLQO83bx5fMLn5Sxdbcv+d8PKQ6YT/R
	/wC2qVjrI7obT0UfpAr5u5bhJewJ6FLtrutV4Pej/L1+riWjsSebAhc+e0aoipXG9jcS
	RLWr+Mp4DTwChhJL4PVXtkJO+zlb1AJbODaZKzTCfCKQBnoYVQC/6Vkrsd4/LXI8HSiG
	oj/8/qsbBK7OBQ6aiwoZIk58Xi4804Ei7xtplU19D+xMFuchkR0Y/U1DT+H4kgxIXMbS
	7QLA==
X-Gm-Message-State: AODbwcDSIrJeVDSTxMRVZoy0DHYX2xvnNPF52yfOhDsuFjJvMXpa1j6H
	0gorJoUv0lqgnVP2ytA6YWy5MbS0KQ==
X-Received: by 10.37.206.141 with SMTP id x135mr5261488ybe.46.1494429875882;
	Wed, 10 May 2017 08:24:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Wed, 10 May 2017 08:24:35 -0700 (PDT)
In-Reply-To: <031eab53-a6ec-2248-d4ea-b4352243baae@amsat.org>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<031eab53-a6ec-2248-d4ea-b4352243baae@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Wed, 10 May 2017 20:54:35 +0530
Message-ID: <CALHRZur46TyuemoO8=fMc-DvAzayRjZuV1--AK5TvUmWy5snLw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary=94eb2c190058e4f209054f2d11d6
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel PATCH 0/5] Add support for Smartfusion2
 SoC
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
X-TUID: MjRLBDRuobF3

--94eb2c190058e4f209054f2d11d6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Philippe,


On Wed, May 10, 2017 at 3:14 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Subbaraya,
>
> This is your v4 of this patch set, please don't forget to include the
> version in your next set.
>
> Please also include changes between versions in your cover letter, it
> eases the review.


Sure. Sorry since this is not RFC i did not include versions. I will add
versions from next iteration.

Thanks,
Sundeep

>
>
> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
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
>> U-boot is from Emcraft with modified SPI driver not to use PDMA.
>> Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource
>> driver added by myself @
>> https://github.com/Subbaraya-Sundeep/linux.git
>>
>> Baremetal elfs from Microsemi Softconsole IDE are also working.
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
>>  hw/arm/Makefile.objs            |   3 +-
>>  hw/arm/msf2-soc.c               | 188 ++++++++++++++++++++
>>  hw/arm/msf2-som.c               |  67 +++++++
>>  hw/misc/Makefile.objs           |   1 +
>>  hw/misc/msf2-sysreg.c           | 131 ++++++++++++++
>>  hw/ssi/Makefile.objs            |   1 +
>>  hw/ssi/msf2-spi.c               | 378 ++++++++++++++++++++++++++++++
>> ++++++++++
>>  hw/timer/Makefile.objs          |   1 +
>>  hw/timer/msf2-timer.c           | 252 +++++++++++++++++++++++++++
>>  include/hw/arm/msf2-soc.h       |  60 +++++++
>>  include/hw/misc/msf2-sysreg.h   |  80 +++++++++
>>  include/hw/ssi/msf2-spi.h       | 105 +++++++++++
>>  include/hw/timer/msf2-timer.h   |  85 +++++++++
>>  14 files changed, 1352 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/arm/msf2-soc.c
>>  create mode 100644 hw/arm/msf2-som.c
>>  create mode 100644 hw/misc/msf2-sysreg.c
>>  create mode 100644 hw/ssi/msf2-spi.c
>>  create mode 100644 hw/timer/msf2-timer.c
>>  create mode 100644 include/hw/arm/msf2-soc.h
>>  create mode 100644 include/hw/misc/msf2-sysreg.h
>>  create mode 100644 include/hw/ssi/msf2-spi.h
>>  create mode 100644 include/hw/timer/msf2-timer.h
>>
>>

--94eb2c190058e4f209054f2d11d6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<br><br><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">On Wed, May 10, 2017 at 3:14 PM, Philippe Mathieu-Daud=
=C3=A9 <span dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_=
blank">f4bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi Subbaraya,<br>
<br>
This is your v4 of this patch set, please don&#39;t forget to include the v=
ersion in your next set.<br>
<br>
Please also include changes between versions in your cover letter, it eases=
 the review.</blockquote><div><br></div><div>Sure. Sorry since this is not =
RFC i did not include versions. I will add versions from next iteration.<br=
><br></div><div>Thanks,<br></div><div>Sundeep<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:<br>
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
U-boot is from Emcraft with modified SPI driver not to use PDMA.<br>
Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource<br>
driver added by myself @<br>
<a href=3D"https://github.com/Subbaraya-Sundeep/linux.git" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/Subbaraya-S<wbr>undeep/linux.git</a=
><br>
<br>
Baremetal elfs from Microsemi Softconsole IDE are also working.<br>
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
 =C2=A03 +-<br>
=C2=A0hw/arm/msf2-soc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 188 ++++++++++++++++++++<br>
=C2=A0hw/arm/msf2-som.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 67 +++++++<br>
=C2=A0hw/misc/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A01 +<br>
=C2=A0hw/misc/msf2-sysreg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 131 +=
+++++++++++++<br>
=C2=A0hw/ssi/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A01 +<br>
=C2=A0hw/ssi/msf2-spi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 378 ++++++++++++++++++++++++++++++<wbr>++++++++++<br>
=C2=A0hw/timer/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A01 +<br>
=C2=A0hw/timer/msf2-timer.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 252 +=
++++++++++++++++++++++++++<br>
=C2=A0include/hw/arm/msf2-soc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 60 ++++++=
+<br>
=C2=A0include/hw/misc/msf2-sysreg.<wbr>h=C2=A0 =C2=A0|=C2=A0 80 +++++++++<b=
r>
=C2=A0include/hw/ssi/msf2-spi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 105 +++++++++++=
<br>
=C2=A0include/hw/timer/msf2-timer.<wbr>h=C2=A0 =C2=A0|=C2=A0 85 +++++++++<b=
r>
=C2=A014 files changed, 1352 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 hw/arm/msf2-soc.c<br>
=C2=A0create mode 100644 hw/arm/msf2-som.c<br>
=C2=A0create mode 100644 hw/misc/msf2-sysreg.c<br>
=C2=A0create mode 100644 hw/ssi/msf2-spi.c<br>
=C2=A0create mode 100644 hw/timer/msf2-timer.c<br>
=C2=A0create mode 100644 include/hw/arm/msf2-soc.h<br>
=C2=A0create mode 100644 include/hw/misc/msf2-sysreg.h<br>
=C2=A0create mode 100644 include/hw/ssi/msf2-spi.h<br>
=C2=A0create mode 100644 include/hw/timer/msf2-timer.h<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--94eb2c190058e4f209054f2d11d6--

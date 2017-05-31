Received: by 10.25.0.6 with SMTP id 6csp164764lfa;
        Tue, 30 May 2017 22:36:35 -0700 (PDT)
X-Received: by 10.233.221.129 with SMTP id r123mr25390255qkf.36.1496208995353;
        Tue, 30 May 2017 22:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496208995; cv=none;
        d=google.com; s=arc-20160816;
        b=hfRKJ6dtm1iR86kvkCGbtLXvcPAufy8HE5M6O5Rhnf2v0dKKreqHNZmX9UagPjRpRx
         7AANJ0jjk9geA/ZN/mAbOAKQeuQJnRKy3h18LVOJUT3PE0iQ0vgeWYE9+J/vcK70t2Ym
         TSsA8+Hr4R4v69pMUUtRLufssaYbpRU5teCiJW1uXU05ZZOTZBUtj7Y+TtNI9JKsMCGS
         Z4PdIBqh1mV5QK9HvhSjgEdB6GfEbPkP+lBLLEpo8Rpyy/BOSturTtxlIj5Z3IALL9jb
         HCrTf4lzJ5uQDeeO+FHxJTFuQugC5/fIbr5mRisVhp6LWyhF60Abkudwb8E8IsFWbHUn
         CbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=KMB6O04PzfVOSvIeq80E28+MQCmljgAvZnSdVlmwwKw=;
        b=VWm01JUBFFFTWqtytmovWu4ySB7koeoPiaB35VVVoiyINc0vxXh4BEAWF8tDuaMFJM
         Su74l/uFnHGdrRGX15z3wPMMCp1bHKiECvHauhzM6Rx7sYFVIliKPJNfuA2G1xO7q0j/
         FILXRCdIug+s/VhfCS7M/8oIIGJs9kMGDGxmY0KCZ/Oan5C0Ri9SqHT7eTAPn62QM156
         rXTGW3uvvS8K+OnfINrUTdzkM5sy5XgoDfU+SYJZgpmL6m49xIo0KAbVbtaO/48RZg4s
         QfTUKL40Z0E4iiWt40ri2lrF9zzHqPsfBD5BAPSS6Qmru3NIg1mJZz762PeBcSwTlrcF
         qUKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g15si14854885qtc.100.2017.05.30.22.36.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 22:36:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFwJ6-00018F-En
	for alex.bennee@linaro.org; Wed, 31 May 2017 01:36:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFwJ2-000185-EC
	for qemu-arm@nongnu.org; Wed, 31 May 2017 01:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFwIz-0000Zt-A8
	for qemu-arm@nongnu.org; Wed, 31 May 2017 01:36:28 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:35617)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFwIz-0000Zl-35; Wed, 31 May 2017 01:36:25 -0400
Received: by mail-oi0-x244.google.com with SMTP id v80so394056oie.2;
	Tue, 30 May 2017 22:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=KMB6O04PzfVOSvIeq80E28+MQCmljgAvZnSdVlmwwKw=;
	b=sBUY+4Y+uDdcxmOHsDuiWDsTFNSHkgXeDqNnq7+skDx7Wtcq6StyP5LLIbJV0+LQHS
	8y34t6T9JdRwCQwHhL46CKCkuGu3VAdWgwg1Xs5tjAF1+pom9vCZPPyRTSm0/HYvOJPy
	8XI8PXn96L/IfRigmvRl7FMfMFrXkurAdVrzUDUMVamY32w8yy6zr9LpXMOZeS/ntRLv
	6y1QBjkOwneyVPoY3JajIX5NcUIYKe7DHkIasPgnAwR8yByZfih9acI1eeG4F6SzDvBS
	tgEJU6SAtXO5P06+sD9obtosuublbSCe8GIfRZT5F5FxOHGyc5wZIkWPbgBxyowR4lxL
	215w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KMB6O04PzfVOSvIeq80E28+MQCmljgAvZnSdVlmwwKw=;
	b=OoRMIdafMAs9g20SDjP9QCzFKflQNTYvFtHogz0bThX9Yt3UWnP7YxFh0qSGw+Z+e6
	MDjGCixbNBFCk5WIYwkIiOwfMaW4vKmXyQA0cxb0i3Q2qCItAmN9hSm5OevcwYfVhHY4
	3LHBkynh6rOcABSXBhLAaDI5LVU+qQZEN80I6q6isQUQo+/QYPV+4TZSf58eR6x8mAew
	BIVe46xaUm5+t36d0KgIQ2cJNuohWYdVQPAF0KhyrVfJWKPTnT0tZaSDhAYCWgKaCHML
	pnorR1oiHn+ary5T4Uu819H4WWHLOgKQ7TdP/6kDrpHOE54KvzSbrzfZUNnNsUrRTElB
	e64Q==
X-Gm-Message-State: AODbwcBOumqLdRFzT/faTKVWc0D87CZ7IiQXcFYun7rp6phHhOL1l8YC
	pK8Gydps5zbIdQ==
X-Received: by 10.202.8.13 with SMTP id 13mr9422028oii.109.1496208984185;
	Tue, 30 May 2017 22:36:24 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id
	w79sm6909155oiw.13.2017.05.30.22.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 22:36:23 -0700 (PDT)
To: sundeep subbaraya <sundeep.lkml@gmail.com>
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
	<d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
	<CALHRZur8Uh0JCnOoY-_mUU_fyzbUgxbmWKtfOoB-GTYR5UcEnQ@mail.gmail.com>
	<CALHRZuoVHFOYV345JmvSkfJHsVjS7Wv_ySzAUtwo1D7eyoS_XQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <648515bf-ba1e-3d7f-d5bd-51b243f8c29f@amsat.org>
Date: Wed, 31 May 2017 02:36:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CALHRZuoVHFOYV345JmvSkfJHsVjS7Wv_ySzAUtwo1D7eyoS_XQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
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
X-TUID: TQNPuLZV41Gt

Hi Sundeep,

On 05/29/2017 02:28 AM, sundeep subbaraya wrote:
> Hi Philippe,
>
> Any update on this? I will wait for your comments too
> and send next iteration fixing Alistair comments.

Sorry I'm supposed to be in holidays ;)

>
> Thanks,
> Sundeep
>
> On Wed, May 17, 2017 at 3:09 PM, sundeep subbaraya
> <sundeep.lkml@gmail.com <mailto:sundeep.lkml@gmail.com>> wrote:
>
>     Hi Philippe,
>
>     On Wed, May 17, 2017 at 9:57 AM, Philippe Mathieu-Daudé
>     <f4bug@amsat.org <mailto:f4bug@amsat.org>> wrote:
>
>         Hi Sundeep,
>
>         This patchset is way cleaner!
>         I had a fast look and I like it, I'll try to make some time soon
>         to review details and test it.
>
>
>     Thank you
>
>
>
>
>         Is your work interested on U-Boot or more focused in Linux kernel?
>
>
>     I am interested more in kernel. I had to look into u-boot for first
>     time for Qemu only.
>     I worked only on FPGAs(load kernel with debugger) till now so never
>     got a chance to look into u-boot.
>
>
>         If you compile QEMU with libfdt support you can use the -dtb
>         option to pass the blob to the kernel directly, bypassing the
>         bootloader.
>
>     Yeah for armv7m I could not find any thing like that in tree.
>
>
>         If you need a bootloader you may give a look at coreboot which
>         supports dts well, see how Vladimir Serbinenko used Linux's dt
>         to boot a QEMU Versatile Express board:
>         https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-February/040899.html
>         <https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-February/040899.html>
>
>     Cool. I will look into it.
>
>     Thanks,
>     Sundeep
>
>
>         Regards,
>
>         Phil.
>
>
>         On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
>
>             Hi Qemu-devel,
>
>             I am trying to add Smartfusion2 SoC.
>             SoC is from Microsemi and System on Module(SOM)
>             board is from Emcraft systems. Smartfusion2 has hardened
>             Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
>             At the moment only system timer, sysreg and SPI
>             controller are modelled.
>
>             Testing:
>             ./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial
>             mon:stdio \
>             -kernel u-boot.bin -display none -drive
>             file=spi.bin,if=mtd,format=raw

I'm not sure the timer is working correctly, U-Boot loops with this pattern:

msf2_sysreg_read: addr: 0x00000048 data: 0x00000220
msf2_sysreg_write: addr: 0x00000048 data: 0x00000220
msf2_sysreg_read: addr: 0x00000048 data: 0x00000220
msf2_sysreg_write: addr: 0x00000048 data: 0x00000020
msf2_sysreg_read: addr: 0x00000048 data: 0x00000020
msf2_sysreg_write: addr: 0x00000048 data: 0x00000000
msf2_sysreg_read: addr: 0x00000048 data: 0x00000000
msf2_sysreg_write: addr: 0x00000048 data: 0x00000020
msf2_sysreg_read: addr: 0x00000048 data: 0x00000020
msf2_sysreg_write: addr: 0x00000048 data: 0x00000220

>
>             Binaries u-boot.bin and spi.bin are at:

you can compress spi.bin!

can you share u-boot.elf with debug symbols too?

Regards,

Phil.

>             https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git
>             <https://github.com/Subbaraya-Sundeep/qemu-test-binaries.git>
>
>             U-boot is from Emcraft with modified
>                 - SPI driver not to use PDMA.
>                 - ugly hack to pass dtb to kernel in r1.
>             @
>             https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git
>             <https://github.com/Subbaraya-Sundeep/emcraft-uboot-sf2.git>
>
>             Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource
>             driver added by myself @
>             https://github.com/Subbaraya-Sundeep/linux.git
>             <https://github.com/Subbaraya-Sundeep/linux.git>
>
>             v5
>                 As per Philippe comments:
>                     Added abort in Sysreg if guest tries to remap memory
>                     other than default mapping.
>                     Use of CONFIG_MSF2 in Makefile for soc.c
>                     Fixed incorrect logic in timer model.
>                     Renamed msf2-timer.c -> mss-timer.c
>                             msf2-spi.c -> mss-spi.c also type names
>                     Renamed function msf2_init->emcraft_sf2_init in
>             msf2-som.c
>                     Added part-name,eNVM-size,eSRAM-size,pclk0 and pclk1
>                         properties to soc.
>                     Pass soc part-name,memory size and clock rate
>             properties from som.
>             v4:
>                 Fixed build failure by using PRIx macros.
>             v3:
>                 Added SoC file and board file as per Alistair comments.
>             v2:
>                 Added SPI controller so that u-boot loads kernel from
>             spi flash.
>             v1:
>                 Initial patch set with timer and sysreg
>
>             Thanks,
>             Sundeep
>
>             Subbaraya Sundeep (5):
>               msf2: Add Smartfusion2 System timer
>               msf2: Microsemi Smartfusion2 System Register block.
>               msf2: Add Smartfusion2 SPI controller
>               msf2: Add Smartfusion2 SoC.
>               msf2: Add Emcraft's Smartfusion2 SOM kit.
>
>              default-configs/arm-softmmu.mak |   1 +
>              hw/arm/Makefile.objs            |   2 +
>              hw/arm/msf2-soc.c               | 201 +++++++++++++++++++++
>              hw/arm/msf2-som.c               |  89 ++++++++++
>              hw/misc/Makefile.objs           |   1 +
>              hw/misc/msf2-sysreg.c           | 161 +++++++++++++++++
>              hw/ssi/Makefile.objs            |   1 +
>              hw/ssi/mss-spi.c                | 378
>             ++++++++++++++++++++++++++++++++++++++++
>              hw/timer/Makefile.objs          |   1 +
>              hw/timer/mss-timer.c            | 249
>             ++++++++++++++++++++++++++
>              include/hw/arm/msf2-soc.h       |  69 ++++++++
>              include/hw/misc/msf2-sysreg.h   |  80 +++++++++
>              include/hw/ssi/mss-spi.h        | 104 +++++++++++
>              include/hw/timer/mss-timer.h    |  80 +++++++++
>              14 files changed, 1417 insertions(+)
>              create mode 100644 hw/arm/msf2-soc.c
>              create mode 100644 hw/arm/msf2-som.c
>              create mode 100644 hw/misc/msf2-sysreg.c
>              create mode 100644 hw/ssi/mss-spi.c
>              create mode 100644 hw/timer/mss-timer.c
>              create mode 100644 include/hw/arm/msf2-soc.h
>              create mode 100644 include/hw/misc/msf2-sysreg.h
>              create mode 100644 include/hw/ssi/mss-spi.h
>              create mode 100644 include/hw/timer/mss-timer.h
>
>
>

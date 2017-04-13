Received: by 10.25.0.144 with SMTP id 138csp563658lfa;
        Wed, 12 Apr 2017 20:21:27 -0700 (PDT)
X-Received: by 10.55.51.1 with SMTP id z1mr733058qkz.66.1492053687782;
        Wed, 12 Apr 2017 20:21:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j67si2263005qkd.22.2017.04.12.20.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Apr 2017 20:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47173 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyVK1-0000Qh-5P
	for alex.bennee@linaro.org; Wed, 12 Apr 2017 23:21:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cyVJu-0000Pd-Oi
	for qemu-arm@nongnu.org; Wed, 12 Apr 2017 23:21:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1cyVJt-0008Ey-LM
	for qemu-arm@nongnu.org; Wed, 12 Apr 2017 23:21:18 -0400
Received: from mail-yb0-x242.google.com ([2607:f8b0:4002:c09::242]:36056)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1cyVJr-0008EO-E8; Wed, 12 Apr 2017 23:21:15 -0400
Received: by mail-yb0-x242.google.com with SMTP id l201so1873650ybf.3;
	Wed, 12 Apr 2017 20:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GEuseDJKp2FXQa/h0IJ+jnTP/Mx7PCLb2cl/RrXy6AU=;
	b=UTpVHa1lqXcC8WjLlZQJFM3IxzKfgqX84vx/twZi413/pFPnD4CzYqEpt/gGZx9UHS
	EiMUawDG0wq0QHfH/o8IrohefqLNWhAkPZae6sbM7pL0FROdjLnZS6HRtbcJQ3Dx098b
	FA/ye854F2egaktpIDHm4fkQ9/Q2rBLLjIAp2pUfeC6yKYvrmH0csNtMuE3WgO/zirul
	1R6GUtqzy6/BCZi4z4OD5I77ydjoWP3gUqt0jcwd0sOjoWroeB3Jfp8MiDZniBLwSeEu
	oCh/bSdjM+0NQ6Axgj+hbqCt2PZNRMr3HII0HWyifV1ju972kik1nogEwEy6vgVuzqT9
	0F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GEuseDJKp2FXQa/h0IJ+jnTP/Mx7PCLb2cl/RrXy6AU=;
	b=Otxqappp0oCx1tO2rfDfOie9/OGcUrLEHrj/eBC64+mUa9qu+ELMWwOmvXbJXAmSjs
	ii6lZ5h1z8q5S23MvJ0Kxz9K/3KdV6eCklcloazd9fQbDZ/kwjxroVO8oEEpSk6LTNqt
	5S2Fr/OYLlk4U8fOXvQAxMKbGP7D5wsSNdw6xamuCWHZeKSDeb9fTPRas8lQtaQhID1c
	k8d0Qx2P8xwPviwlo3+Zudr1meKNaKWxB99wmqa0YvVb7TGvb05T9znnQXPNa6RmTq+F
	9OWg9o4JTEYdo7SAS0r31hCrKT+bcB/8aWAg24Autsracb/+LiGrCJcbBvAFX7gXWU3I
	zTBg==
X-Gm-Message-State: AN3rC/6woEGo+qTFasYnY03TA2pZZxXHMYQjFlMhKXJxnnrlqOPHdBFd
	AfKSY2Y68bxg2Zo6iMjWcHTbXZtZpw==
X-Received: by 10.37.172.100 with SMTP id r36mr699648ybd.107.1492053672748;
	Wed, 12 Apr 2017 20:21:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Wed, 12 Apr 2017 20:21:12 -0700 (PDT)
In-Reply-To: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Thu, 13 Apr 2017 08:51:12 +0530
Message-ID: <CALHRZurSfOAt53Sf=aGdGe7cHCxNggjUrt6pPDEQLRcvfX_cDA@mail.gmail.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::242
Subject: Re: [Qemu-arm] [Qemu-devel RFC v2 0/4] Add support for Smartfusion2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4cn1pLpgHPBk

Hi Qemu-devel,

This is my first attempt in Qemu.
Please let me know am doing correct or not.
SoC is cortex M3 based so no bootrom stuff and unlike other
SoCs Qemu need not load dtb and kernel in DDR. Hence am using
u-boot (supplied with -kernel) as bootloader in eNVM and it loads
kernel from SPI flash to DDR same like real hardware scenario.
Also let me know any other Maintainers need to be CCed.

Thank you,
Sundeep

On Sun, Apr 9, 2017 at 4:49 PM, Subbaraya Sundeep
<sundeep.lkml@gmail.com> wrote:
> Hi Qemu-devel,
>
> I am trying to add Smartfusion2 SoC.
> SoC is from Microsemi and System on Module(SOM)
> board is from Emcraft systems. Smartfusion2 has hardened
> Microcontroller(Cortex-M3)based Sub System and FPGA fabric.
> At the moment only system timer, sysreg and SPI
> controller are modelled.
>
> Testing:
> ./arm-softmmu/qemu-system-arm -M smartfusion2-som -serial mon:stdio \
> -kernel u-boot.bin -display none -drive file=spi.bin,if=mtd,format=raw
>
> U-boot is from Emcraft with modified SPI driver not to use PDMA.
> Linux is 4.5 linux with Smartfusion2 SoC dts and clocksource
> driver added by myself @
> https://github.com/Subbaraya-Sundeep/linux.git
>
> Baremetal elfs from Microsemi Softconsole IDE are also working.
>
> Changes from v1:
>     Added SPI controller.
>
> Thanks,
> Sundeep
>
> Subbaraya Sundeep (4):
>   msf2: Add Smartfusion2 System timer
>   msf2: Microsemi Smartfusion2 System Register block.
>   msf2: Add Smartfusion2 SPI controller
>   msf2: Add Emcraft's Smartfusion2 SOM kit.
>
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Makefile.objs            |   2 +-
>  hw/arm/msf2_soc.c               | 141 +++++++++++++
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/msf2_sysreg.c           | 168 +++++++++++++++
>  hw/ssi/Makefile.objs            |   1 +
>  hw/ssi/msf2_spi.c               | 449 ++++++++++++++++++++++++++++++++++++++++
>  hw/timer/Makefile.objs          |   1 +
>  hw/timer/msf2_timer.c           | 273 ++++++++++++++++++++++++
>  9 files changed, 1036 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/msf2_soc.c
>  create mode 100644 hw/misc/msf2_sysreg.c
>  create mode 100644 hw/ssi/msf2_spi.c
>  create mode 100644 hw/timer/msf2_timer.c
>
> --
> 2.5.0
>

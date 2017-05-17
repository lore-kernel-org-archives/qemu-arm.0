Received: by 10.25.0.6 with SMTP id 6csp57859lfa;
        Tue, 16 May 2017 21:28:09 -0700 (PDT)
X-Received: by 10.200.45.247 with SMTP id q52mr1160494qta.177.1494995289208;
        Tue, 16 May 2017 21:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494995289; cv=none;
        d=google.com; s=arc-20160816;
        b=c+QPr3vb2HUsLQUQ0paP55UhnPCKHQPwvLJPVot/5Zv98XZhwImAVI47iJzhAqGuNh
         qHRWJ1FfqClohDu8F3+9v4eiS9K3WM2Qnd0TKfMgPwZuDneY2LkotjKq09IRLvxdns5l
         U86kWZDpkJ3/48sF6UnP0hpi3OLzz/57QZnBwexLyFuoTZRyOFOU1ispUPJTSdmTlym2
         Z2aYGQ/E+Byk+d0jNQXw9RRp1FcDCC429EdOyjlfyUoDb65s1eE1gikfvROeCe4VuOV5
         594lJ26o6b2ad7vLTE3nkygCRCrVtUObmSGEGuI77u2OMzMyI063Mwg2tZue3WKb8pjG
         8s/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=XhtElK2+WiVxFSoOSYqLJJM9NzqTL/7asfltTBJj6EM=;
        b=r3cJzdQGr3QkgBLQ87HRi97q3xUeJYa1SL0qzHwd0VjNesJlfXqpepIIfIl90ebAay
         MKO19vnEPo1o8CqSSwiHOQpKhspZAIk2Eo0dseVMaymoOlZcKOKaMJQEnsACzC1TnTqk
         5mpTWhxz2TjuJA7gM5owYFAfqszF9XuK65v/Ev0GoLW5HAAtVZ3VaXXOwz4w89KD8S45
         zwKHphn2twkXLcnRdBeYGpImDBv8f9Sk1WiLGt67Vv7jlXbhFoP/3pwNUSYNmD5qxDZL
         PMaUadEnixlw8En6PRXLJz6Vq/gUiBO4yq9JucOM003hmMFRnyrHny5YThD/gUhJZe/B
         yqHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s17si930274qta.320.2017.05.16.21.28.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 21:28:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAqZE-00081m-GO
	for alex.bennee@linaro.org; Wed, 17 May 2017 00:28:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAqZ1-0007zl-78
	for qemu-arm@nongnu.org; Wed, 17 May 2017 00:27:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAqYy-00069c-2R
	for qemu-arm@nongnu.org; Wed, 17 May 2017 00:27:55 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34555)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAqYx-00069Q-U7; Wed, 17 May 2017 00:27:51 -0400
Received: by mail-qk0-x244.google.com with SMTP id u75so162739qka.1;
	Tue, 16 May 2017 21:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XhtElK2+WiVxFSoOSYqLJJM9NzqTL/7asfltTBJj6EM=;
	b=tAlHWlo/ETP4PRF0lqzeYf4sX/QkZTX7IaV2xReex54w7dcxi5wgndtk/90rm8gbfV
	9+di5fGwhj4Js2bPOCTVCVkWkGumn1cLmjT/Y70k6DipeDIG+7KkUq4QKINnobtfJASN
	kKBeKuTfQ9hoBsHA/vQlO/psF24/79hlHQdsyD3fuwj9rkaiIp7AINqxNGwaF2sOuP/G
	W6Ma/oOTXpHMVRUYVkro6CP1+e2Js3OtaeRPREYQlT8tYMf40ue50JuF4wXv0p7+ehk0
	xoi/B/xvwK7VrX2kceoqeodjgKwQB+WNWi5DrzItI2ogk7The9AGHKD8FzxCLs3eegsw
	owjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XhtElK2+WiVxFSoOSYqLJJM9NzqTL/7asfltTBJj6EM=;
	b=ifPqj4gEzcx3J5Pdb1M7C5EgRur2DSlF43KVPkJN5sTMVpCAcvYDrIG5RRRYqpyX0n
	rp1ySx065KwLPnTq5bFzLnlyGu2zdz3Ox3rBRbxi1biGpMP4yjYdmcXeCGxb2A98O4M0
	xLooz2TeYYcu29KPEn0DFxSERXx+d9rch7bi0xGdYMo8gink7u25+ABz/neoJ/mP5bML
	eu3tyIpNEfzs4hLMnFJhYb4wK9N40hwSaSVcGL4YAp/B2auT0f6TSOs9p4UVzV0Y1QZX
	/R/ArHFgR3kGcLoQKrQPEi2yA16nPN+4D2R8heMWJ6vkzckVvY5ZVBTN0vt6QV9EmfSg
	BdIA==
X-Gm-Message-State: AODbwcDcyAaduOYj0UgqB9Datm44x7ZGn0aeGIrpZPE2Bd0RIULJ0b/2
	O+9SllaaVEdKmw==
X-Received: by 10.55.210.4 with SMTP id f4mr1222050qkj.266.1494995271309;
	Tue, 16 May 2017 21:27:51 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id l10sm619495qte.15.2017.05.16.21.27.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 21:27:50 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d403f33f-647e-a142-4265-7d856d8be6aa@amsat.org>
Date: Wed, 17 May 2017 01:27:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494949133-2202-1-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
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
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fChIyWBD4DQT

Hi Sundeep,

This patchset is way cleaner!
I had a fast look and I like it, I'll try to make some time soon to 
review details and test it.

Is your work interested on U-Boot or more focused in Linux kernel?

If you compile QEMU with libfdt support you can use the -dtb option to 
pass the blob to the kernel directly, bypassing the bootloader.

If you need a bootloader you may give a look at coreboot which supports 
dts well, see how Vladimir Serbinenko used Linux's dt to boot a QEMU 
Versatile Express board:
https://mail.coreboot.org/pipermail/coreboot-gerrit/2016-February/040899.html

Regards,

Phil.

On 05/16/2017 12:38 PM, Subbaraya Sundeep wrote:
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
>         Pass soc part-name,memory size and clock rate properties from som.
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
>   msf2: Microsemi Smartfusion2 System Register block.
>   msf2: Add Smartfusion2 SPI controller
>   msf2: Add Smartfusion2 SoC.
>   msf2: Add Emcraft's Smartfusion2 SOM kit.
>
>  default-configs/arm-softmmu.mak |   1 +
>  hw/arm/Makefile.objs            |   2 +
>  hw/arm/msf2-soc.c               | 201 +++++++++++++++++++++
>  hw/arm/msf2-som.c               |  89 ++++++++++
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/msf2-sysreg.c           | 161 +++++++++++++++++
>  hw/ssi/Makefile.objs            |   1 +
>  hw/ssi/mss-spi.c                | 378 ++++++++++++++++++++++++++++++++++++++++
>  hw/timer/Makefile.objs          |   1 +
>  hw/timer/mss-timer.c            | 249 ++++++++++++++++++++++++++
>  include/hw/arm/msf2-soc.h       |  69 ++++++++
>  include/hw/misc/msf2-sysreg.h   |  80 +++++++++
>  include/hw/ssi/mss-spi.h        | 104 +++++++++++
>  include/hw/timer/mss-timer.h    |  80 +++++++++
>  14 files changed, 1417 insertions(+)
>  create mode 100644 hw/arm/msf2-soc.c
>  create mode 100644 hw/arm/msf2-som.c
>  create mode 100644 hw/misc/msf2-sysreg.c
>  create mode 100644 hw/ssi/mss-spi.c
>  create mode 100644 hw/timer/mss-timer.c
>  create mode 100644 include/hw/arm/msf2-soc.h
>  create mode 100644 include/hw/misc/msf2-sysreg.h
>  create mode 100644 include/hw/ssi/mss-spi.h
>  create mode 100644 include/hw/timer/mss-timer.h
>

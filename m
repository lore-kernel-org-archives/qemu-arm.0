Received: by 10.25.0.6 with SMTP id 6csp190444lfa;
        Wed, 10 May 2017 02:44:41 -0700 (PDT)
X-Received: by 10.200.43.99 with SMTP id 32mr4614935qtv.6.1494409481517;
        Wed, 10 May 2017 02:44:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494409481; cv=none;
        d=google.com; s=arc-20160816;
        b=iZCKHIcLBLEO0HH3WvQA+zAG/A6zKLBDSHwB45Hu0azaLigIS4Eo02Hoy1gH0ydY6N
         d/zR8+Lta3PhtmqMA2YiSHLMr3AsngPI9Hr/BaeCwtNxDl2oQB1omTu2rIqmBpV7TfSO
         nDvNEJYk5U+Dwmp4hMHWPDAXT5BRsWRh8NLkrGZz8i+87TeNRF6UFbGi1mDNIvprfWQQ
         eY8mq4Ab64vBHUyqLTpMVxpqIFZGFZ7uPSV9pEkfmvfDXei7on48ubmxLbBxX8FZ/VNX
         pLXmsjN/j0iLnDoB0O6E9XvYxnupId/9f1sxU7I3GBI19kDEfaLKH6CWx8jwi06grrF3
         ZZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=WVk0qCBjIgzlcz19BI1Gy3szw0z2V34wCvM9qpUmwhc=;
        b=k414DOncmk7Ym9fhEkA8+Sb5uM+s8mgz8T88kpIhOYWRZ1e3KySY03fizu1BbgmaXQ
         n2UJJI8CoaTJYWRgGdKwBmgZG61TjmnD/Kk+WqIJuM5we161Bf0H6lDuLzDDvPNxNmLn
         VZgY+7FLuZDE+WG5g7NYjrEdo4lXaWdD3BwVLXwPhFzYHVPtW+1z8JwAWgzhS8++SPDA
         9qabiym0drCeD4gks6iLXk4HxGi9BDV4jGbD6nwR0i2ciKXzcZejjizjIfsZwithe5sw
         tTBeZlcT1RSH2AGC5LBzgP+2S6qmYMuOv2+eAFGc5ph/+adRaxG6QCXRkU7mRODWJO3B
         QGEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d40si2075861qtf.246.2017.05.10.02.44.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 May 2017 02:44:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d8OAi-0007UB-T4
	for alex.bennee@linaro.org; Wed, 10 May 2017 05:44:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8OAc-0007U5-Cg
	for qemu-arm@nongnu.org; Wed, 10 May 2017 05:44:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8OAX-0006VU-Kg
	for qemu-arm@nongnu.org; Wed, 10 May 2017 05:44:34 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33050)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8OAX-0006VO-G2; Wed, 10 May 2017 05:44:29 -0400
Received: by mail-qt0-x243.google.com with SMTP id a46so3366380qte.0;
	Wed, 10 May 2017 02:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=WVk0qCBjIgzlcz19BI1Gy3szw0z2V34wCvM9qpUmwhc=;
	b=MILVlkAKmpymHj9qdiq3AmMz7Tn4N282+7rZA8sE02PjqPhbVmf0VqSvg2nQP8eZfa
	J5UUwTeriRkoBvGCnNGggSdD7mGc6JTObDw7W4dO/IJd8Dnx+cqVoAGS0WnPYurrf2AZ
	r4T/iNHosR9l+eIB3+O3J457rIb+LL4eP5lg3vMA7QOQBgayQrEzvcgUarP1aD6Y3GGn
	4eBxppum2PFKjdv+294Jq8mIJCe+SAELhLL0oJ0KNx6bGQ6DWuqpAjFGQ3nkGJVdW9N/
	IEktyaehMf1hjxupc1MJpqLNLbiDt++7bc+pC57dNWQ5sGNZfSho484vq+isIT00eo24
	funQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WVk0qCBjIgzlcz19BI1Gy3szw0z2V34wCvM9qpUmwhc=;
	b=Yyk5eoVC0j7+KyppIEHvaajwdX/iL0VYEt9ngrhGzUUuzXgaLH0aVxRtoaebksHT2G
	4+oBoKdkw91Wc/bpvn7gMDQ2tyPrCWiGs++s/2tZ0JCHZIKxK1ZtDkuLsriwqjndFi2X
	z1kcPJ0KbHZqNAiTTjo/GbUNSg7NyxLUdmbD/zElo3h2fvXc43i8811Zc7K4M8lRdOfa
	KCuExSCllfEqltkDr16TDybWRoL1dSVfzm6RBSA0juTU9XhAZFMGoE3YCWuEObOwQGD/
	KqkzPJsKY4cCTcGqa8QcTPquFyDM3RpB0Utm37U8Hczg8QgelV5YovHaR5WJ4rNH3V+L
	D0SQ==
X-Gm-Message-State: AODbwcB7zzBddNVPeYYJ/oJjJO/aZJMkKK7RYf1MbrWSofWzeR9+lzKJ
	hKew5bKFVfvWxQ==
X-Received: by 10.200.41.108 with SMTP id z41mr4400339qtz.68.1494409468907;
	Wed, 10 May 2017 02:44:28 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	j204sm1765459qke.27.2017.05.10.02.44.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 02:44:28 -0700 (PDT)
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <031eab53-a6ec-2248-d4ea-b4352243baae@amsat.org>
Date: Wed, 10 May 2017 06:44:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
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
Cc: peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uKHEc8zLEeKz

Hi Subbaraya,

This is your v4 of this patch set, please don't forget to include the 
version in your next set.

Please also include changes between versions in your cover letter, it 
eases the review.

On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
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
>  hw/arm/Makefile.objs            |   3 +-
>  hw/arm/msf2-soc.c               | 188 ++++++++++++++++++++
>  hw/arm/msf2-som.c               |  67 +++++++
>  hw/misc/Makefile.objs           |   1 +
>  hw/misc/msf2-sysreg.c           | 131 ++++++++++++++
>  hw/ssi/Makefile.objs            |   1 +
>  hw/ssi/msf2-spi.c               | 378 ++++++++++++++++++++++++++++++++++++++++
>  hw/timer/Makefile.objs          |   1 +
>  hw/timer/msf2-timer.c           | 252 +++++++++++++++++++++++++++
>  include/hw/arm/msf2-soc.h       |  60 +++++++
>  include/hw/misc/msf2-sysreg.h   |  80 +++++++++
>  include/hw/ssi/msf2-spi.h       | 105 +++++++++++
>  include/hw/timer/msf2-timer.h   |  85 +++++++++
>  14 files changed, 1352 insertions(+), 1 deletion(-)
>  create mode 100644 hw/arm/msf2-soc.c
>  create mode 100644 hw/arm/msf2-som.c
>  create mode 100644 hw/misc/msf2-sysreg.c
>  create mode 100644 hw/ssi/msf2-spi.c
>  create mode 100644 hw/timer/msf2-timer.c
>  create mode 100644 include/hw/arm/msf2-soc.h
>  create mode 100644 include/hw/misc/msf2-sysreg.h
>  create mode 100644 include/hw/ssi/msf2-spi.h
>  create mode 100644 include/hw/timer/msf2-timer.h
>

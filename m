Received: by 10.223.161.27 with SMTP id o27csp721023wro;
        Fri, 27 Oct 2017 06:08:45 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+R5fi5keqKlsXL363IHE4fpkem6zxdln7xgdnT+0vWSlqiuZG3aNuwDpKYs1041DQJ1KF0R
X-Received: by 10.129.68.6 with SMTP id r6mr296885ywa.110.1509109725753;
        Fri, 27 Oct 2017 06:08:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509109725; cv=none;
        d=google.com; s=arc-20160816;
        b=zBInA8/KhPi5HiogghbplrKSqT2OO44N0vHqYyUwrLww5V8HVOwqW5/OAbBT9UmpmQ
         HRCD8eQo2OIJLvrmNNEbK2j9G9AgUqSuZuR2jnR6KsJ0gNshxeOU5liVMIEClxpdv8uN
         PeYMpqEzfrP4u4T/qtPYRsel8orvSb09qCwr5wZ2n+OlzWoajbmyp1nA/K1eWgCp2/lG
         R3RsnwLxCXN8L3E7wMcjkbPJzPxsxuNBtajAbbHK1pbQue0WrFO9s/bXHgmERIxITCOF
         h8+oYTqznZ9tTBNs5Q9FTWaN0NtSB61XpFbFZnt1ywSvWdXdIzmu9niBtYSiiYbCKOC7
         C39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=lzvpeRDiU+72yp0n3EMtlSSCiaBGegoDjFX1ut5hNLk=;
        b=kUQz3vOk3O2jqzSbvoKvkvas2gjxTNDBAPXozOve2rEmC2jYWJXcRivT5f1V4S/i78
         Qh7nLq59jVs+ih9qnd6wF5mb3he2nTgOIE7GpQZuiVBQgkepRxr7F3VZI5/0lHdBM1BQ
         lrnVLzc/I4dUz9OyzOgEzACzk1C6A0a0w4PpA+3vml0KAEU1EodsF+ICIwlLzfS0CN4T
         28U0bFbPGXKfm8bpV0LVWT0dBRNxquPtrXTWb6KdjxjjFjzLrfNFn86s0bchudULvSCG
         H6fEsj144BJ86jz7jj4jtNvHvGZii+totBLKthQquDp4JiWdq6TZx4mPtCV/iSPrDVES
         sqCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e9si1141317ybm.358.2017.10.27.06.08.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Oct 2017 06:08:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e84NR-0001xa-5m
	for alex.bennee@linaro.org; Fri, 27 Oct 2017 09:08:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1e84M1-0001FE-2X
	for qemu-devel@nongnu.org; Fri, 27 Oct 2017 09:07:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1e84M0-0006CR-1j
	for qemu-devel@nongnu.org; Fri, 27 Oct 2017 09:07:17 -0400
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:46996
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1e84Lz-0006AF-Qf
	for qemu-devel@nongnu.org; Fri, 27 Oct 2017 09:07:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id DA74A81396;
	Fri, 27 Oct 2017 15:07:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ec4Jnx2N7WVG; Fri, 27 Oct 2017 15:07:13 +0200 (CEST)
Received: from localhost.localdomain (unknown [IPv6:2a02:2ab8:224:100::1000])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 4938E8138E;
	Fri, 27 Oct 2017 15:07:11 +0200 (CEST)
To: Gabriel Costa <gabriel291075@gmail.com>
References: <1509014053-28134-1-git-send-email-costa@advantech.ca>
	<1509014053-28134-7-git-send-email-costa@advantech.ca>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <d48801c9-4801-d271-2d13-e08a518391fc@adacore.com>
Date: Fri, 27 Oct 2017 15:07:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1509014053-28134-7-git-send-email-costa@advantech.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: Re: [Qemu-devel] [PATCH v6]arm: Makefiles to kinetis k64 platform
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	f4bug@amsat.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bq4L57B2K5Fr

Hi,

Why does this patch has a v6 prefix? And it seems some patches
are missing.
To send your patches I suggest you use git send-email.

About this patch:
Each Makefile modification should go in the patch which
introduces the new model.
eg:
hw/char/Makefile.objs must be modified in 4/5 kinetis_k64_uart.

Fred

On 10/26/2017 12:34 PM, Gabriel Costa wrote:
> From: Gabriel Augusto Costa <gabriel291075@gmail.com>
> 
> This file change the Makefiles to compile the mk64fn1m0 machine.
> 
> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
> ---
>   default-configs/arm-softmmu.mak | 1 +
>   hw/arm/Makefile.objs            | 1 +
>   hw/char/Makefile.objs           | 1 +
>   hw/misc/Makefile.objs           | 3 +++
>   4 files changed, 6 insertions(+)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 5059d13..a835d4f
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -130,3 +130,4 @@ CONFIG_SMBIOS=y
>   CONFIG_ASPEED_SOC=y
>   CONFIG_GPIO_KEY=y
>   CONFIG_MSF2=y
> +CONFIG_KINETIS_K64=y
> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> index 2794e08..874a38a
> --- a/hw/arm/Makefile.objs
> +++ b/hw/arm/Makefile.objs
> @@ -20,3 +20,4 @@ obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
>   obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
>   obj-$(CONFIG_MPS2) += mps2.o
>   obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
> +obj-$(CONFIG_KINETIS_K64) += mk64fn1m0.o
> diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
> index 1bcd37e..75b194c
> --- a/hw/char/Makefile.objs
> +++ b/hw/char/Makefile.objs
> @@ -31,3 +31,4 @@ common-obj-$(CONFIG_SCLPCONSOLE) += sclpconsole.o sclpconsole-lm.o
>   
>   obj-$(CONFIG_VIRTIO) += virtio-serial-bus.o
>   obj-$(CONFIG_TERMINAL3270) += terminal3270.o
> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_uart.o
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 19202d9..c5c8589
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -61,3 +61,6 @@ obj-$(CONFIG_AUX) += auxbus.o
>   obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
>   obj-y += mmio_interface.o
>   obj-$(CONFIG_MSF2) += msf2-sysreg.o
> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_mcg.o
> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_pmux.o
> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_system.o
> 

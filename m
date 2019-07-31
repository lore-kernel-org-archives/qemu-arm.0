Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5817098wrv;
        Wed, 31 Jul 2019 08:51:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkZJPA7Dw5dn9/WgiDrsHF4CWDU47rwMm9Pl2A5hqq2hc+N1AlbNP6wTroJnIYmIR2QwbJ
X-Received: by 2002:a1f:e002:: with SMTP id x2mr37033511vkg.1.1564588273830;
        Wed, 31 Jul 2019 08:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564588273; cv=none;
        d=google.com; s=arc-20160816;
        b=KslJisvk/njdzfK/HDl7jO4PrpjGEpMvOWlDwiF9fVtMNhULn7Qg+esfR7t7rcQudS
         0PA9rbIfBiDbky06OB4Y7Vcayhi71ZOCpWNDaTHm8yBqfjSkQx/L6WPRtsgdL/WGKs1x
         FRg7uPN4leZfZVPNypR8QBDAMmsE7Q8vjgeTPVFqSWhaHyp9gtK4O9ykhu3IOWI/SNO9
         YQxEAoVsUKsFaOumTO57ODMcIl/hm2GAIIw1vzjEpzmHtQAXy2VbDukX5/5x4e18uqw3
         SUNM8OZIjBeckNt075udIly51PfX5ZcvlKDLSfH9ILFA22/HCu1sk0sSguuLOlHtLTRf
         DZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Ey6ptsh6teX0ACw8yW/3Dt/gvHiAvQLFfYgGGVxBZUY=;
        b=OMQMrxOUt40kefwcFTNFLKL6s7E80U64U97DS8TSjrpZfYTLJ0PyUpQqysKDnQ5drq
         FxlYgGaHmOHNI1z+nfpPYBEpnHdh5TbrdbtaF36c0369hwC8WlJLfeyzST7LoVjdzTtl
         BQ9UB+GWvl1nOMeYAhSjnWglxNrspReLTkZcmTGsEMuv5uf6TnTJKu2sqD8wSSnPgjFV
         bxCu8Thdr9lxWm0PxhAl3jQf+EJljNj/BwuAmZu2Om/ghdrfim1BHS2LJEbfq4tSbL2Q
         p87QDzSR7K5Sw8LWNVyaWiFt4VH575E5tI4BbsyrSAVUdOa+XspHL1NxHuRwE0vaKmlX
         KzoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l18si5136596vsj.347.2019.07.31.08.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 08:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsqsj-0004jT-BT
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 11:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36304)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsqsF-0004jF-S6
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:50:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsqsE-0000qm-Qb
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:50:43 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39769)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsqsE-0000qF-L0
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:50:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so17088438wrt.6
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 08:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ey6ptsh6teX0ACw8yW/3Dt/gvHiAvQLFfYgGGVxBZUY=;
 b=AU6hjLo9wC4YbjW7hSuFExmygiZP4MbS+95B37b1sVcwXlbCZLCg1qivUv0oaEq42f
 VcdRzOGYIs6zSK6WPFeAzsAmhRIsmSORZwGUCiysOVAkqsNsBxnbArFCXFgEgvGHOgWu
 /H7bIvCf0TnHNpXkdCRtjofS1uedLGUyJ5aeVZXFC4HZeRaghh8+6rTlgaCd8BmIY3/A
 2O+8scrf+5sHYB5BDJggCPac6QuBxlJ44LLZQ6C7s+cVkI2Ba7L3pOvGB7viVcPzjnjB
 3mCHY2RvxWfPQQVP26MteLTs9eUUwZZNSRiS0YPPqnw2tOZlgPrZdFocKlEH4I4EfzUx
 bsgw==
X-Gm-Message-State: APjAAAXim3RfuFS3ZqMCsUS7UYdUjhA/6AZo/9+3hcvBCYH7ctvpWYfE
 WxSdD5EAn1FxWzx1WnjavqYFug==
X-Received: by 2002:a05:6000:112:: with SMTP id
 o18mr55608911wrx.153.1564588241585; 
 Wed, 31 Jul 2019 08:50:41 -0700 (PDT)
Received: from [10.201.33.84] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id y16sm70473886wrw.33.2019.07.31.08.50.40
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 08:50:40 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20190731075652.17053-1-thuth@redhat.com>
 <20190731075652.17053-6-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4e534a91-4775-a58e-11b8-1fc776128f1f@redhat.com>
Date: Wed, 31 Jul 2019 17:50:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190731075652.17053-6-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [PATCH v2 5/8] hw/core: Add a config switch for the
 "or-irq" device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Fy1cEtm6JqY

On 7/31/19 9:56 AM, Thomas Huth wrote:
> The "or-irq" device is only used by certain machines. Let's add
> a proper config switch for it so that it only gets compiled when we
> really need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/Kconfig        | 3 +++
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  hw/pci-host/Kconfig   | 3 ++-
>  4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index ab65ecd216..849195c3f6 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -292,6 +292,7 @@ config RASPI
>  config STM32F205_SOC
>      bool
>      select ARM_V7M
> +    select OR_IRQ
>      select STM32F2XX_TIMER
>      select STM32F2XX_USART
>      select STM32F2XX_SYSCFG
> @@ -360,6 +361,7 @@ config MPS2
>      select LAN9118
>      select MPS2_FPGAIO
>      select MPS2_SCC
> +    select OR_IRQ
>      select PL022    # Serial port
>      select PL080    # DMA controller
>  
> @@ -439,6 +441,7 @@ config ARMSSE
>      select IOTKIT_SECCTL
>      select IOTKIT_SYSCTL
>      select IOTKIT_SYSINFO
> +    select OR_IRQ
>      select TZ_MPC
>      select TZ_MSC
>      select TZ_PPC
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index d11920fcb3..984143456a 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -7,6 +7,9 @@ config PTIMER
>  config FITLOADER
>      bool
>  
> +config OR_IRQ
> +    bool
> +
>  config PLATFORM_BUS
>      bool
>  
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index d6cfb2a81b..ce337bd7c9 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -18,7 +18,7 @@ common-obj-$(CONFIG_SOFTMMU) += loader.o
>  common-obj-$(CONFIG_FITLOADER) += loader-fit.o
>  common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
>  common-obj-$(CONFIG_REGISTER) += register.o
> -common-obj-$(CONFIG_SOFTMMU) += or-irq.o
> +common-obj-$(CONFIG_OR_IRQ) += or-irq.o
>  common-obj-$(CONFIG_SOFTMMU) += split-irq.o
>  common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
>  common-obj-$(CONFIG_SOFTMMU) += generic-loader.o
> diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
> index 8c16d96b3f..1edc1a31d4 100644
> --- a/hw/pci-host/Kconfig
> +++ b/hw/pci-host/Kconfig
> @@ -2,8 +2,9 @@ config PAM
>      bool
>  
>  config PREP_PCI
> -    select PCI
>      bool
> +    select PCI
> +    select OR_IRQ
>  
>  config GRACKLE_PCI
>      select PCI
> 

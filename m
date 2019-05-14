Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3843147wrg;
        Tue, 14 May 2019 03:41:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRPn1LNWiQAyTzlF9WNkpvoJnpvkWt1Jyi+1/NGpNkBcc+nXzrFMWk9ybOWPqoq8zEwJyK
X-Received: by 2002:a17:906:958:: with SMTP id j24mr18152835ejd.160.1557830460184;
        Tue, 14 May 2019 03:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557830460; cv=none;
        d=google.com; s=arc-20160816;
        b=Kf2CGls3inWDj0nYJ6rPDc6Ea5N4dvqIhIs1uet4NbNsAZ3TzLUnIpYFSS8T+QU6Bl
         XKqPj3DUB96oVzNHs9hRVB5K01VLg9Y3zUChp6wutKlSLh3uAMMIuMZDo+GvZcFycjRX
         qAiqbIA2BnExyQs2vC/3Mz5k3FCLVSntXW5rncAL9x6H470+pHHs3d8pvvO14FislShj
         y96w7Oz/YT9o2zUp53dgVxHPhkG0kIX+3xII2vVaVtPIxsOmaYwtEuwiH0HAEk50Y2jC
         /s0MN6+VPk44rwNm/P8CLAtWyJ59e5zU64B63e2lRsJdfaFM+Oic/eKalN4uBQMKLpI3
         anKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=TB0K9v3OzkgaK8Mzqtn7indwDU74Za3mEXU8p1hwlOk=;
        b=od/7ncbg1CpfeEtlqfIqOTnrrtU4rJe9I2P3Gv7DfpLwRA3s8gbTE2FLVCngus+HMA
         4NVItxelcpqgZFDfA/8CoI+hfDvT00HsVPf2chusClGvshYaa3xAQvdhrA0pd6+9jz3d
         NPSsNyEotMz3Gv661tRwWkVAILPcsQd6BNS7YkXSOYVLgZ62ZCruqqmuts9HFXM8In0q
         4kHyvMG3CfKci3S8l3QYpCbI6RJcbxh+vKxgTwU+ee3dGr121rbvHYutRtzFxQLcDmH1
         UBmHEEkdthGCs8HCYtH1Jt6usHLMUWLpCWKsM86ONyDtRLjxbi2UfYB1W3N146A1s/oJ
         FGvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l44si703587edb.410.2019.05.14.03.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQUrj-0004sV-6Y
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:40:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUqx-00049o-Mk
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:40:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUmk-0006Zo-M2
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:35:51 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44007)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hQUmk-0006ZI-Ek
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:35:50 -0400
Received: by mail-wr1-f67.google.com with SMTP id r4so18583329wro.10
	for <qemu-arm@nongnu.org>; Tue, 14 May 2019 03:35:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=TB0K9v3OzkgaK8Mzqtn7indwDU74Za3mEXU8p1hwlOk=;
	b=rxQpAJWSaDRpeT/qvr4XhNEIVs9qagYBbiWNiLnUFHUtiYxSPVJ9LrDw9NiLPZtKE3
	PosA0H9WA/I/zGOjXm0wUb/9b6PR99mEbmh7Z1nlYm0T9tDj/hPE8iEnkmOolgi5w9nl
	jWx1k3wCmttF/e/VdECFeajf8m3QE9g0kl3x1H2YCxGSpClznxdeW13Oum77oRyt+sz2
	Gti5qCm0MjZHv1a2xoHnUrH3OZifMqZOxFSnYaWK/RW5C/5efGFrwwPPsvh16sNFgTkQ
	i53jy0AENaLrXpeS7hE7SD56ddv7HUamjlxHNwf7KYFbCNhikPEZp0DHOH3QAaFzi1uB
	foTw==
X-Gm-Message-State: APjAAAWnMwvvqsLGocGt9hYBhmgP8JWr1kyoj8Mgeo11d0Zi1pKTYT/r
	sn/s8umLo6r7WIsBSQ1q7DVwKg==
X-Received: by 2002:a5d:68c7:: with SMTP id p7mr3066716wrw.23.1557830149565;
	Tue, 14 May 2019 03:35:49 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	h11sm13499699wrr.44.2019.05.14.03.35.48
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 03:35:49 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <aabf08dd-0c9f-63dd-1c49-f31f6c150392@redhat.com>
Date: Tue, 14 May 2019 12:35:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514100019.13263-3-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [PATCH 2/4] hw/core: Add a config switch for the
 "or-irq" device
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TmJFJjDsFLS6

On 5/14/19 12:00 PM, Thomas Huth wrote:
> The "or-irq" device is only used by certain machines. Let's add
> a proper config switch for it so that it only gets compiled when we
> really need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/arm/Kconfig        | 2 ++
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  hw/pci-host/Kconfig   | 3 ++-
>  4 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index af8cffde9c..0bb3bbe9d3 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -277,6 +277,7 @@ config RASPI
>  config STM32F205_SOC
>      bool
>      select ARM_V7M
> +    select OR_IRQ
>      select STM32F2XX_TIMER
>      select STM32F2XX_USART
>      select STM32F2XX_SYSCFG
> @@ -424,6 +425,7 @@ config ARMSSE
>      select IOTKIT_SECCTL
>      select IOTKIT_SYSCTL
>      select IOTKIT_SYSINFO
> +    select OR_IRQ
>      select TZ_MPC
>      select TZ_MSC
>      select TZ_PPC

You missed the MPS2* boards

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
> index d493a051ee..dd2c2ca812 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -17,7 +17,7 @@ common-obj-$(CONFIG_SOFTMMU) += loader.o
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

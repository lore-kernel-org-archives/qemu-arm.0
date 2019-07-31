Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5819448wrv;
        Wed, 31 Jul 2019 08:53:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwd95mt1ggeoIv283hWXx1jaHftZiRnY2rXb9zwXoS3wmZEyL53ok6IhxBGNMzjmFnN4Qia
X-Received: by 2002:a05:6402:1507:: with SMTP id f7mr107780088edw.94.1564588434085;
        Wed, 31 Jul 2019 08:53:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564588434; cv=none;
        d=google.com; s=arc-20160816;
        b=uvIeAk39Cn4BwDcx7Ooj6hLGsC3NbA9zzZTNoSD1Wk00jYThnrKYgH9UsmqbDk/i4d
         FCn20aM13X+jE0UlEhknPAkPWjSkP4ZNSqApLd/wYh9owatuibccQovTFcvM0z1RXUFy
         3Fg0gn7fw1z0hsPXZzUI8JQtOwt3Re6xrxGSVBQA/7uIbnlTEXFg0G7gm1Ob6Lme61At
         L7jvCyxTapx+U1wpOp9KdLHv7Z3O7CpWWYrNrHtrAnHXG90poOihYGMsYwZsdL+iwQLv
         SahMpIhrNWk3E/SLTydT/Q8wzeXnc51bKvUya95BngaxXZgxfjnLxBson5FXG0m/cL6D
         WP8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=yiBLy7z6HsCx9LJ7ADNULmN66hzimWLK/c6Ep7QUyZg=;
        b=iCy3uaxhaYayz6YrcrV74Is5bve9n7IotoViqTfhd1sVZs9k+e01k/Yt3tlArN0W4D
         gkT8K8nxYgFE90aTvCl4jsSCyRumzbEMgChUK5ARHmxY1df43nONQR0y+3IWN1/77mOj
         giKU1N5uPm+BednbdZR6ydN9R4OLvA1uemiqRT1y7eO381Lz11JcM3zQDCXBgzF+aBwX
         kE2X99Z4+ucFQu12qCKJemWsz0A8GNnYz0km5ZVfM+73q2955X4WIeBm0HOB4Wic2iMh
         yAn9icO54MQFmaY0jMjjUmvZbwWzj8QASkLLOd2M2zLvfQNB2jiuTuqlqNL343DEI5d1
         Cv5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si22844789eda.437.2019.07.31.08.53.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 08:53:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsqvJ-0006Cj-7y
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 11:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36651)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsquu-00068A-2U
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:53:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsqur-0002CO-CZ
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:53:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33242)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsqur-0002C0-5b
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 11:53:25 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so70352758wru.0
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 08:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yiBLy7z6HsCx9LJ7ADNULmN66hzimWLK/c6Ep7QUyZg=;
 b=N1F5slAsOBqKh1VMe1pgHPOh9gVpnQpv3AQmN7hYQrVL7MOz/YwLGIiDqRLodh9YW/
 uQUWqmCIiSAR6DJKRk611xOCEM86xSRgTDtF8QZYwmv89rve3BwkN8nHvSk/7/sixd5u
 4hIyIS50yaLI8rSjgEaounMmMLxW/eVm4JlXutzGb2zhE15yk7Qo48cY0dTS6Ht55UAB
 MzgoT3shWIbpDjn88WSqJYWOEsV+rhqZUle8obht5y1cDZ4kf18znw1bTPKPkbqkXuL/
 vj57sSzDma7vu+shD6CG/j7aP6h5gArJNqvuGL9zpo1jksCk+DYAwZRZFC0nNObCApMk
 cl3A==
X-Gm-Message-State: APjAAAWfKEX9aRpgPWE6WTj4sMES1arJ68i1CeSgyOQct/5BTTh//dfO
 Sbm5CUWoDWNcCqFaehYJx7IL5w==
X-Received: by 2002:adf:db50:: with SMTP id
 f16mr126290818wrj.214.1564588404306; 
 Wed, 31 Jul 2019 08:53:24 -0700 (PDT)
Received: from [10.201.33.84] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id b186sm50254602wmb.3.2019.07.31.08.53.22
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 08:53:23 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20190731075652.17053-1-thuth@redhat.com>
 <20190731075652.17053-7-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <f5567abe-f46b-ab32-ef2a-0b5094e70496@redhat.com>
Date: Wed, 31 Jul 2019 17:53:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190731075652.17053-7-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [PATCH v2 6/8] hw/core: Add a config switch for the
 "split-irq" device
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
X-TUID: exGR3aNhx6N9

On 7/31/19 9:56 AM, Thomas Huth wrote:
> The "split-irq" device is currently only used by machines that use
> CONFIG_ARMSSE. Let's add a proper CONFIG_SPLIT_IRQ switch for this
> so that it only gets compiled when we really need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/arm/Kconfig        | 3 +++
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 849195c3f6..6e24c73b54 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -81,6 +81,7 @@ config MUSCA
>      select ARMSSE
>      select PL011
>      select PL031
> +    select SPLIT_IRQ
>  
>  config MUSICPAL
>      bool
> @@ -364,6 +365,7 @@ config MPS2
>      select OR_IRQ
>      select PL022    # Serial port
>      select PL080    # DMA controller
> +    select SPLIT_IRQ
>  
>  config FSL_IMX7
>      bool
> @@ -442,6 +444,7 @@ config ARMSSE
>      select IOTKIT_SYSCTL
>      select IOTKIT_SYSINFO
>      select OR_IRQ
> +    select SPLIT_IRQ
>      select TZ_MPC
>      select TZ_MSC
>      select TZ_PPC
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index 984143456a..fffb3d62b2 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -15,3 +15,6 @@ config PLATFORM_BUS
>  
>  config REGISTER
>      bool
> +
> +config SPLIT_IRQ
> +    bool
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index ce337bd7c9..bb1afe422a 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -19,7 +19,7 @@ common-obj-$(CONFIG_FITLOADER) += loader-fit.o
>  common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
>  common-obj-$(CONFIG_REGISTER) += register.o
>  common-obj-$(CONFIG_OR_IRQ) += or-irq.o
> -common-obj-$(CONFIG_SOFTMMU) += split-irq.o
> +common-obj-$(CONFIG_SPLIT_IRQ) += split-irq.o
>  common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
>  common-obj-$(CONFIG_SOFTMMU) += generic-loader.o
>  common-obj-$(CONFIG_SOFTMMU) += null-machine.o
> 

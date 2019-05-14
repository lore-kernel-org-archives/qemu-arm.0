Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3845671wrg;
        Tue, 14 May 2019 03:44:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUYPy6Pv1/4jCiHBYN0bWj0FTrTFLvfHdMj0w6EN93hno4IQrxYZ/uehnT4clgAMhlSZVv
X-Received: by 2002:a17:906:7c10:: with SMTP id t16mr16063114ejo.161.1557830666365;
        Tue, 14 May 2019 03:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557830666; cv=none;
        d=google.com; s=arc-20160816;
        b=cRQeGoMBrCMTtKACMgpTrKyYRM7imW1NT0RhcLZGCWKwO55ceyMuTOB3skm1Yaxz/x
         3O49QP4LqW2dTiy0pm3O4mrhNPeJhRAxU1uIlHHVM4y0g9ZTKvbnMqNO2Lta800d6GaF
         Y6eoIOZ/Ww1Wb9+vnb9IS3Fdkfeda8/cefJCHPn5IMLSlZokxnF+EU7yYaBaK7FGHgsb
         pGwgovyXWHH7vJrecTIvW14G794tmmXwfA93xUwtDhD2yswEF8Yu54gmOJUaPfEdnbqt
         Y+ukUs8RolBgubzONw/0QpEK4id+eTcTaE3lsv8Ku79PWZl7fJ1t3nYV3cVZ1iqvhhaf
         nfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=VmJfXoC2WzST8DEgwuGF4IR2cehYCXYnXTuYbo9V1ek=;
        b=qAuXxQ4k0plh0avWyqDrCFHPyV4nzo2sYrj1Iwyuo5tXuPyrCRhWQLxHGQaVXu7oww
         4TgK59TAY+KB69y4huOwnS6tcremUX7OKwzYrWqCSRpfJzFxNLe+rcQP78GuhvlgVPxX
         M3rL8oGV4WOWGX93C4ZbhjktNtZ4MQeyuTqV7qZBNYSMKgAC6h9Y9gvd2KQB0tfEyFcz
         Ai/oYG8/8FjZuUOnENVQrAFV2wSzd8FSqWD4w45bsOj8Ut216mom1NFPrHapI8BsmvxR
         E99JnJ1s2d02ZCTNtYtBF8zOyoRvZQNpW0a36WKDJNktsoIO2upj165DP95yFqm3OAlP
         azbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id by19si887845ejb.20.2019.05.14.03.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:44:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45166 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQUv3-0007Zu-Do
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:44:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUr9-0004TV-5S
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:40:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQUih-0008TB-QG
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:31:41 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37988)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hQUih-0008OE-5v
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:31:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id v11so754453wru.5
	for <qemu-arm@nongnu.org>; Tue, 14 May 2019 03:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VmJfXoC2WzST8DEgwuGF4IR2cehYCXYnXTuYbo9V1ek=;
	b=GRJs8Aj9DV6Ui6e/9M0CQyiBV0fF+e26jJhlV6CaaOZRmhe8vdFanxfLFPt4cTRA7O
	ge5mxRV41uqMXYezmDkbmkdFX6SwjCrIiBtZV+ZB7ShB7mfUDDQ1fGL/Qg+368OuxR1t
	Vw1sMKYVVpb+n9YPvKNb9rWIs2gcIEWziOvEJXAINqWMNvf+i041YpE3m9MMDYl3HNAV
	1jkRp9b51qD5l+qeQb+psTm0/JHU/tA09tFLzFhk5OXdAo+Dl5rib8ywaw+GbHa1HT/3
	OZf2NmPL5WrdXl0/KrxQJJBo/IwCskPkA5Vhqy1vH18BkzaYin6einp8UoKtF7quQVjJ
	TtwQ==
X-Gm-Message-State: APjAAAWPKC94lmxIG+bUHIQ0c8F0NDLyqWyIlq2dnO/koKeBHevvxDRl
	WkGrDfSm3NABNALVDurQBlRgRg==
X-Received: by 2002:a05:6000:43:: with SMTP id
	k3mr21264111wrx.234.1557829894567; 
	Tue, 14 May 2019 03:31:34 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193])
	by smtp.gmail.com with ESMTPSA id o4sm2766773wmc.38.2019.05.14.03.31.33
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 03:31:33 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
References: <20190514100019.13263-1-thuth@redhat.com>
	<20190514100019.13263-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b8cd670b-7a76-6197-1949-3600a8d1dbe0@redhat.com>
Date: Tue, 14 May 2019 12:31:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514100019.13263-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH 1/4] hw/core: Add a config switch for the
 "register" device
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
X-TUID: jbA0KdacbAxp

On 5/14/19 12:00 PM, Thomas Huth wrote:
> The "register" device is only used by certain machines. Let's add
> a proper config switch for it so that it only gets compiled when we
> really need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  hw/dma/Kconfig        | 1 +
>  hw/timer/Kconfig      | 1 +
>  4 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index c2a1ae8122..d11920fcb3 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -9,3 +9,6 @@ config FITLOADER
>  
>  config PLATFORM_BUS
>      bool
> +
> +config REGISTER
> +    bool
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index a799c83815..d493a051ee 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -16,7 +16,7 @@ common-obj-$(CONFIG_SOFTMMU) += machine.o
>  common-obj-$(CONFIG_SOFTMMU) += loader.o
>  common-obj-$(CONFIG_FITLOADER) += loader-fit.o
>  common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
> -common-obj-$(CONFIG_SOFTMMU) += register.o
> +common-obj-$(CONFIG_REGISTER) += register.o
>  common-obj-$(CONFIG_SOFTMMU) += or-irq.o
>  common-obj-$(CONFIG_SOFTMMU) += split-irq.o
>  common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
> diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
> index 751dec5426..5c61b67bc0 100644
> --- a/hw/dma/Kconfig
> +++ b/hw/dma/Kconfig
> @@ -16,6 +16,7 @@ config I8257
>  
>  config ZYNQ_DEVCFG
>      bool
> +    select REGISTER
>  
>  config STP2000
>      bool
> diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
> index 51921eb63f..f575481210 100644
> --- a/hw/timer/Kconfig
> +++ b/hw/timer/Kconfig
> @@ -36,6 +36,7 @@ config TWL92230
>  
>  config XLNX_ZYNQMP
>      bool
> +    select REGISTER
>  
>  config ALTERA_TIMER
>      bool
> 

Annoying, this clashes with "hw/microblaze: Kconfig cleanup" which is
already queued by Paolo:
https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg04669.html

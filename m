Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5560419wrv;
        Wed, 31 Jul 2019 04:45:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdE7sdnJ0eysV9ctc+b8OiDB7nk2PIv8KBevoTjKu0z5qZCoocgBWVZWxww219fPFbKPim
X-Received: by 2002:a17:906:6888:: with SMTP id n8mr93102580ejr.134.1564573512852;
        Wed, 31 Jul 2019 04:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564573512; cv=none;
        d=google.com; s=arc-20160816;
        b=qRO9uC7fyG35GpYrO/Ve565ooI/jDPg2Po3oYvyUY6a73OIrZYGSA6KUcGygtNc0EO
         0PB0nHH7cNwi1ukFxQdUoB/oqAPoiUKHGY522gM2kBwKrEZHKF1CHeFuS3aP/xELIFNh
         RqYOGs6RThpD6pGkjp+/1Z8HM3za4jYgYIkxg0XekvC45UJ6Nayl++YlKK19yoBWbtH1
         mzG6cTRDEimux9T9fcThh9M8cUJyso7REhMm3S7V4M2fFhWp/QYnsTmTRzgCozwHcHHh
         xG0J3cfeG/hIAVHGfHuhhTwv0wiZXxm11lRZg54T+ezjzVBVOJSeCHhbGxuyWeA/uqPp
         WOlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=BZCaA4BNdzs6Zemush7cWGpSj7+umpxQOt0vBi6zJ7s=;
        b=SjcCzXWk7nXZsT3FtZI88DaYD9+MrE5ZWuJzQNVF8PQO4nmsl9DzBZmRsD/y2qh0Ta
         ca6p5NZByiuAULIGCpqoEEu4nK3Dh0rl60/kbj8Jyc8MZRVP0woMo4h0GvfC2zxZ2Or4
         tHD0MJoDOy3xCa07Ck8CBq8d5QzQxq+i1fGKwuQxBK9BoBf8YL/t1ECXXtivlpP+4X7z
         yO+9IdEjQo6fQ2SE2paFcdWq8nKTfthU29wEGVsZpf6HYl6BgXSrBlv4qMAIOiQR+FUD
         FqTz18RwyMwZKhIl9p40IxcPP9QblYSYZxoUuXoZnbkm/+lHeQkRpxBiMeLaKRGtWNYA
         iOtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si18334587ejx.323.2019.07.31.04.45.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 04:45:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsn2e-00089f-03
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 07:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48841)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hsn2W-00084N-KB
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hsn2V-0006kr-J8
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:45:04 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54227)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hsn2V-0006jJ-Do
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 07:45:03 -0400
Received: by mail-wm1-f68.google.com with SMTP id x15so60503760wmj.3
 for <qemu-arm@nongnu.org>; Wed, 31 Jul 2019 04:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BZCaA4BNdzs6Zemush7cWGpSj7+umpxQOt0vBi6zJ7s=;
 b=aTKQNqUii29+HlUJshGAIUz3D8Yt+CeFnqfiVtuEQeAT4QcpEXMjkn/1rWExX4rbdb
 3y5Awh9UCkYtvqLJM4HNG7hcE5D7niU5ih9VrzBoZpMrBUgDylYhCMnA061zl/90hPvs
 F8uM12EGP5XkKTbVJfKYp75sg7+MgVDrHyq6Wfx3H4nrtRju1lEQ/reFb2TRYN1vjUNM
 ij0uWHa1RChUunwm8ZU8ngd33QiGswKcevlT8FlU0FOa/Qt/cYynAn1Mg5tL3WKTyucb
 Tnr01a9FuPf47PCspp4gzTZiYWpDzfKvoQn+am9cTpMA6QxiiGv89apVA1FX3t3riMnH
 KwIw==
X-Gm-Message-State: APjAAAV9M5nHyxehX/NPtgVip7P6pGIpNgULRN9TYRdyjZ88Rm2GDtw5
 0ddCcYaTV/V6kgtB66BkicnNuw==
X-Received: by 2002:a7b:cf0b:: with SMTP id
 l11mr116705487wmg.143.1564573502176; 
 Wed, 31 Jul 2019 04:45:02 -0700 (PDT)
Received: from [192.168.43.238] (44.red-95-127-154.staticip.rima-tde.net.
 [95.127.154.44])
 by smtp.gmail.com with ESMTPSA id t140sm2457250wmt.0.2019.07.31.04.45.00
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 04:45:01 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20190731075652.17053-1-thuth@redhat.com>
 <20190731075652.17053-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <b3696656-201d-9777-0b73-b6903949d61f@redhat.com>
Date: Wed, 31 Jul 2019 13:44:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190731075652.17053-5-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [PATCH v2 4/8] hw/core: Add a config switch for the
 "register" device
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gYbsciE9fC3/

On 7/31/19 9:56 AM, Thomas Huth wrote:
> The "register" device is only used by certain machines. Let's add
> a proper config switch for it so that it only gets compiled when we
> really need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/Kconfig            | 1 +
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  hw/dma/Kconfig        | 1 +
>  4 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/Kconfig b/hw/Kconfig
> index dbae1c0852..b45db3c813 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -76,3 +76,4 @@ config XILINX_AXI
>  
>  config XLNX_ZYNQMP
>      bool
> +    select REGISTER
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

What about naming it REGISTER_ARRAY or REGISTER_BLOCK?

The API is:

    RegisterInfoArray *register_init_block32(...);

Cc'ing Alistair for better name ideas :)

> +    bool
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index f8481d959f..d6cfb2a81b 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -17,7 +17,7 @@ common-obj-$(CONFIG_SOFTMMU) += machine.o
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
> 

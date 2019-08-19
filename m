Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2553585wrs;
        Mon, 19 Aug 2019 04:54:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIQSBXH94SLwdewadHGkCFizIadz0cS9yacX3ei2SC3wgVL/LZsmETOxMBPRKn+2PzYa1i
X-Received: by 2002:a37:6243:: with SMTP id w64mr19553510qkb.444.1566215679629;
        Mon, 19 Aug 2019 04:54:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566215679; cv=none;
        d=google.com; s=arc-20160816;
        b=AxHbk2xFC/EAjBO8tSMFIA2+QKlkVMi/Z8+tPOEm6r9Lcd4UMDfYG+J/acqFNUKb43
         iHDPjF6g1t18d4SbuZHu5uJWqjMBNqoZrvdwMnXOXgdOFQa7+a835ef6GTCO2UlLqBsu
         t0H13TAuhx52l3tBcW2CtKnKM2tt/nWpGXQ6F8WaFu6IOMbrxjisawnSSE321xxpT+0i
         /wGaAy/+YQw+S4v9ufjzd8NxYMAHxF7LKu0SLZ0P1sOyO6YP1D7xA485IrY5E+xQ4UHT
         xIARcl4dcOY5cNXRuXYOV8o8PBlOgrIYwLBi3n8TBJ/jMOuwGIr0luPLKXg0neCbKr6n
         LCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4Fhv+v6uk3/5mUJ5XXbkTiONoRyv9tVQJBiWekwONvo=;
        b=MC90CAwkQH2PolxZXDRexpWsdIZEB2vxpylA5FWvrGAL/kGfZo+jTufc5K+H1NGo9q
         gnyEvsuXWEK5ewPndLNVdbnu+AXjbzHv+vMtcZyi9rjaQpI4TgAERghtTgZ/x1+b+EhW
         z9wC45yxHpmI4bZ+20kvpMBQkZLbwQHcVN7Q9R++oXp2Ss8Nla3LmG9d2TtYrPW55vDI
         +64LIfyy4nI77bV1qHlg6GCaAaEilFvb7CWiZiUOEDI/acu9O78GYguXbSauT5Rh6vkI
         dTwGcwJueY62LoEbUspVmXtmXA94mKRcDHIB9Y30yvIHT8l6GPgACz6w0xvKbOEyMgeN
         6eHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 22si9320574qvr.63.2019.08.19.04.54.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 04:54:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzgFD-0005av-0m
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 07:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hzgF4-0005ai-Dz
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 07:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hzgF3-0002q0-6f
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 07:54:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52704)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hzgF2-0002pZ-VP
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 07:54:29 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE54EC059758
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 11:54:27 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id k14so5146646wrv.2
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 04:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yT9pnnsNKM3WWnqQ1PySWCBSbslqsS2LkflPYolqajU=;
 b=DPIaZ5BOVP7MLzcDkGj8D9uaQ+zCx41jMFtwFF+ZlO5cnescqNXrEGqk9W5J3LuUhP
 cB3lLXcAG+P4YHdnL3ywpWVA6IeLCtvib8/+s5Di4pttGiOC05krySOXPUWSpPjaAOMX
 MGExxCzT8OWAhLmCsRJaQsjBf3QyZOz1OBHt5Lbypk85Q/kSLhmSuonsQ2THsbszwZ0p
 vhLtwG59lqw+XrOMmmZBMNCMweed3Jyw6y/VjJUfzIlwOhxHWqnSezQBR7NOgf3aH9Yq
 w+Ik6dvbA3HDxEoJqCe1YKCjJ02Lzzx8i+c+/5H7jD9SKVtWjWwLA3cvwdeKAJomSUL8
 5PXA==
X-Gm-Message-State: APjAAAW0aFD2SVy5b+k89rr/ucOyHZG4Ie+ET4TSu612nl0QkqqBPNKa
 6CttYJGvuInUSr6ZHub/QmN+LUrbmZVtBRvg2vwTEm0Chw46o88ZveKS02afyh+yFTlnSazso03
 kSrnqw/KyR3/G
X-Received: by 2002:adf:f404:: with SMTP id g4mr26159866wro.290.1566215666660; 
 Mon, 19 Aug 2019 04:54:26 -0700 (PDT)
X-Received: by 2002:adf:f404:: with SMTP id g4mr26159850wro.290.1566215666501; 
 Mon, 19 Aug 2019 04:54:26 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id u129sm17140742wmb.12.2019.08.19.04.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2019 04:54:25 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20190817101931.28386-1-thuth@redhat.com>
 <20190817101931.28386-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4b760d05-7d18-f7b8-cf2f-d7ed855baf7c@redhat.com>
Date: Mon, 19 Aug 2019 13:54:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190817101931.28386-5-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 4/8] hw/core: Add a config switch for the
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
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jqeTxk6coRnx

On 8/17/19 12:19 PM, Thomas Huth wrote:
> The "register" device is only used by certain machines. Let's add
> a proper config switch for it so that it only gets compiled when we
> really need it.
>=20
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/Kconfig            | 1 +
>  hw/core/Kconfig       | 3 +++
>  hw/core/Makefile.objs | 2 +-
>  hw/dma/Kconfig        | 1 +
>  4 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/Kconfig b/hw/Kconfig
> index dbae1c0852..b45db3c813 100644
> --- a/hw/Kconfig
> +++ b/hw/Kconfig
> @@ -76,3 +76,4 @@ config XILINX_AXI
> =20
>  config XLNX_ZYNQMP
>      bool
> +    select REGISTER

I still find REGISTER confusing, and prefer Alistair's suggestion:
REGISTER_API.

Since this patch is valid:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> index c2a1ae8122..d11920fcb3 100644
> --- a/hw/core/Kconfig
> +++ b/hw/core/Kconfig
> @@ -9,3 +9,6 @@ config FITLOADER
> =20
>  config PLATFORM_BUS
>      bool
> +
> +config REGISTER
> +    bool
> diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
> index f8481d959f..d6cfb2a81b 100644
> --- a/hw/core/Makefile.objs
> +++ b/hw/core/Makefile.objs
> @@ -17,7 +17,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D machine.o
>  common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
>  common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
>  common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
> -common-obj-$(CONFIG_SOFTMMU) +=3D register.o
> +common-obj-$(CONFIG_REGISTER) +=3D register.o
>  common-obj-$(CONFIG_SOFTMMU) +=3D or-irq.o
>  common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
>  common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
> diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
> index 751dec5426..5c61b67bc0 100644
> --- a/hw/dma/Kconfig
> +++ b/hw/dma/Kconfig
> @@ -16,6 +16,7 @@ config I8257
> =20
>  config ZYNQ_DEVCFG
>      bool
> +    select REGISTER
> =20
>  config STP2000
>      bool
>=20

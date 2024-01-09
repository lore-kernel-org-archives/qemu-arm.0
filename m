Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp554945ejs;
        Tue, 9 Jan 2024 10:13:25 -0800 (PST)
X-Received: by 2002:a1c:4c08:0:b0:40e:4905:3fb with SMTP id z8-20020a1c4c08000000b0040e490503fbmr1618823wmf.32.1704824005382;
        Tue, 09 Jan 2024 10:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704824005; cv=none;
        d=google.com; s=arc-20160816;
        b=ugW92uM3+WkVByvdoapTDFdADoY8Eq8HhokIjD2/Qpwz6OpjZl+Q1M24NTKoUedo4X
         N10iHlQtH+91H6tv+vvc5XnHula/m+By5FSy738bAGkFkIyuiZ6+cR7NNjG2cq0+Blns
         yx2eE97TxnNss0XwEIWiNKSLNZkuTw2LIxuUv5DEWVI8SC7OBUsKjRtOD7holxl0lLZI
         +NMcDJFBP/i9UnSh/rQ5MdJQ3sHmc/ATN+Fx96I1u0AkSAY3jmPF/K+Ea49vjFOqh5EP
         qnpqBq7LH708w6DZCNXkFjgik8cVLftPVGU/xO2ztgxMY6jlzMfPsDs/C3XIZ7v2T/7E
         CIYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5/858XesEX8oNeaCZG/kMKhZLCv5GHmvQ3J4ODyOadM=;
        fh=tIPtNlFzeHxgf2SHuPpxDfNXaZCwv2ZxIDfoid7y1B4=;
        b=jG9ztWY5loG2Sz9CI5dxKUCCaNk+SMpmXQVaIKfMqKZIBrTmOpa7Y8elx61Ezoc1q5
         ALyvJBDyRfZedCn7fq81PDqPxSU9McAImFbmjtzyktUGDuhy8agz3x5c1xn2mQJcJ/Qg
         wFPo7BUBJn4s3UZ+3ZKDOfKlZFXI/Gw9CFdNdGNNMQo5pCVQidfbmYRJWvO1qPc1o/44
         0yX/DidfjregYk2phFL226TP8eON4gc4FITxPeDe/6zXijmwoG0g2dILA8Ccy1pkSRnm
         UdYjhfOSoa37nYL6UQgRtNy800D240XUWDS1QVUgrKgs1v7UWfJBGMlHt78cB4XqaILy
         e4sA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRIyxXhW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u30-20020a05600c4d1e00b0040d90c913b4sor1051399wmp.11.2024.01.09.10.13.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:13:25 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TRIyxXhW;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704824005; x=1705428805; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5/858XesEX8oNeaCZG/kMKhZLCv5GHmvQ3J4ODyOadM=;
        b=TRIyxXhWxJbSVDW0hgtJvJQlK28U5xr16eKz9UGemH7zxKphpKKBTSCLuxq3PQb349
         3rOmhFk7Uf3Y4GB8q0mt+M7f6WTdgD77T4SqNH6xQQaArZ90bl6T52YTxaF+S+vZBeoC
         zlxTao08RRYqCWnn9mZKvFj3j9blThLVL4UIJsCavqhr9LpcYYICl+rzpxidtIJ+o0dy
         PWqcUPgynQXcSNO8JIfjnv6xefJlaTVYtpTY/cN1ldRLgyvrTfMbVxmEnGIgdr0YOXdd
         Ihrd2+xWShkUkER3lc+JzwROE2QtTuZsD3uXjyqNHvqUpBNdp2E+uGlkMYzxoAVknunI
         iIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704824005; x=1705428805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/858XesEX8oNeaCZG/kMKhZLCv5GHmvQ3J4ODyOadM=;
        b=BqeDawHD8KYZUvV+RukK+6JqKkzC9tuJZ4VJjyTnKCnsI00YsVHONePZNRn4ehrWMM
         +5b/vOlU04YdCVXMdWqIv6TfZEfkpHLt9xvKySn1UumkI9LxwdkV6dZht+2lt0DVMl8S
         FMde9qO7HykkhCF9vAkt5PmsWAd56Hu/ChDeUkvIrg9Q2RjMvULWndz7sNBrtaw5NzjA
         Wx5AIh8H5lLRDN32bF0ucY+kngjvEymhdxRo3GASPXLd2l//Zeb1xghv8GLiyL0t3/yU
         71H0UamhuLLGcQTxM720jocm9Z/yL5YtJWEFh05aOxFE2ko/2shq4u58+WohFkevjPkH
         oeug==
X-Gm-Message-State: AOJu0Yx1qHfM5zedg9HLjot5lJPfpO1gUKtm3TMoG7nTBVnGIzmmq086
	RO4tlQ9EjjECPEGuKK40V3R7X22BDqNTGUVs
X-Google-Smtp-Source: AGHT+IGGLSiLqo35JZYqB7Fm4mO4NgbXxAnLphPDLsnl8mWyvKIgsiS30GuPBQ6YFSlnW00RpWev/A==
X-Received: by 2002:a05:600c:4ecc:b0:40e:49b9:98e8 with SMTP id g12-20020a05600c4ecc00b0040e49b998e8mr1418871wmq.89.1704824004991;
        Tue, 09 Jan 2024 10:13:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d420a000000b0033719111458sm2987751wrq.36.2024.01.09.10.13.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 10:13:24 -0800 (PST)
Message-ID: <2fccc023-c10d-4d66-8f3a-9e119dd29ffe@linaro.org>
Date: Tue, 9 Jan 2024 19:13:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/14] hw/arm: Prefer arm_feature(EL3) over
 object_property_find(has_el3)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
 <20240109180930.90793-10-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240109180930.90793-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: N65zv+46ev0w

On 9/1/24 19:09, Philippe Mathieu-Daudé wrote:
> The "has_el3" property is added to ARMCPU when the
> ARM_FEATURE_EL3 feature is available. Rather than
> checking whether the QOM property is present, directly
> check the feature.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/exynos4210.c   |  4 ++--
>   hw/arm/integratorcp.c |  5 ++---
>   hw/arm/realview.c     |  2 +-
>   hw/arm/versatilepb.c  |  5 ++---
>   hw/arm/xilinx_zynq.c  |  2 +-
>   hw/cpu/a15mpcore.c    | 11 +++++++----
>   hw/cpu/a9mpcore.c     |  6 +++---
>   7 files changed, 18 insertions(+), 17 deletions(-)


> diff --git a/hw/cpu/a9mpcore.c b/hw/cpu/a9mpcore.c
> index d03f57e579..9355e8443b 100644
> --- a/hw/cpu/a9mpcore.c
> +++ b/hw/cpu/a9mpcore.c
> @@ -52,7 +52,6 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
>       SysBusDevice *scubusdev, *gicbusdev, *gtimerbusdev, *mptimerbusdev,
>                    *wdtbusdev;
>       int i;
> -    bool has_el3;
>       CPUState *cpu0;
>       Object *cpuobj;
>   
> @@ -81,9 +80,10 @@ static void a9mp_priv_realize(DeviceState *dev, Error **errp)
>       /* Make the GIC's TZ support match the CPUs. We assume that
>        * either all the CPUs have TZ, or none do.
>        */
> -    has_el3 = object_property_find(cpuobj, "has_el3") &&
> +    if (arm_feature(cpu_env(cpu0), ARM_FEATURE_EL3)) {
>           object_property_get_bool(cpuobj, "has_el3", &error_abort);

Oops, something is wrong here...

> -    qdev_prop_set_bit(gicdev, "has-security-extensions", has_el3);
> +        qdev_prop_set_bit(gicdev, "has-security-extensions", true);
> +    }
>   
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
>           return;

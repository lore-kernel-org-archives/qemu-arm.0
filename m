Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp970648njm;
        Wed, 5 Mar 2025 09:40:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXM+YXN4SwznApVWzUXxAu5dzncVK1IAw6xqRQy42WjI5+om4LeJHgzwJE13TkOWGeD+RrWi3hqsHSV8w==@linaro.org
X-Google-Smtp-Source: AGHT+IHGJYLNU23znfz5V76g2bGHwmCXYoNAmwL4CMl6W128f0oiN2VvDbUHJxOULVe31gh5cD0E
X-Received: by 2002:a05:6902:705:b0:e5d:d9e4:532e with SMTP id 3f1490d57ef6-e611e1b87f9mr4545984276.24.1741196407521;
        Wed, 05 Mar 2025 09:40:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741196407; cv=none;
        d=google.com; s=arc-20240605;
        b=iiUdahBUavajnICdzsY9cPFO/yUb07v0wxVfCP6wEC840ntE223wPkhgUWMHlLlD4V
         p0ZSSEFbi7YZB9np5n5WX38TV7wYnoTirch47f54juF3MAFhp9HP2PeI/h8DjX2202+u
         UMtko1XOkKW1ryQUuFig7DiWrAsb6gIdY2omeAiiFA7gx5vGEkFRXNG6aQiIM8OEy5p+
         oF27Ip/OyrKi8NxqdMFoBqE7AMqms6UhZS/i5XyUZJ/aIEC5HYvmDVK8i732ZFUSdijo
         3WW0kq1DCRvV1Y5t6rMRaQQ1u4SzkLVzCU63Uga5xwu6eUnbY9M1qpep4lNfz8AOzF6O
         lfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=sCOzi0wXsAtvsUqY3ZLmyoS2Rh+ikV6GVuS1+H9G6wM=;
        fh=RT/PgtVLfFiYaC2J+JeYPgrvba8+1a/tBw6+fxGxwiU=;
        b=LyiQxsLYYkyCWA4FuALJt8kg71ilRhr9Tg9a5glfnqff/qqRvzngBX73wwTnfL9JTx
         ExCE+5Ku3SSjddtR2pPv23E+1Kuu8168Md43ryjfOeEr6X1dPysUi1QLegCxsAyfkEy2
         KztpLIMU+7MMa1wNlxHK5JCCgHsw86fuTcZY2DxhxgjjSTHm2j3w7V1YrmEvrNNcvJH2
         jpyOASo2GssZu1gGtDeaJl9F4qWG/npfBAa4ZzVo288iEgedHrYhfRRwNxlgy6xdYo4F
         QYdtJjjRJjOWbsCuBTTOOWB2IWv6D7K2C9/P5PVuBm1LaRxUE2x09vCHTnSxE8ojFuSX
         mr3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=feXKgds9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e60a3a1f13fsi11882950276.30.2025.03.05.09.40.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 09:40:07 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=feXKgds9;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741196407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sCOzi0wXsAtvsUqY3ZLmyoS2Rh+ikV6GVuS1+H9G6wM=;
	b=feXKgds9F1GzKsp2jKxUdWbwIXVrQ/azjY+TCCqGYyfZmuLhq0QCDx+jfZGiLlkPyA2Ah6
	kspZ8Yt4ISB/ADuPnlaKB3fCtn74qpNhCRuEJM+JSzSNGJFMZtJhBqjwf0FqKc0kniIszQ
	tcVbdL271G4xaYhg0fP+59jwdCmXmT4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-RgjWsB8wNTmqwuTDaWWyOQ-1; Wed, 05 Mar 2025 12:40:05 -0500
X-MC-Unique: RgjWsB8wNTmqwuTDaWWyOQ-1
X-Mimecast-MFC-AGG-ID: RgjWsB8wNTmqwuTDaWWyOQ_1741196404
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43bcc04d2ebso16549885e9.1
        for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 09:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741196404; x=1741801204;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCOzi0wXsAtvsUqY3ZLmyoS2Rh+ikV6GVuS1+H9G6wM=;
        b=o2f34P9lbfeUSQpxJIbxw42nRUrbGwIdRvOtA7VNEYgfBlqDu/u60zSeUubMmyDrny
         mwPbwTgRv/WbuMzt6it1Vj6CLZU0gAn/w8CPgdnRvgbt6iauDLppNFZInxg5CYAdRzuo
         UQbTud+4g4NXRwPWoNFS5Nl+f9UePOYxJG8sT00WlLkjitHTbRdT5ti5LBOaIXWxIye4
         /MDZjGhug7nwiwGf+7sRnMCQVvF1WLoLs9X65lXSY7pKYzAgXIFpcTZXcgduTOM7jw+l
         f4jSzUXinZr+APEmwxLf6KoukwwI/GFCi0P7JxCecuwE0lGOwkVQI/11GAB37Fvw9chb
         Zlow==
X-Forwarded-Encrypted: i=1; AJvYcCXDibAD/WnwzRILX5DAVNdMm856dwOmu4A40aWBa93ZIsHFUFvBuPsVRS2mcd5B9FA8W74cr5y+/Ld/uA==@linaro.org
X-Gm-Message-State: AOJu0YzPJc+akEkw02mDaK8KnQKaQhJ19PP+3F06OlnZmorU2PajOCsC
	wYi56mbkfZmH2temC0/OUTJPJBStX98XmZkn4iTJHAJuXCWBCjMuJID8p6CPcXoyfzwc7mKeO9b
	Wrqlnl0P1j51d1PPalWGrsAVj7mWPxHAZoH3hKumVbApQXUifFXzRAQ==
X-Gm-Gg: ASbGnctMxNf6b1pDVyvZny7S0V3Snr+/hyek/Ygy2UzB63xVkxiLSdGvBrY+SoN9Vs3
	FEoofxpQQSA8Glm7Ict7Dsc0c5sAKoxsn3MtTDwVO9qP5RszxGdu45eTfrb39PAj6ZsSSgNiyER
	yKeBo/qg1mK1TJH/cFdznM/F1XQdA4AzoOFVYtUWFPr2FmQljtdWYRvYJynpgXSRavaz7GELTq4
	wuF5EtLEq82LOCnll7q+fZaVZLdB0UXtIVqQQjgepPeC5RQYClyg5qVHYQwlQW9yfAzz69WKRQD
	On+nv4Gd77m0Q3DAqshk2PALCIrGXjzVGdZrqDHtnxxbUb0=
X-Received: by 2002:a05:600c:354c:b0:43b:b67f:6802 with SMTP id 5b1f17b1804b1-43bd289edcbmr37089345e9.0.1741196404373;
        Wed, 05 Mar 2025 09:40:04 -0800 (PST)
X-Received: by 2002:a05:600c:354c:b0:43b:b67f:6802 with SMTP id 5b1f17b1804b1-43bd289edcbmr37088945e9.0.1741196403940;
        Wed, 05 Mar 2025 09:40:03 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e484451fsm22079426f8f.63.2025.03.05.09.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 09:40:03 -0800 (PST)
Message-ID: <91882e5b-bd0f-4f84-9c03-c40b5e3d3e3f@redhat.com>
Date: Wed, 5 Mar 2025 18:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] hw/arm/raspi: Replace TARGET_AARCH64 by
 legacy_binary_is_64bit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250305161248.54901-3-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1SfBeN4X4PWzM_DpwIN2miypagZegJXaBmfrspwyQZk_1741196404
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 29CFWaDAqcLO

On 05/03/2025 17.12, Philippe Mathieu-Daudé wrote:
> For legacy ARM binaries, legacy_binary_is_64bit() is
> equivalent of the compile time TARGET_AARCH64 definition.
> 
> Use it as TypeInfo::registerable() callback to dynamically
> add Aarch64 specific types in qemu-system-aarch64 binary,
> removing the need of TARGET_AARCH64 #ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/bcm2836.c | 6 ++----
>   hw/arm/raspi.c   | 7 +++----
>   2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 95e16806fa1..88a32e5fc20 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -12,6 +12,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> +#include "qemu/legacy_binary_info.h"
>   #include "hw/arm/bcm2836.h"
>   #include "hw/arm/raspi_platform.h"
>   #include "hw/sysbus.h"
> @@ -195,7 +196,6 @@ static void bcm2836_class_init(ObjectClass *oc, void *data)
>       dc->realize = bcm2836_realize;
>   };
>   
> -#ifdef TARGET_AARCH64
>   static void bcm2837_class_init(ObjectClass *oc, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -208,7 +208,6 @@ static void bcm2837_class_init(ObjectClass *oc, void *data)
>       bc->clusterid = 0x0;
>       dc->realize = bcm2836_realize;
>   };
> -#endif
>   
>   static const TypeInfo bcm283x_types[] = {
>       {
> @@ -219,12 +218,11 @@ static const TypeInfo bcm283x_types[] = {
>           .name           = TYPE_BCM2836,
>           .parent         = TYPE_BCM283X,
>           .class_init     = bcm2836_class_init,
> -#ifdef TARGET_AARCH64
>       }, {
>           .name           = TYPE_BCM2837,
>           .parent         = TYPE_BCM283X,
> +        .registerable   = legacy_binary_is_64bit,
>           .class_init     = bcm2837_class_init,
> -#endif
>       }, {
>           .name           = TYPE_BCM283X,
>           .parent         = TYPE_BCM283X_BASE,
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index dce35ca11aa..f7e647a9cbf 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -15,6 +15,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/units.h"
>   #include "qemu/cutils.h"
> +#include "qemu/legacy_binary_info.h"
>   #include "qapi/error.h"
>   #include "hw/arm/boot.h"
>   #include "hw/arm/bcm2836.h"
> @@ -367,7 +368,6 @@ static void raspi2b_machine_class_init(ObjectClass *oc, void *data)
>       raspi_machine_class_init(mc, rmc->board_rev);
>   };
>   
> -#ifdef TARGET_AARCH64
>   static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -387,7 +387,6 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
>       rmc->board_rev = 0xa02082;
>       raspi_machine_class_init(mc, rmc->board_rev);
>   };
> -#endif /* TARGET_AARCH64 */
>   
>   static const TypeInfo raspi_machine_types[] = {
>       {
> @@ -402,16 +401,16 @@ static const TypeInfo raspi_machine_types[] = {
>           .name           = MACHINE_TYPE_NAME("raspi2b"),
>           .parent         = TYPE_RASPI_MACHINE,
>           .class_init     = raspi2b_machine_class_init,
> -#ifdef TARGET_AARCH64
>       }, {
>           .name           = MACHINE_TYPE_NAME("raspi3ap"),
>           .parent         = TYPE_RASPI_MACHINE,
> +        .registerable   = legacy_binary_is_64bit,
>           .class_init     = raspi3ap_machine_class_init,
>       }, {
>           .name           = MACHINE_TYPE_NAME("raspi3b"),
>           .parent         = TYPE_RASPI_MACHINE,
> +        .registerable   = legacy_binary_is_64bit,
>           .class_init     = raspi3b_machine_class_init,
> -#endif
>       }, {
>           .name           = TYPE_RASPI_MACHINE,
>           .parent         = TYPE_RASPI_BASE_MACHINE,

Uh, this (together with patch 1) looks very cumbersome. Why don't you simply 
split the array into two, one for 32-bit and one for 64-bit, and then use a 
simply "if (legacy_binary_is_64bit())" in the type_init function instead?

  Thomas

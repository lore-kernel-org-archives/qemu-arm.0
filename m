Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp925610njm;
        Wed, 5 Mar 2025 08:33:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXICMD++BvfEHRjeTU6yAvEoFfkJAZcjvREbjSzugd2reurmnYYLAh7RkSDp41I6fvh7SZHkMcPQ66gWA==@linaro.org
X-Google-Smtp-Source: AGHT+IFkTNqU9gITnHqTbKmpObAX9YXcHC7+p6BF/4p5TdEh3ZIqaW0IbQZgvHqEidpjDUkYl4a9
X-Received: by 2002:a17:902:e891:b0:223:47e4:d288 with SMTP id d9443c01a7336-223f1d83ce1mr60253675ad.47.1741192424075;
        Wed, 05 Mar 2025 08:33:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741192424; cv=none;
        d=google.com; s=arc-20240605;
        b=EMekadYMp0r07EjJPr51E3pJHsiSEX+7d4gnaLfAWNGnF2Waug5tlibTFc7Xf4VNTa
         FB7xZPd6SMWV1P3lci11R4l+dViVy/HyKsGDDydeMLCMhwGYDiAcg4PY/ItZTnkVyTt2
         9hMm6jHlFPZINc+WwN1wIGcPhaXa/vDg693zFp4Manrj9CoXFAg3308h/p2fheB62JZs
         NU8lFu8jZ4ETNRUfZXm6S9EaoC1AlFA3l2UADLzmdgfGDGTTqRJS1Owf86lapHeAdBHZ
         bZ8PtRr+zb3XjmTl76jfINAjdeqGREuQs3UuXy8JQhbjyRZIkTPpgWsGBZijaEI2dJKN
         2w6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id;
        bh=lG2TMQ5QqfLrEnrErzudrl+Ldm/yiRAji0sSMhwjurk=;
        fh=Ei+dB/FSw6kQFQLPCU3FS+kHKcnwcvGO4V6h2OewquI=;
        b=IZyC/EIokkhdyX7KtHX4a0SsuHcyzUXI3fgTnFUlJ0ugu2BMOHz1aIoBpOA5WQjHnd
         sCr8V9WclpSQ+T82d8XH39VPyy6q+6lGx/jcouhcWc3rRM6wUp2vVZKghlRUK72dhfpe
         8IBDGdRMkDlTYGVOydVJb8QK/PI16w3J8LgRaSmjbQViynomaWHO4FMBhlWQXvKaxMMU
         LieeV2fQTW4D2c4rOukDCkOQ8nlbiiqT4QCTl0kEpf9GnGwdCV74V3JeIwHlDUPK0Cxg
         zEjh62vlBMB19rOmipU/VbvscbvvJA1QkcVfk3Nq6ydz7cWQnzIGWFHibSrhpL5WErdG
         95Ig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=hznt=vy=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=HzNt=VY=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=HzNt=VY=kaod.org=clg@ozlabs.org>
Received: from mail.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id d9443c01a7336-223502abd29si239120485ad.312.2025.03.05.08.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:33:43 -0800 (PST)
Received-SPF: pass (google.com: domain of srs0=hznt=vy=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=hznt=vy=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=HzNt=VY=kaod.org=clg@ozlabs.org"
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Z7J5c5Tlrz4wyh;
	Thu,  6 Mar 2025 03:33:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z7J5S51mMz4wcy;
	Thu,  6 Mar 2025 03:33:31 +1100 (AEDT)
Message-ID: <3eef4f0d-b931-473d-8e69-4b8c46b6485a@kaod.org>
Date: Wed, 5 Mar 2025 17:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] hw/arm/aspeed: Replace TARGET_AARCH64 by
 legacy_binary_is_64bit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-4-philmd@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Autocrypt: addr=clg@kaod.org; keydata=
 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
In-Reply-To: <20250305161248.54901-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: x9vcPSjzgjl+

On 3/5/25 17:12, Philippe Mathieu-Daudé wrote:
> For legacy ARM binaries, legacy_binary_is_64bit() is
> equivalent of the compile time TARGET_AARCH64 definition.
> 
> Use it as TypeInfo::registerable() callback to dynamically
> add Aarch64 specific types in qemu-system-aarch64 binary,
> removing the need of TARGET_AARCH64 #ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/aspeed.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 98bf071139b..3f18a4501e0 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -28,6 +28,7 @@
>   #include "hw/loader.h"
>   #include "qemu/error-report.h"
>   #include "qemu/units.h"
> +#include "qemu/legacy_binary_info.h"
>   #include "hw/qdev-clock.h"
>   #include "system/system.h"
>   
> @@ -179,11 +180,9 @@ struct AspeedMachineState {
>   #define AST2600_EVB_HW_STRAP1 0x000000C0
>   #define AST2600_EVB_HW_STRAP2 0x00000003
>   
> -#ifdef TARGET_AARCH64
>   /* AST2700 evb hardware value */
>   #define AST2700_EVB_HW_STRAP1 0x000000C0
>   #define AST2700_EVB_HW_STRAP2 0x00000003
> -#endif
>   
>   /* Rainier hardware value: (QEMU prototype) */
>   #define RAINIER_BMC_HW_STRAP1 (0x00422016 | SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC)
> @@ -1661,7 +1660,6 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
>       aspeed_machine_class_init_cpus_defaults(mc);
>   }
>   
> -#ifdef TARGET_AARCH64
>   static void ast2700_evb_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = bmc->soc;
> @@ -1690,7 +1688,6 @@ static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
>       mc->default_ram_size = 1 * GiB;
>       aspeed_machine_class_init_cpus_defaults(mc);
>   }
> -#endif
>   
>   static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
>                                                        void *data)
> @@ -1813,12 +1810,11 @@ static const TypeInfo aspeed_machine_types[] = {
>           .name           = MACHINE_TYPE_NAME("ast1030-evb"),
>           .parent         = TYPE_ASPEED_MACHINE,
>           .class_init     = aspeed_minibmc_machine_ast1030_evb_class_init,
> -#ifdef TARGET_AARCH64
>       }, {
>           .name          = MACHINE_TYPE_NAME("ast2700-evb"),
>           .parent        = TYPE_ASPEED_MACHINE,
> +        .registerable   = legacy_binary_is_64bit,

where is this routine implemented ?

Thanks,

C.


>           .class_init    = aspeed_machine_ast2700_evb_class_init,
> -#endif
>       }, {
>           .name          = TYPE_ASPEED_MACHINE,
>           .parent        = TYPE_MACHINE,

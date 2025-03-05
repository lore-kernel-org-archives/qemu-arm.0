Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp972585njm;
        Wed, 5 Mar 2025 09:43:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXc9D1OMo1U18yZeUSiuPJoLz+7YGytbtkEByOnQRgp9l9QBsI6/Thi+JNXYZo95l927A4IAqOI+C8Z/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IG9MlFJF9/8oF2WFCF3DW9PvBl6wNyQDh/uQsYXv1VwUs8T1FHCmEYKpBrHUZjGSL47GB0v
X-Received: by 2002:a05:690c:3589:b0:6f7:5a46:fe5f with SMTP id 00721157ae682-6fda30379a6mr57857297b3.1.1741196610318;
        Wed, 05 Mar 2025 09:43:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741196610; cv=none;
        d=google.com; s=arc-20240605;
        b=J6MjbyjXd+A88ih5zjRTVaqAj4UMydQNsCI+Sw3NGQ/SP8pnaJOax2bRXEGxqccsDa
         BedcuHQ1xTYgTxLgcVNtNqjHUnXXYhm7jSoIjg4CboSLkQ1nF72opB8yFPw+4HzHPufR
         rc28/5Yca6DBXovPIoM2ywc96k7eghNZtYGxNXK+mxKlJlYJ64VmfeKjO4ChX5kMSTg6
         9EZ9UQk1gTiyyg52IS+xTP1ZsCWhaX8j9wWfXeMDPNIOfp7E7EVRd9QFPjWWhW5PKliM
         S8C+05PzKF3do5mqVyzbj/H8ZhpbdViCqpb84Dq1BoBSqNvt7vuWzf22eAY4fzf3dNFP
         QR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=0io+YkR5jeMpVFQxenjogAXZmb91RzAb6Htvhb2NFNs=;
        fh=A/OwDQ9RWUQARpKY3ORZ2zdAWYtuEXd13nB7JJN/T6I=;
        b=kG9mtY1FmweFIQcKYPN9B26QU2Oa7/j+xD4ZYS9IdTVVOU5wh++meXY08SoTx5Z5ad
         Ry1qGusr1T8V6yHa4RyKZ1Y99HA6kKZtkWMfIy8V33xvdX7gAAlop/ZI6hc7UWMf6Lqn
         11z4IcfP3kn6HTMSZibZ8tfUZSSZkL9JDfrfDbriN9Szn2YGdaTvhYFW4GxNb5RYszGQ
         c45V5UGeS1MqfDrB0dhP3MDe0ZQzLRCGqU1iViO6y/Z9XQ/iY8S/RaypQvW7J8PC4Fte
         CMqqtiXNw3qPPF73WnTeNIdVgqZhtFW02+7LCu2xNibP13PtJ8Uum3G7SO7tiYCZpiot
         IkZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iSRn8nXA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-6fd3cb5d546si123303697b3.219.2025.03.05.09.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 09:43:30 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iSRn8nXA;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741196609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0io+YkR5jeMpVFQxenjogAXZmb91RzAb6Htvhb2NFNs=;
	b=iSRn8nXAcfKdjkXjs3DUmD8tzgcn3Q12Mw4BdFq8GsJhzvCJBa4WjZmzCGMFpoXbifbZME
	6WkXFryivGPHh4bsHcwMOT9FaLBDveXayyqH7kIG96cMEF5v8jIq4BzxeiPc7iy7lzwkET
	/xnGbaP3VlFjYkknnU40muupHY7QFcU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-MyEtrErpN9agTCj9pRUdcA-1; Wed, 05 Mar 2025 12:43:23 -0500
X-MC-Unique: MyEtrErpN9agTCj9pRUdcA-1
X-Mimecast-MFC-AGG-ID: MyEtrErpN9agTCj9pRUdcA_1741196603
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-390e27150dbso6821267f8f.3
        for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 09:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741196602; x=1741801402;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0io+YkR5jeMpVFQxenjogAXZmb91RzAb6Htvhb2NFNs=;
        b=QefO5B3aQ8pAaxK1tck/byWnqxdNCzfxFYXJba5yItCpw/fBWD1HNvejcUX0wW5GLY
         podsuhMow8AsgKYdZ99h1fsGEXic8ByMt6h+URET6fsW5lZH1cC4VipcoIhSYU9kbvwx
         b9o2hSJcrRCSy3zmIk35nuol0DJADjjA+t9o9GKQhFp95zgiZJjqHOc1olkTAy2kXZNx
         ogUS7kZkJtOBfgCiSG36Bm6KQLkUUhg+UZfQtKiUcz2/4t4UOx//byRZ2vyG6NE9YYV7
         xUikvGqTXvUzmOXAgL7LegT5jhow4jv2yCj9kjSQCR3O+2hBlkt06h2CNkyFJTElqooc
         crzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFzQC9Nvj0ht//YGpkXNK66+3sYCbS6b6ucsbyolz4ws6+qSV5paEt1zdkBWffcbEAcKSrrOdc5iO1cw==@linaro.org
X-Gm-Message-State: AOJu0YxXNi2oLieygNj1kCND19AMYdC31L8dquGmPWfyVVbkYWqUP6MD
	w5hVzCQRKTEA83YLZRYlqqX+yx8QKnkHbDCnXMjMSKs+urMULMmrfusg7SeQz/hZSUsLKmCfyqs
	4floLhZS60pxY26ayikIEANWSm0W2cjDtoiio+tTNAtE5ci4WwgqwfA==
X-Gm-Gg: ASbGncuDhaILh98fJ+1f/FOzy2LzTCjNTzeeLJOpqcLBR1WLGqixFX6Rtjo7+YE/Zns
	KNOv7WJJQvVl2JdfmJM+Sa5kZ5xrFzA9/Sd85nPo4y3136X99io5/zis/3ZHSZkNeQc8zcmVHN0
	kNrZMFaf7WK8L+4leIGN69plkspti4CPxbXqT5RnGsrwwtxCHxa6rXJvhZj+N3YMdlyt5tBwZPe
	jtNhQwwl5qf7hOx2Uo21ikzEOz2o5riiq80wiyWGLOu9VigPSo69k0hQhifvkrfRNXoNwWUPdE7
	TstnPDjFC34NbBFpU5LMgZqtpsnIt7VAUxxpwc7oAyuDNwI=
X-Received: by 2002:a5d:47a7:0:b0:38f:6697:af6e with SMTP id ffacd0b85a97d-3911f720584mr3015128f8f.1.1741196602541;
        Wed, 05 Mar 2025 09:43:22 -0800 (PST)
X-Received: by 2002:a5d:47a7:0:b0:38f:6697:af6e with SMTP id ffacd0b85a97d-3911f720584mr3015109f8f.1.1741196602117;
        Wed, 05 Mar 2025 09:43:22 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391241bd151sm1859318f8f.21.2025.03.05.09.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 09:43:21 -0800 (PST)
Message-ID: <97c614a5-9de0-4615-ba84-207affcaf54a@redhat.com>
Date: Wed, 5 Mar 2025 18:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] hw/arm/aspeed: Replace TARGET_AARCH64 by
 legacy_binary_is_64bit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250305161248.54901-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eN8Sjws_lTsvT0R-PsOhtPjWym_poLpi-5Mjs5gdr6c_1741196603
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: hWx82f7eppDU

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
>           .class_init    = aspeed_machine_ast2700_evb_class_init,
> -#endif
>       }, {
>           .name          = TYPE_ASPEED_MACHINE,
>           .parent        = TYPE_MACHINE,

Same as with previous patch, I'd prefer to split the array, and replace the 
DEFINE_TYPES() with a dynamic type_init() function.

  Thomas

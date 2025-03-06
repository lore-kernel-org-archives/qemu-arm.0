Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1285243njm;
        Wed, 5 Mar 2025 22:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQB1pqC9wgGYzuv8/Da5AE27Ks3SjWHbFGTXIE6ZCa3BhmMmqSToiP2Dn2ByoxsWKWJDmgVnKKc2QiEA==@linaro.org
X-Google-Smtp-Source: AGHT+IH7eaxdBTaW1PjFp7dsHmpilm7nDU7mjRZ0x6DmHvuSE/t8kvIGi8SCHcMLVaqiMpJLy21+
X-Received: by 2002:a05:620a:3b0b:b0:7c3:d95c:a2ba with SMTP id af79cd13be357-7c3d95ca2d8mr614103385a.1.1741241569836;
        Wed, 05 Mar 2025 22:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741241569; cv=none;
        d=google.com; s=arc-20240605;
        b=F3S4QfEwFLWmsvUV+oXsm+k38LCXSZARsQcM4MuqTQsuadVKBMgtX1/EIUKQhbr52h
         soWri5xC3GtK9ExQKG9BayOZ8HObAW7agqpoGgcm2m2D4tizcOFu3BhyYFSaGD5m2ZUZ
         1KfaMP1wh9WLcpvje0RN54b7o6yftst7qHMMRL5Hw9FC0fVNHdCdfP0rG2Zf1aHLLXE5
         iVmeKHOsXltrhqbO4+gfWsqDK8R3KI3pggsexLjBWBZNoYx5ePFtB0bk+R10/BILNtij
         Wdu1SzOgSDFMlpUuXDnmlpSdj0ox1S2iCQobze8VISUBsVn9wNZZGG/giQEndpkcxZiC
         9H6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=nO+VimTEW8xhqR45blT34Yx7cRvxG1H3xJW2FBykFrs=;
        fh=z4cjpnSZjemv9am14jcVRQwhL9/SoUW6AfvDsS8fqy8=;
        b=OCrYfis8kG//uPSHYn5s2lb9X2lhEhQGPDJfYFa2lNnTVrAeeE9PiERj4OIMKCq1Rg
         Qm60nU9tCEKjElYjx1lvtNY+H7rvoGhHC/VB3/SjB1hEr/YubBSySfBW8upcH0B0HzKY
         Z4L9oIq5gwWMCQ3Sje/nFJ52Xg6w50mNZSiAZQAvIzhDKxGyVXfVmPFM90LgTz8ew2oX
         /S86xbbQlTB2rNSlXvtjhiukaMHnsg6xPsFTwCrNpceSxoH+xL8MB2NeSCLSZKtKj6dv
         TW9bsonsoETb6wZMAae2/qoH4xNDKrmfeOw+9wbzyXCr4TO/eZ8560R+cFjOS8hq5ZgL
         TS8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayV6oY80;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e5511b57si64613585a.419.2025.03.05.22.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ayV6oY80;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741241569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nO+VimTEW8xhqR45blT34Yx7cRvxG1H3xJW2FBykFrs=;
	b=ayV6oY80vXHS1/GwqQQ8NlrTIcY2bY55Ht2VMpe7qYSH5AXFBYSWRWh3N2oeDSAGOmNCUX
	KE6It1xxs+7Of7Ut82BmkD78hrqubm0tXuK2EkMVcRgWVITzYdQM2mqVkx+q8UsSBbEryX
	knnsSUJC7t8hIAR57blXGXPwJS/BhZA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-m_FBlMlZPRuc6jfcpP6oMw-1; Thu, 06 Mar 2025 01:12:38 -0500
X-MC-Unique: m_FBlMlZPRuc6jfcpP6oMw-1
X-Mimecast-MFC-AGG-ID: m_FBlMlZPRuc6jfcpP6oMw_1741241557
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac21873859aso11023866b.2
        for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 22:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741241557; x=1741846357;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO+VimTEW8xhqR45blT34Yx7cRvxG1H3xJW2FBykFrs=;
        b=gEe5cXuJiwdkkvLuw9aZBFgjOqaFveGXyo15Ngud+OpbB+txqlP9pRbl3cZuqGxzpE
         /DXwb13UdmImhgXNnjS/iSMnmGRTORS/NSV4BChWyhxCG1HCEVY9hoba4pu/vgdX1SUt
         prRL4Bsyzo0xAmz4MBLXKR11HpX/Y4HjJud1JLXFhxNSHZWs7x6qmuFHfjVy8LwbKhQA
         LihCR82C3znEKzmaK+aEhwfpKkGbjmXYUq0HqOi7sNLroHNkI2WndLxcExrsIUrZD1Xa
         IQtxjVgKwERz9Y6+3U2MVptvvMhVJvxvskrVqGJZxrQfYPHnwSOCWZ1SnBoI1P/lPS+l
         +MDg==
X-Forwarded-Encrypted: i=1; AJvYcCVWSRvKHwa505uE4qXH8r25Y8cAHkNFJN3lWj3c5xobVHBXgsgGJhBBjXuAJNSR3dHD0G6zu3UVSQ+ahQ==@linaro.org
X-Gm-Message-State: AOJu0YzwUL41ioy158t7gn9tVVG+zyEUsjYAucPAWvElkGpy15eCGh9B
	dFM/6DglXh61dNfh4goBkAh/YQvSSkdgqaj+5vYd3Wwoc5zJlg4A1U66yBzOkUxDCdfVAk4xCtc
	SNi6Gls0SEaC1OfTfBMDXyoUqD84aneKVWfDxbHYZ38Lv/hDxCJ2Fjw==
X-Gm-Gg: ASbGncu/3gGYZxnDE62aPrYVYwtDQPNqQr3R3i2aFSIFQowVThhE71ZeMh/VL+nOiEB
	FkPdlxKGITWDi5MOAd7I2kuZtCWJpsNarLMtw05epgh7iJToDTSMRObogkW9t4uNLzTsXLXMKte
	m4Wo7OYUo0uVLLHee1QRFSgslnF9XRgUPDSiohkn8+Im3Xm5ORjIj1u+8DR5zgxshlhcub+h38F
	tMBwO+UGmPUgiKC3dinTpWkDHrb7E1e2jQqq+nHMEjia6YGLPdjPItO6FepPNsQn4vDJlQMQAAl
	JKn6ZGUNNDmrGIzbkDG0hZ0J4A8K5dnfDKY8xaq7gY8gAo0=
X-Received: by 2002:a17:907:2dac:b0:abf:70fb:7f05 with SMTP id a640c23a62f3a-ac20dafc173mr580468866b.50.1741241556919;
        Wed, 05 Mar 2025 22:12:36 -0800 (PST)
X-Received: by 2002:a17:907:2dac:b0:abf:70fb:7f05 with SMTP id a640c23a62f3a-ac20dafc173mr580466766b.50.1741241556513;
        Wed, 05 Mar 2025 22:12:36 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac23943c476sm38284466b.3.2025.03.05.22.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 22:12:35 -0800 (PST)
Message-ID: <cdb0db9d-1a4d-4e90-b0dc-d42b3ea2c1b1@redhat.com>
Date: Thu, 6 Mar 2025 07:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] hw/arm/raspi: Replace TARGET_AARCH64 by
 legacy_binary_is_64bit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-3-philmd@linaro.org>
 <91882e5b-bd0f-4f84-9c03-c40b5e3d3e3f@redhat.com>
 <9d7283b7-9d05-4dc0-8e80-3c565376a812@kaod.org>
 <0561d400-6e0b-40e0-a616-bd0d9fd4feec@redhat.com>
 <1b76a7fc-e79b-4f32-9657-b87fb7761c95@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <1b76a7fc-e79b-4f32-9657-b87fb7761c95@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xS9bBOAlDXxuOnbOIklvuKlYqcwODSs8-7FDo-u4BEM_1741241557
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ei+3Xmk7HHqH

On 05/03/2025 20.07, Philippe Mathieu-Daudé wrote:
> On 5/3/25 19:35, Thomas Huth wrote:
>> On 05/03/2025 19.12, Cédric Le Goater wrote:
>>> On 3/5/25 18:40, Thomas Huth wrote:
>>>> On 05/03/2025 17.12, Philippe Mathieu-Daudé wrote:
>>>>> For legacy ARM binaries, legacy_binary_is_64bit() is
>>>>> equivalent of the compile time TARGET_AARCH64 definition.
>>>>>
>>>>> Use it as TypeInfo::registerable() callback to dynamically
>>>>> add Aarch64 specific types in qemu-system-aarch64 binary,
>>>>> removing the need of TARGET_AARCH64 #ifdef'ry.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>>> ---
>>>>>   hw/arm/bcm2836.c | 6 ++----
>>>>>   hw/arm/raspi.c   | 7 +++----
>>>>>   2 files changed, 5 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
>>>>> index 95e16806fa1..88a32e5fc20 100644
>>>>> --- a/hw/arm/bcm2836.c
>>>>> +++ b/hw/arm/bcm2836.c
>>>>> @@ -12,6 +12,7 @@
>>>>>   #include "qemu/osdep.h"
>>>>>   #include "qapi/error.h"
>>>>>   #include "qemu/module.h"
>>>>> +#include "qemu/legacy_binary_info.h"
>>>>>   #include "hw/arm/bcm2836.h"
>>>>>   #include "hw/arm/raspi_platform.h"
>>>>>   #include "hw/sysbus.h"
>>>>> @@ -195,7 +196,6 @@ static void bcm2836_class_init(ObjectClass *oc, 
>>>>> void *data)
>>>>>       dc->realize = bcm2836_realize;
>>>>>   };
>>>>> -#ifdef TARGET_AARCH64
>>>>>   static void bcm2837_class_init(ObjectClass *oc, void *data)
>>>>>   {
>>>>>       DeviceClass *dc = DEVICE_CLASS(oc);
>>>>> @@ -208,7 +208,6 @@ static void bcm2837_class_init(ObjectClass *oc, 
>>>>> void *data)
>>>>>       bc->clusterid = 0x0;
>>>>>       dc->realize = bcm2836_realize;
>>>>>   };
>>>>> -#endif
>>>>>   static const TypeInfo bcm283x_types[] = {
>>>>>       {
>>>>> @@ -219,12 +218,11 @@ static const TypeInfo bcm283x_types[] = {
>>>>>           .name           = TYPE_BCM2836,
>>>>>           .parent         = TYPE_BCM283X,
>>>>>           .class_init     = bcm2836_class_init,
>>>>> -#ifdef TARGET_AARCH64
>>>>>       }, {
>>>>>           .name           = TYPE_BCM2837,
>>>>>           .parent         = TYPE_BCM283X,
>>>>> +        .registerable   = legacy_binary_is_64bit,
>>>>>           .class_init     = bcm2837_class_init,
>>>>> -#endif
>>>>>       }, {
>>>>>           .name           = TYPE_BCM283X,
>>>>>           .parent         = TYPE_BCM283X_BASE,
>>>>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>>>>> index dce35ca11aa..f7e647a9cbf 100644
>>>>> --- a/hw/arm/raspi.c
>>>>> +++ b/hw/arm/raspi.c
>>>>> @@ -15,6 +15,7 @@
>>>>>   #include "qemu/osdep.h"
>>>>>   #include "qemu/units.h"
>>>>>   #include "qemu/cutils.h"
>>>>> +#include "qemu/legacy_binary_info.h"
>>>>>   #include "qapi/error.h"
>>>>>   #include "hw/arm/boot.h"
>>>>>   #include "hw/arm/bcm2836.h"
>>>>> @@ -367,7 +368,6 @@ static void raspi2b_machine_class_init(ObjectClass 
>>>>> *oc, void *data)
>>>>>       raspi_machine_class_init(mc, rmc->board_rev);
>>>>>   };
>>>>> -#ifdef TARGET_AARCH64
>>>>>   static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
>>>>>   {
>>>>>       MachineClass *mc = MACHINE_CLASS(oc);
>>>>> @@ -387,7 +387,6 @@ static void raspi3b_machine_class_init(ObjectClass 
>>>>> *oc, void *data)
>>>>>       rmc->board_rev = 0xa02082;
>>>>>       raspi_machine_class_init(mc, rmc->board_rev);
>>>>>   };
>>>>> -#endif /* TARGET_AARCH64 */
>>>>>   static const TypeInfo raspi_machine_types[] = {
>>>>>       {
>>>>> @@ -402,16 +401,16 @@ static const TypeInfo raspi_machine_types[] = {
>>>>>           .name           = MACHINE_TYPE_NAME("raspi2b"),
>>>>>           .parent         = TYPE_RASPI_MACHINE,
>>>>>           .class_init     = raspi2b_machine_class_init,
>>>>> -#ifdef TARGET_AARCH64
>>>>>       }, {
>>>>>           .name           = MACHINE_TYPE_NAME("raspi3ap"),
>>>>>           .parent         = TYPE_RASPI_MACHINE,
>>>>> +        .registerable   = legacy_binary_is_64bit,
>>>>>           .class_init     = raspi3ap_machine_class_init,
>>>>>       }, {
>>>>>           .name           = MACHINE_TYPE_NAME("raspi3b"),
>>>>>           .parent         = TYPE_RASPI_MACHINE,
>>>>> +        .registerable   = legacy_binary_is_64bit,
>>>>>           .class_init     = raspi3b_machine_class_init,
>>>>> -#endif
>>>>>       }, {
>>>>>           .name           = TYPE_RASPI_MACHINE,
>>>>>           .parent         = TYPE_RASPI_BASE_MACHINE,
>>>>
>>>> Uh, this (together with patch 1) looks very cumbersome. Why don't you 
>>>> simply split the array into two, one for 32-bit and one for 64-bit, and 
>>>> then use a simply "if (legacy_binary_is_64bit())" in the type_init 
>>>> function instead?
>>>
>>> Sounds like a good idea.
>>>
>>> So we would have DEFINE_TYPES() and DEFINE_TYPES64() macros ?
>>
>> Either that - or simply use type_init() directly here for the time being.
> 
> As Pierrick noted on private chat, my approach doesn't scale, I should
> use smth in the lines of:
> 
>      }, {
>          .name           = MACHINE_TYPE_NAME("raspi2b"),
>          .parent         = TYPE_RASPI_MACHINE,
>          .registerable   = qemu_binary_has_target_arm,
>          .class_init     = raspi2b_machine_class_init,
>      }, {
>          .name           = MACHINE_TYPE_NAME("raspi3ap"),
>          .parent         = TYPE_RASPI_MACHINE,
>          .registerable   = qemu_binary_has_target_aarch64,
>          .class_init     = raspi3ap_machine_class_init,
>      }, {
> 
> Having:
> 
> bool qemu_binary_has_target_arm(void)
> {
>      return qemu_arch_available(QEMU_ARCH_ARM);
> }
> 
> Now back to Thomas suggestion, we could define 2 TypeInfo arrays,
> but I foresee lot of code churn when devices has to be made
> available on different setup combinations; so with that in mind
> the QOM registerable() callback appears a bit more future proof.

Honestly, in this case, I'd rather prefer some code churn now instead of 
having a unnecessary callback interface until forever! Just my 0.02 €.

  Thomas

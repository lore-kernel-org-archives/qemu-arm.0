Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1005420njm;
        Wed, 5 Mar 2025 10:36:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXTIwxGOIzr+8lCOln9PSsFJcdRU3hYR7QLZ3EMSIdOD3cPgHsC2ej3gGhijND32NZHIt/R8Oscx0+Vgg==@linaro.org
X-Google-Smtp-Source: AGHT+IE1aAt49HcfKMS1EZFARg1kCFpS0civuKRGdL2OoQt2Rmxg/B09FPW+sBNu5OU7TEExoYbc
X-Received: by 2002:a05:6902:100d:b0:e5d:ce4f:66ba with SMTP id 3f1490d57ef6-e611e32fb1emr5423351276.46.1741199760483;
        Wed, 05 Mar 2025 10:36:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741199760; cv=none;
        d=google.com; s=arc-20240605;
        b=Ltr240IYsudJ2QfRN+E8+kfvWdD9XmF55zg5gGov63Whxto9MK3akerMNB8kfTZuSM
         KUNzoLBbZUqu6XZvjTnFUrbQBZOX0gMaCIXCkyAu/lbkGz6I8x+/Z+4v5R2TvYv2GYN7
         4L0p/GIC4EcUPlOYg9GgnhwFj7zDZ389TOO8rKfi5alF40mSd9GerYjF8EnM08dk24NI
         Du4bP2VyHABj9KBmFWkr6MS24u4YvwVy5UCWQGuRMHAZ8gLhEaEDP2CrEUiMl2XftiVv
         Lc0puGuDJ/YrMO5xG5TbNLKxEg1EoHKnB4p2sYFO6P5dhIA6YdnA3+UdfyP5kQLrUzJV
         PCfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=sn1+DMqhjNdc9Fx2BMT4veukDYS6khSA3w3zNyjONsE=;
        fh=0D/2aJdRZ+xwJNBLrwdkUiyMNJ+P+Jd/34eW+NQAkD8=;
        b=Wsp28t90RBQ4TZtUMpfvH62tLkGQnwAZqmG7s5h3R+2jJvTw2Mo/ZNP70vjzkV7rFY
         tuOyQVo4FC2IwtvZwbokUcAzj4hkt/dt4jmRfC4Xe8oKGoA6JWvnUQP1OXoY9NBaUrHy
         EYPJBrRyV1Q2nRoK4u82dNwJnAE3znPlCg5iSpYcoAHR6bJqOIZEQgQxHvyP7wWJR1I/
         YklvbL/96Mst1Ip1FVvLjW3MXeVG1OI/BTKxPIggX4FY4qx2XQXpDrvTeHXbGJi+n0At
         rmm2bb659dx71va9XHrH/TyMwiKk/gXkC875tvH+v8Dw44yOW6wzbPZbsU8QbqrX2hq6
         CvlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LXZ9jgZ+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e611d320454si2068021276.563.2025.03.05.10.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:36:00 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LXZ9jgZ+;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741199760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sn1+DMqhjNdc9Fx2BMT4veukDYS6khSA3w3zNyjONsE=;
	b=LXZ9jgZ+KmMsjrGCpnAQ6TwBMXN8dEUTq2GsZ+A7pkH1+/cF6LtUj6mr8wu1IY8d5OiRFw
	YL2QXOO+BuuAsOEVXXOSjDVgV68Lo4aGf7ioI2eCGUqsU5/1Ja4BzXPwPY1FtYK8Papwd6
	bZEoVUXulHw6zn0KXCBBgL+vouhlToo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-NPxpO87tNR26DAUyO09lWQ-1; Wed, 05 Mar 2025 13:35:58 -0500
X-MC-Unique: NPxpO87tNR26DAUyO09lWQ-1
X-Mimecast-MFC-AGG-ID: NPxpO87tNR26DAUyO09lWQ_1741199757
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bd92233acso4231755e9.1
        for <alex.bennee@linaro.org>; Wed, 05 Mar 2025 10:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741199757; x=1741804557;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sn1+DMqhjNdc9Fx2BMT4veukDYS6khSA3w3zNyjONsE=;
        b=NoJgLzEM7c6Fv+CcPCix2XQNIF+o7OmWsXt/21Y3e2/PBKhJ5Oue8t1ny4RAZ7gMyz
         IRNYwm+HiCVymnRXtcWlL3Zc/Ry0dEXKAnafBCiK4Yub0HLvmygr3hhftCPrGqmuzR0f
         598H2++BMjAWC33tARX/PEabeJ/eIox88HS025n/xXrmYsAP/JVTN5AMrZZaemU4eU3H
         iqdEWgz5ZVPEYVVYbFEzBqKR7Shw7TKaJsLH8Mxf3fXk+qqVtvm5vCfbslv1krtvjFSb
         A2AacEyTbJz0qtL6SAWSHKxf51yISlgRrMLDb0wa2MllXv2tCeZaqJA7szHeZEfO3cXM
         Ig5A==
X-Forwarded-Encrypted: i=1; AJvYcCWhHp5Rvf7w4C1ZxfnE1SsfrYNZgsBLK6DEYqN7TBwAp1oOH0RTKzwwRHJY9890PDGztCl7j28a+D+n5g==@linaro.org
X-Gm-Message-State: AOJu0Yx4sYytLB5DHiYj2HmCRv3OCOvk9XVBE9F3ppuIDuhji1EXbJYx
	RXxkRfiVYcYjYX6o0oPMxHiAbMnresUjYQfD6MNpaHmr0MuN68WiHuVca039K2g86FbzG8VAQ0i
	pecg32eadaKRCfWulweRzx/AYPY8wsWs3WjkbBLLYYUfEbhDjuea7Xg==
X-Gm-Gg: ASbGncvmle5hr72866Ub4jYnFveQMX14dSNYI2hNg/V0fbhn/EWTYj0xX4fRY2uh5lX
	qFU2DQJSjtGBLYlT0S5RvLNoZKzscliTynkFi8bVde7PRazH0Me9JBzQ3CvoL7HQcTiUlFjVbER
	2LtvvLGCmYasSsxVZn5xZ+jRjBqKUsEgYAUgcFxRDC0Jzmn811Sy2Pty5LLtjB+biPoC8FTANbF
	SGt4i7Qgk6Mcdk3fdB6vvjgKzl1dHqeTScvbH4GhDweKhMyhyxbQk8Fa1dcfr80pemr4RDaUzlv
	M2xt34g7bOBWOAHbVKMKmGnOyLAjG5pBnBuDLjJ7+vEUO2c=
X-Received: by 2002:a05:6000:1446:b0:38d:d9e4:9ba6 with SMTP id ffacd0b85a97d-3911f724cf8mr4239123f8f.3.1741199757446;
        Wed, 05 Mar 2025 10:35:57 -0800 (PST)
X-Received: by 2002:a05:6000:1446:b0:38d:d9e4:9ba6 with SMTP id ffacd0b85a97d-3911f724cf8mr4239103f8f.3.1741199757056;
        Wed, 05 Mar 2025 10:35:57 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-51-231.web.vodafone.de. [109.42.51.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4847e62sm22065905f8f.67.2025.03.05.10.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 10:35:56 -0800 (PST)
Message-ID: <0561d400-6e0b-40e0-a616-bd0d9fd4feec@redhat.com>
Date: Wed, 5 Mar 2025 19:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] hw/arm/raspi: Replace TARGET_AARCH64 by
 legacy_binary_is_64bit()
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
 <20250305161248.54901-3-philmd@linaro.org>
 <91882e5b-bd0f-4f84-9c03-c40b5e3d3e3f@redhat.com>
 <9d7283b7-9d05-4dc0-8e80-3c565376a812@kaod.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <9d7283b7-9d05-4dc0-8e80-3c565376a812@kaod.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Iwkc_jWerXW180dM1U44DvpF-_z6f1aBO7Y8AD5Pbf0_1741199757
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WzIvU91HqGAo

On 05/03/2025 19.12, Cédric Le Goater wrote:
> On 3/5/25 18:40, Thomas Huth wrote:
>> On 05/03/2025 17.12, Philippe Mathieu-Daudé wrote:
>>> For legacy ARM binaries, legacy_binary_is_64bit() is
>>> equivalent of the compile time TARGET_AARCH64 definition.
>>>
>>> Use it as TypeInfo::registerable() callback to dynamically
>>> add Aarch64 specific types in qemu-system-aarch64 binary,
>>> removing the need of TARGET_AARCH64 #ifdef'ry.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/arm/bcm2836.c | 6 ++----
>>>   hw/arm/raspi.c   | 7 +++----
>>>   2 files changed, 5 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
>>> index 95e16806fa1..88a32e5fc20 100644
>>> --- a/hw/arm/bcm2836.c
>>> +++ b/hw/arm/bcm2836.c
>>> @@ -12,6 +12,7 @@
>>>   #include "qemu/osdep.h"
>>>   #include "qapi/error.h"
>>>   #include "qemu/module.h"
>>> +#include "qemu/legacy_binary_info.h"
>>>   #include "hw/arm/bcm2836.h"
>>>   #include "hw/arm/raspi_platform.h"
>>>   #include "hw/sysbus.h"
>>> @@ -195,7 +196,6 @@ static void bcm2836_class_init(ObjectClass *oc, void 
>>> *data)
>>>       dc->realize = bcm2836_realize;
>>>   };
>>> -#ifdef TARGET_AARCH64
>>>   static void bcm2837_class_init(ObjectClass *oc, void *data)
>>>   {
>>>       DeviceClass *dc = DEVICE_CLASS(oc);
>>> @@ -208,7 +208,6 @@ static void bcm2837_class_init(ObjectClass *oc, void 
>>> *data)
>>>       bc->clusterid = 0x0;
>>>       dc->realize = bcm2836_realize;
>>>   };
>>> -#endif
>>>   static const TypeInfo bcm283x_types[] = {
>>>       {
>>> @@ -219,12 +218,11 @@ static const TypeInfo bcm283x_types[] = {
>>>           .name           = TYPE_BCM2836,
>>>           .parent         = TYPE_BCM283X,
>>>           .class_init     = bcm2836_class_init,
>>> -#ifdef TARGET_AARCH64
>>>       }, {
>>>           .name           = TYPE_BCM2837,
>>>           .parent         = TYPE_BCM283X,
>>> +        .registerable   = legacy_binary_is_64bit,
>>>           .class_init     = bcm2837_class_init,
>>> -#endif
>>>       }, {
>>>           .name           = TYPE_BCM283X,
>>>           .parent         = TYPE_BCM283X_BASE,
>>> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
>>> index dce35ca11aa..f7e647a9cbf 100644
>>> --- a/hw/arm/raspi.c
>>> +++ b/hw/arm/raspi.c
>>> @@ -15,6 +15,7 @@
>>>   #include "qemu/osdep.h"
>>>   #include "qemu/units.h"
>>>   #include "qemu/cutils.h"
>>> +#include "qemu/legacy_binary_info.h"
>>>   #include "qapi/error.h"
>>>   #include "hw/arm/boot.h"
>>>   #include "hw/arm/bcm2836.h"
>>> @@ -367,7 +368,6 @@ static void raspi2b_machine_class_init(ObjectClass 
>>> *oc, void *data)
>>>       raspi_machine_class_init(mc, rmc->board_rev);
>>>   };
>>> -#ifdef TARGET_AARCH64
>>>   static void raspi3ap_machine_class_init(ObjectClass *oc, void *data)
>>>   {
>>>       MachineClass *mc = MACHINE_CLASS(oc);
>>> @@ -387,7 +387,6 @@ static void raspi3b_machine_class_init(ObjectClass 
>>> *oc, void *data)
>>>       rmc->board_rev = 0xa02082;
>>>       raspi_machine_class_init(mc, rmc->board_rev);
>>>   };
>>> -#endif /* TARGET_AARCH64 */
>>>   static const TypeInfo raspi_machine_types[] = {
>>>       {
>>> @@ -402,16 +401,16 @@ static const TypeInfo raspi_machine_types[] = {
>>>           .name           = MACHINE_TYPE_NAME("raspi2b"),
>>>           .parent         = TYPE_RASPI_MACHINE,
>>>           .class_init     = raspi2b_machine_class_init,
>>> -#ifdef TARGET_AARCH64
>>>       }, {
>>>           .name           = MACHINE_TYPE_NAME("raspi3ap"),
>>>           .parent         = TYPE_RASPI_MACHINE,
>>> +        .registerable   = legacy_binary_is_64bit,
>>>           .class_init     = raspi3ap_machine_class_init,
>>>       }, {
>>>           .name           = MACHINE_TYPE_NAME("raspi3b"),
>>>           .parent         = TYPE_RASPI_MACHINE,
>>> +        .registerable   = legacy_binary_is_64bit,
>>>           .class_init     = raspi3b_machine_class_init,
>>> -#endif
>>>       }, {
>>>           .name           = TYPE_RASPI_MACHINE,
>>>           .parent         = TYPE_RASPI_BASE_MACHINE,
>>
>> Uh, this (together with patch 1) looks very cumbersome. Why don't you 
>> simply split the array into two, one for 32-bit and one for 64-bit, and 
>> then use a simply "if (legacy_binary_is_64bit())" in the type_init 
>> function instead?
> 
> Sounds like a good idea.
> 
> So we would have DEFINE_TYPES() and DEFINE_TYPES64() macros ?

Either that - or simply use type_init() directly here for the time being.

  Thomas

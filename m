Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp510430ejj;
        Thu, 23 Nov 2023 08:24:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbrGfBc5YOezp8FkEMEjX+8nP7vPcQR1QV1ijY+kLL9EJ6hUrLots0Y4IxFdLDDdGKtOR8
X-Received: by 2002:a05:6870:ebc6:b0:1dd:651a:72ce with SMTP id cr6-20020a056870ebc600b001dd651a72cemr8018799oab.33.1700756697027;
        Thu, 23 Nov 2023 08:24:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700756697; cv=none;
        d=google.com; s=arc-20160816;
        b=IAHd5VVIXf/V7UPwDlFlMNOgeWZi88Wwzyw1weXBI4MVTmEDzVRudUesXVXynF6Jyz
         yC+UN4rFPRv0gDK3yXL3KajCDXcKEsJX/cAvFdwyW3v+lNN/CwT1zrISWTqLJi4WwRrm
         7IokRiYcb5jfL4fhrHFRscuOhvE/yU2N7oHK9CGjQJuVXfoapiZXrixqfJKQgnNYiB1+
         Z8n2Fer08DC9qo/mIJ7GkVFz02/+HwIrT6eE2sRc2+pfnzYdODIvhB0+e1nUWnrPXdlc
         JEcmd4wJvlpuQe8ed4PElWeX1Q+JXHy1Yps+41dOD6+uSwNdsGNcCTxJvIi8H5Cxl9Tw
         Dzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=RkZr6Uzf2YD+cyAlhzAAYwdyvQokQG5lkbLuX195xcw=;
        fh=n8Ta741eZfcJnUmcfO3cNkLSctKDnt3KsR4oS0yc4SY=;
        b=TrWGRCjEY4huxcsSKhc6t6buNZa2hA5XVeMEkHoz4ZNJIPG2DeUHpSHgu9EOyL5a3Z
         YxUXZjAk7y7v9roBvQNa/XtgoTCVk5o4vKpsqF9w8h5f7WU9ISArN2pkitlekCisoDY4
         NNzTq0Sp683TMo07aAizjwsw8EN4fAltxWzvVhQmCpZZtfKFPNeWMFJF0dmREYMeYi3B
         yGGU2DMwgT/nd3xu3XFv8UBwSTfmyKkO8YPmKbUvHe566t0jqGI317TShrXDk7N3ixi7
         rOQtfquYDxAXL8hJUw0AKvClClQLldrdq7idImbq/YKZhVHcIzY1Bj5CrmIY4nq/25gM
         J4GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YAgDGrmB;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c3-20020ac85a83000000b0041cbf904b67si1343400qtc.89.2023.11.23.08.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 08:24:57 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YAgDGrmB;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700756696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=RkZr6Uzf2YD+cyAlhzAAYwdyvQokQG5lkbLuX195xcw=;
	b=YAgDGrmBj80DSuZO33U4qu9PT6b2VCaGFlJeJGARgr02uKmZc+tWJzYgzj6LjecdZ2qQAN
	mifWR58qy8PLwDmb1daX2sUTsOS4sDct/NUU0BtY+KKla6iFz/qD+zqBEaasQ0HcbqTtHV
	oN4UwMvTip/vyZUCgqGqaU2RWJsRl1Y=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-b11QYmCUNKa-1AXkaN2wiw-1; Thu, 23 Nov 2023 11:24:55 -0500
X-MC-Unique: b11QYmCUNKa-1AXkaN2wiw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6707401e1aeso11633396d6.0
        for <alex.bennee@linaro.org>; Thu, 23 Nov 2023 08:24:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700756695; x=1701361495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkZr6Uzf2YD+cyAlhzAAYwdyvQokQG5lkbLuX195xcw=;
        b=B7lc/OWx6n2AsNSRPxxcfllxxkXx3nx4jC4D3vmxSe1r3wz6Lyp4ESzsMQed+6OlrH
         h5ZF+zJ5Vsn1Wb0bf8gwlf6zWIuwWUEf9fd17Mi2GXbW6aikxJc47vqCaYgpOvDvMkmk
         Ye2M9eyikhfZxA24VNADKwUtALGZpzunCvz6KGR4/jzjgcOBnX4pgrN1eEVc0P3Ed/0/
         FzUM4mkyEpLz59D4xpDLfjiKwPkxaQovaYb38UHth/WnrNo5cB6lPTJ2Kjausdq5LzvG
         bFcu2uDnPjlEYE3E7zdwLAC/vNIleEbjNgK8fjnmmNsF4UVz9X0JFE+obJlsi4ky4/tz
         +8YA==
X-Gm-Message-State: AOJu0Yz8FKjWJvaV6cN0p4on6/trTesmRBwQzWiM/JP3GL2HzvDrfLFw
	Ekxjwn9RslpOxJ95BibFPHy/eAveYafnS0l2hU9jh2KvC6DYmRcSU9qpA8cFwA2VZIVdHva+L4w
	C7duMDEQJDtIZ3sRH
X-Received: by 2002:ad4:5042:0:b0:66f:b857:cbbb with SMTP id m2-20020ad45042000000b0066fb857cbbbmr33117qvq.12.1700756694872;
        Thu, 23 Nov 2023 08:24:54 -0800 (PST)
X-Received: by 2002:ad4:5042:0:b0:66f:b857:cbbb with SMTP id m2-20020ad45042000000b0066fb857cbbbmr33093qvq.12.1700756694565;
        Thu, 23 Nov 2023 08:24:54 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-43-176-233.web.vodafone.de. [109.43.176.233])
        by smtp.gmail.com with ESMTPSA id g18-20020a05620a109200b007778503ebf4sm565692qkk.16.2023.11.23.08.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 08:24:53 -0800 (PST)
Message-ID: <010c573d-17e6-43be-bb8f-6c3ff934bf4a@redhat.com>
Date: Thu, 23 Nov 2023 17:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 01/11] qom: Introduce the
 TypeInfo::can_register() handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-2-philmd@linaro.org>
 <dc8664c2-c1d4-4e11-8bcd-9465a2d97174@redhat.com>
 <59101052-6446-443c-8934-581b90a9bd2b@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <59101052-6446-443c-8934-581b90a9bd2b@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1vBowBr1TTYj

On 23/11/2023 17.03, Philippe Mathieu-Daudé wrote:
> On 23/11/23 16:09, Thomas Huth wrote:
>> On 22/11/2023 19.30, Philippe Mathieu-Daudé wrote:
>>> Add a helper to decide at runtime whether a type can
>>> be registered to the QOM framework or not.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   include/qom/object.h | 4 ++++
>>>   qom/object.c         | 3 +++
>>>   2 files changed, 7 insertions(+)
>>>
>>> diff --git a/include/qom/object.h b/include/qom/object.h
>>> index afccd24ca7..0d42fe17de 100644
>>> --- a/include/qom/object.h
>>> +++ b/include/qom/object.h
>>> @@ -372,6 +372,8 @@ struct Object
>>>    * struct TypeInfo:
>>>    * @name: The name of the type.
>>>    * @parent: The name of the parent type.
>>> + * @can_register: This optional function is called before a type is 
>>> registered.
>>> + *   If it exists and returns false, the type is not registered.
>>
>> The second sentence is quite hard to parse, since it is not quite clear 
>> what "it" refers to (type or function) and what "registered" means in this 
>> context (you don't mention type_register() here).
>>
>> Maybe rather something like:
>>
>> If set, type_register() uses this function to decide whether the type can 
>> be registered or not.
>>
>> ?
>>
>>>    * @instance_size: The size of the object (derivative of #Object).  If
>>>    *   @instance_size is 0, then the size of the object will be the size 
>>> of the
>>>    *   parent object.
>>> @@ -414,6 +416,8 @@ struct TypeInfo
>>>       const char *name;
>>>       const char *parent;
>>> +    bool (*can_register)(void);
>>> +
>>>       size_t instance_size;
>>>       size_t instance_align;
>>>       void (*instance_init)(Object *obj);
>>> diff --git a/qom/object.c b/qom/object.c
>>> index 95c0dc8285..f09b6b5a92 100644
>>> --- a/qom/object.c
>>> +++ b/qom/object.c
>>> @@ -150,6 +150,9 @@ static TypeImpl *type_register_internal(const 
>>> TypeInfo *info)
>>>   TypeImpl *type_register(const TypeInfo *info)
>>>   {
>>>       assert(info->parent);
>>> +    if (info->can_register && !info->can_register()) {
>>> +        return NULL;
>>> +    }
>>
>> I have to say that I don't like it too much, since you're trying to fix a 
>> problem here in common code that clearly belongs to the code in hw/arm/ 
>> instead.
>>
>> What about dropping it, and changing your last patch to replace the 
>> DEFINE_TYPES(raspi_machine_types) in hw/arm/raspi.c with your own 
>> implementation of type_register_static_array() that checks the condition 
>> there?
> 
> This isn't ARM specific, it happens I started to unify ARM/aarch64
> binaries.
> 
> Types can be registered depending on build-time (config/host specific)
> definitions and runtime ones. How can we check for runtime if not via
> this simple helper?
> 
> Still ARM, but as example what I have then is (module meson):
...
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 1e9c6c85ae..c3b7e5666c 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -744,7 +744,8 @@ static void aarch64_max_initfn(Object *obj)
>   static const ARMCPUInfo aarch64_cpus[] = {
>       { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>       { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
> -    { .name = "max",                .initfn = aarch64_max_initfn },
> +    { .name = "max",                .initfn = aarch64_max_initfn,
> +                                    .can_register = 
> target_aarch64_available },
>   #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>       { .name = "host",               .initfn = aarch64_host_initfn },
>   #endif

Picking this one as an example, I think I'd rather modify the for-loop in
aarch64_cpu_register_types() to check for the availability there... sounds 
much easier to understand for me than having a callback function.

Anyway, that's just my personal taste - if others agree with your solution 
instead, I won't insist on my idea.

  Thomas

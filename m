Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp554104ejj;
        Thu, 23 Nov 2023 09:30:59 -0800 (PST)
X-Received: by 2002:a05:651c:104b:b0:2c5:4e95:535a with SMTP id x11-20020a05651c104b00b002c54e95535amr47014ljm.20.1700760659031;
        Thu, 23 Nov 2023 09:30:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700760659; cv=none;
        d=google.com; s=arc-20160816;
        b=v1oQ6Vn3xtZ6XL8RzP/NW6MVDGNNhoNua4oX+IeYm/SdieqpRDEgn3n+NmfLFYt37j
         yqFb9vho8Vxo/OcTV9dxG8lFo4K6EPfGjoaN+zLR9rpT+UEGynwBRivxxwEtHDxLh3EX
         k6/+ktjKHKfgt2tprmzv1s45XwfddXeB/puFyn0MIKl6QJ0ynlN9scpELpr4TRoiattO
         hKKmF8gfnnHZAv5/Sn3c76N+L7O8MTTe7adqOWYW4w1IKXbVWTxXnM7SGT8xPT1ohWos
         LrBCQyZzHA3PKqJMuWkCzSO+eucMu7VIc/76hlGDld79sjhV2CFJcqYoTjFyEYj3HJLq
         I+PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vwPN2hypCUQWCsULpj9bVM2BJNth0pNf1bvC0uKO+qQ=;
        fh=D2xRNV4ZRzFJMB0vi+orL+ZRJMsGZrOHQXWT8mi94pw=;
        b=Em0I5uhDebIW84hgiWpDo2xklbOZ7CGT/VvNwKZTSrS+x08G6ka+984+lkcc7RG7To
         6bObQn4gB7u9D7ttc9IBhnswTqNhqhDqy9d1Kzwlyj2O9nnr7XKOvWekxMUDuioD6hB1
         hOXBu5Yp2v6uawl/FSntDQRI8gf7c0uJznQs9J83SR7v26nEtBfhusUXuqt0xViir+Ox
         Q1ZGt06pji+Gcl2tqAEWaHBGhMsmxwBKjHDiQuDV+EtDVE6hOAtWK5VJF99Mz2JFKHeC
         9pg8XNrfx6LKc7h8NqeCftlcoso9V6s2QDiAbfmJD4OsfXUiVzRZE8x2rjJr5Q8N+kaH
         G9bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRCL7y5H;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x2-20020a05600c420200b0040a4c6e3a16sor448423wmh.2.2023.11.23.09.30.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Nov 2023 09:30:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lRCL7y5H;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700760658; x=1701365458; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vwPN2hypCUQWCsULpj9bVM2BJNth0pNf1bvC0uKO+qQ=;
        b=lRCL7y5H85pzaDvMq+QxXdZEfUEEZcATp6O2SocQlV1mggPYhjKpNFgpXygI7yYbCs
         0cu7BrT97j9HvNVjAiy1Z8SzM+fIO12yijWlTNQh/o/r3wR3Ag12EZwEQNVqVyxCzuJ7
         7mLxoSdH5dMA2Y/ECkFaWrtYyfyH2UJI7YTiOAOQmw2LfXFAJlfb0EXIbVaJKayi2Gtc
         8dAPAtCVm3SPn7bAE592eZiBfoF8E7xfNRaqtNZYurJbJRIWiuQMAQTWDksus6RSx66F
         rpQ8LU2lcEpcVi3Guoox95TuCCSo7gJxLxJCGxIk17pH9MdqfwQlLRRnBUZ0v6p4hGQ2
         YmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700760658; x=1701365458;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vwPN2hypCUQWCsULpj9bVM2BJNth0pNf1bvC0uKO+qQ=;
        b=DEAOZ7avOaXXwqLv7zRr60hHGNCqMqySrFs8wlvMiVEphyuAz0CYfAvVsG6hS8jLeR
         uaQh6e/h+244p62QmnJ0objAvqY6lUsG+R0FMYyWw/fgw3epuP1IomVdF7OgyQV5c62F
         l6CdnAQVC/zNYv/utkXJ0z4WjzKL/gSbCLwDls72ITL3YmGAAq7Q3fELYsM2Z3vtezXY
         EKbc1li8XBZ/smFtb8qMqbkzfYBIy9hRnN+r6sFUPHTwuCTF9eG5Cy0lo1B+giBPgGcs
         lrFLUmE9tj9KVp7276xwEs9eOC9I7wW3bn341wwqnJQZ5xhzsQZCCksPOJ4bh+aefVd5
         2sMA==
X-Gm-Message-State: AOJu0YxcIlIxB0BEp5muCpkHZ7BORGyzDtrebDIez7Jx1pi0xkwJnNlE
	4n2e0xdkHN/+Rbf1FikW8nuVFRAW
X-Google-Smtp-Source: AGHT+IG+zuJqouHrqIfpLrz3vvIvd3tSx0M7HEyzYwm+rZb9zqvESyR0oRsPuqig00AAycTQe0XoPA==
X-Received: by 2002:a05:600c:35d5:b0:401:bcd9:4871 with SMTP id r21-20020a05600c35d500b00401bcd94871mr235048wmq.21.1700760658524;
        Thu, 23 Nov 2023 09:30:58 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.165.237])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c359200b0040b360cc65csm2613436wmq.0.2023.11.23.09.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 09:30:58 -0800 (PST)
Message-ID: <2db81947-648f-421d-86f1-b48cdab55852@linaro.org>
Date: Thu, 23 Nov 2023 18:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.0 01/11] qom: Introduce the
 TypeInfo::can_register() handler
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-2-philmd@linaro.org>
 <dc8664c2-c1d4-4e11-8bcd-9465a2d97174@redhat.com>
 <59101052-6446-443c-8934-581b90a9bd2b@linaro.org>
 <010c573d-17e6-43be-bb8f-6c3ff934bf4a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <010c573d-17e6-43be-bb8f-6c3ff934bf4a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Nj7ANStLYvVt

On 23/11/23 17:24, Thomas Huth wrote:
> On 23/11/2023 17.03, Philippe Mathieu-Daudé wrote:
>> On 23/11/23 16:09, Thomas Huth wrote:
>>> On 22/11/2023 19.30, Philippe Mathieu-Daudé wrote:
>>>> Add a helper to decide at runtime whether a type can
>>>> be registered to the QOM framework or not.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>>   include/qom/object.h | 4 ++++
>>>>   qom/object.c         | 3 +++
>>>>   2 files changed, 7 insertions(+)
>>>>
>>>> diff --git a/include/qom/object.h b/include/qom/object.h
>>>> index afccd24ca7..0d42fe17de 100644
>>>> --- a/include/qom/object.h
>>>> +++ b/include/qom/object.h
>>>> @@ -372,6 +372,8 @@ struct Object
>>>>    * struct TypeInfo:
>>>>    * @name: The name of the type.
>>>>    * @parent: The name of the parent type.
>>>> + * @can_register: This optional function is called before a type is 
>>>> registered.
>>>> + *   If it exists and returns false, the type is not registered.
>>>
>>> The second sentence is quite hard to parse, since it is not quite 
>>> clear what "it" refers to (type or function) and what "registered" 
>>> means in this context (you don't mention type_register() here).
>>>
>>> Maybe rather something like:
>>>
>>> If set, type_register() uses this function to decide whether the type 
>>> can be registered or not.
>>>
>>> ?
>>>
>>>>    * @instance_size: The size of the object (derivative of 
>>>> #Object).  If
>>>>    *   @instance_size is 0, then the size of the object will be the 
>>>> size of the
>>>>    *   parent object.
>>>> @@ -414,6 +416,8 @@ struct TypeInfo
>>>>       const char *name;
>>>>       const char *parent;
>>>> +    bool (*can_register)(void);
>>>> +
>>>>       size_t instance_size;
>>>>       size_t instance_align;
>>>>       void (*instance_init)(Object *obj);
>>>> diff --git a/qom/object.c b/qom/object.c
>>>> index 95c0dc8285..f09b6b5a92 100644
>>>> --- a/qom/object.c
>>>> +++ b/qom/object.c
>>>> @@ -150,6 +150,9 @@ static TypeImpl *type_register_internal(const 
>>>> TypeInfo *info)
>>>>   TypeImpl *type_register(const TypeInfo *info)
>>>>   {
>>>>       assert(info->parent);
>>>> +    if (info->can_register && !info->can_register()) {
>>>> +        return NULL;
>>>> +    }
>>>
>>> I have to say that I don't like it too much, since you're trying to 
>>> fix a problem here in common code that clearly belongs to the code in 
>>> hw/arm/ instead.
>>>
>>> What about dropping it, and changing your last patch to replace the 
>>> DEFINE_TYPES(raspi_machine_types) in hw/arm/raspi.c with your own 
>>> implementation of type_register_static_array() that checks the 
>>> condition there?
>>
>> This isn't ARM specific, it happens I started to unify ARM/aarch64
>> binaries.
>>
>> Types can be registered depending on build-time (config/host specific)
>> definitions and runtime ones. How can we check for runtime if not via
>> this simple helper?
>>
>> Still ARM, but as example what I have then is (module meson):
> ...
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 1e9c6c85ae..c3b7e5666c 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -744,7 +744,8 @@ static void aarch64_max_initfn(Object *obj)
>>   static const ARMCPUInfo aarch64_cpus[] = {
>>       { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>>       { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
>> -    { .name = "max",                .initfn = aarch64_max_initfn },
>> +    { .name = "max",                .initfn = aarch64_max_initfn,
>> +                                    .can_register = 
>> target_aarch64_available },
>>   #if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>>       { .name = "host",               .initfn = aarch64_host_initfn },
>>   #endif
> 
> Picking this one as an example, I think I'd rather modify the for-loop in
> aarch64_cpu_register_types() to check for the availability there... 
> sounds much easier to understand for me than having a callback function.

OK.

> Anyway, that's just my personal taste - if others agree with your 
> solution instead, I won't insist on my idea.

This is a RFC so let's discuss :) I think there is a need to filter
QOM types at runtime (at least in "Single Binary" or "Heterogeneous
machines"), but I might be wrong.
Maybe we can filter that elsewhere (here seemed the simplest / more
natural place). I'll keep looking.

Regards,

Phil.

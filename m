Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp587534dyc;
        Thu, 3 Jul 2025 07:46:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzr9E7d9k19VMsQw2w/VjT1EzQIsUmSqOQ4d5m3yDq6vjxiZrdve7fhjJ9YxZMVpS4KcfCenRVu0XmmQ==@linaro.org
X-Received: by 2002:a05:600c:820e:b0:43c:ec4c:25b4 with SMTP id 5b1f17b1804b1-454af1d8088mr25461035e9.10.1751554011713;
        Thu, 03 Jul 2025 07:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751554011; cv=none;
        d=google.com; s=arc-20240605;
        b=WRZjzk6CqxP47zG9E9NTIyDUnZGsVbBlowqbnRw3rq0pmu2cqECqFoFWf4UHP/3H9T
         dx62EHg0p6KvoeiTz+G1wUvJe5lxXJuzk30BixBYkxopO0vH46bFYfcY7bep8m0FDfTb
         pgNNs6h7+Q85mQb1+tvZOZdLAQzZXMEhr/ryZUWFF4CaBoTJliie5ue3605KH9SB0EEQ
         IbNZIafHPz9nrW0Ag17fbrjg58OpAE01jPavszr901xcATeYpEyXXxENToWQXrK8BKaw
         C1HdRQ4txjWhlLsmmazgoR6tcUz9PAIG4o+pi2mA+ctFy491xnYPMKWTCbquGV+lD7mY
         SLjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BcGz55w59YWt1Euim5nr6K8+orikmC4If+SmL5rAAME=;
        fh=6/ZhGrSr7XyiunA+GhBk2fdmOc66sGzepsmGpwUe1OA=;
        b=WUCk2pCL3HbZv0ZRX+H6pAIONduS6wRE7GtfudKP/zF22y4VFYaKxORH3MVYno5CP8
         xYJ0DFncKTH/fQOQGkVaf74Y3/hcBh/a4PHFJrBaAkuYCniKw2zkaa8Vb5ixPype2Nf6
         LaxqWGxH5MQ91ooGT10Nc2417uWGBy5VCgjn3HW/RmoseZ8CZQgnRtDo/iihI8UQOGy4
         K53ncgFnV7p65Auqps6+KDvFIaFrbykRqbhhaArzt1PrXN3ozFRaG1/KgIti8sbA9Fk6
         qMGUi3sTrCoX0Rh6z6UBnTTApW3OXUirDRffb11puGJQBS1YxwQF05O3gvr/ubzI1nOu
         Rs+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cAbL7/x5";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4538ede9872sor55017885e9.9.2025.07.03.07.46.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Jul 2025 07:46:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="cAbL7/x5";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751554011; x=1752158811; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BcGz55w59YWt1Euim5nr6K8+orikmC4If+SmL5rAAME=;
        b=cAbL7/x53mDEMcGLCELKE2Q/XZUHdSayRKfSUFJWvIY4Cd4rokB1pglv3pKMGIQtIq
         rg7hV1OIpv06IntpCvng7EimpaLLqVRowMSII1YJbHFCb40EsB/DmX9KiFQYxrMphXMf
         UFJeNbo5IwwD19Lv/9XXbW/zfhEl0EfvJypBsmCXuSeqxgeJE6DD2FwSqxXI0x90N/TO
         A6S+apeZl27qORFNr4j4bnJ+VG31OKL2hlxeWvmfB3UtQ0+H+gamnOg9nqjvZlMsekm/
         KyNj6JW9qMo7TA0W9LrbmtreafZ7ikxuEf60Q1PB1R2BQ/M+XKBVbCAk/Xj03VpQXs3g
         KR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554011; x=1752158811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BcGz55w59YWt1Euim5nr6K8+orikmC4If+SmL5rAAME=;
        b=SGvmq462c6ZWKlpwz3nlaTyvUy9fn3w7EKjXejWDvxtDXhNdjn6BDK/6+Dbbb1ca6k
         WZnks4A/EB05hZG2QChBRnAsMpWX/kkRb94SA6UrirTycIuOcIQrmGz57mzwexmYOXyj
         rtdfZhM+E+deiiRLv0xDXMaq03WbUCNKV3uPXcjO07/hoPMPnNkOhGNnUaTzJUbG+FzA
         20hjx+BasmFPCH4XfW84m6ll6tQR1zVb6j6xFWy1HpEKEjY+cUFw9c7d6ZdEMPb5IDMD
         XFD9kWiuJyde/tDEYyWbWY0fnhxTLC+DtjfZ54A8DA7IHk9m9NBxnRSQreq5lwcAFuoI
         D3QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPFPniGduvXEGbEUBmOOuHBFBKs1mL2yFGbbRBeYmmzYMKLVFMQgysGKl7yn4CfsIiLYrR2FJreKOaqA==@linaro.org
X-Gm-Message-State: AOJu0YyOiUV7bMLDOnzt1gP7Pg14ty8rU3tYyfKt9NZsPtItycigQ/Sd
	w+x0+coy5l4kr8W711dpsplVqWI4tPPGaqPIG/lDXslUN8lQpcd7lQyBovfzpzSepDJJng==
X-Gm-Gg: ASbGncvhANHB8aKTOY4LXmh32YDLuDUXc7qsfwDUHMuR2afLg2tCE7XhuwOA9OtjrWO
	RMAoPcgshxbg0VvQ0M6PiV55SX/IfduGWSu3ql6ou2OfWKTpiiggwnfiG9hS0zkeUIG0+JnHcJB
	9JpTh17e1plYJukFGACldfT5vQzg5MUGo3xKQCOyfM4kNbKRgbEzhanlvY5IQv2wd+Y5sndMPLG
	GwoSe9PPR3z9iFW3Ox/iI/No3lm9SpxI65Mgx2MUaUVIx8V+GXuzkTyX7MbqxvkpamvbGwLbFFH
	mDx0Wm3b1SA6sd++zTLZD4TFVEuh3QWXTB/yTZF/KKDbUogViAzQZCmqXCCdnQq3YW0eHw1wnfo
	mYVCKRETLU6g4z3I5jh0nHOJAXS9/OQ==
X-Google-Smtp-Source: AGHT+IHvMWtjH1+AiR8aOx6oFZN4XcRnQW05gxpTDKHmHDoS6vbn6KlCaKQgBpMcCZmZSsP/tHlapA==
X-Received: by 2002:a05:600c:4754:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-454ac6122a3mr32948425e9.3.1751554011011;
        Thu, 03 Jul 2025 07:46:51 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ad2sm18590233f8f.48.2025.07.03.07.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:46:50 -0700 (PDT)
Message-ID: <e9d806f6-95e1-4bee-be41-46baee9a251c@linaro.org>
Date: Thu, 3 Jul 2025 16:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 47/69] target/arm: Use generic hwaccel_enabled() to
 check 'host' cpu type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20250703105540.67664-1-philmd@linaro.org>
 <20250703105540.67664-48-philmd@linaro.org>
 <364dc354-ba78-47c6-ac65-2c0282e28733@linaro.org>
 <CAFEAcA8-ucEJPgVLpBfNyMo8ax-sR6iYr5Zk4DJavYaOkQnfDA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8-ucEJPgVLpBfNyMo8ax-sR6iYr5Zk4DJavYaOkQnfDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kprM5KAG8RRA

On 3/7/25 15:46, Peter Maydell wrote:
> On Thu, 3 Jul 2025 at 14:45, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> On 3/7/25 12:55, Philippe Mathieu-Daudé wrote:
>>> We should be able to use the 'host' CPU with any hardware accelerator.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>    target/arm/arm-qmp-cmds.c | 5 +++--
>>>    target/arm/cpu.c          | 5 +++--
>>>    2 files changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
>>> index cefd2352638..ee5eb1bac9f 100644
>>> --- a/target/arm/arm-qmp-cmds.c
>>> +++ b/target/arm/arm-qmp-cmds.c
>>> @@ -30,6 +30,7 @@
>>>    #include "qapi/qapi-commands-misc-arm.h"
>>>    #include "qobject/qdict.h"
>>>    #include "qom/qom-qobject.h"
>>> +#include "system/hw_accel.h"
>>>    #include "cpu.h"
>>>
>>>    static GICCapability *gic_cap_new(int version)
>>> @@ -116,8 +117,8 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>>>            return NULL;
>>>        }
>>>
>>> -    if (!kvm_enabled() && !strcmp(model->name, "host")) {
>>> -        error_setg(errp, "The CPU type '%s' requires KVM", model->name);
>>> +    if (!hwaccel_enabled() && !strcmp(model->name, "host")) {
>>> +        error_setg(errp, "The CPU type 'host' requires hardware accelerator");
>>>            return NULL;
>>>        }
>>
>> Consider the following hunk squashed:
>>
>> -- >8 --
>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>> index eb8ddebffbf..bdd37cafecd 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -456,7 +456,8 @@ static void test_query_cpu_model_expansion(const
>> void *data)
>>                     "ARM CPU type", NULL);
>>        assert_error(qts, "max", "Parameter 'model.props.not-a-prop' is
>> unexpected",
>>                     "{ 'not-a-prop': false }");
>> -    assert_error(qts, "host", "The CPU type 'host' requires KVM", NULL);
>> +    assert_error(qts, "host",
>> +                 "The CPU type 'host' requires hardware accelerator",
>> NULL);
> 
> Grammar nit: either "a hardware accelerator" or "hardware acceleration".

Fixed, thanks :)

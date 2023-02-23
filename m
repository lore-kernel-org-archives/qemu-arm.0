Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1207736ejc;
        Thu, 23 Feb 2023 15:22:04 -0800 (PST)
X-Received: by 2002:adf:e58f:0:b0:2c5:a07e:4bb6 with SMTP id l15-20020adfe58f000000b002c5a07e4bb6mr11139135wrm.33.1677194523900;
        Thu, 23 Feb 2023 15:22:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677194523; cv=none;
        d=google.com; s=arc-20160816;
        b=Tyiq/8P30H26PJY979vuBXfHEVZjNlSYYXWKAOshOk2sBcmxFoEsli+CEHTHNhCsu+
         lA10VLVDoqWfoDubwbZ6uXCzHYknvIAPvxZoPSfIrp2NIXAFQQSUww8JMr7/V8J/kyp4
         F268JOUACSjDwXR6WPSTfGnPVUH2b38hz0tyIqtbZGFrlL2Y+r0v9p/FHnuH25OQiOPd
         5d5XPV77KpKWmE1xBjoVckJ2XL6VHRccybR8VcET1BhkJBy7u8pJYeRoGsEVTTj9LNNY
         KOtOWO16GeQVHLtb8Mna8GnCgOc64CMKtulLS+cihb4+oCCXM99fblrdrKTf7Cn8UR8Q
         +M4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TnfgXFouRjSyBUE1Cgw64cctFYm369u2rVGcZHiFkzE=;
        b=a7thg+pp9KpyBNXpIth3QlD62fJy5bVz8/OcsYafE42R5JaB4ogj2WHj6Q3OTjo86e
         Phnc/v3xfhmnYm9UNw8zHyE4YDiiANZdl7AYu1b4BmQkqO3ne2BR2CneXt6GFyOYwq7c
         6jkMYjnzowyU4pUemQ+Nge7RV6W/c8UHTxegh4ySkiLtvQf2j5S2J5k7wg/za/eEB1DE
         JfTJERL55KlTyaB4O6+N9fwYRpNs6bcim3aa0lDegIO68Irt/cXUvQIJNCwK2gYbSGnz
         T2XP2dANe8Cu0Hqfx3UW/JtUY7YoTZtwEAGzR88j8vtwhwbfGmYW9gmj9CK/e0i95/St
         KqbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Elt7j5ci;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r10-20020adfe68a000000b002c59f186752sor4685466wrm.16.2023.02.23.15.22.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Feb 2023 15:22:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Elt7j5ci;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TnfgXFouRjSyBUE1Cgw64cctFYm369u2rVGcZHiFkzE=;
        b=Elt7j5civmiaEAEm1MnJe7hZ3PWH5dlzbB6zru7ZzFz3eBAbkZa8zNqYOPs3Q7y8vS
         TVTiBGQM0Np/3sQic3BqwJQipHwDfJ0Dy+CGxgDkmVqjqMLE2HtvRdUZ5NabNJuXLU66
         mMIDQ0bxvDX4co1viGwcEeu2nKPlaKkZjhToDX0POWdKjygXjJCR3U8D9mL6Npcjz3kl
         GTnDtoAcJdvysYusDSJoCRw0NO8vVRU4w5J/uefjoefHKIUR3Lju9kuU3CXBOiXkDfA8
         5olEbfCQBoFpq3j/FCxINSjNcJkOJJYap+HOIlG/zsqmMDv5A9shqYkd7dx0nQt2/c8B
         OSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnfgXFouRjSyBUE1Cgw64cctFYm369u2rVGcZHiFkzE=;
        b=Uf1WmbAizkU4/N0+QlVIsEh/DNvmyfNlmwywDHmFX3vZ7p/xvAgVdz+R8CL91b7aqh
         Cngya/OEl8PVwWSbCGuK4TBGnck/hifaLdnLDLj4ATHNPz4OscKLQDYJKNaE1yxeg/aP
         0rwQ9sfXwsjfO9yVV0/gg30MXE6fHSyBwxSO5qLYbVlO8xNIxM67UXD68/3ejnnzqQBB
         UffBTakC4rcoP9ZowLSi0M/mAEqk9XZZ9IhhSy+j0lEeS7fc8X8ZlFIrTiXK4lyPvlzW
         rtsFFW8JmgiiBkIDU9WBGltZqQiDoKgIl9gFAb4zSIxIYO0za1l0qAyWlM39JNf9uTqL
         pBsQ==
X-Gm-Message-State: AO0yUKWJsgAu0bJyWBpyuIEIzrjirvmh7ykr/GZwu32kq7E57BSJPF3G
	RkU+qIR9Y7w41ojxeaV3dy/f6Jyj
X-Google-Smtp-Source: AK7set+GMjFYZPnUBEkiuUABMwVp9fX1gayCwprrDFUll86ghhBShlth37yDH4I7aWCUUIw0aFVakw==
X-Received: by 2002:adf:cd12:0:b0:2c6:5972:cd0d with SMTP id w18-20020adfcd12000000b002c65972cd0dmr11846823wrm.3.1677194523519;
        Thu, 23 Feb 2023 15:22:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003dc5b59ed7asm754563wmc.11.2023.02.23.15.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 15:22:03 -0800 (PST)
Message-ID: <79c0ce60-5a98-b456-d045-7dd09a91a431@linaro.org>
Date: Fri, 24 Feb 2023 00:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: s3fyRVeLVpwz

On 24/2/23 00:01, Richard Henderson wrote:
> On 2/22/23 01:01, Alex Bennée wrote:
>> This is a mandatory feature for Armv8.1 architectures but we don't
>> state the feature clearly in our emulation list. While checking verify
>> our cortex-a76 model matches up with the current TRM by breaking out
>> the long form isar into a more modern readable FIELD_DP code.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   docs/system/arm/emulation.rst |  1 +
>>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>   target/arm/cpu_tcg.c          |  2 +-
>>   3 files changed, 28 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/system/arm/emulation.rst 
>> b/docs/system/arm/emulation.rst
>> index 2062d71261..2c4fde5eef 100644
>> --- a/docs/system/arm/emulation.rst
>> +++ b/docs/system/arm/emulation.rst
>> @@ -14,6 +14,7 @@ the following architecture extensions:
>>   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>>   - FEAT_BTI (Branch Target Identification)
>> +- FEAT_CRC32 (CRC32 instruction)
>>   - FEAT_CSV2 (Cache speculation variant 2)
>>   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>>   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 4066950da1..12e1a532ab 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>>   static void aarch64_a76_initfn(Object *obj)
>>   {
>>       ARMCPU *cpu = ARM_CPU(obj);
>> +    uint64_t t;
>> +    uint32_t u;
>>       cpu->dtb_compatible = "arm,cortex-a76";
>>       set_feature(&cpu->env, ARM_FEATURE_V8);
>> @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>>       cpu->ctr = 0x8444C004;
>>       cpu->dcz_blocksize = 4;
>>       cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
>> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
>> +
>> +    /* per r4p1 of the Cryptographic Extension TRM */
>> +    t = cpu->isar.id_aa64isar0;
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
>> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */

Maybe:

         assert(t == 0x0000100010211120ull);

>> +    cpu->isar.id_aa64isar0 = t;
> 
> Ok, so, this might be helpful for grepping, but it's not helpful for 
> reading the documentation, which on page B2-137 uses hex.
> 
> 
> r~
> 

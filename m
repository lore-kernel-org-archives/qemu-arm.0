Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1211140ejc;
        Thu, 23 Feb 2023 15:27:19 -0800 (PST)
X-Received: by 2002:a17:903:70c:b0:19c:d0c9:8ff6 with SMTP id kk12-20020a170903070c00b0019cd0c98ff6mr882917plb.60.1677194839245;
        Thu, 23 Feb 2023 15:27:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677194839; cv=none;
        d=google.com; s=arc-20160816;
        b=UPKT7LRsaUPXw2OZVAoTBT9kZiB2sP19+d86mgeEr3u6mA0mEqMsXDAfGFxwTVzJV7
         S1KKD0jGdhk3zBnLJeULmDvQe1ZjMNk0/A/hBJR04uT8Pu+kqJC/AgJDpAcnL8Vdp+KZ
         xCuztQcBpYXsbGzURawRrm+nbTpuSdWCNuYpVZ7TdNDDwSy0AoiY+KNNmYeCttKc2nTS
         njPC9cKaSBeCXcItA56J5o3FKO+vPoAC8j2zHU46nR1udvOhDGa16Qn/K5euodsieMcD
         TIpf84dxMRZaai8RkWAGssA+n/sTqbLm6w7dKs5+de6QEYOnymWjtImvFzq+mWR+tWpO
         zjHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1CAij8B1JC5qjAK2zLgF9bUQDox3nB/5a3+DWH2Z+EM=;
        b=cMsc7X1r40mrUoJcUFcRF/vDZmh1mMD7B/q7A+DEtodhM+G6OOSderi3lwtU1SQppQ
         Ief+GFzUOa8AFnVcan2QKrO0/IoBsjw/9eSZlGfMnRtWRYV3LRZdqDaQ8cZJAZiL8d0G
         lbedcw69b4GI8obyGyOyFGex4641iXghgxJb/lgyqR/CtoQdPrtcf3QO1rDlCdyyxLAt
         6YS/vikaIujnQNwX1LTHApoVPJcjXAIGHswHvi5/m3Y5JgJu2+VMwWz4fAxqPzwQ7DWW
         7pAAMQj/CJXFtWbEKBMPaOV4vo5JN2Gx6g90D4ml/5CIJmzhNkO3TF62dKaSCVKbc8kX
         jSqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nzN28CTQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o3-20020a1709026b0300b0019c904da4d7sor4583553plk.55.2023.02.23.15.27.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Feb 2023 15:27:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nzN28CTQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1CAij8B1JC5qjAK2zLgF9bUQDox3nB/5a3+DWH2Z+EM=;
        b=nzN28CTQODANhSL0pw0ooE18uipedkemR9YY/zAwmnC+UmH6uXfad8ucZ5jOtY5aRX
         xXh4FjYFeAgwLAYCih3xB0GwBcc8FuViKLgkuE0HkBMR2ueiiE51BlQROdJ4zvgmQgAO
         HlZTq70WBrPKxGmEWYSfWu9r0sZnQiBBt4Dg7JH10mergGLRSkCFHuYkwvdPrZKRSgrQ
         fGiL6lor4rT3KsAreI493NJpWb+AdaxFTjL5SaoK5HM4s83jwaLw/ZZ9qfEswxVDp2XC
         BEcrfhT0l+uYML9ufSQbTA48mrvloGL0iZIt56dkZfbvv2tptMGFx33V9+5EmnozgbnU
         n1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CAij8B1JC5qjAK2zLgF9bUQDox3nB/5a3+DWH2Z+EM=;
        b=z2kL3FIH0bneXYXE2lp5Y+Pgwa6WpEIk+2x0P9WU5W8e8eikTe7blh0557sII9ipQm
         agCTrxk670Xjobn36Im10JxbDuVhZkXHNlNieyaBjSXT+P52vNGAykRr2eqWkUj8xo2K
         b4zelKRlLfy7Y9oXLTwNT8dunWSuyET06g6UU8k1BTR9fs0llpWzi4doN15rzcBkMKof
         dEXjYbUWScxF2Sg4Ka/UGz6nxudKfMdfAKX2D7Rrsi9bJGhJoH4e8iXZKAUbk4J2g6KM
         JAiMSMFdcZjgA2SyYWCeznCcofjAyxGC0hLWFDJv2/J2mC/DOB4Y4vqqqz1kW20UCA/E
         LKCQ==
X-Gm-Message-State: AO0yUKUeJwsJ33B7dIwwx4zJOdgp36MatjZVtHIjx37C8soFzRy9NVdC
	dPfEO5ZBimCyEYWoob68qahm1doB
X-Google-Smtp-Source: AK7set80oiwzLnZQM/7Vn4n0JnchbWiKydACAWamUhvUj1PS7QXrbQF8QFMUT7SWj/Qfz//qrPBlJw==
X-Received: by 2002:a17:90b:3b90:b0:233:f65e:8f17 with SMTP id pc16-20020a17090b3b9000b00233f65e8f17mr13280215pjb.49.1677194838645;
        Thu, 23 Feb 2023 15:27:18 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id v14-20020a17090a088e00b002311c4596f6sm209090pjc.54.2023.02.23.15.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 15:27:18 -0800 (PST)
Message-ID: <ada81122-40a3-3905-8241-3a31b3b59997@linaro.org>
Date: Thu, 23 Feb 2023 13:27:10 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
 <79c0ce60-5a98-b456-d045-7dd09a91a431@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <79c0ce60-5a98-b456-d045-7dd09a91a431@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kZ/6P2zF8SPv

On 2/23/23 13:22, Philippe Mathieu-Daudé wrote:
> On 24/2/23 00:01, Richard Henderson wrote:
>> On 2/22/23 01:01, Alex Bennée wrote:
>>> This is a mandatory feature for Armv8.1 architectures but we don't
>>> state the feature clearly in our emulation list. While checking verify
>>> our cortex-a76 model matches up with the current TRM by breaking out
>>> the long form isar into a more modern readable FIELD_DP code.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   docs/system/arm/emulation.rst |  1 +
>>>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>>   target/arm/cpu_tcg.c          |  2 +-
>>>   3 files changed, 28 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
>>> index 2062d71261..2c4fde5eef 100644
>>> --- a/docs/system/arm/emulation.rst
>>> +++ b/docs/system/arm/emulation.rst
>>> @@ -14,6 +14,7 @@ the following architecture extensions:
>>>   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>>>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>>>   - FEAT_BTI (Branch Target Identification)
>>> +- FEAT_CRC32 (CRC32 instruction)
>>>   - FEAT_CSV2 (Cache speculation variant 2)
>>>   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>>>   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
>>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>>> index 4066950da1..12e1a532ab 100644
>>> --- a/target/arm/cpu64.c
>>> +++ b/target/arm/cpu64.c
>>> @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>>>   static void aarch64_a76_initfn(Object *obj)
>>>   {
>>>       ARMCPU *cpu = ARM_CPU(obj);
>>> +    uint64_t t;
>>> +    uint32_t u;
>>>       cpu->dtb_compatible = "arm,cortex-a76";
>>>       set_feature(&cpu->env, ARM_FEATURE_V8);
>>> @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>>>       cpu->ctr = 0x8444C004;
>>>       cpu->dcz_blocksize = 4;
>>>       cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
>>> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
>>> +
>>> +    /* per r4p1 of the Cryptographic Extension TRM */
>>> +    t = cpu->isar.id_aa64isar0;
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
> 
> Maybe:
> 
>          assert(t == 0x0000100010211120ull);

But why bother to break it out then?


r~

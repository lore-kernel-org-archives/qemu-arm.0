Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1632114ejc;
        Fri, 24 Feb 2023 02:28:36 -0800 (PST)
X-Received: by 2002:a5d:458b:0:b0:2c7:7b3:36c6 with SMTP id p11-20020a5d458b000000b002c707b336c6mr8886396wrq.52.1677234516668;
        Fri, 24 Feb 2023 02:28:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677234516; cv=none;
        d=google.com; s=arc-20160816;
        b=YQNUwQhPXhhMJZGNLppyLZSE3EUBciebrbv6vo+Bsq2xsYl/eKfnDMYPc89Bebs7Uq
         XMpSMcd9bZTuNqzYb6FTMSSYn4+oYmzuV2xu5jNKVXOj+5oUahOZR8zP/6xrHcddSmjD
         08BHWAbRTYWw40WsJCp+zIy/0VVv8z1dYOI+eJIm+Z/iApm90y6lc+Y9IbZbXtbLjpw2
         qEvKdHrmQDs+eqpoi0sqyIxM9ys3HlJV/a2jCkx4oHdDmUxylokQLbSHWoGZbGRAALjl
         4/GN7ElfA0qaw8pCX1WUGeFTbTZggtvSxp1yaGJ5OEglZr1udUdTMmPJOd7+pwZwvRQb
         Bmzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yKAAdpm6bQTRP12zOuVjb/jL0qipq6fVznSYvUBB3U4=;
        b=X8x9mHvnw8p4Bw3+RSRVc/gRutLEpDbckluh5TOrfWh34wcufnwL4yUf/gAp8Shhsc
         VtCQAs7brys6SJP1yKxhrey+CTqJS884czidG5J1f8VZv+RtYZR4pdXNyknG9atJcqKL
         rV+c1NzKV9urMx7bmXw8FWGqCN13n634cw1fhGfmdHxK2XiPheB0QOHXZZDH/lZ+EbHQ
         Thq2nX6xbHJ6G2SzzCVD4kj0iIG/yLMpQ5eC9R5+dD25XDvCY9lp7u1U7NvTCQpio+sC
         b31UijtDCWVWmGzMkKc1XffNuMYfwDtsQAfIbgQl3QDXHHX2UecUhq1sVuefBfAMXlIT
         3uiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BdBO8Hrd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l9-20020adffe89000000b002c57b143da7sor4445884wrr.79.2023.02.24.02.28.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Feb 2023 02:28:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BdBO8Hrd;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yKAAdpm6bQTRP12zOuVjb/jL0qipq6fVznSYvUBB3U4=;
        b=BdBO8HrdXX86VZP+YM+Y8F7KavLir80t5yj0J0jotkNSqIc76Fl5it1OOKQn2bCk+o
         wIAVLzDCU8TiS/dUuJoQZSpuVw8ery7BZ5Tv9KUWUR7wc55/5Qyyda2dtqWgbqH6rvHa
         Zod33ys61QtZz+XutCGVuDegIb3juhhsujXIVvnulHLR+Zhl3Yzf2xxPSmLHAV72Rh3g
         aQ5WXIYrUhw3/xVZ6cICme8PNGOVBgQH/H5xc0/017PJVJxrA6a2ygW2a4h4IZKTB1oY
         8LDJCvcHccDs0s+FKWU0wBKseFBPqvWs8m6OL7BP863idt8VtfJEX7bKl8RCTeAoVtG/
         1yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yKAAdpm6bQTRP12zOuVjb/jL0qipq6fVznSYvUBB3U4=;
        b=TAAd/mUX5x6zmpsN3TC37aYBpJZT98P0cncU8X/ICvC/T/tSLb2AcenaX5KnBTXik2
         eI0G53PcdQ5LN5DUOQ8AJWm1ZMr4pk1krP2a7lIK5pwEGO21Ixabc/Qr03ZRixB1/v6n
         Qdc3lC5paKfFirI4aNwF6foJupGunOJiHIT7DgBtRXsfyoKZIS4MZCa+aeJKSN3u9gI5
         kfHYGa7lKfFHIWBEFL6Dqmf803CLqTwH3sg/kLW3SnZ1+GdCTZDAT89S5xU6TkZ0ybp9
         CrduoliX8+u6maeuoPRhXqWxxl0XVEODwmCSA0DVCLOJvvbV7uozHsYXpFs2q+QxEIjm
         fELA==
X-Gm-Message-State: AO0yUKWYr/NdhWDzGi7Ew0yFh1sZzGdlYFXciaNsHbeplenDx4ArX1Y2
	+nL8M93/koOsV3Wp1bsBLE8PbVYawA4QjfDz6Ok=
X-Google-Smtp-Source: AK7set/2RsOd2juOjPoFKmhoEUK+FtRrZC1NUCiNq+is/gwrkzCTm96JRD0tKnuVr6J/hczCrGg0CQ==
X-Received: by 2002:a5d:4b46:0:b0:2c7:6a6c:c72a with SMTP id w6-20020a5d4b46000000b002c76a6cc72amr580082wrs.48.1677234516372;
        Fri, 24 Feb 2023 02:28:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n11-20020a5d51cb000000b002c5804b6afasm9554057wrv.67.2023.02.24.02.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 02:28:35 -0800 (PST)
Message-ID: <ff0a967d-7eca-82ec-40a3-1d9b476d025b@linaro.org>
Date: Fri, 24 Feb 2023 11:28:28 +0100
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
 <79c0ce60-5a98-b456-d045-7dd09a91a431@linaro.org>
 <ada81122-40a3-3905-8241-3a31b3b59997@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ada81122-40a3-3905-8241-3a31b3b59997@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 37FTrxBtuEz6

On 24/2/23 00:27, Richard Henderson wrote:
> On 2/23/23 13:22, Philippe Mathieu-Daudé wrote:
>> On 24/2/23 00:01, Richard Henderson wrote:
>>> On 2/22/23 01:01, Alex Bennée wrote:
>>>> This is a mandatory feature for Armv8.1 architectures but we don't
>>>> state the feature clearly in our emulation list. While checking verify
>>>> our cortex-a76 model matches up with the current TRM by breaking out
>>>> the long form isar into a more modern readable FIELD_DP code.
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>   docs/system/arm/emulation.rst |  1 +
>>>>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>>>>   target/arm/cpu_tcg.c          |  2 +-
>>>>   3 files changed, 28 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/docs/system/arm/emulation.rst 
>>>> b/docs/system/arm/emulation.rst
>>>> index 2062d71261..2c4fde5eef 100644
>>>> --- a/docs/system/arm/emulation.rst
>>>> +++ b/docs/system/arm/emulation.rst
>>>> @@ -14,6 +14,7 @@ the following architecture extensions:
>>>>   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>>>>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>>>>   - FEAT_BTI (Branch Target Identification)
>>>> +- FEAT_CRC32 (CRC32 instruction)
>>>>   - FEAT_CSV2 (Cache speculation variant 2)
>>>>   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>>>>   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
>>>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>>>> index 4066950da1..12e1a532ab 100644
>>>> --- a/target/arm/cpu64.c
>>>> +++ b/target/arm/cpu64.c
>>>> @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>>>>   static void aarch64_a76_initfn(Object *obj)
>>>>   {
>>>>       ARMCPU *cpu = ARM_CPU(obj);
>>>> +    uint64_t t;
>>>> +    uint32_t u;
>>>>       cpu->dtb_compatible = "arm,cortex-a76";
>>>>       set_feature(&cpu->env, ARM_FEATURE_V8);
>>>> @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>>>>       cpu->ctr = 0x8444C004;
>>>>       cpu->dcz_blocksize = 4;
>>>>       cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
>>>> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
>>>> +
>>>> +    /* per r4p1 of the Cryptographic Extension TRM */
>>>> +    t = cpu->isar.id_aa64isar0;
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
>>>> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
>>
>> Maybe:
>>
>>          assert(t == 0x0000100010211120ull);
> 
> But why bother to break it out then?

To keep everybody happy :) For example Alex can grep which cores
implement FEAT_CRC32...

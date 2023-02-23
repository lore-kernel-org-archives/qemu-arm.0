Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1191908ejc;
        Thu, 23 Feb 2023 15:01:19 -0800 (PST)
X-Received: by 2002:a62:7911:0:b0:5a9:c16f:b4ea with SMTP id u17-20020a627911000000b005a9c16fb4eamr11627807pfc.7.1677193279600;
        Thu, 23 Feb 2023 15:01:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677193279; cv=none;
        d=google.com; s=arc-20160816;
        b=VARLEWcS/IXfuLzfDDEEQfnee3rlpy5maE8tm3JrIjPR2bYjuggYSSu0/CAYAFoCR2
         Gary4uSxP1RiW57Sol7MoA2lp7PqtgbE2VXr0OUjG+9lBjS7fJ/qXuDzzrSHgYm5KegD
         xO5/RD1XqX1cXvCbWwAhLtYN7xtfjdPkCj4N4GtE31I974n0zKRG0PaqIyRGDg/NY5DH
         DLzZbPuw4lwlSkJcVLRXJ2k7TClvNLNQQ99cxE94vamTxxeEl+t99c/t+doyMWWrQr2f
         R7A0Yo49MkgjCmIouhCQt44Asc1eP6XsKIKIXftegUqOyYcMzi24V7zm3Jv8JFvuI2Dz
         PXkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OoEe3LAQIxkXdoYinbdEbIJsOrkhLH+r19qzP5aOP2Q=;
        b=LaHvZu1DGtUerKORC3+/m5Tpj+k2LpaBhPYX4kzNDwMhvK0KuKBKdM0DRij+oBGR9d
         0JVeN2FKT55wHxexzuQX4GjSdV3TyRU1DW0prmabOvtwfNo4jndv7XYNPsNsAmeDIpxR
         1d/uNb1vTbQA0kK4fRpaALAHrKu/bF+dmeRnzRP4V9VHP0okFxEqiOzXbhDBdBf0oNbb
         YqHFnZ2oVFLK5jdlKsRvlTJ3io/75im7l0wmeLKci739iHmrifVoa0kpLXvd091DTN4y
         jh0LijTXbsG96++S7Rhjsf+5OQz382nknSY5UDvKFXog59S705lDSh7cQpppEmQyMobj
         MOrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iiCVzOZe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t10-20020a62d14a000000b005d928b94f9dsor1518174pfl.9.2023.02.23.15.01.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Feb 2023 15:01:19 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iiCVzOZe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OoEe3LAQIxkXdoYinbdEbIJsOrkhLH+r19qzP5aOP2Q=;
        b=iiCVzOZeuQ1MFJy3ci2et1wK9IJK+Y4aPgLThZ+4z9s/hEw9AxGtXDe0zy8JT5UUXc
         K5tBqqnns4L56gOkmT9AmP5lt7w7ymRth6o8OIQecA3lzHZYfpqZEAhbeEfEaGA83C3A
         ptchJchZDXWF8DA3w3XIF/X81Ku4p+YQfI7GQ3PNgXpcRWFtzBVCQeFb48mDS9rpTJHQ
         Vjix9PBYK8CJ4bP2spqF+9XdlBuQGenKb8nUe6YxFu0QsN1bbEfrjnCK5eO9MyK/pAh3
         bpmdSwWv6YR5Blhrez8AlCCeDxlj527zygX/JxmrqE6SZg/quY24u4AqPvdb2KKbzray
         HQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoEe3LAQIxkXdoYinbdEbIJsOrkhLH+r19qzP5aOP2Q=;
        b=pOtVYj5vNBvT8PvScVug3miTGFNaJA18YUWtb6PFbwcj9efXJKGn0CW78kFBLxESKG
         01U3ggewPQ7Ln4hOWVKllUMshBWO7eY+Cmy21PCCxEJFmdpOwdAySrZFQPykvdxnO1wk
         VIb7sMAyTnuMCcp7O4Ow1MTgV7I39XB7hoBuZw4QIDVlXi3YR72A2mW0Ozs5T2YJesME
         akfGsKKuTZlGIuEn/gKYVYRMBk5gJaERWkFkoMXkiAgdPStU9WsNZ+hN9aOGEv2v/UPl
         gLNGzuDf9Fonhkm5vei2Cf0fLEg6+Ef1b4Af9z6bzwP69EFmi9UXPJ2xMAuGiEYvfB92
         0BKw==
X-Gm-Message-State: AO0yUKVSP1lss2UNKrnmpVieadP/td0jYPknFy5CSrKbAc0NQwmGIS41
	QHU0fIf7HbqfKTErkZExoBaBISSEQ2HDSljmqZlUz6Jz
X-Google-Smtp-Source: AK7set/SgF9SDI9so6u+NTVcuutjfihPn9dak2Nuzlm9WCPOSwG0sSDGk9ZblcUlEsHW3tvofr8M7g==
X-Received: by 2002:a62:7bce:0:b0:5ce:ef1b:a80 with SMTP id w197-20020a627bce000000b005ceef1b0a80mr7842434pfc.32.1677193279034;
        Thu, 23 Feb 2023 15:01:19 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id v10-20020a62ac0a000000b005dea362ed18sm1435839pfe.27.2023.02.23.15.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 15:01:18 -0800 (PST)
Message-ID: <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
Date: Thu, 23 Feb 2023 13:01:15 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230222110104.3996971-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tcDaZ9h9Vt0f

On 2/22/23 01:01, Alex Bennée wrote:
> This is a mandatory feature for Armv8.1 architectures but we don't
> state the feature clearly in our emulation list. While checking verify
> our cortex-a76 model matches up with the current TRM by breaking out
> the long form isar into a more modern readable FIELD_DP code.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/system/arm/emulation.rst |  1 +
>   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>   target/arm/cpu_tcg.c          |  2 +-
>   3 files changed, 28 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index 2062d71261..2c4fde5eef 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -14,6 +14,7 @@ the following architecture extensions:
>   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>   - FEAT_BF16 (AArch64 BFloat16 instructions)
>   - FEAT_BTI (Branch Target Identification)
> +- FEAT_CRC32 (CRC32 instruction)
>   - FEAT_CSV2 (Cache speculation variant 2)
>   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 4066950da1..12e1a532ab 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>   static void aarch64_a76_initfn(Object *obj)
>   {
>       ARMCPU *cpu = ARM_CPU(obj);
> +    uint64_t t;
> +    uint32_t u;
>   
>       cpu->dtb_compatible = "arm,cortex-a76";
>       set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>       cpu->ctr = 0x8444C004;
>       cpu->dcz_blocksize = 4;
>       cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
> +
> +    /* per r4p1 of the Cryptographic Extension TRM */
> +    t = cpu->isar.id_aa64isar0;
> +    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
> +    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
> +    cpu->isar.id_aa64isar0 = t;

Ok, so, this might be helpful for grepping, but it's not helpful for reading the 
documentation, which on page B2-137 uses hex.


r~

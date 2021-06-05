Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2188890lfa;
        Sat, 5 Jun 2021 11:13:13 -0700 (PDT)
X-Received: by 2002:a62:1481:0:b029:2c1:1e90:c54 with SMTP id 123-20020a6214810000b02902c11e900c54mr10193922pfu.55.1622916793451;
        Sat, 05 Jun 2021 11:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622916793; cv=none;
        d=google.com; s=arc-20160816;
        b=k5nSkCwEM3nLt8yibdXrkxy5fy7hosDi5bEyAaE/3Mrh/gx/r8KTDETyW2i+fgIXj5
         GHSv3K9kI4OuLQ/m9UC7e2pXtpMjHufuBQ5DHFTSg+LRa5VQc7MXidnSXucBjfiz2Suw
         MEKsbV4rmpw1XXgCr1uOmZZPzMUxTu7m8j9und6gWULm/aX6KALGxa7GJ/JqLEykWNR/
         XchXYEeY6xvYlqAlXSHkh/zsuFdBWCGjw3gMrIeUlTziJ3YkJgamiGQYbbVdRehumem7
         R51rovUwqzfttD2O9GY9VILrautEivZBLpomaWWKc7SyjgVHttVV+3sAVkXnFK02RPtn
         8ayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=+Jgk9p8Czxc/HetAphE9a9mdBCtdlvAhzuxOBut2rXk=;
        b=ZwpthAtHbEFshL9F49JmfeJIfaZIeN3S0btUDo0U2RXe8curchRbeXx3hRPjX7DN0y
         JMGqzz39At5L3IX+naluVR64lW6irYMBZ4OPUAJ7Om1yK2Cel/1deRStgY3Bn4AeXEqc
         K/1YAeaNn45lk2hLViy5LWljXuKxaDm41814KMGhiF8pWByy+hqVuKcq6Q1bpqGRLcn5
         N6O6L+PRzgwnmWiin8PCwbMANwbYFcGNK2R4rDCooLt7onpjLvoLkglTx7b/B3YBRJB2
         u53lsWvoOGTe4LAvbNmbjHaPRjmUytWS+ufpWzrtaawLQUD+VztiI/ZxzVOmOx8bac4H
         fpvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mJkd4XUt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p68sor2846282pfp.26.2021.06.05.11.13.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 11:13:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mJkd4XUt;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+Jgk9p8Czxc/HetAphE9a9mdBCtdlvAhzuxOBut2rXk=;
        b=mJkd4XUtgZdsEotfA4cAvSR6+7lB/L8jDDCGe2gonME5ab/d5IZ1Nhk8c97D8pq4ij
         tSGYyqZv5aNPkyXDFjOA7ci4uYFLwTAt0Xy/Da8EQJExgsOUhLmwrrFjo9gRPZ96KUuP
         /ZvI87WQryUeg9VTHtAfr5fCji2yjJI9rN+zDyHcZvlD5H0FkRZcRb8+55I0sqed14Js
         1v7KDwUv++rUBpwumGlgLqh4IkmTdSqbKvuuy6B+TBYtl6KqlSDU4GibqYBQnW0PEN6H
         cTZrSPyi78rzUN8HpAb5v2F6W8KYIEJPNKVkpdogcCq4We/14dV9Mx8nHmDpe3YssWI+
         hOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Jgk9p8Czxc/HetAphE9a9mdBCtdlvAhzuxOBut2rXk=;
        b=NoMNtr8q1UkCKZizy0Ai0Q16S/g3JMqUOcp0qgnEy16SUmoBrWhma0C577zp6xgEqo
         Njs5IfAjf64zWbpHqgU6mfo10MOfN5DZ04I8xqf6DfbAdnoWV6gEO+WkrpRaN83nEbZJ
         +MoJ/w9TAh0Dn/jv/XMgBcGb56KXLPTHPEG3znpG5sP27QWT+I/qmE0kufmUNFMU7YH6
         9XTi3DSDTL0rAGdgWZVHy7Sup77IQMr8s7CfWhg3QA9PidYszw282aDq2SlhQDvFWHEf
         rLII76Lcp2sgawcvznzbghqpO1JmH8X9+RH6kQ1FN8GL2WYLd0y5qEky/uWIOtaJvMzY
         HI+A==
X-Gm-Message-State: AOAM530TL5EU7HDK3Qu74smNUJ6/rk2T6x9ORKH9Q5uEHZy8TRzi35hU
	PYNtL69ColPyrTrA4saUQXsuAWRt
X-Google-Smtp-Source: ABdhPJyaYUMAg5Oh8xNwiIZHHhkq3tjwvACDXfHAMsmKjqPyH4TTOcwUui7M0P4w3Wz7EDV4OAx22A==
X-Received: by 2002:a62:5288:0:b029:2e3:fd7d:267a with SMTP id g130-20020a6252880000b02902e3fd7d267amr10395121pfb.21.1622916792862;
        Sat, 05 Jun 2021 11:13:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id 190sm5010120pgd.1.2021.06.05.11.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 11:13:12 -0700 (PDT)
Subject: Re: [PATCH v16 71/99] target/arm: cpu-sve: new module
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-72-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a105bf1-a64e-f9cd-3ab2-d3ac4157297f@linaro.org>
Date: Sat, 5 Jun 2021 11:13:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-72-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: iBrAvXdmuinT

On 6/4/21 8:52 AM, Alex Bennée wrote:
> +#ifndef CPU_SVE_H
> +#define CPU_SVE_H
> +
> +/* note: SVE is an AARCH64-only option, only include this for TARGET_AARCH64 */

This seems unnecessary.

> @@ -201,13 +202,9 @@ typedef struct {
>   
>   #ifdef TARGET_AARCH64
>   # define ARM_MAX_VQ    16
> -void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
> -void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
>   #else
>   # define ARM_MAX_VQ    1
> -static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
> -static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
> -#endif
> +#endif /* TARGET_AARCH64 */

Hmm.  I'm not sure about removing the stubs, but see below.

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2fef8ca471..6db37b42d1 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -23,6 +23,7 @@
>   #include "target/arm/idau.h"
>   #include "qapi/error.h"
>   #include "cpu.h"
> +#include "cpu-sve.h"

Not following the advice given above, which I agree with.

> +#ifdef TARGET_AARCH64
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>           arm_cpu_sve_finalize(cpu, &local_err);
>           if (local_err != NULL) {
> @@ -838,6 +840,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>               }
>           }
>       }
> +#endif /* TARGET_AARCH64 */

New ifdefs, which isn't great.  But I also see that it's more or less a 1-1 
swap.  One ifdef here, or one ifdef in the header to create the stub.  So I 
guess it's a draw.

So, modulo the comment at the top,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

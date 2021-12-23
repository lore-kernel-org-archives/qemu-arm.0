Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp3480165lfb;
        Thu, 23 Dec 2021 08:31:24 -0800 (PST)
X-Received: by 2002:a05:6a00:2349:b0:4ba:98c6:48f6 with SMTP id j9-20020a056a00234900b004ba98c648f6mr3322761pfj.42.1640277084490;
        Thu, 23 Dec 2021 08:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640277084; cv=none;
        d=google.com; s=arc-20160816;
        b=K894uLX3DU475kHYjh4ix+s3P9RwYE42TRReLKcGmGI8AvV3tX6QzoLaVAfatiR8Gq
         P1/AIN3ffDl1n34aRFp7uDh6RLd3irUwAd5Mg5XuxEhV9iaaVWXCxtOKALMKPzkFdhvk
         Hj01cqhhoIz15gbS5u5DjiDt+961gK9w8vBKZNp6tXCwRVgDeFdMq05KpBVZBkeTYCWh
         QAWkzSfYL8CYMTHDnRNtse4dUj+KhrOxG3RSKw+VtYPE2IsAUFJWmK6jL1fXBi2TB6hX
         WWYPNl5H44hJWQulshyc0tncn8hAzXqlupOJshiPpf4RWKuBl60y/fXB7DwO7xamCWAI
         PNfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=z+peQTa48PtcUBORkRRFZitqi7aszWQXDHTELpQ/ApA=;
        b=rGcS3X8KgIfjsWZD1PB5ZhUQRO1TyZoMHPH/hURce5998C9EnqJduUX/t+CeZn2bCW
         Rb5qsk7T34jb0lm3FQSsXJhxkdePnoA0nmCCLRKTO19gGb7yWP/K8FCEe1OkIkvh0d4z
         meJ0316JX0YJbhQgrhqMl4M468Bf0NPKkbNcLTp6H35GT4//2E8yNU4VBJQMJfWYh6Kl
         53mcP8a/iB1tbLARDeZFuQSqd4+NLjoxbiIyd0XfEL4JP0ugQetV/0ilH9zUEE4Egeit
         DX1KWo/cL8rEGEOmsC3SErOitQI0NU/BGAFj1gvtuo1BOfjPlXKDmvm+JGii+2QmvNi1
         qjcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w25KE2A4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l3sor3784468pjt.23.2021.12.23.08.31.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 23 Dec 2021 08:31:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w25KE2A4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z+peQTa48PtcUBORkRRFZitqi7aszWQXDHTELpQ/ApA=;
        b=w25KE2A4zbEdxgqP43VvcTJJEpIfEwrYbeMhjFRttd/06B3iyI+FRdZOtbIRPxmekG
         J+qdxa5opncSwX/ffUZAc4yHm8wPFLfGg04bBnwnik5v/PF7ncoh7dW4IJvjxQL9qA1D
         x2CBylGeQzhJGWfn9OtWm2J/oKwNyazFFaX/XVwAEFEgDbo9Whe4A0aFpqg0k0Zmevvk
         A1gdltKNgTrh9ImUjpUPrT0+NWXxSLAqZmyL1HCCJCezYjaiJPXCG66A9TWCzlyUkgck
         3zQJIN90m+p31Y2V8JOzS2C+o7CqlzdlRayHhAnkFe5sukfT7mXlmE41gveWxsIP0tk1
         s+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z+peQTa48PtcUBORkRRFZitqi7aszWQXDHTELpQ/ApA=;
        b=BQax1RsfqMxumikSszVjmb63gHHN5YUODhsZRi65WUhkQkjUKWlKsuk1yNqLWxaoFc
         lBiyS5T98BN3JRZ6y18ow5mei5t2c6MB1Tf4Le+QKs6IfCx7oH6bVURZX58bYBO9fDDD
         esYvSscly0QfURJ/eAl3KYPZu/rqXiU2Ha+PUpWgLWaEprF3hsv1TRSznTkJWNbEtcyM
         JklUv7bpkae6OLX6SoG7inyZnjS+HL0oEa2I15VNt4V8dIzI4OyOH0HkPzVckYw/V6UG
         iI5RBNs2ue74bjtJNDVEuT8ygBvq7TUFWh5yGH1tnj+PjfYflDRyxYJrGCY7ENCMNssT
         9FEg==
X-Gm-Message-State: AOAM531Nz9fabMfV0+9FsVmjAZOn4jMd5B2qjT03xL52CF/qT9mcUliB
	HrIbo8FVWCJWTty1n2asKtOSi8ml
X-Google-Smtp-Source: ABdhPJypPyly0FhUpm6OCYLZxzGeh0A9G1IvIGYiQO7T9qHmHNVaO/3YQOEVV1dkUsqdQDsmrx3sGg==
X-Received: by 2002:a17:90a:4214:: with SMTP id o20mr3565240pjg.80.1640277084047;
        Thu, 23 Dec 2021 08:31:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.4.112] ([156.19.246.20])
        by smtp.gmail.com with ESMTPSA id e11sm5733193pjl.20.2021.12.23.08.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Dec 2021 08:31:23 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] accel/tcg: replace phys_pc with asid in TB htable
 key
To: Oleg Vasilev <me@svin.in>, qemu-devel@nongnu.org
Cc: Oleg Vasilev <vasilev.oleg@huawei.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20211222164947.634759-1-me@svin.in>
 <20211222164947.634759-3-me@svin.in>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f3440c3-4a1b-a272-c445-58ff7341bfd3@linaro.org>
Date: Thu, 23 Dec 2021 08:31:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211222164947.634759-3-me@svin.in>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: oqt7PkI7W10l

On 12/22/21 8:50 AM, Oleg Vasilev wrote:
> From: Oleg Vasilev <vasilev.oleg@huawei.com>
> 
> Using a physical pc requires to translate address every time next block
> needs to be found and executed. This also contaminates TLB with code-related
> records.
> 
> Instead, I suggest we introduce an architecture-specific address space
> identifier, and use it to distinguish between different AS's
> translation blocks.

Why do you believe that asid is sufficient here?  You're not invalidating any more TBs 
that I can see.  What happens when the kernel re-uses an asid?

I believe this patch to be fundamentally flawed.

All that said,

> +/* Returns the identifier for a current address space. */
> +static uint64_t arm_get_asid(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
> +    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
> +
> +#define TCR_A1     (1U << 22)
> +    return regime_ttbr(env, mmu_idx, (tcr&TCR_A1)>0);
> +}

Why are you returning the entire ttbr, and not the asid in the top 16 bits?


r~

Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1383636ejx;
        Fri, 11 Nov 2022 21:17:51 -0800 (PST)
X-Received: by 2002:a63:1b01:0:b0:470:580a:c8a with SMTP id b1-20020a631b01000000b00470580a0c8amr4025542pgb.505.1668230271620;
        Fri, 11 Nov 2022 21:17:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668230271; cv=none;
        d=google.com; s=arc-20160816;
        b=fiMK0DFe9is2Av3C+rXZZJNs6akcXuAIMrij1Kn/kw/UKT1j6J4zeQdQrlOpyuBbYD
         cdFQgud4WkuiHVo/jCQ3xcwwUzsowYZsh2tqUhq5qqiCADgDZUn2xIR+e0MDiHSpnMXr
         qr2GJhr17wvPxzEIezEf7SibFiTe2QjZdMkOyKlqtgevMboCDBet027hhsik8himHaib
         THtIQcwYjshMcPpEXkvQwaAwcyZmkoM63IUsNseMI6qqPRbqQ8bMC0eaAAt5nzpuhcP7
         2byiD1CtV7APOZ/C2Ki8f1tfZAGCLVMlWW1LOTIcSvyNa1qfCAJRNrswyNW8qEIu8BvK
         u1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jdEY5rg2buHnHBYRCJkkkpTIwzLGOL+iRZExmgQ/VuE=;
        b=ihhTJX/N/L0oR/AvlLEAABCf3ny/dfcOlVp5qGD33MClZ6P+DA2jFD5BW559TyqM0T
         cWn5PJycGJUL1Utmlt2cjIUICjYqmGRsZdPpNevy7KXYu8T9ISkSdADAjoPdTJYRimIs
         CHWcPkPjS1bEiMIrSNTjAVxIbsGf49NCUfNjY+Wtwq6hiuj2wikY55B8XLRr4BOY0dLx
         1JW1OIi5w68xYTSAXSi4XnTfKpTZ/elTwqZ6UIcGuAYh6dByBMoqZE6RKR/eG+Huwhlg
         Q5IwRM8VmUH1sSq61+HnOpyTye24AUVE+J0dW2qYD7+fVSX+zibwufqsy6S073iZdbym
         cDgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KEGgh8Ej;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f9-20020aa79689000000b0056c6c769ae3sor2107066pfk.94.2022.11.11.21.17.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Nov 2022 21:17:51 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KEGgh8Ej;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdEY5rg2buHnHBYRCJkkkpTIwzLGOL+iRZExmgQ/VuE=;
        b=KEGgh8EjsIjetegowfDyoSBpkFlAinhlKpNOvU6FwTQaHKRT8UKOxJJjEsa9xObZUI
         D9BblJ61e4p5Aeo18DHuyaj+KZ+sYA72lKwrbHp6M7EWZeXe3R8OtIdn2whyN5euQ0+P
         SkR4yfSq0rLrJF5E3CMuxLr42h03ZqnwD7vUlC1OVHacQXZZMhGU27oUEzCuFEgr3tnV
         0AdpsCmGEmL1iot4pgSu74RgwYlJjiMCJ0xbddcX8ArCk3jCR1veo9WmUkTeTJEpaGW5
         oXCGHP22UgnEPaT8fYsU56+u/JRwvy0eDfAzhvoTh9kp18szfZweu4hLKZQ5OrYqn//y
         aLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdEY5rg2buHnHBYRCJkkkpTIwzLGOL+iRZExmgQ/VuE=;
        b=3AJteaKJbzemh3bib5AUjWHa3E1tSj4dAcwMMfUw0RZlUqzOaIPYXZ5qnxbDT+GC3i
         dfd7Y1OSVULNYpd12uEpPfurV9GJIEm5SPbNWdCVEYzcR1GtjN3MnO8CsD/G4yvRJZYs
         3kIdl/Wmtja1zTHaw3mqw4Rorh/KdC1SxOnl5w2bJFR2xxdJItXGx/N5nJ3ZhinRQ1yU
         o2AdpD/1pFakVtR1OUFWPhELEeNSQwwT/vcYwe9dUzw0zVbyfNB+ktoXjupsMGkA/mYW
         857JkryQNxsbQ4qU42WK9VIXazHh0aFmrmv5Fn/FjkQPM4b0PYaZoL2ChXXjFVR6WGFp
         mdPQ==
X-Gm-Message-State: ANoB5pkvM84dflJ+2BTDdWnkhcAGsZZDZo2iDpdRy+EAgyS8tWVfhVb2
	1wTbGN1NET9p+UmU88CiYrPdQjYtoKbx1Oj6gVs=
X-Google-Smtp-Source: AA0mqf6PDnANMuyfX2Uw+Vik7eS97xBY/NaHjlja36+SWaLUylFdyrhaebQpM/3nl3uOPO7Wcv1CPw==
X-Received: by 2002:a65:6e07:0:b0:456:4faa:7645 with SMTP id bd7-20020a656e07000000b004564faa7645mr4234458pgb.264.1668230271070;
        Fri, 11 Nov 2022 21:17:51 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07? (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net. [2001:44b8:2176:c800:8228:b676:fb42:ee07])
        by smtp.gmail.com with ESMTPSA id a11-20020aa7970b000000b00560cdb3784bsm2461490pfg.60.2022.11.11.21.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 21:17:50 -0800 (PST)
Message-ID: <ae05eadc-e729-8c8a-a66a-d51d70de471a@linaro.org>
Date: Sat, 12 Nov 2022 15:17:44 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 02/20] target/arm: ensure TCG IO accesses set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TrNPSQF2U0mk

On 11/12/22 04:25, Alex Bennée wrote:
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 3745ac9723..4b6683f90d 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2634,6 +2634,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>       s1_lgpgsz = result->f.lg_page_size;
>       cacheattrs1 = result->cacheattrs;
>       memset(result, 0, sizeof(*result));
> +    result->f.attrs = MEMTXATTRS_CPU(env_cpu(env));

Ouch.  This means that f.secure has been reset too, which would break Secure EL1 running 
under Secure EL2.  I'll prepare a fix for 7.2...

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

>   
>       ret = get_phys_addr_lpae(env, ptw, ipa, access_type, is_el0, result, fi);
>       fi->s2addr = ipa;
> @@ -2872,7 +2873,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>           .in_secure = arm_is_secure(env),
>           .in_debug = true,
>       };
> -    GetPhysAddrResult res = {};
> +    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
>       ARMMMUFaultInfo fi = {};
>       bool ret;
>   
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 0f4f4fc809..5960269421 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -208,7 +208,7 @@ bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         bool probe, uintptr_t retaddr)
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
> -    GetPhysAddrResult res = {};
> +    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
>       ARMMMUFaultInfo local_fi, *fi;
>       int ret;
>   

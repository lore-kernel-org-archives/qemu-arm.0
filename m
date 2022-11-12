Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1387639ejx;
        Fri, 11 Nov 2022 21:26:46 -0800 (PST)
X-Received: by 2002:a05:6a00:a1f:b0:56c:636a:ac94 with SMTP id p31-20020a056a000a1f00b0056c636aac94mr5620466pfh.38.1668230806386;
        Fri, 11 Nov 2022 21:26:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668230806; cv=none;
        d=google.com; s=arc-20160816;
        b=UwPTL7i6Q1fB/7M8YAgesaaypkE/Ihl32plo+95Dt8Ps2Fp5LzHvxQl1ZPgqQheJsv
         7gLMjbaoUY80QaAvhlc+Pe7DH2bGqABWH3wdQVNxMlLND7ZvtQom4sc6Ci/XUvWdvq0c
         pHCVdLJGYPmCnBtVnza7Z4n56FkYmtJt2uCUhXb+YZsVjyEt70Cgc6mCCFiEVWmE2Z5j
         qmMxU7/RPw5CKJNXoruEm4cBBbdf1uGlmNTcW5zL/V/x1rZTQRecfAM/Wn5J+wGwFAuj
         FzuUJ4RQJxHrTlGblQ6aQ+98dGJi4iV+lhrW1Ud7UU6N+RBS0pXD9VNJ4g22lDBjgByE
         N41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=M4iOABLsvTOfHyIwr3LPLYLCnW0f7X8O3lqFBR8/FJQ=;
        b=O6FfUy5dzjYoWOvqQqwGV218sJGeVp6c9b6j6uxzx9OGXVUfLPoqmGANCVIHD1v3aK
         viflD4BcgECiLif5L4vW2zfABuA+FMc6WymhH6QsFvLiJRAraCO1865pKTS+LVoBP0sG
         aqVdhV0KIk1K9NF/pci2VYSKuOG1I2dVS0rojHv78klIia2aV9loDYbXCqASKb7DrbTC
         xAS9t8/RWy8M5jea2oLkMi1gZXb4S6Fu6rlVbjmdZej+w2jGV9yrkWNVJxhBwdZnma5C
         d2EWDP8mC/4bZwLqbb75smU414jPfuG5VGTXXTyeAEPuUn47wv8NzWtfCJFNxkc7MaPN
         aiRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BSh/DBgn";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x30-20020a17090a38a100b0020a76856554sor3732186pjb.11.2022.11.11.21.26.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Nov 2022 21:26:46 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BSh/DBgn";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4iOABLsvTOfHyIwr3LPLYLCnW0f7X8O3lqFBR8/FJQ=;
        b=BSh/DBgnWGYMeVMyOSLc/gnMeXPQyB3RqsvDyXc7xPM9ZpYjfIVZ/fmcznc+b0iAte
         OG78wqrK2URTX3fHw8uTuhpZg0+eax9HjgVUWS9eGG3njvUwHvoPvDJbYb6U/0GErvj9
         Dzw1eKKVEV17zHMtev3wlgN68aaIPkypnvs1qFZWcDkeGCihtSDWy5d7fn0HQWexNH87
         XjgiL9ExyOkLDvzktr2eu3/CubjwRKVnY5FDXY0sAarMVezH5kFORIjweyxIppkvWdkq
         gkJcfcCGuzc7Jh99NyDYyytXKtuOgS9YEbfyIZk6Ap8HkRTNY/vvMCTyodnunw6j7ATV
         jxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4iOABLsvTOfHyIwr3LPLYLCnW0f7X8O3lqFBR8/FJQ=;
        b=F0mubG7Q4Zkx8Avg55Cmk3rtxbm8EuCnRQwnFgyjADd4Qn97XpTPama808Axfc51TR
         Hy7aRIrmzuwA6sPusnXjzkxxHowJdFcV8TFepqUVHYUuxtOOuwSIBO1YLZjLONExASbe
         Bh4kc4pdSAUO58f2ur2WIkp17VR0bVFaohkf/tT8+/IOAhx2CHDpAUtdHBWI8McZI9XX
         g52tRuN1JoHMoWcFfztqtb623LDR99X5YMyLSZnAFtkaR3cySBrJbMj37bplgEomsHGT
         WOvkcVsFlGyPgrYoX+V1uSpqu7WDO8dORFf4bPgNfNhQhXGSIh/l+qadPROzmFv/2fqp
         QVaw==
X-Gm-Message-State: ANoB5pkNwk0n61Z4nzB09hK3h+F4LcqDvem3swe1zkmaw4KDkf4M7wCO
	5KZVF0wwPtwI6dFlqWFMVoq8kx5xtPPaPsb351M=
X-Google-Smtp-Source: AA0mqf422ww7zjKubGN4XP1zXrrKZOcL3U7mj3uO3dITnrhGwyCZuMGmG5z+apnLfd8xcEkVbXhmqA==
X-Received: by 2002:a17:90a:6845:b0:212:eb51:85eb with SMTP id e5-20020a17090a684500b00212eb5185ebmr5187636pjm.232.1668230805964;
        Fri, 11 Nov 2022 21:26:45 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07? (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net. [2001:44b8:2176:c800:8228:b676:fb42:ee07])
        by smtp.gmail.com with ESMTPSA id c4-20020a655a84000000b00473c36ea150sm2086530pgt.92.2022.11.11.21.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 21:26:45 -0800 (PST)
Message-ID: <64aa311e-efc3-ce6a-c663-10fefb469695@linaro.org>
Date: Sat, 12 Nov 2022 15:26:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 05/20] target/arm: ensure m-profile helpers set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UWuHLBITJ5GP

On 11/12/22 04:25, Alex Bennée wrote:
> There are a number of helpers for M-profile that deal with CPU
> initiated access to the vector and stack areas. While it is unlikely
> these coincided with memory mapped IO devices it is not inconceivable.
> Embedded targets tend to attract all sorts of interesting code and for
> completeness we should tag the transaction appropriately.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v5
>    - rebase fixes for refactoring
> ---
>   target/arm/m_helper.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 355cd4d60a..2fb1ef95cd 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -184,7 +184,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
>       CPUState *cs = CPU(cpu);
>       CPUARMState *env = &cpu->env;
>       MemTxResult txres;
> -    GetPhysAddrResult res = {};
> +    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };

This entire patch goes away with .attrs set properly in get_phys_addr_with_struct.


r~

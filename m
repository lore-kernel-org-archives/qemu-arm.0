Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1387422ejx;
        Fri, 11 Nov 2022 21:26:10 -0800 (PST)
X-Received: by 2002:a17:90b:145:b0:20b:c375:575 with SMTP id em5-20020a17090b014500b0020bc3750575mr5002098pjb.174.1668230770581;
        Fri, 11 Nov 2022 21:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668230770; cv=none;
        d=google.com; s=arc-20160816;
        b=08KyMCjFkUV3IxiJvEQ99N7mhS/4gfdQVNHnT+zNAvqOCI4YocLDXsbPrX3FOV8zXw
         AV8sV6Kek5jLquyF9SmRizW4vbsVUMVAfE7iFAW6yBv5qmjW5PmjEYQ6+pE5fNqOFVY6
         qkDXnN03fcD+q3CY5qR63UeuTVmhBWFYn8yVoVeqLlabvw1Gk21mqtmLWUFSuKbb26P4
         8/0U4AOR0SJ6gr2oLhp3nn+/4WJ5FIjKeb+mh4YsYoOfj7i51jeZtDUyE7pfr9Omg4R0
         d0j40k6w9N7H8QcIkK8S9jhanw86rc8ZwIZxb0JZUuXGTaSvbk9QmE+q0jYcUnAn2CHr
         tDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=oqxAa6bNQAZqaxYbDlMe3G00xB2hmssTFTmA+3QlX+Q=;
        b=1J0DU0caiUpvSSha3pW6D6hnX4fGEh/pgSjwRVWCd4MCjQTHhLKQnqVYWR9H/3VqB3
         pbVL7A6uXDIONjwm+qTIabNeym7I1GJxbOPjC3/lBs6szvGZarG/K0IwH6lbLyIM47i2
         /UAKQi8QJ/9otXQ+t6wvHdvOa4nS2G/tcpoFbUaEpHkOiTL46Pl2oB3d7AromZkhpukq
         07b7RO0JjpGeQ8ywFi5R9AYK5cEXTmf1KUbPA14GyUJ1uHaHoFP7sx60uYNFSAq92ZT6
         mv5DMUYj0MSDjT3MdHXmCFFMf8cDNl64coz+tjAP/r8ABFFCrU1Bo8Bm6j6R9otJnMwk
         6UCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OnWFM4K/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c14-20020a17090a020e00b0020a6dcdb7adsor3773955pjc.15.2022.11.11.21.26.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Nov 2022 21:26:10 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OnWFM4K/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqxAa6bNQAZqaxYbDlMe3G00xB2hmssTFTmA+3QlX+Q=;
        b=OnWFM4K/94tqNjVqzjvepa2fP1OvYkAgrPeQoZ4RrZqnGQb6Wxid7iky3pSF/34pxq
         BlEQO9tCn4dh5KyMC78amJ2ZYOCribIrxr4pxhAvfe6fIyGCjZqYsBG/palNb4Eczts7
         KGEXDcP/b1qw106sIx00UpJMtQB0yQcmblHsRxpuRAOYT9atSOJya7dL2rp3M5PPW+E9
         6RoTZO0akibKmc/2RDuetEGoUsu/c2YwJ0FenX5w5w9QTmwVvEz/FeL1gM7yBmWaI3Av
         5ArIuK5egpJzmEtNDs/C3KR2s4t6uE30mcdapKhY/Yb77tqHbChGmczQlz+UR4tzUVqc
         h3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oqxAa6bNQAZqaxYbDlMe3G00xB2hmssTFTmA+3QlX+Q=;
        b=6phjtm3Kf9bvghOuyRDiXYKnxyOEylFYmZ8kbAwnHPwqqcGj9lHD2XmPonuAKRRkN1
         tVdqbomyRQcMXMtX+EgBPWBusD1vuJrlIq19bqA/undleNYTU5pvqngfV4JDpY0lUJGj
         k4o+QNItyuvSRniwF3W7fF1KNRwRYODJqRv926x+I390Buz8e0fKD0qVws5B64yNQCvr
         49t4pAihSsXWtd6yO+95fbapLwVUcm7jFJ9yJLEm3V4MysNq6Xkkv+lrUQPdHxBMZTc8
         JkJwn9XIf+xRyVfPGnJ2bOhSWnlqT0XPPfl9yAbkXYpP3iHtnvVi8xW4+t0UzvqdiPXq
         /B0g==
X-Gm-Message-State: ANoB5pmjgjQlMWL1eRE7pUKewNzplsTQhVeXm0m7bbg9NBevs8chMlPi
	4A/I/fZ5xVNF6IvZGbS9YJI6Y7kGywZlkrGocaw=
X-Google-Smtp-Source: AA0mqf6mU1XYYtaPEVitikyxsS17cQZWIMJJqbkwmkUFB9IwUx729wsrHGFZ3RjH+hzzgwvsgP9gQg==
X-Received: by 2002:a17:90b:2290:b0:212:dadc:23e3 with SMTP id kx16-20020a17090b229000b00212dadc23e3mr5139120pjb.129.1668230770067;
        Fri, 11 Nov 2022 21:26:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07? (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net. [2001:44b8:2176:c800:8228:b676:fb42:ee07])
        by smtp.gmail.com with ESMTPSA id p13-20020a17090b010d00b002009db534d1sm2459055pjz.24.2022.11.11.21.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 21:26:09 -0800 (PST)
Message-ID: <470381f6-baeb-fac0-2332-d59574291e05@linaro.org>
Date: Sat, 12 Nov 2022 15:26:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 02/20] target/arm: ensure TCG IO accesses set
 appropriate MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: +0hfjgxMrrh+

On 11/12/22 04:25, Alex Bennée wrote:
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

Not the right level for these.

Should be set in get_phys_addr_with_struct, alongside .secure right at the top of the 
function.


r~

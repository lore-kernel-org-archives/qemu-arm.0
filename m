Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1683481ejn;
        Fri, 21 Oct 2022 21:08:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3901:b0:20b:210d:d5d9 with SMTP id ob1-20020a17090b390100b0020b210dd5d9mr24901853pjb.83.1666411699092;
        Fri, 21 Oct 2022 21:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666411699; cv=none;
        d=google.com; s=arc-20160816;
        b=UCLiBSKeZTa7Gpk1Twn3aOSaXYm+3ITMSbNdDLuwzoJ/mWVI1i5cPinC/i/rzWQe5H
         oKfhYpcC6xvf/A97JjwghyrNeCSki8byD8l8JIS9y2NFOKiNDI8x+D72+JebNKhYUiLv
         1yWAaVnAjXgxVwG99BtlStT4bSCK8igvkqF/OF2nwGKyZYE0L0NIBr96mBxVYUHvF0Oz
         roF/XeFrEi3HlzBeeFE0iZ+To8+ZeuEeyNFTDVISWIzoSRb7sjpSOLV+5ONPKoa4kubC
         8r8jVvywPlT+K9qgDOufUiOLZqwrTHnvxNxkkHMSf6SLOTBDUDaXPFOFMxcIDu33vJnP
         IJ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VRwSjyGUr2nUpMWM+CH/+r9r90XgFDCStyBiuBJV9hU=;
        b=qzcvMSd63oQhUpHv9jxxBLB5efLr66nhEuxZ15IjIlkspaKmpWljzAlUfkkhJe6VB1
         00ws42Q6gHUySJM1ipCwm9uAdZdZBLS/3eOP8NpfzYxd+fk8m5Igdpsr9q2eu1IxiRZo
         ni22N4eUwyngNJZ4SLEhjOxbZ1L3ZwrdTdWkSiJPTPbh9OvVG3oz4oicHeFHfH0twa5c
         hwGIYcsZJJuectTzhRqhtJsRnWo8aRD5s9hsNoTkTGLDWaOS/y/FY8EqajidAQxxuMiX
         1L3jrrkT+w83Rh+OTRZVambbU0azuT0zWDOodncRYCEU841z/QJiZNRwLuTOnBpx8587
         uXoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lCn/JRUl";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j10-20020aa78dca000000b0053e6f273b68sor12741414pfr.24.2022.10.21.21.08.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Oct 2022 21:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lCn/JRUl";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VRwSjyGUr2nUpMWM+CH/+r9r90XgFDCStyBiuBJV9hU=;
        b=lCn/JRUliw/HUgObfGBRxysVDO63I+n1dPrm3zRVNKhMyd8IVMISY2YwNj2Md9kSds
         0uWwGfcpqKe1jXf6ALdGrKXM4jI2kGKXoamugjqMRDNguqfseYoxmKaV1G7tdCVqYZXE
         vi/ZSzfKtoob30oCcp5UaoHP4Y75gB9Q7yJOLs0kSJmmwO74p612oyWPmxDsETJ4ieaY
         J2T3By4c9dCrgpFv6Fv6uboTPthHAdEoZbaKWvryyn2QbXAEdjMJbijpdyGcm0D0BVNG
         mDji6uprn3jKtzSAYhnkUu25f1bFc9NM3qjPqeDqF28lkxQ7wG6+F0fuO8gtAKh0s3IY
         tPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRwSjyGUr2nUpMWM+CH/+r9r90XgFDCStyBiuBJV9hU=;
        b=Jh1wj9dm3thLdnHa8eUmhhGu1TwEFoR8yVCQS2fxJWi+tBo/a2gIIlWiWisDQoYUpm
         1FKyHQ/gH1gxUWTOGqjbs2cJd/NpRzj+ezQuOH2JLq4mCMy8QHBlkhcfYJBinaoZuRWo
         U9v8P3UYH9kv3bT7vr0bse5E0iLPxOu8tjiE8H19zgPRpt69x1sPjxi7KTPv3ZRq8uxc
         7fkmIDMzmD8N8cDt4JzRjUIGM3mUrFrYuxNnFvOAYFag/qbTA9/4OjCmdPizFSVnVMMd
         mGmrMYrkx9cydyqyc1f2mddhwUgOCp7sOz0aKnC3uGVrvomcqjDneh18GPKE2bYcBuP/
         7okw==
X-Gm-Message-State: ACrzQf2LrFbsoB91OqZJaKE7EaYCoVMiCXaQTVPEP7iYv6PjleLY4xGp
	IBcZDBagtE4t2qDvk+8KwOc8zsWFB+Hj4ltDeyA=
X-Google-Smtp-Source: AMsMyM49pMTqTRduulM06TJXQFAFdyYcmGkf6Iqv3ZPNz4Vko9J3cmoQP58S0AlUbIZVmNMHF/TxkQ==
X-Received: by 2002:aa7:804b:0:b0:56a:ecab:e86a with SMTP id y11-20020aa7804b000000b0056aecabe86amr5372923pfm.40.1666411698456;
        Fri, 21 Oct 2022 21:08:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.107] ([149.135.10.35])
        by smtp.gmail.com with ESMTPSA id d4-20020a62f804000000b005628a30a500sm15934258pfh.41.2022.10.21.21.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 21:08:17 -0700 (PDT)
Message-ID: <3aec1273-cd35-a943-6aea-333553dbd560@linaro.org>
Date: Sat, 22 Oct 2022 14:08:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH] target/arm: don't process FCSE translations on
 physical TLBs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20221021172338.2782240-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221021172338.2782240-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IEFz4WVtDuXj

On 10/22/22 03:23, Alex Bennée wrote:
> A recent change to the page table walking code missed checking if we
> are at the processing the physical translation and bombs attempting to
> derive the current EL. Fix this by introducing a new
> helper (regime_is_phys) and extending the check around the FCSE
> processing.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: f3639a64f6 (target/arm: Use softmmu tlbs for page table walking)
> Cc: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 12 ++++++++++++
>   target/arm/ptw.c       |  2 +-
>   2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index c3c3920ded..0e753203b5 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -673,6 +673,18 @@ static inline bool regime_is_pan(CPUARMState *env, ARMMMUIdx mmu_idx)
>       }
>   }
>   
> +static inline bool regime_is_phys(ARMMMUIdx mmu_idx)
> +{
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_Phys_NS:
> +    case ARMMMUIdx_Phys_S:
> +        return true;
> +    default:
> +        return false;
> +    }
> +}
> +
> +
>   /* Return the exception level which controls this address translation regime */
>   static inline uint32_t regime_el(CPUARMState *env, ARMMMUIdx mmu_idx)
>   {
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 6c5ed56a10..1456a2f1de 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2557,7 +2557,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>        * Fast Context Switch Extension. This doesn't exist at all in v8.
>        * In v7 and earlier it affects all stage 1 translations.
>        */
> -    if (address < 0x02000000 && mmu_idx != ARMMMUIdx_Stage2
> +    if (address < 0x02000000 && !(mmu_idx == ARMMMUIdx_Stage2 || regime_is_phys(mmu_idx))
>           && !arm_feature(env, ARM_FEATURE_V8)) {
>           if (regime_el(env, mmu_idx) == 3) {
>               address += env->cp15.fcseidr_s;

Arg!  This is fixed in patch 2 of the FEAT_HAFDBS patches:

https://lore.kernel.org/qemu-devel/20221020223548.2310496-3-richard.henderson@linaro.org/

     switch (mmu_idx) {
     case ARMMMUIdx_Phys_S:
     case ARMMMUIdx_Phys_NS:
         /* Checking Phys early avoids special casing later vs regime_el. */
         return get_phys_addr_disabled(env, address, access_type, mmu_idx,
                                       is_secure, result, fi);


r~

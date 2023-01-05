Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp53489ejb;
        Wed, 4 Jan 2023 20:48:26 -0800 (PST)
X-Received: by 2002:a17:902:c94f:b0:189:9e91:762e with SMTP id i15-20020a170902c94f00b001899e91762emr79942720pla.57.1672894106247;
        Wed, 04 Jan 2023 20:48:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672894106; cv=none;
        d=google.com; s=arc-20160816;
        b=HWEGrBuGBTHi5ijDlAbwPX0YI6a4gFbDa9EZ5jpghs4eDk52d8d8yVNy1Tq4U7X7Xs
         bhySXaVhuVa6yipgFVjgjaT8/3YepHO0RlVnmA/WRjRlk1HodSX4E1mwtKc8Ahqa0hBV
         6Qr2XV1sN/MpQMfY0m3cWzC2GD+KQ8FMzn1pIR8FpWjl/2kWsLAe+ccxu9DXY1iMb5a7
         PF8apkYzAN06yVdIR/8aqpODkA8zuR2kqSZPDwPfwd4n+gZuZg7/doWJZN+7nPbfxthc
         Kp3g7xc3S8fAHse7bm0ea/EjgjIapIWETIVJ6G05GCq0TB3TvWy7pO5v2CXS5yT8YsEr
         iMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4GkHCC8QXORuxqNY5GWhT87y4llPRmtW3jLLrQeoqDM=;
        b=eHm0pyt+oT354bdYoJgAQnKZNaadMtraAmBmHLBgHlkaGinthDCH5dEl3Ozy/oGLup
         fDGqSgk4J28DR+lks6eyA3t0FZ5e62EX0IOHquX6nWkv6xnR9gTDciAgaUZ/mGK/VmSQ
         9Xsj0B9mclV4WwBm76wMSJvLIajW8PEZA9wSmefZm6cXm8K3cyIvgt4oeIr90KPWDI/J
         PR62QfzPfFr7Ub3K2O6Wnrrl/BjRSNqJcX1lNr4608nnnD+8SzJq0Q5PUUsGPGKhMziO
         wwGbeg1QNINi1SdsU0+g3BJZMOCrSHRb3is3m567SXevBkecGSZmxDRKcpi+owOkvn3f
         O2PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E484vPTI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i16-20020a170902cf1000b0018973a19152sor14379031plg.52.2023.01.04.20.48.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Jan 2023 20:48:26 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E484vPTI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4GkHCC8QXORuxqNY5GWhT87y4llPRmtW3jLLrQeoqDM=;
        b=E484vPTIeJGpmSxqJvhRhtaacPR1WQYv2zE5/8eiimfPIqgZjux5fXYBQMjwziyEfa
         Cy/X82DGuvw9aZTQYOU6fZSMnYroOLb8T5wU8Hid4l25xIRrqG1m/CNY1V5I9ey2z+MY
         yf4mnIh4d5QmcaeBktSNHIly7KFB4H/sVznEu17VRMmWouUEVUpwWV5XWXXt3y0tUEDt
         DYrSQpcRAsMdJtc5LD224v44qMiWmh3Jjd8I1NTuxgmR/YXbJwzhZLv5k+RVC3fEXPGm
         8osBJpHRow3E2oxvEcv4dT64G85Bo/0b/qpZmmHE7Ie5ipA84+cmzUpFyvKyG/n3hjH2
         rz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GkHCC8QXORuxqNY5GWhT87y4llPRmtW3jLLrQeoqDM=;
        b=FYAe6S9vlW6f8buE4Ih+WF2TFNJ9kSWfyqo6Ll6Zy5tjWo5VpbNTPomLuqqJdUmmyW
         M3dqsd7+yGPn5Eq9cLxow0eWbYegPlSDNg5Mx48A5imA0W1kI2bTNnA5ntkqKQbfyL8i
         KjJVjxitHvI/8X8BkxOIQs+Mu0iRE3heydWgcPYAci/Y2jwzkJIL6SR1FIz6GCJZR+pw
         p8X6mEZl56qG8sBPuo4BIgg0+oXXAPxK4hAanQrQt23urBQcQ0z8PhvFr4TnScG2g/hG
         T9RVId/Qe7LWmJi0v9NJ701WuS0cJZzgvpWcNZUVkQsJNT88fY1vWnKJT9Je/Yvk7uxZ
         U85g==
X-Gm-Message-State: AFqh2koDmb9DG9dG/Jq63xMEA7Wblx6sUpNFfNe6g12ZevxQTFLj5pcW
	uX4rpml7DydFPZ4TtpmENMRRZ5u3w621OjHXgLQ=
X-Google-Smtp-Source: AMrXdXsLYgPAOVwkOs285ugRYbi5XdDJOGRNQh0bQDT6SGJzOug6y3swbMcqstS4Vz73EKMGem/9dw==
X-Received: by 2002:a17:902:bd0a:b0:192:fe0a:11c8 with SMTP id p10-20020a170902bd0a00b00192fe0a11c8mr648874pls.46.1672894105677;
        Wed, 04 Jan 2023 20:48:25 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee? ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b001897a8b537asm25139962plr.221.2023.01.04.20.48.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 20:48:25 -0800 (PST)
Message-ID: <97f2e3db-79f2-c4a2-f48c-70b4617b7e4d@linaro.org>
Date: Wed, 4 Jan 2023 20:48:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 14/27] target/arm: Move regime_using_lpae_format into
 internal.h
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230104215835.24692-1-farosas@suse.de>
 <20230104215835.24692-15-farosas@suse.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230104215835.24692-15-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: M+2hfIFZSVST

On 1/4/23 13:58, Fabiano Rosas wrote:
> This function is needed by common code (ptw.c), so move it along with
> the other regime_* functions in internal.h. When we enable the build
> without TCG, the tlb_helper.c file will not be present.

Maybe better to just move to ptw.c?


r~

> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/internals.h  | 17 ++++++++++++++---
>   target/arm/tlb_helper.c | 14 --------------
>   2 files changed, 14 insertions(+), 17 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 161e42d50f..3493b5cc88 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -610,9 +610,6 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate_and_priv(CPUARMState *env,
>   /* Return the MMU index for a v7M CPU in the specified security state */
>   ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate);
>   
> -/* Return true if the translation regime is using LPAE format page tables */
> -bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx);
> -
>   /*
>    * Return true if the stage 1 translation regime is using LPAE
>    * format page tables
> @@ -777,6 +774,20 @@ static inline uint64_t regime_tcr(CPUARMState *env, ARMMMUIdx mmu_idx)
>       return env->cp15.tcr_el[regime_el(env, mmu_idx)];
>   }
>   
> +/* Return true if the translation regime is using LPAE format page tables */
> +static inline bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
> +{
> +    int el = regime_el(env, mmu_idx);
> +    if (el == 2 || arm_el_is_aa64(env, el)) {
> +        return true;
> +    }
> +    if (arm_feature(env, ARM_FEATURE_LPAE)
> +        && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
> +        return true;
> +    }
> +    return false;
> +}
> +
>   /**
>    * arm_num_brps: Return number of implemented breakpoints.
>    * Note that the ID register BRPS field is "number of bps - 1",
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 0f4f4fc809..31eb77f7df 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -12,20 +12,6 @@
>   #include "exec/helper-proto.h"
>   
>   
> -/* Return true if the translation regime is using LPAE format page tables */
> -bool regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx)
> -{
> -    int el = regime_el(env, mmu_idx);
> -    if (el == 2 || arm_el_is_aa64(env, el)) {
> -        return true;
> -    }
> -    if (arm_feature(env, ARM_FEATURE_LPAE)
> -        && (regime_tcr(env, mmu_idx) & TTBCR_EAE)) {
> -        return true;
> -    }
> -    return false;
> -}
> -
>   /*
>    * Returns true if the stage 1 translation regime is using LPAE format page
>    * tables. Used when raising alignment exceptions, whose FSR changes depending

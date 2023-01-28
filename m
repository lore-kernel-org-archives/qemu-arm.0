Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1563349ejc;
        Fri, 27 Jan 2023 17:51:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsqFADK38wd0bW5uCqe+EVc3ryLLJXf6rlIkuL5sN9jevVkE9hXSHrv98N2js6GSwCtJ+PS
X-Received: by 2002:a05:622a:420a:b0:3b4:79f8:26c3 with SMTP id cp10-20020a05622a420a00b003b479f826c3mr58106176qtb.33.1674870700032;
        Fri, 27 Jan 2023 17:51:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674870700; cv=none;
        d=google.com; s=arc-20160816;
        b=lp3o3lcaLV6aQCL1RlbNerJHs+X+OmLtPP/VqGj4fLac4XIPFkxkiiEjadEX31Xw8U
         wGcd0ioataYoCdj4Zj9HY6rjw6XnCXC9bkHr8Vfc3iAN9OFgBf5bqif5paqwYHJVHHvR
         5sZWyaHMHUeAaEBKaeNO0imLxxZpO072Ft+JXE1tSHqi8FAvq7Fm7XXqPUIEUXvGledW
         Dy+7NUvBPtaPq/YyIZDnZIlzXrKxQPrW85Fb2P9ApeKCSwZ+pvcUZ9cjzRQeN+ZjG+w9
         3rBAPTisRFfyUX9/0610VudGlPWq7VE4jmkFeWnlJe3zxNZklVyezSDmpqOSYm2fr4WS
         r0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=EMhTZ8Rk/lhQ93KagCmhtpH5/JtMkaItcaqMGxK6nNQ=;
        b=i4xg9m8Nst1RcT2kGCe9sSIQLKapeM5rjI6Ln7nYZxqgR9eJp6hROKmEino53pWwZo
         rVliJ5ZyenfOz8IKgnmRq0q4LocEC6DO9UJkG09+DVhTBBnNwpCGIc3rZCSbjU1rVgp1
         AVkPGVzkIccqYcM8oCAbq5UFpFDla1UmEUhv+FHwJnKSSdGoa4Itpzd7vYMl3v0VbfnR
         TUj/+ktfyx56hviWCZ9S4A0M5f9rdzdG7v7gHbobv4dSB3UX0o3oYzvLaZ0HozHoQNRv
         MoYCzXnsM8fkbYUQongLezEOUVE2rPszMAjGxup27GMQq2/qhiWh8VegS4tB0Xz3wHn0
         Z13A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bt5xm0mR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c125-20020a379a83000000b0071a64856b0fsi883303qke.153.2023.01.27.17.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 17:51:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bt5xm0mR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLaNM-0003nq-Ct; Fri, 27 Jan 2023 20:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLaNK-0003n2-QC
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:51:26 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLaNJ-0006p0-4z
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:51:26 -0500
Received: by mail-pj1-x1033.google.com with SMTP id 88so6271635pjo.3
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 17:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EMhTZ8Rk/lhQ93KagCmhtpH5/JtMkaItcaqMGxK6nNQ=;
 b=bt5xm0mRQxJG3m7A1JOVt1cqH/wE1GqWzCarl1RtL5MsjGCSATkEX53HDb0rRxhoKP
 6uwCrGAeP2+FiR4zoH39KwLGuatPCsir1qseHjmULPTzI22V7x+jYXzGK7Kj7jCBv5BC
 V9HVhHBa5sRhyhHsdNlxxWh2D3GtFA6DZeaThhrrOJwwFGbWrIQA2CW4keC8qrmMtkoW
 gLP7SiiynuQZOYgpu7ZCywGqyoXnlLh0pG5K89zj2SR9l5JD4INglPp8Hb6cnW7kKefC
 fWhL7z1oAk3+WFJmZGDUUKUrWPCZyXGgM6+NPODyFidPq21OKQ+aIUYudg9Q7zPKnnQm
 sh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EMhTZ8Rk/lhQ93KagCmhtpH5/JtMkaItcaqMGxK6nNQ=;
 b=IC0ynzD7MXWEGsJG8lyWSiILtz7kj2ZZGT4Aby/hZ7wHsqX1oq+qdJTV6KOkrlq+GT
 MrA0Wtu6Ds69xn4FALU2zM3Y8SxdiBusdjZeKDTQBtYoZujXWRGcmnl9bARPK6k6031X
 P8kO/4C6MVJWJyfPe6kKKv/gD5WUllyHxT789XC8rvUC0YsDz+Eh2R/eoJPmMd4BHrF3
 FEkmDD7pH0CVTkjNg2Z6qHhs0K7Em4QdkOlsm8LyXm8xZsH0f9IH09bH9M4rxBMG8A/2
 RkVLxPk5et3Uo5ahfM7uagm9/6zgAEONFyydT9+Fup0gUCmddcNthoT46OA7tZVI4Lp8
 4KDw==
X-Gm-Message-State: AO0yUKVs2G85KB/ChrbJGVVrkfsRM96ATTS70mWnwF6C4ol1LjZAm5WD
 +0n2GpcEdyQksndJ9A9pDXZLdw==
X-Received: by 2002:a17:903:2290:b0:196:5cb8:60e6 with SMTP id
 b16-20020a170903229000b001965cb860e6mr3565574plh.45.1674870683751; 
 Fri, 27 Jan 2023 17:51:23 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 s18-20020a170902ea1200b00188fc6766d6sm3458239plg.219.2023.01.27.17.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:51:23 -0800 (PST)
Message-ID: <5b1afe34-9906-4693-7181-722b5a247997@linaro.org>
Date: Fri, 27 Jan 2023 15:51:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 07/23] target/arm: Disable HSTR_EL2 traps if EL2 is not
 enabled
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gxwMuEG4koBj

On 1/27/23 07:54, Peter Maydell wrote:
> The HSTR_EL2 register is not supposed to have an effect unless EL2 is
> enabled in the current security state.  We weren't checking for this,
> which meant that if the guest set up the HSTR_EL2 register we would
> incorrectly trap even for accesses from Secure EL0 and EL1.
> 
> Add the missing checks. (Other places where we look at HSTR_EL2
> for the not-in-v8A bits TTEE and TJDBX are already checking that
> we are in NS EL0 or EL1, so there we alredy know EL2 is enabled.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c    | 2 +-
>   target/arm/op_helper.c | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 6f6772d8e04..66966869218 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11716,7 +11716,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
>           DP_TBFLAG_A32(flags, VFPEN, 1);
>       }
>   
> -    if (el < 2 && env->cp15.hstr_el2 &&
> +    if (el < 2 && env->cp15.hstr_el2 && arm_is_el2_enabled(env) &&
>           (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

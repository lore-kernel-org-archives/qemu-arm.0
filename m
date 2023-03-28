Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2831333ejb;
        Tue, 28 Mar 2023 10:43:57 -0700 (PDT)
X-Received: by 2002:a17:902:e80c:b0:19e:82aa:dc8a with SMTP id u12-20020a170902e80c00b0019e82aadc8amr20762913plg.22.1680025437216;
        Tue, 28 Mar 2023 10:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680025437; cv=none;
        d=google.com; s=arc-20160816;
        b=isTtuBbyHUGV5IoPJ3kasF8AtjY4i/Q0QHKDWEHcMzhI3jgAra517TrFHsrU1JewYS
         haMawlidIML6DVoI9BR+HKjllfAWPKAfYt/qXKxlzeU7m8k97F7dWRccAi+Zs5nxY8Wy
         yXRFwvCWYe4NaSf/39o9WgDn8s3SAzmRF/+nIgW6YclsWyEdwzXUKCiASpRUMnhCjVFw
         F81qDZfBvXfYwyDKi8wdPYu3PiIZqcKZJ5KCWXw1QrM9YG+RZyJBXl3gbSe3SsbrkWYE
         /OU1Toicf5C+yCHGNUvrPWGN7+6R9Xze1rk3SjKltcJhQnMrMiA90Sad7SUmnlVoCzR5
         vqhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=OXgeFj8HeZZWMYQ29opeCFN4mKNrMXlE/BhUqQhRi60=;
        b=oUB5E01Ohs0z/bCi8AhDC3sE8cH/+PCF8oSpLrN1PlsIARv1xd85SE2ICFWI7saJvq
         s9Aj8moUwqsUoofxAs2hBMWi+z4dIU7+kLlRsACqVhQHqGeZmLlZC8LfGr+231ihuN6s
         3jwJqiH7Ex7fEe2j4AkfFnoapsdJefdnjZ+DNGGu9FTIAlhBEpOJthrrrOFfuEJt0SSK
         STBKUndc+/MvPrJULruN1NdyKAM8QfsJy7Bd8jqsZKZW7pm/e2xZRMtZ4mdpuiPB9Ces
         bhzmtbYg2Q/jjdP37Sc/uAdNyFJ/AlOZuTlotqQDNR5iJ5xCsYk7zyLXQED86SLRHHT1
         zVSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GTi5S1Op;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 21-20020a170902c21500b0019eb36f76ebsor11998769pll.204.2023.03.28.10.43.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Mar 2023 10:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GTi5S1Op;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680025436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXgeFj8HeZZWMYQ29opeCFN4mKNrMXlE/BhUqQhRi60=;
        b=GTi5S1OpGaJHYzB2QwQwi8aLpAc6k1aFr85xKro7FFc8mPcrMKFRKbO5EV5zhRahNJ
         sem7uixXtldpnBvjrM8ErFjMwpckDnrRCOJsCADZL74qzB+IAMg0MFBvmy2dU+/DDzQQ
         qHU3ehPwf2iZdIvjmBkmeFY4Kgs2/Qh96WSAS/GR6hCjtOR+Ce58cBNMM9V991V96cor
         XXgoh4NEUZweub2IsTXTE4S9Tu3V0Z8+szcx1Quu4ws5YPdnQK7Q99pQVin2UUBfU+IL
         fkTUSR7c2AZHWOA/vnhrvY7nvYakyQyvAjldOYzXK3BNTNXbnTLMrkVPMr/bvsxQlm5z
         4P4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680025436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXgeFj8HeZZWMYQ29opeCFN4mKNrMXlE/BhUqQhRi60=;
        b=YrsnfELMBL72FhHU1OMWnCnB0EZHbGzF3gh7VJ2Ag9APawx1qMN7/HKcc+gA9hwGzy
         ZivrzdBinWJs94ghp6DO087Fkuy3E+Ah6Z8qInh1oMdijyL6150RQH43j06PoR76whPT
         7bS6d0U5BXH5S7BQ38cHSBGkjRvxd5F2T/JqNnKwee5rkdoCDCAS/vUZa8SIVU3N96BU
         4uUZS2NXIcAGNeXBCpdkTMpPMvpX8OsfQP/BeP2en/jFbsOXOPLi1NzDT8SOPo08+kCS
         k/OGx8OKgq9CwiS6QJcQFwtNDvGhP8uCZU5/0CvpYHhbH6glLfIFiyeahWjLIaYVHspm
         lDcA==
X-Gm-Message-State: AAQBX9f11Nsp1iHev5FybHTrdAPczq60lah11nB38CDxWQtsAS4iD6uq
	xI6/XhIFdm2YiSIwN9b36E1J0kIM
X-Google-Smtp-Source: AKy350Z+/qXMv+UayOrNFhoUXiUiu0/aNdMFOWlhfatqwgpRdfjqi+Xtp88FTOKUg3bwZICzL0CF/w==
X-Received: by 2002:a17:902:db0d:b0:1a1:e410:a1ff with SMTP id m13-20020a170902db0d00b001a1e410a1ffmr20089619plx.24.1680025436663;
        Tue, 28 Mar 2023 10:43:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:1541:f901:396:9f0d:afc2:978e? ([2602:ae:1541:f901:396:9f0d:afc2:978e])
        by smtp.gmail.com with ESMTPSA id n6-20020a170902968600b001a194df5a58sm21429813plp.167.2023.03.28.10.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 10:43:56 -0700 (PDT)
Message-ID: <19a70869-d4d4-3f57-4d9e-3c4b225eade8@linaro.org>
Date: Tue, 28 Mar 2023 10:43:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0 v2 2/2] target/arm/pauth: Inline
 pauth_param_mask() and pauth_ptr_mask()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Fabiano Rosas <farosas@suse.de>
References: <20230328133054.6553-1-philmd@linaro.org>
 <20230328133054.6553-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230328133054.6553-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: /GkFXBQX1UEh

On 3/28/23 06:30, Philippe Mathieu-Daudé wrote:
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 673519a24a..a617466fa8 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1389,6 +1389,14 @@ int exception_target_el(CPUARMState *env);
>   bool arm_singlestep_active(CPUARMState *env);
>   bool arm_generate_debug_exceptions(CPUARMState *env);
>   
> +static inline uint64_t pauth_param_mask(ARMVAParameters param)

Perhaps pauth_ptr_mask_param, or just pauth_ptr_mask (see below).

> +static inline uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
> +{
> +    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
> +    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
> +
> +    return pauth_param_mask(param);
> +}

This is only used by gdbstub.  Just put it there.  Perhaps merge it with 
aarch64_gdb_get_pauth_reg directly, so that we can use the simpler 'pauth_ptr_mask' name 
above.


Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

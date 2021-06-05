Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2242592lfa;
        Sat, 5 Jun 2021 13:06:27 -0700 (PDT)
X-Received: by 2002:a63:a1c:: with SMTP id 28mr11085220pgk.440.1622923587334;
        Sat, 05 Jun 2021 13:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622923587; cv=none;
        d=google.com; s=arc-20160816;
        b=aRjfStGssAVDwduvLiC7M86RWjpYryhY3O27BScH5XQcQ3MPAJPYMQ9QEe26I2lfbg
         bHLa8NyURmn4Ait9Y91hjSQwVhlnwx7vqeuFBvTQYXIqFmB4lzQWeXa0j2Wflxt4Daxb
         +Se7P6aq6OHI4cODF2KG9MGtOFM4ip3yVw8l+0/isqBv1tKkYDfoYt9vnYNLGzCpaO/B
         2n5hqAvyJ6TBSfOqIym/NeTtrNC5U/RFaXY5cjsVT1/fxb917XSbuYE6uCWCxGSxQOgE
         CjyZC4IxF7r+lhgFnn3U9rUIOdfI4VXweFPdATmxc11Jn1OK1toLysiDhcN+338QCe3R
         PJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=DZoJBOcM9Bnc2FNUh3KhN4JxUvpuH1zV3W6SFsyhlHc=;
        b=soxS8//KoKgEf5U17xNfJBajtl4DBq4JP8RV/GO3H6OKYIXA6JqiEzM37glCu6Jt3D
         1yCInsxfXMzExnGsmKYYfEEkrofSXnkppQpLgKrhQzhzcjJZvS1pP6sio818EZyG2nfJ
         5jlisIAc99vqEs9x/38RF3YiSP2VTIB0mcXU8XCAgcCpIwlcSIaa2G+cdoW1zLFwrIX8
         WROy8+CTKdI1/MBkEWsnoxomubPOom5IChJUnGfyez3Mu4xNcsTQfPam6Y2cKqO+TQn2
         +oQrCmdLgc4iuPfAX9C2bzPqPauDQpb45M4fh629C3kg4Bz9eKcjTdr6nMzg4VI6gXYv
         TWYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qTN5P5hE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c1sor2651063pfl.66.2021.06.05.13.06.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 13:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qTN5P5hE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DZoJBOcM9Bnc2FNUh3KhN4JxUvpuH1zV3W6SFsyhlHc=;
        b=qTN5P5hESAKnvN63MIhOcwvcEgMl1QQiHDUcCLIITotD1q2XgVPJB0tRZLy1eaLi5B
         Ey1pAvOSV8uhWzOGen1Sek4wr6bYZ0EoKp5zhvSIJF7c9H1zvVRreTL8RPZtxlntY2yv
         xUwoatyr+B1rfLFFImbBAXEr7EDNaGhGd2jYFvy1xf8hUSNye7qf195XdgDUgvcNXP7X
         qvtvCwxWj/Y6oqJ0tsy8uWgLApQ2rWqkaUgzZ9QAiE8bT6RVQ4sH65573Hk7JdKfw4jf
         sDRR4mbkPF3G+0gGUDCAI+E4DLjHe/Akh1kUWixkLIVCz9nuUHYRY7CnJ2PM/q8I5d4r
         RkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DZoJBOcM9Bnc2FNUh3KhN4JxUvpuH1zV3W6SFsyhlHc=;
        b=SRzA3novHAOqPak1tr2cDQ+eZWM+Mumt0MubIG4fEU3rq9OfqaLuqrCx9ePPjIajfR
         YoFv1HICLExmpW0xKA6TR3pR/0iIKI6pk7a+5omAMpxuDXTjsJvHn6HB0kyxgPNSSNN2
         SlfOqRx/Ghc0YxQsIhcs1tPtycVWWDzkscwsE2F7DA0+ybmKTVCzjqUd+ns46Iti28mz
         5hbdSOOVYVN3QnyDKu3JIfdkA3xPTW1q/EbDkykf4wfrHZ4S/cQoFxOeSpHeYMeOa0On
         IBUslMBD60DXecTUGJN1x0hNo5oRlia3xiMxXVrgWr6I8LepUbl2dDtpIroNJI7z/EDn
         llCg==
X-Gm-Message-State: AOAM533ldOPKFr6xZBdxRH2C4ZGCysInaIZbCMLN7x7SR7JT46WphdbB
	R+feDeD+m5sqmHlenkaxSQuujMrWV/eGqKDw
X-Google-Smtp-Source: ABdhPJyiU57RcB3aKV3CVNNfDqCP4UxIJwdSJUl6bg/hOrw9chfS2MGrSOX9DYJDt0eR0eXErxru6Q==
X-Received: by 2002:a05:6a00:b83:b029:2ec:7400:ae59 with SMTP id g3-20020a056a000b83b02902ec7400ae59mr10514904pfj.11.1622923586857;
        Sat, 05 Jun 2021 13:06:26 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id s22sm4872441pfd.94.2021.06.05.13.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 13:06:26 -0700 (PDT)
Subject: Re: [PATCH v16 76/99] target/arm: restrict rebuild_hflags_a64 to
 TARGET_AARCH64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-77-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <408c9eb3-edc2-8675-e47d-be5db44f9766@linaro.org>
Date: Sat, 5 Jun 2021 13:06:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-77-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: zL7w8ZgC5viv

On 6/4/21 8:52 AM, Alex Bennée wrote:
> --- a/target/arm/tcg/helper.c
> +++ b/target/arm/tcg/helper.c
> @@ -999,6 +999,8 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
>       return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
>   }
>   
> +#ifdef TARGET_AARCH64
> +
>   static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>                                           ARMMMUIdx mmu_idx)
>   {
> @@ -1122,6 +1124,14 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>       return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
>   }
>   
> +#else
> +
> +QEMU_ERROR("this should have been optimized away!")
> +CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
> +                                 ARMMMUIdx mmu_idx);
> +
> +#endif /* TARGET_AARCH64 */
> +
>   static CPUARMTBFlags rebuild_hflags_internal(CPUARMState *env)
>   {
>       int el = arm_current_el(env);
> @@ -1183,6 +1193,7 @@ void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
>       env->hflags = rebuild_hflags_a32(env, fp_el, mmu_idx);
>   }
>   
> +#ifdef TARGET_AARCH64
>   void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
>   {
>       int fp_el = fp_exception_el(env, el);
> @@ -1190,6 +1201,7 @@ void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
>   
>       env->hflags = rebuild_hflags_a64(env, el, fp_el, mmu_idx);
>   }
> +#endif /* TARGET_AARCH64 */

It would be better to move some of this code to helper-a64.c, above multiple 
ifdefs.


r~

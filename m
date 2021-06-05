Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2238979lfa;
        Sat, 5 Jun 2021 13:00:11 -0700 (PDT)
X-Received: by 2002:a17:90a:4e85:: with SMTP id o5mr15901276pjh.22.1622923211346;
        Sat, 05 Jun 2021 13:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622923211; cv=none;
        d=google.com; s=arc-20160816;
        b=ijXMeE/oyTPIur4f3V/nGQ8m4nb/rac8elenjfvegtEJEIvjPTeVyZgLFxFoAd+7Z0
         sHfPmrr6qUWxEQiYYyppRzQlqYxZJF9jsYgGm5jpd+ABUEXSu8Gul0ASGnfWUZUOC5hb
         RNsqt0++HMr1i5VKQYvT7LZo79wA9tHc+2C1TdNIrqhpvwOSyv2rfUdxZcx7ZEgJMZs/
         8NUZr9yoXfhYUSyrK3O9u1vXLarMQORX2WobL8fSNLru9VT50ML1XPt2UH0lqMP+t+PB
         p8Yz6Hy4qUYX2rs8EezZOMEWLZzknU+SxQ+Yh76IYIomNYbf+IQgGYIhgABimCFjUGYx
         Dhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=vtabhVWyeExzFJtIzVvcrT5DTtEeC5bdFzWj3cM5iyw=;
        b=WdycHnudZzEpGbWSDz0Ka17ZW17oHPtL2JD+prMef/Git2PJiosP+DUimjWFXkN29p
         TygdQeCPrdpvBN2cX6thGMMNMtjUQGSkfu8qCc389t/gpTSKetQUsERpWmvgps2Of/o4
         a3RReAe2lgnUfNuWqkV91OX6tegGu/EUKP+uh8zbx+2qo4wGQ0q8dTxTyXy3Pg7QcdHh
         5p+dY8mamOX/Xs8Wb0/Qx/YYZtL5/ZqqhEBmr8GmvJi+ZZsLXznxa4Zm0jNmTCSZaViO
         mJRdCDCOfudLKMFbh50k2TxkQpDPK/SgT6+w1uF0iUBFvWoEN3x9yZoSHXEeWwLxJSwb
         5LVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pz6luJi0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i21sor2966809pfr.57.2021.06.05.13.00.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 13:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pz6luJi0;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vtabhVWyeExzFJtIzVvcrT5DTtEeC5bdFzWj3cM5iyw=;
        b=Pz6luJi0xY0wGDjLfkUHUoQruUXoJSXD7aJ7WlU/ttkdr/wXgRJvtVRIrt9CQ+q/wt
         i7CwYQRsbz4tEGCemOrWwMYXFWC+atyD7vo2imosvpR4X1yH00nvAq0CnUsQCwkiteYQ
         JyTwhHD7Xk6PcC3OGPPk8qCDoPaI9FqBRqbAg0dcMU5SHP6TstPSv37N48kzQMzfzNXA
         ZEYWXis2Prqm31qG4wDOQNtSFgH5UBSIe8MK4JBbf6ysQu+uHZ57vxnu9V2YvAl47Kup
         1gGscdVJqdbGhTdJJanN+sIMMK6l6rQZmICUmjWTHKcaEE8cJUPsz57vG35a1DdUAU1L
         1Obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vtabhVWyeExzFJtIzVvcrT5DTtEeC5bdFzWj3cM5iyw=;
        b=Y1/DValXmyBLqXDWJeAk172bM1ocCJe6Peuhw88UZIl5LMTI37VnoMOtxPGOXSGesO
         vnKWyS//dGU0V/suupRFbmvFlw+TGMnfUFvY+hCT9joa58z8Uzsala0NKtiQA6fIw76/
         Szjm6ACljCSPXLWXFHIFUp6OtGTGwQ2asa9BSFA0TpCwfcdIihODjfemQmfy6hupHb84
         oNIwwhOawfPHj1eTOxSaYLO5Pm1cAGvvyN0D+yTEUhzll/w4vhruz/5cL6zx5hPzwyJ4
         mt3vuKJES9+IibKcgBxb7xY621+Ps9wl+01QgpD0q21vgCjtl1cYmd0sN6j7sHT53hVG
         c1Ow==
X-Gm-Message-State: AOAM532XP6DYr81bfzfCdSatjtqgh3RLL9yLsaAQEpElGC6dTyMwd7l/
	gGwRugxxPbMjYX9m6XUWcG9iBmXu
X-Google-Smtp-Source: ABdhPJx3YDXhgTWJ0ZgEf2V24HNA5rc53QDgBg9oEcJYXlwU65Qdl0UeVZg24+3uINaAt8IvFYqZFQ==
X-Received: by 2002:a62:860a:0:b029:2ec:81e1:23e4 with SMTP id x10-20020a62860a0000b02902ec81e123e4mr9426489pfd.11.1622923210832;
        Sat, 05 Jun 2021 13:00:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id d15sm7668459pjr.47.2021.06.05.13.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 13:00:10 -0700 (PDT)
Subject: Re: [PATCH v16 75/99] target/arm: make is_aa64 and arm_el_is_aa64 a
 macro for !TARGET_AARCH64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-76-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <420c1b1e-fc9a-186d-d38e-a8b1482c62ba@linaro.org>
Date: Sat, 5 Jun 2021 13:00:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-76-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /x9EUpVXBqF0

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> when TARGET_AARCH64 is not defined, it is helpful to make
> is_aa64() and arm_el_is_aa64 macros defined to "false".
> 
> This way we can make more code TARGET_AARCH64-only.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu.h | 37 ++++++++++++++++++++++++-------------
>   1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b9b9bd8b01..8614948543 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1060,6 +1060,11 @@ void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
>   void aarch64_sve_change_el(CPUARMState *env, int old_el,
>                              int new_el, bool el0_a64);
>   
> +static inline bool is_a64(CPUARMState *env)
> +{
> +    return env->aarch64;
> +}
> +
>   /*
>    * SVE registers are encoded in KVM's memory in an endianness-invariant format.
>    * The byte at offset i from the start of the in-memory representation contains
> @@ -1089,7 +1094,10 @@ static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq) { }
>   static inline void aarch64_sve_change_el(CPUARMState *env, int o,
>                                            int n, bool a)
>   { }
> -#endif
> +
> +#define is_a64(env) ((void)env, false)

In theory, parenthesis are required around the env expansion.

> +#define arm_el_is_aa64(env, el) ((void)env, (void)el, false)

Likewise.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp273581njj;
        Thu, 1 May 2025 08:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNoalrGytF1EvHwCnUCV8/8Jl86cQFUnaG6ehXnIUX+2emlDyuor9mN6dontpEWTMcWbLRi2FFHsZcVg==@linaro.org
X-Received: by 2002:a05:6a20:e616:b0:1f5:6e00:14c4 with SMTP id adf61e73a8af0-20aa46800dfmr9908852637.42.1746112544567;
        Thu, 01 May 2025 08:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112544; cv=none;
        d=google.com; s=arc-20240605;
        b=KE6FT0YcyWAaWd9kEWDPALZDkMTzgWI3W8uvnzhfMFketX6zYU4rIr/3Gbq/VcxAdZ
         3F9OidSfhjInHIix4roGUoOt4ZEzldJM+w7lw9SGX2nzuMaT0M9FymPQ9PrG+UNFZ/KY
         gVNaBrD0em5GueTHjYF6oSC1hx61ADHcsSPpJfOQJKsdVBQ2uUTsoPg340zw44uYQgwY
         xyVHntTekuftZR5jh6BF+JbMTUuZqLpkV2kM9hGFZy6bPm+59kIDx3yJXiTF6YP8EjQV
         KoVjyTX/BsyprERdDL18icmk5hFZm/W275E6uG973FbNEfV3TG7qAmcJhO6Y1jgq7zN4
         IABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=o9YF4VdarcUzqcru+xCQ9pFm43bwCCqoeOh82TAihtU=;
        fh=WVEbCw+8qn28FQQyab2UBxq2zDBcsdIcFXfP/otKrdw=;
        b=RWU3kHUUw2rPWR2TvcHpEhEd4S1X5D2IsaTjF5g1G/OCMv0uDMW+nEMTZcEU868WAE
         j5Xc/TJqvDSre08/kBvGUSwgUcwfnx/ltArEbdx//ZtP1eulsPqGUTjKFN4KUIcE4qa7
         /slT4fHIVmq+xxeYdrbQs/35siMZ9/gu8DUEMO78DPJttuGyZMQAd13zACcq36qhqY7O
         21NYoF9vePcS85Rkyw1NzBLP0PubjapuDJMlp0L9kAIAGCI1NJt4hPyT8CdGAXAzxVje
         6rT+kUDL0pRVHAK6EIb7C+Ml2jMUCYkaZViplaYp9CX2zBIii98ZhDrAADzwMqmFhA40
         HRjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJWGYfG1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b1f9d5c7535sor565289a12.4.2025.05.01.08.15.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:15:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJWGYfG1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112544; x=1746717344; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9YF4VdarcUzqcru+xCQ9pFm43bwCCqoeOh82TAihtU=;
        b=JJWGYfG1ENeP/tJ2HAuYAmZBA5kJrHW6m4MjUD0C7JZUxmPNS2PM7eQampjV83A+jz
         A7OsLPt3QB5PRbY2oBvwJit2vh6ad+mtVAgBKwjB3kOvDBIph41i9vtj9J1DzSUnIPVR
         P5/4Z8PQ1Hg+Wt6DgAlmBWxZVIVQtt7xhGWlNDqv0sXoi0oqHkVVhNQE6BsSSljj/d2h
         p+Il55ebfT+7HJea0hMrW4lUG/cC15shF3/H+GLo9jotZnunCEAM0mQkAADaK5MYZUBo
         NXG3pN1aYCPuTXAlROK2zTkDSAUVvV6HBwt3oKtLrKJDkiIZpRac1qizQd+8C/X5qJyb
         /TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112544; x=1746717344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o9YF4VdarcUzqcru+xCQ9pFm43bwCCqoeOh82TAihtU=;
        b=r8rvy4HgFHM52stSt86SV9QCGM4kPFJvYq7rZ5zCw9oCyIYNYLWVeoYwUQNvUCIRqA
         +npGun00SLHyfRyYuf5UysAYI2ubLHTj6d+g6ErVtac+3pvMWoyq7W4+X7iOJNCDXb2z
         PB8ZRDXahQP+1xTs/zTcg+7065yrk/dFXMou6JPzBZhYhN1FFw5x5fAYgzZkmwtI3716
         ZLRPOG0NC9rt7/v8qdSKSGRcva7/VMbyOw+c7L6oiWDAmoqxOasH6ZTLmp/ytDdnHHt9
         Dcp++KS0pFeQEAZf0w7n/YzVwjtglGr8Zvb4DgNYPOOOlQ3N+y8UwPguRZgvDdyyXkqr
         A15w==
X-Forwarded-Encrypted: i=1; AJvYcCX78xI8zz4+JU2Q8n2q8/c0vMbZevOmewK/5ZGZpeQGH7+/qC6docmYZI/3K4sLbTyBp5IZiIaFtrZ+qA==@linaro.org
X-Gm-Message-State: AOJu0Ywul5/tpwLmi1dpBCAcPU00XOoeoNiPgJwdTs8DFboCACdMgiz0
	SPKiJHtNBczpYYO48smwQFCm7n04whVd9o2nYw0fUuaDwkBLTie17qiZJtyVqgr16W8j7iTfLfT
	cBT8=
X-Gm-Gg: ASbGncvxcwKXADsXo7gWs7w8uBXaPN6N7k/gS9tGw/EgYp4+6VwLM6JPpO/G7+6mjbq
	0IVn3r4O/4kQtEIhTc4INJLeYNkn5OHu6NK/93vBBbMT7YIW1eHVTgzy88n7NS3hs3yub/vyoqF
	HkO7uSMdKqTB/L4hbLwqYyYIB5C5HESln4nhVxNibjJTMZWq46YFft1ze/iwWNDvvmFqVXDhEKT
	0oJu/cmdkA/7PeXDIUKRFP5sT9oUMcUNzHmZbjNy4B40Riv+OCfIFuHr7QQJLIxwsX5u3wZpo5K
	T6/SpH4kz/l7UlUobuadV6XQxhZteFa1nzd46HUjNq5gX/KxCyUtA37g8088K9QtR4j/n22qasa
	V9ONGtZQ=
X-Google-Smtp-Source: AGHT+IERIGRaWjaqtZwcbtTyPeLfdjPE0lHKg9DKCKEf2LmmlpAdU1RNvXJwqWOBdTUZoY4u10k+pQ==
X-Received: by 2002:a17:90b:5388:b0:305:5f25:fd30 with SMTP id 98e67ed59e1d1-30a343ce769mr10555550a91.4.1746112544064;
        Thu, 01 May 2025 08:15:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34826760sm3755129a91.46.2025.05.01.08.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:15:43 -0700 (PDT)
Message-ID: <67d187a1-95d3-4e9a-a891-ae8090e7c6b6@linaro.org>
Date: Thu, 1 May 2025 08:15:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/33] target/arm/helper: replace target_ulong by vaddr
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-21-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-21-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: cbzB+7Fi2eiB

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 085c1656027..595d9334977 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -10641,7 +10641,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
>       unsigned int new_el = env->exception.target_el;
> -    target_ulong addr = env->cp15.vbar_el[new_el];
> +    vaddr addr = env->cp15.vbar_el[new_el];
>       unsigned int new_mode = aarch64_pstate_mode(new_el, true);
>       unsigned int old_mode;
>       unsigned int cur_el = arm_current_el(env);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

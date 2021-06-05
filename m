Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2295366lfa;
        Sat, 5 Jun 2021 15:14:55 -0700 (PDT)
X-Received: by 2002:a17:90b:3e8d:: with SMTP id rj13mr12544811pjb.159.1622931295109;
        Sat, 05 Jun 2021 15:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622931295; cv=none;
        d=google.com; s=arc-20160816;
        b=Fw4XggPJbcvSoUcvV+HQDNOy+bYhVHK8o0ZLpxGC7eUM5Dt3kTSACHjJUL1oxG03DQ
         iHXmaEUQ8VCTkzb3zk/rinCKjhTR7jfWDqHjJxNJCoSsxsV1KGztbblb+eT5uJchHZi5
         Yr/trPW0teL7q5XRszPhMRho578YVYzFVOTlIR7Q+sjdGgpgmGv48mYzuRJJqqtSF1Mz
         zb2dGHGpuvngYVS/6Gho6U8eWqEcFlzvLjIQmVfdM0qKJiQWJV8AONervpjDcwJ/dNTb
         eNV/4hNhAVs+hWjbe7wmg7RHgUsJZ1MZby54hWw9Wk3UhH8HwD+od5P8tqdWXNkdI7N1
         ERLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=MJjwxe7JAteDnTKhF2sh+LOaK+sU3QrsYOhr4lLVUo0=;
        b=HXa9BScYYVx2W/9mJgQE/7l9via2vcUqAdphV1Cv6P14SEHpGqKVQatjD8SV5YasOe
         of1rs6oGoG1NYzH9vYPlfKfjxt4hafOqvZJF2oDIPKV7AdffZ9rqwJwjwEegnBjmgb+Y
         En4jmOUkFISRFJGO+e2C/tuQrvzMGsghHtKwdLxPaYcjm51C6NpvtuBACqQcYf2XvNRP
         5iJk2afdvFYn4L7aML6j+SyKEQ2t3bPidqNl5fmnj0qBLBBMdqkE+ar96GCisXmVTRbP
         zuqcdeONBT1Ynn7Kmz732AfTFzAe7SW4XMRETfS9b60QVrC0vfnhObNsZ7kUv7pMuUfq
         xDLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gZkKWeHr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g10sor5721275plp.45.2021.06.05.15.14.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 15:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gZkKWeHr;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MJjwxe7JAteDnTKhF2sh+LOaK+sU3QrsYOhr4lLVUo0=;
        b=gZkKWeHruhWuyKPOjsbYtQ3ii+Z8M6R0A/Hg4oaYkxpW4YW/n/b+c09QMTgh5+LiUX
         mTjx4f80+V9e/m9YKxu5WUO/oItH0NWIidxnfGIKeyRhB1UMh0j0pBtHBR0XS2liyArh
         B4+aXOH7qZQ76TG6Tpne3ND5Q9SowSHxvFK9I4vB2ej8EYPozEOpGw5fpDbJHLWo/tRq
         A0XpOstn7X6jca/0AnmHQKsD2kpRTf9lypBRI+Y8UWEaMVLmDb/x1nDVOQTJe8J2K07l
         bgikVtSXX0ys9A3Uo5+ezoXr7bjrD9B6+87MlsJLq7XpWInaQIAEuiUgerPsu5mypXic
         nb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MJjwxe7JAteDnTKhF2sh+LOaK+sU3QrsYOhr4lLVUo0=;
        b=O8gWWHY1tDn4Qa1nAInRkdyukU4hCm3h4+ZjBXkJXGT0fnRvUaosJ+kvhzalSbGWhg
         v7uWd8VvxEiydrt8QrKLXF/ZEZ9n0DOO+8/ARcWQkdzpS6KVDNpjJiFlEaHmb+9zBCqQ
         mwb8gR2g/zOGKa0OZciLD2YwSFcXBm3vsMrbHzs9OmItQl8iHmqqiqwhWNfvhs7EBenm
         NwmEdDKY2nuMOBQEWiBBBCOoaapzAO/iav+6jAEBVF6EaExnhBaQklFYHVM7z4Q+uB4w
         70xWCg95C5/YIQp8B9Wkj8oQdI1L7W2s5HYcu+IlwyAfUM4AtpQroe1ondFs0KYxNKyV
         F8Zw==
X-Gm-Message-State: AOAM532qa7K85VOuHVEJRmr96zepEhnf6Y6YF0geH1yDWVwhIRbBFh1V
	2rUV4Un4/9YJKGgNvIe1ropbW6vY
X-Google-Smtp-Source: ABdhPJzc5l/ug8a4L8Y/Kbh2510ie1E8T5CSlXYcU3VcOvR5zuY2EFtVwmAvdw91zHq6wxZostauLQ==
X-Received: by 2002:a17:902:988d:b029:ef:68aa:d775 with SMTP id s13-20020a170902988db02900ef68aad775mr10515600plp.57.1622931294642;
        Sat, 05 Jun 2021 15:14:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id s24sm8209793pju.9.2021.06.05.15.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 15:14:54 -0700 (PDT)
Subject: Re: [PATCH v16 88/99] target/arm: cpu64: rename
 arm_cpu_finalize_features
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-89-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a4dd603-672f-aa43-c59a-79b0e29c6a76@linaro.org>
Date: Sat, 5 Jun 2021 15:14:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-89-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: yDBtCb4LWCtg

On 6/4/21 8:53 AM, Alex Bennée wrote:
> @@ -469,11 +469,10 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
>       return g_strdup("aarch64");
>   }
>   
> -void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>   {
>       Error *local_err = NULL;
>   
> -#ifdef TARGET_AARCH64
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>           if (!cpu_sve_finalize_features(cpu, &local_err)) {
>               error_propagate(errp, local_err);
> @@ -492,7 +491,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>               }
>           }
>       }
> -#endif /* TARGET_AARCH64 */
>   

The ifdef removal shouldn't be buried in a rename.


r~

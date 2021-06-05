Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2295075lfa;
        Sat, 5 Jun 2021 15:14:13 -0700 (PDT)
X-Received: by 2002:aa7:9912:0:b029:2e9:c61d:2f27 with SMTP id z18-20020aa799120000b02902e9c61d2f27mr11072155pff.60.1622931252890;
        Sat, 05 Jun 2021 15:14:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622931252; cv=none;
        d=google.com; s=arc-20160816;
        b=Ut7jCPVyYijTua95b/7OEBiAHwenfdOEFAIPJNnXdIE8R3CQfSnhRZwsTu5TMxnUTC
         utdrESTUho2zBFVcN1MFUscI49RarYQIUNqndE+8srvZjrZvWI0V4H3aUq7t7KhRKpu1
         8RuhJeryD2f30vDaoviqeVy0BQ8LB37FRBxddDxNBVFsaQn5Pta6J6QRD2x19B1cCR8H
         GkvZJkFUZbAlXXB8TFbLMkAIX4e9NWIpvnJYdc2hVQAN6rpkvC1y+0lStr+XHcwpU8Z/
         nwxlhkd23pUGNKUN8TUn67mz0ai3XQ3LSbf/WJP65M+gxRwogDjyF950HKisek9zJr9h
         1nQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Ch4/PIbrzUawveB5cBKf/HXBwMIDZk9V7lpdvUKfu3U=;
        b=Sm2PoFSXD8OKRWr6wwjM00Q7IiNmBFMH+tPxthwj6QvwzZvZk6dyv3ltgV3YbKWIkp
         1bcsdxusoKzN3KhZvGVbpZEudPCbFh4s6AqtaAe0HaaJHVB2g/e8Qhucn5PCL1Ucyka5
         fkHmE85lF0IQgcs8msTgy725/a78WM5lNbdt1cKUI2lZdZ5Sb4b3KXQMuHqC2UCqyMpz
         9xyzqxYxgH2K854Bowl5S6UjvCzjK9vDuN14q45kYD6Nx9FQyY7EKn5Eyh7QZzW0tXZV
         HqzTycnAOj7UV2xSYTcqMRclH48BOociUYIOTepPl2vTeWJzrBqdxL40rH/y0N83qOaP
         FTPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j+/etm1t";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p5sor3085201pgd.63.2021.06.05.15.14.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 15:14:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j+/etm1t";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ch4/PIbrzUawveB5cBKf/HXBwMIDZk9V7lpdvUKfu3U=;
        b=j+/etm1teDijmRNbYJlpYBRrdKOGr4yZOnpKx3agWoKmWmUxq2C4HjChO6GBSS1iUm
         m2o1I2XgDGyK5mWBUsyk7fvqkLr00uMnd8h1L6++G09lmuSYdgjFiPWvtF29qpFdVF2j
         fOfdpiRT3tKEVBTHMCu3mWQUwXCL3EDtjgc1CH99kb7RsN039lAzZFyzfJ+SvwFQxYYD
         L7ChVQA3vyVPVfsnUj8d/DegpBsp926cLk6Eb31xrkpWyFJJ0MroWWuNQYrqnJT0MfxD
         S6PH9WPTUF872AUtjnP1+xCiBEH7QDsVjc04QbSY70NRS6ry9Qmmy57GIKD/frg5yL2L
         nM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ch4/PIbrzUawveB5cBKf/HXBwMIDZk9V7lpdvUKfu3U=;
        b=LFD3miV/djd8K50HyQXw8CC/gkyP3Bk/RFl5KCcP5QbAeWCik0PZCRgGIHN0YAxy/u
         scubrkKQluJrwpsfI18iGvpq2kaIEokBLryrCWOZZxuxhcUBpgddA9ewM5Nc2U7Cxz1y
         P8O1B6/+IYf4rD4k93+exIFDVKXkIfoR8njITo+3K2qW9DvKHFj8sZrDzgPOEu53DoW1
         iVSmTaWqZBOayyhHFMwZZVchLx1yzqk1i4EOF1lMac7txEocd2qbNIWilJ17h0nrNead
         PfsmoIq7fAv8A9eWcY+/+q2Mu0c527VfJFHTWK3rHo/vXdQ+SL2lSzEbQJc7nr1iDJYq
         TZzw==
X-Gm-Message-State: AOAM531suIWVaNNqP7aIR0/QULwDsHR/W3PrIhHTU8VWbQf9l44RUQgn
	YX4IVXvJskHNFeFzhWc6KpuOPnxi
X-Google-Smtp-Source: ABdhPJzQedStELT7z+saYLHHX71gtqS930a8UPNW2GJ/X2ZsEbs2SkhvHtKmAkX7BUEPiRM/PECP2w==
X-Received: by 2002:a63:475b:: with SMTP id w27mr11186935pgk.305.1622931252425;
        Sat, 05 Jun 2021 15:14:12 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id m1sm5161438pgd.78.2021.06.05.15.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 15:14:12 -0700 (PDT)
Subject: Re: [PATCH v16 87/99] target/arm: move arm_cpu_finalize_features into
 cpu64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-88-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9724660-5f12-ebe3-883b-40b8d8906276@linaro.org>
Date: Sat, 5 Jun 2021 15:14:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-88-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 7+dlWt3We9xj

On 6/4/21 8:53 AM, Alex Bennée wrote:
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index fefb6954fc..c762f3f07a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -469,6 +469,40 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
>       return g_strdup("aarch64");
>   }
>   
> +void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
> +{
> +    Error *local_err = NULL;
> +
> +#ifdef TARGET_AARCH64
> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +        if (!cpu_sve_finalize_features(cpu, &local_err)) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        /*
> +         * KVM does not support modifications to this feature.
> +         * We have not registered the cpu properties when KVM
> +         * is in use, so the user will not be able to set them.
> +         */
> +        if (tcg_enabled()) {
> +            if (!cpu_pauth_finalize(cpu, &local_err)) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
> +        }
> +    }
> +#endif /* TARGET_AARCH64 */

These ifdefs are useless.

> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 0c72bf7c31..95c1e72cd1 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -184,9 +184,11 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>           if (!err) {
>               visit_check_struct(visitor, &err);
>           }
> +#ifdef TARGET_AARCH64
>           if (!err) {
>               arm_cpu_finalize_features(ARM_CPU(obj), &err);
>           }
> +#endif /* TARGET_AARCH64 */
>           visit_end_struct(visitor, NULL);
>           visit_free(visitor);
>           if (err) {
> @@ -195,7 +197,9 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>               return NULL;
>           }
>       } else {
> +#ifdef TARGET_AARCH64
>           arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
> +#endif /* TARGET_AARCH64 */

Not keen on all of the extra ifdefs here.


r~

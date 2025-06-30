Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2606192dye;
        Mon, 30 Jun 2025 10:03:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjiCcQslGFnaOZZqrXVrO7V8/SP45B0qMk17BL/kS36C+2f0Ebd8Byol5OUFd4YiP+9t96O7ka9u8WSA==@linaro.org
X-Received: by 2002:a17:902:e849:b0:234:986c:66d5 with SMTP id d9443c01a7336-23ac3bffbc6mr268790475ad.5.1751302993857;
        Mon, 30 Jun 2025 10:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751302993; cv=none;
        d=google.com; s=arc-20240605;
        b=Uiof6Hmi6QbXTGDy/Fr9Z5hbMUJKIHErAe1jafvIHanZp9b4J5XLPXvi6RM1kssMT5
         Y3neT8MYk5g/gmXUmvNC3vPS3OnszkAvWnZqF7GFYdvcWgAQgH+uwrA2/ZvYIU37mNWB
         b5UGmOZjrlM8KfD50RmQ5dpSpo7h1b3jWTlTs4T6cBvA7geXObcMsa/u0ANZksKVsq6I
         HhmOAZcoSAp+nS8nhRrjAir3si6pT8STrBMtW6Z7PZQgNI0d1tZQ/Y++O83OMoLO2D1E
         DB4/3k/rEwzIPZqcwRjdiWQT/4Pq4UixrwXuqSTuPbJY18RjOlG0srQn54vHK4qJz0Vv
         hEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZrwSuaD+VoYFdUIXCegGF1YB386Md8D+3yHN0v09ydk=;
        fh=JC4IpmcJOsoTPvjKLRVpgAn90KuvDZfjiIQ898n3XFU=;
        b=A9C6a07QpFY2nNKvPq3KhycerI61wbw2iYis1WqSdEvhlvW3n9tTcOfa2PuJHYq2nU
         OGZhBdxFLmY/7FJYb7giK+pmjg+RuMEYnj4dEFTiK809q9EaFhhe7faapyZ3QmZo+Hg9
         yQXVFACjHTYCAtLkqPsaiSPgcHAZ2/ovBsmETvHHVPYMXW+JtGKFAa0lHTw/IbqzT2Oa
         moZ5BgVfLag0YT6PTuIpUOhayW4VWYZf3BmhvGwR1YS8pqKVmLM+zjw6tyHncgKZix9b
         PytHmwvoqRoTjb4t7K2aQTn1EiUeZoSh1fViQzmIt0fkm/lx6N3bK0jic8R0UeB2/CQB
         IhyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yzQPQr9V;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-23abe35d28asor64023225ad.9.2025.06.30.10.03.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 10:03:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yzQPQr9V;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302993; x=1751907793; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrwSuaD+VoYFdUIXCegGF1YB386Md8D+3yHN0v09ydk=;
        b=yzQPQr9VE999hCFzPdTq0IP5JJYPJ3bHY7EO2LiXjJk9Ss9792axlIfx3hAtT/UCac
         jFvQrcwjXHGoaUzPu7lwePz7TD7/vzjddcqWPcKBnW/59cOmpDrTCcaIBfAY5WYf42EK
         TRDtRvUDnIKZb4Vo6iH9kQyKzFkyW5jdP6IvZT/iHjm+Dguz7iUGZwC7cKvu6RQAjCzt
         6u13h4cpoLKqoI2TDrjIdxLYl5I5cBbrAC/ZyCQI8+iTBfPsvrBnQX34Odg1TCG9AzIX
         Iuj/nsCYV/GognJEIekVNkoNwahZmHKLNW7GTVhMvJRk4Y9xOIyyfO0IboUZus746CA0
         K0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302993; x=1751907793;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrwSuaD+VoYFdUIXCegGF1YB386Md8D+3yHN0v09ydk=;
        b=ZyhRi4s0o5+eFmpGlZjJ1c7BYIl9i0hI0ExmwmADTYdKtnPzvl0NKUGe/IaPGxzb8W
         qrIKnB1kl/l4SeKfq4lJ+Q6QZJV3TGTrwI0W001glZhyxaV60sLEwrhnchYCgJUKsm79
         2MEtX2nFnhWeIPYiHIRAk6GBvfTnAfmsx08FDjeA3y3EFuZ3JyBKMtdC9vMhCB4oAlEr
         MG9AKm+TBHgt8rVL0gZ/sRWs3ryVy8KZKsb+Cd/lPSZxFg/tGPZOTut3tByG/xiN9S9l
         HGdsE20r9A/69w4QFSbS9WRRIPCGoRQE1RRlQ4Z700IbE7uDp9s0GAf+7iG6iDDqHGqP
         voNA==
X-Forwarded-Encrypted: i=1; AJvYcCV44hf9ZZWM8Qb44c13we+ICU0d7qJGpi6TJSEple+T4/l6VJtvnGcz7pz099EWJBfRO242T3JbNL0sRA==@linaro.org
X-Gm-Message-State: AOJu0YzsniCjeu4BQf6O5ZFFODto4gGb46H8fQGEZxvGTEqlPyOgtYsm
	tKPFuFiyv1A+fngzOFs/e/vH5SLsg/85KzdNyRQe/z6jFJwEftbydjaQ2DlHW/EI6Bnvm6VuA27
	FcQMdXcY=
X-Gm-Gg: ASbGncvTD6Hnzwr1fWiqSWv1+pWdg9n/Lu41phvDHnZoNX6HQ3WESe/nsujnE3IGv6C
	kysombypFcgwgGNTzDcDxmDqJNPcuE5e+9AwW/ThFSz3qXS6DQWcIbU3z3sm0kcWtrXB0emu/Iw
	+wV1Py0LufyROJwGQVaT3NN9HV5K2tAKtSJqyo/0BGERMDPXblf96B3uNvKmfafzZeELhZf0QUw
	xSPCg5+HNhXypia/e/vm8GXadcw6Z5xQTnBCftuICO6gn9ZLqS17koAnVGBD9yaffwGSL49WfFu
	jJ3iFTBii/1zgGGweJZzTLgK3lBTJ70oQx1NdY15kQOIogXartNlSHRj7t5Imt1JehZAgWLOL8Y
	=
X-Google-Smtp-Source: AGHT+IF2HmnU1qny5QzbedEQ6+Ndfh4HmISjPj7+aPFVUka9xFkbRFUIIEsxA4sS2DiQKku1YCJ0/w==
X-Received: by 2002:a17:903:3d0b:b0:235:f078:473e with SMTP id d9443c01a7336-23ac4682e55mr220615365ad.43.1751302993272;
        Mon, 30 Jun 2025 10:03:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b871csm84620735ad.187.2025.06.30.10.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:03:12 -0700 (PDT)
Message-ID: <93cc9ec2-2f79-43df-96e3-fb216862561c@linaro.org>
Date: Mon, 30 Jun 2025 10:03:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] target/arm: Better describe PMU depends on TCG or HVF
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
References: <20250630130937.3487-1-philmd@linaro.org>
 <20250630130937.3487-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250630130937.3487-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: CkiSDW38o25+

On 6/30/25 6:09 AM, Philippe Mathieu-Daudé wrote:
> Simplify PMU logic by rewriting '!KVM' as 'TCG || HVF'
> (ignoring QTest, because vCPUs are not available there).
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c     |  2 +-
>   target/arm/machine.c | 10 +++++-----
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b6a8ba83a46..0311ff315fe 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2352,7 +2352,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>       if (arm_feature(env, ARM_FEATURE_PMU)) {
>           pmu_init(cpu);
>   
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled() || hvf_enabled()) {
>               arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
>               arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
>           }
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index e442d485241..baa7ad25ca9 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -1,7 +1,7 @@
>   #include "qemu/osdep.h"
>   #include "cpu.h"
>   #include "qemu/error-report.h"
> -#include "system/kvm.h"
> +#include "system/hvf.h"
>   #include "system/tcg.h"
>   #include "kvm_arm.h"
>   #include "internals.h"
> @@ -853,7 +853,7 @@ static int cpu_pre_save(void *opaque)
>   {
>       ARMCPU *cpu = opaque;
>   
> -    if (!kvm_enabled()) {
> +    if (tcg_enabled() || hvf_enabled()) {
>           pmu_op_start(&cpu->env);
>       }
>   
> @@ -888,7 +888,7 @@ static int cpu_post_save(void *opaque)
>   {
>       ARMCPU *cpu = opaque;
>   
> -    if (!kvm_enabled()) {
> +    if (tcg_enabled() || hvf_enabled()) {
>           pmu_op_finish(&cpu->env);
>       }
>   
> @@ -921,7 +921,7 @@ static int cpu_pre_load(void *opaque)
>        */
>       env->irq_line_state = UINT32_MAX;
>   
> -    if (!kvm_enabled()) {
> +    if (tcg_enabled() || hvf_enabled()) {
>           pmu_op_start(env);
>       }
>   
> @@ -1013,7 +1013,7 @@ static int cpu_post_load(void *opaque, int version_id)
>           }
>       }
>   
> -    if (!kvm_enabled()) {
> +    if (tcg_enabled() || hvf_enabled()) {
>           pmu_op_finish(env);
>       }
>   

If I understand correctly, this is supported for tcg and hvf, but not 
kvm, right?
I'm just a bit confused by commit description mentioning "simplify 
logic", which is more "make it explicit".

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Thanks,
Pierrick

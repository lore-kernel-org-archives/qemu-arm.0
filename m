Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2144305lfa;
        Sat, 5 Jun 2021 09:54:38 -0700 (PDT)
X-Received: by 2002:a17:902:6a84:b029:f3:f285:7d8 with SMTP id n4-20020a1709026a84b02900f3f28507d8mr9616754plk.57.1622912078419;
        Sat, 05 Jun 2021 09:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622912078; cv=none;
        d=google.com; s=arc-20160816;
        b=wARhMa/DMIhiW/2ZqsgBAaKb+UvMLCBxF41KXn1oRuA/y/67aX6md6YZeL/hjt5Roj
         5FsDPE/Q2hodru9jpjohOp/p0FM3gz2lwxWrSt15mS0nA83TVl86UGLlV/GSIY7wsduN
         POKqZmpp1/SOxO3oOpBvEErhWhpvEB3lGHphaxT4Phkp6LptU1jA+Tu6zEOf9DmZHM2y
         uCXkvj7POap86ctQw3t4jIt4EV7oZZt54D8c3IVetsRsMgkf5mI2A5cEVU5nyLTgNArD
         4ix5/FcrmEigfd19zlAytEI4oV+0NhdtCvZW1eO8hAZK6isOGl4rCWlyEAQEZBzDonB7
         S9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ZO+DyZ1fUy+kvlyAg/MjXMo6ajXXE+n+Yb2OEz6f7nc=;
        b=VHSfzXevdDa1ing5XABj5tXKadBLT+wN/drzmiJuIuU19HaoZZGqk+ssWLkdxIeLbx
         FHuTIZ/+hyIhQbocU2RVCP1MpqwWAm00fOUyt7ZM4K8zuxGFU6XjGTe8yZsjSstLwI1g
         Da8VzTrwwsjmECZyxzTkHflRxDyQJaodI/vPiZ5M7MhyiX3JREfDZVZv0PFuTrbEif2n
         moBF717E0yIn+0nje/iNWgEHpPHRfq82efjdPkvUy47iCwsCNzEe9chh81wjeVJCy59u
         gzXCf1HejiyKIgRd2fT/jy/eoqjWRWn2A8T3y7dwFvfR/hNQ/gOqPiY4soXE8nqgi14a
         OudA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMY34mpu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w24sor2873075pgh.53.2021.06.05.09.54.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 09:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vMY34mpu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZO+DyZ1fUy+kvlyAg/MjXMo6ajXXE+n+Yb2OEz6f7nc=;
        b=vMY34mpuXRs68p1nxehZQpprEc0HXkHOpSHTzgrwHog0HkABXHukqJwgrqi+BGqOKQ
         eiEEpwdByoEfBFQ12mWqJSZC6l9I21yuaAB3L8qeWWqzwD/Sdv1lNjcehhgqy3pJWC2+
         EkfqbpzQ2HuYmRHq2Mgx0/qeCOazHG2UjsnipfD5IkSUyGM+uVFYoG/7pPt5utpPf8eZ
         FZmfsoDVE8xgC4ra3Dyi2g068tFv5H+CA0dqzMbYGtYCWs0oFX8oKmduf2TN/u76dl+6
         W/Q9qaOsqvJfZk2ttEJzO7n0m1Z/mxU+MUN3D6Lr380Ca+alluJ6HGHvp9VbffPzNIdI
         BoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZO+DyZ1fUy+kvlyAg/MjXMo6ajXXE+n+Yb2OEz6f7nc=;
        b=lnGuW7KmcZ1ZgEM4QmgQkkyC4MEjNv1SULQW6cpEglFBF0zLGz44YnmwKQYTGQmnf4
         OPAuREvv6teD1yqHU7EHPac2xX1oiEgvPGrB/d0hVu6dIPjlNFgJo2cgsva48HzX3qHq
         XNutOotGXRbRFDafBF4N95F7Hd1RUvCnODB6c7hm2/6Y5/EW/yWIcPdhWfGito/+h/VN
         1YwXrms7WPrjCLpRuMehWcUyG1nVLk0YQ3iRkKj8T3qIlh/25RQQ8bad8E+u09RzsEI5
         t2NTMg2WAh9cZmi3jAW2nLmadSMNMWp4xEI+75XULlkFEJPK0aD4+irvNXu1CCGm0Lq7
         eyVw==
X-Gm-Message-State: AOAM5339/iXqutYnWxaDVFFFd3EayHQjuqCRBPyR9OTPOzlq7LbcGzsi
	KQjJo0wlo6D+/JmK40QjFm9I6t77
X-Google-Smtp-Source: ABdhPJz8BP3o1RjtwcF9OL1mG7c2/1PDTArAAE/KXp7tmRfo5Ob3Jt+d4b+FGj89EGi8HqRf/+ZAfw==
X-Received: by 2002:a63:5052:: with SMTP id q18mr10438460pgl.349.1622912077894;
        Sat, 05 Jun 2021 09:54:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id u21sm4471193pfh.163.2021.06.05.09.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 09:54:37 -0700 (PDT)
Subject: Re: [PATCH v16 69/99] target/arm: add tcg cpu accel class
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-70-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17f14974-a922-dcda-4eb4-8754bf1fd45c@linaro.org>
Date: Sat, 5 Jun 2021 09:54:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-70-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: m4Z+BlWnGAco

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> move init, realizefn and reset code into it.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/tcg/tcg-cpu.h        |  4 ++-
>   target/arm/cpu.c                | 44 ++------------------------
>   target/arm/tcg/sysemu/tcg-cpu.c | 27 ++++++++++++++++
>   target/arm/tcg/tcg-cpu-models.c | 10 +++---
>   target/arm/tcg/tcg-cpu.c        | 55 +++++++++++++++++++++++++++++++--
>   5 files changed, 92 insertions(+), 48 deletions(-)
> 
> diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
> index d93c6a6749..dd08587949 100644
> --- a/target/arm/tcg/tcg-cpu.h
> +++ b/target/arm/tcg/tcg-cpu.h
> @@ -22,15 +22,17 @@
>   
>   #include "cpu.h"
>   #include "hw/core/tcg-cpu-ops.h"
> +#include "hw/core/accel-cpu.h"

Ideally we'd have a qemu/typedef.h entry so this include isn't needed...

>   
>   void arm_cpu_synchronize_from_tb(CPUState *cs,
>                                    const TranslationBlock *tb);
>   
> -extern struct TCGCPUOps arm_tcg_ops;
> +void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);

... simply for this declaration.
Also, can we now remove the tcg-cpu-ops.h include?

> @@ -1467,7 +1429,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>       cc->disas_set_info = arm_disas_set_info;
>   
>   #ifdef CONFIG_TCG
> -    cc->tcg_ops = &arm_tcg_ops;
> +    cc->init_accel_cpu = tcg_arm_init_accel_cpu;
>   #endif /* CONFIG_TCG */

Is this already inside tcg_enabled()?  Because otherwise it looks as if this is 
overwriting a field also used by kvm.  Whereas the code that's being replaced 
set a field only used by tcg.

KVM sets its hooks differently, via kvm_cpu_accel_register_types, so I don't 
understand this hook at all.  But it seems like there should not be two 
different ways to set acc->cpu_instance_init.


r~

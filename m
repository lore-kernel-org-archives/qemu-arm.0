Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2600333dye;
        Mon, 30 Jun 2025 09:53:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAukqPrgWAJgCF5AspO4yAsYq/22xEJqjwlS5nWHUmXn3bIv35YaauTQ5WPypbCTqTBmcn4w3BxMiw/Q==@linaro.org
X-Received: by 2002:a05:6a00:cd0:b0:746:2ae9:fc42 with SMTP id d2e1a72fcca58-74af6f7e391mr21121025b3a.19.1751302427018;
        Mon, 30 Jun 2025 09:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751302427; cv=none;
        d=google.com; s=arc-20240605;
        b=Kw2PNdJNnKyMh9jXM9A+99ukhVWcQBxwiy/PfXZv88CkvluZJYZPPX4fwxfSrnrHce
         uBvGs3KBMQSJd3IoV3B3HUDQYN/FgpFupM+bsHd1UieHRwThTi0iDM9YeEwIAWbvGOn9
         Gb3FTsMCf6TebDQoGuSAKD2nIJkiAkyRPXZQdX7bhspPvvZrqV9/McutdGMlOJqByPkt
         EJKBtH5khln1X05aO+8IUVk+y2X4Mg2q/XcrXhklgUtRd/2Tx5nBo0tSZSPEZfSAgG3c
         3XwoQ0tIal/xEWxqb+iGJzdmiKcqP3G+U0c21hA4OeoVpXLkr7aibLPEVSH07xMQsu89
         c1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=y5esKLy+3aA8eJK1MoE7OD8reIo099UHwDY1/Ubcbow=;
        fh=slUIThY3N2krR8zERTffNfUx3TQ3jDDVhkqHDizDH9U=;
        b=At4Yo8gSbVPXLj985ZmOUSnvsGQq1m0wZbXi/YWLsHUU+bUQOlbMiZcNwLyYwV/ofd
         rS1lwJShKe4QB0BDkTKl770KReR5x1sKsEoQySBijNqfD34tqZ77EJrho230zTdM30sj
         hFEK1mp/TwWy9aYfbYv6S7AYapYWzKL4gMswAme/ncdHm7dlstRbunjPVEaAsG7K0NSl
         azZwdFw5t96GwCeVTyY9lzv4yUHgFBCl43Oic/2czX3ts0GfRk6iFBUgJIvWLenUYbUG
         utnLve03of2fKStaKfvHVHxCMuNij1JARHMHix7kd0nWjb6ZBPjL7WNTiouVMxWJdHII
         1aZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZJ8sZfP+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-74af5502c8dsor4429044b3a.10.2025.06.30.09.53.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 09:53:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZJ8sZfP+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751302426; x=1751907226; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5esKLy+3aA8eJK1MoE7OD8reIo099UHwDY1/Ubcbow=;
        b=ZJ8sZfP+PQNxnRYqzDI0z3spW3ioDZuP+Kfu29ieZXuhQyntFOJfMXZvPsrKvdA0bT
         l2jreC0ccI6U/Xin70CWLAPestwb7gmk/OLZ7St2ejM9ObQc9VFrwzPFeKb491fuV8Hq
         VR36uF/+3h/MexGYLO9uY6HLgGB4xA382ex0VR51+RMAHnKtdosbLheucQ7YlqLjkmYa
         6rFaJi6ppTIBu7nVOedThMDP9m0e/ArMqLVN1UezJw9a3iMenMXEDq8rr3vIn4rL8SMh
         KC7AtQXhIzvVKwKvb53LkT+SSl8KVDMDQtKNQ/KrEywhaIYl+G1hd9xblslyPFF0Kssi
         xsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302426; x=1751907226;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5esKLy+3aA8eJK1MoE7OD8reIo099UHwDY1/Ubcbow=;
        b=LIOjb+RrOSH+iT4DF86fg9LfJl9/wpJ5DyX/3dANKNY1+KduE59d5xjlbKtsCLMNg7
         9xQAkQ4FlNT/Lypc66mMlAL1yb6hSQorXAgFMwi/lb/h0QWBeGbEXSg04I7QDjbEyrma
         KC+udhaDLu/IZ0ruKVTdweOFIpDYP/qPo1CtcmRGrB2dG9KjeBepJgwpqGHCCqS2RBsU
         8D4vjWn94iwqagXu2IokUT/5SeXKhQhDICqxTmm4VaTx7RzQUQVw/hXsJVuSAUW5STDN
         mxsK2sr4dKYsz2U02fEB1owey/nKRHJwDk2ldTwDm3gCw/GVRk4mWB/Wb5eGoUEXbBav
         czHg==
X-Forwarded-Encrypted: i=1; AJvYcCXLvJj3NiYSJxIi6qNgwnReIzYXoSe5Vpfqj5qpnLvczRfYRoAT7gdzxy2ND1LIMNMLMZRYi77nycsdaA==@linaro.org
X-Gm-Message-State: AOJu0YwvW4dFDakNuk3yVcOrz+1bK9lhwqo6nWWoTps+OSPRzR0wXm5E
	d20aM0ng25AvbQheG6ym+sTRDEBkC9Fj6bWUFPQYi83XcTYReIsOIO7Y/yc/AW3W+/c5Qw==
X-Gm-Gg: ASbGncvxzA6S8N1sWZ5VvzzYAwPwqn3f36QvVKesRDG/guFG2QFGzlBoDd2S6dCIsqb
	v8WIz87Z62yLBI8bnFP6zYMb67Vmus142ezZakWRIiJg8R48GlkVnRjknnDddPwIllsqvO8DeEi
	Qk4AZnklWN03K8Sa/IXvSqkwt0aP0zoptWMfO8AmuNuXtfYvQ8AfcbdVsD0dzEVGRqoVM2O5lWg
	cC3tielLL7FTAZ0fiwIkfTqIqXoN1Osp4CH/UbRWtJ1pAt4q41arRa64rXyl0WJc9GPXQt8Acgv
	rza66Duv7OCxGecRRdEfdTBK66EiYyvj/+B7YzCFFEAyil1lI/YbCYQYPFg0o/yE7+z7iAGOdes
	dw/BiOqAixg==
X-Google-Smtp-Source: AGHT+IFMeF6ooYadkSyHe4utKVzxx8xCyWoBaLazAlUxEIs/56bgcMe9K4DNDvZSoKppSJoHlun3LQ==
X-Received: by 2002:a05:6a00:3c90:b0:742:a334:466a with SMTP id d2e1a72fcca58-74af6f43f06mr20021789b3a.12.1751302426541;
        Mon, 30 Jun 2025 09:53:46 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5574390sm10253052b3a.90.2025.06.30.09.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 09:53:46 -0700 (PDT)
Message-ID: <e3e2f53a-33ad-49b0-99fc-c7af4b76a0d8@linaro.org>
Date: Mon, 30 Jun 2025 09:53:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] target/arm: Share ARM_PSCI_CALL trace event between
 TCG and HVF
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
References: <20250630130937.3487-1-philmd@linaro.org>
 <20250630130937.3487-6-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250630130937.3487-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gvNGETU7qg64

On 6/30/25 6:09 AM, Philippe Mathieu-Daudé wrote:
> It is useful to compare PSCI calls of the same guest running
> under TCG or HVF.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c    | 3 ++-
>   target/arm/tcg/psci.c   | 3 +++
>   target/arm/trace-events | 3 +++
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 7a99118c8c2..6309c5b872e 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -34,6 +34,7 @@
>   #include "target/arm/multiprocessing.h"
>   #include "target/arm/gtimer.h"
>   #include "trace.h"
> +#include "../trace.h"
>   #include "migration/vmstate.h"
>   
>   #include "gdbstub/enums.h"
> @@ -1149,7 +1150,7 @@ static bool hvf_handle_psci_call(CPUState *cpu)
>       int target_el = 1;
>       int32_t ret = 0;
>   
> -    trace_hvf_psci_call(param[0], param[1], param[2], param[3],
> +    trace_arm_psci_call(param[0], param[1], param[2], param[3],
>                           arm_cpu_mp_affinity(arm_cpu));
>   
>       switch (param[0]) {
> diff --git a/target/arm/tcg/psci.c b/target/arm/tcg/psci.c
> index cabed43e8a8..8df27ca123e 100644
> --- a/target/arm/tcg/psci.c
> +++ b/target/arm/tcg/psci.c
> @@ -25,6 +25,7 @@
>   #include "internals.h"
>   #include "arm-powerctl.h"
>   #include "target/arm/multiprocessing.h"
> +#include "../trace.h"
>   
>   bool arm_is_psci_call(ARMCPU *cpu, int excp_type)
>   {
> @@ -79,6 +80,8 @@ void arm_handle_psci_call(ARMCPU *cpu)
>            */
>           param[i] = is_a64(env) ? env->xregs[i] : env->regs[i];
>       }
> +    trace_arm_psci_call(param[0], param[1], param[2], param[3],
> +                        arm_cpu_mp_affinity(cpu));
>   
>       if ((param[0] & QEMU_PSCI_0_2_64BIT) && !is_a64(env)) {
>           ret = QEMU_PSCI_RET_NOT_SUPPORTED;
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 4438dce7bec..a9cb5e0f5c6 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -13,3 +13,6 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
>   
>   # kvm.c
>   kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
> +
> +# tcg/psci.c and hvf/hvf.c
> +arm_psci_call(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint32_t cpuid) "PSCI Call x0=0x%016"PRIx64" x1=0x%016"PRIx64" x2=0x%016"PRIx64" x3=0x%016"PRIx64" cpuid=0x%x"

Just a nit, using 'target/arm/trace.h' might be more readable than 
'../trace.h'.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

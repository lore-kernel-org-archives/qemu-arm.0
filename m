Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2606334dye;
        Mon, 30 Jun 2025 10:03:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKeqZJesIau5K0ClkUpE7HgvhxrfScWO7iKwbwd22EllMvwMkCfpCST5SVK/d4g1FQ7kva21esesYEvA==@linaro.org
X-Received: by 2002:a17:902:fc85:b0:234:bc4e:4eb8 with SMTP id d9443c01a7336-23ac48b49e3mr201220015ad.46.1751303002851;
        Mon, 30 Jun 2025 10:03:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751303002; cv=none;
        d=google.com; s=arc-20240605;
        b=OeDQmHSloL5Yb+DGyNF9+ws54Hhgy2MSEW4oybtJDd9ek+2er3Gh7dNVUKyJneTVVN
         BqZoqLYFfefY1+SeS2IlsMe9KhKcptDfmJxkDtgvhLS+z/6KhmozAIkGkM8/1Gxp1Nw9
         ddgznkU5Uc/Uol01zXkxCl6V5DhtK4mZBmxxoIeMzKkCWGGFMlM/inbnPxzftClnaaFo
         g2stFVNa+vg4DK7c6EYethtnlXVdGClmr/kBlAdA3rfNAgpjN06K1oupn4PwVQTLsgG/
         pJQC1jWLBEBCS3mKKLGAygcew/Ejdfi/OTtNV6kGlcAk9Wm3eefz4whc9+wBiC2L8xH2
         zUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZrwSuaD+VoYFdUIXCegGF1YB386Md8D+3yHN0v09ydk=;
        fh=YagkjHqVtfxG1HDX7TFThHjXGzgtXK61qNAKD6anRWE=;
        b=PJ7j3H0CfM8kj4C0trSrNo5HbHdDZG+uCb6v9r6n1+JyN7Nl8OpBsFK5uFS1dF4vKJ
         ctC1/Z6+Ba+cAaUQdu0XwZ9HxSmPCcxmQyxkenol33r+lc8TeVd7ZrjxLivN7+VDlR/H
         jWWlxnH3oZLLV6xEGeeDJGXrWf37h2l3m7AtWMrULxvRlWU/PZwXwHJCoQi2boJQ8vWY
         8ftwNE6pNMp6GY1UgoZziOrUvxP7PEfsurCDaiDzx/7/3Od5JOAGpHLXwuGiirT9KB5/
         Zh4B+z1NxupVg7JriKbsHcV8OzlZdthGwXb9VGaqK4dwqzQrXGXArScc1uF+WufsgWqU
         F+Fw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhWAjYCH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-23abe311c33sor35759465ad.1.2025.06.30.10.03.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 10:03:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YhWAjYCH;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751303002; x=1751907802; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZrwSuaD+VoYFdUIXCegGF1YB386Md8D+3yHN0v09ydk=;
        b=YhWAjYCHZ8oVQY1f50x0F4qzrpcUMJ8kGesNkv0Us7uAogBEnsh4D7pGX3hHOpWw3V
         wNoDYz3Sjy3feVaRP0vOimETpR8i/CfgS6Wz3duNu5IFgeQ25ZMh+aEI46T9n3ixcTZN
         W0qI5ckElrCwNZKBAds5tise12RjV5WS4W7PbqiMxVQm/69fZbtFYIpPOaCUi1DeYGEB
         EyAzSIj+QtfSXAQgMbaOltBKPY/jhLHvFC/DRd2hdahcj4jiPM7/g9EzKynduKGVWAVa
         VlkJRiO+cIg+ci5W1HHck9odkc3TVeN+ICFl/nwdYoDUGoEpQN6J8uL4Im5hBQGMFHWz
         suKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751303002; x=1751907802;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrwSuaD+VoYFdUIXCegGF1YB386Md8D+3yHN0v09ydk=;
        b=qUdpRpTk6OAqQyIp24XU+eJmfHuP60YdbJmbRmqsh/lPVsVWeRp2rDoE7Xdow/lZ15
         amHsToVb70ASVhSdxTbxZbMwpQ09dq9Fmx6U3EQevgbv0xPHZOSEHN6MF+RwIPXUcnfJ
         3hwQW43OqLZunKiucU0z/BA3+izorzT0c+iUUceim4QRbeZXMJJ+kWoHtFTwWXyKMGlk
         dBrBIthuEVI442B0pV/gl/AsKdNHeH7qYS3INcRlQ8/UAoARuuphCyl5uB/K1d+pEChl
         J4AIOUsH/trICpotLKtyQuf5W1/1ueMsR99YywqaHYZjxMNk+qGKwWWFYFvlkBneZrN1
         CrpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVShr5udA4CIN8fwbjsAmMqoBVIPY93zc67TwP5vM35ANr08JVbnE+Oe2rr1cKNgLjiSpO4dLBw5ue36A==@linaro.org
X-Gm-Message-State: AOJu0Yyek1CE+s7RsErJAN9BzXEq41as4wHM+Fqy9TgH1yUHI31fchxZ
	zNADjPoX/rJUmMoRjz4gE/RohRMjEljoWXS7Zw2eqY/7BdUADQRIkHhpOgqwC5HDoXWV9w==
X-Gm-Gg: ASbGncvah+Kki+Hccl0/5khRAWydnmdqaA9afpvZvn2hN+qtwm4ldokPbKWaYalu6Wm
	G67vBAhJTAxhSm1q8WLxk1UIgVmxur2vvllprot2QkJnYKOiUinKaEd0wz/4CbTm2q/1SSfEbmS
	pu0CMPdZk5KeNihmo113cytakmzJvvjHER9pSpBrD8G67Q5bKSjFnM8OpNG9EKY1sEKPWxN8+nB
	1c3OqTCaNZIpOvc9NrQoOYfV0lySDEsxc/GDVSpQLuROcFWa9AxbeIFjAXOXGPRllCpn92YZgeQ
	QtleFagQWQYe+0KxV1GQTS+rYJoIvWTjUfARuf3ugAlxtekS90YP90PgNlSNqMS2tA7hU/roits
	=
X-Google-Smtp-Source: AGHT+IF7jwW8bH4WMwCcHfVMsj33+s3MLF/FcAce/QU9etIlvWhRLQ36FSx2NDLSAyyjMwT9gF+1XA==
X-Received: by 2002:a17:903:f8c:b0:234:bfcb:5c21 with SMTP id d9443c01a7336-23ac45e4467mr223746585ad.19.1751303002164;
        Mon, 30 Jun 2025 10:03:22 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3d27dbsm83852835ad.256.2025.06.30.10.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 10:03:21 -0700 (PDT)
Message-ID: <66593af9-0d9d-462b-a170-f4e81ffb7429@linaro.org>
Date: Mon, 30 Jun 2025 10:03:20 -0700
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
X-TUID: ki9L1c1FSQ8i

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

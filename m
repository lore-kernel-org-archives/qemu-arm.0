Received: by 10.28.91.67 with SMTP id p64csp1000128wmb;
        Fri, 9 Mar 2018 08:48:54 -0800 (PST)
X-Received: by 10.28.0.17 with SMTP id 17mr2398464wma.158.1520614134830;
        Fri, 09 Mar 2018 08:48:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520614134; cv=none;
        d=google.com; s=arc-20160816;
        b=BFcoKFHATX9iM++5zcUpmGJFR8e3A1gzd6F7yVJI2d6O9EgC63GV+E2jVst/olaBVm
         XrA9DhKDvenTjQxLAK2Gddfow5bQRW9Dh6y9XlD5prQGpqy+eqeSttsK7qRG3Maeg8+J
         zuOstw6jJS27i/YscJATHqjem6b7ATjFkyRBcLfn6B1HvshUUzp7N0f+p3GNqI2DqsoC
         InxgWlJ8uueo73/Ksf5SrCUnmCf9kt82z+eUIjwwjcnRP1Jnt8jS29+rvGklz0YhFWZM
         B8O7Fj0nBIdRSkCq15VzcNVcv7QR7lPoPLmMGbrs8T/JtEVLCjosjU02+1v1hAuXQp4m
         qWxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=NOWe902jNtgsgmJ/+9jFYwV5zEU1LCv9yughdIpHk2w=;
        b=vJrHK0jNSNaDLFzOR6Zm+ZCuDz08HOz2ceiY/rUdl+I5xEGRWMKEUcfi1Yo2kKCzF9
         GUNhkNzXHdV2hkQJl2C8F4OJczQjIpaFtvOOVostlO5jVx633KU4JYe3hGMPC3wKYMFJ
         MQNaY96qeiRQJt7yRUJUspOKGMgAdeSIWmv+HEsRGBwVa8+KmIgQzUqNVBmcBFwR1z3/
         Nb3dW9hCtP54DbDrYlkp5jLpQkfWZQ4q3sE1oYQtTJGKTfWzz/mCaNcDtNA7CJWUZWGp
         eZl8LF34Tlf0dVh+4LYPuZRhlERGx7HzM1k42SeEoHXmY3N3cujfdwjQEEa99oIad8Z5
         ln6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uQkI+/ny;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z10sor753908wre.65.2018.03.09.08.48.54
        (Google Transport Security);
        Fri, 09 Mar 2018 08:48:54 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=uQkI+/ny;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NOWe902jNtgsgmJ/+9jFYwV5zEU1LCv9yughdIpHk2w=;
        b=uQkI+/nyBBnUXEP+FWo1+PvTXPAxKdse0SgdzNGJAOW2pS/Tm/NQJSM+aCHzl4E6+H
         uTxlNXwt3toaWN1D9gOWubJ+k94yKBEiIE3wJwo4qLwmQUUXLC8t5stMtol4WyDY6uJH
         /vOdzmHat9CMFuC+uPOMKsQU+/1OLLjXzbGr/mhl5anLcwTr6lLRiKIKsSikuILIBj4x
         cUNrdSMdU0ss/GjTwkcItlWXfALQ7daVCGygTRnASB3HsALxIQ3pKR8n+EkyukUNA5is
         lhFsDc8cyjnD8MCMnuR8YCf67iusXJTWKUJwlH/U8rvZ0WiIteox8rSIWE/k2WsAcPeU
         johw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NOWe902jNtgsgmJ/+9jFYwV5zEU1LCv9yughdIpHk2w=;
        b=gvvJbOlGGdvh1lOJyljzJlDkaKGZf1cuBz5VaW18oL4jobCraXgbhO8HSI4sY/ZZpt
         gX1Rwe+zyobQ9Ai2maUCvkV15ho7GORfdCGpCHDh5nyKm14WN2L3L4ZTTQNLipO8W8n3
         OpzavNFV80PGBG6xG1K2FTGAu07BxMv2O7oZPApM2YQF2We1EhWki45PUAzurQEmteao
         fmZi52vDuRHs70ZEnPwOevl6zyGEKXQlEmofF0rxq4TELkqg8lG2mmUZBdwuetQRn7bd
         GSeGyJFUYQIdmzeLHxMGHU7DBXhrTMpxnxSauvDRynqDf+6RfmtKIH8nfHa0NHv6AO6n
         9F8w==
X-Gm-Message-State: AElRT7H/rZi10gyDP1ENMj5H97b41GaC05TVQFzcNrx6QlknNrl0g899
	RRUY/Vk4uSfewDR6160+7EGyrvXS
X-Google-Smtp-Source: AG47ELtgqMWeyobHm3+9UUKNfpg4ofdR+vFFDWVz+G05iHq52Cu2m1183MDYb1AWPgl+0KjWB8AQcA==
X-Received: by 10.223.135.45 with SMTP id a42mr2402091wra.28.1520614133904;
        Fri, 09 Mar 2018 08:48:53 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.22] (ABayonne-654-1-76-150.w86-222.abo.wanadoo.fr. [86.222.219.150])
        by smtp.gmail.com with ESMTPSA id f23sm1512486wra.51.2018.03.09.08.48.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Mar 2018 08:48:53 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 4/6] target/arm: Make 'any' CPU just an alias for 'max'
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
 <20180308130626.12393-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <dc240c4c-275d-8084-276c-c905ccbce008@amsat.org>
Date: Fri, 9 Mar 2018 17:48:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180308130626.12393-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: wYEQywxsazGc

On 03/08/2018 02:06 PM, Peter Maydell wrote:
> Now we have a working '-cpu max', the linux-user-only
> 'any' CPU is pretty much the same thing, so implement it
> that way.
> 
> For the moment we don't add any of the extra feature bits
> to the system-emulation "max", because we don't set the
> ID register bits we would need to to advertise those
> features as present.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.c   | 52 +++++++++++++++++++++++++----------------------
>  target/arm/cpu64.c | 59 ++++++++++++++++++++++++++----------------------------
>  2 files changed, 56 insertions(+), 55 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e46ddcc613..6068efb8ff 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -965,9 +965,19 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
>      ObjectClass *oc;
>      char *typename;
>      char **cpuname;
> +    const char *cpunamestr;
>  
>      cpuname = g_strsplit(cpu_model, ",", 1);
> -    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpuname[0]);
> +    cpunamestr = cpuname[0];
> +#ifdef CONFIG_USER_ONLY
> +    /* For backwards compatibility usermode emulation allows "-cpu any",
> +     * which has the same semantics as "-cpu max".
> +     */
> +    if (!strcmp(cpunamestr, "any")) {
> +        cpunamestr = "max";
> +    }
> +#endif
> +    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpunamestr);
>      oc = object_class_by_name(typename);
>      g_strfreev(cpuname);
>      g_free(typename);
> @@ -1711,29 +1721,23 @@ static void arm_max_initfn(Object *obj)
>          kvm_arm_set_cpu_features_from_host(cpu);
>      } else {
>          cortex_a15_initfn(obj);
> -        /* In future we might add feature bits here even if the
> -         * real-world A15 doesn't implement them.
> -         */
> -    }
> -}
> -#endif
> -
>  #ifdef CONFIG_USER_ONLY
> -static void arm_any_initfn(Object *obj)
> -{
> -    ARMCPU *cpu = ARM_CPU(obj);
> -    set_feature(&cpu->env, ARM_FEATURE_V8);
> -    set_feature(&cpu->env, ARM_FEATURE_VFP4);
> -    set_feature(&cpu->env, ARM_FEATURE_NEON);
> -    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> -    set_feature(&cpu->env, ARM_FEATURE_CRC);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> -    cpu->midr = 0xffffffff;
> +        /* We don't set these in system emulation mode for the moment,
> +         * since we don't correctly set the ID registers to advertise them,
> +         */
> +        set_feature(&cpu->env, ARM_FEATURE_V8);
> +        set_feature(&cpu->env, ARM_FEATURE_VFP4);
> +        set_feature(&cpu->env, ARM_FEATURE_NEON);
> +        set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> +        set_feature(&cpu->env, ARM_FEATURE_CRC);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> +#endif
> +    }
>  }
>  #endif
>  
> @@ -1789,7 +1793,7 @@ static const ARMCPUInfo arm_cpus[] = {
>      { .name = "max",         .initfn = arm_max_initfn },
>  #endif
>  #ifdef CONFIG_USER_ONLY
> -    { .name = "any",         .initfn = arm_any_initfn },
> +    { .name = "any",         .initfn = arm_max_initfn },
>  #endif
>  #endif
>      { .name = NULL }
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 9042d3dfd1..3429875787 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -226,38 +226,38 @@ static void aarch64_max_initfn(Object *obj)
>          kvm_arm_set_cpu_features_from_host(cpu);
>      } else {
>          aarch64_a57_initfn(obj);
> -        /* In future we might add feature bits here even if the
> -         * real-world A57 doesn't implement them.
> +#ifdef CONFIG_USER_ONLY
> +        /* We don't set these in system emulation mode for the moment,
> +         * since we don't correctly set the ID registers to advertise them,
> +         * and in some cases they're only available in AArch64 and not AArch32,
> +         * whereas the architecture requires them to be present in both if
> +         * present in either.
>           */
> +        set_feature(&cpu->env, ARM_FEATURE_V8);
> +        set_feature(&cpu->env, ARM_FEATURE_VFP4);
> +        set_feature(&cpu->env, ARM_FEATURE_NEON);
> +        set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA512);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA3);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SM3);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> +        set_feature(&cpu->env, ARM_FEATURE_CRC);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> +        /* For usermode -cpu max we can use a larger and more efficient DCZ
> +         * blocksize since we don't have to follow what the hardware does.
> +         */
> +        cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
> +        cpu->dcz_blocksize = 7; /*  512 bytes */
> +#endif
>      }
>  }
>  
> -#ifdef CONFIG_USER_ONLY
> -static void aarch64_any_initfn(Object *obj)
> -{
> -    ARMCPU *cpu = ARM_CPU(obj);
> -
> -    set_feature(&cpu->env, ARM_FEATURE_V8);
> -    set_feature(&cpu->env, ARM_FEATURE_VFP4);
> -    set_feature(&cpu->env, ARM_FEATURE_NEON);
> -    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA512);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA3);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SM3);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> -    set_feature(&cpu->env, ARM_FEATURE_CRC);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> -    cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
> -    cpu->dcz_blocksize = 7; /*  512 bytes */
> -}
> -#endif
> -
>  typedef struct ARMCPUInfo {
>      const char *name;
>      void (*initfn)(Object *obj);
> @@ -268,9 +268,6 @@ static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
>      { .name = "max",                .initfn = aarch64_max_initfn },
> -#ifdef CONFIG_USER_ONLY
> -    { .name = "any",         .initfn = aarch64_any_initfn },
> -#endif
>      { .name = NULL }
>  };
>  
> 

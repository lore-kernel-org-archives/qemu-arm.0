Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1475220ejb;
        Tue, 19 Mar 2024 11:12:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmQfwBuidC2bc+MeNcUEVloTmJosJ6GyqQC2yxw3zoeDtxD3j16ucHSHubOvDyu132DlWUPp+yxw3Mb4gWGVWF1Ylh3ez+
X-Received: by 2002:a19:ca11:0:b0:513:dda5:a38d with SMTP id a17-20020a19ca11000000b00513dda5a38dmr6967078lfg.25.1710871970537;
        Tue, 19 Mar 2024 11:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710871970; cv=none;
        d=google.com; s=arc-20160816;
        b=FNVmPagJ9kCyjDXVCcBmd0e33I4Dmox3uJNVSv/gEPeFX96vdwUuoQ8746JAy4GEdN
         HTrTtAS2+sy1jQOSh1obwZIWADDUzpsx554hVtFL66Qr2fkGRA1gT6oyew03LHqR4QAp
         /kxnC07EkxPnnNwJf34MUNvtokuOosqCxSoKFzvx+0X49ylkCxaa/MaTj2B+5dX9mfnY
         eEHXMJ23YWR2dDK0lKXU9PahaK/FpuT2Nr7Pe4giBZ8DHeejiMFhJv1r+gy0qeWonDhJ
         vZtwsFvAN/GMJIiG4f80u4EZH3Il1zOcN3+ng7DjtlXb5oIG/EzMQoxWyeUJ1w7xu4+y
         HePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=FB3YqW4Uz4oF+ZT7QZKeFJc7YepbHj5rdBwBsiNNT74=;
        fh=exssEF89PLb+j8shJTvV3z8UX5ktZKU9+3Nu9Zt1ghg=;
        b=WhqDjghvoF7fxOWLIn/ZBZCOTpc9k8guFe2GMorxU5J4qGq3dIR+aRYODYwR1CDrdP
         sB2WICgxjr0oFYX3w46aj+OMz6Xqaq1R0Y4FVcdROWeAwI5NrHmRAYA/vnsyKeC0FLM5
         5+r/3axQqkIjMqR37h4wzvCRChAYU9EO+Ggh0F8hgpDBYHFI+un81cL29XZMn1iwsnT/
         s7s96S5IgYKrqwPh9JXVYcE2JuEgtVtIrS7LdIl+upkS84+mz/A2kgztt1xkAUSjnecJ
         ljrLPun9FCRxJUuqIT3JfYv5MFvaJ5SOuV5ob853ZzJnUU/r1/xvNWbT9jEvb5JISaoa
         y41Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/67omkP";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d15-20020a19384f000000b00513a8d53620sor2751168lfj.13.2024.03.19.11.12.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Mar 2024 11:12:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C/67omkP";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710871970; x=1711476770; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FB3YqW4Uz4oF+ZT7QZKeFJc7YepbHj5rdBwBsiNNT74=;
        b=C/67omkPCnN034kvqdjsSqEBfb8E3E1+aNZStWn3XuoJeYSx4E1pUz3XKPzxpAjBUV
         lRtzGjzv31d0Itg8VSB98xdQHNAk25jf7de2Pf7PpzYE+gv9f938VQllRrrEQLeXIRTR
         gFuN++sRNLfRj8eszi8gmDy4pOCWyuheGZB4OK1kZ+pAnyFiWT+r541uj0rQRE9Rqjq7
         YP1WWUuem6Yx8TonfC4t8fjlmgzQHABRIEiezXoLqF6e6vL/rmVvCGAjXtLGaamBwidD
         Xdc1kuySNQLIi2ePrH4fVCTvjTO9zd4/sLh75ULOLOWyMSP68xZ1M3K8zWrssQztkQCJ
         U4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710871970; x=1711476770;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FB3YqW4Uz4oF+ZT7QZKeFJc7YepbHj5rdBwBsiNNT74=;
        b=vlS3u6+c3rVkM6Uainr54MLuFjDXw8rwHsXKDrnDQENaIsJbgcTuwjliyrAnS1l5yC
         +UHEn5WS/UlevCSJpzD7pfzNC0S8r+6ctBJEcNKcinxwks1MUizx3VswYotv6kbrKdZe
         oRz9t8NMfP/i+4JZPXtTyH3t/IZeFEmYOlDMUyhfYUXl+WoaOGlSv2y6Uw0fkSrauArD
         LH785w4brB0UfJrBtetuf5TtL8R+UsVe3a1mN4vBgq/+x6Ak3W/kzIxSVH6UWvB113C5
         sbfZwIHd1cRL4woVdq+Lt/kzHZc+aqimm4OVqpUNcv9uJJ0EeW5A0ZtkVJVwA5+ALu40
         IB8A==
X-Forwarded-Encrypted: i=1; AJvYcCVQFnoeOOiE9MQtzzYGwRceewcTY9xq8McuKuHzN73Jyj1MCIPftPfixk2aPRICCoeENrw1XWwXi7BUo3i2O0ZKT3V9bTrI
X-Gm-Message-State: AOJu0YxT0nrxB/Ia6nSaT9iTz/zH7K5sIvLRdfZ6F4NB2x2g9gLMZs9G
	WTFnMYXHguMwr17DLbbXLmup47uKKvdYgOPdzX2yKtSvlBjbs6a/fPNctV+/xWO0gQ==
X-Google-Smtp-Source: AGHT+IHoKELfbuECkuyLTUglf/dSA5ERaIVTmAVO/Cip6Uc4c6+9VYEZkr434C24QN3zzUUzDRX9Ww==
X-Received: by 2002:a05:6512:20c6:b0:513:bf23:ce3 with SMTP id u6-20020a05651220c600b00513bf230ce3mr11096828lfr.62.1710871969986;
        Tue, 19 Mar 2024 11:12:49 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.166.129])
        by smtp.gmail.com with ESMTPSA id bw9-20020a170906c1c900b00a45ff821e09sm6328790ejb.150.2024.03.19.11.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 11:12:49 -0700 (PDT)
Message-ID: <53e1f69f-3a52-4972-b1ba-6ad07507b197@linaro.org>
Date: Tue, 19 Mar 2024 19:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 07/21] target/mips: Make MIPS_CPU common to new
 MIPS32_CPU / MIPS64_CPU types
Content-Language: en-US
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>
References: <20240315130910.15750-1-philmd@linaro.org>
 <20240315130910.15750-8-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240315130910.15750-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Jiom6UidV/eK

On 15/3/24 14:08, Philippe Mathieu-Daudé wrote:
> "target/foo/cpu-qom.h" can not use any target specific definitions.
> 
> Currently "target/mips/cpu-qom.h" defines TYPE_MIPS_CPU depending
> on the mips(32)/mips64 build type. This doesn't scale in a
> heterogeneous context where we need to access both types concurrently.
> 
> In order to do that, introduce the new MIPS32_CPU / MIPS64_CPU types,
> both inheriting a common TYPE_MIPS_CPU base type.
> 
> Keep the current CPU types registered in mips_register_cpudef_type()
> as 32 or 64-bit, but instead of depending on the binary built being
> targeting 32/64-bit, check whether the CPU is 64-bit by looking at
> the CPU_MIPS64 bit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/mips/cpu-qom.h              | 13 +++++++------
>   target/mips/cpu.c                  | 11 ++++++++++-
>   target/mips/sysemu/mips-qmp-cmds.c | 26 ++------------------------
>   3 files changed, 19 insertions(+), 31 deletions(-)
> 
> diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
> index 0eea2a2598..bf464f16b6 100644
> --- a/target/mips/cpu-qom.h
> +++ b/target/mips/cpu-qom.h
> @@ -1,5 +1,5 @@
>   /*
> - * QEMU MIPS CPU
> + * QEMU MIPS CPU QOM header (target agnostic)
>    *
>    * Copyright (c) 2012 SUSE LINUX Products GmbH
>    *
> @@ -22,14 +22,15 @@
>   
>   #include "hw/core/cpu.h"
>   
> -#ifdef TARGET_MIPS64
> -#define TYPE_MIPS_CPU "mips64-cpu"
> -#else
> -#define TYPE_MIPS_CPU "mips-cpu"
> -#endif
> +#define TYPE_MIPS_CPU   "mips-cpu"
> +#define TYPE_MIPS32_CPU "mips32-cpu"
> +#define TYPE_MIPS64_CPU "mips64-cpu"
>   
>   OBJECT_DECLARE_CPU_TYPE(MIPSCPU, MIPSCPUClass, MIPS_CPU)
>   
> +OBJECT_DECLARE_CPU_TYPE(MIPS32CPU, MIPSCPUClass, MIPS32_CPU)
> +OBJECT_DECLARE_CPU_TYPE(MIPS64CPU, MIPSCPUClass, MIPS64_CPU)
> +
>   #define MIPS_CPU_TYPE_SUFFIX "-" TYPE_MIPS_CPU
>   #define MIPS_CPU_TYPE_NAME(model) model MIPS_CPU_TYPE_SUFFIX
>   
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index c096d97fe3..f3ea6175f2 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -604,6 +604,14 @@ static const TypeInfo mips_cpu_types[] = {
>           .abstract       = true,
>           .class_size     = sizeof(MIPSCPUClass),
>           .class_init     = mips_cpu_class_init,
> +    }, {
> +        .name           = TYPE_MIPS32_CPU,
> +        .parent         = TYPE_MIPS_CPU,
> +        .abstract       = true,
> +    }, {
> +        .name           = TYPE_MIPS64_CPU,
> +        .parent         = TYPE_MIPS_CPU,
> +        .abstract       = true,
>       }
>   };
>   
> @@ -620,7 +628,8 @@ static void mips_register_cpudef_type(const struct mips_def_t *def)
>       char *typename = mips_cpu_type_name(def->name);
>       TypeInfo ti = {
>           .name = typename,
> -        .parent = TYPE_MIPS_CPU,
> +        .parent = def->insn_flags & CPU_MIPS64
> +                  ? TYPE_MIPS64_CPU : TYPE_MIPS32_CPU,
>           .class_init = mips_cpu_cpudef_class_init,
>           .class_data = (void *)def,
>       };

Oops, I got 2 commits squashed by mistake here...

> diff --git a/target/mips/sysemu/mips-qmp-cmds.c b/target/mips/sysemu/mips-qmp-cmds.c
> index 7340ac70ba..329db3a028 100644
> --- a/target/mips/sysemu/mips-qmp-cmds.c
> +++ b/target/mips/sysemu/mips-qmp-cmds.c
> @@ -8,31 +8,9 @@
>   
>   #include "qemu/osdep.h"
>   #include "qapi/qapi-commands-machine-target.h"
> -#include "cpu.h"
> -
> -static void mips_cpu_add_definition(gpointer data, gpointer user_data)
> -{
> -    ObjectClass *oc = data;
> -    CpuDefinitionInfoList **cpu_list = user_data;
> -    CpuDefinitionInfo *info;
> -    const char *typename;
> -
> -    typename = object_class_get_name(oc);
> -    info = g_malloc0(sizeof(*info));
> -    info->name = cpu_model_from_type(typename);
> -    info->q_typename = g_strdup(typename);
> -
> -    QAPI_LIST_PREPEND(*cpu_list, info);
> -}
> +#include "qapi/commands-target-compat.h"
>   
>   CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
>   {
> -    CpuDefinitionInfoList *cpu_list = NULL;
> -    GSList *list;
> -
> -    list = object_class_get_list(TYPE_MIPS_CPU, false);
> -    g_slist_foreach(list, mips_cpu_add_definition, &cpu_list);
> -    g_slist_free(list);
> -
> -    return cpu_list;
> +    return generic_query_cpu_definitions(errp);
>   }

Received: by 10.28.91.67 with SMTP id p64csp958504wmb;
        Fri, 9 Mar 2018 08:07:11 -0800 (PST)
X-Received: by 10.223.195.204 with SMTP id d12mr27148782wrg.116.1520611631618;
        Fri, 09 Mar 2018 08:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520611631; cv=none;
        d=google.com; s=arc-20160816;
        b=pmm4HemuO2V9D+IZjxfCs/Jm5BwBzqc36sZk+feqDEiUUl8TRI3Sn6deNCosGXS9Xz
         FTrRjE78Zj4aaXo8KxvSmuPuay0bEf7idr8VgIU0GiJgKZvWGa4wptm9IQdcxYW6jNqK
         zoUeWeZAqp2sKz/GJkYldUw1rpmP5tANJO+Q7hhF6oYy2proFiG+8ivc2akmgf3phHa9
         b8h6irBM4+rNnrqW2UqQsEBlkUxyg075OM9UyGmAqE4uo4PgEY/PZ/su2roVZq7VJWPU
         IqetNAO5Ba6Vyjja9F/e8GcrjkrKA2l5PPYJe4ep3vM7UMctFstMV33f36fE/IsH2Q18
         mjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=cpiOf5xnms6MQFTFm0xxHikDeVrmrFp5qEGgGblMz4Q=;
        b=aYX2+1IyEnPb1TyOXEXTwWKObskhHQrz8Ryj5/A9MUXi2BoT0ziSfAN9UEb3wb7P6y
         MC6jB7tAVDJlnnTssNcHgZpbwlLFWd1SdX+RZILLt5P2eEQMemt9n7H++VxTVgZsrwMc
         LqrZUQTZ3Ew/Y5DgrAUI2f2IIrHEbPd7kYzg0qbtHGjE+W7f3FF2UiQdMMiQSwAyQ0eG
         beXSOn+uaP+LyAKZLmlvX6DgkWMZgqk/egnJuHczEZe4jvUNluqkrr5eAzDQ4V0BgDd7
         Ofi8HFFTC0vWZ+2LzRR+wEwDsmTs2XAdAiQIn9kIxJ7SbdoMhySF9Hi85Pu/o5BJEkVS
         jNpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=joqpk85J;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 73sor521170wmi.59.2018.03.09.08.07.11
        (Google Transport Security);
        Fri, 09 Mar 2018 08:07:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=joqpk85J;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cpiOf5xnms6MQFTFm0xxHikDeVrmrFp5qEGgGblMz4Q=;
        b=joqpk85JW0dMjSIjSSyqAH36C/lzp4bdmcnjYqfaPbfsoSfPzqlLrWpmaaTuUxoXQP
         S0Vt6pihK6KQuXzyYBk7YwDQikKYkLJP9RvW19IjarJ8li1LL7INEIQrYATxiCWNj9RX
         MR7J693VM8veTw2+CqtdpnlQ+GPqTLiGqnr1MdpX3G5MibO7sSXjhtdwpmflmNiBReRF
         SwoIDBHVwSW1SLEnBh8rUf4xuUyv4iT2RaHxt8XpsMMrv9mY7KFRhbqVMOcPBCeYVnP+
         fC7ZmIhOXif7HaLP6vJgu0Wdoc56dkB84WdTvsAF7ub3fn7H2a0MxokC2SI6l0HVx5i5
         z5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=cpiOf5xnms6MQFTFm0xxHikDeVrmrFp5qEGgGblMz4Q=;
        b=TYsNI2WCHipPmmXx78r29o0bAwgFZCUKFe3keqraKZSA59kTYxL3r/fnGXPoJ8+HmA
         1Ewp63fje0xIOIviWm7WUf2pP5lxmjXbi+MfBT3QlaX/TM6LbSUit5v5LNanoGcKX2Uz
         QL/WlYixIc/ii6wbbCCYKtZD4M2ze2uKL/NMvY3KbpKOB5VtjsLzxMq1lqEEirtSCJ4c
         OgrHbvwafuUf5TqM2hBixjS2rswNlHW/NIG0hZ+gF+1N0NaqlUpIDff32NptftO2w7DQ
         /Hcv0Ajr47I29F09IvKG6M2tSaF6mCtwP5qXvZ4veqrjzfjl+U5GlRcmbDIhaZXlYjWU
         deYQ==
X-Gm-Message-State: AElRT7H9P9h9raZjQNKel1p7jIfIpmgQTMWEPTWpBxvt5NTBHn9WHLRb
	sNwyzXRLpE0T8S7DHza9Z0WFo0Zp
X-Google-Smtp-Source: AG47ELsjj/HreH3h9ss1v7Zt/gWsXEWZmAGXsIaFneew/hdAo2VCFXJE7nOeciMmvGYxzKAR5pDzvg==
X-Received: by 10.28.1.208 with SMTP id 199mr2505584wmb.26.1520611630583;
        Fri, 09 Mar 2018 08:07:10 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.22] (ABayonne-654-1-76-150.w86-222.abo.wanadoo.fr. [86.222.219.150])
        by smtp.gmail.com with ESMTPSA id l22sm1709433wre.52.2018.03.09.08.07.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Mar 2018 08:07:10 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v3 3/6] target/arm: Add "-cpu max" support
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180308130626.12393-1-peter.maydell@linaro.org>
 <20180308130626.12393-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d7c89ebd-a0e3-5f42-9164-9ed87990b852@amsat.org>
Date: Fri, 9 Mar 2018 17:07:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180308130626.12393-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: C6sAKB3tmrhW

On 03/08/2018 02:06 PM, Peter Maydell wrote:
> Add support for "-cpu max" for ARM guests. This CPU type behaves
> like "-cpu host" when KVM is enabled, and like a system CPU with
> the maximum possible feature set otherwise. (Note that this means
> it won't be migratable across versions, as we will likely add
> features to it in future.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu-qom.h |  2 ++
>  target/arm/cpu.c     | 24 ++++++++++++++++++++++++
>  target/arm/cpu64.c   | 21 +++++++++++++++++++++
>  3 files changed, 47 insertions(+)
> 
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index a42495bac9..d135ff8e06 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -33,6 +33,8 @@ struct arm_boot_info;
>  #define ARM_CPU_GET_CLASS(obj) \
>      OBJECT_GET_CLASS(ARMCPUClass, (obj), TYPE_ARM_CPU)
>  
> +#define TYPE_ARM_MAX_CPU "max-" TYPE_ARM_CPU
> +
>  /**
>   * ARMCPUClass:
>   * @parent_realize: The parent class' realize handler.
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1a58a2c094..e46ddcc613 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1697,6 +1697,27 @@ static void pxa270c5_initfn(Object *obj)
>      cpu->reset_sctlr = 0x00000078;
>  }
>  
> +#ifndef TARGET_AARCH64
> +/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> + * otherwise, a CPU with as many features enabled as our emulation supports.
> + * The version of '-cpu max' for qemu-system-aarch64 is defined in cpu64.c;
> + * this only needs to handle 32 bits.
> + */
> +static void arm_max_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (kvm_enabled()) {
> +        kvm_arm_set_cpu_features_from_host(cpu);
> +    } else {
> +        cortex_a15_initfn(obj);
> +        /* In future we might add feature bits here even if the
> +         * real-world A15 doesn't implement them.
> +         */
> +    }
> +}
> +#endif
> +
>  #ifdef CONFIG_USER_ONLY
>  static void arm_any_initfn(Object *obj)
>  {
> @@ -1764,6 +1785,9 @@ static const ARMCPUInfo arm_cpus[] = {
>      { .name = "pxa270-b1",   .initfn = pxa270b1_initfn },
>      { .name = "pxa270-c0",   .initfn = pxa270c0_initfn },
>      { .name = "pxa270-c5",   .initfn = pxa270c5_initfn },
> +#ifndef TARGET_AARCH64
> +    { .name = "max",         .initfn = arm_max_initfn },
> +#endif
>  #ifdef CONFIG_USER_ONLY
>      { .name = "any",         .initfn = arm_any_initfn },
>  #endif
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 4228713b19..9042d3dfd1 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -28,6 +28,7 @@
>  #include "hw/arm/arm.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
> +#include "kvm_arm.h"
>  
>  static inline void set_feature(CPUARMState *env, int feature)
>  {
> @@ -212,6 +213,25 @@ static void aarch64_a53_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
>  }
>  
> +/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> + * otherwise, a CPU with as many features enabled as our emulation supports.
> + * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> + * this only needs to handle 64 bits.
> + */
> +static void aarch64_max_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (kvm_enabled()) {
> +        kvm_arm_set_cpu_features_from_host(cpu);
> +    } else {
> +        aarch64_a57_initfn(obj);
> +        /* In future we might add feature bits here even if the
> +         * real-world A57 doesn't implement them.
> +         */
> +    }
> +}
> +
>  #ifdef CONFIG_USER_ONLY
>  static void aarch64_any_initfn(Object *obj)
>  {
> @@ -247,6 +267,7 @@ typedef struct ARMCPUInfo {
>  static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
>      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
> +    { .name = "max",                .initfn = aarch64_max_initfn },
>  #ifdef CONFIG_USER_ONLY
>      { .name = "any",         .initfn = aarch64_any_initfn },
>  #endif
> 

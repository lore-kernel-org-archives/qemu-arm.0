Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp174510ejb;
        Tue, 23 Apr 2024 13:48:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwzWRWobKSAvBHIR6ZJDi0LgxyBx2mdaVdxPWlLoUWVcAFhcUvaKkgxtTPgepflFzBf+MYhEAErPMorSJjlDaxzV29ZxLi
X-Google-Smtp-Source: AGHT+IFfCTb0J1kG/jXHEPiYZnvgKSqupQka2nAMgDxLTYVK5ZE36jslr+9dcP27RASS7OLn7Ed9
X-Received: by 2002:a05:622a:30f:b0:439:80de:9c96 with SMTP id q15-20020a05622a030f00b0043980de9c96mr657884qtw.32.1713905286804;
        Tue, 23 Apr 2024 13:48:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713905286; cv=none;
        d=google.com; s=arc-20160816;
        b=wav/KLOtjTWpfeqsZyqF3TQwVuPGMHsIvrqi9lnSEc8pmQauSAZ/wFTGW+z66KMegt
         NNaKdIzjeI2kMVxacwVM0FeSCvk8+9h1urMH8f/q20B/Bj+J0Awz/+icWAVnt3ULTfps
         tg9miO3gXlMe/IrXIcaiYRWqNpmC/qs1PghUx5Jfr4Za6TAtHVuiXFbpuYcFZ9dtAbeb
         Qt98BeNd1O1q1ALpJB64Kw8QzQSPPOJn9cuTtJPf7cO4mqJ0EbhVEbIIA0n2s2/qJqtX
         U99ZpCybJhUprzJhoiELgc0NPtZxnz1Wx/dG+xblzQxHwxdX6x876MHi9FY7e+jq8Alq
         GUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uDnKJR4KEV4FBjccEyi75rJnbDh/RRlLX0zRHYW8gCs=;
        fh=brn+3QgusQAAGQWzER7Tkg/qNkwelpIXJJ9RPzChQuM=;
        b=GAraIB5FYPqhbVvQN04Bb80ZiQQ5ev9jmJ5uTh7u5os4vRDGVQo6GSrHHOaHc6p0EX
         7CnMD+jqK2j207hmT9kB4xvhBTCWXiIMngUI+UHlW4loxppgfJTNzOsPyeuROj7u4K7h
         r1jEmDtT91zBProOrEHHJkQzhzwhUWtLHD+wbFYJZAkwv+l2WS2dK6C38TzxHDX/FBVx
         Gjjrkq/izzMM21rLM2JmhnlulGbYki+RWfdQB7c3uTbarYVBvD+OvtDbwDRIcMngdK/P
         IU2Uml47SoyrACKQ6gcKXVPC95btEbkyxp+wdULBc2rZAcLVSr6owcXjQikro63Rczs1
         jziQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=duQWx3wJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12-20020a05622a040c00b00434ad79b1f7si13865914qtx.317.2024.04.23.13.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Apr 2024 13:48:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=duQWx3wJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzN3D-0001mx-KI; Tue, 23 Apr 2024 16:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzN3C-0001g2-0k
 for qemu-arm@nongnu.org; Tue, 23 Apr 2024 16:47:38 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rzN39-0003Jy-6v
 for qemu-arm@nongnu.org; Tue, 23 Apr 2024 16:47:37 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3476dcd9c46so4603227f8f.0
 for <qemu-arm@nongnu.org>; Tue, 23 Apr 2024 13:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713905253; x=1714510053; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uDnKJR4KEV4FBjccEyi75rJnbDh/RRlLX0zRHYW8gCs=;
 b=duQWx3wJYeJKAKnH47RA3rr/oRoAQcyoim6qt+xXgtnrZukolDdolN4skGAlWnJwfe
 4ufZcFxX05TcGNDfsNtxgaRoihSudmqm6pBORewSD44ra6R3zj6TyV/kcZLt4Vr7X6il
 PF86jFiHoNnQ96k1cgAFe37rAIHRfQOl858w4e4qfiunZbHcYUnVefzcHyfy32NjG6iR
 xaPl+AjcXu11FgCd6HwGufoqSHbIfNTMre+K8cutPE9QCUUHL6YSW07v2hKg3t0AcNLD
 NbOsJS80lmYVkdxPXhvfycHqxO4wuNJ6smbVh4cwqzJbDneWOlv14lJW7/Qhb1qYsqa9
 MsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713905253; x=1714510053;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uDnKJR4KEV4FBjccEyi75rJnbDh/RRlLX0zRHYW8gCs=;
 b=HePT+nLSaPMHUhM3zjcmoUOxfccU1kAUSkQ3VDkQcy8UTw9xsxIJb0AiCOpUuQmQMc
 fwLQ1E0IvGBbvECiX0MLvpBu1CZiBwgBKtkRl9+QkR66IvWjsCbHgKautKJs9yhghrLL
 Iol9eSu8qwNa+sVN8jxr9ueRzAWowsVNDKf9R0KbJ7gKNEeCKf3B2NlaqOmWtRt6496A
 cyi3kRWEqXWb2Fu7gtrYz4CK/jnBggr+dkPqD9Pd3H/kmZXygBozWGh9nXBAw1ghXxei
 BVDLZG1W1sUja5QG/t1anhBOgy2J0BxKLK7dedxcnwEORxCEyiNquq96D5QMYei5QvxK
 GjmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+c5EdOuv1lIEvivWZKO0A/pQGpmJHBeCe20rnWUz6seWehr0gAEvGqYbJiItjXGRwf4JE1XbzoGQHW44x0ghHl7UT
X-Gm-Message-State: AOJu0YxMG/XteVRMBE+IwilGaGUJVWWyg548DTBjO0pyjVDIkp7rj5W/
 029OoaelvTafaPmT0JSYVv2bUb61zI6kthUCEcCZx11VHH6BWf3kGlyRFGG0XPE=
X-Received: by 2002:adf:b34c:0:b0:349:c573:2535 with SMTP id
 k12-20020adfb34c000000b00349c5732535mr184167wrd.50.1713905252716; 
 Tue, 23 Apr 2024 13:47:32 -0700 (PDT)
Received: from [192.168.69.100] (pas38-h02-176-184-5-107.dsl.sta.abo.bbox.fr.
 [176.184.5.107]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d4b0b000000b00349a6af3da5sm15406437wrq.51.2024.04.23.13.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 13:47:32 -0700 (PDT)
Message-ID: <482edb42-95cf-402f-9124-4e0b1f76b91f@linaro.org>
Date: Tue, 23 Apr 2024 22:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/arm: Default to 1GHz cntfrq for 'max' and new
 CPUs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240419184608.2675213-1-peter.maydell@linaro.org>
 <20240419184608.2675213-4-peter.maydell@linaro.org>
Content-Language: en-US
Cc: Markus Armbruster <armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240419184608.2675213-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HGIORt07vhcb

(+Markus for qdev properties; one inlined comment)

On 19/4/24 20:46, Peter Maydell wrote:
> In previous versions of the Arm architecture, the frequency of the
> generic timers as reported in CNTFRQ_EL0 could be any IMPDEF value,
> and for QEMU we picked 62.5MHz, giving a timer tick period of 16ns.
> In Armv8.6, the architecture standardized this frequency to 1GHz.
> 
> Because there is no ID register feature field that indicates whether
> a CPU is v8.6 or that it ought to have this counter frequency, we
> implement this by changing our default CNTFRQ value for all CPUs,
> with exceptions for backwards compatibility:
> 
>   * CPU types which we already implement will retain the old
>     default value. None of these are v8.6 CPUs, so this is
>     architecturally OK.
>   * CPUs used in versioned machine types with a version of 9.0
>     or earlier will retain the old default value.
> 
> The upshot is that the only CPU type that changes is 'max'; but any
> new type we add in future (whether v8.6 or not) will also get the new
> 1GHz default.
> 
> It remains the case that the machine model can override the default
> value via the 'cntfrq' QOM property (regardless of the CPU type).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h       | 11 +++++++++++
>   target/arm/internals.h | 12 ++++++++++--
>   hw/core/machine.c      |  4 +++-
>   target/arm/cpu.c       | 28 ++++++++++++++++++++++------
>   target/arm/cpu64.c     |  2 ++
>   target/arm/tcg/cpu32.c |  4 ++++
>   target/arm/tcg/cpu64.c | 18 ++++++++++++++++++
>   7 files changed, 70 insertions(+), 9 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 20d8257c853..4eeeac3fe94 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -953,6 +953,9 @@ struct ArchCPU {
>        */
>       bool host_cpu_probe_failed;
>   
> +    /* QOM property to indicate we should use the back-compat CNTFRQ default */
> +    bool backcompat_cntfrq;
> +
>       /* Specify the number of cores in this CPU cluster. Used for the L2CTLR
>        * register.
>        */
> @@ -2367,6 +2370,14 @@ enum arm_features {
>       ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>       ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>       ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> +    /*
> +     * ARM_FEATURE_BACKCOMPAT_CNTFRQ makes the CPU default cntfrq be 62.5MHz
> +     * if the board doesn't set a value, instead of 1GHz. It is for backwards
> +     * compatibility and used only with CPU definitions that were already
> +     * in QEMU before we changed the default. It should not be set on any
> +     * CPU types added in future.
> +     */
> +    ARM_FEATURE_BACKCOMPAT_CNTFRQ, /* 62.5MHz timer default */
>   };
>   
>   static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 74d4b1b0990..11d9ff0fc08 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -61,9 +61,17 @@ static inline bool excp_is_internal(int excp)
>   
>   /*
>    * Default frequency for the generic timer, in Hz.
> - * This is 62.5MHz, which gives a 16 ns tick period.
> + * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
> + * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
> + * which gives a 16ns tick period.
> + *
> + * We will use the back-compat value:
> + *  - for QEMU CPU types added before we standardized on 1GHz
> + *  - for versioned machine types with a version of 9.0 or earlier
> + * In any case, the machine model may override via the cntfrq property.
>    */
> -#define GTIMER_DEFAULT_HZ 62500000
> +#define GTIMER_DEFAULT_HZ 1000000000
> +#define GTIMER_BACKCOMPAT_HZ 62500000
>   
>   /* Bit definitions for the v7M CONTROL register */
>   FIELD(V7M_CONTROL, NPRIV, 0, 1)
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a92bec23147..bd40483d880 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -33,7 +33,9 @@
>   #include "hw/virtio/virtio-iommu.h"
>   #include "audio/audio.h"
>   
> -GlobalProperty hw_compat_9_0[] = {};
> +GlobalProperty hw_compat_9_0[] = {
> +    {"arm-cpu", "backcompat-cntfrq", "true" },
> +};
>   const size_t hw_compat_9_0_len = G_N_ELEMENTS(hw_compat_9_0);
>   
>   GlobalProperty hw_compat_8_2[] = {
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b248b283423..2c8160d6b74 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1388,6 +1388,11 @@ static void arm_cpu_initfn(Object *obj)
>   static Property arm_cpu_gt_cntfrq_property =
>               DEFINE_PROP_UINT64("cntfrq", ARMCPU, gt_cntfrq_hz, 0);
>   
> +/* True to default to the backwards-compatibility old CNTFRQ rather than 1Ghz */
> +static Property arm_cpu_backcompat_cntfrq_property =
> +            DEFINE_PROP_BOOL("backcompat-cntfrq", ARMCPU,
> +                             backcompat_cntfrq, false);
> +
>   static Property arm_cpu_reset_cbar_property =
>               DEFINE_PROP_UINT64("reset-cbar", ARMCPU, reset_cbar, 0);
>   
> @@ -1709,6 +1714,8 @@ void arm_cpu_post_init(Object *obj)
>           qdev_property_add_static(DEVICE(cpu), &arm_cpu_gt_cntfrq_property);
>       }
>   
> +    qdev_property_add_static(DEVICE(obj), &arm_cpu_backcompat_cntfrq_property);

I'd rather keep the qdev_property_add_static() for "dynamic"
properties (what a bad function name...) and add this one to
the static arm_cpu_properties[] array.

(Similar comment with arm_cpu_cfgend_property).

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       if (kvm_enabled()) {
>           kvm_arm_add_vcpu_properties(cpu);
>       }
> @@ -1834,13 +1841,22 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>   
>       if (!cpu->gt_cntfrq_hz) {
>           /*
> -         * 0 means "the board didn't set a value, use the default".
> -         * The default value of the generic timer frequency (as seen in
> -         * CNTFRQ_EL0) is 62.5MHz, which corresponds to a period of 16ns.
> -         * This is what you get (a) for a CONFIG_USER_ONLY CPU (b) if the
> -         * board doesn't set it.
> +         * 0 means "the board didn't set a value, use the default". (We also
> +         * get here for the CONFIG_USER_ONLY case.)
> +         * ARMv8.6 and later CPUs architecturally must use a 1GHz timer; before
> +         * that it was an IMPDEF choice, and QEMU initially picked 62.5MHz,
> +         * which gives a 16ns tick period.
> +         *
> +         * We will use the back-compat value:
> +         *  - for QEMU CPU types added before we standardized on 1GHz
> +         *  - for versioned machine types with a version of 9.0 or earlier
>            */
> -        cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
> +        if (arm_feature(env, ARM_FEATURE_BACKCOMPAT_CNTFRQ) ||
> +            cpu->backcompat_cntfrq) {
> +            cpu->gt_cntfrq_hz = GTIMER_BACKCOMPAT_HZ;
> +        } else {
> +            cpu->gt_cntfrq_hz = GTIMER_DEFAULT_HZ;
> +        }
>       }
>   
>   #ifndef CONFIG_USER_ONLY
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 985b1efe160..c15d086049f 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -599,6 +599,7 @@ static void aarch64_a57_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -656,6 +657,7 @@ static void aarch64_a53_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
> index b5a60682fa6..bdd82d912a2 100644
> --- a/target/arm/tcg/cpu32.c
> +++ b/target/arm/tcg/cpu32.c
> @@ -457,6 +457,7 @@ static void cortex_a7_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -505,6 +506,7 @@ static void cortex_a15_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -696,6 +698,7 @@ static void cortex_r52_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_PMSA);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_AUXCR);
>       cpu->midr = 0x411fd133; /* r1p3 */
> @@ -924,6 +927,7 @@ static void arm_max_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
>       set_feature(&cpu->env, ARM_FEATURE_EL3);
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index c3369f40824..b0eb7fbb385 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -63,6 +63,7 @@ static void aarch64_a35_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -231,6 +232,7 @@ static void aarch64_a55_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -299,6 +301,7 @@ static void aarch64_a72_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -354,6 +357,7 @@ static void aarch64_a76_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -423,6 +427,7 @@ static void aarch64_a64fx_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
>       set_feature(&cpu->env, ARM_FEATURE_EL3);
> @@ -592,6 +597,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -663,6 +669,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -885,6 +892,7 @@ static void aarch64_a710_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -982,6 +990,7 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
>       set_feature(&cpu->env, ARM_FEATURE_V8);
>       set_feature(&cpu->env, ARM_FEATURE_NEON);
>       set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
>       set_feature(&cpu->env, ARM_FEATURE_AARCH64);
>       set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
>       set_feature(&cpu->env, ARM_FEATURE_EL2);
> @@ -1077,6 +1086,15 @@ void aarch64_max_tcg_initfn(Object *obj)
>       uint64_t t;
>       uint32_t u;
>   
> +    /*
> +     * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
> +     * to because we started with aarch64_a57_initfn(). A 'max' CPU might
> +     * be a v8.6-or-later one, in which case the cntfrq must be 1GHz; and
> +     * because it is our "may change" CPU type we are OK with it not being
> +     * backwards-compatible with how it worked in old QEMU.
> +     */
> +    unset_feature(&cpu->env, ARM_FEATURE_BACKCOMPAT_CNTFRQ);
> +
>       /*
>        * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
>        * one and try to apply errata workarounds or use impdef features we


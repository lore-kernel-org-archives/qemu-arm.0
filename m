Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp5168njb;
        Mon, 3 Feb 2025 21:02:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX9/3V+WwLIYz1kPMW7smoe52/cKHF0Bk27VA//kwOea6z8o62QG8k5IcV+iOxnHSihCliNGNZzPkxE0g==@linaro.org
X-Google-Smtp-Source: AGHT+IHuKIaRTRR6fZ9yOthY+cxbkvp8ZasDNGjKzJ9cm48N0kPy36QiuIiVuorbBKoQkbhPT2V3
X-Received: by 2002:ac8:5a54:0:b0:467:6742:5633 with SMTP id d75a77b69052e-46fd0accdd1mr386130141cf.23.1738645374509;
        Mon, 03 Feb 2025 21:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738645374; cv=none;
        d=google.com; s=arc-20240605;
        b=b5Xvs+ZqVqM2eAezvEsThttpNajG4ugo4b4pqaFR5MPuZay0FGvtq0b+KXS3iP/75U
         eknKAgj5yDKt/wkDk2SWw4LmCvnpXq6aVBrwKy78erugdWpsT8uJ6kemFBwwqTFcF+IT
         cQWDdbkwtG1wSn9IKOXlmps9tYqr3Ihm/OaxZX3MLwtPTtNNgvxCPKkDJUT6JYi4xl+V
         +3o3FKuZ4DiZBDO4lrWRR9Q0z+UzoJds351IQ6QhgwfpOUeJSPxLo5Wg++3kdmOmRLbf
         b3Be85kR4RjfU+ej1KujoHbFA5cm9YyTCk5HsA8igl8JIq9BoD2u3/ageaHKHx4h2XBf
         5jow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zLwPzCW+9mhMz39XR3eYl9jQT8q9/Q27z70z+ybmEIQ=;
        fh=TYOnIWw0znPRnoBN8b7G/ekYYmgMm/KVfCiSfi5KsN4=;
        b=hA7sxkkRJ+rCjPqt24l/70bh4qPsg0+OUUj0WneTcBeEfooYl/vntULVhVLMEp9iaL
         w4nlcwH4MkvkDQklXOIWHj8zmrnkJf14KMJnkL6I+WDj3+wpEUxPuNtsdHeVDEn3WlEh
         bkeYPDf81B3Fl9IZb6RctR3xWb2g5PSTz/PFsZrpDeJgd6tL1d3cWrtGkE/v+yq/XegI
         htgi4vFiCy0tsvnqRFvMM/N0m2vy0NhLv1kFVcHl5w2njrEoqN+cixyXK5l0XKmLh0Dd
         Hg23vh11Yq24Y/48NKLQY/a8YezLAXSyJqeBD+Yr5sQYrK0aVJsVIRp9I117TNQycYTJ
         QRMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lti0JMra;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-47016bfb0easi18920781cf.665.2025.02.03.21.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 21:02:54 -0800 (PST)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lti0JMra;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738645374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zLwPzCW+9mhMz39XR3eYl9jQT8q9/Q27z70z+ybmEIQ=;
	b=Lti0JMrasqKYysHYHXO7gK/bMgkhGVJ3XPhH2kzoeBy8TJ8Wo4CC2ZNqxfBW1PVHAFCGOm
	xSQX57rea9/lpNwL/v4ZTZVwPmAFPToNlRZ6DDxEoq2yCkj3czE7WCXFBqUb8IdmZ0Vjzy
	b+QS+jeBHs2DFhneuHFM9gi1oDUXTjg=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-tRdxAKhlOXmBjcZJpx-DhQ-1; Tue, 04 Feb 2025 00:02:49 -0500
X-MC-Unique: tRdxAKhlOXmBjcZJpx-DhQ-1
X-Mimecast-MFC-AGG-ID: tRdxAKhlOXmBjcZJpx-DhQ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2efc3292021so14690253a91.1
        for <alex.bennee@linaro.org>; Mon, 03 Feb 2025 21:02:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738645368; x=1739250168;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLwPzCW+9mhMz39XR3eYl9jQT8q9/Q27z70z+ybmEIQ=;
        b=L+vI9IohzmMJEsJFS8lo8v4h2HGDYNV3A5Mg3qhEQPGyiM6r4apb9Re4lvqgcwDNMK
         LMYcpAVhqlDF0w13fIZwhgSBTbR44WDoH9VVNodBBp+wNl0GHxvKeY9RXRR/CnN5hB2L
         ZVAFIa38CAzg9GxDuwt8nPiiVQjaBuivWdgQpsSjt7JMeAARNoz5AajouMa3XPjz5MqJ
         cBRVKKfcvgBlKgg7GNPLrbuXfkMaWRjqICiYnj9U3NIhWJSbk7pgOJLupUGWbPyC3HKm
         ZWZg+JNLrHnV4Mwb2gR1tHNdOPch6wWicmyjtLbBt2/1wKCgbzdY4iSutaaKEh0Bm/0x
         Og6w==
X-Forwarded-Encrypted: i=1; AJvYcCWoyz3IQOGlt6MVdiFOfC7vLcYT6b6r5BNE959c8RUqIVcLVkGoT7gOKWV1iyDZhhbyRO070HvNBsY9vQ==@linaro.org
X-Gm-Message-State: AOJu0YzKjJGWeXzYRHFWlaFwtXfZzERwoG6r7MkcOd2Vfa+od8b9sKPu
	MqxlrHSTsTcXB/aq+f6rej0RW1IB+RNsRTAskn0/vjmKiZJAUcG9KNLsHNlVO1zzYoJtkbjal0X
	GIc7ROmsv8lcctjmrMqGPC70MOY8YE1FWzTBqOImITxdZggEBzIMh/u11ujNPBg==
X-Gm-Gg: ASbGncu39ItvuF2CYCBtLcMw27EKJxKo6yuhfj1zBG0r6J6y16f1iWGB8AR0pJFizXN
	e6GB2THAZOIVJ11bnWNml8OROHOFPt0i4AABqf258DABribhjkGnpVNJy9vWFByDQyeCW5OfQi0
	csYmAO42xnfeTNJmy+m4ba6THAyOycQl/ot+bePE+tD6gQA/G5xD17mW/zKORxmZd62C/2fct2U
	sMaHrWceSoPuSV4H8SUVTJErZZ+7NgNDi5eJs8f657R+eDyhnUlWvN98cUtI9lcjeaR4tDGnCOE
	9kU6EA==
X-Received: by 2002:a05:6a00:3a1d:b0:725:e015:908d with SMTP id d2e1a72fcca58-72fd0bce492mr33593464b3a.1.1738645367614;
        Mon, 03 Feb 2025 21:02:47 -0800 (PST)
X-Received: by 2002:a05:6a00:3a1d:b0:725:e015:908d with SMTP id d2e1a72fcca58-72fd0bce492mr33593423b3a.1.1738645367126;
        Mon, 03 Feb 2025 21:02:47 -0800 (PST)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf13sm9433909b3a.32.2025.02.03.21.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 21:02:46 -0800 (PST)
Message-ID: <abb2bf76-2548-4c2b-a971-502ca623aee2@redhat.com>
Date: Tue, 4 Feb 2025 15:02:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/26] target/arm/kvm-rme: Initialize vCPU
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-8-jean-philippe@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241125195626.856992-8-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MlmJRP4tIPjvXIifhQunSzsQXVpGKcKynSaU0spT9OM_1738645368
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: fheZuWGxrdYg

On 11/26/24 5:56 AM, Jean-Philippe Brucker wrote:
> The target code calls kvm_arm_vcpu_init() to mark the vCPU as part of a
> Realm. For a Realm vCPU, only x0-x7 can be set at runtime. Before boot,
> the PC can also be set, and is ignored at runtime. KVM also accepts a
> few system register changes during initial configuration, as returned by
> KVM_GET_REG_LIST.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   target/arm/cpu.h     |  3 +++
>   target/arm/kvm_arm.h | 15 +++++++++++
>   target/arm/kvm-rme.c | 10 ++++++++
>   target/arm/kvm.c     | 61 ++++++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 89 insertions(+)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d86e641280..f617591921 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -961,6 +961,9 @@ struct ArchCPU {
>       OnOffAuto kvm_steal_time;
>   #endif /* CONFIG_KVM */
>   
> +    /* Realm Management Extension */
> +    bool kvm_rme;
> +
>       /* Uniprocessor system with MP extensions */
>       bool mp_is_up;
>   
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 9d6a89f9b1..8b52a881b0 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -245,6 +245,16 @@ int kvm_arm_rme_init(MachineState *ms);
>    */
>   int kvm_arm_rme_vm_type(MachineState *ms);
>   
> +/**
> + * kvm_arm_rme_vcpu_init
> + * @cs: the CPU
> + *
> + * If the user requested a Realm, setup the given vCPU accordingly. Realm vCPUs
> + * behave a little differently, for example most of their register state is
> + * hidden from the host.
> + */
> +int kvm_arm_rme_vcpu_init(CPUState *cs);
> +
>   #else
>   
>   /*
> @@ -339,6 +349,11 @@ static inline int kvm_arm_rme_vm_type(MachineState *ms)
>       g_assert_not_reached();
>   }
>   
> +static inline int kvm_arm_rme_vcpu_init(CPUState *cs)
> +{
> +    g_assert_not_reached();
> +}
> +
>   #endif
>   
>   #endif
> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> index 60d967a842..e3cc37538a 100644
> --- a/target/arm/kvm-rme.c
> +++ b/target/arm/kvm-rme.c
> @@ -137,6 +137,16 @@ int kvm_arm_rme_init(MachineState *ms)
>       return 0;
>   }
>   
> +int kvm_arm_rme_vcpu_init(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    if (rme_guest) {
> +        cpu->kvm_rme = true;
> +    }
> +    return 0;
> +}
> +
>   int kvm_arm_rme_vm_type(MachineState *ms)
>   {
>       if (rme_guest) {
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0c80992f7c..a0de2efc41 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1926,6 +1926,11 @@ int kvm_arch_init_vcpu(CPUState *cs)
>           return ret;
>       }
>   
> +    ret = kvm_arm_rme_vcpu_init(cs);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       if (cpu_isar_feature(aa64_sve, cpu)) {
>           ret = kvm_arm_sve_set_vls(cpu);
>           if (ret) {
> @@ -2062,6 +2067,35 @@ static int kvm_arch_put_sve(CPUState *cs)
>       return 0;
>   }
>   
> +static int kvm_arm_rme_put_core_regs(CPUState *cs, Error **errp)
> +{
> +    int i, ret;
> +    struct kvm_one_reg reg;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    /*
> +     * The RME ABI only allows us to set 8 GPRs and the PC
> +     */

Needn't to span for multiple lines.

> +    for (i = 0; i < 8; i++) {
> +        reg.id = AARCH64_CORE_REG(regs.regs[i]);
> +        reg.addr = (uintptr_t) &env->xregs[i];
> +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    reg.id = AARCH64_CORE_REG(regs.pc);
> +    reg.addr = (uintptr_t) &env->pc;
> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +

Nice place to use kvm_set_one_reg(). With it, @reg can be dropped.

>   static int kvm_arm_put_core_regs(CPUState *cs, int level, Error **errp)
>   {
>       uint64_t val;
> @@ -2072,6 +2106,10 @@ static int kvm_arm_put_core_regs(CPUState *cs, int level, Error **errp)
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
>   
> +    if (cpu->kvm_rme) {
> +        return kvm_arm_rme_put_core_regs(cs, errp);
> +    }
> +
>       /* If we are in AArch32 mode then we need to copy the AArch32 regs to the
>        * AArch64 registers before pushing them out to 64-bit KVM.
>        */
> @@ -2259,6 +2297,25 @@ static int kvm_arch_get_sve(CPUState *cs)
>       return 0;
>   }
>   
> +static int kvm_arm_rme_get_core_regs(CPUState *cs, Error **errp)
> +{
> +    int i, ret;
> +    struct kvm_one_reg reg;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    for (i = 0; i < 8; i++) {
> +        reg.id = AARCH64_CORE_REG(regs.regs[i]);
> +        reg.addr = (uintptr_t) &env->xregs[i];
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +

Similiarly, kvm_get_one_reg() can be used.

>   static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
>   {
>       uint64_t val;
> @@ -2269,6 +2326,10 @@ static int kvm_arm_get_core_regs(CPUState *cs, Error **errp)
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
>   
> +    if (cpu->kvm_rme) {
> +        return kvm_arm_rme_get_core_regs(cs, errp);
> +    }
> +
>       for (i = 0; i < 31; i++) {
>           ret = kvm_get_one_reg(cs, AARCH64_CORE_REG(regs.regs[i]),
>                                 &env->xregs[i]);

Thanks,
Gavin

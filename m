Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp1140993njg;
        Wed, 18 Sep 2024 20:22:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQIEg1PJ8d/joA0Scl37UfbcAf6ZCyfStyUU6hP03aDIMZo2DBn6YQcBvG7Gay4UyyxZ4qDVCUYlcxCw==@linaro.org
X-Received: by 2002:a05:6a20:e687:b0:1c6:fb2a:4696 with SMTP id adf61e73a8af0-1cf75eefa0cmr39953307637.19.1726716179197;
        Wed, 18 Sep 2024 20:22:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726716179; cv=none;
        d=google.com; s=arc-20160816;
        b=QRcm83jJ9wabuLCwZyRa70vv9hloTNS/LUN49drgO4s1LXLL5EGberAy7s60wzoLHb
         2HMFdpDKkLu45OXne2NqYKcG09TLiCRZP5gFKwJCEtInJwhXIxcaMkhAMdkTOI2fUYLb
         L/yaJdFVGVIQgLQ3BCx3dAj1gXu3YWJ2m11Ojc9euJ1ix1nEWKlfr9lfBOE7KJMceuoj
         6b/Bu2UkN48aYdVB+YJb752XU/mXypLalNw5z3s8egykDfWT0aU6eZOPhEoUdr3ZJyYQ
         jj5EWDDHxE9/c5LaBosPh0YKSTLvY+894FyCJusjr0nQ8AWuiJxDqgpgFE5/2rIhZwHY
         oZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=q4JlnRf+sH8eouq6eUmmXaWchAjLldxPWsjwU8cMKxg=;
        fh=aycRh6bH70yDU4CO/lbuD9bEQc/dF7n+mNxDj5SSsJs=;
        b=HVGqZUGZIhy1JlUPPQjrLCAPyabrmQgJCOGFSE4eh+fKeh+vu8ao5mxr2y7ADe5rAJ
         k0+NJnGH7/JXlCwjMSH47CSJR4GXxjaeksA0nD0V6cKJvVPBG+RbPqaIMDfEny7dD8Go
         3KY7uPQ+xVAgBY04IAddkCfnCVLMYMpHE/Qut0lc8I1iwP/Y9jyUG2YuosPLh7URNqg9
         PzeQUXQh+xWtOtxKlaBWcjw6/fE3LMSKaKY+O4vxzzHxNsGSEKvZmojsiicRH51M3Wf2
         M8+/4ZjETbvnPspT+wHwc3iPtRRcsY7LHb7zKw/loLpVsixIaMEV/sAHk43eHIO7xzzM
         /yxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tIYiw5mU;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-71944b7e5c6sor6422437b3a.8.2024.09.18.20.22.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 18 Sep 2024 20:22:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tIYiw5mU;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726716179; x=1727320979; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q4JlnRf+sH8eouq6eUmmXaWchAjLldxPWsjwU8cMKxg=;
        b=tIYiw5mUUDvk9RHmhlaPpzo/YD4cqumClrOC7djUHUSiywGOBzkVTBBwM/GMsHj/F0
         ApI3zBxAGbIcwvhsZe+9e+EKrEFbFn+CHHebdu41DKZy2SA5IMzh9e0kZL2E/thKwzxF
         wPSewkyWG5uXMWZkeGxhQdceGP5sLVBdhtyJu04EFp+AyjG+MGvFszGz2DWcScQp+ryn
         CKiHFU03XxM8AaulIShATx3uoZ8xhHYPGvXKaH2LOeLnZuJ+PqHOrOkuxvFyaL0DKhYo
         DjwJHgSu7qpJ92tOcU5GyMZlsh4tkWnO2wDfOl1mro6taes/OjKFc2rN+f8UqzGcda7L
         Y66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726716179; x=1727320979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4JlnRf+sH8eouq6eUmmXaWchAjLldxPWsjwU8cMKxg=;
        b=rh1+2cZIJaPLMKjNw+pBWAMj/U5b6DmokEOR7HA7fiN9mlss56b9JGp50MXvYd81Pj
         8KkqpsElPMTS3t9JRvAgzR83pouL+X72J/VZRRQZXGF50iLb2gE9N6FQ5RIpa6wjOwCj
         rCRsebUNVb7Sl/Vr8o1UhlKz6JYApp/bl6brWs2r/R8b4Ocus/x0eA6rC8ef2mijdRrj
         3ZLcETDfYWjWF72JOIveCsrKQqB5zKNEzwNay7U1yRo9e/8OjK7DU2nPWqfeA+1L8INF
         I9NR/W4oFEuqbIgRP5N/eosUnnHtD1EXHfaLq8wsa9ND5Ja01drcgfSWNJulZRqT93cL
         7XEA==
X-Forwarded-Encrypted: i=1; AJvYcCVLDGcA0iEclfTFv7EljW8m8FR9AXq8zKO/3dBS+lQBRAES3lEQvBsmBVY5swsqZEJtVHSWKsc3udQPNw==@linaro.org
X-Gm-Message-State: AOJu0Yy9mYSKm9sEG00ERc4xTU/9JQc88cHx5FAnLEz8NyrTdqicsJPI
	Ddx6So83dVim6yBN5NQp3JR5m9tQYJ+HOdvo0SYHSO4gpT4psv/FVvm2zM3vzNjwog==
X-Google-Smtp-Source: AGHT+IER8vk7VNwH0jakUaiaKB5bHqzns1GxQE7Z/Bxv2Y4wh0eEixI3JmItxHLLPwPvFbdzocsz3g==
X-Received: by 2002:a05:6a00:2daa:b0:717:9154:b5b6 with SMTP id d2e1a72fcca58-7192606ce9emr38653960b3a.7.1726716178457;
        Wed, 18 Sep 2024 20:22:58 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.101] ([187.75.38.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7afaesm7349289b3a.130.2024.09.18.20.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 20:22:57 -0700 (PDT)
Message-ID: <0faf9a7c-0400-482c-974f-7b70e1d58202@linaro.org>
Date: Thu, 19 Sep 2024 00:22:54 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm/kvm: add support for MTE
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, darren@os.amperecomputing.com
References: <20240912091616.393685-1-gankulkarni@os.amperecomputing.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20240912091616.393685-1-gankulkarni@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: VSUjrAlajlq7

Hi Ganapatrao,

On 9/12/24 06:16, Ganapatrao Kulkarni wrote:
> Extend the 'mte' property for the virt machine to cover KVM as
> well. For KVM, we don't allocate tag memory, but instead enable
> the capability.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> This patch is rework of commit b320e21c48ce64853904bea6631c0158cc2ef227
> which broke TCG since it made the TCG -cpu max
> report the presence of MTE to the guest even if the board hadn't
> enabled MTE by wiring up the tag RAM. This meant that if the guest
> then tried to use MTE QEMU would segfault accessing the
> non-existent tag RAM.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
> ---
> Changes since V1:
> 	Added code to enable MTE before reading register
> id_aa64pfr1 (unmasked MTE bits).
>
> This patch is boot tested on ARM64 with KVM and on X86 with TCG for mte=on
> and default case(i.e, no mte).
>
>   hw/arm/virt.c        | 72 ++++++++++++++++++++++++++------------------
>   target/arm/cpu.c     |  7 +++--
>   target/arm/cpu.h     |  2 ++
>   target/arm/kvm.c     | 59 ++++++++++++++++++++++++++++++++++++
>   target/arm/kvm_arm.h | 19 ++++++++++++
>   5 files changed, 126 insertions(+), 33 deletions(-)

Overall the patch looks good. I just have a couple of questions.


> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7934b23651..a33af7d996 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2211,7 +2211,7 @@ static void machvirt_init(MachineState *machine)
>           exit(1);
>       }
>   
> -    if (vms->mte && (kvm_enabled() || hvf_enabled())) {
> +    if (vms->mte && hvf_enabled()) {
>           error_report("mach-virt: %s does not support providing "
>                        "MTE to the guest CPU",
>                        current_accel_name());
> @@ -2281,39 +2281,51 @@ static void machvirt_init(MachineState *machine)
>           }
>   
>           if (vms->mte) {
> -            /* Create the memory region only once, but link to all cpus. */
> -            if (!tag_sysmem) {
> -                /*
> -                 * The property exists only if MemTag is supported.
> -                 * If it is, we must allocate the ram to back that up.
> -                 */
> -                if (!object_property_find(cpuobj, "tag-memory")) {
> -                    error_report("MTE requested, but not supported "
> -                                 "by the guest CPU");
> -                    exit(1);
> +            if (tcg_enabled()) {
> +                /* Create the memory region only once, but link to all cpus. */
> +                if (!tag_sysmem) {
> +                    /*
> +                     * The property exists only if MemTag is supported.
> +                     * If it is, we must allocate the ram to back that up.
> +                     */
> +                    if (!object_property_find(cpuobj, "tag-memory")) {
> +                        error_report("MTE requested, but not supported "
> +                                     "by the guest CPU");
> +                        exit(1);
> +                    }
> +
> +                    tag_sysmem = g_new(MemoryRegion, 1);
> +                    memory_region_init(tag_sysmem, OBJECT(machine),
> +                                       "tag-memory", UINT64_MAX / 32);
> +
> +                    if (vms->secure) {
> +                        secure_tag_sysmem = g_new(MemoryRegion, 1);
> +                        memory_region_init(secure_tag_sysmem, OBJECT(machine),
> +                                           "secure-tag-memory",
> +                                           UINT64_MAX / 32);
> +
> +                        /* As with ram, secure-tag takes precedence over tag. */
> +                        memory_region_add_subregion_overlap(secure_tag_sysmem,
> +                                                            0, tag_sysmem, -1);
> +                    }
>                   }
>   
> -                tag_sysmem = g_new(MemoryRegion, 1);
> -                memory_region_init(tag_sysmem, OBJECT(machine),
> -                                   "tag-memory", UINT64_MAX / 32);
> -
> +                object_property_set_link(cpuobj, "tag-memory",
> +                                         OBJECT(tag_sysmem), &error_abort);
>                   if (vms->secure) {
> -                    secure_tag_sysmem = g_new(MemoryRegion, 1);
> -                    memory_region_init(secure_tag_sysmem, OBJECT(machine),
> -                                       "secure-tag-memory", UINT64_MAX / 32);
> -
> -                    /* As with ram, secure-tag takes precedence over tag.  */
> -                    memory_region_add_subregion_overlap(secure_tag_sysmem, 0,
> -                                                        tag_sysmem, -1);
> +                    object_property_set_link(cpuobj, "secure-tag-memory",
> +                                             OBJECT(secure_tag_sysmem),
> +                                             &error_abort);
>                   }
> -            }
> -
> -            object_property_set_link(cpuobj, "tag-memory", OBJECT(tag_sysmem),
> -                                     &error_abort);
> -            if (vms->secure) {
> -                object_property_set_link(cpuobj, "secure-tag-memory",
> -                                         OBJECT(secure_tag_sysmem),
> -                                         &error_abort);
> +            } else if (kvm_enabled()) {
> +                if (!kvm_arm_mte_supported()) {
> +                    error_report("MTE requested, but not supported by KVM");
> +                    exit(1);
> +                }
> +                kvm_arm_enable_mte(cpuobj, &error_abort);
> +            } else {
> +                    error_report("MTE requested, but not supported ");
> +                    exit(1);
>               }
>           }
>   
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 19191c2391..a59417aac8 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2390,11 +2390,12 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>   
>   #ifndef CONFIG_USER_ONLY
>           /*
> -         * If we do not have tag-memory provided by the machine,
> -         * reduce MTE support to instructions enabled at EL0.
> +         * If we do not have tag-memory provided by the TCG
> +         * nor MTE at KVM enabled, reduce MTE support to
> +         * instructions enabled at EL0.

What controls if MTE insns. (stg, etc.) are enabled on EL0 and EL1

are the ATA and ATA0 bits in SCTRL register. Also, AA64PFR1 is a

register just to report the features available on the CPU, so I

wonder if that comment is indeed correct.

@rth: what do you think?


>            * This matches Cortex-A710 BROADCASTMTE input being LOW.
>            */
> -        if (cpu->tag_memory == NULL) {
> +        if (cpu->tag_memory == NULL && !cpu->kvm_mte) {
>               cpu->isar.id_aa64pfr1 =
>                   FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
>           }

If MTE is off on TGC and on KVM, then we're actually setting (deposit) MTE

field in AA64PFR1, meaning that MTE is implemented? or am I missing

something?


> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index f065756c5c..8fc8b6398f 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -922,6 +922,8 @@ struct ArchCPU {
>   
>       /* CPU has memory protection unit */
>       bool has_mpu;
> +    /* CPU has MTE enabled in KVM mode */
> +    bool kvm_mte;
>       /* PMSAv7 MPU number of supported regions */
>       uint32_t pmsav7_dregion;
>       /* PMSAv8 MPU number of supported hyp regions */
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 849e2e21b3..29865609fb 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -39,6 +39,7 @@
>   #include "hw/acpi/acpi.h"
>   #include "hw/acpi/ghes.h"
>   #include "target/arm/gtimer.h"
> +#include "migration/blocker.h"
>   
>   const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>       KVM_CAP_LAST_INFO
> @@ -119,6 +120,21 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>       if (vmfd < 0) {
>           goto err;
>       }
> +
> +    /*
> +     * MTE bits of register id_aa64pfr1 are masked if MTE is
> +     * not enabled and required to enable before VCPU
> +     * is created. Hence enable MTE(if supported) before VCPU
> +     * is created to read unmasked MTE bits.
> +     */
> +    if (kvm_arm_mte_supported()) {
> +        KVMState kvm_state;
> +
> +        kvm_state.fd = kvmfd;
> +        kvm_state.vmfd = vmfd;
> +        kvm_vm_enable_cap(&kvm_state, KVM_CAP_ARM_MTE, 0);
> +    }
> +
>       cpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
>       if (cpufd < 0) {
>           goto err;
> @@ -1793,6 +1809,11 @@ bool kvm_arm_sve_supported(void)
>       return kvm_check_extension(kvm_state, KVM_CAP_ARM_SVE);
>   }
>   
> +bool kvm_arm_mte_supported(void)
> +{
> +    return kvm_check_extension(kvm_state, KVM_CAP_ARM_MTE);
> +}
> +
>   QEMU_BUILD_BUG_ON(KVM_ARM64_SVE_VQ_MIN != 1);
>   
>   uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
> @@ -2417,3 +2438,41 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
>       }
>       return 0;
>   }
> +
> +void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
> +{
> +    static bool tried_to_enable;
> +    static bool succeeded_to_enable;
> +    Error *mte_migration_blocker = NULL;
> +    ARMCPU *cpu = ARM_CPU(cpuobj);
> +    int ret;
> +
> +    if (!tried_to_enable) {
> +        /*
> +         * MTE on KVM is enabled on a per-VM basis (and retrying doesn't make
> +         * sense), and we only want a single migration blocker as well.
> +         */
> +        tried_to_enable = true;
> +
> +        ret = kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0);
> +        if (ret) {
> +            error_setg_errno(errp, -ret, "Failed to enable KVM_CAP_ARM_MTE");
> +            return;
> +        }
> +
> +        /* TODO: Add migration support with MTE enabled */
> +        error_setg(&mte_migration_blocker,
> +                   "Live migration disabled due to MTE enabled");
> +        if (migrate_add_blocker(&mte_migration_blocker, errp)) {
> +            error_free(mte_migration_blocker);
> +            return;
> +        }
> +
> +        succeeded_to_enable = true;
> +    }
> +
> +    if (succeeded_to_enable) {
> +        cpu->kvm_mte = true;
> +    }
> +}
> +

nit: remove ending blank line here.


Cheers,

Gustavo


> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index cfaa0d9bc7..4d293618a7 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -188,6 +188,13 @@ bool kvm_arm_pmu_supported(void);
>    */
>   bool kvm_arm_sve_supported(void);
>   
> +/**
> + * kvm_arm_mte_supported:
> + *
> + * Returns: true if KVM can enable MTE, and false otherwise.
> + */
> +bool kvm_arm_mte_supported(void);
> +
>   /**
>    * kvm_arm_get_max_vm_ipa_size:
>    * @ms: Machine state handle
> @@ -214,6 +221,8 @@ void kvm_arm_pvtime_init(ARMCPU *cpu, uint64_t ipa);
>   
>   int kvm_arm_set_irq(int cpu, int irqtype, int irq, int level);
>   
> +void kvm_arm_enable_mte(Object *cpuobj, Error **errp);
> +
>   #else
>   
>   /*
> @@ -235,6 +244,11 @@ static inline bool kvm_arm_sve_supported(void)
>       return false;
>   }
>   
> +static inline bool kvm_arm_mte_supported(void)
> +{
> +    return false;
> +}
> +
>   /*
>    * These functions should never actually be called without KVM support.
>    */
> @@ -283,6 +297,11 @@ static inline uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu)
>       g_assert_not_reached();
>   }
>   
> +static inline void kvm_arm_enable_mte(Object *cpuobj, Error **errp)
> +{
> +    g_assert_not_reached();
> +}
> +
>   #endif
>   
>   #endif

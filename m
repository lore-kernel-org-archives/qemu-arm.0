Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp414764njb;
        Wed, 25 Sep 2024 08:47:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVErNbLHAbsGsV1jc/dWaTTniTsOLUozSf+SMhWhPIlxWwjS2Xzb/rc+9AiXTj1kTPnDn7/MuoU/Lk8g==@linaro.org
X-Received: by 2002:a05:600c:1e1a:b0:42c:b037:5f9d with SMTP id 5b1f17b1804b1-42e96102537mr23912955e9.3.1727279243476;
        Wed, 25 Sep 2024 08:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727279243; cv=none;
        d=google.com; s=arc-20240605;
        b=aQXwQgP+emAlpFeGxfgiWzKjVMXYeM3xAc6NvF/65+Tx/xNDqEu+Ut6r/yQY/7v1vN
         YgB9P9AFzlf85ataW7TjPmHnrOt0rXzjB40oC4obauzxA7nIBBlEV8Khwu/OTpy0arju
         tSqDvJgKKfxLOr5/G2G+AZQwlnLTHIgUJJzyoY6IhkbJGY1JqgLMYDAfdLeN4DSzTv/9
         OTCM2nhQaIsPpExwljJGKE9dI/aPUjJmlSFeTXtu9NDPU0uhB5un96hrzNPFQt+PYYzq
         gdIl0Rzn52dnsi3tKK5fY+calU8ockWCslVlYyFKJlY1vz/ehXkE26mw0S1hzgu+BYy0
         lLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Bdto+4CUkb8ydbJkf0ODC+XwBNhhfN6qWFH3Iq53Mvg=;
        fh=JlBb76pPXUV1Inyj8joQ3nnwmLvo13v5sYp992UiCx0=;
        b=UOEZ/okSL735hb8oSHSG1S3yO2a15IbKxa13Tj0XUfSDr6sdjNujWzYRpcqVUq7qir
         nTExqFoJB0vUsJChMNW068A7aWt02ZKzEb5Dri/FXYl+koNc6Xk2fpi6nPTYXcnE1f//
         sC3lorHLwEESF0hYva1o2Q3PtzsuJ1kYgJIEfVYfWNNh1+mKc/5o2dtYBe6tgSlAeTvz
         yV6Re0wjFVodVnMChJJ0aW2/WbMufsRzWxTdoFXJCLRuyggIoPA+yjxLX9fJQp6zWHFK
         rhYTUkb9VfDNPJnUdouodqvQMXoEFs4y3yLDbJwL7txw6fhdJ+U8YwfmGyzpsL1GLTog
         5wmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7nj3kIE;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42e906cb1bdsor16259885e9.10.2024.09.25.08.47.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Sep 2024 08:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7nj3kIE;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727279243; x=1727884043; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bdto+4CUkb8ydbJkf0ODC+XwBNhhfN6qWFH3Iq53Mvg=;
        b=x7nj3kIEbkK0YR3gSyN1R+ZO4glwJRbG1+T+bDf2A59Cu156nU1QwfsIvdv8DKzMgh
         EpsJ1j/lvh8gtiFj3LTkjYC34B0l5FHWXzIVCZnBbFKkD+Pn36BJphnr8++4Om3U814e
         xJIK19RrJiyfOsVDB1mpqJW+hdH3SmT6m94G3Tz4d2t13nHjxgk6PSKd8kpseWrVOy17
         +wwQjl0cqtsuc0Su4zsjTkgkCf6YcGGy+RWJWyXy81pWn7dqHdknKW+hdUcRNANC5CE1
         l/eb1DXeJYat8keqB7EtEUHLs8ZqQGh3Ni9hP6PzVWC0GLcyqvGTqQiu0FM7H6YTKY/N
         lVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279243; x=1727884043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bdto+4CUkb8ydbJkf0ODC+XwBNhhfN6qWFH3Iq53Mvg=;
        b=dVDJPvULGvYTfhCPDQki9ektkzq+vmx9yLmxMa8bxuQ1Qbqpx2RsD5d9ExoMLN9DZN
         W4Ii/Go4DIcTi3UVO9BIJjSlgx6cjjjdrB7A7gQjumTNedK1KNqEhyECF5WoLQEd2yXI
         UCaRYSskVWDI3BoZuQwDLXuIOMVVM4Tx3rwE4qPUNPFFko8wDVXyo0sHCKTIbPQ8x7yp
         X5nDh+FM08h7ZVsT16UfG1mNq6KKpWnrZoc+ImEvP1zMNx4b5AfoGON3iAQVXDJYNLz+
         ZKRmxgghyS45rcaIogyRFGgodMAUhq3ANPrasgfUMVZ8RLBnlZefgrqftm08IwHuYVOy
         NOPw==
X-Forwarded-Encrypted: i=1; AJvYcCUJMknBS6rwvmS8Mt+wJaaLNTUhgtBDcTKnLukp1iZafToyy8okp7zX+XpimJg+uNqjoyFAUmkf4tlqiQ==@linaro.org
X-Gm-Message-State: AOJu0Yzf0FdkfLWEJniLRvk4H0d7md5qkYSmISwv45IE2car1HIaEziz
	vj+ubV2WxjVGPKRquD+mFJR03CVzA49I2CGNR2RPjRq9pmyj2M6Rz/TM9IgKnQ3/HFeVDuJSUQB
	EFbPx4YZv
X-Google-Smtp-Source: AGHT+IHyTmqCYkSGgVDs3YzxTTD5sv7T4nQRF6uuOVGJbjRiE4D3HsgHHG+m6qqhh19zr6RN6dEK1Q==
X-Received: by 2002:a05:600c:1c81:b0:42c:b3e5:f68c with SMTP id 5b1f17b1804b1-42e9610235fmr21124915e9.4.1727279242529;
        Wed, 25 Sep 2024 08:47:22 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.119.120] ([195.85.229.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a56fddsm22485035e9.46.2024.09.25.08.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 08:47:21 -0700 (PDT)
Message-ID: <4b1a7f9b-4a69-4c0a-93be-4ecd27b08196@linaro.org>
Date: Wed, 25 Sep 2024 17:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] arm/kvm: add support for MTE
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, cohuck@redhat.com, darren@os.amperecomputing.com
References: <20240920073725.410373-1-gankulkarni@os.amperecomputing.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20240920073725.410373-1-gankulkarni@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: fxvcXyEK+FA6

Hi Ganapatrao,

Sorry for the delay on replying it. I was attending KVM Forum and commuting.

On 9/20/24 09:37, Ganapatrao Kulkarni wrote:
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
>
> Changes since V2:
> 	Updated with review comments.
>
> Changes since V1:
> 	Added code to enable MTE before reading register
> id_aa64pfr1 (unmasked MTE bits).
>
> This patch is boot tested on ARM64 with KVM and on X86 with TCG for mte=on
> and default case(i.e, no mte).
>
>   hw/arm/virt.c        | 72 ++++++++++++++++++++++++++------------------
>   target/arm/cpu.c     | 11 +++++--
>   target/arm/cpu.h     |  2 ++
>   target/arm/kvm.c     | 57 +++++++++++++++++++++++++++++++++++
>   target/arm/kvm_arm.h | 19 ++++++++++++
>   5 files changed, 129 insertions(+), 32 deletions(-)
>
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
> index 19191c2391..8a2fc471ce 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2390,14 +2390,21 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>   
>   #ifndef CONFIG_USER_ONLY
>           /*
> -         * If we do not have tag-memory provided by the machine,
> +         * If we do not have tag-memory provided by the TCG,
>            * reduce MTE support to instructions enabled at EL0.
>            * This matches Cortex-A710 BROADCASTMTE input being LOW.
>            */
> -        if (cpu->tag_memory == NULL) {
> +        if (tcg_enabled() && cpu->tag_memory == NULL) {
>               cpu->isar.id_aa64pfr1 =
>                   FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
>           }
> +
> +        /*
> +         * Clear MTE bits, if not enabled in KVM mode.
> +         */
> +        if (kvm_enabled() && !cpu->kvm_mte) {
> +                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
> +        }

I 've discussed a bit with Richard about the need of setting the MTE 
field here

to 0. This is already a reduction since it's inside the condition block:

if (cpu_isar_feature(aa64_mte, cpu)) { ... }, which is only taken if we 
already

have MTE field >= 1. At this point the MTE bits in cpu->isar.id_aa64pfr1 
should

already be set correctly accordingly to the host bits since 
kvm_arm_get_host_cpu_features()

was called.


The check for TCG (cpu->tag_memory == NULL) exists because even if MTE 
instructions

are supported by the CPU it's possible that the machine's memory does 
not support tags,

but we don't check for that in KVM afaics.


For KVM, isn't the cpu->isar.id_aa64pfr1 MTE bits already correct here 
so we don't need to touch them?

cpu->kvm_mte is false here only if kvm_check_extension(kvm_state, 
KVM_CAP_ARM_MTE) is true but

kvm_vm_enable_cap(kvm_state, KVM_CAP_ARM_MTE, 0) is false -- can that 
happen ever happen? _or_ when

we can't block migration? So basically we are telling to the guest that 
MTE is not supported if we have

MTE supported in the host _but_ we can't block migration?



Cheers,

Gustavo

>   #endif
>       }
>   
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
> index 849e2e21b3..af7a98517d 100644
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
> @@ -119,6 +120,20 @@ bool kvm_arm_create_scratch_host_vcpu(const uint32_t *cpus_to_try,
>       if (vmfd < 0) {
>           goto err;
>       }
> +
> +    /*
> +     * MTE capability must be enabled by the VMM before creating
> +     * any VCPUs. The MTE bits of the ID_AA64PFR1 register are masked
> +     * if MTE is not enabled, allowing them to be probed correctly.
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
> @@ -1793,6 +1808,11 @@ bool kvm_arm_sve_supported(void)
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
> @@ -2417,3 +2437,40 @@ int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
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

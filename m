Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp562902njb;
        Tue, 13 May 2025 07:31:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmLi88tt1eQnth5PYj01hEuWrHsREhn4Ds4mYzJznHKm2161B/192/QhCrqy3a1zt914UWU4gyC5ayZw==@linaro.org
X-Google-Smtp-Source: AGHT+IFpvQmfrWNOhw7/D+bh/CK1rKnQ8Ct74oCM6xRCVSi/yKfPyQVUwaJ16Dz3AGP6nrt0ZjPh
X-Received: by 2002:a05:6122:17aa:b0:528:f40f:347f with SMTP id 71dfb90a1353d-52c53b461e0mr14471577e0c.2.1747146696990;
        Tue, 13 May 2025 07:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747146696; cv=none;
        d=google.com; s=arc-20240605;
        b=EznPj0e1d0NyN47HUouIQ/XWpks2yy40CpV0n7lldw+53HRUYeZnnZEL6QBOYA4VXN
         IB2YNpMSasW6riAwI4aeLwtSxetgaZYZYVkKrgjjOs7511X2r/qKfY4RBdpSnvvJOKFu
         Yasp4YBo0piUpHP9IOfnprZOeHoIU7EtROCLr0vovNxsacKun5n9jnyF1oBCcvemL8Mw
         3mJBLMphJl2RXdwIxmD3kyONLytmamnswGmgANSGncbMlymgOlmuaFzE91ah77nuIDfm
         7rL8xJApUnwf74Zwzryk68JHXtYRicsY9Q94aXkaFpznWsOs68MV6ZJseNp5vXPUIiSR
         v8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=kJnrKexwHwdXj+CB7Gav0WgyIYENhp5GhJAlL4b2KHY=;
        fh=NDneJSz1Sd4YM5M0U4Gi7b3Rlp7+THADfYDyaRRtl54=;
        b=KowcjyZOqvuS2c3S6R4V1zDhIHPIDOqVw5/E9WqRvguE1E+6coyI8lLWEXSPIW3t77
         AqayR9h/g/hLRHnyZREKhynSQ85ha04YDTeKVm3eI9v3FjPAOf/dpvaDX7gOVy3r8Sxi
         y8AnI5VQiAC8S6Zf9/ZBdHeT9MMldAlOdOOFsBKmHBrQPTknvFk4xAqJztzGgSakhFbv
         6yMU3zp410QgT6sRPGFnY0fyXLB35dLnz+kG7K6ndMJbK98UkI5+pTSEdnCdpIyl0LUd
         Gn9aV0uXbUlHhAi6pl42F3Fo1eNQkRfpDSGxyK20GLlUql7Q/qA/YYCZ2ViNiHGfuGL6
         4BhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L5Abr2VM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-52c53ca6bf9si4324520e0c.233.2025.05.13.07.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:31:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L5Abr2VM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747146696;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJnrKexwHwdXj+CB7Gav0WgyIYENhp5GhJAlL4b2KHY=;
	b=L5Abr2VMsPgAa5cP66KieUC3l53excGIe3FQySxzXu0zic0w7K7rxxmaqC20SSrl3amXfg
	SP/jSPFLhQmK7x7jFKnBlDPsffrBTA6h0JkFhHU4SWYbHiiVpwwH5h4JhB6DrAUQ2vEDYD
	601Ew2L+l+OaXesjwhlrsT1APBn8zFE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-8Jc5l2zSPm6qyJSWKc0rxQ-1; Tue, 13 May 2025 10:31:35 -0400
X-MC-Unique: 8Jc5l2zSPm6qyJSWKc0rxQ-1
X-Mimecast-MFC-AGG-ID: 8Jc5l2zSPm6qyJSWKc0rxQ_1747146694
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-441c96c1977so37483635e9.0
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 07:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146694; x=1747751494;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJnrKexwHwdXj+CB7Gav0WgyIYENhp5GhJAlL4b2KHY=;
        b=qbW1YzfNPGQFaiCRot/CEdEG5SLwV9LDRHZrRqiNH2sFlefXsahRrNF2f6ewkAJt7v
         uotTu446WjTFbNT5Kd1zvHr/nSc4y2FfeBGWExtT9UCyNT5mHnmr0h5EAYprpwmUAePZ
         glJvaJrz6mvM2R+3ug0QVpvN69UDRooXSlOdaB6WqEbWGsEZEN2VhgLL+kA9UtC9WRkc
         12fb8DdqyELOFalVZAd+glDzaoR4nIkqXPjkK0tJ2/YzdPsw1mYOJjYAEEjk9Ku80fK6
         X9JxAAwmMI0ScR8fyLEl2nc0KZrWIc/ximSeJ8QyO0qSJdSzaGUTJxXaiPdP7+ljhwmX
         +Neg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ4CPXUtR5PMQ5H4tf6kLcoynBTLvgmEJ/n5XJNRVQFBUjLGqpiXRSdkT+jjOOGz9fu67HrfXx5lXm0Q==@linaro.org
X-Gm-Message-State: AOJu0YzN7Yd0jX2GAFyUI2NOI49qKez9axOpmGwc1K3YH3/P6TAKZPgF
	OiKGH2wmoqONA6duEEcrPWQ7wszTw3uwcK83Nsvj3yxqKHEE6zMU8MdpHOnc2mWvbbFsArJvceY
	Er+OlH9tyOX07h1N3NUxWGOB1LtoYPolJp/jWFuLjGvUZ3YHplkSfVw==
X-Gm-Gg: ASbGncvXBTc4cH3HWpeOsdKm8u/LX5Pwehnm2qWTvpm0rNze8CIXu23s5EzuwZysKGw
	Uib4QS00Dj36q9Lg6sOf/kp6HEQyQapRwhkpUbInmzpToJHSTUNLZdWhub0n7578oSlGE75VJ+M
	6+EClXfkVS904ty67R5Nqfux9812ITpi1Fu3ZXpsj5KF5zo2XdEo7c2q3YvWqZ8VSQzkjK5tmWe
	fod8yFnga17xDw0HPU28D9ZJdUnaBJ/sZqyKhyjzAUTWKvDcXigtuGHxLHcvshTnmJ/VV8E2IsI
	3Lr0q1qt/T7IoHpbtzVtjjvMy/6nLaeWjN7AgjrkOWkR+Iie40BrixmdtFQ=
X-Received: by 2002:a05:600c:8284:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-442d6dd2478mr127725745e9.20.1747146694228;
        Tue, 13 May 2025 07:31:34 -0700 (PDT)
X-Received: by 2002:a05:600c:8284:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-442d6dd2478mr127725245e9.20.1747146693778;
        Tue, 13 May 2025 07:31:33 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3aeb6esm216527915e9.25.2025.05.13.07.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 07:31:33 -0700 (PDT)
Message-ID: <a706e9a2-0a49-4296-ba0a-8001f433b8b8@redhat.com>
Date: Tue, 13 May 2025 16:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 06/10] arm/kvm: Allow reading all the writable ID
 registers
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-7-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250414163849.321857-7-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mU61gdfq5qTvofCYpYdutvAhzwWUYIV4wa64ekxbXEs_1747146694
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: fNHPDsT7yELC



On 4/14/25 6:38 PM, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> At the moment kvm_arm_get_host_cpu_features() reads a subset of the
> ID regs. As we want to introduce properties for all writable ID reg
> fields, we want more genericity and read more default host register
> values.
>
> Introduce a new get_host_cpu_idregs() helper and add a new exhaustive
> boolean parameter to kvm_arm_get_host_cpu_features() and
> kvm_arm_set_cpu_features_from_host() to select the right behavior.
> The host cpu model will keep the legacy behavior unless the writable
> id register interface is available.
>
> A writable_map IdRegMap is introduced in the CPU object. A subsequent
> patch will populate it.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-sysregs.h |  2 ++
>  target/arm/cpu.h         |  3 ++
>  target/arm/cpu64.c       |  2 +-
>  target/arm/kvm.c         | 78 ++++++++++++++++++++++++++++++++++++++--
>  target/arm/kvm_arm.h     |  9 +++--
>  target/arm/trace-events  |  1 +
>  6 files changed, 89 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
> index e89a1105904c..367fab51f19e 100644
> --- a/target/arm/cpu-sysregs.h
> +++ b/target/arm/cpu-sysregs.h
> @@ -41,6 +41,8 @@ int get_sysreg_idx(ARMSysRegs sysreg);
>  
>  #ifdef CONFIG_KVM
>  uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
> +int kvm_idx_to_idregs_idx(int kidx);
> +int idregs_idx_to_kvm_idx(ARMIDRegisterIdx idx);
>  #endif
>  
>  #endif /* ARM_CPU_SYSREGS_H */
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 775a8aebc5d3..8717c5e7695b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1088,6 +1088,9 @@ struct ArchCPU {
>       */
>      ARMIdRegsState writable_id_regs;
>  
> +    /* ID reg writable bitmask (KVM only) */
> +    IdRegMap *writable_map;
as it is KVM only we may put it in ifdef CONFIG_KVM block above
> +
>      /* QOM property to indicate we should use the back-compat CNTFRQ default */
>      bool backcompat_cntfrq;
>  
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 839442745ea4..60a709502697 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -757,7 +757,7 @@ static void aarch64_host_initfn(Object *obj)
>  {
>  #if defined(CONFIG_KVM)
>      ARMCPU *cpu = ARM_CPU(obj);
> -    kvm_arm_set_cpu_features_from_host(cpu);
> +    kvm_arm_set_cpu_features_from_host(cpu, false);
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
>          aarch64_add_pauth_properties(obj);
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 6e3cd06e9bc5..b07d5f16db50 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -41,6 +41,7 @@
>  #include "hw/acpi/ghes.h"
>  #include "target/arm/gtimer.h"
>  #include "migration/blocker.h"
> +#include "cpu-custom.h"
>  
>  const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>      KVM_CAP_INFO(DEVICE_CTRL),
> @@ -270,7 +271,73 @@ static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf, ARMIDRegisterIdx i
>      return ret;
>  }
>  
> -static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
> +int kvm_idx_to_idregs_idx(int kidx)
> +{
> +    int op1, crm, op2;
> +    ARMSysRegs sysreg;
> +
> +    op1 = kidx / 64;
> +    if (op1 == 2) {
> +        op1 = 3;
> +    }
> +    crm = (kidx % 64) / 8;
> +    op2 = kidx % 8;
> +    sysreg = ENCODE_ID_REG(3, op1, 0, crm, op2);
> +    return get_sysreg_idx(sysreg);
> +}
> +
> +int idregs_idx_to_kvm_idx(ARMIDRegisterIdx idx)
> +{
> +    ARMSysRegs sysreg = id_register_sysreg[idx];
> +
> +    return KVM_ARM_FEATURE_ID_RANGE_IDX((sysreg & CP_REG_ARM64_SYSREG_OP0_MASK) >> CP_REG_ARM64_SYSREG_OP0_SHIFT,
> +                                        (sysreg & CP_REG_ARM64_SYSREG_OP1_MASK) >> CP_REG_ARM64_SYSREG_OP1_SHIFT,
> +                                        (sysreg & CP_REG_ARM64_SYSREG_CRN_MASK) >> CP_REG_ARM64_SYSREG_CRN_SHIFT,
> +                                        (sysreg & CP_REG_ARM64_SYSREG_CRM_MASK) >> CP_REG_ARM64_SYSREG_CRM_SHIFT,
> +                                        (sysreg & CP_REG_ARM64_SYSREG_OP2_MASK) >> CP_REG_ARM64_SYSREG_OP2_SHIFT);
> +}
> +
> +
> +/*
> + * get_host_cpu_idregs: Read all the writable ID reg host values
> + *
> + * Need to be called once the writable mask has been populated
> + * Note we may want to read all the known id regs but some of them are not
> + * writable and return an error, hence the choice of reading only those which
> + * are writable. Those are also readable!
> + */
> +static int get_host_cpu_idregs(ARMCPU *cpu, int fd, ARMHostCPUFeatures *ahcf)
> +{
> +    int err = 0;
> +    int i;
> +
> +    for (i = 0; i < NUM_ID_IDX; i++) {
> +        ARM64SysReg *sysregdesc = &arm64_id_regs[i];
> +        ARMSysRegs sysreg = sysregdesc->sysreg;
> +        uint64_t writable_mask = cpu->writable_map->regs[idregs_idx_to_kvm_idx(i)];
> +        uint64_t *reg;
> +        int ret;
> +
> +        if (!writable_mask) {
> +            continue;
> +        }
> +
> +        reg = &ahcf->isar.idregs[i];
> +        ret = read_sys_reg64(fd, reg, idregs_sysreg_to_kvm_reg(sysreg));
> +        trace_get_host_cpu_idregs(sysregdesc->name, *reg);
> +        if (ret) {
> +            error_report("%s error reading value of host %s register (%m)",
> +                         __func__, sysregdesc->name);
> +
> +            err = ret;
> +        }
> +    }
> +    return err;
> +}
> +
> +static bool
> +kvm_arm_get_host_cpu_features(ARMCPU *cpu, ARMHostCPUFeatures *ahcf,
> +                              bool exhaustive)
maybe the exhaustive term shall be replaced by handle_writable_id_regs
which tells more explicitly what it does
>  {
>      /* Identify the feature bits corresponding to the host CPU, and
>       * fill out the ARMHostCPUClass fields accordingly. To do this
> @@ -398,6 +465,11 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          err |= get_host_cpu_reg(fd, ahcf, ID_DFR1_EL1_IDX);
>          err |= get_host_cpu_reg(fd, ahcf, ID_MMFR5_EL1_IDX);
>  
> +        /* Make sure writable ID reg values are read */
> +        if (exhaustive) {
> +            err |= get_host_cpu_idregs(cpu, fd, ahcf);
> +        }
> +
>          /*
>           * DBGDIDR is a bit complicated because the kernel doesn't
>           * provide an accessor for it in 64-bit mode, which is what this
> @@ -467,13 +539,13 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      return true;
>  }
>  
> -void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
> +void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu, bool exhaustive)
>  {
>      CPUARMState *env = &cpu->env;
>  
>      if (!arm_host_cpu_features.dtb_compatible) {
>          if (!kvm_enabled() ||
> -            !kvm_arm_get_host_cpu_features(&arm_host_cpu_features)) {
> +            !kvm_arm_get_host_cpu_features(cpu, &arm_host_cpu_features, exhaustive)) {
>              /* We can't report this error yet, so flag that we need to
>               * in arm_cpu_realizefn().
>               */
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 8d1f20ca8d89..90ba4f7d8987 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -141,8 +141,12 @@ uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu);
>   *
>   * Set up the ARMCPU struct fields up to match the information probed
>   * from the host CPU.
> + *
> + * @cpu: cpu object
> + * @exhaustive: if true, all the feature ID regs are queried instead of
s/queried/handled
> + *              a subset
>   */
> -void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
> +void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu, bool exhaustive);
>  
>  /**
>   * kvm_arm_add_vcpu_properties:
> @@ -257,7 +261,8 @@ static inline int kvm_arm_get_writable_id_regs(ARMCPU *cpu, IdRegMap *idregmap)
>  /*
>   * These functions should never actually be called without KVM support.
>   */
> -static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
> +static inline void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu,
> +                                                      bool exhaustive)
>  {
>      g_assert_not_reached();
>  }
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 4438dce7becc..17e52c0705f2 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -13,3 +13,4 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
>  
>  # kvm.c
>  kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
> +get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host value for %s is 0x%"PRIx64

Eric

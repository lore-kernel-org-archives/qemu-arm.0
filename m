Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2837693wrg;
        Wed, 5 Jun 2019 00:16:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLwdYnFJTupj55fAm8U6oVwzOrmOCZrIpv62HdKNEYE1mSpMumUQ8/MAGjhdDrb3lGZx4y
X-Received: by 2002:a37:7c05:: with SMTP id x5mr30410552qkc.313.1559718969535;
        Wed, 05 Jun 2019 00:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559718969; cv=none;
        d=google.com; s=arc-20160816;
        b=JgDxgeX5EKajTxd0AIsfkVJbgDpT01r3OIdoRJywOnoND+E0UQPo5STfhETNFLA+8i
         Zi0jTsxjQdAkSrMHcZ/nZf448jan1V44Em7ebcE9zOT3bvG325PdkNQDUbIz4TAEXXGP
         eH/FhP5YKbqE3lfYnqQPIc1oBEPMYUSJrvM6v1rGJDAY0uIIPFchuBu7VeXEV9FZFVWz
         GGT70vpZ5hJXJixt8wLke1p4pHtj+SmjvE+L6qiF0xXEx2nDd01hdeNJMT8jdZm1ew+G
         67zUXRefQeqSA8rp+LiNswX5n1gSgomuLR7kD1JuCjj0CW6+yG1NQHDEcRNcgs5sRjMc
         Drpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=K7M9vjSXfbqIkVNOzLNMZgWqraZeK00Osdem7O61/Vk=;
        b=kZRkjsFdBMEVBlnv1UgZ0p80F+8ZjF+KHYi96qZj97zSl/Hz5BIAeDX0/z7AFKdA2u
         Q01RD8+dX5W2QOBPHCUEJeTdpoCEX4ADGc/Dhp2sDPjUISXs1v9NiI2188zIRt/20o7D
         MC21iz64Cf0vFjnh8ChJq50bDa8NU1BiPv6uzLB05VUkDpC7DQtWU3OaEFU1RVWzQv4i
         na6wgAHxMbmKH79VW37oMo8uSKkqjfxaC30OY+GamX2GoN1V6oZeKjOJKkHyEqFu8OcA
         wlQekVSqpA841fm5oTDnhIKy7zLukQyGanCOJ8OrDUDJKWYkoH1zA8z2CRWaemDfW0Rf
         NmmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w142si99898qka.131.2019.06.05.00.16.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 00:16:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABE35308626C;
	Wed,  5 Jun 2019 07:15:54 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E10A5C5DE;
	Wed,  5 Jun 2019 07:15:51 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 04/13] target/arm/kvm: Move the get/put of
 fpsimd registers out
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 armbru@redhat.com, abologna@redhat.com, alex.bennee@linaro.org,
 Dave.Martin@arm.com
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-5-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7c0c0ef2-6ab4-fdf9-9507-d1f460bfbd51@redhat.com>
Date: Wed, 5 Jun 2019 09:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190512083624.8916-5-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 05 Jun 2019 07:15:54 +0000 (UTC)
X-TUID: DWoUb8LOjzbb

Hi Drew,

On 5/12/19 10:36 AM, Andrew Jones wrote:
> Move the getting/putting of the fpsimd registers out of
> kvm_arch_get/put_registers() into their own helper functions
> to prepare for alternatively getting/putting SVE registers.
> 
> No functional change.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm64.c | 148 +++++++++++++++++++++++++++------------------
>  1 file changed, 88 insertions(+), 60 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index ba232b27a6d3..61947f3716e1 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -706,13 +706,53 @@ int kvm_arm_cpreg_level(uint64_t regidx)
>  #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
>                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
>  
> +static int kvm_arch_put_fpsimd(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    uint32_t fpr;
> +    int i, ret;
> +
> +    for (i = 0; i < 32; i++) {
> +        uint64_t *q = aa64_vfp_qreg(env, i);
> +#ifdef HOST_WORDS_BIGENDIAN
> +        uint64_t fp_val[2] = { q[1], q[0] };
> +        reg.addr = (uintptr_t)fp_val;
> +#else
> +        reg.addr = (uintptr_t)q;
> +#endif
> +        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
> +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    reg.addr = (uintptr_t)(&fpr);
> +    fpr = vfp_get_fpsr(env);
> +    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    reg.addr = (uintptr_t)(&fpr);
I don't think you need this assignment
> +    fpr = vfp_get_fpcr(env);
> +    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
>  int kvm_arch_put_registers(CPUState *cs, int level)
>  {
>      struct kvm_one_reg reg;
> -    uint32_t fpr;
>      uint64_t val;
> -    int i;
> -    int ret;
> +    int i, ret;
>      unsigned int el;
>  
>      ARMCPU *cpu = ARM_CPU(cs);
> @@ -802,33 +842,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          }
>      }
>  
> -    /* Advanced SIMD and FP registers. */
> -    for (i = 0; i < 32; i++) {
> -        uint64_t *q = aa64_vfp_qreg(env, i);
> -#ifdef HOST_WORDS_BIGENDIAN
> -        uint64_t fp_val[2] = { q[1], q[0] };
> -        reg.addr = (uintptr_t)fp_val;
> -#else
> -        reg.addr = (uintptr_t)q;
> -#endif
> -        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
> -        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> -        if (ret) {
> -            return ret;
> -        }
> -    }
> -
> -    reg.addr = (uintptr_t)(&fpr);
> -    fpr = vfp_get_fpsr(env);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> -    if (ret) {
> -        return ret;
> -    }
> -
> -    fpr = vfp_get_fpcr(env);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +    ret = kvm_arch_put_fpsimd(cs);
>      if (ret) {
>          return ret;
>      }
> @@ -849,14 +863,54 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>      return ret;
>  }
>  
> +static int kvm_arch_get_fpsimd(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    uint32_t fpr;
> +    int i, ret;
> +
> +    for (i = 0; i < 32; i++) {
> +        uint64_t *q = aa64_vfp_qreg(env, i);
> +        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
> +        reg.addr = (uintptr_t)q;
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        } else {
> +#ifdef HOST_WORDS_BIGENDIAN
> +            uint64_t t;
> +            t = q[0], q[0] = q[1], q[1] = t;
> +#endif
> +        }
> +    }
> +
> +    reg.addr = (uintptr_t)(&fpr);
> +    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
> +    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    vfp_set_fpsr(env, fpr);
> +
> +    reg.addr = (uintptr_t)(&fpr);
same here
> +    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
> +    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    vfp_set_fpcr(env, fpr);
> +
> +    return 0;
> +}
> +
>  int kvm_arch_get_registers(CPUState *cs)
>  {
>      struct kvm_one_reg reg;
>      uint64_t val;
> -    uint32_t fpr;
>      unsigned int el;
> -    int i;
> -    int ret;
> +    int i, ret;
>  
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
> @@ -945,36 +999,10 @@ int kvm_arch_get_registers(CPUState *cs)
>          env->spsr = env->banked_spsr[i];
>      }
>  
> -    /* Advanced SIMD and FP registers */
> -    for (i = 0; i < 32; i++) {
> -        uint64_t *q = aa64_vfp_qreg(env, i);
> -        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
> -        reg.addr = (uintptr_t)q;
> -        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> -        if (ret) {
> -            return ret;
> -        } else {
> -#ifdef HOST_WORDS_BIGENDIAN
> -            uint64_t t;
> -            t = q[0], q[0] = q[1], q[1] = t;
> -#endif
> -        }
> -    }
> -
> -    reg.addr = (uintptr_t)(&fpr);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
> -    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> -    if (ret) {
> -        return ret;
> -    }
> -    vfp_set_fpsr(env, fpr);
> -
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
> -    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +    ret = kvm_arch_get_fpsimd(cs);
>      if (ret) {
>          return ret;
>      }
> -    vfp_set_fpcr(env, fpr);
>  
>      ret = kvm_get_vcpu_events(cpu);
>      if (ret) {
> 

Besides
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

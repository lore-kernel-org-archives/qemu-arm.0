Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8225082wrp;
        Tue, 1 Oct 2019 06:52:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7qz5NFqWE6nMyaaBplYCimAp6G8Z2+dqfucX7408Sp/K5CfFuJXgRXp5RfPReHvZLDaDs
X-Received: by 2002:a6b:916:: with SMTP id t22mr2441327ioi.193.1569937974576;
        Tue, 01 Oct 2019 06:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569937974; cv=none;
        d=google.com; s=arc-20160816;
        b=03v6IOWauxYB7n0UuLQKWIeZCF3LPLY4CptqJPBudWCj/A5AftMHqo5OSJiksyFUdD
         XmxqZngrzs/Dm6HeObjHzXZD2foAyhyFx7TwcFplUZ0gkxrlqbOd6msbGR/Jha/RI4za
         iiZ09ZJ50Otc9TQn8CbOYq0oZUsfdEiDwwBTdwUYQQDQRsZU95fzazE9Q563zR11AV0Y
         5LqfA0W4VHzZaKtAmNGLBk0Cgds9HKegoqdBaw+IPZwV1mKZwm6zMloHjWIVJCrEiJrB
         lYKTIJKPaesBol2ExU2oI+lTJSugQOF7TzcuD9E9xYYuyQQUrJ63UyeZnDXht9wVfpV7
         SaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=dGvYAv+4B3rVRulGQaf2C+DWB+0DvQHOJIuqQbHUfSQ=;
        b=GEmEAR3AvuXh80DB0uZarqF94kS7Cc8BcY9n77LYxKjc8CA2rYC7cx+HxdsCCq5+Zb
         bV+nR+2vVR4sS6f10k0kE+jL/37jbMvNcVP4r3eeiOaJkqQMwfodl8PovP1spnbPeqe9
         +69EXl24h9lnBGWfeIHJiM2Y4PlEa0SOJDrpqrXWCdqbeU6PR5GnNQuLE6FyDvhwuge4
         jC2lpDQ20bKjP7yR+z90JV+t3lgK6bPFKwf9jBEvx7HSxjBYh5gliaJkE1dt45wthlAe
         4LB/iqkNPuVm1HnbdJE6cR4WICJz25VZGZ04ptqFISYhOGmv4TYPtvL5WzKeo38Nj6kN
         BxEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v130si19973688iod.33.2019.10.01.06.52.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 06:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC01E18CB8FE;
	Tue,  1 Oct 2019 13:52:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8E4A1001B11;
	Tue,  1 Oct 2019 13:52:48 +0000 (UTC)
Date: Tue, 1 Oct 2019 15:52:46 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
	Dave.Martin@arm.com, eric.auger@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH v5 5/9] target/arm/kvm64: Add kvm_arch_get/put_sve
Message-ID: <20191001135246.7czev32x7w6nhulv@kamzik.brq.redhat.com>
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001125845.8793-6-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Tue, 01 Oct 2019 13:52:53 +0000 (UTC)
X-TUID: T+tg9CDFXaZ2

On Tue, Oct 01, 2019 at 02:58:41PM +0200, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> swabbing is different than it is for fpsmid because the vector format
> is a little-endian stream of words.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Hi Eric and Richard,

I dropped your tags from this patch because it changed too much.
I apologize for requiring a second look.

Thanks,
drew

> ---
>  target/arm/kvm64.c | 183 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 155 insertions(+), 28 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 28f6db57d5ee..4c0b11d105a4 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -671,11 +671,12 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
>  bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
>  {
>      /* Return true if the regidx is a register we should synchronize
> -     * via the cpreg_tuples array (ie is not a core reg we sync by
> -     * hand in kvm_arch_get/put_registers())
> +     * via the cpreg_tuples array (ie is not a core or sve reg that
> +     * we sync by hand in kvm_arch_get/put_registers())
>       */
>      switch (regidx & KVM_REG_ARM_COPROC_MASK) {
>      case KVM_REG_ARM_CORE:
> +    case KVM_REG_ARM64_SVE:
>          return false;
>      default:
>          return true;
> @@ -721,10 +722,8 @@ int kvm_arm_cpreg_level(uint64_t regidx)
>  
>  static int kvm_arch_put_fpsimd(CPUState *cs)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> +    CPUARMState *env = &ARM_CPU(cs)->env;
>      struct kvm_one_reg reg;
> -    uint32_t fpr;
>      int i, ret;
>  
>      for (i = 0; i < 32; i++) {
> @@ -742,17 +741,73 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
>          }
>      }
>  
> -    reg.addr = (uintptr_t)(&fpr);
> -    fpr = vfp_get_fpsr(env);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
> -    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> -    if (ret) {
> -        return ret;
> +    return 0;
> +}
> +
> +/*
> + * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> + * The byte at offset i from the start of the in-memory representation contains
> + * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means the
> + * lowest offsets are stored in the lowest memory addresses, then that nearly
> + * matches QEMU's representation, which is to use an array of host-endian
> + * uint64_t's, where the lower offsets are at the lower indices. To complete
> + * the translation we just need to byte swap the uint64_t's on big-endian hosts.
> + */
> +static uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
> +{
> +#ifdef HOST_WORDS_BIGENDIAN
> +    int i;
> +
> +    for (i = 0; i < nr; ++i) {
> +        dst[i] = bswap64(src[i]);
>      }
>  
> -    reg.addr = (uintptr_t)(&fpr);
> -    fpr = vfp_get_fpcr(env);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
> +    return dst;
> +#else
> +    return src;
> +#endif
> +}
> +
> +/*
> + * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
> + * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
> + * code the slice index to zero for now as it's unlikely we'll need more than
> + * one slice for quite some time.
> + */
> +static int kvm_arch_put_sve(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    uint64_t tmp[ARM_MAX_VQ * 2];
> +    uint64_t *r;
> +    struct kvm_one_reg reg;
> +    int n, ret;
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
> +        r = sve_bswap64(tmp, &env->vfp.zregs[n].d[0], cpu->sve_max_vq * 2);
> +        reg.addr = (uintptr_t)r;
> +        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
> +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
> +        r = sve_bswap64(tmp, r = &env->vfp.pregs[n].p[0],
> +                        DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
> +        reg.addr = (uintptr_t)r;
> +        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
> +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    r = sve_bswap64(tmp, &env->vfp.pregs[FFR_PRED_NUM].p[0],
> +                    DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
> +    reg.addr = (uintptr_t)r;
> +    reg.id = KVM_REG_ARM64_SVE_FFR(0);
>      ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
>      if (ret) {
>          return ret;
> @@ -765,6 +820,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>  {
>      struct kvm_one_reg reg;
>      uint64_t val;
> +    uint32_t fpr;
>      int i, ret;
>      unsigned int el;
>  
> @@ -855,7 +911,27 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          }
>      }
>  
> -    ret = kvm_arch_put_fpsimd(cs);
> +    if (cpu_isar_feature(aa64_sve, cpu)) {
> +        ret = kvm_arch_put_sve(cs);
> +    } else {
> +        ret = kvm_arch_put_fpsimd(cs);
> +    }
> +    if (ret) {
> +        return ret;
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
> +    fpr = vfp_get_fpcr(env);
> +    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
> +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
>      if (ret) {
>          return ret;
>      }
> @@ -878,10 +954,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>  
>  static int kvm_arch_get_fpsimd(CPUState *cs)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> +    CPUARMState *env = &ARM_CPU(cs)->env;
>      struct kvm_one_reg reg;
> -    uint32_t fpr;
>      int i, ret;
>  
>      for (i = 0; i < 32; i++) {
> @@ -899,21 +973,53 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
>          }
>      }
>  
> -    reg.addr = (uintptr_t)(&fpr);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
> -    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> -    if (ret) {
> -        return ret;
> +    return 0;
> +}
> +
> +/*
> + * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
> + * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
> + * code the slice index to zero for now as it's unlikely we'll need more than
> + * one slice for quite some time.
> + */
> +static int kvm_arch_get_sve(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    uint64_t *r;
> +    int n, ret;
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
> +        r = &env->vfp.zregs[n].d[0];
> +        reg.addr = (uintptr_t)r;
> +        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +        sve_bswap64(r, r, cpu->sve_max_vq * 2);
>      }
> -    vfp_set_fpsr(env, fpr);
>  
> -    reg.addr = (uintptr_t)(&fpr);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
> +        r = &env->vfp.pregs[n].p[0];
> +        reg.addr = (uintptr_t)r;
> +        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +        sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
> +    }
> +
> +    r = &env->vfp.pregs[FFR_PRED_NUM].p[0];
> +    reg.addr = (uintptr_t)r;
> +    reg.id = KVM_REG_ARM64_SVE_FFR(0);
>      ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
>      if (ret) {
>          return ret;
>      }
> -    vfp_set_fpcr(env, fpr);
> +    sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
>  
>      return 0;
>  }
> @@ -923,6 +1029,7 @@ int kvm_arch_get_registers(CPUState *cs)
>      struct kvm_one_reg reg;
>      uint64_t val;
>      unsigned int el;
> +    uint32_t fpr;
>      int i, ret;
>  
>      ARMCPU *cpu = ARM_CPU(cs);
> @@ -1012,10 +1119,30 @@ int kvm_arch_get_registers(CPUState *cs)
>          env->spsr = env->banked_spsr[i];
>      }
>  
> -    ret = kvm_arch_get_fpsimd(cs);
> +    if (cpu_isar_feature(aa64_sve, cpu)) {
> +        ret = kvm_arch_get_sve(cs);
> +    } else {
> +        ret = kvm_arch_get_fpsimd(cs);
> +    }
> +    if (ret) {
> +        return ret;
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
> +    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
> +    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
>      if (ret) {
>          return ret;
>      }
> +    vfp_set_fpcr(env, fpr);
>  
>      ret = kvm_get_vcpu_events(cpu);
>      if (ret) {
> -- 
> 2.20.1
> 

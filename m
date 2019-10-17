Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1200295wrm;
        Thu, 17 Oct 2019 09:43:45 -0700 (PDT)
X-Received: by 2002:a37:4d81:: with SMTP id a123mr4163270qkb.486.1571330625091;
        Thu, 17 Oct 2019 09:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571330625; cv=none;
        d=google.com; s=arc-20160816;
        b=F5zX3H3qkaWTbeX2eGZu7w8G3N1ol67yhWJBT82uQO3b1CICwG3pXzCJw+c6E9TJv1
         IxabDL6eZo8S5RS53Ozig1Jj9+beJoXW6tWQ7x5FVl7anZPXAHfQJGrACojMF/Sek3HW
         4Sr9Ss5heMQIfPFRVrwtuQP5CVeTY2YSjUkjDLBHP8ozEYVupcJxPswDPCifvEKmLl1F
         Wq3NF0q6+B5SThpRWm85eLSG7Z8BOfwOBdYNa1dX0L/gXOXSviyeuOHVwxNz+OpL40AA
         MranpsgO1AQZD1sIqCORmO2TwV8QhSIOq1LMuTMTZ99tn7xOlHmDWyaftoKCE9Q9aypg
         uqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=f9WdxtYPXe3N6CGzF+mqfEtRreH6S0emXJdS3OnAjJ8=;
        b=goUtDuhdKodgAV18q3ozKDF8C62K2BjDahglvwbeWF9QxZOwGX8M3QmFXTKobFdvm4
         Sl/jCuZS5SXgZjg/pUMGfBuoSvK3mTPtBABw3OCqbGhL6O8oTnZNfNoIGHjwaiHzAktG
         q/nAxGJPiOQKp3UzXOFB8EmTnz/RNVoYxoYwsXjW8670sSOSvoM3xLKnkoEe0TJ0hU/o
         BZ14UcrLpxWVvdX6eQKrMKDwDmCLtd+FgAmDhZgH2EaLVROtDQn3gIZafk2FVlNyyqOA
         DsAgACJ464YOdDb8JbTtnaJQmE3xvC6yq7W8QNTcTc/AOTr4juntS/Fme29H0h3Ene4n
         33Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IyrYFVG9;
       spf=pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=msys.mizuma@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <msys.mizuma@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l62sor3488747qtd.41.2019.10.17.09.43.44
        (Google Transport Security);
        Thu, 17 Oct 2019 09:43:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=IyrYFVG9;
       spf=pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=msys.mizuma@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f9WdxtYPXe3N6CGzF+mqfEtRreH6S0emXJdS3OnAjJ8=;
        b=IyrYFVG9CerazNG4ah4dCWnzyMUhQftCN5CdqQK+xDvLZfS3VagJMHA9zu6tT95n7a
         ngC62Ma/BO+qVQLegcOYObKvSIf0rl3C1HD+II9ZN4o4z4WfUr/cVRVyrL5apTrH75eD
         rCeD0RoZHP19mVyQ/ltAwtrkqoJPRcgQGoWKsVNGHx3JeOiMctSTocE0Dj+ekiXzwAH4
         Lt/Cj1JqoLRrq7XXwLOLHjT0Bf+Gr9XDQOqarsWrZ6Xk7eLIKAlfC5lKWi4PZqv9+60Q
         EVv4omgcRtszNb3KAR5KuqWjAvLY3gMpfp898RElKcxgmLB+JEBB/s6AB1W+JjiVUTO1
         /VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f9WdxtYPXe3N6CGzF+mqfEtRreH6S0emXJdS3OnAjJ8=;
        b=Yyubz4LLsFIfweAh2FxuMYXM59QSMBsiUUUbKO7qUFBSb4BZsa4X5lurmRw4LVO1tG
         hkCdGjEsLZqKn7J7MIPP9lZ3ZsFcUYBwSPsYuBcfQIfipoOZnCwQQhLDyQoIVrLxK2Or
         vDoiLmAXcjSipJ4uYkKMAymY7C+ieHlNAaEYOvvmasXwp84myJBduEWACg+hhG3Zw2by
         +2K79jZu/9Zhz0EBvOAfqy6rBOegvTpRLkrNZjH7d7bn4rIQHCPE29Rt/DE55mp7mTN9
         fy2XvANH9+Q+bGREamUvjUMZ2khyUfBCt2W0zmEI5TVHOYULVqzQQF1QOGuaryFofCHU
         rMig==
X-Gm-Message-State: APjAAAU3JkIw0AywLBo4NU60sBM/eAwFhDVJjApwn946jOYMptEB9f+g
	2uqMzvaN9vY/8L6q3mD3bnUZD8o=
X-Google-Smtp-Source: APXvYqxrmDMtN6WdBhKTB7oLzU0N6JOY5GZKNS3gysKhXBmdzIzCehlM+mpu/Z3r5/r/wUU19GjD6A==
X-Received: by 2002:aed:3641:: with SMTP id e59mr4936888qtb.115.1571330624576;
        Thu, 17 Oct 2019 09:43:44 -0700 (PDT)
Return-Path: <msys.mizuma@gmail.com>
Received: from gabell (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id c23sm547148qte.66.2019.10.17.09.43.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 09:43:44 -0700 (PDT)
Date: Thu, 17 Oct 2019 12:43:41 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	eric.auger@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org,
	Dave.Martin@arm.com
Subject: Re: [PATCH v6 5/9] target/arm/kvm64: Add kvm_arch_get/put_sve
Message-ID: <20191017164340.izip2kbax7gaoa76@gabell>
References: <20191016085408.24360-1-drjones@redhat.com>
 <20191016085408.24360-6-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016085408.24360-6-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-TUID: 37oLluoj2t+B

On Wed, Oct 16, 2019 at 10:54:04AM +0200, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> swabbing is different than it is for fpsmid because the vector format
> is a little-endian stream of words.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

This patch works well on aarch64 with SVE machine, thanks!
Please feel free to add:

    Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

- Masa

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
> +    }
> +
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
>      }
>  
> -    reg.addr = (uintptr_t)(&fpr);
> -    fpr = vfp_get_fpcr(env);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
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
> +    }
> +
> +    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
> +        r = &env->vfp.pregs[n].p[0];
> +        reg.addr = (uintptr_t)r;
> +        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +        sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
>      }
> -    vfp_set_fpsr(env, fpr);
>  
> -    reg.addr = (uintptr_t)(&fpr);
> -    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
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
> 2.21.0
> 
> 

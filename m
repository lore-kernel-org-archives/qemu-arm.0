Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp931375wru;
        Wed, 26 Jun 2019 23:56:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyeIIvrjWrCFs75P6xZ5dHLpNaTeqNrgL+wR2jh3sVfkPXyoRp1LdiApIfBodW/2wbF6DiY
X-Received: by 2002:a37:7083:: with SMTP id l125mr1813409qkc.71.1561618598679;
        Wed, 26 Jun 2019 23:56:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561618598; cv=none;
        d=google.com; s=arc-20160816;
        b=AxadtAHwXp+zxEcn1K+3Fj+rIV9afN53LM69LPgpo+f2HSCQ5f9TwucIIgFOcK3jNG
         NRi7Eo9x5Ntr1zQGtA7tY+DDSshOu35afFAciIWLJFAldvAp6O8d5r2MuOfD6V2MWH9Z
         KFHrlmeT0cpT7dRUe2t6ybKT0rcO8xlv8kI10P+0BcxgRcrXHdEi3jkM55D2ViMPNNcq
         Yy+wW/3BeVWkanHfQOOpVAc/30zQbAyhfYSErBh0MHnwTUMStgwsdrH8dtzoqetE4Vjz
         ng6NwNyqHvIS6Z00Q+rmqcGKlh8oG75c3P5I3Ss5QwWRYzaZw0Wh2AHZcqJBlBqSgV6t
         /PzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=5Y/BHYrLMY/UolIbxtwV/7IWRMU1Dz3MgE3Fge4vyxQ=;
        b=LIbdsUd/89dFwetlDebNGL0aSS321L325q6r9U8dbTADD+xaxm6bg0GXUtfbXlNMzx
         IRuMAm7JjiSA3Mf51TujcbK5O8yd4pStK7knHl6fDEyywbJP126/VTNZUp535lqdsfsD
         fGGFTkNjJQ2bGzXgoBe0v5VXDTyonWXT5KFfCDgVL9M+2vNvZdLaoASkQRXu7mSI5ARB
         qhujtkfbjYgJ2pp6+0p93TJ5SDb6qQ1K44qiQQaJ/eVpFhfhk+S3oj8OyXOHeHSNv/rX
         zvZV8X1/oQqEY8CvoxyekNpPo/7gDZGe79pgH+HkAslMlxrSk56712ccSvSQcUWXk8ZP
         phuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id o187si1019217qke.37.2019.06.26.23.56.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 23:56:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9089130C1AFC;
	Thu, 27 Jun 2019 06:56:31 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A5A85D9C6;
	Thu, 27 Jun 2019 06:56:23 +0000 (UTC)
Subject: Re: [PATCH v2 10/14] target/arm/kvm64: Add kvm_arch_get/put_sve
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0f1dfdc8-b786-d76e-1e5b-adf39a760ddb@redhat.com>
Date: Thu, 27 Jun 2019 08:56:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-11-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Thu, 27 Jun 2019 06:56:32 +0000 (UTC)
X-TUID: eWRyr9vDlIxX

Hi,

On 6/21/19 6:34 PM, Andrew Jones wrote:
> These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> swabbing is different than it is for fpsmid because the vector format
> is a little-endian stream of words.

some cosmetic changes besides Richard's comments
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/kvm64.c | 135 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 131 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index a2485d447e6a..706541327491 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -673,11 +673,12 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
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
> @@ -763,6 +764,70 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
>      return 0;
>  }
>  
> +/*
> + * If ARM_MAX_VQ is increased to be greater than 16, then we can no
> + * longer hard code slices to 1 in kvm_arch_put/get_sve().
> + */
> +QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
if the code is ready to support slices, I guess you could have a define
and compute the slice number from ARM_MAX_VQ?
> +
> +static int kvm_arch_put_sve(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    int slices = 1;
> +    int i, n, ret;
> +
> +    for (i = 0; i < slices; i++) {
> +        for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> +            uint64_t *q = aa64_vfp_qreg(env, n);
> +#ifdef HOST_WORDS_BIGENDIAN
> +            uint64_t d[ARM_MAX_VQ * 2];
> +            int j;
line to be added
> +            for (j = 0; j < cpu->sve_max_vq * 2; j++) {
> +                d[j] = bswap64(q[j]);
> +            }
> +            reg.addr = (uintptr_t)d;
> +#else
> +            reg.addr = (uintptr_t)q;
> +#endif
> +            reg.id = KVM_REG_ARM64_SVE_ZREG(n, i);
> +            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +        }
> +
> +        for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
> +            uint64_t *q = &env->vfp.pregs[n].p[0];
> +#ifdef HOST_WORDS_BIGENDIAN
> +            uint64_t d[ARM_MAX_VQ * 2 / 8];
> +            int j;
line
> +            for (j = 0; j < cpu->sve_max_vq * 2 / 8; j++) {
> +                d[j] = bswap64(q[j]);
> +            }
> +            reg.addr = (uintptr_t)d;
> +#else
> +            reg.addr = (uintptr_t)q;
> +#endif
> +            reg.id = KVM_REG_ARM64_SVE_PREG(n, i);
> +            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +            if (ret) {
> +                return ret;
> +            }
> +        }
> +
> +        reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
> +        reg.id = KVM_REG_ARM64_SVE_FFR(i);
> +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  int kvm_arch_put_registers(CPUState *cs, int level)
>  {
>      struct kvm_one_reg reg;
> @@ -857,7 +922,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>          }
>      }
>  
> -    ret = kvm_arch_put_fpsimd(cs);
> +    if (!cpu->sve_max_vq) {
> +        ret = kvm_arch_put_fpsimd(cs);
> +    } else {
> +        ret = kvm_arch_put_sve(cs);
> +    }
>      if (ret) {
>          return ret;
>      }
> @@ -920,6 +989,60 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
>      return 0;
>  }
>  
> +static int kvm_arch_get_sve(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    struct kvm_one_reg reg;
> +    int slices = 1;
> +    int i, n, ret;
> +
> +    for (i = 0; i < slices; i++) {
> +        for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> +            uint64_t *q = aa64_vfp_qreg(env, n);
extra line needed
> +            reg.id = KVM_REG_ARM64_SVE_ZREG(n, i);
> +            reg.addr = (uintptr_t)q;
> +            ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +            if (ret) {
> +                return ret;
> +            } else {> +#ifdef HOST_WORDS_BIGENDIAN
> +                int j;
line
> +                for (j = 0; j < cpu->sve_max_vq * 2; j++) {
> +                    q[j] = bswap64(q[j]);
> +                }
> +#endif
> +            }
> +        }
> +
> +        for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
> +            uint64_t *q = &env->vfp.pregs[n].p[0];
extra line needed
> +            reg.id = KVM_REG_ARM64_SVE_PREG(n, i);
> +            reg.addr = (uintptr_t)q;
> +            ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +            if (ret) {
> +                return ret;
> +            } else {> +#ifdef HOST_WORDS_BIGENDIAN
> +                int j;
line
> +                for (j = 0; j < cpu->sve_max_vq * 2 / 8; j++) {
> +                    q[j] = bswap64(q[j]);
> +                }
> +#endif
> +            }
> +        }
> +
> +        reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
> +        reg.id = KVM_REG_ARM64_SVE_FFR(i);
> +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  int kvm_arch_get_registers(CPUState *cs)
>  {
>      struct kvm_one_reg reg;
> @@ -1014,7 +1137,11 @@ int kvm_arch_get_registers(CPUState *cs)
>          env->spsr = env->banked_spsr[i];
>      }
>  
> -    ret = kvm_arch_get_fpsimd(cs);
> +    if (!cpu->sve_max_vq) {
> +        ret = kvm_arch_get_fpsimd(cs);
> +    } else {
> +        ret = kvm_arch_get_sve(cs);
> +    }
>      if (ret) {
>          return ret;
>      }
> 


Thanks

Eric


Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1145997wru;
        Thu, 27 Jun 2019 03:59:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQ6XCT5VZkuGHgoYKQBP83HkCxjWUCqcfSa9UhzeQofeuKP31bBIlI2WAmXJl3azVMkjk2
X-Received: by 2002:a37:98c3:: with SMTP id a186mr2738315qke.498.1561633174159;
        Thu, 27 Jun 2019 03:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561633174; cv=none;
        d=google.com; s=arc-20160816;
        b=BJW7TXfdbzp/Voitt0M0MXap10D7BHBYBE7WCdKJs3L1xU7gHpNrktLLbxCnTovAX5
         +e429unHAkxXw4ucm5KqwcKSvaIIGQT9Ttji012sHRLgSRMZevv+6poATZxrjkW1fF5x
         aASsA9pIf4xAoS9saAxZ7SXTJw3Zphzg9jCcMYfJm/9ZK6z7WbKGVTLYF/aeHIaagNv0
         afVgYqr5kCUC9gXFegNgEhzc6fzNCYfjPQyr/VDolXJZ/OIrBfcASl6c8BGNmhwzJ7dE
         vibqRBT3oxeaLPwSzrHuVTLS7rGyv7cG5EJvmmRhytd3XU/PX1rSkFPn+W6lZAGQmqv0
         qv5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=fma4XOMJJTmia1JL/+bPVnoK1/SnmoKmabgi3OdPDjo=;
        b=PrcVLUGDETvF8ZItfTMbzuw95Rs3IOXy4+65EG+z6kciyqWIAKalUDn709FnKG9Dqb
         A5/8rM9bbv26CotRQVuD4d5kL/h4bMdYqXSJvfqeLQd54nt3Dwd8+9Qme4wCouEfFgdn
         nhL248edgTjGZ/GELmoDsM8Xig+BE7C5AhuHHCpf3kXALahIl9qZHW0EU+y8rGlPSKo7
         Gzk7zgNW/riKZ19WB0AwWG+O5lTFHwTpg03acGgBpgxt3k60bYUAO4gb58SUdv/3bO67
         HyHDrHtECIK6CGqaBg7MNFADqta4LB1xnTi+CdWxzu9g/mFmuedOa8g9PtCMJLvWZH2b
         g4Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l63si1384174qkf.346.2019.06.27.03.59.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 03:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4985018DF7C;
	Thu, 27 Jun 2019 10:59:28 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 703585D9E2;
	Thu, 27 Jun 2019 10:59:21 +0000 (UTC)
Date: Thu, 27 Jun 2019 12:59:19 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 10/14] target/arm/kvm64: Add
 kvm_arch_get/put_sve
Message-ID: <20190627105919.wop6h6b4cupcnar2@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
 <0f1dfdc8-b786-d76e-1e5b-adf39a760ddb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f1dfdc8-b786-d76e-1e5b-adf39a760ddb@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 27 Jun 2019 10:59:33 +0000 (UTC)
X-TUID: JNjBzT/v0pLq

On Thu, Jun 27, 2019 at 08:56:21AM +0200, Auger Eric wrote:
> Hi,
> 
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> > swabbing is different than it is for fpsmid because the vector format
> > is a little-endian stream of words.
> 
> some cosmetic changes besides Richard's comments
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/kvm64.c | 135 +++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 131 insertions(+), 4 deletions(-)
> > 
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index a2485d447e6a..706541327491 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -673,11 +673,12 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
> >  bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
> >  {
> >      /* Return true if the regidx is a register we should synchronize
> > -     * via the cpreg_tuples array (ie is not a core reg we sync by
> > -     * hand in kvm_arch_get/put_registers())
> > +     * via the cpreg_tuples array (ie is not a core or sve reg that
> > +     * we sync by hand in kvm_arch_get/put_registers())
> >       */
> >      switch (regidx & KVM_REG_ARM_COPROC_MASK) {
> >      case KVM_REG_ARM_CORE:
> > +    case KVM_REG_ARM64_SVE:
> >          return false;
> >      default:
> >          return true;
> > @@ -763,6 +764,70 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
> >      return 0;
> >  }
> >  
> > +/*
> > + * If ARM_MAX_VQ is increased to be greater than 16, then we can no
> > + * longer hard code slices to 1 in kvm_arch_put/get_sve().
> > + */
> > +QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> if the code is ready to support slices, I guess you could have a define
> and compute the slice number from ARM_MAX_VQ?

Yeah, that should be do-able. Thanks for the suggestion.

> > +
> > +static int kvm_arch_put_sve(CPUState *cs)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +    CPUARMState *env = &cpu->env;
> > +    struct kvm_one_reg reg;
> > +    int slices = 1;
> > +    int i, n, ret;
> > +
> > +    for (i = 0; i < slices; i++) {
> > +        for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> > +            uint64_t *q = aa64_vfp_qreg(env, n);
> > +#ifdef HOST_WORDS_BIGENDIAN
> > +            uint64_t d[ARM_MAX_VQ * 2];
> > +            int j;
> line to be added
> > +            for (j = 0; j < cpu->sve_max_vq * 2; j++) {
> > +                d[j] = bswap64(q[j]);
> > +            }
> > +            reg.addr = (uintptr_t)d;
> > +#else
> > +            reg.addr = (uintptr_t)q;
> > +#endif
> > +            reg.id = KVM_REG_ARM64_SVE_ZREG(n, i);
> > +            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> > +            if (ret) {
> > +                return ret;
> > +            }
> > +        }
> > +
> > +        for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
> > +            uint64_t *q = &env->vfp.pregs[n].p[0];
> > +#ifdef HOST_WORDS_BIGENDIAN
> > +            uint64_t d[ARM_MAX_VQ * 2 / 8];
> > +            int j;
> line
> > +            for (j = 0; j < cpu->sve_max_vq * 2 / 8; j++) {
> > +                d[j] = bswap64(q[j]);
> > +            }
> > +            reg.addr = (uintptr_t)d;
> > +#else
> > +            reg.addr = (uintptr_t)q;
> > +#endif
> > +            reg.id = KVM_REG_ARM64_SVE_PREG(n, i);
> > +            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> > +            if (ret) {
> > +                return ret;
> > +            }
> > +        }
> > +
> > +        reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
> > +        reg.id = KVM_REG_ARM64_SVE_FFR(i);
> > +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  int kvm_arch_put_registers(CPUState *cs, int level)
> >  {
> >      struct kvm_one_reg reg;
> > @@ -857,7 +922,11 @@ int kvm_arch_put_registers(CPUState *cs, int level)
> >          }
> >      }
> >  
> > -    ret = kvm_arch_put_fpsimd(cs);
> > +    if (!cpu->sve_max_vq) {
> > +        ret = kvm_arch_put_fpsimd(cs);
> > +    } else {
> > +        ret = kvm_arch_put_sve(cs);
> > +    }
> >      if (ret) {
> >          return ret;
> >      }
> > @@ -920,6 +989,60 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
> >      return 0;
> >  }
> >  
> > +static int kvm_arch_get_sve(CPUState *cs)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +    CPUARMState *env = &cpu->env;
> > +    struct kvm_one_reg reg;
> > +    int slices = 1;
> > +    int i, n, ret;
> > +
> > +    for (i = 0; i < slices; i++) {
> > +        for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> > +            uint64_t *q = aa64_vfp_qreg(env, n);
> extra line needed
> > +            reg.id = KVM_REG_ARM64_SVE_ZREG(n, i);
> > +            reg.addr = (uintptr_t)q;
> > +            ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> > +            if (ret) {
> > +                return ret;
> > +            } else {> +#ifdef HOST_WORDS_BIGENDIAN
> > +                int j;
> line
> > +                for (j = 0; j < cpu->sve_max_vq * 2; j++) {
> > +                    q[j] = bswap64(q[j]);
> > +                }
> > +#endif
> > +            }
> > +        }
> > +
> > +        for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
> > +            uint64_t *q = &env->vfp.pregs[n].p[0];
> extra line needed
> > +            reg.id = KVM_REG_ARM64_SVE_PREG(n, i);
> > +            reg.addr = (uintptr_t)q;
> > +            ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> > +            if (ret) {
> > +                return ret;
> > +            } else {> +#ifdef HOST_WORDS_BIGENDIAN
> > +                int j;
> line
> > +                for (j = 0; j < cpu->sve_max_vq * 2 / 8; j++) {
> > +                    q[j] = bswap64(q[j]);
> > +                }
> > +#endif
> > +            }
> > +        }
> > +
> > +        reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
> > +        reg.id = KVM_REG_ARM64_SVE_FFR(i);
> > +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >  int kvm_arch_get_registers(CPUState *cs)
> >  {
> >      struct kvm_one_reg reg;
> > @@ -1014,7 +1137,11 @@ int kvm_arch_get_registers(CPUState *cs)
> >          env->spsr = env->banked_spsr[i];
> >      }
> >  
> > -    ret = kvm_arch_get_fpsimd(cs);
> > +    if (!cpu->sve_max_vq) {
> > +        ret = kvm_arch_get_fpsimd(cs);
> > +    } else {
> > +        ret = kvm_arch_get_sve(cs);
> > +    }
> >      if (ret) {
> >          return ret;
> >      }
> > 
> 
>

I'll see if I can clean/improve this patch with yours and Richard's
suggestions.

Thanks,
drew

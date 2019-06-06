Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4222385wrg;
        Thu, 6 Jun 2019 01:53:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxW+hgekY8XGUAyeccN0LwDLYxqQcSlfKlrhuNYg1fUQ8G9w2RFBRhuRUOuSIFbyxaJ7kbf
X-Received: by 2002:ac8:373b:: with SMTP id o56mr40629314qtb.133.1559811219001;
        Thu, 06 Jun 2019 01:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559811218; cv=none;
        d=google.com; s=arc-20160816;
        b=snu/exBsCMzPwBGft/K56ahr+/TBUN71VS26o/h8u/ORAbHuRRoXhMF4KdByLB8Cbp
         wkr3CqpoJpwn5Tke957cYrq6+2Nbdn5VyVEs7ybQsFNXWf6blbT+6QD6nloBreH73Qwc
         nYuF1o3iyixsArZZjXpeBKoEKZkkxbTNAqPeR15VCjHKmUjG94pQAgbbgLD9z38cA+EO
         JstXuI8mGog0La4OePZGeG6d43/CkflCi6tL8sPaQP2rpEZ8hSZKisLChX/z7Mpkpk2E
         RnSHRW9Je9nva2sfF3F3pdx4vRwyDgnK7J5G3kY6VTPZqa5gO9vRoN7pBnUCYW8F/AAs
         NTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=3WIFR7rBj/vEliiLavL+I3e+T4c1ik9j20bab2w5HK8=;
        b=hyf9RhNPnkikQSVetENREwr9wgLUJXaTJoPpyzrAN9UDdYOBJMVUsO6Q006ttYPEoB
         nkn3nV+iVV7dyylD1ksgr9vcSQGi1hBA4kmDe/SEOvDO9+wNUT4VCXXR1PKYazeXSFwl
         GVMKibvHOm9MOVFiCAFH9nsO/Qy5mYLLyOE8yGIer5fWgEqZG23Y7jv1Y+GBOzA/HirA
         J/RILRtTLzBWP2d43JzsmDDVKwBveUC3svB+W8gcbh+AfY1phrdS16+nJ74KNQ/pGyMv
         UQ40vCGpJoyhBFF4e/7grImHlSvXpDsgw/idVwu+6QHFJsTf1pfoBOWJNUGT0VWkMIMU
         mSaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f14si1221784qve.89.2019.06.06.01.53.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 01:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F88B882FD;
	Thu,  6 Jun 2019 08:53:28 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9B0954719;
	Thu,  6 Jun 2019 08:53:24 +0000 (UTC)
Date: Thu, 6 Jun 2019 10:53:22 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	abologna@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 07/13] target/arm/kvm: max cpu: Allow sve
 max vector length setting
Message-ID: <20190606085322.5253hsh6xjqonunz@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-8-drjones@redhat.com>
 <839be91f-6764-28b1-c0fb-304477bfadf8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <839be91f-6764-28b1-c0fb-304477bfadf8@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 06 Jun 2019 08:53:36 +0000 (UTC)
X-TUID: hzKWIkLBhBrJ

On Thu, Jun 06, 2019 at 10:30:00AM +0200, Auger Eric wrote:
> Hi Drew,
> On 5/12/19 10:36 AM, Andrew Jones wrote:
> > Allow the cpu type 'max' sve-max-vq property to work with kvm
> > too. If the property is not specified then the maximum kvm
> > supports is used. If it is specified we check that kvm supports
> > that exact length or error out if it doesn't.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/cpu.h   |  4 +++
> >  target/arm/cpu64.c |  7 ++--
> >  target/arm/kvm64.c | 80 ++++++++++++++++++++++++++++++++++++++++++++--
> >  3 files changed, 86 insertions(+), 5 deletions(-)
> > 
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 733b840a7127..8292d547e8f9 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -3122,6 +3122,10 @@ static inline uint64_t arm_sctlr(CPUARMState *env, int el)
> >      }
> >  }
> >  
> > +static inline int arm_cpu_fls64(uint64_t v)
> > +{
> > +    return !v ? 0 : 64 - clz64(v);
> > +}
> >  
> >  /* Return true if the processor is in big-endian mode. */
> >  static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 6c19ef6837d5..3756e7e2a3e5 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -292,7 +292,7 @@ static void aarch64_max_initfn(Object *obj)
> >  
> >      if (kvm_enabled()) {
> >          kvm_arm_set_cpu_features_from_host(cpu);
> > -        cpu->sve_max_vq = ARM_MAX_VQ;
> > +        cpu->sve_max_vq = -1; /* set in kvm_arch_init_vcpu() */
> >      } else {
> >          uint64_t t;
> >          uint32_t u;
> > @@ -374,9 +374,10 @@ static void aarch64_max_initfn(Object *obj)
> >  #endif
> >  
> >          cpu->sve_max_vq = ARM_MAX_VQ;
> > -        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
> > -                            cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
> >      }
> > +
> > +    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
> > +                        cpu_max_set_sve_vq, NULL, NULL, &error_fatal);>  }
> >  
> >  struct ARMCPUInfo {
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index c2d92df75353..0c666e405357 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -446,6 +446,59 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
> >      }
> >  }
> >  
> > +static int kvm_arm_get_sve_vls(CPUState *cs, uint64_t sve_vls[])
> > +{
> > +    struct kvm_one_reg reg = {
> > +        .id = KVM_REG_ARM64_SVE_VLS,
> > +        .addr = (uint64_t)&sve_vls[0],
> > +    };
> > +    int i, ret;
> > +
> > +    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    ret = 0;
> is it mandated?

Yes, this can be removed, as we know ret=0 here.

> > +    for (i = KVM_ARM64_SVE_VLS_WORDS - 1; i >= 0; --i) {
> > +        if (sve_vls[i]) {
> > +            ret = arm_cpu_fls64(sve_vls[i]) + i * 64;
> > +            break;
> > +        }
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static int kvm_arm_set_sve_vls(CPUState *cs, uint64_t sve_vls[], int max_vq)
> > +{
> > +    struct kvm_one_reg reg = {
> > +        .id = KVM_REG_ARM64_SVE_VLS,
> > +        .addr = (uint64_t)&sve_vls[0],
> > +    };
> > +    int i;
> > +
> > +    for (i = KVM_ARM64_SVE_VLS_WORDS - 1; i >= 0; --i) {
> > +        if (sve_vls[i]) {
> > +            int vq = arm_cpu_fls64(sve_vls[i]) + i * 64;
> nit: add a line
> > +            while (vq > max_vq) {
> > +                sve_vls[i] &= ~BIT_MASK(vq - 1);
> Isn't BIT_MASK for 32b. MAKE_64BIT_MASK?

We should just need a 'UL', not a 'ULL'. I think I'll change all
my BIT_MASK() usage to just BIT() for v2 though, even though
there doesn't appear to be a difference for the cases I've used
it.

> > +                vq = arm_cpu_fls64(sve_vls[i]) + i * 64;
> > +            }
> > +            if (vq < max_vq) {
> I don't really get this check: having vq less than max_vq does not seems
> weird. Do you absolutely want vq=max_vq?

In this context 'vq' is the max vq KVM supports and max_vq is the maximum
the user requested. So if the user wants a maximum greater than what is
possible, then that's an error.

> > +                error_report("sve-max-vq=%d is not a valid length", max_vq);
> > +                error_printf("next lowest is %d\n", vq);
> why mixing error_report/printf?

This is how we're supposed to do two line error messages, afaik.

> > +                return -EINVAL;
> > +            }
> > +            if (vq == max_vq) {
> > +                break;
> > +            }
> > +        }
> > +    }
> > +
> > +    return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> > +}
> > +
> >  static inline void set_feature(uint64_t *features, int feature)
> >  {
> >      *features |= 1ULL << feature;
> > @@ -605,7 +658,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >  
> >      if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
> >          !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
> > -        fprintf(stderr, "KVM is not supported for this guest CPU type\n");
> > +        error_report("KVM is not supported for this guest CPU type");
> >          return -EINVAL;
> >      }
> >  
> > @@ -631,7 +684,12 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >      }
> >      if (cpu->sve_max_vq) {
> >          if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SVE)) {
> > -            cpu->sve_max_vq = 0;
> > +            if (cpu->sve_max_vq == -1) {> +                cpu->sve_max_vq = 0;
> > +            } else {
> > +                error_report("This KVM host does not support SVE");
> > +                return -EINVAL;
> > +            }
> >          } else {
> >              cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
> >          }
> > @@ -644,6 +702,24 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >      }
> >  
> >      if (cpu->sve_max_vq) {
> > +        uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS];
> line
> > +        ret = kvm_arm_get_sve_vls(cs, sve_vls);
> > +        if (ret < 0) {
> > +            return ret;
> > +        }
> > +        if (cpu->sve_max_vq == -1) {> +            cpu->sve_max_vq = ret;
> > +        } else if (cpu->sve_max_vq > ret) {
> > +            error_report("This KVM host does not support SVE vectors "
> I would rephrase the error mesg with something like:
> This KVM host supports SVE vectors of max VQ=%d whereas requested VQ is %d

Yup, giving a better hint as to what the host does support is a good idea.

> > +                         "of length %d quadwords (%d bytes)",
> > +                         cpu->sve_max_vq, cpu->sve_max_vq * 16);
> > +            return -EINVAL;
> > +        } else {
> > +            ret = kvm_arm_set_sve_vls(cs, sve_vls, cpu->sve_max_vq);
> > +            if (ret < 0) {
> > +                return ret;
> > +            }
> > +        }
> >          ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
> >          if (ret) {
> >              return ret;
> > 
> Thanks
> 
> Eric

Thanks,
drew

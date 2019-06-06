Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp7976238pjq;
        Thu, 6 Jun 2019 01:30:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxc3UBAOW1w84750nQdN0CrmHAWyUNQGBOfFpmzZoAgHvOptK4/pKzXNA2lTn3eiN4GCika
X-Received: by 2002:a37:9c16:: with SMTP id f22mr37515035qke.261.1559809810878;
        Thu, 06 Jun 2019 01:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559809810; cv=none;
        d=google.com; s=arc-20160816;
        b=xC9YkZ9OxdMbfJcu1ebDq/1l5304tyOsoozZJ9GVBsXz6aqwzf+I5CnBi2OQqZH3ip
         a+I4yF4qi4tPB8ybCxpZ0Xp/4VqaIsM650AFUooMtgWR6YWfIDJyjj4Hyv8oQKx4s52a
         aJForJeO6+ffe9q1sD1DUrqtOYlBMzqaW4w9mFsH4PyC2vmyASg3ZTe9gJVt6oIzdGCY
         D5KXr+eE/ehTUVqnK8BHQxmV+jK1fHJ8tSdGKKJz+53Qca9uGJwNTRrXN5iwZW4XCmgU
         bGz/7T3HX6fh/zKnAGqyX2bbkIUrejNlqFERe98+XMcpc4ZbcAOYbkuG2TUyIbnz7Gwg
         zkaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ewa31ADVCK/Mtby4EiVDDZkBAJw1t62myaDGee7Rsdg=;
        b=KlPg/ZhCfi6A13TWyrarIT9l0K80wqtHALBtgpCN1p0qVIP+zawlu7IpaXd0+fMbvg
         GFlFkijNdVdROiRjXuR0dCP4FFANzTeUtPkAttcFJPHs9Gdg+lf/1pzzDAeRFdtBjbK/
         ypPOatv0DznOU3r/7ORhgvLBy+ilqDEEgeFEXUrAcjPH1nba1e5zxXODufCvo4yzbMDa
         VludTYBjQfi1xekbYoheG07mIti2oYJEH6F9hJoQw4dONrQ5VlmrkjajbiBnK+nQC0f6
         vw98Z9j8Mv/2JvSk0/wRi18YBc2xHPfXb29aGXweDGKdJuv69ia1vVBCPX3GCAx3erJ4
         I8hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s49si1303664qth.14.2019.06.06.01.30.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 01:30:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E68A380F81;
	Thu,  6 Jun 2019 08:30:09 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B587410841F0;
	Thu,  6 Jun 2019 08:30:01 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 07/13] target/arm/kvm: max cpu: Allow sve max
 vector length setting
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 armbru@redhat.com, abologna@redhat.com, alex.bennee@linaro.org,
 Dave.Martin@arm.com
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-8-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <839be91f-6764-28b1-c0fb-304477bfadf8@redhat.com>
Date: Thu, 6 Jun 2019 10:30:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190512083624.8916-8-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 06 Jun 2019 08:30:10 +0000 (UTC)
X-TUID: nmnKmZIPZn6d

Hi Drew,
On 5/12/19 10:36 AM, Andrew Jones wrote:
> Allow the cpu type 'max' sve-max-vq property to work with kvm
> too. If the property is not specified then the maximum kvm
> supports is used. If it is specified we check that kvm supports
> that exact length or error out if it doesn't.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.h   |  4 +++
>  target/arm/cpu64.c |  7 ++--
>  target/arm/kvm64.c | 80 ++++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 86 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 733b840a7127..8292d547e8f9 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3122,6 +3122,10 @@ static inline uint64_t arm_sctlr(CPUARMState *env, int el)
>      }
>  }
>  
> +static inline int arm_cpu_fls64(uint64_t v)
> +{
> +    return !v ? 0 : 64 - clz64(v);
> +}
>  
>  /* Return true if the processor is in big-endian mode. */
>  static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 6c19ef6837d5..3756e7e2a3e5 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -292,7 +292,7 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> -        cpu->sve_max_vq = ARM_MAX_VQ;
> +        cpu->sve_max_vq = -1; /* set in kvm_arch_init_vcpu() */
>      } else {
>          uint64_t t;
>          uint32_t u;
> @@ -374,9 +374,10 @@ static void aarch64_max_initfn(Object *obj)
>  #endif
>  
>          cpu->sve_max_vq = ARM_MAX_VQ;
> -        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
> -                            cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
>      }
> +
> +    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
> +                        cpu_max_set_sve_vq, NULL, NULL, &error_fatal);>  }
>  
>  struct ARMCPUInfo {
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index c2d92df75353..0c666e405357 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -446,6 +446,59 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
>      }
>  }
>  
> +static int kvm_arm_get_sve_vls(CPUState *cs, uint64_t sve_vls[])
> +{
> +    struct kvm_one_reg reg = {
> +        .id = KVM_REG_ARM64_SVE_VLS,
> +        .addr = (uint64_t)&sve_vls[0],
> +    };
> +    int i, ret;
> +
> +    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    ret = 0;
is it mandated?
> +    for (i = KVM_ARM64_SVE_VLS_WORDS - 1; i >= 0; --i) {
> +        if (sve_vls[i]) {
> +            ret = arm_cpu_fls64(sve_vls[i]) + i * 64;
> +            break;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +static int kvm_arm_set_sve_vls(CPUState *cs, uint64_t sve_vls[], int max_vq)
> +{
> +    struct kvm_one_reg reg = {
> +        .id = KVM_REG_ARM64_SVE_VLS,
> +        .addr = (uint64_t)&sve_vls[0],
> +    };
> +    int i;
> +
> +    for (i = KVM_ARM64_SVE_VLS_WORDS - 1; i >= 0; --i) {
> +        if (sve_vls[i]) {
> +            int vq = arm_cpu_fls64(sve_vls[i]) + i * 64;
nit: add a line
> +            while (vq > max_vq) {
> +                sve_vls[i] &= ~BIT_MASK(vq - 1);
Isn't BIT_MASK for 32b. MAKE_64BIT_MASK?
> +                vq = arm_cpu_fls64(sve_vls[i]) + i * 64;
> +            }
> +            if (vq < max_vq) {
I don't really get this check: having vq less than max_vq does not seems
weird. Do you absolutely want vq=max_vq?
> +                error_report("sve-max-vq=%d is not a valid length", max_vq);
> +                error_printf("next lowest is %d\n", vq);
why mixing error_report/printf?
> +                return -EINVAL;
> +            }
> +            if (vq == max_vq) {
> +                break;
> +            }
> +        }
> +    }
> +
> +    return kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> +}
> +
>  static inline void set_feature(uint64_t *features, int feature)
>  {
>      *features |= 1ULL << feature;
> @@ -605,7 +658,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
>  
>      if (cpu->kvm_target == QEMU_KVM_ARM_TARGET_NONE ||
>          !object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU)) {
> -        fprintf(stderr, "KVM is not supported for this guest CPU type\n");
> +        error_report("KVM is not supported for this guest CPU type");
>          return -EINVAL;
>      }
>  
> @@ -631,7 +684,12 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>      if (cpu->sve_max_vq) {
>          if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SVE)) {
> -            cpu->sve_max_vq = 0;
> +            if (cpu->sve_max_vq == -1) {> +                cpu->sve_max_vq = 0;
> +            } else {
> +                error_report("This KVM host does not support SVE");
> +                return -EINVAL;
> +            }
>          } else {
>              cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
>          }
> @@ -644,6 +702,24 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>  
>      if (cpu->sve_max_vq) {
> +        uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS];
line
> +        ret = kvm_arm_get_sve_vls(cs, sve_vls);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +        if (cpu->sve_max_vq == -1) {> +            cpu->sve_max_vq = ret;
> +        } else if (cpu->sve_max_vq > ret) {
> +            error_report("This KVM host does not support SVE vectors "
I would rephrase the error mesg with something like:
This KVM host supports SVE vectors of max VQ=%d whereas requested VQ is %d
> +                         "of length %d quadwords (%d bytes)",
> +                         cpu->sve_max_vq, cpu->sve_max_vq * 16);
> +            return -EINVAL;
> +        } else {
> +            ret = kvm_arm_set_sve_vls(cs, sve_vls, cpu->sve_max_vq);
> +            if (ret < 0) {
> +                return ret;
> +            }
> +        }
>          ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
>          if (ret) {
>              return ret;
> 
Thanks

Eric

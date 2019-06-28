Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2667787wru;
        Fri, 28 Jun 2019 09:14:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7+tqx66vUzm4gzOYn8OWaRAS6qH8UHXL+jHOt1aMAYc/qBJpKTYDChWIxHkM+7IALkDQY
X-Received: by 2002:a37:c449:: with SMTP id h9mr8990357qkm.187.1561738499230;
        Fri, 28 Jun 2019 09:14:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561738499; cv=none;
        d=google.com; s=arc-20160816;
        b=Xl2bPHlmqmxZiYeIQhoZQ7RKw2YFHS/IO/jVnGXqsbWv4iQw0fivRBQCe9GneBwjQe
         rmO5eT5Pq1VkR3RPUEWunxadptK93H+jHt6ivx+T/lZ4XryqJ4iQ92yaSBEb0SEYxxP8
         BM98cUvKlUN6l0U19csv82WkaGJ6PEm0IokKDc2Wb8ZD1ECA9/kbd8YKAT7qiiOixP6n
         qOKrt4BueNEF+8adMdR8vJhIgujV9yhfVri6d440RUv2TKfujl2mpaixBjP7ZGB4cvsl
         FyVS10sI/se0dgtexKGqokHVFsKC/ZhEN+LZzLMKqnJwldE15DdVP5M02PbgC6nhee/0
         M1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=UFm70fB5ZOc0p7H5waViHL0e57xbgqKj3MHYxfxKbxc=;
        b=n9fQDEm/Q8iY9it5iwSO8LGthqHKI086aVAvBWiFoX+BQLgFgrAy+Lr61kFjMvRvTA
         Bb7Sw7Af/DQTQT6RM5JzPyoL6YgRfZaj3KjcVQuyZSKCNnWJSBkjtFur8eJ9D2XLM0kR
         rpnhvnyRqSXCycJsY/rQ1vO4Xl2PaFH5QKuaiMMOZ50ldHINcaSmUhV+9FSFnlTMzu19
         PvaiB2kCZRgMiyfD2TbneCEyeB7uFAdqbnt+uFQ/Jv7wJl/a5xlC51TtBpTyzcbIlX3H
         NOfmlJu6ejeLhLIYoEQVmjKAUb+sTjdwqarzoaWoUdBGfsWWIpURVAQKfh6Oa2N3ZIjf
         nwog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z62si970952qkd.121.2019.06.28.09.14.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 09:14:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C77FD81F13;
	Fri, 28 Jun 2019 16:14:51 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0A36608CD;
	Fri, 28 Jun 2019 16:14:41 +0000 (UTC)
Subject: Re: [PATCH v2 11/14] target/arm/kvm64: max cpu: Enable SVE when
 available
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-12-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <026dd970-f524-ed17-ea25-bcad39ac8b1b@redhat.com>
Date: Fri, 28 Jun 2019 18:14:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-12-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 28 Jun 2019 16:14:57 +0000 (UTC)
X-TUID: DdiSg7k9zaJo

Hi Drew,

On 6/21/19 6:34 PM, Andrew Jones wrote:
> Enable SVE in the KVM guest when the 'max' cpu type is configured
> and KVM supports it. KVM SVE requires use of the new finalize
> vcpu ioctl, so we add that now too. For starters SVE can only be
> turned on or off, getting all vector lengths the host CPU supports
> when on. We'll add the other SVE CPU properties in later patches.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu64.c       | 24 ++++++++++++++++++++++--
>  target/arm/kvm.c         |  5 +++++
>  target/arm/kvm64.c       | 25 ++++++++++++++++++++++++-
>  target/arm/kvm_arm.h     | 27 +++++++++++++++++++++++++++
>  tests/arm-cpu-features.c |  1 +
>  5 files changed, 79 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 5def82111dee..2e595ad53137 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -371,6 +371,11 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>          return;
>      }
>  
> +    /* sve-max-vq and sve<vl-bits> properties not yet implemented for KVM */
> +    if (kvm_enabled()) {
> +        return;
> +    }
> +
>      if (cpu->sve_max_vq == ARM_SVE_INIT) {
>          object_property_set_uint(OBJECT(cpu), ARM_MAX_VQ, "sve-max-vq", &err);
>          if (err) {
> @@ -632,6 +637,10 @@ static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
>      ARMCPU *cpu = ARM_CPU(obj);
>      bool value = !!cpu->sve_max_vq;
>  
> +    if (kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
> +        value = false;
> +    }
> +
>      visit_type_bool(v, name, &value, errp);
>  }
>  
> @@ -649,6 +658,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
>      }
>  
>      if (value) {
> +        if (kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
> +            error_setg(errp, "'sve' feature not supported by KVM on this host");
> +            return;
> +        }
> +
>          /*
>           * We handle the -cpu <cpu>,sve=off,sve=on case by reinitializing,
>           * but otherwise we don't do anything as an sve=on could come after
> @@ -675,6 +689,11 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> +        /*
> +         * KVM doesn't yet support the sve-max-vq property, but
> +         * setting cpu->sve_max_vq is also used to turn SVE on.
> +         */
> +        cpu->sve_max_vq = ARM_SVE_INIT;
>      } else {
>          uint64_t t;
>          uint32_t u;
> @@ -764,8 +783,6 @@ static void aarch64_max_initfn(Object *obj)
>          cpu->sve_max_vq = ARM_SVE_INIT;
>          object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
>                              cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
> -        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> -                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
>  
>          /*
>           * sve_vq_map uses a special state while setting properties, so
> @@ -780,6 +797,9 @@ static void aarch64_max_initfn(Object *obj)
>                                  cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
>          }
>      }
> +
> +    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> +                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
>  }
>  
>  struct ARMCPUInfo {
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 69c961a4c62c..60645a196d3d 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -49,6 +49,11 @@ int kvm_arm_vcpu_init(CPUState *cs)
>      return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
>  }
>  
> +int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
> +{
> +    return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
> +}
> +
>  void kvm_arm_init_serror_injection(CPUState *cs)
>  {
>      cap_has_inject_serror_esr = kvm_check_extension(cs->kvm_state,
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 706541327491..9fc7f078cf68 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -604,6 +604,15 @@ bool kvm_arm_aarch32_supported(CPUState *cpu)
>      return ret > 0;
>  }
>  
> +bool kvm_arm_sve_supported(CPUState *cpu)
> +{
> +    KVMState *s = KVM_STATE(current_machine->accelerator);
> +    int ret;
> +
> +    ret = kvm_check_extension(s, KVM_CAP_ARM_SVE);
> +    return ret > 0;
return kvm_check_extension()

Eric
> +}
> +
>  #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
>  
>  int kvm_arch_init_vcpu(CPUState *cs)
> @@ -632,13 +641,20 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
>      }
>      if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> -            cpu->has_pmu = false;
> +        cpu->has_pmu = false;
>      }
>      if (cpu->has_pmu) {
>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
>      } else {
>          unset_feature(&env->features, ARM_FEATURE_PMU);
>      }
> +    if (cpu->sve_max_vq) {
> +        if (!kvm_arm_sve_supported(cs)) {
> +            cpu->sve_max_vq = 0;
> +        } else {
> +            cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
> +        }
> +    }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> @@ -646,6 +662,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          return ret;
>      }
>  
> +    if (cpu->sve_max_vq) {
> +        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
> +        if (ret) {
> +            return ret;
> +        }
> +    }
> +
>      /*
>       * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
>       * Currently KVM has its own idea about MPIDR assignment, so we
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index e0ded3607996..2367f8ab78ed 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -27,6 +27,20 @@
>   */
>  int kvm_arm_vcpu_init(CPUState *cs);
>  
> +/**
> + * kvm_arm_vcpu_finalize
> + * @cs: CPUState
> + * @feature: int
> + *
> + * Finalizes the configuration of the specified VCPU feature by
> + * invoking the KVM_ARM_VCPU_FINALIZE ioctl. Features requiring
> + * this are documented in the "KVM_ARM_VCPU_FINALIZE" section of
> + * KVM's API documentation.
> + *
> + * Returns: 0 if success else < 0 error code
> + */
> +int kvm_arm_vcpu_finalize(CPUState *cs, int feature);
> +
>  /**
>   * kvm_arm_register_device:
>   * @mr: memory region for this device
> @@ -224,6 +238,14 @@ bool kvm_arm_aarch32_supported(CPUState *cs);
>   */
>  bool kvm_arm_pmu_supported(CPUState *cs);
>  
> +/**
> + * bool kvm_arm_sve_supported:
> + * @cs: CPUState
> + *
> + * Returns true if the KVM VCPU can enable SVE and false otherwise.
> + */
> +bool kvm_arm_sve_supported(CPUState *cs);
> +
>  /**
>   * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
>   * IPA address space supported by KVM
> @@ -274,6 +296,11 @@ static inline bool kvm_arm_pmu_supported(CPUState *cs)
>      return false;
>  }
>  
> +static inline bool kvm_arm_sve_supported(CPUState *cs)
> +{
> +    return false;
> +}
> +
>  static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>  {
>      return -ENOENT;
> diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> index a4bf6aec00df..67ad5f2b78d5 100644
> --- a/tests/arm-cpu-features.c
> +++ b/tests/arm-cpu-features.c
> @@ -393,6 +393,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>  
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          assert_has_feature(qts, "host", "aarch64");
> +        assert_has_feature(qts, "max", "sve");
>  
>          assert_error(qts, "cortex-a15",
>              "The CPU definition 'cortex-a15' cannot "
> 

Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1762657wrp;
        Wed, 25 Sep 2019 23:53:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIR2HwE0S2/7nZ+H4ICSW33J9V5YuKn8GGMGucUy830oJ//SKMXiXmRyKR7pI3lda9GxjV
X-Received: by 2002:a02:ce5c:: with SMTP id y28mr2301666jar.79.1569480787055;
        Wed, 25 Sep 2019 23:53:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569480787; cv=none;
        d=google.com; s=arc-20160816;
        b=ds10/xPYscMJgQvQRkRsM0q1wVkvn1k8msUzgUzgYe+BHGH1H3jZorwDPGazvckUbJ
         yHovSnWRAxa747cRdqnJ8n+joGPbgvzxNQ38vOqYxwQdYHbhTi+5tAQY7rNRCVTe8oeK
         Ygr0f044KwsT40fN7HTtZkGuqkWjzZf/MOa5nNOR6sK0sDmbkc/sYcLVD5LKujhW6ev4
         q9tkZfievwR0/k9EWmdq8O5oxRVBfrKV6nl5h+dM1qWgk62EZKb4WOEcsY5nq5GsI75K
         We1bHa0c30Sz2w9tfuXiHWG4STp9pfV22yJyGA5Yxc8972rOPaZteV+raxlSIP7wnAGs
         PmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=CpXnP45IdW7mixkalTiMTmThFnK3vyDwDFJ4m+CmhYo=;
        b=WPecZgdxEVJzUlEYpBKn34J8YSjJjzCrWrMuXhkhDcOz7amIGzoujeDNHBFwwTQQT5
         6QJs2HmuP7MIJAFs5Gwl1DdeDT5B+NuHhBjyV6idaaySAWlc9LCZj0M58z9koTQoNg0y
         96B0ZHZzTJO4it6xNVpRmkKkL0U+MMF5EHx1tUnOzZ+xtgp0v2licpedGAYWd95vyynj
         YsGIHKSKNpJc1C6+mw6runtvsn/ZCKqa/+lFZlu6RQCXq3Nqna0qSoYTmOWFpNpBc7un
         IBbQ61rP7Sg/Q3iKK1CGaOskvVtXN/KUAGdgK68jkqHRdtTWA5mwyNOW8CHLkoINd6Ys
         Fknw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l12si1426729jaa.6.2019.09.25.23.53.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 23:53:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C1297FDF4;
	Thu, 26 Sep 2019 06:53:06 +0000 (UTC)
Received: from [10.36.117.64] (ovpn-117-64.ams2.redhat.com [10.36.117.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2311C5D9CC;
	Thu, 26 Sep 2019 06:53:03 +0000 (UTC)
Subject: Re: [PATCH v4 6/9] target/arm/kvm64: max cpu: Enable SVE when
 available
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 armbru@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org,
 Dave.Martin@arm.com
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-7-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7524af40-3f53-40e2-03e3-e1896bd26858@redhat.com>
Date: Thu, 26 Sep 2019 08:53:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190924113105.19076-7-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 26 Sep 2019 06:53:06 +0000 (UTC)
X-TUID: w/V8TyZ/rhIl

Hi Drew,

On 9/24/19 1:31 PM, Andrew Jones wrote:
> Enable SVE in the KVM guest when the 'max' cpu type is configured
> and KVM supports it. KVM SVE requires use of the new finalize
> vcpu ioctl, so we add that now too. For starters SVE can only be
> turned on or off, getting all vector lengths the host CPU supports
> when on. We'll add the other SVE CPU properties in later patches.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  target/arm/cpu64.c       | 17 ++++++++++++++---
>  target/arm/kvm.c         |  5 +++++
>  target/arm/kvm64.c       | 20 +++++++++++++++++++-
>  target/arm/kvm_arm.h     | 27 +++++++++++++++++++++++++++
>  tests/arm-cpu-features.c |  1 +
>  5 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 606e3eceb9c0..b7eff4e1e107 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -481,6 +481,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> +    if (value && kvm_enabled() && !kvm_arm_sve_supported(CPU(cpu))) {
> +        error_setg(errp, "'sve' feature not supported by KVM on this host");
> +        return;
> +    }
> +
>      t = cpu->isar.id_aa64pfr0;
>      t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
>      cpu->isar.id_aa64pfr0 = t;
> @@ -495,11 +500,16 @@ static void aarch64_max_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
>      uint32_t vq;
> +    uint64_t t;
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> +        if (kvm_arm_sve_supported(CPU(cpu))) {
> +            t = cpu->isar.id_aa64pfr0;
> +            t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> +            cpu->isar.id_aa64pfr0 = t;
> +        }
>      } else {
> -        uint64_t t;
>          uint32_t u;
>          aarch64_a57_initfn(obj);
>  
> @@ -600,8 +610,6 @@ static void aarch64_max_initfn(Object *obj)
>  
>          object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
>                              cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
> -        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> -                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
>  
>          for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
>              char name[8];
> @@ -610,6 +618,9 @@ static void aarch64_max_initfn(Object *obj)
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
> index b2eaa50b8df9..72569f71236e 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -51,6 +51,11 @@ int kvm_arm_vcpu_init(CPUState *cs)
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
> index ea454c613919..fc62bab8684e 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -602,6 +602,13 @@ bool kvm_arm_aarch32_supported(CPUState *cpu)
>      return kvm_check_extension(s, KVM_CAP_ARM_EL1_32BIT);
>  }
>  
> +bool kvm_arm_sve_supported(CPUState *cpu)
> +{
> +    KVMState *s = KVM_STATE(current_machine->accelerator);
> +
> +    return kvm_check_extension(s, KVM_CAP_ARM_SVE);
> +}
> +
>  #define ARM_CPU_ID_MPIDR       3, 0, 0, 0, 5
>  
>  int kvm_arch_init_vcpu(CPUState *cs)
> @@ -630,13 +637,17 @@ int kvm_arch_init_vcpu(CPUState *cs)
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
> +    if (cpu_isar_feature(aa64_sve, cpu)) {
> +        assert(kvm_arm_sve_supported(cs));
> +        cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
> +    }
>  
>      /* Do KVM_ARM_VCPU_INIT ioctl */
>      ret = kvm_arm_vcpu_init(cs);
> @@ -644,6 +655,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
>          return ret;
>      }
>  
> +    if (cpu_isar_feature(aa64_sve, cpu)) {
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
> index b3106c8600af..1151877f97ea 100644
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
> @@ -225,6 +239,14 @@ bool kvm_arm_aarch32_supported(CPUState *cs);
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
> @@ -275,6 +297,11 @@ static inline bool kvm_arm_pmu_supported(CPUState *cs)
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
> index 9a2dd402b769..d50f98cb6aea 100644
> --- a/tests/arm-cpu-features.c
> +++ b/tests/arm-cpu-features.c
> @@ -386,6 +386,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>  
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          assert_has_feature(qts, "host", "aarch64");
> +        assert_has_feature(qts, "max", "sve");
>  
>          assert_error(qts, "cortex-a15",
>              "We cannot guarantee the CPU type 'cortex-a15' works "
> 

Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1200570wrm;
        Thu, 17 Oct 2019 09:44:00 -0700 (PDT)
X-Received: by 2002:ac8:17bb:: with SMTP id o56mr4785633qtj.192.1571330640106;
        Thu, 17 Oct 2019 09:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571330640; cv=none;
        d=google.com; s=arc-20160816;
        b=IfWsEIWPZGDbs21ptXZVyyMEfHgPRhgxJ/Pf0WwAolqrkb12XQw3WLTHWgKledpNk0
         RcRkX+wQTZsfSufHINJSRunE6Hd4u7ZbFblmO0S/9DVl4ZO0nJ7/UPS/6rEcI20uglWS
         5kNkQxYYiJvNrWn9KiMLXQcLKaHZOBHqQTebYp4vsulWPJjcSOMhbJ7wJY5GZXdczo9Z
         EBefM6d0dQUman+NQhBrgsBwIFOHntmHv4y7nm9s6azV+KqTkt98w6kzIuuNswLdAB79
         9jYjxICTWgI+MuDfjvGoYRBQluouDg03Pbd/ELjD9TsEok0bu1Tdp+HM60xQU1DHTIoP
         8lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=n6NIYVZUjz9PNQW0NObluyOoQCvfPyZ3656cjNtJRLE=;
        b=SPwrJaELTf5RUF2/IePSNA3AKm1Re46LR98/3pmMI54tYA7Q4IlogOGSsmmmZ2bujX
         hwOAn1OKpqM3lmknVjImDI5pI4eg09g6HM4nGo8Ro3Iu0ye7TvlKLRzouTi3SVDwYSm6
         LS9K8EhIZiObxMyNOVkz7DJDAyyoyCQSlgCR9n4mZ+/g1kkO70wILSQQRXIgmO7XXeir
         V2TJ0ktYEKDMjsZ3hL7vK1FDxdbc0gebO8i+9Cv/ilvn0SKg1lTaelV9HCuI7e8FOBU+
         fuAD0iPNyqt0vVWnL9vtgvIM03Y9gZ7WJujiVIe2QkNGJrBCawvW98inAgzhzzzimlUw
         alfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=f6fzzvTu;
       spf=pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=msys.mizuma@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <msys.mizuma@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d14sor1978282qvz.0.2019.10.17.09.43.59
        (Google Transport Security);
        Thu, 17 Oct 2019 09:44:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=f6fzzvTu;
       spf=pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=msys.mizuma@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n6NIYVZUjz9PNQW0NObluyOoQCvfPyZ3656cjNtJRLE=;
        b=f6fzzvTuo81OoIzKrwxmYhajdYkNQ6dDoWAvCdPPXvZLXjt502wqqfNQ2sT5XObTDe
         ms1vlYupj67fFhxBe+LulvyjK0sSDg0yROzuMzaLGnybulMODqhYROzXhOtAkD+3detz
         E/PNYnIdaWL72uyNKO7ejqrrrnwT52RHZZ8jhtQS3xe8CHeQqpZNALewDmWtizgZyACn
         d2gmZyZT83tTvJR6pjUhlwlOZBajGcU9ukXF6wZjXraFBOcG+zsdN/+g1NneKzcMp7kv
         UFBFWhpo6H56fNE4pGuE9eKEy+UPjiClP7HzmH6FaUsTAjVcZlx7ymYsYcqJh2anYZtk
         DaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n6NIYVZUjz9PNQW0NObluyOoQCvfPyZ3656cjNtJRLE=;
        b=Xpr+3gChHCr7/ft22mn33YQiBnk3pZMZT9tziuETiGbQu9H/72i56f4ud0WzJgz0Iy
         ltsVLQRlJaB3xGpXKT+oQjV5BwLy3Bp/YjNRLLGi2yrEUXsNeV6B4HSNUGLN2kuxdISw
         P7HLoCoI1WHHZ/v/tAUzDcqHxylWXqHuNb943EnC6iNcOObqJy3mn7wOrn4dkQqBP43n
         u04/FqJu57GrCtta6WfGbuNNfFepUZVx8FggPQz61C6Ms5UIyYNQ3ovCo0hvfz70iDNj
         zyksEMHuzw4QgRanmRKFFZUJ2VFC2+jJCNf6eb5L5sRSZa1OyMXnQQh/KrpWeo7JMrR7
         3V6g==
X-Gm-Message-State: APjAAAV6k5FvnrrZ+b3ygsG4UnJgZ3tR/046XI7PzPPMKQdMHrZDOgPj
	FwQYiMemRBqaapH2oDE634j6R1w=
X-Google-Smtp-Source: APXvYqwkzVZ40ZtgmYyDrxhkegarALSpYxOKmcSMMgoyVCq7nXRUsE3JfrS2ymW4st2wmfCTGNUMXQ==
X-Received: by 2002:a05:6214:2ea:: with SMTP id h10mr4770502qvu.113.1571330639619;
        Thu, 17 Oct 2019 09:43:59 -0700 (PDT)
Return-Path: <msys.mizuma@gmail.com>
Received: from gabell (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id s42sm46517qtk.60.2019.10.17.09.43.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 09:43:59 -0700 (PDT)
Date: Thu, 17 Oct 2019 12:43:56 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	eric.auger@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org,
	Dave.Martin@arm.com
Subject: Re: [PATCH v6 6/9] target/arm/kvm64: max cpu: Enable SVE when
 available
Message-ID: <20191017164356.w7syfwrvvbzc5els@gabell>
References: <20191016085408.24360-1-drjones@redhat.com>
 <20191016085408.24360-7-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016085408.24360-7-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-TUID: ZNfgyww8zjks

On Wed, Oct 16, 2019 at 10:54:05AM +0200, Andrew Jones wrote:
> Enable SVE in the KVM guest when the 'max' cpu type is configured
> and KVM supports it. KVM SVE requires use of the new finalize
> vcpu ioctl, so we add that now too. For starters SVE can only be
> turned on or off, getting all vector lengths the host CPU supports
> when on. We'll add the other SVE CPU properties in later patches.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

This patch works well on aarch64 with SVE machine, thanks!
Please feel free to add:

    Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

- Masa

> ---
>  target/arm/cpu64.c       | 17 ++++++++++++++---
>  target/arm/kvm.c         |  5 +++++
>  target/arm/kvm64.c       | 20 +++++++++++++++++++-
>  target/arm/kvm_arm.h     | 27 +++++++++++++++++++++++++++
>  tests/arm-cpu-features.c |  1 +
>  5 files changed, 66 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 34b0ba2cf6f7..a771a28daa56 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -493,6 +493,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
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
> @@ -507,11 +512,16 @@ static void aarch64_max_initfn(Object *obj)
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
> @@ -612,8 +622,6 @@ static void aarch64_max_initfn(Object *obj)
>  
>          object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
>                              cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
> -        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> -                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
>  
>          for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
>              char name[8];
> @@ -622,6 +630,9 @@ static void aarch64_max_initfn(Object *obj)
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
> index b473c63edb1c..f07332bbda30 100644
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
> index 4c0b11d105a4..850da1b5e6aa 100644
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
> index b4e19457a094..7c12f1501a8b 100644
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
> @@ -276,6 +298,11 @@ static inline bool kvm_arm_pmu_supported(CPUState *cs)
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
> index 0190148260dc..3c8ed85b5adb 100644
> --- a/tests/arm-cpu-features.c
> +++ b/tests/arm-cpu-features.c
> @@ -391,6 +391,7 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>  
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          assert_has_feature(qts, "host", "aarch64");
> +        assert_has_feature(qts, "max", "sve");
>  
>          assert_error(qts, "cortex-a15",
>              "We cannot guarantee the CPU type 'cortex-a15' works "
> -- 
> 2.21.0
> 
> 

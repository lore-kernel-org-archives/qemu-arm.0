Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4742516wrg;
        Tue, 25 Jun 2019 02:35:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySyNrjq+woTOw+vwLq2s7DVeSaakCT/jj6F/HxjQfD8uWG4P541z9ZsjQo0CU+5gj1ikjw
X-Received: by 2002:a37:2747:: with SMTP id n68mr19526672qkn.447.1561455313896;
        Tue, 25 Jun 2019 02:35:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561455313; cv=none;
        d=google.com; s=arc-20160816;
        b=0iLQo9wn/dgDYujS0713lxH9+eT3O6L0+/GVbwlogLEZS8dbtk/JRHIb7loZneGiIH
         9U1nhTec4ppx9Wo7pXxgWKhNVvmx7+CuOoNO/AeZ21163/c9L9+Z/GO3ytQD+cKmUfqK
         wLpja2jR9uagcepYg9ql3DF4z02d9i9MeJy34j4zcwwJJ0VVy8S03uiB1sUE42xM6EnQ
         Y+ORdLTCW/kHv4oDwb0Y+ffUHbpMu5Ut+q+gHGi+vMlgS0v+jLm6znCU572yN/y7ExUd
         3S8yy1/YTPfFgR5aRZInBAFEXipW1tjp/YGBzAPT7lqjyeKYqo0WPii4270y1qtrGfHe
         mOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject:from;
        bh=OEJ5oiEzC82405Fp7RGj04p4aoVixn0W2cGYiRsyhLk=;
        b=zUQpQwEkw/yl3gTkByCxlYXZqRwuLi2U2JTA/JxCP508CyBUsnZjwv2QU4N+3dNPe7
         TdTA4kL1ynSOhPQIw/GlG+MCgZ+cs2BM1dqpUPi7I824VOy4C0y+4lPRyorsMfgKh0JX
         JF17v1Av+7HUrw9xpE3mNFqMXpKYbUFm18bEuy69M7pjGzGfwq5aCvFl79HifCYw4Pl4
         c1CoM1HDHkQ0svtPmxyJd4GQJLzE1brYLJfUbiWhq5JAyWMQ5By3TyLkagYABwV2F9IA
         ZPiAHmtU8xK6/UxZ701sV3igCyYVUgr8SSNIweK8odUu31Tgfvmzv1QTS3Z9Mfyyoo6l
         zZSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y18si9842769qvc.47.2019.06.25.02.35.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 02:35:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA0CD3091851;
	Tue, 25 Jun 2019 09:35:12 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A35095D9C5;
	Tue, 25 Jun 2019 09:35:10 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 02/14] target/arm/cpu: Ensure we can use the pmu with
 kvm
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-3-drjones@redhat.com>
Message-ID: <03eb93d5-0c9e-0799-6138-6f65bf60395f@redhat.com>
Date: Tue, 25 Jun 2019 11:35:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-3-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 25 Jun 2019 09:35:13 +0000 (UTC)
X-TUID: X663fKziRls9

Hi Drew,

On 6/21/19 6:34 PM, Andrew Jones wrote:
> We first convert the pmu property from a static property to one with
> its own accessors. Then we use the set accessor to check if the PMU is
> supported when using KVM. Indeed a 32-bit KVM host does not support
> the PMU, so this check will catch an attempt to use it at property-set
> time.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.c     | 30 +++++++++++++++++++++++++-----
>  target/arm/kvm.c     |  9 +++++++++
>  target/arm/kvm_arm.h | 13 +++++++++++++
>  3 files changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 376db154f008..858f668d226e 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -759,10 +759,6 @@ static Property arm_cpu_has_el3_property =
>  static Property arm_cpu_cfgend_property =
>              DEFINE_PROP_BOOL("cfgend", ARMCPU, cfgend, false);
>  
> -/* use property name "pmu" to match other archs and virt tools */
> -static Property arm_cpu_has_pmu_property =
> -            DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, true);
> -
>  static Property arm_cpu_has_vfp_property =
>              DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
>  
> @@ -785,6 +781,29 @@ static Property arm_cpu_pmsav7_dregion_property =
>                                             pmsav7_dregion,
>                                             qdev_prop_uint32, uint32_t);
>  
> +static bool arm_get_pmu(Object *obj, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    return cpu->has_pmu;
> +}
> +
> +static void arm_set_pmu(Object *obj, bool value, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    if (value) {
> +        if (kvm_enabled() && !kvm_arm_pmu_supported(CPU(cpu))) {
> +            error_setg(errp, "'pmu' feature not supported by KVM on this host");
> +            return;
> +        }
> +        set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    } else {
> +        unset_feature(&cpu->env, ARM_FEATURE_PMU);
> +    }
> +    cpu->has_pmu = value;
> +}
> +
>  static void arm_get_init_svtor(Object *obj, Visitor *v, const char *name,
>                                 void *opaque, Error **errp)
>  {
> @@ -859,7 +878,8 @@ void arm_cpu_post_init(Object *obj)
>      }
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
> -        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
> +        cpu->has_pmu = true;
> +        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu,
>                                   &error_abort);
>      }
>  
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index fe4f461d4ef6..69c961a4c62c 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -162,6 +162,15 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu)
>      env->features = arm_host_cpu_features.features;
>  }
>  
> +bool kvm_arm_pmu_supported(CPUState *cpu)
> +{
> +    KVMState *s = KVM_STATE(current_machine->accelerator);
> +    int ret;
> +
> +    ret = kvm_check_extension(s, KVM_CAP_ARM_PMU_V3);
> +    return ret > 0;
return kvm_check_extension
> +}
> +
>  int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>  {
>      KVMState *s = KVM_STATE(ms->accelerator);
> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> index 812125f805a1..e0ded3607996 100644
> --- a/target/arm/kvm_arm.h
> +++ b/target/arm/kvm_arm.h
> @@ -216,6 +216,14 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>   */
>  bool kvm_arm_aarch32_supported(CPUState *cs);
>  
> +/**
> + * bool kvm_arm_pmu_supported:
> + * @cs: CPUState
kernel-doc comment style?
> + *
> + * Returns true if the KVM VCPU can enable its PMU and false otherwise.
> + */
> +bool kvm_arm_pmu_supported(CPUState *cs);
> +
>  /**
>   * kvm_arm_get_max_vm_ipa_size - Returns the number of bits in the
>   * IPA address space supported by KVM
> @@ -261,6 +269,11 @@ static inline bool kvm_arm_aarch32_supported(CPUState *cs)
>      return false;
>  }
>  
> +static inline bool kvm_arm_pmu_supported(CPUState *cs)
> +{
> +    return false;
> +}
> +
>  static inline int kvm_arm_get_max_vm_ipa_size(MachineState *ms)
>  {
>      return -ENOENT;
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

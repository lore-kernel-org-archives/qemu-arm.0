Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4024093wrp;
        Tue, 24 Sep 2019 08:06:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7e09yBLANxap7ijzluJUiPDxgz9GI2Kwlt7WfF3bXTIqdztNh4f3GMhPkgq4yNC0YkxWk
X-Received: by 2002:aca:3556:: with SMTP id c83mr500148oia.78.1569337572491;
        Tue, 24 Sep 2019 08:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569337572; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJT3ueCIle7WV+oBxGxcyVMrOHZq85tr20Wvtx8KOJyP/ll+YXMp4x/aBmapgcD3hc
         gvL0+ShUi/bZA0BhGiW6u0ic+dgoGZgAzpGx/2yNkKiVHHiFF+aZqXlXAxMNfPFt4aqP
         +IxVx6gSzO0MDSnm9mlvS1FeeLu/u8N2PZgsWh3AJ0yGznBynzM/ZSkjn6oA4YTeuR0e
         xMdjOV8NOk4yxPdspIh6mUjVG18ZSjiYCLif8AbCdZJ4oM1DtjE8ehKi8V4V1FR1x21z
         biv+ORVbmTMulUZu/sqfsU80qmX3bU6L+eef1Bz7t1ijXTz4FyLXEwGO7JupzprYrq3i
         wPzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=NxoBwaPBgvfK8zfF8JquE2OQIFSP9P0hdohdY61xgUc=;
        b=pe9X+EaZaUnoFRy9iXGJBWjkYDg9EeE8AbbqpzlSAjmrsMlOc9n7vPc/F4dIHr+ClD
         2KtRjezSiTEUPnCjPJ6NFm51faU5QnzDSW4EE/L1GvYL9KuAo5/3sCdGz3gWGlSMpiF4
         jHCmmdLtzJ0cKCTDUTxhoe3nScgZlmFw7OI/DXwR0XpOol7ZtYpNz2tHJqsVJXAmmdsq
         XthSWU4/jmvP8LZkNxHCUM6y/nHzBpoMUUj8X4QRfCZQfPh2p0BBJywEsaHczJIQhN10
         gZYvqxGq2OI3XHlVoo+oe1Zz7lwcAg+vmvhY+KAAgmpIEfLUHeLnBf3Z+wwjFDxLKxrm
         nmpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id z7si3065816jab.99.2019.09.24.08.06.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 08:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EA4C18C4288;
	Tue, 24 Sep 2019 15:06:11 +0000 (UTC)
Received: from [10.36.116.30] (ovpn-116-30.ams2.redhat.com [10.36.116.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AF8A5D713;
	Tue, 24 Sep 2019 15:06:07 +0000 (UTC)
Subject: Re: [PATCH v4 3/9] target/arm: Allow SVE to be disabled via a CPU
 property
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-4-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <78300b0a-cb7e-ab08-ec65-92227feeb873@redhat.com>
Date: Tue, 24 Sep 2019 17:06:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190924113105.19076-4-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Tue, 24 Sep 2019 15:06:11 +0000 (UTC)
X-TUID: RvMzByVoftfY

Hi Drew,

On 9/24/19 1:30 PM, Andrew Jones wrote:
> Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
> a CPU property") we can disable the 'max' cpu model's VFP and neon
> features, but there's no way to disable SVE. Add the 'sve=on|off'
> property to give it that flexibility. We also rename
> cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
> to follow the typical *_get/set_<property-name> pattern.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  target/arm/cpu.c         |  3 ++-
>  target/arm/cpu64.c       | 42 ++++++++++++++++++++++++++++++++++------
>  target/arm/monitor.c     |  2 +-
>  tests/arm-cpu-features.c |  1 +
>  4 files changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2399c144718d..73be2ebfdd39 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -200,7 +200,8 @@ static void arm_cpu_reset(CPUState *s)
>          env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
>          env->cp15.cptr_el[3] |= CPTR_EZ;
>          /* with maximum vector length */
> -        env->vfp.zcr_el[1] = cpu->sve_max_vq - 1;
> +        env->vfp.zcr_el[1] = cpu_isar_feature(aa64_sve, cpu) ?
> +                             cpu->sve_max_vq - 1 : 0;
>          env->vfp.zcr_el[2] = env->vfp.zcr_el[1];
>          env->vfp.zcr_el[3] = env->vfp.zcr_el[1];
>          /*
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index d7f5bf610a7d..8cdb0c79fa7a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -256,15 +256,15 @@ static void aarch64_a72_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>  }
>  
> -static void cpu_max_get_sve_vq(Object *obj, Visitor *v, const char *name,
> -                               void *opaque, Error **errp)
> +static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
>      visit_type_uint32(v, name, &cpu->sve_max_vq, errp);
>  }
>  
> -static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
> -                               void *opaque, Error **errp)
> +static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
>      Error *err = NULL;
> @@ -279,6 +279,34 @@ static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
>      error_propagate(errp, err);
>  }
>  
> +static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    bool value = cpu_isar_feature(aa64_sve, cpu);
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    Error *err = NULL;
> +    bool value;
> +    uint64_t t;
> +
> +    visit_type_bool(v, name, &value, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    t = cpu->isar.id_aa64pfr0;> +    t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
> +    cpu->isar.id_aa64pfr0 = t;
> +}
> +
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>   * otherwise, a CPU with as many features enabled as our emulation supports.
>   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> @@ -391,8 +419,10 @@ static void aarch64_max_initfn(Object *obj)
>  #endif
>  
>          cpu->sve_max_vq = ARM_MAX_VQ;
> -        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
> -                            cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
> +        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
> +                            cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
> +        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> +                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
>      }
>  }
>  
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index edca8aa885f0..4fddb6c252a3 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -97,7 +97,7 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
>   * then the order that considers those dependencies must be used.
>   */
>  static const char *cpu_model_advertised_features[] = {
> -    "aarch64", "pmu",
> +    "aarch64", "pmu", "sve",
>      NULL
>  };
>  
> diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> index 198ff6d6b495..202bc0e3e823 100644
> --- a/tests/arm-cpu-features.c
> +++ b/tests/arm-cpu-features.c
> @@ -179,6 +179,7 @@ static void test_query_cpu_model_expansion(const void *data)
>  
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          assert_has_feature(qts, "max", "aarch64");
> +        assert_has_feature(qts, "max", "sve");
>          assert_has_feature(qts, "cortex-a57", "pmu");
>          assert_has_feature(qts, "cortex-a57", "aarch64");
>  
> 

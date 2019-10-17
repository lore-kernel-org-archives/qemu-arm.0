Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1199425wrm;
        Thu, 17 Oct 2019 09:42:53 -0700 (PDT)
X-Received: by 2002:ac8:44da:: with SMTP id b26mr4882905qto.299.1571330572669;
        Thu, 17 Oct 2019 09:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571330572; cv=none;
        d=google.com; s=arc-20160816;
        b=0zuJlYXXR62qdSogVDM0DdXJ18wm35Uw4aS6pkJFtQ4R/nJ0hraH5KQO1Wcuv2VoL5
         GUpqUyCshgZZzHsNR/1YFdL9lksrQQBdzUfGs4pmMKEMISsnKUScwaqskH0F9L6+BcVn
         Xnhteukfy7sbuzpAnDB+ElVQxYjQldJloGgLBZ83XukBunuMgSAAwZUWb16JmTs7H1/s
         CoLt+KSTdvXdK48wDyfdbXUovXUV4F+Ij1Ect9roZNt407D3dF6LmT2ATLi5aE/o+LJp
         HLCRrmOPwciBVIqdIblaKHvJOxI0MnGSe3gKOTZt+N0cTmxBevIZweLSF0FS8SJzZvS8
         1YNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=HiiNYwNsBT8xcUSwDFs/OWWEXTaT1ouYkQZp0N3hl6k=;
        b=J/L43dWJJiD+kTV2g9aE6+1MddKx0CMd3m3X+Ts2twLWfxS1xMDHhgdyHLfj99aKyI
         MabIqMnSCcovbsZBkFXdfXXGfbdsh2iOOfUQaMnPZi5OtT41NXm6IywlrRSuRID/1S2a
         xBQZA4BjZiRUeXbtDBzMJRDSTE65sTvYy8ASXnDnK/C5e4vaqlWtFVeLOrdaHyJCsavd
         /fSDwawTKjp2Ldl5tY+NweN8uw2jolj4mMNdnCmGV9QYVMXOM0udBaDYSpIo6pYqB+mj
         grVsotn2ruiP/bH5IcGhW6znaZYoRMT1b3RCbXEycz+rxKYKG7YhCQxwPlMnCRzQ8KyI
         tvHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rOuD86FE;
       spf=pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=msys.mizuma@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <msys.mizuma@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d22sor3425502qtq.64.2019.10.17.09.42.52
        (Google Transport Security);
        Thu, 17 Oct 2019 09:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=rOuD86FE;
       spf=pass (google.com: domain of msys.mizuma@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=msys.mizuma@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HiiNYwNsBT8xcUSwDFs/OWWEXTaT1ouYkQZp0N3hl6k=;
        b=rOuD86FEFlVfXybEKlE/7IxpY3ENRbiaTNgBR7k1ED/qrFw5FAqynUgUeVc64x0aD1
         +AcTSKGymmbT2BpPFmUzB8Z1PtnrirnNJh8l2TucwNgKimntPNzqfF6TqLO7Cn3s9Is7
         BMWrmP3HRAa8COTvflb2LBF4Y1q+9VyYd9esf/3qLXoLFGMZaL5c4lttjHhED0VC44WH
         cZGXFjrHydl23l/mhmfxulgnnJ5bHj4M09zX0B9Ohe/eslN/+8F/5bQJU790GemAFAm5
         Dy4n4gQUHWfwFktggiunHF5U5pI5EkBv5FASOuPIK3Ict5T7SRFE16nvDt0ygG9ZMKaq
         FSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HiiNYwNsBT8xcUSwDFs/OWWEXTaT1ouYkQZp0N3hl6k=;
        b=eqC2Q91pIlCQJrE8tlzmeC3mMFWooi0J18oqt++Dg9imDJB0UOeoLilfwkxdcd4sAl
         GJpweNjp8x6sGIZ/jf2CmV8mHkMoyZBOXjbSBUJiIAFgxV9XLqfJMMVrazypPGqOt/nA
         wayG4dVoT6nLkeD5bdHgAHfUjC2FA7RxuPu1Tb6CoR0P6hGisaPl13FzzX2vaFqHoBF7
         +3dyKgKDBos4pPGt8mMk4jQwS42jDtv55yjIuDw/zT9wFNqao/kYwoSqDX1+8JgfZSiv
         5pKWIVe/5F/NWPSGgsirZ8M7XplGlUX6hRIf4EyfZKthCYjE9eg0tOk5F/7n/k9eATCI
         ys5A==
X-Gm-Message-State: APjAAAWWyQYaQ3NcpnySpMg2RAn2bQY7hQVAVgXyieRJqiEJ7BCjNbP9
	pIVcwFYBJmXyyUJvdQKl+g==
X-Google-Smtp-Source: APXvYqw9qPIDYJgGS6C8W+BtoDxvgsSeV5bxWXMGTPQEvpJHlB+zuY3gdiePrs5ACLUdEcoldSdlEg==
X-Received: by 2002:ac8:529a:: with SMTP id s26mr4886081qtn.234.1571330571919;
        Thu, 17 Oct 2019 09:42:51 -0700 (PDT)
Return-Path: <msys.mizuma@gmail.com>
Received: from gabell (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id a190sm1606819qkf.118.2019.10.17.09.42.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 09:42:51 -0700 (PDT)
Date: Thu, 17 Oct 2019 12:42:45 -0400
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	eric.auger@redhat.com, imammedo@redhat.com, alex.bennee@linaro.org,
	Dave.Martin@arm.com
Subject: Re: [PATCH v6 3/9] target/arm: Allow SVE to be disabled via a CPU
 property
Message-ID: <20191017164244.2ddbfwqwhpnvjkaq@gabell>
References: <20191016085408.24360-1-drjones@redhat.com>
 <20191016085408.24360-4-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016085408.24360-4-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-TUID: BUaQkXZ4a+n2

On Wed, Oct 16, 2019 at 10:54:02AM +0200, Andrew Jones wrote:
> Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
> a CPU property") we can disable the 'max' cpu model's VFP and neon
> features, but there's no way to disable SVE. Add the 'sve=on|off'
> property to give it that flexibility. We also rename
> cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
> to follow the typical *_get/set_<property-name> pattern.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

This patch works well on aarch64 with SVE machine, thanks!
Please feel free to add:

    Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>

- Masa

> ---
>  target/arm/cpu.c         |  3 ++-
>  target/arm/cpu64.c       | 52 ++++++++++++++++++++++++++++++++++------
>  target/arm/monitor.c     |  2 +-
>  tests/arm-cpu-features.c |  1 +
>  4 files changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 13813fb21354..2a1e95e90df3 100644
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
> index d7f5bf610a7d..89a8ae77fe84 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -256,15 +256,23 @@ static void aarch64_a72_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>  }
>  
> -static void cpu_max_get_sve_vq(Object *obj, Visitor *v, const char *name,
> -                               void *opaque, Error **errp)
> +static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> -    visit_type_uint32(v, name, &cpu->sve_max_vq, errp);
> +    uint32_t value;
> +
> +    /* All vector lengths are disabled when SVE is off. */
> +    if (!cpu_isar_feature(aa64_sve, cpu)) {
> +        value = 0;
> +    } else {
> +        value = cpu->sve_max_vq;
> +    }
> +    visit_type_uint32(v, name, &value, errp);
>  }
>  
> -static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
> -                               void *opaque, Error **errp)
> +static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
>      Error *err = NULL;
> @@ -279,6 +287,34 @@ static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
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
> +    t = cpu->isar.id_aa64pfr0;
> +    t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
> +    cpu->isar.id_aa64pfr0 = t;
> +}
> +
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
>   * otherwise, a CPU with as many features enabled as our emulation supports.
>   * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> @@ -391,8 +427,10 @@ static void aarch64_max_initfn(Object *obj)
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
> index 560970de7f5c..2209b27b9a08 100644
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
> -- 
> 2.21.0
> 
> 

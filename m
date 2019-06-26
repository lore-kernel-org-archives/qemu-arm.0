Received: by 2002:adf:a309:0:0:0:0:0 with SMTP id c9csp703557wrb;
        Wed, 26 Jun 2019 03:01:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwuq+rNrjLypp66oyOnVlQ5Ojpr5WbmYUKBAXNhxnf2e8w0/d6zKYgSvZfAprIWLc3OElGv
X-Received: by 2002:a37:6191:: with SMTP id v139mr3054208qkb.374.1561543265990;
        Wed, 26 Jun 2019 03:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561543265; cv=none;
        d=google.com; s=arc-20160816;
        b=Sp66+fZo0ej1gyeXnyNRVJswJfNMWwWi+r54mC+7afBrWYW8imoqQA+6bSWk8oqJz/
         3qtd7tgb+LYbecPvcXxtHoYlnQlRbJO6UQKB7qpIMNICKhpb38M/1KbvWmsRYIOYq3jF
         19SiHZqHz59UU4KQ0mvVcRf3Qr0kKzcvlg0dAJg2UPlSnKL3U1YsUiTOmHfSmLDKBP+w
         YsnFv6bEkyFU26A7J/uapnc9w1Hj7DUbWvX43QqOTG/Dl8XmcrsOXQfjbvUJ21Ccj1xe
         eFXoI7NGfjVkknbB1pCFodp4ehVqiMfUdCU4w0D5Hr//PQQj6DgxvwNH2ZcGicutWOUq
         uqMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=iP5V+lqw3NZsXh/PU+xLbGN+mJjcRCvPslN3DVa+4nw=;
        b=YWdduuAsOZTGleoqBSqsfdXkCtltO6UDnl1gJIm36LVjbFbNyl3hvdgYUlX4DzFe8d
         dRqXE6/pMIjvo/wHEqhSfya56cpd4lPUCFYFBVnSE/R/cihPUeOGtzkH2bIAMHUZbI/9
         tkfH2GTr3OcZV8DOkxL80pFkKvHcNReUHetI6dHJ2jgAS7Y+yAVUAKWh9rIyoYuWbLmn
         yVA0zyGOxK/rLh5Kdc9ixtVDKFh0ryOQO638f2d3cEQpLmga32wI8GM323KVHWhfXt4C
         ZvvrEzaxz/gI5L7EIQnioNW6o458ZMvjk7hfGOP4deoT+hfyC48BX+6RtL1WOT7XlOge
         nE8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f29si11607693qtk.247.2019.06.26.03.01.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 03:01:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07D8B916C0;
	Wed, 26 Jun 2019 10:01:00 +0000 (UTC)
Received: from [10.36.116.89] (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5028D1001B0E;
	Wed, 26 Jun 2019 10:00:56 +0000 (UTC)
Subject: Re: [PATCH v2 06/14] target/arm: Allow SVE to be disabled via a CPU
 property
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com, imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-7-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b93f37cf-0159-39f5-bc25-f951c41a907c@redhat.com>
Date: Wed, 26 Jun 2019 12:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-7-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 26 Jun 2019 10:01:00 +0000 (UTC)
X-TUID: iyO54sDp/168

Hi Drew,

On 6/21/19 6:34 PM, Andrew Jones wrote:
> Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
> a CPU property") we can disable the 'max' cpu model's VFP and neon
> features, but there's no way to disable SVE. Add the 'sve=on|off'
> property to give it that flexibility. We also rename
> cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
> to follow the typical *_get/set_<property-name> pattern.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.c         | 10 +++++-
>  target/arm/cpu64.c       | 72 ++++++++++++++++++++++++++++++++++------
>  target/arm/helper.c      |  8 +++--
>  target/arm/monitor.c     |  2 +-
>  tests/arm-cpu-features.c |  1 +
>  5 files changed, 78 insertions(+), 15 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 858f668d226e..f08e178fc84b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -198,7 +198,7 @@ static void arm_cpu_reset(CPUState *s)
>          env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
>          env->cp15.cptr_el[3] |= CPTR_EZ;
>          /* with maximum vector length */
> -        env->vfp.zcr_el[1] = cpu->sve_max_vq - 1;
> +        env->vfp.zcr_el[1] = cpu->sve_max_vq ? cpu->sve_max_vq - 1 : 0;
>          env->vfp.zcr_el[2] = env->vfp.zcr_el[1];
>          env->vfp.zcr_el[3] = env->vfp.zcr_el[1];
>          /*
> @@ -1129,6 +1129,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->isar.mvfr0 = u;
>      }
>  
> +    if (!cpu->sve_max_vq) {
> +        uint64_t t;
> +
> +        t = cpu->isar.id_aa64pfr0;
> +        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 0);
> +        cpu->isar.id_aa64pfr0 = t;
> +    }
> +
>      if (arm_feature(env, ARM_FEATURE_M) && !cpu->has_dsp) {
>          uint32_t u;
>  
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 946994838d8a..02ada65f240c 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -257,27 +257,75 @@ static void aarch64_a72_initfn(Object *obj)
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
> +    uint32_t value;
>  
> -    visit_type_uint32(v, name, &cpu->sve_max_vq, &err);
> +    visit_type_uint32(v, name, &value, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
>  
> -    if (!err && (cpu->sve_max_vq == 0 || cpu->sve_max_vq > ARM_MAX_VQ)) {
> -        error_setg(&err, "unsupported SVE vector length");
> -        error_append_hint(&err, "Valid sve-max-vq in range [1-%d]\n",
> +    if (!cpu->sve_max_vq) {
> +        error_setg(errp, "cannot set sve-max-vq");
> +        error_append_hint(errp, "SVE has been disabled with sve=off\n");
> +        return;
> +    }
> +
> +    cpu->sve_max_vq = value;
> +
> +    if (cpu->sve_max_vq == 0 || cpu->sve_max_vq > ARM_MAX_VQ) {
> +        error_setg(errp, "unsupported SVE vector length");
> +        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
>                            ARM_MAX_VQ);
>      }
> -    error_propagate(errp, err);
> +}
> +
> +static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    bool value = !!cpu->sve_max_vq;
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
> +
> +    visit_type_bool(v, name, &value, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    if (value) {
> +        /*
> +         * We handle the -cpu <cpu>,sve=off,sve=on case by reinitializing,
> +         * but otherwise we don't do anything as an sve=on could come after
> +         * a sve-max-vq setting.
> +         */
> +        if (!cpu->sve_max_vq) {
> +            cpu->sve_max_vq = ARM_MAX_VQ;> +        }
> +    } else {
> +        cpu->sve_max_vq = 0;
> +    }
>  }
>  
>  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> @@ -373,8 +421,10 @@ static void aarch64_max_initfn(Object *obj)
>  #endif
>  
>          cpu->sve_max_vq = ARM_MAX_VQ;
> -        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
> -                            cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
> +        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
> +                            cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
> +        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> +                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
Wouldn't it be possible to allow 0 as a valid value for sve-max-vq and
interpret this as sve=off?
>      }
>  }
>  
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index edba94004e0b..f500ccb6d31b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5314,9 +5314,13 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
>  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                        uint64_t value)
>  {
> +    ARMCPU *cpu = env_archcpu(env);
>      int cur_el = arm_current_el(env);
> -    int old_len = sve_zcr_len_for_el(env, cur_el);
> -    int new_len;
> +    int old_len, new_len;
> +
> +    assert(cpu->sve_max_vq);
> +
> +    old_len = sve_zcr_len_for_el(env, cur_el);
The comment
    /*
     * Because we arrived here, we know both FP and SVE are enabled;
     * otherwise we would have trapped access to the ZCR_ELn register.
     */
gives the impression we are sure SVE is enabled. So is it mandated to
test sve_max_vq? Otherwise adapt the comment?

Thanks

Eric
>  
>      /* Bits other than [3:0] are RAZ/WI.  */
>      QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 19e3120eef95..157c487a1551 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -90,7 +90,7 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
>  }
>  
>  static const char *cpu_model_advertised_features[] = {
> -    "aarch64", "pmu",
> +    "aarch64", "pmu", "sve",
>      NULL
>  };
>  
> diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> index 31b1c15bb979..509e458e9c2f 100644
> --- a/tests/arm-cpu-features.c
> +++ b/tests/arm-cpu-features.c
> @@ -158,6 +158,7 @@ static void test_query_cpu_model_expansion(const void *data)
>  
>      if (g_str_equal(qtest_get_arch(), "aarch64")) {
>          assert_has_feature(qts, "max", "aarch64");
> +        assert_has_feature(qts, "max", "sve");
>          assert_has_feature(qts, "cortex-a57", "pmu");
>          assert_has_feature(qts, "cortex-a57", "aarch64");
>  
> 

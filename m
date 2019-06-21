Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp866331wrg;
        Fri, 21 Jun 2019 09:55:04 -0700 (PDT)
X-Received: by 2002:a5d:6742:: with SMTP id l2mr34783981wrw.323.1561136104637;
        Fri, 21 Jun 2019 09:55:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561136104; cv=none;
        d=google.com; s=arc-20160816;
        b=xHVua7MRnzDtI/2of1YnfH/zGjrcEkUt2Wqtlig9RR4KTdMlBBqmtkCdqQgLEyFnoh
         ZDTW1rC5oErJoO/kaxltS0mdo7UdODaecrrL6O/NHs1CEELLLnRL9tbTWIWS0Nq0kW6q
         LRGMUkKg90JOTfg8WsrBgXBeEfNR7qzqqMbCwMDpx1x9Q1MZsXqrd/5sybNCCx/nA3LP
         wndgFuoXP2F0Ut+fXE9emrNgKoCUGbI9aYwSxPilUHJZkPXTSVOuQSkCvbB7ucVu0pOo
         ZqC/RmPSq9Vp+KrItZR0PYOOPemZawsCJdJXP6Hzl1cjfj7EHsQBjY1ZLfW4D7JeVMBz
         2CLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=B3cXNPMkQ85M24RjOgjVB/8elmr11voPu9Ti1BakA00=;
        b=F/GgoP7MvfMtSyS4kSS0LD6VTokzb0rBM7FRegFAgdwRS6zKTpJCTBq32fGdlI/ciR
         Va66jic/6mYULSPhorsdbRjE0rOCMtW+fDass/cek3GdAchUQy+VG8Jr0i75j0aGd6va
         zwTBMzv+3R291MCR98niZ9+09crTV9dOG+eaGZd7apfEGH6X3ct8YpnkXgFa+fOlrvYE
         cW5//+iKOYuPkN/OwebJsstjWGUNKNXgdOJaKtEKgNsRxiGhzhNCd5kfDVFQLy+tM8Yb
         ejvLCHv7j/7IM04BparC3KLZgISLt4/efRensFHK19kuGQjnvazBjco/Ix2rTkV4noKH
         FDNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o62sor1893282wma.17.2019.06.21.09.55.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Jun 2019 09:55:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B3cXNPMkQ85M24RjOgjVB/8elmr11voPu9Ti1BakA00=;
        b=hqkB8x2zHriYo4a+w39RAoW+SO65HeLcO1sGoRsrq/VSccEBiVn5ArfEjOt8qQXJ2v
         jYSNy+3LCmlvYp/sEOqFQ79YdxVDg2Dgk5utEJ97ENbEcwYZG4EhfOGJ90Pj6N/psahd
         htHoqpR0gjQLUKX+SiZh7ixmIGxwliCSJVlQXBjtIBt1SnOCQZjpTQLMZCKH53/Pp7dI
         q/qecZuXpWQqwgdgU/kxJ6PEpUFhElune/RlNjx1skfTWlf19dsVq5DaFGVabdxbcQgj
         pH0TEHVi7s4uiNfSujFn8QuyO3cdWDzizH0Ov0ub3WEZmxlQ5Qt3s1Gqsca3f8/5WRhp
         DRZw==
X-Gm-Message-State: APjAAAWaN/Ql5EGoNMJQ9LaaFnS5neOLEQcCST8Q9Xkz5c724CvkElxm
	seFQ7r86KJh5DwyxkpfSr0K8wA==
X-Google-Smtp-Source: APXvYqy0WBPIE/POL0vFh8FdMXRz8d0smOzPUIxHmu+62M08HWx2l1PT7DcPiHa4KamFYPL9SkcMhQ==
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr4991666wmf.60.1561136104380;
        Fri, 21 Jun 2019 09:55:04 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id s3sm4977789wmh.27.2019.06.21.09.55.03
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 09:55:03 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v2 06/14] target/arm: Allow SVE to be
 disabled via a CPU property
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
 alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-7-drjones@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <80cf8467-ac4a-062e-2d50-1cefdf18b532@redhat.com>
Date: Fri, 21 Jun 2019 18:55:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-7-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2+qiT9iGEhUS

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

I don't understand why would someone use that...

For the rest:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +         */
> +        if (!cpu->sve_max_vq) {
> +            cpu->sve_max_vq = ARM_MAX_VQ;
> +        }
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

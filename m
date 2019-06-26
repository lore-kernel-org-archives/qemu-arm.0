Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp73159wru;
        Wed, 26 Jun 2019 06:39:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkj5ueCQ1eHDKALDrfMriB9oRuXHq3J5z6qzuwRN2OSx8aSKw2A3WLnPBsQTI8H7gEibVY
X-Received: by 2002:ac8:29e6:: with SMTP id 35mr3905761qtt.116.1561556349483;
        Wed, 26 Jun 2019 06:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561556349; cv=none;
        d=google.com; s=arc-20160816;
        b=FNIZ7NZKtqVjBlCbv+kBEpLsB0xL6rc75ZiwgsRQoRhLgzEw15QUledfdR48yRlsS2
         QJMGVK7AruyL8ZR4ZFGgu9/+Oj3cRmrCoTqRUC777/dLGxI0HEQ8F5IdrSgYM1x/OjIa
         dbTMHgmZNB/dqj5rtdeho96e3B3PW2I9boU5Zc+2ElAmCThPDV/dqwmpjT53YA5b/iSw
         ZdmT5HG4Wqzb9TAMz8ntgTeDnAJF69H65RTZIqH0Rxn8g87GyFp0v6B/H/XqTrgqV/WP
         m+gOFa7otoLmJ6C8wNnGVShwkaohANFLu3JzCe0Wh5x1OzJ+Cd38FpSR35N+rQvp909y
         03bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=+6Z7WJxfVLOHPIDnUDvVDKtLcTZCL1TqroJ+EAmHZsA=;
        b=SA3LZTvofMEwmgt9a+oqIdsnJN6XRbuNYmW8j+FjaxQwvAucGSWdNyU1KU7Co9ohFl
         9aR3Me95Vj+hnMFF4BDCe2ebVY4rknsHs6LHzTWOn7/lHP1aVuXq7riftAjlCZtFzNIu
         J7AKuVBJAuxnfS+KQnB9fJyNBmZx2Tk1rU4BYI3Z4Gm8kXyMb1mMzcuRDOakILGwN0q9
         hspb7xkGRrLB5XHomLp7QHxUSw+WFeQCwLgtuUfvqOPGIWZCywgywyF1EKMPCpI83VR/
         fZBgOth3SMemYhGEYMV6jIUYFUl4UNp5kZygbhentbu2+C/1g7KNZpToE6SdZa+h+PSv
         b1cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d6si11836578qki.325.2019.06.26.06.39.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 06:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8137830BBE97;
	Wed, 26 Jun 2019 13:38:58 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2573D60BE5;
	Wed, 26 Jun 2019 13:38:52 +0000 (UTC)
Date: Wed, 26 Jun 2019 15:38:50 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 06/14] target/arm: Allow SVE to be
 disabled via a CPU property
Message-ID: <20190626133850.kxhco6gofohhbgn2@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-7-drjones@redhat.com>
 <b93f37cf-0159-39f5-bc25-f951c41a907c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b93f37cf-0159-39f5-bc25-f951c41a907c@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 26 Jun 2019 13:38:58 +0000 (UTC)
X-TUID: 0LxIcM3Yu4hr

On Wed, Jun 26, 2019 at 12:00:54PM +0200, Auger Eric wrote:
> Hi Drew,
> 
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
> > a CPU property") we can disable the 'max' cpu model's VFP and neon
> > features, but there's no way to disable SVE. Add the 'sve=on|off'
> > property to give it that flexibility. We also rename
> > cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
> > to follow the typical *_get/set_<property-name> pattern.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/cpu.c         | 10 +++++-
> >  target/arm/cpu64.c       | 72 ++++++++++++++++++++++++++++++++++------
> >  target/arm/helper.c      |  8 +++--
> >  target/arm/monitor.c     |  2 +-
> >  tests/arm-cpu-features.c |  1 +
> >  5 files changed, 78 insertions(+), 15 deletions(-)
> > 
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 858f668d226e..f08e178fc84b 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -198,7 +198,7 @@ static void arm_cpu_reset(CPUState *s)
> >          env->cp15.cpacr_el1 = deposit64(env->cp15.cpacr_el1, 16, 2, 3);
> >          env->cp15.cptr_el[3] |= CPTR_EZ;
> >          /* with maximum vector length */
> > -        env->vfp.zcr_el[1] = cpu->sve_max_vq - 1;
> > +        env->vfp.zcr_el[1] = cpu->sve_max_vq ? cpu->sve_max_vq - 1 : 0;
> >          env->vfp.zcr_el[2] = env->vfp.zcr_el[1];
> >          env->vfp.zcr_el[3] = env->vfp.zcr_el[1];
> >          /*
> > @@ -1129,6 +1129,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >          cpu->isar.mvfr0 = u;
> >      }
> >  
> > +    if (!cpu->sve_max_vq) {
> > +        uint64_t t;
> > +
> > +        t = cpu->isar.id_aa64pfr0;
> > +        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 0);
> > +        cpu->isar.id_aa64pfr0 = t;
> > +    }
> > +
> >      if (arm_feature(env, ARM_FEATURE_M) && !cpu->has_dsp) {
> >          uint32_t u;
> >  
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 946994838d8a..02ada65f240c 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -257,27 +257,75 @@ static void aarch64_a72_initfn(Object *obj)
> >      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
> >  }
> >  
> > -static void cpu_max_get_sve_vq(Object *obj, Visitor *v, const char *name,
> > -                               void *opaque, Error **errp)
> > +static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
> > +                                   void *opaque, Error **errp)
> >  {
> >      ARMCPU *cpu = ARM_CPU(obj);
> >      visit_type_uint32(v, name, &cpu->sve_max_vq, errp);
> >  }
> >  
> > -static void cpu_max_set_sve_vq(Object *obj, Visitor *v, const char *name,
> > -                               void *opaque, Error **errp)
> > +static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
> > +                                   void *opaque, Error **errp)
> >  {
> >      ARMCPU *cpu = ARM_CPU(obj);
> >      Error *err = NULL;
> > +    uint32_t value;
> >  
> > -    visit_type_uint32(v, name, &cpu->sve_max_vq, &err);
> > +    visit_type_uint32(v, name, &value, &err);
> > +    if (err) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> >  
> > -    if (!err && (cpu->sve_max_vq == 0 || cpu->sve_max_vq > ARM_MAX_VQ)) {
> > -        error_setg(&err, "unsupported SVE vector length");
> > -        error_append_hint(&err, "Valid sve-max-vq in range [1-%d]\n",
> > +    if (!cpu->sve_max_vq) {
> > +        error_setg(errp, "cannot set sve-max-vq");
> > +        error_append_hint(errp, "SVE has been disabled with sve=off\n");
> > +        return;
> > +    }
> > +
> > +    cpu->sve_max_vq = value;
> > +
> > +    if (cpu->sve_max_vq == 0 || cpu->sve_max_vq > ARM_MAX_VQ) {
> > +        error_setg(errp, "unsupported SVE vector length");
> > +        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
> >                            ARM_MAX_VQ);
> >      }
> > -    error_propagate(errp, err);
> > +}
> > +
> > +static void cpu_arm_get_sve(Object *obj, Visitor *v, const char *name,
> > +                            void *opaque, Error **errp)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +    bool value = !!cpu->sve_max_vq;
> > +
> > +    visit_type_bool(v, name, &value, errp);
> > +}
> > +
> > +static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
> > +                            void *opaque, Error **errp)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +    Error *err = NULL;
> > +    bool value;
> > +
> > +    visit_type_bool(v, name, &value, &err);
> > +    if (err) {
> > +        error_propagate(errp, err);
> > +        return;
> > +    }
> > +
> > +    if (value) {
> > +        /*
> > +         * We handle the -cpu <cpu>,sve=off,sve=on case by reinitializing,
> > +         * but otherwise we don't do anything as an sve=on could come after
> > +         * a sve-max-vq setting.
> > +         */
> > +        if (!cpu->sve_max_vq) {
> > +            cpu->sve_max_vq = ARM_MAX_VQ;> +        }
> > +    } else {
> > +        cpu->sve_max_vq = 0;
> > +    }
> >  }
> >  
> >  /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> > @@ -373,8 +421,10 @@ static void aarch64_max_initfn(Object *obj)
> >  #endif
> >  
> >          cpu->sve_max_vq = ARM_MAX_VQ;
> > -        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
> > -                            cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
> > +        object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
> > +                            cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
> > +        object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> > +                            cpu_arm_set_sve, NULL, NULL, &error_fatal);
> Wouldn't it be possible to allow 0 as a valid value for sve-max-vq and
> interpret this as sve=off?

No, because it wouldn't be a very nice interface considering all other cpu
features are enabled/disabled with booleans, all the sve<vl-bits>
properties are in vl-bits rather than vq's - so it'd be nicer to just
forget about sve-max-vq altogether, and indeed it wouldn't work for cpu
'host', because that cpu type doesn't have the sve-max-vq property at all.

> >      }
> >  }
> >  
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index edba94004e0b..f500ccb6d31b 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -5314,9 +5314,13 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
> >  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                        uint64_t value)
> >  {
> > +    ARMCPU *cpu = env_archcpu(env);
> >      int cur_el = arm_current_el(env);
> > -    int old_len = sve_zcr_len_for_el(env, cur_el);
> > -    int new_len;
> > +    int old_len, new_len;
> > +
> > +    assert(cpu->sve_max_vq);
> > +
> > +    old_len = sve_zcr_len_for_el(env, cur_el);
> The comment
>     /*
>      * Because we arrived here, we know both FP and SVE are enabled;
>      * otherwise we would have trapped access to the ZCR_ELn register.
>      */
> gives the impression we are sure SVE is enabled. So is it mandated to
> test sve_max_vq? Otherwise adapt the comment?

Nope, it's not mandatory, that was just some extra paranoia I can remove
now.

Thanks,
drew

> 
> Thanks
> 
> Eric
> >  
> >      /* Bits other than [3:0] are RAZ/WI.  */
> >      QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> > diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> > index 19e3120eef95..157c487a1551 100644
> > --- a/target/arm/monitor.c
> > +++ b/target/arm/monitor.c
> > @@ -90,7 +90,7 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
> >  }
> >  
> >  static const char *cpu_model_advertised_features[] = {
> > -    "aarch64", "pmu",
> > +    "aarch64", "pmu", "sve",
> >      NULL
> >  };
> >  
> > diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> > index 31b1c15bb979..509e458e9c2f 100644
> > --- a/tests/arm-cpu-features.c
> > +++ b/tests/arm-cpu-features.c
> > @@ -158,6 +158,7 @@ static void test_query_cpu_model_expansion(const void *data)
> >  
> >      if (g_str_equal(qtest_get_arch(), "aarch64")) {
> >          assert_has_feature(qts, "max", "aarch64");
> > +        assert_has_feature(qts, "max", "sve");
> >          assert_has_feature(qts, "cortex-a57", "pmu");
> >          assert_has_feature(qts, "cortex-a57", "aarch64");
> >  
> > 
> 

Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp184909lff;
        Thu, 12 Aug 2021 02:25:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjOo+BItXOYoTSvSMVMevgs7ZES1olgkv0/c3Fcnfu1i5qw7PwMhht8JauTOFBalYfOD+A
X-Received: by 2002:a25:c08a:: with SMTP id c132mr3073359ybf.126.1628760349220;
        Thu, 12 Aug 2021 02:25:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628760349; cv=none;
        d=google.com; s=arc-20160816;
        b=H3EV5Kwxyzcn+B8Ix+bLowvin6sWL8zrFYHNzyZ88ICwJBLTVFk/CbRHZJx74syYuh
         F4mAJL1hV1XOsuWp98oeLojn6eOf2pFE+BciYwOrjnl0VHxKUcaF43JRGBGiIEblRuSs
         Xi/tCg4pYikL4QtVTwt9AhLKRVjdikLERhHZpLlZLBXtq5boZ3zU9KJSFmWpQWFTxgjR
         WZSZIrw9iVX1M5OST8348Pyf0S5yUYQC1VZIlVOm7/LZhGl487s53rxvTBdbp6wF7m4x
         hxYziw0DjEOmEylywNuvb9g67b/3Rinjymclo/ZpK5bXZEiIcWXrqc/lrSa8+GUr4F6Z
         wa/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=eq5bUhbVDw1gxI6SRv+Y3L72nrh9qHBBu1x7subwXpo=;
        b=mCNmndvM+62aqkTyssDhJSMdsPpLIpD6F088GveEQI33M8V/aopf3qWmYQ9a8Rrr3+
         R9EWsSFmYyVe9mvXULnxPz6dL91VOPZ10TLHImBhXyurMB2Z9S0UIO7/foCYzALR7von
         h0NQTsX9KZNRmeUZnrHQikFNifW4dYX1mL+MhCYRj4MduwSySy6CK1BBnHCN0bF6Keh8
         vMMqIljoPF+4iD9JmIMka9DgLutP+6RXSvz2XSkLqrtKUWdPUMYzJRo9RhWYaz8/l05+
         BVZl8aAudHR+2Rw00cqM3fErm/47cdWOjsPzdwbVUFEjYGW/2j0waEVdY8urUfEWCb02
         aSlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QNLBTSLH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l64si2661179ybc.31.2021.08.12.02.25.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:25:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QNLBTSLH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE6yC-0002w3-Hl
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mE6xp-0002dz-7I
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:25:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mE6xn-00005l-7y
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628760322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eq5bUhbVDw1gxI6SRv+Y3L72nrh9qHBBu1x7subwXpo=;
 b=QNLBTSLHsCr334w0i4dydWeB3yEHbJqWWTMWwG4K4zXLUlym5FeNIffHIEqH7k/nNLTt47
 e7BUFy0fqXNhk2c+UloIoOQhaBslHjBYp5vHH+JQ8UtUP0jSOepDl+NIWT3gVMRW4EsZFi
 0EgAU2c83rw3EyzMjlL4yEfG1dHpIzE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-mazgQvJQOgWt7EHCpkhSvA-1; Thu, 12 Aug 2021 05:25:21 -0400
X-MC-Unique: mazgQvJQOgWt7EHCpkhSvA-1
Received: by mail-ed1-f69.google.com with SMTP id
 dh21-20020a0564021d35b02903be0aa37025so2768964edb.7
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eq5bUhbVDw1gxI6SRv+Y3L72nrh9qHBBu1x7subwXpo=;
 b=DgW4vyzeMGm229ybXsd2N7Wp/2RVZ4qG/UwmVmZwvaIiSHMewEhIj8JK5T2iYtPOwe
 /UwfAn1t9aUnQ7qYPMwJ2tD0EHm4OjajTsIGFDe+//fEdHMc/F5/FYJad3/OwpUqEhMo
 Z1qtwxWVXcR5KTZ+yM25xeikC1HI7eKGnoThp8VObuFcOEXwZqJ5blWwppwVGG4pmsQw
 i2+oK/Mr7zy2z5ARJg9qstB1+xjoFETf2Ftfp7JZJj9Hz+qBFI+hez9k/M1y9BH2jRMU
 GxCGrocZ3exMecarNLfRdZrzAzcNdwfvbETJT7Jxex2GC3tltXbIS6wvVnfBPm1/qvrJ
 bcFA==
X-Gm-Message-State: AOAM530a+8aQme85MXGOUGK1CC6DSbaHYbbnPnPdlBN7J/+vzgYAdJn2
 An2svinSLp3DspJ96dOYzJ8K4q8iX9zw5ZsiexLo4tpJ6S3gvyb6IenCFRayyYotIJYmJEPPecW
 zw+TdXBGXM2Wn
X-Received: by 2002:a17:906:fb91:: with SMTP id
 lr17mr2756334ejb.110.1628760319945; 
 Thu, 12 Aug 2021 02:25:19 -0700 (PDT)
X-Received: by 2002:a17:906:fb91:: with SMTP id
 lr17mr2756318ejb.110.1628760319692; 
 Thu, 12 Aug 2021 02:25:19 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id q5sm847958edt.50.2021.08.12.02.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:25:19 -0700 (PDT)
Date: Thu, 12 Aug 2021 11:25:17 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210812092517.mwcfhksoe4cgy3cl@gator.home>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
MIME-Version: 1.0
In-Reply-To: <20210812091650.i5np3szvdoelu2cx@gator.home>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NHjFbGEff49Q

On Thu, Aug 12, 2021 at 11:16:50AM +0200, Andrew Jones wrote:
> On Thu, Aug 12, 2021 at 03:04:38PM +0900, Shuuichirou Ishii wrote:
> > Add a definition for the Fujitsu A64FX processor.
> > 
> > The A64FX processor does not implement the AArch32 Execution state,
> > so there are no associated AArch32 Identification registers.
> > 
> > For SVE, the A64FX processor supports only 128,256 and 512bit vector lengths.
> > 
> > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > ---
> >  target/arm/cpu.c   | 27 +++++++++++++++++++++++----
> >  target/arm/cpu.h   |  1 +
> >  target/arm/cpu64.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 66 insertions(+), 4 deletions(-)
> > 
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 2866dd7658..162e46afc3 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1345,15 +1345,34 @@ static void arm_cpu_finalizefn(Object *obj)
> >  #endif
> >  }
> >  
> > +static void a64fx_cpu_set_sve(ARMCPU *cpu)
> > +{
> > +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> > +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> > +    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> > +    set_bit(0, cpu->sve_vq_map); /* 128bit */
> > +    set_bit(0, cpu->sve_vq_init);
> > +    set_bit(1, cpu->sve_vq_map); /* 256bit */
> > +    set_bit(1, cpu->sve_vq_init);
> > +    set_bit(3, cpu->sve_vq_map); /* 512bit */
> > +    set_bit(3, cpu->sve_vq_init);
> > +
> > +    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
> > +}
> > +
> >  void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
> >  {
> >      Error *local_err = NULL;
> >  
> >      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> > -        arm_cpu_sve_finalize(cpu, &local_err);
> > -        if (local_err != NULL) {
> > -            error_propagate(errp, local_err);
> > -            return;
> > +        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> > +            a64fx_cpu_set_sve(cpu);
> > +        } else {
> > +            arm_cpu_sve_finalize(cpu, &local_err);
> > +            if (local_err != NULL) {
> > +                error_propagate(errp, local_err);
> > +                return;
> > +            }
> >          }
> >  
> >          /*
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 9f0a5f84d5..84ebca731a 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -2145,6 +2145,7 @@ enum arm_features {
> >      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
> >      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> >      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> > +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
> >  };
> >  
> >  static inline int arm_feature(CPUARMState *env, int feature)
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index c690318a9b..5e7e885f9d 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -847,10 +847,52 @@ static void aarch64_max_initfn(Object *obj)
> >                          cpu_max_set_sve_max_vq, NULL, NULL);
> >  }
> >  
> > +static void aarch64_a64fx_initfn(Object *obj)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    cpu->dtb_compatible = "arm,a64fx";
> > +    set_feature(&cpu->env, ARM_FEATURE_A64FX);
> > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > +    cpu->midr = 0x461f0010;
> > +    cpu->revidr = 0x00000000;
> > +    cpu->ctr = 0x86668006;
> > +    cpu->reset_sctlr = 0x30000180;
> > +    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS Extensions */
> > +    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
> > +    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> > +    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> > +    cpu->id_aa64afr0 = 0x0000000000000000;
> > +    cpu->id_aa64afr1 = 0x0000000000000000;
> > +    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
> > +    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
> > +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> > +    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> > +    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> > +    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> > +    cpu->clidr = 0x0000000080000023;
> > +    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
> > +    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
> > +    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
> > +    cpu->dcz_blocksize = 6; /* 256 bytes */
> > +    cpu->gic_num_lrs = 4;
> > +    cpu->gic_vpribits = 5;
> > +    cpu->gic_vprebits = 5;
> > +
> > +    /* TODO:  Add A64FX specific HPC extension registers */
> > +}
> > +
> >  static const ARMCPUInfo aarch64_cpus[] = {
> >      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
> >      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
> >      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> > +    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
> >      { .name = "max",                .initfn = aarch64_max_initfn },
> >  };
> >  
> > -- 
> > 2.27.0
> >
> 
> For the SVE related bits
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>

On second thought, do we want the QMP CPU model expansion query to show
that this CPU type has sve,sve128,sve256,sve512? If so, then our SVE work
isn't complete, because we need those properties, set true by default, but
forbidden from changing.

Thanks,
drew


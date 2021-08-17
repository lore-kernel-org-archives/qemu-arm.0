Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp445843lfg;
        Tue, 17 Aug 2021 04:56:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7WlYTTazRgPVTIpaNMWe7A+Db47vsNY35b2NSS8SCFSTsGAlOCpi3ipXJeqNSnVpt6eX/
X-Received: by 2002:a6b:905:: with SMTP id t5mr2587536ioi.209.1629201415303;
        Tue, 17 Aug 2021 04:56:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629201415; cv=none;
        d=google.com; s=arc-20160816;
        b=RA1vr+16y3ZlN3l3jqurJkR2/JhwSXtwALJrg2gfI+Iozzc9tDuzft+tOOEfHdWHzm
         +ye9fXU+33oBGiYOM0sXYkPHQR6objnk54vmxuf7O9eEGDonHevjbFT4JyHsecuS00Tm
         n0af1Gq3DA96efgAr22LanZBBTipctkucIXcpplxXj7tSSMcGMqG8wbMhunEe3M6WLhS
         Frh51p7rk96fhXueDhwiSdnpxG6PEG4XDpxzJ7+O42ZUbzRThod5Qd8vm/vSHzSVCCPR
         wIoBgIfCgaVQgDF0YU2EdA9rL9Gr+FNoSg9FWF44VKiHta1WksElWCUTWfTxPr1/3Ex9
         6DEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=84XyAtvJyFLdp7jlKAii+jMH1a2ynH5yrczc5XEe0uU=;
        b=yYvKJ/cOfKaBbFARVfIWWCRUHCwsJX3L4jXFYJC69I87uVU7IwcRVL0PdpffVX93qQ
         hQKOpBaq5Xo2T8T1HvrJ1atwAoHwHqInNmOhK6T+oxozIO+gsP1RTGK1GI7+6Lc7hQfF
         zpYBSr3Tjk+F6G8tBnDkxyGsgAjx11qUyVWPd81kPQozusqCVrlp9JCEG7ww84fhoSuT
         7rt/nGTpKx+FZ7Dz6Bv7aG/6oUbyK138XzwWzZpreruhDaROP8HYITRP5IMWPGzX7kaR
         JDp74LqjISv/CMCxPMrWErc7X6fk2WKI02sVIjPzwOquww1Pw1sZWaRM0XuzGyCAQWWm
         m9LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DKLxlhRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p76si2502075iod.9.2021.08.17.04.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 04:56:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DKLxlhRp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFxiA-000720-Hc
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 07:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFxi0-00070V-ET
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 07:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFxhx-0003cf-3z
 for qemu-arm@nongnu.org; Tue, 17 Aug 2021 07:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629201400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=84XyAtvJyFLdp7jlKAii+jMH1a2ynH5yrczc5XEe0uU=;
 b=DKLxlhRphob20wqqgtWuzq4ndf6ifo6v4nhtudgnpe5u7TQjNRWY5Ns6a07qZAd+1BFTwp
 2kXde0tRcoPhnlxdb3MLuJdXPZTf9jqNdCx1gNk1t4U916rKKDQqL0NqS9hRG1usGpD0oW
 L1E6pVchWk7gnruFRoMeoqoBBZI5ToM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-eoje8sq5MXGYnDBMMP7UXg-1; Tue, 17 Aug 2021 07:56:39 -0400
X-MC-Unique: eoje8sq5MXGYnDBMMP7UXg-1
Received: by mail-ed1-f71.google.com with SMTP id
 di3-20020a056402318300b003bebf0828a2so6433530edb.8
 for <qemu-arm@nongnu.org>; Tue, 17 Aug 2021 04:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=84XyAtvJyFLdp7jlKAii+jMH1a2ynH5yrczc5XEe0uU=;
 b=Sl5SigSlwySKz7JwfhqGv1BufrxAfllwPEcbAiKkGI9xPmTk/X1GFt0Yo5ocXHEhtP
 BZcfHF7MnegW19nLCTHhBYSvDeOXX2rpA//gXmS8CnW2mbsAN0cfcCy2Eq0X0Vd0sgHk
 xsDCcliI2Fp5BoJDkhuI4mQ17Y05+jJu1W/xAxFIN7zjqnzcM1wG2b9fuAsBNnZM2tI5
 morsBr32PKyESAILbq9dTSz3UIWSehw080li3Dg46Sd3OVpXXGzwurLBBniJEe1mwlW9
 7/wvSLGU/oJ3puLYhwYcyZm4j2z3e7il6oNDv8vaerK7HRNg6nNLGOtSNsGdvIbGLWSX
 +9Gw==
X-Gm-Message-State: AOAM5331pKfmcT9GK3VaMiy2wYtTCuUMGRTnDB2uQ90tFFWJeqlvSwHI
 0zehlmJNqqqBxvm3N717tpYBnXFltpIZaERmNOSYUTfuwwYHy0FPDEqKrINRjI25XnNw6EpnZPH
 EhrSsJ1N9XAKY
X-Received: by 2002:a05:6402:649:: with SMTP id
 u9mr3675632edx.224.1629201398210; 
 Tue, 17 Aug 2021 04:56:38 -0700 (PDT)
X-Received: by 2002:a05:6402:649:: with SMTP id
 u9mr3675604edx.224.1629201397850; 
 Tue, 17 Aug 2021 04:56:37 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id hg25sm682427ejc.109.2021.08.17.04.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 04:56:37 -0700 (PDT)
Date: Tue, 17 Aug 2021 13:56:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Message-ID: <20210817115635.d2wxvnvis5kupegh@gator.home>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
 <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.7, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C8fM4WXGONZW

On Tue, Aug 17, 2021 at 06:43:58AM +0000, ishii.shuuichir@fujitsu.com wrote:
> 
> > On Thu, 12 Aug 2021 at 10:25, Andrew Jones <drjones@redhat.com> wrote:
> > > On second thought, do we want the QMP CPU model expansion query to
> > > show that this CPU type has sve,sve128,sve256,sve512? If so, then our
> > > SVE work isn't complete, because we need those properties, set true by
> > > default, but forbidden from changing.
> > 
> > Do we have precedent elsewhere (arm, x86, wherever) for "this CPU object
> > exposes these properties as constant unwriteable" ?
> 
> We have not yet conducted a confirmation of Peter's question, but...
> 
> > On second thought, do we want the QMP CPU model expansion query to show that
> > this CPU type has sve,sve128,sve256,sve512? If so, then our SVE work isn't
> > complete, because we need those properties, set true by default, but forbidden
> > from changing.
> 
> Based on Andrew's comment, 
> We have created a patch based on v4 that works as intended in QMP.
> 
> ----------
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 162e46afc3..2d9f779cb6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1345,29 +1345,12 @@ static void arm_cpu_finalizefn(Object *obj)
>  #endif
>  }
> 
> -static void a64fx_cpu_set_sve(ARMCPU *cpu)
> -{
> -    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> -    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> -    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> -    set_bit(0, cpu->sve_vq_map); /* 128bit */
> -    set_bit(0, cpu->sve_vq_init);
> -    set_bit(1, cpu->sve_vq_map); /* 256bit */
> -    set_bit(1, cpu->sve_vq_init);
> -    set_bit(3, cpu->sve_vq_map); /* 512bit */
> -    set_bit(3, cpu->sve_vq_init);
> -
> -    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
> -}
> -
>  void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>  {
>      Error *local_err = NULL;
> 
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> -            a64fx_cpu_set_sve(cpu);
> -        } else {
> +        if (!arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
>              arm_cpu_sve_finalize(cpu, &local_err);
>              if (local_err != NULL) {
>                  error_propagate(errp, local_err);
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 5e7e885f9d..1ec2a7c6da 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -847,6 +847,23 @@ static void aarch64_max_initfn(Object *obj)
>                          cpu_max_set_sve_max_vq, NULL, NULL);
>  }
> 
> +static void a64fx_cpu_set_sve(Object *obj)
> +{
> +    int i;
> +    Error *errp = NULL;
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    const char *vl[] = {"sve128", "sve256", "sve512"};
> +
> +    for(i = 0; i <sizeof(vl)/sizeof(vl[0]); i++){
> +        object_property_add(obj, vl[i], "bool", cpu_arm_get_sve_vq,
> +                            cpu_arm_set_sve_vq, NULL, NULL);
> +        object_property_set_bool(obj, vl[i], true, &errp);
> +    }
> +
> +    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
> +}
> +
>  static void aarch64_a64fx_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> @@ -885,6 +902,9 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
> 
> +    /* Set SVE properties */
> +    a64fx_cpu_set_sve(obj);
> +
>      /* TODO:  Add A64FX specific HPC extension registers */
>  }
> ----------
> 
> In the case of the patch above,
> it is possible to identify only the SVE vector length supported by A64FX from QMP, 
> as shown in the following result.
> 
> ----------
> Welcome to the QMP low-level shell!
> Connected to QEMU 6.0.93
> 
> (QEMU) query-cpu-model-expansion type=full model={"name":"a64fx"}
> {"return": {"model": {"name": "a64fx", "props": {"sve128": true, "sve256": true, "sve512": true, "aarch64": true, "pmu": true}}}}
> (QEMU)
> ----------
> 
> How about this kind of fix?

This looks reasonable to me, but you also need the 'sve' property that
states sve in supported at all.

> However, by allowing the sve128, sve256, and sve512 properties to be specified, 
> the user can explicitly change the settings (ex: sve128=off), 
> but the only properties that can be set is the vector length supported by A64FX. 
> We personally think this is a no problem.

I guess it's fine. You could easily create a new cpu_arm_set_sve_vq()
which would forbid changing the properties if you wanted to, but then
we need to answer Peter's question in order to see if there's a
precedent for that type of property.

Thanks,
drew

> 
> We would appreciate your comments.
> 
> Best regards.
> 
> > -----Original Message-----
> > From: Andrew Jones <drjones@redhat.com>
> > Sent: Thursday, August 12, 2021 6:25 PM
> > To: Ishii, Shuuichirou/石井 周一郎 <ishii.shuuichir@fujitsu.com>
> > Cc: peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> > Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
> > 
> > On Thu, Aug 12, 2021 at 11:16:50AM +0200, Andrew Jones wrote:
> > > On Thu, Aug 12, 2021 at 03:04:38PM +0900, Shuuichirou Ishii wrote:
> > > > Add a definition for the Fujitsu A64FX processor.
> > > >
> > > > The A64FX processor does not implement the AArch32 Execution state,
> > > > so there are no associated AArch32 Identification registers.
> > > >
> > > > For SVE, the A64FX processor supports only 128,256 and 512bit vector
> > lengths.
> > > >
> > > > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > > > ---
> > > >  target/arm/cpu.c   | 27 +++++++++++++++++++++++----
> > > >  target/arm/cpu.h   |  1 +
> > > >  target/arm/cpu64.c | 42
> > ++++++++++++++++++++++++++++++++++++++++++
> > > >  3 files changed, 66 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/target/arm/cpu.c b/target/arm/cpu.c index
> > > > 2866dd7658..162e46afc3 100644
> > > > --- a/target/arm/cpu.c
> > > > +++ b/target/arm/cpu.c
> > > > @@ -1345,15 +1345,34 @@ static void arm_cpu_finalizefn(Object *obj)
> > > > #endif  }
> > > >
> > > > +static void a64fx_cpu_set_sve(ARMCPU *cpu) {
> > > > +    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> > > > +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> > > > +    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> > > > +    set_bit(0, cpu->sve_vq_map); /* 128bit */
> > > > +    set_bit(0, cpu->sve_vq_init);
> > > > +    set_bit(1, cpu->sve_vq_map); /* 256bit */
> > > > +    set_bit(1, cpu->sve_vq_init);
> > > > +    set_bit(3, cpu->sve_vq_map); /* 512bit */
> > > > +    set_bit(3, cpu->sve_vq_init);
> > > > +
> > > > +    cpu->sve_max_vq = find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ)
> > +
> > > > +1; }
> > > > +
> > > >  void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)  {
> > > >      Error *local_err = NULL;
> > > >
> > > >      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> > > > -        arm_cpu_sve_finalize(cpu, &local_err);
> > > > -        if (local_err != NULL) {
> > > > -            error_propagate(errp, local_err);
> > > > -            return;
> > > > +        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> > > > +            a64fx_cpu_set_sve(cpu);
> > > > +        } else {
> > > > +            arm_cpu_sve_finalize(cpu, &local_err);
> > > > +            if (local_err != NULL) {
> > > > +                error_propagate(errp, local_err);
> > > > +                return;
> > > > +            }
> > > >          }
> > > >
> > > >          /*
> > > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h index
> > > > 9f0a5f84d5..84ebca731a 100644
> > > > --- a/target/arm/cpu.h
> > > > +++ b/target/arm/cpu.h
> > > > @@ -2145,6 +2145,7 @@ enum arm_features {
> > > >      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
> > > >      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> > > >      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later
> > > > */
> > > > +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
> > > >  };
> > > >
> > > >  static inline int arm_feature(CPUARMState *env, int feature) diff
> > > > --git a/target/arm/cpu64.c b/target/arm/cpu64.c index
> > > > c690318a9b..5e7e885f9d 100644
> > > > --- a/target/arm/cpu64.c
> > > > +++ b/target/arm/cpu64.c
> > > > @@ -847,10 +847,52 @@ static void aarch64_max_initfn(Object *obj)
> > > >                          cpu_max_set_sve_max_vq, NULL, NULL);  }
> > > >
> > > > +static void aarch64_a64fx_initfn(Object *obj) {
> > > > +    ARMCPU *cpu = ARM_CPU(obj);
> > > > +
> > > > +    cpu->dtb_compatible = "arm,a64fx";
> > > > +    set_feature(&cpu->env, ARM_FEATURE_A64FX);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > > > +    cpu->midr = 0x461f0010;
> > > > +    cpu->revidr = 0x00000000;
> > > > +    cpu->ctr = 0x86668006;
> > > > +    cpu->reset_sctlr = 0x30000180;
> > > > +    cpu->isar.id_aa64pfr0 =   0x0000000101111111; /* No RAS
> > Extensions */
> > > > +    cpu->isar.id_aa64pfr1 = 0x0000000000000000;
> > > > +    cpu->isar.id_aa64dfr0 = 0x0000000010305408;
> > > > +    cpu->isar.id_aa64dfr1 = 0x0000000000000000;
> > > > +    cpu->id_aa64afr0 = 0x0000000000000000;
> > > > +    cpu->id_aa64afr1 = 0x0000000000000000;
> > > > +    cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
> > > > +    cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
> > > > +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> > > > +    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> > > > +    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> > > > +    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> > > > +    cpu->clidr = 0x0000000080000023;
> > > > +    cpu->ccsidr[0] = 0x7007e01c; /* 64KB L1 dcache */
> > > > +    cpu->ccsidr[1] = 0x2007e01c; /* 64KB L1 icache */
> > > > +    cpu->ccsidr[2] = 0x70ffe07c; /* 8MB L2 cache */
> > > > +    cpu->dcz_blocksize = 6; /* 256 bytes */
> > > > +    cpu->gic_num_lrs = 4;
> > > > +    cpu->gic_vpribits = 5;
> > > > +    cpu->gic_vprebits = 5;
> > > > +
> > > > +    /* TODO:  Add A64FX specific HPC extension registers */ }
> > > > +
> > > >  static const ARMCPUInfo aarch64_cpus[] = {
> > > >      { .name = "cortex-a57",         .initfn = aarch64_a57_initfn },
> > > >      { .name = "cortex-a53",         .initfn = aarch64_a53_initfn },
> > > >      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
> > > > +    { .name = "a64fx",              .initfn = aarch64_a64fx_initfn },
> > > >      { .name = "max",                .initfn = aarch64_max_initfn },
> > > >  };
> > > >
> > > > --
> > > > 2.27.0
> > > >
> > >
> > > For the SVE related bits
> > >
> > > Reviewed-by: Andrew Jones <drjones@redhat.com>
> > 
> > On second thought, do we want the QMP CPU model expansion query to show that
> > this CPU type has sve,sve128,sve256,sve512? If so, then our SVE work isn't
> > complete, because we need those properties, set true by default, but forbidden
> > from changing.
> > 
> > Thanks,
> > drew
> 


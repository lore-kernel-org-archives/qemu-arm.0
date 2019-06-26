Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp45178wru;
        Wed, 26 Jun 2019 06:11:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy0COmePgE0du9lYP6ipLEXiyeJF2HIjJUvBCd4b7YpIzFV/hFCNPpNyOPaOxAtQyyKMEyE
X-Received: by 2002:a05:620a:687:: with SMTP id f7mr3835619qkh.238.1561554697601;
        Wed, 26 Jun 2019 06:11:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561554697; cv=none;
        d=google.com; s=arc-20160816;
        b=XTAEmxSsIEZmCZX0x1S8DuQFgNAOAzZ49gCSSeNC5HoP7EVGQpYXQzcXx0PV8RMZTv
         P3rEL/TMmJCUJy668EAl4SmFu2CeNTO6Jvfcu2jqx8YCOKZAZEeql5hq6hlOFJxuLMDR
         I3bwn2i0OaDyRX3jRwafpUrQxGOhn48oPsAts+LE1wj8PFYLtKq4HvzlcMQKYvCVxUQg
         79Ecj56rrURlB3HZWVQfKwaBrTjtD7ecblzGwNxcXPNRI5x1KQkrTiUzejXCVKUJXwKP
         FShnjNaQPon9r3sacwQJeqqCnHz/S42GsfDEYg3fxzu698k59DT5Fkp/LyTk+wud43L8
         yvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=Bxqtnl3zqs25e90K76NnP9Lc52qvn0mttIg8CRuZItc=;
        b=b/N8p0u1l4ONljiLjNS+kn8lYxkcmh3FdvmSPnWZQyGYSa8xMf2TFnIjyrZn4xfM+h
         Q2ZJi5I2Nb35Ekhzv0jBy5pFWAqvm6Q7ybY34L6F+1y2rZ+fQB2q5qoltrcQnmlT/1N6
         67/lM6zdbNLXcmWapZRFuKlN2ZWcqgDTZ43tNEMzlchsLkICkTkarHG9B6Zx26l5Y2o0
         aXHDYwX/9x0I/yekAqpqf8jl2c0xjeosyEPFDdksITLn+OrD3dpuWBLFB19iFD/z9fUW
         fL85y4JIxjROFqBg4JVJIvO9iy2Rj2UNSeer6ZE+M2GwTNF26/LI9H90isFwXse7PZow
         bNtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n2si11772205qkg.267.2019.06.26.06.11.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 06:11:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1203C04B2F6;
	Wed, 26 Jun 2019 13:11:18 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3102C60A97;
	Wed, 26 Jun 2019 13:11:11 +0000 (UTC)
Date: Wed, 26 Jun 2019 15:11:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 02/14] target/arm/cpu: Ensure we can use
 the pmu with kvm
Message-ID: <20190626131108.lyqunrmepqmjlzxw@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-3-drjones@redhat.com>
 <7ba318d0-1701-39de-acee-d1a51385977d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ba318d0-1701-39de-acee-d1a51385977d@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 26 Jun 2019 13:11:24 +0000 (UTC)
X-TUID: rxvpYpk/jnB/

On Wed, Jun 26, 2019 at 11:49:03AM +0200, Richard Henderson wrote:
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > We first convert the pmu property from a static property to one with
> > its own accessors. Then we use the set accessor to check if the PMU is
> > supported when using KVM. Indeed a 32-bit KVM host does not support
> > the PMU, so this check will catch an attempt to use it at property-set
> > time.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/cpu.c     | 30 +++++++++++++++++++++++++-----
> >  target/arm/kvm.c     |  9 +++++++++
> >  target/arm/kvm_arm.h | 13 +++++++++++++
> >  3 files changed, 47 insertions(+), 5 deletions(-)
> > 
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 376db154f008..858f668d226e 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -759,10 +759,6 @@ static Property arm_cpu_has_el3_property =
> >  static Property arm_cpu_cfgend_property =
> >              DEFINE_PROP_BOOL("cfgend", ARMCPU, cfgend, false);
> >  
> > -/* use property name "pmu" to match other archs and virt tools */
> > -static Property arm_cpu_has_pmu_property =
> > -            DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, true);
> > -
> >  static Property arm_cpu_has_vfp_property =
> >              DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
> >  
> > @@ -785,6 +781,29 @@ static Property arm_cpu_pmsav7_dregion_property =
> >                                             pmsav7_dregion,
> >                                             qdev_prop_uint32, uint32_t);
> >  
> > +static bool arm_get_pmu(Object *obj, Error **errp)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    return cpu->has_pmu;
> > +}
> > +
> > +static void arm_set_pmu(Object *obj, bool value, Error **errp)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    if (value) {
> > +        if (kvm_enabled() && !kvm_arm_pmu_supported(CPU(cpu))) {
> > +            error_setg(errp, "'pmu' feature not supported by KVM on this host");
> > +            return;
> > +        }
> > +        set_feature(&cpu->env, ARM_FEATURE_PMU);
> > +    } else {
> > +        unset_feature(&cpu->env, ARM_FEATURE_PMU);
> > +    }
> > +    cpu->has_pmu = value;
> > +}
> > +
> >  static void arm_get_init_svtor(Object *obj, Visitor *v, const char *name,
> >                                 void *opaque, Error **errp)
> >  {
> > @@ -859,7 +878,8 @@ void arm_cpu_post_init(Object *obj)
> >      }
> >  
> >      if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
> > -        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_pmu_property,
> > +        cpu->has_pmu = true;
> > +        object_property_add_bool(obj, "pmu", arm_get_pmu, arm_set_pmu,
> >                                   &error_abort);
> 
> This doesn't look right.
> 
> The static property is only enabled here if the cpu is known to support the
> PMU, and thus the only useful setting is -cpu foo,pmu=off.  Which means that
> the extra checking that you do in the dynamic property is unused.

It's used when attempting to do '-cpu foo,pmu=on' on a cpu model that
would support the PMU on TCG, and thus has the property, but won't work
when KVM is in use. I'll admit I didn't test this, because I don't have
32-bit KVM hosts available, but I'm pretty sure it should work as
expected:

 -accel tcg -cpu foo                <-- on by default
 -accel tcg -cpu foo,pmu=off        <-- off
 -accel tcg -cpu foo,pmu=on         <-- nop

 -accel kvm -cpu foo                <-- on by default if kvm+foo supports
                                        the pmu, otherwise off
 -accel kvm -cpu foo,pmu=off        <-- off
 -accel kvm -cpu foo,pmu=on         <-- nop if kvm+foo supports the pmu,
                                        otherwise error message

With the error message, which will only occur with 32-bit kvm hosts, since
64-bit kvm hosts have all supported the pmu for quite some time, being the
only new thing.

> 
> It seems like you need to be checking for the PMU earlier, e.g. in
> kvm_arm_get_host_cpu_features.

We need to push all the checks into property accessors if we want the
QMP command to work for them.

Thanks,
drew

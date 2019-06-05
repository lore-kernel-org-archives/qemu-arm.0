Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3051113wrg;
        Wed, 5 Jun 2019 04:05:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtQlUZd8fcjAcW8fHwyY7pfLA8fXjkD4Q3c1PeKUxh6Q6ujA+ibMYb7Jj0TptjBfrbSQOG
X-Received: by 2002:a37:a093:: with SMTP id j141mr13288040qke.244.1559732715238;
        Wed, 05 Jun 2019 04:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559732715; cv=none;
        d=google.com; s=arc-20160816;
        b=AKKwWAk3KAZEZbPgVF79b5Fv/r27FtqZHmPWfuvfuVOCgOEquw6cTS16nj1lzmDswO
         d7kjqyFwHwk864a7dqRwp1rmJtC54V5cnWU+GYtfwVa5FUd6FagqwflTp43bGkihDLhJ
         CzP3ZG7zaT0qKG3drdd9ouGChmQk/fTg+abqrBmJhQtUwSRSx0Ol+z2bC3G8xs1J4+MU
         1Vazuq9S7/usZID8Xj8yloVAkj/lM8qpsjSJLAwhCPdHQBfR8jwZdVrk/LXlx1PShVzl
         yh7+fbhkov5xREu+RQXjtNfZ9LoBnrFhNqbyB07A/WB9KaGORPPkfaWWXOSRob+YxN/0
         CKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=XQDvEJ07vAi9xBWH5e6aj88nNB3/8V6MBr07xDN86X0=;
        b=w3lzm6p77TldoGKvl+VvGRcvvi/N+UkgGRvpZLrXe3otwMVKaBYOHkRkOag2bFUcbM
         WLNdd5I23RStC0Hqdres2cig4rcG2YAHXyTCYxwwtlZnoqi/wU9mb0Fylf8ogWX5ylFt
         IPSC9ZT9Gz9lUXQIExJBB73cJpCoY3zKpM4b0RfDSTZeuOEpqld8o7GZOxQ1X1W4J79g
         TSecjgeuvRLajfmwlp5uNs22y1Vw9XCN6+FucU++sldd8jEOvAk+XjzA1J7duEU8JE23
         Cxwisg3D1yP6jNTgDK6OxKsAhC0P3Bo2EeuJ3+WHdNUDXgP+wBFN9+qXq9N7RzQqLIKk
         4W4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y18si2814045qtn.379.2019.06.05.04.05.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 04:05:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B098D7EBD3;
	Wed,  5 Jun 2019 11:04:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBAD75D705;
	Wed,  5 Jun 2019 11:04:46 +0000 (UTC)
Date: Wed, 5 Jun 2019 13:04:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	abologna@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 06/13] target/arm/kvm: max cpu: Enable SVE
 when available
Message-ID: <20190605110444.234xp4roedpn2i5f@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-7-drjones@redhat.com>
 <53832876-c973-7176-1c84-897a489f3656@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53832876-c973-7176-1c84-897a489f3656@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 05 Jun 2019 11:05:03 +0000 (UTC)
X-TUID: 52G3KqD97HWJ

On Wed, Jun 05, 2019 at 11:09:56AM +0200, Auger Eric wrote:
> Hi Drew,
> 
> On 5/12/19 10:36 AM, Andrew Jones wrote:
> > Enable SVE in the KVM guest when the 'max' cpu type is configured
> > and KVM supports it. KVM SVE requires use of the new finalize
> > vcpu ioctl, so we add that now too.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/cpu64.c   |  1 +
> >  target/arm/kvm.c     |  5 +++++
> >  target/arm/kvm64.c   | 16 +++++++++++++++-
> >  target/arm/kvm_arm.h | 12 ++++++++++++
> >  4 files changed, 33 insertions(+), 1 deletion(-)
> > 
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> > index 228906f26786..6c19ef6837d5 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -292,6 +292,7 @@ static void aarch64_max_initfn(Object *obj)
> >  
> >      if (kvm_enabled()) {
> >          kvm_arm_set_cpu_features_from_host(cpu);
> > +        cpu->sve_max_vq = ARM_MAX_VQ;
> same line in the !kvm_enabled path. Maybe you can set the sve_max_vq
> field in a subsequent patch and just introduce the finalize and
> capability checking in that patch?

This gets changed in a subsequent patch, so factoring now would
be wasted code motion. I'm not sure the finalize function is worth
its own patch, so I'm inclined to leave this as is.

> >      } else {
> >          uint64_t t;
> >          uint32_t u;
> > diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> > index 599563461264..c51db4229d0f 100644
> > --- a/target/arm/kvm.c
> > +++ b/target/arm/kvm.c
> > @@ -50,6 +50,11 @@ int kvm_arm_vcpu_init(CPUState *cs)
> >      return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_INIT, &init);
> >  }
> >  
> > +int kvm_arm_vcpu_finalize(CPUState *cs, int feature)
> > +{
> > +    return kvm_vcpu_ioctl(cs, KVM_ARM_VCPU_FINALIZE, &feature);
> > +}
> > +
> >  void kvm_arm_init_serror_injection(CPUState *cs)
> >  {
> >      cap_has_inject_serror_esr = kvm_check_extension(cs->kvm_state,
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index 86362f4cd7d0..c2d92df75353 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -622,13 +622,20 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_EL1_32BIT;
> >      }
> >      if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PMU_V3)) {
> > -            cpu->has_pmu = false;
> > +        cpu->has_pmu = false;
> nit: maybe document this unrelated indent fix in the commit msg?

It's pretty obvious without extra commentary, IMHO.

> >      }
> >      if (cpu->has_pmu) {
> >          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
> >      } else {
> >          unset_feature(&env->features, ARM_FEATURE_PMU);
> >      }
> > +    if (cpu->sve_max_vq) {
> > +        if (!kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_SVE)) {
> > +            cpu->sve_max_vq = 0;
> > +        } else {
> > +            cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_SVE;
> > +        }
> > +    }
> >  
> >      /* Do KVM_ARM_VCPU_INIT ioctl */
> >      ret = kvm_arm_vcpu_init(cs);
> > @@ -636,6 +643,13 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >          return ret;
> >      }
> >  
> > +    if (cpu->sve_max_vq) {
> > +        ret = kvm_arm_vcpu_finalize(cs, KVM_ARM_VCPU_SVE);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> >      /*
> >       * When KVM is in use, PSCI is emulated in-kernel and not by qemu.
> >       * Currently KVM has its own idea about MPIDR assignment, so we
> > diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
> > index 2a07333c615f..c488ec3ab410 100644
> > --- a/target/arm/kvm_arm.h
> > +++ b/target/arm/kvm_arm.h
> > @@ -27,6 +27,18 @@
> >   */
> >  int kvm_arm_vcpu_init(CPUState *cs);
> >  
> > +/**
> > + * kvm_arm_vcpu_finalize
> > + * @cs: CPUState
> > + * @feature: int
> feature bitmap or bit?

Neither. I can improve this by stating these integers must be one
of the set defined in the "KVM_ARM_VCPU_FINALIZE" section of
kernel doc Documentation/virtual/kvm/api.txt though.

> > + *
> > + * Finalizes the configuration of the specified VCPU feature
> > + * by invoking the KVM_ARM_VCPU_FINALIZE ioctl.
> > + *
> > + * Returns: 0 if success else < 0 error code
> > + */
> > +int kvm_arm_vcpu_finalize(CPUState *cs, int feature);
> > +
> >  /**
> >   * kvm_arm_register_device:
> >   * @mr: memory region for this device
> > 
> 

Thanks,
drew

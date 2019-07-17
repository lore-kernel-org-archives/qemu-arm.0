Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp629021wrv;
        Wed, 17 Jul 2019 02:36:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwApGaKjGcgg7BIcPE9hdLA0DogtTyLL4nV+YQrpRb3T9m+jtIEOFPLFGM+yyfy8+N5CAh
X-Received: by 2002:ac8:28e2:: with SMTP id j31mr26911452qtj.274.1563356162312;
        Wed, 17 Jul 2019 02:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563356162; cv=none;
        d=google.com; s=arc-20160816;
        b=Keoj6kFE3vH/NERWj7Tt/71NVT5LqaGUytyQoEH//sRNWau/N4yo5c0fsSbnK1OCPF
         Jh/U0HKGBa1Ex/UH65mgwiLs7fG5Sl0k3BPkJvDHoYRNe1dK378hVdX2O/lgfik0agIJ
         wtoa1bFdL+B+q4bQ3LnXNOKvagtisWXwVuWVGVik0Gu3FwNWWpg4DjY+J2HlOPPuZHT4
         yE51NeXwN/Rp6S2JNyW6czcta/TmQq/GZUUYrtF4V0BqyDrlAxBBG/8LnaLz/YCv0/SY
         GpSMYKdJaccv2QPYObp0hYoAmRm/ozfaLcYo3qFtDGXXH6JiUFJYfuJ449VAV6GAykcR
         RgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=5FCRwXgB3s6P15IhIHaOgboVH0A/wLIC3Mw7G5S4N3c=;
        b=vFlYkIgcBXYsy0+SBNoogvrsIDhmncK3fecSyQWcVdNhwh1APuuTLOeMprexoarkat
         CxuQi5yVggEsTbdP6JnVpQhS5xw9L0nXJE94fYfKyMReuhtj+2pN0rsqwNbvV+VH4KnB
         A41IHSv1fuR9bQfolwSX9cxxIzzBuMjvS5clXwwiyHWe3zSJrPAUZOfDMSmNhkq0jM8t
         ZIG6+ALEsSChgN9B6LYfIpZcGlLltsEy48G/2+JicojS4PpmyRAxYJKmbRwMjYz7uME2
         1ow2K2b/9uYEmM4A7fJRdEUVvCq6q7dyrfvpR+p0pEIP9YUAx0S73OjVuY9QxzZ27aaK
         PFXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a5si13663670qkn.9.2019.07.17.02.36.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 02:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49495C057EC0;
	Wed, 17 Jul 2019 09:36:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47DA85C257;
	Wed, 17 Jul 2019 09:35:56 +0000 (UTC)
Date: Wed, 17 Jul 2019 11:35:53 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 10/14] target/arm/kvm64: Add
 kvm_arch_get/put_sve
Message-ID: <20190717093553.r5uomcocbtqkofkl@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
 <1e0bc93f-42e3-087f-a4b5-d356879cb806@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e0bc93f-42e3-087f-a4b5-d356879cb806@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 17 Jul 2019 09:36:01 +0000 (UTC)
X-TUID: TVJfWnKPxk0S

On Wed, Jun 26, 2019 at 05:22:34PM +0200, Richard Henderson wrote:
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > +/*
> > + * If ARM_MAX_VQ is increased to be greater than 16, then we can no
> > + * longer hard code slices to 1 in kvm_arch_put/get_sve().
> > + */
> > +QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> 
> This seems easy to fix, or simply drop the slices entirely for now, as
> otherwise they are a teeny bit confusing.

I can do that, but as I replied down thread, I sort of like it this way
for documentation purposes. Anyway, I don't have a strong opinion here,
so I'm happy to make reviewers happy :-)

> 
> It's a shame that these slices exist at all.  It seems like the kernel could
> use the negotiated max sve size to grab the data all at once.
> 
> > +        for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> > +            uint64_t *q = aa64_vfp_qreg(env, n);
> > +#ifdef HOST_WORDS_BIGENDIAN
> > +            uint64_t d[ARM_MAX_VQ * 2];
> > +            int j;
> > +            for (j = 0; j < cpu->sve_max_vq * 2; j++) {
> > +                d[j] = bswap64(q[j]);
> > +            }
> > +            reg.addr = (uintptr_t)d;
> > +#else
> > +            reg.addr = (uintptr_t)q;
> > +#endif
> > +            reg.id = KVM_REG_ARM64_SVE_ZREG(n, i);
> > +            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> 
> It might be worth splitting this...
> 
> > +        for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; n++) {
> > +            uint64_t *q = &env->vfp.pregs[n].p[0];
> > +#ifdef HOST_WORDS_BIGENDIAN
> > +            uint64_t d[ARM_MAX_VQ * 2 / 8];
> > +            int j;
> > +            for (j = 0; j < cpu->sve_max_vq * 2 / 8; j++) {
> > +                d[j] = bswap64(q[j]);
> > +            }
> > +            reg.addr = (uintptr_t)d;
> > +#else
> > +            reg.addr = (uintptr_t)q;
> > +#endif
> > +            reg.id = KVM_REG_ARM64_SVE_PREG(n, i);
> > +            ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> 
> ... and this (unified w/ reg + size parameters?) to a function because ...
> 
> > +        reg.addr = (uintptr_t)&env->vfp.pregs[FFR_PRED_NUM].p[0];
> > +        reg.id = KVM_REG_ARM64_SVE_FFR(i);
> > +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> 
> ... you forgot to apply the bswap here.

Ah, thanks for catching this. I'll fix it for v3, possibly with the
factoring, as you suggest.

> 
> Likewise for the other direction.
> 
> 
> r~
> 
> 
> PS: It's also tempting to drop the ifdefs and, since we know the host supports
> sve instructions, and that the host supports sve_max_vq, do the reformatting as
> 
>     uint64_t scratch[ARM_MAX_VQ * 2];
>     asm("whilelo  p0.d, xzr, %2\n\t"
>         "ld1d     z0.d, p0/z [%1]\n\t"
>         "str      z0, [%0]"
>         : "=Q"(scratch)
>         : "Q"(*aa64_vfp_qreg(env, n)),
>           "r"(cpu->sve_max_vq)
>         : "p0", "v0");

This is nice, but as we don't have any other asm's in this file, I'm
inclined to leave it with the loops/swaps until we can use a builtin,
as you suggest below.

> 
> PPS: Ideally, this would be further cleaned up with acle builtins, but those
> are still under development for GCC.
> 

Thanks,
drew

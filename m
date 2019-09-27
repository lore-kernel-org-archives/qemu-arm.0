Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3104195wrp;
        Thu, 26 Sep 2019 23:45:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+cACwSnhxuURlhJcTlcx09GdKYGBp7cEwRJvQmPp3jWJxM10Po5oY3kNN4vVoHaZ+43Hb
X-Received: by 2002:a6b:2b91:: with SMTP id r139mr7242702ior.293.1569566727989;
        Thu, 26 Sep 2019 23:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569566727; cv=none;
        d=google.com; s=arc-20160816;
        b=gQELWcRvBxIqjK9zyX4UXW9FOrZznzvT3RePxwbxKVvIFY0JsRxzbnaWLE/7Quj+MG
         qX2n3tztW78Yz1jbpFSis5xFNE/X7CPkKAOZiwxgMVaQGbuCYe7IpZPktuiXDqHtIMkL
         TB6UbCUcyAZy6aV13AV/bveq8mBgQIrMHB+XSBvv/Jph0pkpOJeLXMlG4cHbwZlRx727
         4qIQ3wWRrjrnxXPmH73U/7YovojivihvVkxJjK4IllZ7IsjzLZatmSKpp8hWrDK6+/Hm
         w5VEYy/UFQ6Jnhd6HZWrcgkSpl7diRY6HXUyboqn/661BfCYRMqeN8caqId85pDfYREc
         /erw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=cULaFOYPjPqvG9+c58lvYp5ZkZbmXAHQcnV610WvhyQ=;
        b=KGwfLLP4e+lQOG7dT/H9LTcmHBF08Oofxm8sfAmADSrbXpni6AgcVUJa09ALidAg2N
         4ymEIYFiF8OFh58uFRvEGWgBWCsj1PP6W8tm3lCACNTskXc1SaNxq0nnCrT+Pj1H+Wy3
         paNzCrDi3n3eyQkY1nu6TMH7TFsa8DAXeWPGnbM3ryr2t0wZg/i4XRtIK9uS9W8xgOvr
         FNcYf3IZYM0rcWMCsktmEihE0cwwtcyKx20JoQcsz6h7kCihc4QFXRVDB6d0roXNkGb5
         xcl4NtgY04vDPT0C4Kqnu38YeseIfinwffoGef8bRNYHfHDi1uBTBE1XR1QEeUDDy3Ot
         4T8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id r4si5855753jaq.109.2019.09.26.23.45.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 23:45:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28080315C01F;
	Fri, 27 Sep 2019 06:45:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07475600C6;
	Fri, 27 Sep 2019 06:45:22 +0000 (UTC)
Date: Fri, 27 Sep 2019 08:45:20 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
	Dave.Martin@arm.com, eric.auger@redhat.com, imammedo@redhat.com
Subject: Re: [PATCH v4 4/9] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
Message-ID: <20190927064520.o2sghq5hye4tvycf@kamzik.brq.redhat.com>
References: <20190924113105.19076-1-drjones@redhat.com>
 <20190924113105.19076-5-drjones@redhat.com>
 <2beb840f-99cf-d928-0926-c284933c78d9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2beb840f-99cf-d928-0926-c284933c78d9@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 27 Sep 2019 06:45:27 +0000 (UTC)
X-TUID: rBmE1yRyGSW5

On Thu, Sep 26, 2019 at 12:07:54PM -0700, Richard Henderson wrote:
> On 9/24/19 4:31 AM, Andrew Jones wrote:
> > +static uint32_t sve_zcr_get_valid_len(ARMCPU *cpu, uint32_t start_len)
> > +{
> > +    uint32_t start_vq = (start_len & 0xf) + 1;
> > +
> > +    return arm_cpu_vq_map_next_smaller(cpu, start_vq + 1) - 1;
> > +}
> > +
> >  /*
> >   * Given that SVE is enabled, return the vector length for EL.
> >   */
> > @@ -5360,13 +5367,13 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
> >      uint32_t zcr_len = cpu->sve_max_vq - 1;
> >  
> >      if (el <= 1) {
> > -        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[1]);
> > +        zcr_len = sve_zcr_get_valid_len(cpu, env->vfp.zcr_el[1]);
> >      }
> >      if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
> > -        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[2]);
> > +        zcr_len = sve_zcr_get_valid_len(cpu, env->vfp.zcr_el[2]);
> >      }
> >      if (arm_feature(env, ARM_FEATURE_EL3)) {
> > -        zcr_len = MIN(zcr_len, 0xf & (uint32_t)env->vfp.zcr_el[3]);
> > +        zcr_len = sve_zcr_get_valid_len(cpu, env->vfp.zcr_el[3]);
> 
> This has lost the MIN relation between these 3 registers.
> One possible solution is to keep these 3 if statements as-is,
> but make one call
> 
>     zcr_len = arm_cpu_vq_map_next_smaller(cpu, zcr_len);
> 
> at the end.

Argh. I obviously didn't look closely enough at this function when I was
modifying it. I must have interpreted it as an if-else-if sequence...

I'll fix this as you suggest.

> 
> > +#if __SIZEOF_LONG__ == 8
> > +#define BIT(n) (1UL << (n))
> > +#else
> > +#define BIT(n) (1ULL << (n))
> > +#endif
> 
> There's no reason not to always use 1ULL is there?

Indeed ULL == UL for AArch64. I'll drop the #if... stuff.

Thanks,
drew

Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1145809wru;
        Thu, 27 Jun 2019 03:59:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBgGMZWmXAh1fB8NDWuY8NP0q4iVbGVlqR2QBBiV7vWGm8cAh5taywVraOD7t/Fpq3hKEr
X-Received: by 2002:a50:84e2:: with SMTP id 89mr3323184edq.218.1561633157174;
        Thu, 27 Jun 2019 03:59:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561633157; cv=none;
        d=google.com; s=arc-20160816;
        b=YqMKu6UY1ik4kcvXZ84JCoPUhTveAV6jrqv1AJKpjtGTWolYjQwHGvATb9a5s0cYGl
         vWJSt4VJg2waQt1Q6mf69SWogVhrTNv/v0QH77yICbafhD5zji0pY8SAGuuEeqgM8Msi
         NZNH4p4wOyGL1zNafh/g7gmGuA6CzUoxVRXjAOMBebgED7gUFyO4f8g4rlnS8Vh376Vp
         CV6H2DKNLcCjVktJjo4KVvGO423/ESaqfzPzYaEX316FXCs5YYYaGrgDQcjnOF1vLAXY
         a2apaLDM6TSV0vF/cG+fF+qejQlEClSWOfj3zTRdBg2tj1QKyUuPfolpDqwwZVj0jTSq
         FooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=9BaS3Ns84OdQ2IPCKw663QpUXj5yUja/bTsJkma8+co=;
        b=Mci0KB+iYrbVc6cJF8S9TTpLpWZQVpVH3+dQcu+pIPFA00sbBgFHIafwWtbcApRv4M
         9kqCDdvUAnlVtsyxF2AcZ3vi9gJYBJYT3BvbNV6Fh6dVzknCpIZSxn+CU32bpF2pBa1N
         uNLR43WbXsyNinfICsHpKOCnKEvIZg1LoPiGQpB0WgTsBOPxyZzTvnsZr9OypS6fNnp8
         4iyzqpCh1/nHVVZJ0skAyzRL44GtARZJCq45dtJi3YYkjzx6zM47YMekigJMcTM6KE1R
         M1E1T2LP4kY/np4rg4zgyf5C1G6IvXlXrQUJ3x52Ok0q5RRp6HVcu0I65iXB2YkYKsK+
         Sxng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id i25si1439376edv.222.2019.06.27.03.59.15;
        Thu, 27 Jun 2019 03:59:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2722D2B;
	Thu, 27 Jun 2019 03:59:15 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6BF93F718;
	Thu, 27 Jun 2019 03:59:13 -0700 (PDT)
Date: Thu, 27 Jun 2019 11:59:11 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Subject: Re: [PATCH v2 10/14] target/arm/kvm64: Add kvm_arch_get/put_sve
Message-ID: <20190627105911.GD2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
 <1e0bc93f-42e3-087f-a4b5-d356879cb806@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e0bc93f-42e3-087f-a4b5-d356879cb806@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: uwnfXnLyP9s7

On Wed, Jun 26, 2019 at 04:22:34PM +0100, Richard Henderson wrote:
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > +/*
> > + * If ARM_MAX_VQ is increased to be greater than 16, then we can no
> > + * longer hard code slices to 1 in kvm_arch_put/get_sve().
> > + */
> > +QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> 
> This seems easy to fix, or simply drop the slices entirely for now, as
> otherwise they are a teeny bit confusing.
> 
> It's a shame that these slices exist at all.  It seems like the kernel could
> use the negotiated max sve size to grab the data all at once.

The aim here was to be forwards compatible while fitting within the
existing ABI.

The ABI doesn't allow variable-sized registers, and if the vq can
someday grow above 16 then the individual registers could become pretty
big.

Inside the kernel, we took the view that if that ever happens, it's
sufficiently far out that we can skip implementing the support today,
providing that the ABI can accommodate the change.

For qemu, if you don't actually care what's in the regs, you could just
enumerate then using KVM_GET_REG_LIST instead of manufacturing the IDs
by hand.  That way, you don't have to care what slices exist.  For
save/restore/migrate purposes, the regs are just data, so that's
probably enough.

Debug, and exchanging vector registers between the guest and, say, and
SMC trapped to userspace, would still need to examine specific regs.
I don't know what QEMU does in this area though.

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

It's for QEMU to choose, but does it actually matter what byteorder you
store a Z-reg or P-reg in?  Maybe the byteswap isn't really needed.

I don't know how this works when migrating from a little-endian to a
big-endian host or vice-versa (or if that is even supported...)

[...]

Cheers
---Dave

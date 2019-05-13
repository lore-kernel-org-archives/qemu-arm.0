Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2949756wrg;
        Mon, 13 May 2019 08:31:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0esM8AcAB+nes6DkQTmteQ2bfsviWwcTC+j8yQ9t0lwTMrLj3lSQ2cqscBHi567lCUZDF
X-Received: by 2002:a50:9016:: with SMTP id b22mr29061792eda.99.1557761482125;
        Mon, 13 May 2019 08:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557761482; cv=none;
        d=google.com; s=arc-20160816;
        b=UG/BjQGlXB+7dC8ZDr5csDSkBsMBIcMDoiut0Q/PK6GrendTdvSjJKCgAEm5eI+Odj
         TvPQ+0xtRQB/IBrCxMwmetuQPCQ20fDnVg+zm+T3giu8y6L3dvDTrKPoRthmRQHfSm2M
         +x7QoJ+HCvcCUiBGnithklcsBDGdVWalTkdzIQMPWrI7Zmfa7dt0H+fWzn2jZ+NOQpee
         o5MlAXwU0q/87eDzOQII4DI3DuiUdjkX3+FmtwVuGwnwhgKT5ay21/qEPsGHN8D0HElY
         dwcsqI9KkbkQ74kj6U8MGmlPYgcHBb0jvSo7gF+nwUGLfTsVo2Cy49mA0aSqHBqJojoq
         GB0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=kJp9VzDPgM28g5udd1qKdupxbV/PGtI9mK4wkzCGbnc=;
        b=nTHdefodckPwEN8RawQ3YAxVIgdtWzUc/gKUc5J+jIokNZKc9buY6Ij8K4UN+gIKb7
         aBycVWAIrmqvEHZ7pNnQ/cY8bvjJrVIp82C3vMIwYN3N8ONYB4V3SXd9e3kydl/lWGYl
         to0lH6n70COC2pj8WViQe570JUQXQTMtmh7IkCzVYSujPArJ5VEbDZthbXS8CRI/2Cb5
         Bjfku+3JuoJB6UexJRqVtkFSsmTRjMbEjT5mh18ukyNXUY+TnTKDkc/UzG17rG+HMYP5
         bP2YkE9sQFj4Ipagzsfc3oz3cypcqKZsAm0j0cx8dZY2F+Aqcs3PLzbyQGglkZI3rynI
         JBow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id v49si1809734edm.448.2019.05.13.08.31.21;
        Mon, 13 May 2019 08:31:22 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0D9341;
	Mon, 13 May 2019 08:31:20 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E3B93F71E;
	Mon, 13 May 2019 08:31:19 -0700 (PDT)
Date: Mon, 13 May 2019 16:31:16 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"abologna@redhat.com" <abologna@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 05/13] target/arm/kvm: Add
 kvm_arch_get/put_sve
Message-ID: <20190513153116.GL28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513123110.GE28398@e103592.cambridge.arm.com>
 <20190513135501.ztggqdac57qbpuft@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513135501.ztggqdac57qbpuft@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: 9Ifgn9lw8jIH

On Mon, May 13, 2019 at 02:55:01PM +0100, Andrew Jones wrote:
> On Mon, May 13, 2019 at 01:31:11PM +0100, Dave Martin wrote:
> > On Sun, May 12, 2019 at 09:36:16AM +0100, Andrew Jones wrote:
> > > These are the SVE equivalents to kvm_arch_get/put_fpsimd.
> > > 
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > ---
> > >  target/arm/kvm64.c | 127 +++++++++++++++++++++++++++++++++++++++++++--
> > >  1 file changed, 123 insertions(+), 4 deletions(-)
> > 
> > [...]
> > 
> > > +static int kvm_arch_put_sve(CPUState *cs)
> > > +{
> > > +    ARMCPU *cpu = ARM_CPU(cs);
> > > +    CPUARMState *env = &cpu->env;
> > > +    struct kvm_one_reg reg;
> > > +    int n, ret;
> > > +
> > > +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> > > +        uint64_t *q = aa64_vfp_qreg(env, n);
> > > +#ifdef HOST_WORDS_BIGENDIAN
> > > +        uint64_t d[ARM_MAX_VQ * 2];
> > > +        int i;
> > > +        for (i = 0; i < cpu->sve_max_vq * 2; i++) {
> > > +            d[i] = q[cpu->sve_max_vq * 2 - 1 - i];
> > > +        }
> > 
> > Out of interest, why do all this swabbing?  It seems expensive.
> >
> 
> QEMU keeps its 128-bit and larger words in the same order (least
> significant word first) for both host endian types. We need to
> do word swapping every time we set/get them to/from KVM.

I'm not sure whether this is appropriate here, though it depends on
what QEMU does with the data.

Something non-obvious to be aware of:

As exposed through the signal frame and the KVM ABI, the memory
representation of an SVE reg is invariant with respect to the
endianness.

IIUC, the byte order seen for a V-reg in KVM_REG_ARM_CORE and for
the equivalent Z-reg in KVM_REG_ARM64_SVE would be the opposite of each
other on BE, but the same on LE.

This is a feature of the archtiecture: a V-reg can be stored as a single
value, but Z-regs are in general too big to be treated as a single
value: they are always treated as a sequence of elements, and the
largest element size supported is 64 bits, not 128.  IIUC, there is no
direct native way to store with 128-bit swabbing: some explicit data
processing operation would also be needed to swap adjacent 64-bit
elements in the vector around the store/load.

This is not specified in the ABI documentation -- I should address that.

If this is infeasible for KVM to work with, we could perhaps change it,
but I'm not too keen on that at this stage.  KVM_REG_ARM64_SVE_VLS
has a similar behaviour: it's a vector of 64-bit possibly-swabbed words,
not a single possibly-swabbed 512-bit word.


Looking at the kernel, I may have screwed up in places where the
two representations interact, like fpsimd_to_sve().  I should take a
look at that...  This doesn't affect the KVM ABI though.

Cheers
---Dave

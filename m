Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2889182wrg;
        Mon, 13 May 2019 07:39:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPjI2fNF1ntty4EDFKTPNAxn7QRnf8NrkAQpZA9e/NHMCM6U+4Js2xRtxyntxuHDb4FWt1
X-Received: by 2002:a17:906:d20a:: with SMTP id w10mr23029879ejz.219.1557758375043;
        Mon, 13 May 2019 07:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557758375; cv=none;
        d=google.com; s=arc-20160816;
        b=bYxoYO/DD3G6sGAms2DMvbtfh57u33X+Lr7y4Euo3JjLWaNrel86jV5hq9kY6Id1Nz
         //XUFOBbWzGgX5Q1tdBHeKbp/QxzmebRjVlIBQ0L3p/oNJLprQEmEs4mnRuetThkPo9O
         9/USsTVI9okp/DaH5huX9KbWtT4pJWZ3Ztm67SmwRs99aOLBrBKbzTDm3McocdcLYZPQ
         kvqOL6v28Nvt7b4PeFpdYRdFGYWiw+yloH8bQjhJ31AMBylzA4aOG9kOhyk2Htexcpbj
         I+5shDQlfigWFr5TIcbM0uo4gj3JMDEWNET07DXpdNyqfZwlRigRnUTL+CI02OBvHYdZ
         Ptkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=4QC4zApypkhkGwum8n1ab7Qp4H69PWq7U4oT7gDxeWY=;
        b=0Vc2Xdeyil6niVnzGLPki1I2DiQd3HVeW02/TqTDF1OfHPUyWWsD6hosu+eMoG3lUV
         v+qsv68lvGtFvxzn5SQCkT9pcBeFXJnDA2SBPyahlLADCQeAynfKExBAVfrjzOpyEJFh
         7XrXOGqr2rgAjoDVdK5+B4UJcOXxlQKq26O7yPtqC+EVfi5b2QKcQfEBICrPObt8oVvI
         zv+n/ut2Q8hGSB2lkkDIDUoJtDLUgaEdL54zyIO+FnfmEECznfgGR7WfWXZUrMl4yI7I
         haI+VN3YjrIETYMwlb9AGHXxOoMHJouIV43kw30DkXa2vROYOOHeM1yduVxd2foEKlgf
         H4Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id u46si1536333edm.404.2019.05.13.07.39.34;
        Mon, 13 May 2019 07:39:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06430341;
	Mon, 13 May 2019 07:39:34 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F6073F71E;
	Mon, 13 May 2019 07:39:32 -0700 (PDT)
Date: Mon, 13 May 2019 15:39:30 +0100
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
Message-ID: <20190513143929.GK28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513124356.GG28398@e103592.cambridge.arm.com>
 <20190513140726.vpmenrfw4uocmtnc@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513140726.vpmenrfw4uocmtnc@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: B7hPiGuMHmo4

On Mon, May 13, 2019 at 03:07:26PM +0100, Andrew Jones wrote:
> On Mon, May 13, 2019 at 01:43:56PM +0100, Dave Martin wrote:
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
> > > +        reg.addr = (uintptr_t)d;
> > > +#else
> > > +        reg.addr = (uintptr_t)q;
> > > +#endif
> > > +        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
> > 
> > Will this silently go wrong if more than one slice is required (i.e.,
> > the register size grows beyond 8192 bits?)
> 
> Yeah, I could probably implement the slice loop now and add a
> function that returns 1 (for now) like your vcpu_sve_slices()
> function in KVM. I'll do that for v2.

Or just add a sanity check that the vector length is <= 2048 bits.

Support for larger vectors is untestable for now, since the kernel
doesn't support that and would never expose it.


On that point, could TCG easily be made to expose a larger vector length
to the kernel?  I'd be interested to see what happened.

The kernel should warn and hide the larger vector lengths from KVM,
but I've not been able to test that.

It's only worth trying this out if the hacks to QEMU to enable testing
this were pretty trivial, though.

Cheers
---Dave

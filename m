Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2789905wrg;
        Mon, 13 May 2019 06:12:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXjblQ1+czVgjXkBAaiTUENGGbSpc1Qpyi8FS31+Vj9/PqFe6ayrm+l77/HdRYv+X+rtTi
X-Received: by 2002:a17:906:45c1:: with SMTP id z1mr17046327ejq.16.1557753173680;
        Mon, 13 May 2019 06:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557753173; cv=none;
        d=google.com; s=arc-20160816;
        b=IU76H19k8M3sz3qwzsjeBKTE4C9qd2Mgt3MItiL+R2BdoknUQ3wgzzBF97IZorGpVA
         OciEovmeT8BQqb2Auza/8cU0iC3FJ9F9s/kq83v8qqKrG2M6SKjjWiII3rzYl/8wcFd3
         8coclvao9TiEG2/sqXccHuBzFJ4wPpnJImx8BfEKIeZCQ5khZl8myzil1m7EDl0alt3j
         W0mX5yn4yJpl9GDbQIdHQqs8xpl4xd737cSKXyYXIHt+wOUIOd05tO+MZ9KEZykT5hoI
         iwB9jXqkD6Vs43Ygfs/jOBtoyQNXx5snBdbJJK2AkAMKJgaFoI0GEhhCNWxFgxPqUFmV
         P5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=ext0UZg5gsWJoZDrAyFOXrPtRyNKyhklUNum8/3DUw8=;
        b=vmOdzK8s0lBfeIUcSN2qIVZq3PxqlzT2Q9a8iegkZGGj7Y3K7sygfpUqVHFBhPwdg3
         i/RBsGXAjBHgs04+5KUgUkDh2/6IDJyV0QNxbu4q4cISO5QKbEMSbZ2FELZ4jpBHGsz9
         d7oUVDdomxsbAii7h2m5xKSQ9Bkh8Dt2VymiUfrOHz8+lgjKXr29BuM2vae3d9HvLw3v
         qQUYRyiSRNkLm4HVt16JFvu4vSIFrEtEBC5WsfSlP8yBipKfPzYczbSfvWNsX6jacI6h
         ac+0Nx67Nmo/sxcsqH1EbW0gkejLKTCPACR/BrbUPpOzcaEjzEQf9TbhuAiKmfJcBsOV
         Y9tA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id t4si355839eda.280.2019.05.13.06.12.53;
        Mon, 13 May 2019 06:12:53 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7277B80D;
	Mon, 13 May 2019 06:12:52 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC2F33F720;
	Mon, 13 May 2019 06:12:50 -0700 (PDT)
Date: Mon, 13 May 2019 14:12:48 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"abologna@redhat.com" <abologna@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 11/13] target/arm/cpu64: max cpu: Introduce
 sve-vls-map
Message-ID: <20190513131248.GI28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-12-drjones@redhat.com>
 <20190513112635.GD28398@e103592.cambridge.arm.com>
 <20190513123023.h4q5sihktqctkgml@kamzik.brq.redhat.com>
 <20190513124126.GF28398@e103592.cambridge.arm.com>
 <20190513125740.ukyx4vuili3f5wbe@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513125740.ukyx4vuili3f5wbe@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: OnNSw5yFtDtO

On Mon, May 13, 2019 at 01:57:40PM +0100, Andrew Jones wrote:
> On Mon, May 13, 2019 at 01:41:26PM +0100, Dave Martin wrote:
> > On Mon, May 13, 2019 at 01:30:23PM +0100, Andrew Jones wrote:
> > > On Mon, May 13, 2019 at 12:26:36PM +0100, Dave Martin wrote:
> > > > On Sun, May 12, 2019 at 09:36:22AM +0100, Andrew Jones wrote:
> > > > > Introduce another cpu property to control SVE vector lengths,
> > > > > sve-vls-map, which allows the user to explicitly select the
> > > > > set of vector lengths the guest can use. The map must conform
> > > > > to QEMU's limits and architectural constraints, checked when
> > > > > the property is set. Inconsistencies with sve-max-vq are also
> > > > > checked. The bit number of a set bit in the map represents the
> > > > > allowed vector length in number of quadwords.
> > > > > 
> > > > > Note, as the map is implemented with a single 64-bit word we
> > > > > currently only support up to 8192-bit vectors. As QEMU and
> > > > > KVM only support up to 2048-bit vectors then this sufficient
> > > > > now, and probably for some time. Extending the bitmap beyond
> > > > > a single word will likely require changing the property to
> > > > > a string and adding yet another parser to QEMU.
> > > > > 
> > > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > > ---
> > > > >  target/arm/cpu.c     |  4 +++
> > > > >  target/arm/cpu.h     |  3 ++
> > > > >  target/arm/cpu64.c   | 70 +++++++++++++++++++++++++++++++++++++++++---
> > > > >  target/arm/helper.c  | 10 ++++++-
> > > > >  target/arm/monitor.c |  9 ++++--
> > > > >  5 files changed, 88 insertions(+), 8 deletions(-)
> > > > > 
> > > > 
> > > > [...]
> > > > 
> > > > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > > > index 8292d547e8f9..f0d0ce759ba8 100644
> > > > > --- a/target/arm/cpu.h
> > > > > +++ b/target/arm/cpu.h
> > > > > @@ -920,6 +920,9 @@ struct ARMCPU {
> > > > >  
> > > > >      /* Used to set the maximum vector length the cpu will support.  */
> > > > >      uint32_t sve_max_vq;
> > > > > +
> > > > > +    /* Each bit represents a supported vector length of (bitnum * 16) bytes */
> > > > > +    uint64_t sve_vls_map;
> > > > 
> > > > Just to be clear, the representation here is different from the
> > > > representation in KVM_REG_ARM64_SVE_VLS?
> > > > 
> > > > In the latter, bit n represents vector length ((n + 1) * 16) bytes.
> > > 
> > > KVM also uses bitnum * 16. bitnum is the the bit number, not the shift.
> > 
> > Can you point to the relevant kernel code?  This isn't what I thought I
> > wrote...
> 
> The Documentation/virtual/kvm/api.txt documentation has
> 
>  > if (vq >= SVE_VQ_MIN && vq <= SVE_VQ_MAX &&
>  >    ((vector_lengths[(vq - KVM_ARM64_SVE_VQ_MIN) / 64] >>
>  >                ((vq - KVM_ARM64_SVE_VQ_MIN) % 64)) & 1))
>  >        /* Vector length vq * 16 bytes supported */
>  > else
>  >        /* Vector length vq * 16 bytes not supported */
> 
> Taking vq=1, we check (vector_lengths[0] >> 0) to see if we have the
> length (1 * 16) bytes. Since bitnum 1 is (1 << 0) that means the shift
> is zero and (bitnum * 16) is the same as (vq * 16). With ((n + 1) * 16),
> n would have to be zero, which is not a valid bitnum, but is a valid
> bit shift.

OK, so it sounds like the interpretation of the KVM ABI is what I intended.

What is "bitnum" though?  Most of the time, people seem to number bits
starting from 0 -- though of course that's just a convention.

> > > So you can't have bitnum=0. 'n' must be a shift, as it would need to
> > > allow zero in order to represent KVM_ARM64_SVE_VQ_MIN.

[...]

> > > > > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > > > > index 1e6eb0d0f360..bedec1ea0b27 100644
> > > > > --- a/target/arm/helper.c
> > > > > +++ b/target/arm/helper.c
> > > > > @@ -5254,12 +5254,20 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
> > > > >  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > > > >                        uint64_t value)
> > > > >  {
> > > > > +    ARMCPU *cpu = arm_env_get_cpu(env);
> > > > >      int cur_el = arm_current_el(env);
> > > > >      int old_len = sve_zcr_len_for_el(env, cur_el);
> > > > >      int new_len;
> > > > >  
> > > > >      /* Bits other than [3:0] are RAZ/WI.  */
> > > > > -    raw_write(env, ri, value & 0xf);
> > > > > +    value &= 0xf;
> > > > 
> > > > You might want to sanity-check that the max vq you configured for the
> > > > vcpu is <= 16 here.
> > > 
> > > It's already checked by the cpu property set function at input time.
> > 
> > The check is in one place, but the assumptions based on it are
> > potentially all over the place -- it may be tricky to track them
> > all down if you ever add support for >8192-bit vectors.
> > 
> > (Not a big deal from my point of view, but I'd migration to larger
> > vectors to be as smooth as reasonably possible if we ever find we have
> > to do it.)
> >
> 
> Adding asserts might be a good idea to catch bugs when expanding the
> supported vector lengths. I can certainly add one here. Maybe Richard
> has some ideas as well for this.

Sure, just wanted to make the point, since this might be an issue in the
future.

The compromise in the kernel implementation was similar: in many places
the code is agnostic to larger vectors, but in a few (such as the ioctl
reg accessors) this seemed too cumbersome to justify for now, so I went
with a simpler implementation with some added sanity-checks.

Cheers
---Dave

Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2771221wrg;
        Mon, 13 May 2019 05:57:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1Q+hfHkxNHEXQ8pQtPsgCoApb+Es0lBDJRTKg2FlkDvfomE+9ksC27ni5EWWKtKeXhPm8
X-Received: by 2002:aed:3bcf:: with SMTP id s15mr2443259qte.105.1557752273284;
        Mon, 13 May 2019 05:57:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557752273; cv=none;
        d=google.com; s=arc-20160816;
        b=DrJzz0kUHnIW1jnvOFdThjtXSBZCjAkCCeB/PXWni70PO4YMJe8KqUJQixEbQqx+fz
         kdsSOueIbR4oEXUOWVybtI4quuOY4gKxPTVxDDEVLK3apgciLdADZyq/lW2m3S1PZmn3
         vey+8+bFHeeW6MViJoC3lGCxcVzj0lQYzQO7XbbqyXyiLXJtvzgK9w9E/QTIgFcKzIP2
         11DEHVJ75WQykH5O5ILM27czL76HRBm9hrs7Io+xukOfAnl7qpChLnZbdzgGePCnCI0h
         ksW6rHsYJTzoGDs4rvuvx3qkY1ByKfKb7XTXcw/mSi1ylpbrbX3nYae2V2NVofdj7+SU
         V1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=Wz+NffZ3rem9YAGEzJ3znwmdhKxMnfuhY2eBO6ygZ/w=;
        b=foCQ6jBJPumY0jo3iIC+EJJVVXeUfPyCXoQsVbYaSkLcvEOFn+fRPVdzMvjrhnkDp5
         GrimdOHoadfbg0RkgOCjtd3nm84AXzx0UrAyfBx/zeuU7e/aSoFSmkBc8SRmZyijKcDw
         CSpMpDweQ2+Xcl1LdMZvIH8OpGr/2dR+8Imd0w8kf/94SB7gnpQDfg7WWiIy9QJwN+Di
         5Kz0cGl5l3pwMCCqDwNYn9kCXiFkwTV2/OBJn81HVcfq0VXbimPj42gD3za8OlzEe9P0
         Wx14iCmz5Sajhsv14u90lqjeMM6todzZpGKLZI3Flz6Rk22FNAetgE20N+kRkKVGA2Ip
         vQWw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c15si1718305qtj.167.2019.05.13.05.57.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:57:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 642CF81127;
	Mon, 13 May 2019 12:57:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57710600C8;
	Mon, 13 May 2019 12:57:43 +0000 (UTC)
Date: Mon, 13 May 2019 14:57:40 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"abologna@redhat.com" <abologna@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 11/13] target/arm/cpu64: max cpu: Introduce
 sve-vls-map
Message-ID: <20190513125740.ukyx4vuili3f5wbe@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-12-drjones@redhat.com>
 <20190513112635.GD28398@e103592.cambridge.arm.com>
 <20190513123023.h4q5sihktqctkgml@kamzik.brq.redhat.com>
 <20190513124126.GF28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513124126.GF28398@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Mon, 13 May 2019 12:57:52 +0000 (UTC)
X-TUID: OzzcLi3DRGdY

On Mon, May 13, 2019 at 01:41:26PM +0100, Dave Martin wrote:
> On Mon, May 13, 2019 at 01:30:23PM +0100, Andrew Jones wrote:
> > On Mon, May 13, 2019 at 12:26:36PM +0100, Dave Martin wrote:
> > > On Sun, May 12, 2019 at 09:36:22AM +0100, Andrew Jones wrote:
> > > > Introduce another cpu property to control SVE vector lengths,
> > > > sve-vls-map, which allows the user to explicitly select the
> > > > set of vector lengths the guest can use. The map must conform
> > > > to QEMU's limits and architectural constraints, checked when
> > > > the property is set. Inconsistencies with sve-max-vq are also
> > > > checked. The bit number of a set bit in the map represents the
> > > > allowed vector length in number of quadwords.
> > > > 
> > > > Note, as the map is implemented with a single 64-bit word we
> > > > currently only support up to 8192-bit vectors. As QEMU and
> > > > KVM only support up to 2048-bit vectors then this sufficient
> > > > now, and probably for some time. Extending the bitmap beyond
> > > > a single word will likely require changing the property to
> > > > a string and adding yet another parser to QEMU.
> > > > 
> > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > ---
> > > >  target/arm/cpu.c     |  4 +++
> > > >  target/arm/cpu.h     |  3 ++
> > > >  target/arm/cpu64.c   | 70 +++++++++++++++++++++++++++++++++++++++++---
> > > >  target/arm/helper.c  | 10 ++++++-
> > > >  target/arm/monitor.c |  9 ++++--
> > > >  5 files changed, 88 insertions(+), 8 deletions(-)
> > > > 
> > > 
> > > [...]
> > > 
> > > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > > index 8292d547e8f9..f0d0ce759ba8 100644
> > > > --- a/target/arm/cpu.h
> > > > +++ b/target/arm/cpu.h
> > > > @@ -920,6 +920,9 @@ struct ARMCPU {
> > > >  
> > > >      /* Used to set the maximum vector length the cpu will support.  */
> > > >      uint32_t sve_max_vq;
> > > > +
> > > > +    /* Each bit represents a supported vector length of (bitnum * 16) bytes */
> > > > +    uint64_t sve_vls_map;
> > > 
> > > Just to be clear, the representation here is different from the
> > > representation in KVM_REG_ARM64_SVE_VLS?
> > > 
> > > In the latter, bit n represents vector length ((n + 1) * 16) bytes.
> > 
> > KVM also uses bitnum * 16. bitnum is the the bit number, not the shift.
> 
> Can you point to the relevant kernel code?  This isn't what I thought I
> wrote...

The Documentation/virtual/kvm/api.txt documentation has

 > if (vq >= SVE_VQ_MIN && vq <= SVE_VQ_MAX &&
 >    ((vector_lengths[(vq - KVM_ARM64_SVE_VQ_MIN) / 64] >>
 >                ((vq - KVM_ARM64_SVE_VQ_MIN) % 64)) & 1))
 >        /* Vector length vq * 16 bytes supported */
 > else
 >        /* Vector length vq * 16 bytes not supported */

Taking vq=1, we check (vector_lengths[0] >> 0) to see if we have the
length (1 * 16) bytes. Since bitnum 1 is (1 << 0) that means the shift
is zero and (bitnum * 16) is the same as (vq * 16). With ((n + 1) * 16),
n would have to be zero, which is not a valid bitnum, but is a valid
bit shift.

> 
> > So you can't have bitnum=0. 'n' must be a shift, as it would need to
> > allow zero in order to represent KVM_ARM64_SVE_VQ_MIN.
> 
> [...]
> 
> > > > +static void cpu_set_sve_vls_map(Object *obj, Visitor *v, const char *name,
> > > > +                                void *opaque, Error **errp)
> > > > +{
> > > > +    ARMCPU *cpu = ARM_CPU(obj);
> > > > +    Error *err = NULL;
> > > > +    uint64_t mask = ~(BIT_MASK(ARM_MAX_VQ - 1) - 1);
> > > > +    int i;
> > > > +
> > > > +    visit_type_uint64(v, name, &cpu->sve_vls_map, errp);
> > > > +
> > > > +    if (!err) {
> > > > +        if (cpu->sve_vls_map == 0) {
> > > > +            error_setg(&err, "SVE vector length map cannot be zero");
> > > 
> > > Maybe say "empty" here, since the map represents a set?
> > 
> > Empty does sound better when considering the map represents a set, but
> > the user will be inputting a number for the map, so zero will be what
> > they attempted to input.
> 
> If the user is inputting the encoded number directly, I guess it makes
> sense to describe the empty set as "zero".
> 
> > > (But it this is just for debug rather than reporting errors to the user,
> > > it probably doesn't matter much.)
> > 
> > I'm also not too worried about which term we use, so I'm happy to change
> > it if you'd like.
> 
> I guess I don't have a strong opinion.
> 
> [...]
> 
> > > > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > > > index 1e6eb0d0f360..bedec1ea0b27 100644
> > > > --- a/target/arm/helper.c
> > > > +++ b/target/arm/helper.c
> > > > @@ -5254,12 +5254,20 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
> > > >  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > > >                        uint64_t value)
> > > >  {
> > > > +    ARMCPU *cpu = arm_env_get_cpu(env);
> > > >      int cur_el = arm_current_el(env);
> > > >      int old_len = sve_zcr_len_for_el(env, cur_el);
> > > >      int new_len;
> > > >  
> > > >      /* Bits other than [3:0] are RAZ/WI.  */
> > > > -    raw_write(env, ri, value & 0xf);
> > > > +    value &= 0xf;
> > > 
> > > You might want to sanity-check that the max vq you configured for the
> > > vcpu is <= 16 here.
> > 
> > It's already checked by the cpu property set function at input time.
> 
> The check is in one place, but the assumptions based on it are
> potentially all over the place -- it may be tricky to track them
> all down if you ever add support for >8192-bit vectors.
> 
> (Not a big deal from my point of view, but I'd migration to larger
> vectors to be as smooth as reasonably possible if we ever find we have
> to do it.)
>

Adding asserts might be a good idea to catch bugs when expanding the
supported vector lengths. I can certainly add one here. Maybe Richard
has some ideas as well for this.

Thanks,
drew

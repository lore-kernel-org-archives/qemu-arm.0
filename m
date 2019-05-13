Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2744053wrg;
        Mon, 13 May 2019 05:30:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZX6gK7BYRN696YIBixdVXEtzS8MPrUmqqBFNC9ESpOjyL7vJzJnmakDks3tpkhcETTF8v
X-Received: by 2002:ac8:1985:: with SMTP id u5mr21786434qtj.389.1557750632223;
        Mon, 13 May 2019 05:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557750632; cv=none;
        d=google.com; s=arc-20160816;
        b=nTlUn6zLWZoeKdDYIhPuVdQM324K+QOYf4tq7iuNrwJGcbqWRnp/wG475VtsRsq16s
         4rsRvWg57ImhX1J/X8JQa2JZodbALLQU4XHo9hzC6/m37MlfiScGkhWL/Sie2ZWs3ODx
         BS3Xl8y59xfLH4rus4hKoWLOhbz3KvyYukw9+2nNxe1JXeCdv0ixQQMc4gA9BJ2H6Rkh
         YyM99g/nfHdQgHNNQz28EEE5deTkne6IjWHywcPnbdgHb5ID1/FF/0Ku7WM1RmT1o06Y
         SoHYV5zCFFgcpbWCIFynfzMWOnYnxtjbuAtTDuIuSny6uCZBz461pV9E6ulnLbCuydlF
         LtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=GNkCVE7IIfOv5k+frYaUJ4oKmJcnKtTyWZjfBSwlcWo=;
        b=pLhciTPbpQTHXtDSED3HUNugb+DaOEaytsRUlthLMKCeq4DvOuoM7n3wL61W+XMEKH
         X6DJB9OclkRhpBPY/R7EtlvcxwnTT27j5TxZt4+yKcfG7NwBNRf8pVEHAeDxPry0iQOz
         p3U7Md2wJnHqvQbWhWvII5TnNZnot7ZgeLWJnhybLj1+F92szryKEeKLhC2MO5sKSe6h
         QJgQo2QSXV5wa4MYZmWKowcBAbpIr97gCl/2HaziZVhv5a+u0v+v0letnkAHHfu7K6Rx
         +JFIs5DKPWN2HP4eUx31fCQPWZtDb5zvqFppd+ZtFQQ4+n9FE410UTUHMRXXbJueWxNN
         eVhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id b16si1639qvi.107.2019.05.13.05.30.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 05:30:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B7EAE87629;
	Mon, 13 May 2019 12:30:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 580F75D72E;
	Mon, 13 May 2019 12:30:25 +0000 (UTC)
Date: Mon, 13 May 2019 14:30:23 +0200
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
Message-ID: <20190513123023.h4q5sihktqctkgml@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-12-drjones@redhat.com>
 <20190513112635.GD28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513112635.GD28398@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 13 May 2019 12:30:31 +0000 (UTC)
X-TUID: Rpmud8mnQZkM

On Mon, May 13, 2019 at 12:26:36PM +0100, Dave Martin wrote:
> On Sun, May 12, 2019 at 09:36:22AM +0100, Andrew Jones wrote:
> > Introduce another cpu property to control SVE vector lengths,
> > sve-vls-map, which allows the user to explicitly select the
> > set of vector lengths the guest can use. The map must conform
> > to QEMU's limits and architectural constraints, checked when
> > the property is set. Inconsistencies with sve-max-vq are also
> > checked. The bit number of a set bit in the map represents the
> > allowed vector length in number of quadwords.
> > 
> > Note, as the map is implemented with a single 64-bit word we
> > currently only support up to 8192-bit vectors. As QEMU and
> > KVM only support up to 2048-bit vectors then this sufficient
> > now, and probably for some time. Extending the bitmap beyond
> > a single word will likely require changing the property to
> > a string and adding yet another parser to QEMU.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/cpu.c     |  4 +++
> >  target/arm/cpu.h     |  3 ++
> >  target/arm/cpu64.c   | 70 +++++++++++++++++++++++++++++++++++++++++---
> >  target/arm/helper.c  | 10 ++++++-
> >  target/arm/monitor.c |  9 ++++--
> >  5 files changed, 88 insertions(+), 8 deletions(-)
> > 
> 
> [...]
> 
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 8292d547e8f9..f0d0ce759ba8 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -920,6 +920,9 @@ struct ARMCPU {
> >  
> >      /* Used to set the maximum vector length the cpu will support.  */
> >      uint32_t sve_max_vq;
> > +
> > +    /* Each bit represents a supported vector length of (bitnum * 16) bytes */
> > +    uint64_t sve_vls_map;
> 
> Just to be clear, the representation here is different from the
> representation in KVM_REG_ARM64_SVE_VLS?
> 
> In the latter, bit n represents vector length ((n + 1) * 16) bytes.

KVM also uses bitnum * 16. bitnum is the the bit number, not the shift.
So you can't have bitnum=0. 'n' must be a shift, as it would need to
allow zero in order to represent KVM_ARM64_SVE_VQ_MIN.

> 
> (QEMU is free to choose its own internal representation, naturally.)
> 
> [...]
> 
> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> 
> [...]
> 
> > +static void cpu_set_sve_vls_map(Object *obj, Visitor *v, const char *name,
> > +                                void *opaque, Error **errp)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +    Error *err = NULL;
> > +    uint64_t mask = ~(BIT_MASK(ARM_MAX_VQ - 1) - 1);
> > +    int i;
> > +
> > +    visit_type_uint64(v, name, &cpu->sve_vls_map, errp);
> > +
> > +    if (!err) {
> > +        if (cpu->sve_vls_map == 0) {
> > +            error_setg(&err, "SVE vector length map cannot be zero");
> 
> Maybe say "empty" here, since the map represents a set?

Empty does sound better when considering the map represents a set, but
the user will be inputting a number for the map, so zero will be what
they attempted to input.

> 
> (But it this is just for debug rather than reporting errors to the user,
> it probably doesn't matter much.)

I'm also not too worried about which term we use, so I'm happy to change
it if you'd like.

> 
> [...]
> 
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 1e6eb0d0f360..bedec1ea0b27 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -5254,12 +5254,20 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
> >  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                        uint64_t value)
> >  {
> > +    ARMCPU *cpu = arm_env_get_cpu(env);
> >      int cur_el = arm_current_el(env);
> >      int old_len = sve_zcr_len_for_el(env, cur_el);
> >      int new_len;
> >  
> >      /* Bits other than [3:0] are RAZ/WI.  */
> > -    raw_write(env, ri, value & 0xf);
> > +    value &= 0xf;
> 
> You might want to sanity-check that the max vq you configured for the
> vcpu is <= 16 here.

It's already checked by the cpu property set function at input time.

> 
> > +
> > +    if (value && !(BIT_MASK(value) & cpu->sve_vls_map)) {
> > +        uint64_t map = cpu->sve_vls_map & (BIT_MASK(value) - 1);
> > +        value = arm_cpu_fls64(map) - 1;
> > +    }
> > +
> > +    raw_write(env, ri, value);
> 
> [...]
> 
> Cheers
> ---Dave
> 

Thanks,
drew

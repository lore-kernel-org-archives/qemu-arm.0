Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2848199wrg;
        Wed, 5 Jun 2019 00:28:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxc28FPZi6AVqPgLyFVQMZ4i3edZVjMkS8Wg50M+u+0zNyqED/LA9UuNeBYTcXP9waDZkKM
X-Received: by 2002:a05:620a:1425:: with SMTP id k5mr30892038qkj.146.1559719683104;
        Wed, 05 Jun 2019 00:28:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559719683; cv=none;
        d=google.com; s=arc-20160816;
        b=sUWmb2Gud8+thZBlw2a92qqVkvQdVLEUsYgdZsRP7XKQvSyOoIyGEOTySacZjqT+JJ
         EI7TIpfGxrifIfeQc4tTICqI7zBFr4bjbpZwhX0Klvp14o2IBaUQzM8Ekcmq6thZUajM
         PrJJe1v6MIiMPNmKsn3oxtUmLRNQd0zicgzJuQIjErpHUHOIjw+jHX9e0JHok425ox4a
         yJiC2KmDYeVJ2/gZdJklouFcB0X+zzVOa+FZRpWTT0++fMoH3AkbCP13l61UAsb1QWTw
         QIJWpyhg9zwYpw9agTN3/kInJV7SG0ldNhEZp2+AqjBq534QfxlQfVz8QVoTSnUhmlN5
         6qDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=NgSpMP8S3JLoAoUebgxikNMwzZ2MRoMXf++Uf2eZO8c=;
        b=JTDArhdaN7TldizhCco6EGgS8PeT7Jfg371NYKu7nXR6GJvBWhIkHREOCiT/XgVuY3
         zlL19nfuVDLLV7RoHPXtHy8gSEATBsClmU5qlJrRL1g043jACiDtH/yVUfx2GU++6gve
         8KuoRsYaUlraEh8aPesvy/94a+z2TAMNLCIq0ai5hFpFB+IamheRQnmnbbUTkBdQJsw7
         uf5mzHRzpah0J9yDigbJG/YqiwwJW+sN2L2W/MDf7Hk5Fo2PpiCI2OTyDslNGKVxs+ZH
         RFjLX7d76oEGHENCT7XXkmFAwtVXo29sAscBUG4C5fg67AsucKR+eO0YKIt452Sk/srp
         Pwhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id c30si2496114qtk.109.2019.06.05.00.28.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 00:28:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F6D230C0DDD;
	Wed,  5 Jun 2019 07:27:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 722B95DF4C;
	Wed,  5 Jun 2019 07:27:38 +0000 (UTC)
Date: Wed, 5 Jun 2019 09:27:35 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	richard.henderson@linaro.org, armbru@redhat.com,
	abologna@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 04/13] target/arm/kvm: Move the get/put of
 fpsimd registers out
Message-ID: <20190605072735.tqgiprnilbacjppd@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-5-drjones@redhat.com>
 <7c0c0ef2-6ab4-fdf9-9507-d1f460bfbd51@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c0c0ef2-6ab4-fdf9-9507-d1f460bfbd51@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 05 Jun 2019 07:27:46 +0000 (UTC)
X-TUID: l0bkEyxYYyvX

On Wed, Jun 05, 2019 at 09:15:49AM +0200, Auger Eric wrote:
> Hi Drew,
> 
> On 5/12/19 10:36 AM, Andrew Jones wrote:
> > Move the getting/putting of the fpsimd registers out of
> > kvm_arch_get/put_registers() into their own helper functions
> > to prepare for alternatively getting/putting SVE registers.
> > 
> > No functional change.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/kvm64.c | 148 +++++++++++++++++++++++++++------------------
> >  1 file changed, 88 insertions(+), 60 deletions(-)
> > 
> > diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> > index ba232b27a6d3..61947f3716e1 100644
> > --- a/target/arm/kvm64.c
> > +++ b/target/arm/kvm64.c
> > @@ -706,13 +706,53 @@ int kvm_arm_cpreg_level(uint64_t regidx)
> >  #define AARCH64_SIMD_CTRL_REG(x)   (KVM_REG_ARM64 | KVM_REG_SIZE_U32 | \
> >                   KVM_REG_ARM_CORE | KVM_REG_ARM_CORE_REG(x))
> >  
> > +static int kvm_arch_put_fpsimd(CPUState *cs)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +    CPUARMState *env = &cpu->env;
> > +    struct kvm_one_reg reg;
> > +    uint32_t fpr;
> > +    int i, ret;
> > +
> > +    for (i = 0; i < 32; i++) {
> > +        uint64_t *q = aa64_vfp_qreg(env, i);
> > +#ifdef HOST_WORDS_BIGENDIAN
> > +        uint64_t fp_val[2] = { q[1], q[0] };
> > +        reg.addr = (uintptr_t)fp_val;
> > +#else
> > +        reg.addr = (uintptr_t)q;
> > +#endif
> > +        reg.id = AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]);
> > +        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    reg.addr = (uintptr_t)(&fpr);
> > +    fpr = vfp_get_fpsr(env);
> > +    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
> > +    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
> > +    if (ret) {
> > +        return ret;
> > +    }
> > +
> > +    reg.addr = (uintptr_t)(&fpr);
> I don't think you need this assignment

You're right, and they weren't in the original code, but I added them
in order to be sure that the register get/set blocks were complete
units. It's one thing to factor stuff like that out of a loop, but
here we had two almost independent blocks so it looked a bit odd.

[...]

> 
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>

Thanks,
drew 

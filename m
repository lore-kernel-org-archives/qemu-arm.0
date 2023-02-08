Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp6449651ejb;
        Wed, 8 Feb 2023 04:09:20 -0800 (PST)
X-Received: by 2002:a05:600c:4d04:b0:3dc:3f51:c697 with SMTP id u4-20020a05600c4d0400b003dc3f51c697mr1502990wmp.18.1675858160521;
        Wed, 08 Feb 2023 04:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675858160; cv=none;
        d=google.com; s=arc-20160816;
        b=Fs1Ctp9h9IJ5pG8PWGWV6pBQMDBlE1eS2f/UktGL6rt/u1ZpDHrFhR0dSIeQ11LMVC
         2nqMn/9g1KJm49RaepWHqGLyEt9TMGbpF1RgUnt8TI/upDhf6CuK7sLCueJHc9RQ8eqw
         fGOV6iJUyGVETA0VJ7JXj4xOoDOEtDmZ9llKtiowzMgGQE32plLWGckHXyN36NX+/vgr
         z7dk6QQlzQf2qcDQ8NkzBYZrq07+GltM+DSei6kokeBc4HdyytZTzxV3xAsMbsJ1Awn+
         Ttko2yyLnIysrBu/BG73wma5tcslvjdnWDEMAjfTMw8Ho9sQEVcGkiffBsb/sDsAyKKB
         iiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=R1KjEsIGivqmk2K1yIzvCiCv9uH4m8neXzHqtilaC7k=;
        b=Y8CO7YfZGXZEa7X5oeq/8t3wW7QDIQTX0xFeUlwUNnure6L9jXvkZXzSPYZS7pnkJ4
         zNgDPpQ2p7L9BlRByEciSOf6BHKtn+H5jm+a5mfIPDF2tBIsFAP53T0rrmSqukCvo+6O
         hCf3eQCL3S0GD6zCkbZmT9w/oWPIHMqLPEhD27Pir+j3i/FEZpGFzDvbbbhDah6nDDf5
         LtFGhw76viqP5u/5E0HWgBZaYG09g8xyysrzXdhuj4IMgRow66E+/of2iDrs4k29rULM
         qQUmVbGXXGVw4zyQjrdTkeC0KyKWRdaVpVN0doQnza5Sj8JmH7yoRj04HLmSJi97dKFl
         4Oog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cp3dCR69;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b7-20020a5d4b87000000b002c3e89039b8sor3586772wrt.3.2023.02.08.04.09.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 08 Feb 2023 04:09:20 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cp3dCR69;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R1KjEsIGivqmk2K1yIzvCiCv9uH4m8neXzHqtilaC7k=;
        b=Cp3dCR699ZdvJSjIVe0PStARxtmQYIkDU5fFBGXcYp4+OCs37zq3GkGzYxOZWRiRek
         5eZ94pCZ/4Kyd5YfIrmsDxac2ObV1+Rx1+Vvn0T6GEitaa68+koFH9NRE6iER57aNINg
         4hbFtFJ9cTv9BEZ/APRjOHJtIuFddAD6IVOrSLPkcQarP6jCLsL7jt1Gp0AHK2LbAO89
         YHFu67RS4kvnrpVKcIovb0FvjyR28Iw1HNZVhLS4NRdR8ZoRnCo4aFlwwACJkBOu9/z8
         Rt0KpNzxWPhDF9S2f0ofJJhkpwPADC5zl8JbYOjRtznuCxaPu35qkSCnj1GMGP42X3gN
         ffnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1KjEsIGivqmk2K1yIzvCiCv9uH4m8neXzHqtilaC7k=;
        b=TaPmanI/EDEQnA/GJEvDB/0B5u589nqJ5X2faOdYVNsf2yVGQYIjuQRWdN+AsqeRhH
         086vmh4swV2U4/hNgRdDiQqTi88JWmYsKYvaPhnAQStmQFWN5n1RB6kA+ORHn/XEIMJh
         +fk+AQou1DQpSngdLBtuY+M01+UsjWdN1StM1RdH+hagoqllD4Fz1Z1ofnlA+LfDoUlM
         l+MyXXTtZLNjuVrLZ3u9LpYmjdkAlkxCPhMQUJVf3ZP/sitmcyVAwNXmZl2EhE9ypoXn
         Dz8Pdus/QY4RJIzAhJya37AIg7+6SlgxNIOGBdmPMXkuZWmcU/YPqtMRxxsGTAd4dMV2
         vKjw==
X-Gm-Message-State: AO0yUKWuFLH3goCQpmuJne6b+J1HfKyBCP8RATsmlElRr7Zep4smoyRS
	vdId+ELnHyxUDYjNog2vwIJSwf91
X-Google-Smtp-Source: AK7set9L3g0peABdtqjI1GwvyHk90RkErGk1b06C4BXzbvCj3ut0E+ZzfImbb6LtKGqEoYU+vSIwcA==
X-Received: by 2002:adf:e688:0:b0:2c3:e378:41d5 with SMTP id r8-20020adfe688000000b002c3e37841d5mr1549591wrm.60.1675858160331;
        Wed, 08 Feb 2023 04:09:20 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id u17-20020adfdb91000000b002bdd96d88b4sm13684240wri.75.2023.02.08.04.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 04:09:19 -0800 (PST)
Date: Wed, 8 Feb 2023 12:09:15 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	pbonzini@redhat.com, eblake@redhat.com, armbru@redhat.com,
	berrange@redhat.com, eduardo@habkost.net, alex.bennee@linaro.org
Subject: Re: [RFC PATCH 06/16] target/arm/kvm-rme: Initialize vCPU
Message-ID: <Y+OQ607mAYqONH98@myrica>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-7-jean-philippe@linaro.org>
 <85606bc0-5e48-9280-781f-b9641c36ce03@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85606bc0-5e48-9280-781f-b9641c36ce03@linaro.org>
X-TUID: AAKsSXB8y7NS

On Fri, Jan 27, 2023 at 12:37:12PM -1000, Richard Henderson wrote:
> On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> > +static int kvm_arm_rme_get_core_regs(CPUState *cs)
> > +{
> > +    int i, ret;
> > +    struct kvm_one_reg reg;
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +    CPUARMState *env = &cpu->env;
> > +
> > +    for (i = 0; i < 8; i++) {
> > +        reg.id = AARCH64_CORE_REG(regs.regs[i]);
> > +        reg.addr = (uintptr_t) &env->xregs[i];
> > +        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
> > +        if (ret) {
> > +            return ret;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> 
> Wow, this is quite the restriction.
> 
> I get that this is just enough to seed the guest for boot, and take SMC
> traps, but I'm concerned that we can't do much with the machine underneath,
> when it comes to other things like "info registers" or gdbstub will be
> silently unusable.  I would prefer if we can somehow make this loudly
> unusable.

For "info registers", which currently displays zero values for all regs,
we can instead return an error message in aarch64_cpu_dump_state().

For gdbstub, I suspect we should disable it entirely since it seems
fundamentally incompatible with confidential VMs, but I need to spend more
time on this.

Thanks,
Jean

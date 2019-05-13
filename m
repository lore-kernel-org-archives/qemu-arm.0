Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3123846wrg;
        Mon, 13 May 2019 11:14:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNq1vhuy3q03SqILxGDh1gX6U9P+gYByHkwWvB3kkAjOrX4KjUXWp2OBIlYZNlSvXlqXNn
X-Received: by 2002:ad4:534b:: with SMTP id v11mr24166347qvs.31.1557771269091;
        Mon, 13 May 2019 11:14:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557771269; cv=none;
        d=google.com; s=arc-20160816;
        b=xXVW91vMmn+0J9tKyvJRc/AC8uwbUJljs848PtvKapTrbpFp6IEUdGDHbHViLRGw0k
         J5lGPI5RlenVSs1EtBAxkp0/KPook6cPeHrcmpCGI7F90Hb11h+z78LIgWmfR3CvDeio
         G9Nv4HmXGTOEGcrlNCdO4L8z5z14CK0E1vx6C6GmSE/qHHz0xqiuW2THSVUG3wOXu6M1
         EGppJU40XzEOeeuSrqOP9dvNcmOVZOTi38mumifYcHmZcyIsERkyMCK/OKK08l8xH1sM
         iuOPq8DhaXKGm7e47uB+PB/wfw97ojIQgR3qpsJq/xT9gNKMDeAV4+4DH+O0PJaWzDrs
         psEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=ueDqCdaY1c9w8sLq7XUWzqkllZwlUoixm6pZh7pBOU0=;
        b=enAyUZ6f5AhfQTGigbWFSfrjV2woZJM3sWgbXPy6CGg2XFoYeJFGHtFPC3ql8OS1GC
         N5VoKYidQYCzgyzqkE7nqQuypqp13DdMFDQPotB42T7QwE8jzXiDs7LmuUFxk+NXkBje
         /oASAR4UVfZrOYgjnTI3jyL2FUbxdVTsHGcVlntHGhc1Q2xorOAWtrIYrcF93mkoDiAS
         GW63Yo95bnfeACfAKRAqEDDhIADMiGkUr4SyURFGIpEbAtWnyx6of8nTwNq/XYbMw5SV
         ITkfP2sMX0HD742Z+RqfLiLUlgLSoyuSNXBVqiHbGpLwcQj+/rjFw7jYUIne9JdGOM4o
         AjIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id k28si2346621qvf.36.2019.05.13.11.14.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 11:14:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 736273082B55;
	Mon, 13 May 2019 18:14:27 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3FB060C4D;
	Mon, 13 May 2019 18:14:24 +0000 (UTC)
Date: Mon, 13 May 2019 20:14:21 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"abologna@redhat.com" <abologna@redhat.com>
Subject: Re: [PATCH 05/13] target/arm/kvm: Add kvm_arch_get/put_sve
Message-ID: <20190513181421.g25e2zqlkks7ntxb@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513123110.GE28398@e103592.cambridge.arm.com>
 <e35ba07e-2844-fe2d-ca4a-0f795a1485b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e35ba07e-2844-fe2d-ca4a-0f795a1485b1@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 13 May 2019 18:14:27 +0000 (UTC)
X-TUID: /FqT33U8JIxP

On Mon, May 13, 2019 at 09:40:29AM -0700, Richard Henderson wrote:
> On 5/13/19 5:31 AM, Dave Martin wrote:
> > On Sun, May 12, 2019 at 09:36:16AM +0100, Andrew Jones wrote:
> >> These are the SVE equivalents to kvm_arch_get/put_fpsimd.
> >>
> >> Signed-off-by: Andrew Jones <drjones@redhat.com>
> >> ---
> >>  target/arm/kvm64.c | 127 +++++++++++++++++++++++++++++++++++++++++++--
> >>  1 file changed, 123 insertions(+), 4 deletions(-)
> > 
> > [...]
> > 
> >> +static int kvm_arch_put_sve(CPUState *cs)
> >> +{
> >> +    ARMCPU *cpu = ARM_CPU(cs);
> >> +    CPUARMState *env = &cpu->env;
> >> +    struct kvm_one_reg reg;
> >> +    int n, ret;
> >> +
> >> +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> >> +        uint64_t *q = aa64_vfp_qreg(env, n);
> >> +#ifdef HOST_WORDS_BIGENDIAN
> >> +        uint64_t d[ARM_MAX_VQ * 2];
> >> +        int i;
> >> +        for (i = 0; i < cpu->sve_max_vq * 2; i++) {
> >> +            d[i] = q[cpu->sve_max_vq * 2 - 1 - i];
> >> +        }
> > 
> > Out of interest, why do all this swabbing?  It seems expensive.
> 
> Indeed, to me this seems to be the wrong kind of swabbing here.  Exactly what
> format is KVM expecting?  Surely it should be the one used by the unpredicated
> LDR/STR instructions.  Anything else would seem to be working against the
> architecture.
> 
> If so, the format is, architecturally, a stream of bytes in index order, which
> corresponds to a little-endian stream of words.  So the loop I'd expect to see
> here is
> 
>     for (i = 0, n = cpu->sve_max_vq; i < n; ++i) {
>         d[i] = bswap64(q[i]);
>     }

That's the opposite of what we do for fpsimd registers though. I'm
fine with doing whatever KVM/TCG needs, but so far I was just following
the same pattern we already have.

Thanks,
drew

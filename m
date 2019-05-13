Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2851770wrg;
        Mon, 13 May 2019 07:07:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxu7kgON6Q21o0WVwLYe8NCGI4chOfj0vamMVXdZFku9wOctul3D79lSDvdGR+CaepXSq8C
X-Received: by 2002:ac8:88f:: with SMTP id v15mr24545858qth.382.1557756461814;
        Mon, 13 May 2019 07:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557756461; cv=none;
        d=google.com; s=arc-20160816;
        b=La8yvvDq2JufFvBkztnuDYNvdY+JLZEY4VsKVEBx/9lxd1kyO9yz5tXINPBMEhDbI1
         9IKTwcxF5N4emBAFQ1OVsnF5WuDpF5HnG6ee3CHcudYZBFsfbSfu/xUFi1DcdQDWeWyF
         Tcoajpjew+I2P2/TTqedWkfsj9B4bjMJ8w0eWXjAcEQEiDCCUovX/WowHsh2RG/EM4J2
         71xcS1kpFCzRJ53YfKjln152XIebiphDkE1YR7fJLHoOBHA50St1sGKIdGAHtDfARNTq
         gIbGNuAl3xbBTrgTVlDM9QIIf/eQRj3Ex+ikspCWRAuM5hzdjz1vOpVI8mMMiVugGjlk
         c6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=dfHyn6A4XaEzShkFwH0Asmft72KYBs8QZtpGAn/btcA=;
        b=ZWqDHlmymvrJnvVADmcdjY4Son81x5mW26woGk2JiuO3CEfa6pHukwh5RhYikNgbYZ
         Zqgv8tQBFZjkqcn6Sej/FstXmV0aaVDdRLbfc0WLM0+i9rMc1exVtXkvDIvOJuiDS9kk
         7wbM3J7QdrY7/5RQA9SVXJv8bPEdcW+GvbxPk3sxxS6n9qFtQTjVD/zkCJC5ytEJJgqf
         CHzWNruYjhgDEFszTi6ypvE4QdZLOQ/W2yCJZsK1FYxopeqUE5qTdZzoBMFj71efjphb
         iaURvpC4+BRk2ybHoli+qUN3LKjNj4YO2V5MM+SpBD0hI7eQLZShELdNp+06ngJEqTqn
         SE/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d6si2668321qtj.292.2019.05.13.07.07.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 07:07:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DAB053092676;
	Mon, 13 May 2019 14:07:35 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20F536A498;
	Mon, 13 May 2019 14:07:29 +0000 (UTC)
Date: Mon, 13 May 2019 16:07:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"abologna@redhat.com" <abologna@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 05/13] target/arm/kvm: Add
 kvm_arch_get/put_sve
Message-ID: <20190513140726.vpmenrfw4uocmtnc@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513124356.GG28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513124356.GG28398@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 13 May 2019 14:07:41 +0000 (UTC)
X-TUID: AJvshmwLOmKw

On Mon, May 13, 2019 at 01:43:56PM +0100, Dave Martin wrote:
> On Sun, May 12, 2019 at 09:36:16AM +0100, Andrew Jones wrote:
> > These are the SVE equivalents to kvm_arch_get/put_fpsimd.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  target/arm/kvm64.c | 127 +++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 123 insertions(+), 4 deletions(-)
> 
> [...]
> 
> > +static int kvm_arch_put_sve(CPUState *cs)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(cs);
> > +    CPUARMState *env = &cpu->env;
> > +    struct kvm_one_reg reg;
> > +    int n, ret;
> > +
> > +    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; n++) {
> > +        uint64_t *q = aa64_vfp_qreg(env, n);
> > +#ifdef HOST_WORDS_BIGENDIAN
> > +        uint64_t d[ARM_MAX_VQ * 2];
> > +        int i;
> > +        for (i = 0; i < cpu->sve_max_vq * 2; i++) {
> > +            d[i] = q[cpu->sve_max_vq * 2 - 1 - i];
> > +        }
> > +        reg.addr = (uintptr_t)d;
> > +#else
> > +        reg.addr = (uintptr_t)q;
> > +#endif
> > +        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
> 
> Will this silently go wrong if more than one slice is required (i.e.,
> the register size grows beyond 8192 bits?)

Yeah, I could probably implement the slice loop now and add a
function that returns 1 (for now) like your vcpu_sve_slices()
function in KVM. I'll do that for v2.

Thanks,
drew



> 
> [...]
> 
> Cheers
> ---Dave
> 

Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2836721wrg;
        Mon, 13 May 2019 06:55:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzJQlV7iW6L0yg9DAZBf9jyuaDvxMw6RNuJVIgM+NaofheKo69kfKzwAy9G7VNdnjrMql0B
X-Received: by 2002:a0c:9ac8:: with SMTP id k8mr22663947qvf.132.1557755714627;
        Mon, 13 May 2019 06:55:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557755714; cv=none;
        d=google.com; s=arc-20160816;
        b=h3TjHQSZQ7sF7VcDyVSH/jJffX9XPogLIhR4fNz+y+bfsJYc6GhM1SFA3xc/g9F6jk
         jDRVPPPRsV8/bsqdskA8Iqeeuix4WqwkTfwMitt5m+vJKIAaZBLX1QJgtysDwHv6D1UO
         XJZxVmEjHq+G4APMu2V+iyTMzOJzFhAqEiwD9eNpKpS4MzlYZB4KgrifeE5yDmTVG0Xl
         hx4tiAMsHLEUyQT8nrGMQT77heKXCqRF8aZ6QZCpjnnuoinjbSmuUz6z3o/8KqWmmQXA
         4GwdSmKgeWQoY25aXvLm4WAMxbz0SFr9HdpDuWRERdDnmdL+TPCpvdY7Tw6TkoK9j/6a
         Ut2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=pLgxpd04MaY61COPlh3bNRew9YOXYwTMoUmbaTjNdB0=;
        b=qYK2Spz7RSrsa3pwsYWkkxU+b1UdCmW4bcXhfZqPlUr2kdpdVn99tmKttlqSAFhbt9
         n94B4fO1tZngUnRF8m380+MEi3YreurBrkz7VOBYLzgxa+NXAQitmEntSxv8HYusDvY3
         8U/zXq4pFirNXJdCSNm3jAc6fIyDFaJz19B1HICzdtQX+MS5T+3NcyK4nrlNgZ/krN6C
         2TgVLjcCcweXIu5jeVww4RKgCj8/bb3Xw7pvZqDh24bwy/lkjNoS1HUYCKU8VCpQCbk3
         5chd25naXUgSFGZr1OQS1OY02I3uAtBYoI2Du9LpstEvFVSXBaKAgELgrsl9xbgPwzoA
         MRGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y34si1828261qvf.20.2019.05.13.06.55.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 06:55:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB0A0301EABA;
	Mon, 13 May 2019 13:55:13 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1471563BBA;
	Mon, 13 May 2019 13:55:09 +0000 (UTC)
Date: Mon, 13 May 2019 15:55:01 +0200
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
Message-ID: <20190513135501.ztggqdac57qbpuft@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-6-drjones@redhat.com>
 <20190513123110.GE28398@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513123110.GE28398@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 13 May 2019 13:55:13 +0000 (UTC)
X-TUID: YlSx1qsRDvAT

On Mon, May 13, 2019 at 01:31:11PM +0100, Dave Martin wrote:
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
> 
> Out of interest, why do all this swabbing?  It seems expensive.
>

QEMU keeps its 128-bit and larger words in the same order (least
significant word first) for both host endian types. We need to
do word swapping every time we set/get them to/from KVM.

Thanks,
drew

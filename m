Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3128613wrg;
        Mon, 13 May 2019 11:19:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx+hQh7QFa5vRWfQyDDeB8WXyePyN0V9cB7Ji2v6oBPENYxvQ4c0Ewsl19UYGwrHkiJZ0zn
X-Received: by 2002:a37:6ec3:: with SMTP id j186mr23486851qkc.148.1557771555675;
        Mon, 13 May 2019 11:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557771555; cv=none;
        d=google.com; s=arc-20160816;
        b=bKkEdJUcnz9v1yc3iyU3/ZhvbXboeBJSRzofcLl774RnG3B9TtH324Y/ITIb92eaiY
         CdhuDPXe86ylgWT/col6Obs1Gxu01I0UhjXP5TEFUM9C3Kb41LIXj3mX+CMCGMFxcnsS
         P2pJtdI7TvAnHX2vOfZaJwNApm9DoMkFK6wBgiP45v4J4HKYoNAy0+floTGz03y1Vr9k
         j3zjN4yQGjSL31kKFZUE3YKc3L7ielJVVpX4qSeF5FbAeFCXHFkLfumX3oomvk70KMRO
         t11gpKsLawhzN9A1l1+WGA9cveOyWqgTEWTlPNCXxT7dyZFgwkPBftXbflqZxclmq7S1
         I0aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=ZFOcACzQh3g40SNp2Z+r9BletY6tSmUsfOs+9i6tBNY=;
        b=pXD831UAIcpF2w4kjDHTh+uhioJILVS07eBd7Qu9mMpUyEUTC9lCkLK6t4+P6w4ETw
         /oD+pJe31rqtuUWQu5SgeTI3+798LohvolFPryDcPanYpdGjZbHyRCSE1muv4U/Pt7T2
         Z2cBFna0v1nMLobOF5tXyATFB+uAH+pEdpxj6BypqULcL+eZpiT90Chhnv7OTpMUrNeh
         BX42UlMCLeco9ZxScMttve0P+8N/vmmeS0cYW7XzbiL/rjKcfOQ6Ocj8mi9NnrwnPRDx
         DjFT01yWQ3wHb8mZ6272Z6S0inZpWORl7hzWmbGQRqVEwuloFZebKCVvdvd5PiD65VH8
         PbFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id x11si1479024qkn.40.2019.05.13.11.19.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 11:19:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7E2F307D863;
	Mon, 13 May 2019 18:19:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (ovpn-116-151.ams2.redhat.com [10.36.116.151])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 158125D706;
	Mon, 13 May 2019 18:19:11 +0000 (UTC)
Date: Mon, 13 May 2019 20:19:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	abologna@redhat.com, armbru@redhat.com, alex.bennee@linaro.org,
	Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH 07/13] target/arm/kvm: max cpu: Allow sve
 max vector length setting
Message-ID: <20190513181908.cpep23i7x77gsgai@kamzik.brq.redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-8-drjones@redhat.com>
 <50d07a50-d780-2c73-d9d8-f6eeff6a17c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50d07a50-d780-2c73-d9d8-f6eeff6a17c8@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 13 May 2019 18:19:14 +0000 (UTC)
X-TUID: JGEOO7lVS7hz

On Mon, May 13, 2019 at 10:19:25AM -0700, Richard Henderson wrote:
> On 5/12/19 1:36 AM, Andrew Jones wrote:
> > @@ -292,7 +292,7 @@ static void aarch64_max_initfn(Object *obj)
> >  
> >      if (kvm_enabled()) {
> >          kvm_arm_set_cpu_features_from_host(cpu);
> > -        cpu->sve_max_vq = ARM_MAX_VQ;
> > +        cpu->sve_max_vq = -1; /* set in kvm_arch_init_vcpu() */
> 
> Perhaps a better comment is "unspecified, to be finalized in ..."

OK

> 
> > +    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
> > +                        cpu_max_set_sve_vq, NULL, NULL, &error_fatal);
> 
> as one can set it here, via the command-line.
> 
> > @@ -644,6 +702,24 @@ int kvm_arch_init_vcpu(CPUState *cs)
> >      }
> >  
> >      if (cpu->sve_max_vq) {
> > +        uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS];
> > +        ret = kvm_arm_get_sve_vls(cs, sve_vls);
> > +        if (ret < 0) {
> > +            return ret;
> > +        }
> > +        if (cpu->sve_max_vq == -1) {
> > +            cpu->sve_max_vq = ret;
> 
> You still cannot set a value larger than ARM_MAX_VQ, as that is the fixed
> amount of space allocated within the cpu structure.
>

Good point. I should check against ARM_MAX_VQ here.

Thanks,
drew 

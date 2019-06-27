Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1201264wru;
        Thu, 27 Jun 2019 04:56:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSFYCeJ3GM3hb7FTCiSvjhMO6XcheTrApvDjXlw6WmWNuVhJtTcsLKfHk8UFbHVjMk/3pi
X-Received: by 2002:a37:a86:: with SMTP id 128mr2982781qkk.169.1561636578609;
        Thu, 27 Jun 2019 04:56:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561636578; cv=none;
        d=google.com; s=arc-20160816;
        b=PeRgLzKCVgBmGIS2kM0O0R1wkXDHFwDwNY2uEZlFgV9V/tIeBPtAkYSNUw3SWkoIWQ
         nX9I7SZMIbyyOILqBT7KnCSXyCMpLLSPU0F7Ew424ThFFjVt+HOYv+bbJig3PWheptXl
         Z0SpXbvHnSlzJ3vQTlzr1aR7YhaNIe96QoZVKLIT9DueqkW2a8V8P5oMYxeQ9douLZm9
         sP/+dXKH0amS+/dKeF/nWCmBewrH+I/aXWguhfai0m5BUGeYdLj30ADDVyxIcaIxQKQb
         jduq7fNj0AcgOuaoYeHASCtbJx04LbFHHOkwKO9hF5KmBSnt7Y2YEdVdWGHOM6glALEm
         ZJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=JNHyjtKXydQ2yT/xaM2FPPWnUv/XHAmNJDhcvJY8Wos=;
        b=l3/SntoQyJyR+e28Ki7Cs/XAiK6VIa0lSk5IhG6q19tV41uhkDyZMbiten+xn+8UB+
         wuYvIVX9Fg9e81b8JsZYoyb99o0pO9W3mvkRKuA9+Zg3faNYlbNT7XRkhuiXWToTLfCL
         0MJp8Z0YtMdXjm4Rm1JUwlRpd9ZYt+VUZQC632MXx8e1fdLghY3NsbJ7OcDoJKEYE5o5
         MsTYwUuIp3ybdbOffbeRrNoYkOje3RqAfqjx0olr354DrYWyZg/RgNrhozDlzBz+QSYg
         sWy1IV4LPivnU7p/YkpIiQ44vbf/STGC21uYT1dHxsJZQkxOeU4rYS4xGEMegFNddLQu
         gHtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 8si1555211qtu.149.2019.06.27.04.56.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 04:56:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79C4B3082E63;
	Thu, 27 Jun 2019 11:56:11 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4E54614D8;
	Thu, 27 Jun 2019 11:56:08 +0000 (UTC)
Date: Thu, 27 Jun 2019 13:56:06 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 11/14] target/arm/kvm64: max cpu: Enable
 SVE when available
Message-ID: <20190627115606.c3pd3acjhufntrvr@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-12-drjones@redhat.com>
 <bd43a392-18a5-b04c-9a52-d4113ab1e5be@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd43a392-18a5-b04c-9a52-d4113ab1e5be@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 27 Jun 2019 11:56:15 +0000 (UTC)
X-TUID: bWpVFv8WK0Sa

On Wed, Jun 26, 2019 at 01:09:45PM +0200, Richard Henderson wrote:
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > @@ -675,6 +689,11 @@ static void aarch64_max_initfn(Object *obj)
> >  
> >      if (kvm_enabled()) {
> >          kvm_arm_set_cpu_features_from_host(cpu);
> > +        /*
> > +         * KVM doesn't yet support the sve-max-vq property, but
> > +         * setting cpu->sve_max_vq is also used to turn SVE on.
> > +         */
> > +        cpu->sve_max_vq = ARM_SVE_INIT;
> 
> Can we support this value with KVM_GET/SET_ONE_REG on ZCR_EL2?  (IIRC KVM
> requires VHE to support SVE, so the host is always EL2 and the guest is always
> EL1.)
> 
> Or do we need to probe this via normal userland prctl?
> 
> Or am I getting ahead of the patches to follow?

Hopefully mostly this, because I didn't understand the concern with VHE.
If it still looks like something is missing after looking at other
patches, then please come back to this to help me understand.

Thanks,
drew

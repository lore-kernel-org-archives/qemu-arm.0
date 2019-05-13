Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2672359wrg;
        Mon, 13 May 2019 04:16:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyC9Twvx+XUMz9We81ytECkFqn/JweQuqhzWgOryIWuS1AXIo5dCmDao3/CnliD0EhnrgbE
X-Received: by 2002:a50:bdc2:: with SMTP id z2mr28044284edh.245.1557746161597;
        Mon, 13 May 2019 04:16:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557746161; cv=none;
        d=google.com; s=arc-20160816;
        b=bSzmG1gR/v8BSknMJ1iymIwTQQmfuabbp8ABRolqtwz763NJMXn381/yz4mV2AodxH
         pmmcVocZqp+1O6Q/USpt6THRKN+gS3JOC4hkqj6a+ErSbK9Y5MvCZoTYqJ3z6jEVOK+H
         8w+jSmNyxtymOIT5IhrDGrIGf4ln1rvgoHj/iEsJl+Wet1HAqx/CHRqyZ253ymzYbL4o
         EIiR1UeSlpSXAb/rLWTTZwN8UrHMZzM6Tun/vV4+Jb2fd7RDnEcXtlTN2l+bwLA59EHf
         /lBt/YBQyvU4eTaNuizhu5CRamRv2bqTvJ4iecV1EEi3YTXUYbnyIuYfiORpWHc0seaw
         T47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=3/PDJ4kPk5px4Po8z8KuMVhlfk8rkSLYOYpqDzWzlU0=;
        b=QtVX9thajPvOLvCUa/InPKGXxiCL9HNOOiUZ/xrf+knOCCaV3jHdaAGnWINk94mDvF
         JDrDD3LKrCfN12WvSEzZnghXTOQnMGjLx7hD7LHnWTuDBCWYuq+/XQA1kSicHqAwfwLV
         A8jpS9xPeekO7Bi8QN0TLb6LLizLu0kRD3ou//loTLcjfEGbg7dXB+ElfG5zfxNzmcHy
         MN386WiCG7Sq42xo1mQ94TqM69CL5Jl+SAGXTUHTOhm19X8ZSrZ3MkRElh41lcyZkJSM
         D/JOOKOg9Jbgh2h2GAviJFh1pvFrVmqsPvOKVCRvxzHiJIWUoWEXZ8laoa9dAw5aYbYM
         AM9g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id 22si9806710edu.283.2019.05.13.04.16.01;
        Mon, 13 May 2019 04:16:01 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BAA5374;
	Mon, 13 May 2019 04:16:00 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0B6D3F703;
	Mon, 13 May 2019 04:15:58 -0700 (PDT)
Date: Mon, 13 May 2019 12:15:56 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>
Subject: Re: [PATCH 00/13] target/arm/kvm: enable SVE in guests
Message-ID: <20190513111555.GC28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: hAv+TpapdUjb

On Mon, May 13, 2019 at 10:32:46AM +0100, Andrea Bolognani wrote:
> On Sun, 2019-05-12 at 10:36 +0200, Andrew Jones wrote:
> [...]
> >    CPU type | accel | sve-max-vq | sve-vls-map
> >    -------------------------------------------
> >  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
> >  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
> >  3)    host | kvm   |  N/A       |  $VLS_MAP
> > 
> > Where for (1) $MAX_VQ sets the maximum vq and smaller vqs are
> > all supported when $VLS_MAP is zero, or when the vqs are selected
> > in $VLS_MAP.
> 
> I'm a bit confused by the nomenclature here. VL clearly stands for
> Vector Length, but what does VQ stand for? You seem to be using the
> two terms pretty much interchangeably throughout the cover letter.

From the Linux end, "vector length" or VL refers to the size of a vector
register, either in no particular unit or in bytes.

"VQ" refers specifically to the vector length in 128-bit quadwords.

In some situations, neither terminology is obviously better than the
other, such as in the way KVM_REG_ARM64_SVE_VLS is encoded.

> [...]
> > There is never any need to provide both properties, but if both
> > are provided then they are checked for consistency.
> 
> I would personally just error out when both are provided.
> 
> > The QMP query returns a list of valid vq lists. For example, if
> > a guest can use vqs 1, 2, 3, and 4, then the following list will
> > be returned
> > 
> >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]
> > 
> > Another example might be 1, 2, 4, as the architecture states 3
> > is optional. In that case the list would be
> > 
> >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ] ]
> 
> I think the proposed QMP command is problematic, because it reports
> the valid vector lengths for either KVM or TCG based on which
> accelerator is currently enabled: it should report all information
> at all times instead, similarly to how query-gic-capabilities does
> it.

I wonder if this is premature flexibility?

The size of these lists is going to get cumbersome if the architecture
is ever extended.  Even today, we might need over 100 items in this
(nested) list.  If this is to be presented to the user this will be
far from friendly, it could get much worse if the architecutre changes
in future to allow larger vectors or more flexible virtualisation.

Could we just have a list of supported vector lengths and a possibly
empty list of additional capabilities that describe what kinds of
flexibility are allowed?

So, for example, we might support vector lengths of 1, 2, 4 and 8
quadwords, with the the ability to clamp the max vector length the
guest sees: the kernel ABI guarantees that you can do this, even
if you can't disable/enable each individual vector length independently.

So, [ 1, 2, 4, 8 ] seems sufficient to describe this in a forwards
compatible way.

Some day, we might report { "independent", [ 1, 2, 4, 8, 16, 32, ... ] }

I'm guessing about the data representation here.

[...]

Cheers
---Dave

Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3684301wrg;
        Mon, 24 Jun 2019 04:49:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdax7xsQxJtvaRsKTVaDsyqPuV4TC0dOr3U5CicEvyq9uGHZUZee3Sgh7IIhM7pNFcmeZv
X-Received: by 2002:ac8:6958:: with SMTP id n24mr24616415qtr.360.1561376970751;
        Mon, 24 Jun 2019 04:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561376970; cv=none;
        d=google.com; s=arc-20160816;
        b=PY+YWsQQP6jHmIN7VPPrJHUx9EpG5KbdwNvheVTCjRYQCiDaoevkrouvEA5W9Jz0eO
         AzArmx3DAp8U8Bk79SyX+wwODaCzhZ3+Ekk0n3dhK/9PRTshQprwxPvjBUzLjV4NZnPa
         qlej2JAxX6k2VYqcx0UGkh7OUuj2ALaGANJ29VHr7wNYD60WwVG7bbMShhwVZ4JUVHk3
         XbOwklttdxyUegyqJZVEWSzgXjw3GL+/l4MzQwLntBZjcbnRelAzMiLNE0gwMlircuNm
         f/IoBra7S7raBX4dV8vLWlkBEIu3JyVV4cjRnswUSuTl7zvPd/n13un2wJ848hrcxqIk
         6/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=ejrafpDX7Jd6BGyH+WuFTi1VegB22+5VAPlEQ0ojy2s=;
        b=d+rcBogXfauZ0i+AGVKQ8zbtQUX3cqu2hPLZm8acW5xOiL/zjQU03qSwfLp/5eO8Xa
         3bV18nvQXtp5BtkSZizQih13jwWuaJO0Twsq2gj/q7ykcS7r+Ld/0tgxMsE/SjtrThrq
         wWob1C3JGmJKLmfj1JEusO4S/EHeBItePIN5JVFzHxAWWQwlv3tiA7WECZ3edeXRHYbn
         uV0+dFQwjQDoUca6hUQw1Xq5ASNqIFDvhYiMRMdCOgxdy2t29LzYVLdB0vqyqkKGUFst
         6lIo18IDWFK8BM0HbuBxZXuIB/wkY01ouj0uXcJyeleB0MXSuTm7rm6Q2UxD+ym1YHe+
         ep9A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y30si651254qve.109.2019.06.24.04.49.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 04:49:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B172559473;
	Mon, 24 Jun 2019 11:49:19 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAEB919730;
	Mon, 24 Jun 2019 11:49:13 +0000 (UTC)
Date: Mon, 24 Jun 2019 13:49:11 +0200
From: Andrew Jones <drjones@redhat.com>
To: Dave Martin <Dave.Martin@arm.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Subject: Re: [PATCH v2 07/14] target/arm/cpu64: max cpu: Introduce
 sve<vl-bits> properties
Message-ID: <20190624114911.xb4xdcbv55p2rufv@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <20190624110526.GH2790@e103592.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624110526.GH2790@e103592.cambridge.arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Mon, 24 Jun 2019 11:49:19 +0000 (UTC)
X-TUID: fBQbyHC+kkmy

On Mon, Jun 24, 2019 at 12:05:26PM +0100, Dave Martin wrote:
> On Fri, Jun 21, 2019 at 05:34:15PM +0100, Andrew Jones wrote:
> > Introduce cpu properties to give fine control over SVE vector lengths.
> > We introduce a property for each valid length up to the current
> > maximum supported, which is 2048-bits. The properties are named, e.g.
> > sve128, sve256, sve512, ..., where the number is the number of bits.
> > 
> > It's now possible to do something like -cpu max,sve-max-vq=4,sve384=off
> > to provide a guest vector lengths 128, 256, and 512 bits. The resulting
> > set must conform to the architectural constraint of having all power-of-2
> > lengths smaller than the maximum length present. It's also possible to
> > only provide sve<vl-bits> properties, e.g. -cpu max,sve512=on. That
> > example provides the machine with 128, 256, and 512 bit vector lengths.
> > It doesn't hurt to explicitly ask for all expected vector lengths,
> > which is what, for example, libvirt should do.
> > 
> > Note1, it is not possible to use sve<vl-bits> properties before
> > sve-max-vq, e.g. -cpu max,sve384=off,sve-max-vq=4, as supporting
> > that overly complicates the user input validation.
> > 
> > Note2, while one might expect -cpu max,sve-max-vq=4,sve512=on to be the
> > same as -cpu max,sve512=on, they are not. The former enables all vector
> > lengths 512 bits and smaller, while the latter only sets the 512-bit
> > length and its smaller power-of-2 lengths. It's probably best not to use
> > sve-max-vq with sve<vl-bits> properties, but it can't be completely
> > forbidden as we want qmp_query_cpu_model_expansion to work with guests
> > launched with e.g. -cpu max,sve-max-vq=8 on their command line.
> 
> Supporting both options together in a non-idempotent way seems to
> complicate things.
> 
> Would it be simpler to allow sve-max-vq only when there are no sve<bits>
> options?

Not really. Since we can't simply remove sve-max-vq from the 'max' cpu
type, then we'd still need conditions to check when we can use it. The
restriction that it has to come first reduces the complexity
substantially, and I think restricting to not being allowed
at all, when sve<vl-bits> are used, would only give us a net check
reduction of one or two.

> 
> Alternatively, the two options would be defined so that their meanings
> are independent of parse order.
> 
> So, way sve-max-vq=<max> means that:
> 
>  * all VQs up to max for which there is no corresponding sve<bits>=off,
>    are enabled; and
> 
>  * VQ max is enabled; and
> 
>  * all VQs exceeding max are disabled.
> 
> While sve<bits>=(on|off) means
> 
>  * the VQ coresponding to <bits> is enabled (for on) or disabled (for
>    off).
>  
> After parsing all the options, you check that the sve-max-vq and
> sve<bits> optinos are consistent.  If you disallow duplicate sve-max-vq
> or sve<bits> options, then there is no possibility of ambiguity and the
> order or options doesn't matter.

I don't want to put any final checks at the end of parsing all options,
because that won't work with the QMP query.

> 
> (There may be constraints on the way qemu options parsing works that
> make this hard, though...)

I can't think of any issue with the parsing, but the QMP query only using
the property get accessors, without any finalizing, does put constraints
on what we can do.

> 
> Having sve-max-vq in 128-bit units while sve<bits> are named in terms of
> bit counts also feels a bit odd now.

sve-max-vq already exists, so it'd have to be deprecated if we don't want
it anymore. And I think sve<vl-bits> is the right naming to go with for
that. Of course using sve-max-vq is completely optional. If you don't want
it for backward compatible reasons, or as a shorthand to restrict the
lengths, then you can just use the sve<vl-bits> properties. Indeed, with
KVM, if you use the 'host' cpu type (the default for use with KVM), then
you won't even have the sve-max-vq property. As 'host' never had it, I
didn't have to keep it, nor adopt it. And of course I didn't want to
adopt it.

Thanks,
drew

Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp536489wrg;
        Wed, 15 May 2019 05:47:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8JvvrevIiljtzbEJ8d7+l0qCo9kh1CWK1AlFmxQhSofQ6ZU5doDIDhEz/fWrv85HCxkcS
X-Received: by 2002:a05:6402:1610:: with SMTP id f16mr43451502edv.171.1557924436683;
        Wed, 15 May 2019 05:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557924436; cv=none;
        d=google.com; s=arc-20160816;
        b=f4OBKoITE4cKRGBLK6CXppDwHa75MQ79G9TkK33HDBaYuZ55R3CZ/xUfPWxtFlBMGA
         HQJeh/OaxIDFkIUj71ByPZGjOqi12mXdSYjn1fC4tLuiBoXQTq5ZgZyROs9xrG2vTvJy
         rqo3JFESdNuEC3vzdssiVE+OPUPwpcwA+dD3gWuOUzljENlA6xmslvviduoMMJn0zWLo
         2c4i1L5htm47KzLxg08g8bkC3PK2D4i4oyxQlEr5ss+0LwyBkwROn2fldkaiS5Sp4PBY
         qaHEkALIYIqivcd1r1WrAA2Eq/fozsczZhUmllYCTQ/mh8gRYdoUXnFXs1CFuP7WF8yu
         A9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=02NO1j4nk0RzwTtpmL/WNUZk+y9Cx3zVxgO8fKelPgY=;
        b=doHoK3/XRDwgkVgEyL5hgNg0yzP+GDO9HjKWUTwmDcgNEYqcfDwm3rOX/M5FiirXku
         hDBGJ+dJy33eKFYK2B5iLLTCH1Z9Qy8HnuPIYvIytTbkClMjxuvC2YBHa1QH20RT6L3y
         MptwZh+BsFVX+rnnIgoC+1VXXIgVGiScLk2HBdnwXjfFycyNeuy77V+rpxN1A/AIHeGm
         FB9/zkd0b2xrMufZrDqpw9bkb2VwzwHoFqvJyqv+jZTHm9fRJTb5l7bkVJftwOj1H27y
         CppW4M2vu+N5ibxBy4qpsq212lP2ZTuvzLDTuhJABFJJPluGB6WIP1GP/2zOfgGspB4h
         dzzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id s53si1376941eda.46.2019.05.15.05.47.16;
        Wed, 15 May 2019 05:47:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9914D374;
	Wed, 15 May 2019 05:47:15 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EBC03F71E;
	Wed, 15 May 2019 05:47:13 -0700 (PDT)
Date: Wed, 15 May 2019 13:47:11 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrea Bolognani <abologna@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
Message-ID: <20190515124711.GS28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
 <20190513123656.6iu7ebu7zucn5mxt@kamzik.brq.redhat.com>
 <e38aac8cb33c5782499b4ca0356c43267f05dc5e.camel@redhat.com>
 <20190514125329.mi7ctaoujirwm6gs@kamzik.brq.redhat.com>
 <1857a74ef586a4e41d93b184498cfcf6c2927cec.camel@redhat.com>
 <1cd94ba6-2bfa-645e-1034-dd05e8a77000@linaro.org>
 <a24b6d34b99835ea38b021896a57c7af8bf4747c.camel@redhat.com>
 <20190515111420.GR28398@e103592.cambridge.arm.com>
 <6ab7415d80419a7d9ac832b9194bf2d944696cd9.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab7415d80419a7d9ac832b9194bf2d944696cd9.camel@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: XKsPCzTHBd8x

On Wed, May 15, 2019 at 12:28:20PM +0100, Andrea Bolognani wrote:
> On Wed, 2019-05-15 at 12:14 +0100, Dave Martin wrote:
> > On Wed, May 15, 2019 at 09:03:58AM +0100, Andrea Bolognani wrote:
> > > On Tue, 2019-05-14 at 13:14 -0700, Richard Henderson wrote:
> > > > Why is =4 less user-friendly than =512?
> > > > 
> > > > I don't actually see "total bits in vector" as more user-friendly than "number
> > > > of quadwords" when it comes to non-powers-of-2 like =7 vs =896 or =13 vs =1664.
> > > 
> > > I would wager most people are intimately familiar with bits, bytes
> > > and multiples due to having to work with them daily. Quadwords, not
> > > so much.
> > 
> > Generally I tend to agree.  For kvmtool I leaned torward quadwords
> > purely because
> > 
> > 	16,32,48,64,80,96,112,128,144,160,176,192,208
> > 
> > is a big pain to type compared with
> > 
> > 	1,2,3,4,5,6,7,8,9,10,11,12,13
> > 
> > Even though I prefer to specify vector lengths in bytes everywhere else
> > in the Linux user API (precisely to avoid the confusion you object to).
> > 
> > This isn't finalised yet for kvmtool -- I need to rework the patches
> > and may not include it at all initially: kvmtool doesn't support
> > migration, which is the main usecase for being able to specify an exact
> > set of vector lengths AFAICT.
> > 
> > Since this is otherwise only useful for migration, experimentation or
> > machine-driven configuration, a bitmask
> > 
> > 	0x1fff
> > 
> > as some have suggested may well be a pragmatic alternative for kvmtool.
> 
> Just to be clear, I have suggested using bits (or bytes or megabytes
> depending on the exact value) only for the command-line-user-oriented
> sve-vl-max option, which would take a single value.
> 
> For interoperation with the management layer, on the other hand,
> using a bitmap is perfectly fine, and whether the values encoded
> within are expressed in quadwords or whatever other format is largely
> irrelevant, so long as it it's properly documented of course.

Seems fair.

Cheers
---Dave

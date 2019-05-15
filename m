Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp449241wrg;
        Wed, 15 May 2019 04:14:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzepHXc+WgYpbV+EMdASJnZwA4xwxNtA/HygoxGwXjT4n+IZfNVyTIMMLn3uoQXmaOmPZyM
X-Received: by 2002:a50:8965:: with SMTP id f34mr41941243edf.296.1557918865952;
        Wed, 15 May 2019 04:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557918865; cv=none;
        d=google.com; s=arc-20160816;
        b=Kb/1ULVOxVa2rhYAU+ORVHhMppcklHhdedfEZ5mm+xV+p5PBwdashiuri4nEWYrQSi
         uZMm9EQQVmjyxr9fOa5p8hJDP08pbWA07q3Ql7dD4ZajAm4vc/I+D1rbRJwuUHgSSw3c
         /6NrDHpST4nftHHK6QW19cmdRM1FKbFOERzHEEDytsw9qZT8sAyXb8YYlCSWHFPf7fr6
         GwD4ARh4Nq+ylcjI8dAcSqwj0S5QNaZW5TVV0ecidI4BuZzQWBup5A21zzcZ+U6rYICg
         fkg3tI+zegKG19QM+EeuQQSk8DMz+agABt40b7dz637Zavedt2w4+CFcSU/oQvpEdZv9
         T5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=Rgld7vEM2SqLV8ZSAiZ1wIMrVyMzm3/VmwP04xBrIL0=;
        b=j9X3o5W7WO6VZgEPfGGiCrSLMJv7LWF75ZuMfA/jhH06hHi1kLo33JPkSx2w0IEnoG
         t0pbsU8OhMmlZ8JUZ4yiXgeEVwMLPu1DzvyK0GNq+Y5K08H+vRDzy6o//xUg1jEtACn0
         wDnYaW0V6OELXD63eJOrahODh0mMQB5QApVVfhsSwFtbiW3JZ5jlola8NPOXnW5j2PIr
         LLSXIRc9zaPywFPn5eoWstrJx/VKZ6RLfhxdA2/clKeRAgg709pSQ93pU4CS5Umqx2Ff
         9nWgVJc3qJN/PXJVwXfqTkwlOYtrl03Ortn1cmndBo9dPzvDUcasNopHYkYePhRvzh+U
         zHZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id z58si1064250edd.244.2019.05.15.04.14.25;
        Wed, 15 May 2019 04:14:25 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB2F480D;
	Wed, 15 May 2019 04:14:24 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 601553F778;
	Wed, 15 May 2019 04:14:23 -0700 (PDT)
Date: Wed, 15 May 2019 12:14:20 +0100
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
Message-ID: <20190515111420.GR28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
 <20190513123656.6iu7ebu7zucn5mxt@kamzik.brq.redhat.com>
 <e38aac8cb33c5782499b4ca0356c43267f05dc5e.camel@redhat.com>
 <20190514125329.mi7ctaoujirwm6gs@kamzik.brq.redhat.com>
 <1857a74ef586a4e41d93b184498cfcf6c2927cec.camel@redhat.com>
 <1cd94ba6-2bfa-645e-1034-dd05e8a77000@linaro.org>
 <a24b6d34b99835ea38b021896a57c7af8bf4747c.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a24b6d34b99835ea38b021896a57c7af8bf4747c.camel@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: BHyJKUoPMXNg

On Wed, May 15, 2019 at 09:03:58AM +0100, Andrea Bolognani wrote:
> On Tue, 2019-05-14 at 13:14 -0700, Richard Henderson wrote:
> > On 5/14/19 9:03 AM, Andrea Bolognani wrote:
> > > On Tue, 2019-05-14 at 14:53 +0200, Andrew Jones wrote:
> > > > We already have sve-max-vq, so I'm not sure we want to rename it.
> > > 
> > > Oh, I didn't realize that was the case. And of course it already
> > > takes a number of quadwords as argument, I suppose? That's pretty
> > > unfortunate :(
> > > 
> > > Perhaps we could consider deprecating it in favor of a user-friendly
> > > variant that's actually suitable for regular humans, like the one I
> > > suggest above?
> > 
> > Why is =4 less user-friendly than =512?
> > 
> > I don't actually see "total bits in vector" as more user-friendly than "number
> > of quadwords" when it comes to non-powers-of-2 like =7 vs =896 or =13 vs =1664.
> 
> I would wager most people are intimately familiar with bits, bytes
> and multiples due to having to work with them daily. Quadwords, not
> so much.

Generally I tend to agree.  For kvmtool I leaned torward quadwords
purely because

	16,32,48,64,80,96,112,128,144,160,176,192,208

is a big pain to type compared with

	1,2,3,4,5,6,7,8,9,10,11,12,13

Even though I prefer to specify vector lengths in bytes everywhere else
in the Linux user API (precisely to avoid the confusion you object to).

This isn't finalised yet for kvmtool -- I need to rework the patches
and may not include it at all initially: kvmtool doesn't support
migration, which is the main usecase for being able to specify an exact
set of vector lengths AFAICT.

Since this is otherwise only useful for migration, experimentation or
machine-driven configuration, a bitmask

	0x1fff

as some have suggested may well be a pragmatic alternative for kvmtool.

Cheers
---Dave

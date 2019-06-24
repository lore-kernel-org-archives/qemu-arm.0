Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3932995wrg;
        Mon, 24 Jun 2019 09:06:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIBV5yZP5WX4t0aF0iJ2IrJpRMBGd5ObcD8ri1s2Ubx/u/UsTXpCqqkx3ixcTVWHaVOW3f
X-Received: by 2002:a50:ba28:: with SMTP id g37mr143953220edc.109.1561392398115;
        Mon, 24 Jun 2019 09:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561392398; cv=none;
        d=google.com; s=arc-20160816;
        b=K9Zgv8ZGD5v+cv/zdiaNF3uekxJGHE7TsbzloLWykPqVgg0y4zYLMyD8YJAyC5AKfR
         08AKfXioDrBxFtYH4UpziRr3J8Q3R7fp/QtDpbbQf+Y2n4hC4//9qI3FmvVP7PwJuh9Y
         +LU7hZrgr+kJspFOi+3uHltA3MW3ZmNyPF0OpYwpMtOFxSCAGqG/8RV9um99DZRwMsVF
         ZP+faxRluMx/cgt6Lh0+uO8V+MCK4WKU/LeJqv+TzA+m6HQs5Ofl+Wf1AcsHGBLdIGIQ
         Fyc+bUpEl/TOI5WZhtVXlHxBTfAtIDXMd6elXcACpFPrsOzqtTzb5EvBn7CsZY0FBB4e
         ++QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=wEQ1RTBqxEEByZiJycOiCWPf0aU8NILiaUpSgoUZwqg=;
        b=IVjADNPPA4y6SILRSwPk/wW3gHBcGIcoQgGvvbtsygsOj1KWtB0DVlAJ15AI+rh7mm
         N1swe30Y9vSdPRMh1A2R7lA03l0GPsgg6nJlO8PbWGrU52eE7FidBNtpkAn4q0Mb34dx
         dFOd0EQZmcAg9NJKzsu0AXAIh3uBi+sB1Fxj3cXTs04qs3kGnxt/b3PJflbKCGT3McDN
         ULm0tcxIRKFiGm3gPNQnJGmKIM+sGqt8LzgXm0CRmb1w+/mOyO4ox5i/RmXY7hVZnirj
         fO6z2z0OF4t/hgQBSwgzuCDOT6lCExYNVvxb93/nGGQw/uh6i4ifiFhBQhDlDCSJ9+1b
         254A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id z31si10085664edz.165.2019.06.24.09.06.37;
        Mon, 24 Jun 2019 09:06:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A6352B;
	Mon, 24 Jun 2019 09:06:37 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D34BA3F71E;
	Mon, 24 Jun 2019 09:06:35 -0700 (PDT)
Date: Mon, 24 Jun 2019 17:06:33 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
Message-ID: <20190624160633.GU2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <20190624110526.GH2790@e103592.cambridge.arm.com>
 <20190624114911.xb4xdcbv55p2rufv@kamzik.brq.redhat.com>
 <20190624121041.tgrbmvk4bgs5eepy@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624121041.tgrbmvk4bgs5eepy@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: sg1Ev3bIc/aN

On Mon, Jun 24, 2019 at 01:10:41PM +0100, Andrew Jones wrote:
> On Mon, Jun 24, 2019 at 01:49:11PM +0200, Andrew Jones wrote:
> > On Mon, Jun 24, 2019 at 12:05:26PM +0100, Dave Martin wrote:
> > > On Fri, Jun 21, 2019 at 05:34:15PM +0100, Andrew Jones wrote:
> > > > Introduce cpu properties to give fine control over SVE vector lengths.
> > > > We introduce a property for each valid length up to the current
> > > > maximum supported, which is 2048-bits. The properties are named, e.g.
> > > > sve128, sve256, sve512, ..., where the number is the number of bits.
> > > > 
> > > > It's now possible to do something like -cpu max,sve-max-vq=4,sve384=off
> > > > to provide a guest vector lengths 128, 256, and 512 bits. The resulting
> > > > set must conform to the architectural constraint of having all power-of-2
> > > > lengths smaller than the maximum length present. It's also possible to
> > > > only provide sve<vl-bits> properties, e.g. -cpu max,sve512=on. That
> > > > example provides the machine with 128, 256, and 512 bit vector lengths.
> > > > It doesn't hurt to explicitly ask for all expected vector lengths,
> > > > which is what, for example, libvirt should do.
> > > > 
> > > > Note1, it is not possible to use sve<vl-bits> properties before
> > > > sve-max-vq, e.g. -cpu max,sve384=off,sve-max-vq=4, as supporting
> > > > that overly complicates the user input validation.
> > > > 
> > > > Note2, while one might expect -cpu max,sve-max-vq=4,sve512=on to be the
> > > > same as -cpu max,sve512=on, they are not. The former enables all vector
> > > > lengths 512 bits and smaller, while the latter only sets the 512-bit
> > > > length and its smaller power-of-2 lengths. It's probably best not to use
> > > > sve-max-vq with sve<vl-bits> properties, but it can't be completely
> > > > forbidden as we want qmp_query_cpu_model_expansion to work with guests
> > > > launched with e.g. -cpu max,sve-max-vq=8 on their command line.
> > > 
> > > Supporting both options together in a non-idempotent way seems to
> > > complicate things.
> > > 
> > > Would it be simpler to allow sve-max-vq only when there are no sve<bits>
> > > options?
> > 
> > Not really. Since we can't simply remove sve-max-vq from the 'max' cpu
> > type, then we'd still need conditions to check when we can use it. The
> > restriction that it has to come first reduces the complexity
> > substantially, and I think restricting to not being allowed
> > at all, when sve<vl-bits> are used, would only give us a net check
> > reduction of one or two.
> > 
> > > 
> > > Alternatively, the two options would be defined so that their meanings
> > > are independent of parse order.
> > > 
> > > So, way sve-max-vq=<max> means that:
> > > 
> > >  * all VQs up to max for which there is no corresponding sve<bits>=off,
> > >    are enabled; and
> > > 
> > >  * VQ max is enabled; and
> > > 
> > >  * all VQs exceeding max are disabled.
> > > 
> > > While sve<bits>=(on|off) means
> > > 
> > >  * the VQ coresponding to <bits> is enabled (for on) or disabled (for
> > >    off).
> > >  
> > > After parsing all the options, you check that the sve-max-vq and
> > > sve<bits> optinos are consistent.  If you disallow duplicate sve-max-vq
> > > or sve<bits> options, then there is no possibility of ambiguity and the
> > > order or options doesn't matter.
> > 
> > I don't want to put any final checks at the end of parsing all options,
> > because that won't work with the QMP query.

Ack, I'm not familiar with the QMP side of things.

> Actually, I think I can allow sve-max-vq to come after sve<vl-bits>
> without adding much code, and without requiring a final check. I
> could try that if you'd like, but I'm not sure it's worth it. Also, I
> feel like I tried this once already and rejected it for some reason,
> but atm I can't remember why.

Probably not.  I was aiming to simplify things, but if my suggestions
don't make anything simpler, then it's obviously not worth it :)

> > > (There may be constraints on the way qemu options parsing works that
> > > make this hard, though...)
> > 
> > I can't think of any issue with the parsing, but the QMP query only using
> > the property get accessors, without any finalizing, does put constraints
> > on what we can do.
> > 
> > > Having sve-max-vq in 128-bit units while sve<bits> are named in terms of
> > > bit counts also feels a bit odd now.
> > 
> > sve-max-vq already exists, so it'd have to be deprecated if we don't want
> > it anymore. And I think sve<vl-bits> is the right naming to go with for
> > that. Of course using sve-max-vq is completely optional. If you don't want
> > it for backward compatible reasons, or as a shorthand to restrict the
> > lengths, then you can just use the sve<vl-bits> properties. Indeed, with
> > KVM, if you use the 'host' cpu type (the default for use with KVM), then
> > you won't even have the sve-max-vq property. As 'host' never had it, I
> > didn't have to keep it, nor adopt it. And of course I didn't want to
> > adopt it.

I hadn't realised the sve-max-vq option was already merged.  I agree
that if there are established semantics for this, we shouldn't mess with
it now.

So, keep it as you proposed, I guess.

Cheers
---Dave

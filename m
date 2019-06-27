Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1393090wru;
        Thu, 27 Jun 2019 08:02:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKdMf/zmksix1Pw/FtTvsHT2d8hSSscVXyiYIUJ9JqPq6MTG1NWedswR5KgLUP+JYa3wei
X-Received: by 2002:a50:c9c2:: with SMTP id c2mr4847992edi.183.1561647749314;
        Thu, 27 Jun 2019 08:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561647749; cv=none;
        d=google.com; s=arc-20160816;
        b=oQtPu41dAEow+sNPxDN3/Ph/hPc45fVjhKE1VDks1hrmN7qXjuxYR3n8VrXLVHBxIU
         oDJnIjONjpmme3KwnQNZeDb7gvx2ulJBSwQLfhRHyq6PsPu+fneDNj136w1hAWrsc7xt
         PyZnjUeQ7opukZwrgn80GSNe9h3cDWnkbp9v4lJ+tvPzp9OMXVcl0XoT1N1VSDAALoMX
         TdhOKQkidIrNKMz4EbyRHaIX3IpAeyUU7Qr/fmxyhfnVHsiX1c+4YiUNRnyOUtL8x5g2
         sdOch3fIe3Qlm2Ae2nt9ZxYZ9rIlycuVHqsSaIJBl5suyCvrSM4Ljbz2iVp41fWG9XZM
         D/qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=VXGj6045PLBPA7tU0mFoJrekB2NdENo0IaTGmnqmJ7E=;
        b=G27aw8g7JZbDaW/A/+ZryjH0KTbhE6MtO9atVhFF5PHIQkOPb0HtdIXRMim+P+EAkv
         VVA/9K87TR/XPxJO0YFtmEEKQOjQG5Bb1vEw1BZlFvxMwZ55ICZPE0UMKuVBbVB5TBm6
         1TU9O6RZINN8FwCbWwSz4cWYh19DvvpeHeaP0gqP/PI4y7A2XVnetiLOcpsadjaSVMk1
         WwcUYLrY3SHCCZrhsQ7IUKNtt1Da7dhGG2WUB5XWqcEhLaDQgc4JkPaIHTEMjTg6e8uq
         039plSVV7LUnBES4BCObUeThUClUSB9wzI8p8dhoxNXxcudLdXRyWpvb/V5ri9MDGvbW
         MCRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id um8si1730807ejb.373.2019.06.27.08.02.28;
        Thu, 27 Jun 2019 08:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 510E6360;
	Thu, 27 Jun 2019 08:02:28 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEA383F246;
	Thu, 27 Jun 2019 08:02:26 -0700 (PDT)
Date: Thu, 27 Jun 2019 16:02:24 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Subject: Re: [PATCH v2 10/14] target/arm/kvm64: Add kvm_arch_get/put_sve
Message-ID: <20190627150224.GH2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
 <1e0bc93f-42e3-087f-a4b5-d356879cb806@linaro.org>
 <20190627105911.GD2790@e103592.cambridge.arm.com>
 <3e935f36-1065-b82e-86e0-f3e4cd11f95e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e935f36-1065-b82e-86e0-f3e4cd11f95e@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: UXf9sdtdgsSO

On Thu, Jun 27, 2019 at 12:26:06PM +0100, Richard Henderson wrote:
> On 6/27/19 12:59 PM, Dave Martin wrote:
> >> It's a shame that these slices exist at all.  It seems like the kernel could
> >> use the negotiated max sve size to grab the data all at once.
> > 
> > The aim here was to be forwards compatible while fitting within the
> > existing ABI.
> > 
> > The ABI doesn't allow variable-sized registers, and if the vq can
> > someday grow above 16 then the individual registers could become pretty
> > big.
> 
> The ABI doesn't appear to have fixed sized data blocks.  Since that's
> the case, it didn't seem to me that variable sized blocks was so
> different, given that the actual size is constrained by the hardware
> on which we're running.

I'm not sure what you mean here.

For KVM_GET_ONE_REG, the size is determined by the reg size field in
the register ID, so size is deemed to be a fixed property of a
particular register.

Having the register IDs vary according to the vector length seemed a
step too far.

> And if VQ does grow large, then do we really want oodles of syscalls in order
> to transfer the data for each register?  With the 9 bits reserved for this
> field, we could require a maximum of 1024 syscalls to transfer the whole
> register set.

A save/restore requires oodles of syscalls in any case, and for SVE
there is a rapid dropoff of probabilities: VQ < 16 is much likelier than
VQ == 32 is likelier than VQ == 64 etc.

The reg access API has some shortcomings, and we might find at some
point that the whole thing needs redesigning.

I suppose we could have taken the view that the KVM ABI would not even
try to support VQ > 16 in a forwards compatible way.  In the end we
decided to at least have things workable.

Either way, it's entirely reasonable for userspace not to try to support
additional slices for now.  We'll have plenty of time to plan away
across that bridge when we spot it on the horizon...

> > It's for QEMU to choose, but does it actually matter what byteorder you
> > store a Z-reg or P-reg in?  Maybe the byteswap isn't really needed.
> 
> I think the only sensible order for the kernel is that in which LDR/STR itself
> saves the data.  Which is a byte stream.

We have a choice of STRs though.  Anyway, yes, it is the way it is, now.

> Within QEMU, it has so far made sense to keep the data in 64-bit hunks in
> host-endian order.  That's how the AdvSIMD code was written originally, and it
> turned out to be easy enough to continue that for SVE.

Fair enough.  It's entirely up to QEMU to decide -- I just wanted to
check that there was no misunderstanding about this issue in the ABI.

> Which does mean that if we want to pass data to the kernel as the
> aforementioned byte stream that a big-endian host does need to bswap the data
> in 64-bit hunks.
> 
> > I don't know how this works when migrating from a little-endian to a
> > big-endian host or vice-versa (or if that is even supported...)
> 
> The data is stored canonically within the vmsave, so such migrations are
> supposed to work.

Right, I was wondering about that.  Could be fun to test :)

Cheers
---Dave

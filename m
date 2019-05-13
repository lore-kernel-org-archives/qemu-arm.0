Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2885116wrg;
        Mon, 13 May 2019 07:35:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzqZbXb5/AlAt9m0RbhaFnlDusI7ikCMyCKmEtXvl7mnKludHFRzp4zyRa161gmwdrACV5G
X-Received: by 2002:a50:f4fb:: with SMTP id v56mr30697969edm.13.1557758149676;
        Mon, 13 May 2019 07:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557758149; cv=none;
        d=google.com; s=arc-20160816;
        b=Y3oOI9YupNTnFvrn547vbeFsIrU2GhmhDDpot2AGbYhoF2cj6h3maRLVFpJwtKULky
         eVs5rdoTqMGTH9+IvSQuuQ/KOF+wYt3bDb0qMUgYn8j/peMEBmyRNXcD5ri1DOlA0aL3
         pPs//RDtOshXUgShKcDsKDZDA9sejMMbycnlzmPd41+Hwa6CkD+nJ4/4/HbiV/AYJiUy
         Y5kUIxNuJ5PYfekBMMn3uhJXtaZKxcnLBSmyHUDaL3DyrraWdgAAcWEu2NfA16sOJMBA
         fQruHYfEiEtlOmAWpqJUfEye4aaOrVUdZlEb5OrDZACGrqWHzDNyZH2OuJYxzahULr4q
         KJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=4vX+gZF1bfmYQDi/MaIpMnTtIRd3PaVM20d5ty+3acs=;
        b=TvE8I5sjFiAix3fxw1fh0ALIfa/oEhHQ687wdlijI+OpX7u2ea3jOJOVwY7+yaXOPU
         LvtI4wGREVrE6nkqdzif/X1AeGha/xFP3i5Ft0SONTe5gR6ALJIVMf3150emLnkxDG9R
         d9mBLzOsaK8GnWN9HjiRsEhJJhP5ksG4Z5e3YradAhFTczrEvMriV+Sqmq7bxB+Q68/w
         4garQjKd4uMGQNDurzdrdi0JnRhSsAh4tsHiSF4dg/Gv7xMUIhips8xykbs1rPmVXpbV
         oXSjs2lE5DqzawV6j0Ix2pP1fcilM4BL5/LFbMP58LfyyQs1LBRToZUwX2NBWzpiwue2
         aS4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id k29si2401757edd.435.2019.05.13.07.35.49;
        Mon, 13 May 2019 07:35:49 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 724BC341;
	Mon, 13 May 2019 07:35:48 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBAD13F71E;
	Mon, 13 May 2019 07:35:46 -0700 (PDT)
Date: Mon, 13 May 2019 15:35:44 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"abologna@redhat.com" <abologna@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH 11/13] target/arm/cpu64: max cpu: Introduce
 sve-vls-map
Message-ID: <20190513143544.GJ28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-12-drjones@redhat.com>
 <20190513112635.GD28398@e103592.cambridge.arm.com>
 <20190513123023.h4q5sihktqctkgml@kamzik.brq.redhat.com>
 <20190513124126.GF28398@e103592.cambridge.arm.com>
 <20190513125740.ukyx4vuili3f5wbe@kamzik.brq.redhat.com>
 <20190513131248.GI28398@e103592.cambridge.arm.com>
 <20190513134512.alclwrqnxlyai6uy@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513134512.alclwrqnxlyai6uy@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: gMLO5rTNok+8

On Mon, May 13, 2019 at 02:45:12PM +0100, Andrew Jones wrote:
> On Mon, May 13, 2019 at 02:12:48PM +0100, Dave Martin wrote:
> > On Mon, May 13, 2019 at 01:57:40PM +0100, Andrew Jones wrote:
> > > On Mon, May 13, 2019 at 01:41:26PM +0100, Dave Martin wrote:
> > > > On Mon, May 13, 2019 at 01:30:23PM +0100, Andrew Jones wrote:
> > > > > On Mon, May 13, 2019 at 12:26:36PM +0100, Dave Martin wrote:
> > > > > > On Sun, May 12, 2019 at 09:36:22AM +0100, Andrew Jones wrote:
> > > > > > > Introduce another cpu property to control SVE vector lengths,
> > > > > > > sve-vls-map, which allows the user to explicitly select the
> > > > > > > set of vector lengths the guest can use. The map must conform
> > > > > > > to QEMU's limits and architectural constraints, checked when
> > > > > > > the property is set. Inconsistencies with sve-max-vq are also
> > > > > > > checked. The bit number of a set bit in the map represents the
> > > > > > > allowed vector length in number of quadwords.
> > > > > > > 
> > > > > > > Note, as the map is implemented with a single 64-bit word we
> > > > > > > currently only support up to 8192-bit vectors. As QEMU and
> > > > > > > KVM only support up to 2048-bit vectors then this sufficient
> > > > > > > now, and probably for some time. Extending the bitmap beyond
> > > > > > > a single word will likely require changing the property to
> > > > > > > a string and adding yet another parser to QEMU.
> > > > > > > 
> > > > > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > > > > ---
> > > > > > >  target/arm/cpu.c     |  4 +++
> > > > > > >  target/arm/cpu.h     |  3 ++
> > > > > > >  target/arm/cpu64.c   | 70 +++++++++++++++++++++++++++++++++++++++++---
> > > > > > >  target/arm/helper.c  | 10 ++++++-
> > > > > > >  target/arm/monitor.c |  9 ++++--
> > > > > > >  5 files changed, 88 insertions(+), 8 deletions(-)
> > > > > > > 
> > > > > > 
> > > > > > [...]
> > > > > > 
> > > > > > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > > > > > > index 8292d547e8f9..f0d0ce759ba8 100644
> > > > > > > --- a/target/arm/cpu.h
> > > > > > > +++ b/target/arm/cpu.h
> > > > > > > @@ -920,6 +920,9 @@ struct ARMCPU {
> > > > > > >  
> > > > > > >      /* Used to set the maximum vector length the cpu will support.  */
> > > > > > >      uint32_t sve_max_vq;
> > > > > > > +
> > > > > > > +    /* Each bit represents a supported vector length of (bitnum * 16) bytes */
> > > > > > > +    uint64_t sve_vls_map;
> > > > > > 
> > > > > > Just to be clear, the representation here is different from the
> > > > > > representation in KVM_REG_ARM64_SVE_VLS?
> > > > > > 
> > > > > > In the latter, bit n represents vector length ((n + 1) * 16) bytes.
> > > > > 
> > > > > KVM also uses bitnum * 16. bitnum is the the bit number, not the shift.
> > > > 
> > > > Can you point to the relevant kernel code?  This isn't what I thought I
> > > > wrote...
> > > 
> > > The Documentation/virtual/kvm/api.txt documentation has
> > > 
> > >  > if (vq >= SVE_VQ_MIN && vq <= SVE_VQ_MAX &&
> > >  >    ((vector_lengths[(vq - KVM_ARM64_SVE_VQ_MIN) / 64] >>
> > >  >                ((vq - KVM_ARM64_SVE_VQ_MIN) % 64)) & 1))
> > >  >        /* Vector length vq * 16 bytes supported */
> > >  > else
> > >  >        /* Vector length vq * 16 bytes not supported */
> > > 
> > > Taking vq=1, we check (vector_lengths[0] >> 0) to see if we have the
> > > length (1 * 16) bytes. Since bitnum 1 is (1 << 0) that means the shift
> > > is zero and (bitnum * 16) is the same as (vq * 16). With ((n + 1) * 16),
> > > n would have to be zero, which is not a valid bitnum, but is a valid
> > > bit shift.
> > 
> > OK, so it sounds like the interpretation of the KVM ABI is what I intended.
> > 
> > What is "bitnum" though?  Most of the time, people seem to number bits
> > starting from 0 -- though of course that's just a convention.
> 
> Eh, I see the problem. I used the word 'number', when I meant 'position'.
> Indeed the bit number of bit position 1 is zero. Sorry about the confusion.
> For v2 I can try to ensure I don't use the wrong terminology.

I'm not sure there's an actual problem here.  I found the terminology
unfamiliar, that's all.

My main concern was that people might be confused about the kernel ABI
here, but it sounds like your interpretation is as I intended.

But by all means clarify the comments if you think there's a risk of
QEMU folks being confused.

[...]

Cheers
---Dave

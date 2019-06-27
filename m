Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1409230wru;
        Thu, 27 Jun 2019 08:16:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwQKen4tA7XJXfOnU3WDavmGvvmiudO34rGhP+wb2IeG40xP6t2KfgqBFPqupAnDjP+vam
X-Received: by 2002:a50:b48f:: with SMTP id w15mr5027300edd.260.1561648592603;
        Thu, 27 Jun 2019 08:16:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561648592; cv=none;
        d=google.com; s=arc-20160816;
        b=x3b1b1tFqPauWyWWqslmO6rBTqs5b1gjySuK9HG+QhqXSa6w0zxk8orNC3zlfoILU4
         hCXrw+IIH5QOxtS1mJSA9+WMSXw+pNSSWK1FucuHWCLI+dgZ+iidIKVn+5lmJIILzuKi
         EpjjqNcl9D9SrCXkiYgX3OZz8xcM/OEwZXg8hr0nOnlOIKS2hWZLGS2ZCoPA3gKKrzN8
         WR+kmF2wqZnlk/k7gGfMokOb/pgeTVzAVqcNiNl3zcbA62ebjHTrnjlGOisUXwz5WCIA
         K75BXitDvukFSz77LeaNjY8yCknliQfuqFfLTa4kmUCr7s5AozVpfuen7wCqZQEQI8+b
         zIaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=EIF12BhrRDCRaGpC9PoiWz8pTdPKocbHUm0zEBSufg8=;
        b=QZAQ2nkurWYYWBKdRQE+U5k0LUkVQ5bH9f3DgDzM82SBqB6mLzapqq78SG5v3WZG41
         w3rVQamH6r85wX45MKDjSOOkNvXa3ouSpZbLS89h1Fk7N5aQ50EU/tHWyE0PQ32vqB9+
         dVgNPg5Jj1SahFmulQLRVN6o5TpF9yxPDo29wS17C+ee2sDNVYI811XS7RorQWchXra/
         V+pSg1XFCQvFI9B1L8z3AzXV4m1nuTULbP5NqlHZyMybpYtMtWULNWh2krVt0DcZcfV2
         GJj7qILIEs5HrdjK9jaFIAbY90YScEZPzf5gTwpnHhnF5oGWB173Ppl9gOo68Ve3hGCQ
         5rGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.110.172])
        by mx.google.com with ESMTP id e38si2012312eda.26.2019.06.27.08.16.32;
        Thu, 27 Jun 2019 08:16:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) client-ip=217.140.110.172;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.110.172 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 953A6360;
	Thu, 27 Jun 2019 08:16:31 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 586983F246;
	Thu, 27 Jun 2019 08:16:30 -0700 (PDT)
Date: Thu, 27 Jun 2019 16:16:28 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: Auger Eric <eric.auger@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
Message-ID: <20190627151628.GI2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <ee8ce4a6-09fd-47ab-ef7e-a231df1e9c1b@redhat.com>
 <20190627104638.x4gxsmv7vpww3mra@kamzik.brq.redhat.com>
 <ae98bf94-6826-1f2b-2f2e-a11a3f75cb92@redhat.com>
 <20190627114701.n7tjgmljeribk7to@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190627114701.n7tjgmljeribk7to@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: 04abZXO5kJtf

On Thu, Jun 27, 2019 at 12:47:01PM +0100, Andrew Jones wrote:
> On Thu, Jun 27, 2019 at 01:00:27PM +0200, Auger Eric wrote:
> > Hi,
> > 
> > On 6/27/19 12:46 PM, Andrew Jones wrote:
> > > On Wed, Jun 26, 2019 at 06:56:54PM +0200, Auger Eric wrote:
> > >>> diff --git a/target/arm/helper.c b/target/arm/helper.c
> > >>> index f500ccb6d31b..b7b719dba57f 100644
> > >>> --- a/target/arm/helper.c
> > >>> +++ b/target/arm/helper.c
> > >>> @@ -5324,7 +5324,16 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > >>>  
> > >>>      /* Bits other than [3:0] are RAZ/WI.  */
> > >>>      QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
> > >>> -    raw_write(env, ri, value & 0xf);
> > >>> +    value &= 0xf;
> > >>> +
> > >>> +    if (value) {
> > >>> +        /* get next vq that is smaller than or equal to value's vq */
> > >>> +        uint32_t vq = value + 1;
> > >>> +        vq = arm_cpu_vq_map_next_smaller(cpu, vq + 1);
> > >>> +        value = vq - 1;
> > >> spec says:
> > >>
> > >> "if an unsupported vector length is requested in ZCR_ELx, the
> > >> implementation is required to select the largest
> > >> supported vector length that is less than the requested length. This
> > >> does not alter the value of ZCR_ELx.LEN.
> > >> "
> > >>
> > >> So I understand the value written in the reg should not be unmodified.
> > >>
> > > 
> > > Sorry, I can't parse what you're trying to tell me here. Here we have
> > > to write 'value', because that's what the guest is trying to do. As the
> > > spec says in your quote, we have to pick the length the guest wants, or
> > > the next smaller valid one, so that's what the code above does. So are
> > > you just stating that you agree with this hunk of the code?
> > What we are writing into the reg is arm_cpu_vq_map_next_smaller(cpu, vq
> > + 1) -1. Maybe I misunderstand the whole wording but I would have
> > expected the original unmodified value to be written in the reg instead?
> 
> Hmm... So maybe we need more changes to the emulation in order for it to
> have an acting value and a register value? Maybe Richard knows what we
> should do here.

The "effective" value of an individual ZCR_ELx.LEN field is a bit
nonsensical: the effective vector length comes from the minimum
LEN value at any relevant EL (depending on which ELs are implemented,
which security state you're in, VHE controls etc.).

This is tedious to compute, so I'd expect you want to cache it,
recomputing it only when a ZCR_ELx.LEN changes or when you switch to a
different EL.


The architecture says:

"For all purposes other than returning the result of a direct read of
ZCR_EL1 then this field behaves as if it is set to the minimum of the
stored value and the constrained length inherited from more privileged
Exception levels in the current Security state, rounded down to the
nearest implemented vector length."

I think the behaviour of a direct read is implied: the LEN bits yielded
by an MRS should contain exactly what was last written to them via MSR.

Cheers
---Dave

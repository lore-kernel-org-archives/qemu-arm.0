Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp999572lfk;
        Tue, 9 Nov 2021 05:44:01 -0800 (PST)
X-Received: by 2002:a5d:5988:: with SMTP id n8mr9448513wri.309.1636465441764;
        Tue, 09 Nov 2021 05:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636465441; cv=none;
        d=google.com; s=arc-20160816;
        b=HqEgZIcatsR7c1J2GTgLPQY9bwYrB/T6KX/pVMo72vzGyNqN9SS6Fg1rqvz1VDhp5y
         p04kjRVizvOsCiT26yD75a/2DBxWK+BS7rd2FSQF/vlVW1PIgmR6rjOnvkh4Pg12TFVJ
         R10Pqsmgk77rxpdP68jN2wMSvyc3aGGaLs2gJCnl4FNp7zR84PY4lX9+6pnqKNfFwb7k
         eX7hhUnowkoU/zHFAvKhThocR6T0ptZniKGIYZhWPor1oF6kbKK6p8YopqLReu12U3zq
         numCJFdi+HMETNpbdEAo2EO/zrnCgKn9h1F1sMX/4ojpzP8Z8prU3tJj1iAn8s7XBFq8
         nsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OMPwNn0OGGRDPgI/eeHJw7lVn7x9CkhqUobjvoDQuhc=;
        b=Gj7ab+BNv7TvUXJPORb1AghgidAsGEUbr0yOfDcTyXF/zVzL32LVbwGGOHYR4e+UL+
         rj0aMAJoV9FjCklG1s23HMiFbQpq7MiHvLnbcQXRFLCoznaO1KY7VCM2Y604G9L2PZzC
         JWFhQIFreIb4eGzyuUMypjT5STTZcg0O0AAyhiuDlOpO5Epgktx2nxvkcpOo3M1wo+Qa
         sGksDQq/+UOoM3IpWy34SXsWmq4UY8+IgSOOBH/n9zJDIq78up9QVsYm6ctlPmLQNlER
         YpZbY1RoHk6lz350MCUP4gjRAU2wKk4vt1kFJnU5+PKznz0qVF7uoLjtd+YlFy0gCGse
         Hpfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sskDnS7a;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z3sor1624606wmp.10.2021.11.09.05.44.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Nov 2021 05:44:01 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sskDnS7a;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OMPwNn0OGGRDPgI/eeHJw7lVn7x9CkhqUobjvoDQuhc=;
        b=sskDnS7ahjntlhNX48uoFC5e0MT+VPa8xgTcwo5tjOx/7VwJn0Lwqdtwn8SOSAJ7nc
         e5OCPrR3a14HPfSjQKjyj9EMhS0D53P4/dL/zmUA83auo6YDLpjm58hYq9+HeQe3IES1
         7a/xYNWP63JmF5sFahdUs5Fmg52PfCY4OqgjgHL2tEcAvkhrIBS9RASE+hHLe5y8wPtk
         pvcPqKgCuOcSCeDeVXc1m2fwok9+MesDJIXfC4pVBRJQ9RGv1Ar4REg84blLleDNiEbh
         rjxJYhXJnrSMJwjMhwCcIJzja0Z45BvglHQye7i0uSMkjU5oLSi/0NGZ+r8xmftSOTy/
         lWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OMPwNn0OGGRDPgI/eeHJw7lVn7x9CkhqUobjvoDQuhc=;
        b=A7ArORfr1EPFL9GOPCgCVMayYvTm3NyixaQz7q4xUa4HP8YvFOgHLdCHIpCz5rt8r2
         F1l2HbiOdNDuP9IGXz0npsP403TUq7in+jZXFatTY5t8gH0RFs9k/i+VV5S3GcPOYxeA
         ova6LeUX/z0+K7OZdFEWfgVi5yXVneHTAi3Fv0bBmApGezepzLZCbXd6ZdncNXcCxHkV
         tIBrvqNRqDytwsaQUvuqufEcUqttr7gsh0jVSLdOKpKLk+kCjqYoaI+1iBxcNt5XwZ18
         G4L+nwRQOPI6R4HFnuJloxjGcHz907uPH2DvqlBm5GnJzSqx+ePv+jE9Izl+cgj4m4LH
         iN/Q==
X-Gm-Message-State: AOAM533WHWCtlrib5+G1xmStVMV2lTwn6XnMbuc8DXQ0BR9U7TT917g6
	+ox71C6mPESm/fWnH9SqH9pPXe83z6QLgWRD3P3Ru08N
X-Google-Smtp-Source: ABdhPJxGfmz2NCCmcjMM3EezbQ7INVlcZLLoEcgxdx8SnH5fQezlWtDhEz93NiT+hmvF8u1Kc4abYI8SU5tpYkAxk6M=
X-Received: by 2002:a05:600c:1993:: with SMTP id t19mr7357975wmq.21.1636465441361;
 Tue, 09 Nov 2021 05:44:01 -0800 (PST)
MIME-Version: 1.0
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org> <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan> <CAFEAcA-KeBzOCP1CHVWPHbHzG=KbS_HJmXoYo7B2VBz=oGSd3w@mail.gmail.com>
 <20211015122351.vc55mwzjbevl6wjy@leviathan>
In-Reply-To: <20211015122351.vc55mwzjbevl6wjy@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 13:43:50 +0000
Message-ID: <CAFEAcA-Xe2u8n+og4TMyZSSvdBm8nrma3z4GkVjEJHPdJu8Fnw@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Cc: Shashi Mallela <shashi.mallela@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Eric Auger <eric.auger@redhat.com>, narmstrong@baylibre.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: GEynoLg137f0

On Fri, 15 Oct 2021 at 13:23, Leif Lindholm <leif@nuviainc.com> wrote:
> (Apologies for delay. Alex also tells me you are currently away, but
> there is no strong urgency here.)

(Thanks for the ping via Alex -- I missed this email when I was
scanning through my qemu-devel mail backlog after my holiday...)

> On Thu, Sep 23, 2021 at 17:00:35 +0100, Peter Maydell wrote:
> > Leif, what's your plan/preferences here ?
>
> I discussed this with Alex/Shashi.
>
> One further complicating aspect is that the EDK2 GIC driver currently
> relies on GIC addresses being known at compile-time.
>
> > Presumably somebody also needs to do the system-software side
> > of things to handle the ITS being present and the redistributor
> > frames moving...
>
> Since it *would* be useful to get this support in, I think the most
> pragmatic plan would be:
> - Add ITS in the location originally proposed by Shashi.
> - Add information to DT:
>   - Platform version (1).
>   - GICD, GICR, and ITS base addresses.
> - edk2: Convert GIC driver to support dynamic block addresses.
> - TF-A: Parse the DT and add SIP SVC calls:
>   - to retrieve it (or return not supported if not found).
>   - to retrieve base addresses for GICD, GICR, and ITS.
> - edk2-platforms: Query TF-A for platform version.
>   If platform version >= 1, request base addresses for GICD, GICR, and
>   ITS.
>   - Generate IORT if ITS present.
> - Update GIC frame layout to match an ARM GIC-?00. (Platform version 2)
>
> Unrelated to the ITS question, and not requiring any intervention on
> the QEMU side, we can then also transition the CPU and DRAM discovery
> to SIP SVC calls, and stop sharing the DT with edk2 completely.
>
> And some way further down the line we could do the SCP thing, which
> would let us support different GIC-layouts/configurations based on
> platform command line options. (Platform version 3.)
> (TF-A makes SCP calls if version >= 3)
> This would then require no changes to edk2-platforms.

This sounds good to me.

> (Numeric values described as incrementing integer rather than trying
> to guess at specific qemu release numbers.)

This is kind of mixing up two separate things. The above describes
three "versions" of this machine type, which you might consider
as like revision A/B/C of hardware (and where firmware might for
instance read a 'board revision' register or something to tell
them apart). QEMU release numbers and versioned board types like virt-6.0
are a very specific thing that is taking on a guarantee about
maintaining version compatibility of the same board type between
different QEMU versions. We can make sbsa-ref a versioned machine
type in that sense if you really want to do it, but it makes future
changes to the machine rather more painful (everything new
immediately needs flags and properties and so on so that it can be
added only for newer versions of the machine type and not for the
old one -- at a rough count at least  10% of hw/arm/virt.c is purely
boilerplate and machinery for versioned machine types).
So it's not something we should do for sbsa-ref unless we have a good
reason I think.

-- PMM

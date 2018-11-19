Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1111207wrt;
        Mon, 19 Nov 2018 09:17:46 -0800 (PST)
X-Received: by 2002:a05:660c:984:: with SMTP id z4mr8960516itj.77.1542647866489;
        Mon, 19 Nov 2018 09:17:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542647866; cv=none;
        d=google.com; s=arc-20160816;
        b=faB6vDvr8OlOXY9cZA1GFVpAApouTBtrvfZxu3rXVL1rX94EjVyKgMDEcI7W3vRL9y
         diV4KF8X2kvNF56qf+rcfObbz+/QX8+a9o/M2U1hcS0biQz1uDXZegwE3DQ5pLpF1Yex
         O1gPnWiI4uE/KsK437aYvjP2nUVTk3y/ziVJSBN45ZBMA834i0GGjnadmG6cMRgttk8i
         Bf4NCebBUuugogxydiQ1zE+49gAZazFW//c5eB273ji4Lhs4wVPHkZGakTW6FjqnHE0f
         IYxyW8ezj6dsHrInfhtvtJ4xhJ9+AuI0P8GkQpBbRL5T2SAv2acTpLZTJClDHGeayPUJ
         r0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xgqRtn+RZQwioGMngExKtPVZy9LUTLk8PIgaZLIgDWU=;
        b=jT7pOFBW7vFjCnriK+yfry0zd9+LZWaG89PCnzo1KyMkr716CxIWg3UwAJb+G94dBG
         +UrBysHnmEkBwujdOQ+U4gzgsvnTF/38MH9wfAfVQkc1wcEjan07csXRpTM3yNsf0a3i
         d1jAqtgBmSTqetneQQbQra0Mf425PV/nHtfeDRTPVrmTAs0pY5+MqJ1HT7WUUp5M3N71
         220DgMjI2vGIPvCHgBBP54FQDMxpLp4NWnO4+Smfc/ji3I3OwsyV7g7IybNSj3jq7+Pp
         FWc2Ai47Ode9Cr2q0NqJzYZAwAj/eI/FAY7MMcNleK0hp0e5kFjA1bX2IFR51iaodGyo
         Q8eA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LaNW8rID;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t17sor3144977jad.10.2018.11.19.09.17.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Nov 2018 09:17:46 -0800 (PST)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LaNW8rID;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xgqRtn+RZQwioGMngExKtPVZy9LUTLk8PIgaZLIgDWU=;
        b=LaNW8rIDwCpQpVKQLoRhA172yvwf4U93SHgzyugvJ6HfvK9nFrTy7usAWTQe5nV6vU
         HyeY/EK9ubrGPUQFp6uerhzzsL4lvXzeplwyVlde4t27/ZrRBOaM86G1zxq+Yy8z/6Bo
         u7wLsyvf74t8c98yihphyu9oKCWfbm7qas53g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xgqRtn+RZQwioGMngExKtPVZy9LUTLk8PIgaZLIgDWU=;
        b=DtV4q4p7jUOdGvYXmJBzvPtrRVBLDlvFZrogKZ61LtcdRaQ1b/k0N9AYTcssE5Wml6
         rK7qvaFHFfxtbB8cCzQT3W4/fhkXVsZM6PINu/C4ErJHnI47k+jKGbtK5kHtRZXfHIfy
         LJEDtwnQtoDuKEi7bAO5OeM7FywNJF6vG+b9TmF6gkJIN7pTXQGc1OG3ZtnGlfBiDInq
         5p6/jmBkcV8+Srq8IAMIrciuVHe5+7bODVSfIEWQAFyHgoGwJ3cnscCWSbO5vWYTdYJR
         R8Fc+jMY2m7YEnID10kN/P85KH18G1XZkWbmPaDDsKINzh8kv5bsqTO8ECkmvmY3Tr+8
         ROQQ==
X-Gm-Message-State: AGRZ1gKWtNRAtakdfRIP+3BhWxz2qfxA1kYZnU+TqUd7N3HAsEp1EMo7
	JoHxYhkhUrUcPg9HW+xjA2t8//hL3gwu9wkpu/agOwpe
X-Google-Smtp-Source: AJdET5fLcqs3fflfPhIkiS28kLMH/JjMxe32MkDXFWj4ON+y2+6jB8M9U5ojqsS4E2DyFMlemLoX41pl8+1uMq6q8l8=
X-Received: by 2002:a02:8449:: with SMTP id l9-v6mr20895488jah.130.1542647865326;
 Mon, 19 Nov 2018 09:17:45 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
 <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org> <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
 <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net> <CAKv+Gu_-U8BHthhen-GBkium9qJMdd-pe_PB9TPdUaP=koeajQ@mail.gmail.com>
 <20181119164421.me2j4fwzo43aghaa@bivouac.eciton.net>
In-Reply-To: <20181119164421.me2j4fwzo43aghaa@bivouac.eciton.net>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 19 Nov 2018 09:17:34 -0800
Message-ID: <CAKv+Gu9VjERXDdb=ZkvzVocL4Fd3_2e+F=H0nqEJVs4UEkYmhw@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Leif Lindholm <leif.lindholm@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: nu6mxVoGYwbp

On Mon, 19 Nov 2018 at 08:44, Leif Lindholm <leif.lindholm@linaro.org> wrote:
>
> On Mon, Nov 19, 2018 at 07:51:29AM -0800, Ard Biesheuvel wrote:
> > > > > I think what we *really* want is sysbus-xhci-generic.
> > > > >
> > > > > That'll be a bit more work though as xhci core and xhci pci needs to be
> > > > > splitted, simliar to how it was done for ehci in commit
> > > > > 5010d4dc618b6b8e7c21129c487c06f6493f71fc (and related patches).
> > > > >
> > > > > Or just plug qemu-xhci into a pcie slot.  Not sure which would be closer
> > > > > to physical hardware.
> > > >
> > > > We don't need XHCI especially, EHCI is perfectly fine as well.
> > > >
> > > > This is mostly about ensuring that the emulated hardware spans the
> > > > space of what we encounter on real hardware, and non-PCIE SATA and USB
> > > > controllers is something we see often.
> > > >
> > > > So I could live with MMIO SATA and PCI USB as well, but I'd prefer it
> > > > if we could have both MMIO.
> > >
> > > I would actually strongly prefer non-MMIO.
> > >
> > > What "we see" is generally a result of embedded companies "value
> > > adding" in the usual way when moving from embedded to servers.
> > >
> > > I want the SBSA target to be an idealised machine, not an educational
> > > vehicle for showing how companies have got it wrong.
> > >
> > > Where in doubt, anything software discoverable should win over
> > > non-discoverable.
> >
> > I don't think it makes sense at all to idealize the SBSA machine in
> > this way. For example, there are elaborate provisions in the IORT spec
> > how to describe an I/O topology involving named components (as opposed
> > to PCIe devices), and I have not seen an arm64 SoC yet that uses PCIe
> > internally for on-chip network controllers, nor do I expect to in the
> > near future. So having non-PCIe USB or SATA will permit us to exercise
> > code paths in the OS that we do rely on in production, and will for
> > the foreseeable future.
>
> Fair point.
>
> I have no objections at all to adding _some_ MMIO components for the
> purpose of being able to validate this. But I am reluctant to mandate
> discrepancies in bits that 99% of users would expect to work
> identically as it has done on x86.
>
> If USB isn't auto-instantiated in qemu-system-x86_64, then indeed we
> don't need to do it here either.
>
> But I assume you specifically want things that do a lot of DMA, so I
> couldn't get away with asking for keeping it to the SBSA UART(s)? :)
>

Ideally, it would be something that supports platform MSIs as well,
but that is unlikely to be a priority for anyone (and i would be very
surprised if any of QEMU's sysbus host controllers implement that at
the moment)

I can live with just sysbus AHCI, though, if EHCI/XHCI are too cumbersome.

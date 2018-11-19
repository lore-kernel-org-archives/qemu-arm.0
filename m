Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1009022wrt;
        Mon, 19 Nov 2018 07:51:41 -0800 (PST)
X-Received: by 2002:a6b:cd41:: with SMTP id d62mr13868934iog.121.1542642701025;
        Mon, 19 Nov 2018 07:51:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542642701; cv=none;
        d=google.com; s=arc-20160816;
        b=cAaAnGcGsJmYpafYjLd9yVrENSsUrjX4nnY+uwKUTXqSuKFQiobzLBH3OkFAIvkWpz
         E9P2MH79C5Ml2DgdHWFVREeXK0ZGzAo0yzeLAVcrFpH8KGbooqC/gMkSf8RgKx19FDdo
         XpU5xL0TtdDut0EVm7+H4r8/R0ojutDflbnXeATCDi7VcwvNrRudLZhfr9/V4m86I1FP
         IzirVGaKrl4DcmhshDIVClcNDi1TAWHZuFL/uv0QNxXAHcmDE0dGdyiQif0FbBtYr0Jh
         g7iQcBzXOgJ7AtHLBKuapxkKYtu6PI/mE5mxJBQ2U7yoNzalJtZWUO7Ay+ybGaRc8Ile
         SnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eqMIJzuum1Qjs1jF9GKPsCfyMSlqv7eMtLMOE5jwrsI=;
        b=XbKK+W8pcA/xaZ3hon5cEocrP9gAYHoaBwXKcW3KIWp55Qz5w7qK84Z5DvK7rWtRrF
         ZbLeyREnDaUteDHOOAHFobN87nh7cAzBMJYoeAYNFo1T2w5BPAanqCvvGs5sO2cD8FL+
         DEwOWI5ovF7mbbzMN6gUZTN1EZodt8/bxMxHZ1AJtQ1fC1L05B9e6qSvo8SoQ3u0CoVc
         hxDMwCv+4opqvskDXBbuY2UbNWxUkUtGjlFGZocXfc1ub4T5F0qNiewEC/UZmjiAQkKE
         S1lvAPKxU6Kx4C0ENvwB646XZ4e072Y/8CgG6dGzJgO5rBqLLYgxh6M4leVakF7YYXpN
         S0wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cr8JX7sa;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y8sor11348302iof.82.2018.11.19.07.51.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 19 Nov 2018 07:51:40 -0800 (PST)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cr8JX7sa;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eqMIJzuum1Qjs1jF9GKPsCfyMSlqv7eMtLMOE5jwrsI=;
        b=Cr8JX7salMbiNKFX7tlssY0WsEjZL5QefdwLdczLv2LubDOUGqnzUVAnRrXop50aNP
         X5c6T4p2PNg2cVp9+krQ9DVEVb+ocrljkbT1AKd444G61zSfBjWdYa15JO/cmzrqaKvI
         hiO2lT8O64ZD0aGYjBKZlTP7x2492/EOQnkvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eqMIJzuum1Qjs1jF9GKPsCfyMSlqv7eMtLMOE5jwrsI=;
        b=LkiGne4xN1DQFj/hNY6vx70Gp5nLv2j3xYvMaLWpU6fsdbZIk7rpoUERDbE8vsIMvb
         C26LC6cKql8JX/fQx82HVGb4oV2DuZZzocXjOOqT9m84uyzVWjKydbNJEXHxlzL1MpVz
         aJjRgFWKbXMoILF8nPCT3JUxqYGZGC3NCp7/1f7ZR3oIb5PiqC+RFNZdxzvEJDGnttvI
         cyRXxI+MAEV0cD6wUrzeIwEYfHDlhHRMIwpRH7sLhAHUEHX8OaNYQczbAoydts1hbfd6
         /QmNufSvbwy+y7NhPcZ+C64bhvgXZHnz1+FUjm6Tq4/Not2RWrshYs0NSfl5/xv0TvwP
         bD/g==
X-Gm-Message-State: AA+aEWbTELSGFtaJ3dIkPBNzS7YGKxbi17qhkN15tL/D4OTIhYMzlQWt
	2WUh7tFCC6PTKcGfx53XPz2GaEPo4wrFcxRkeK8x3Cwo
X-Google-Smtp-Source: AJdET5c8vkzJjBcDTy/ddjYcIDBvb3ibH8kWWlHlfa4n/lWr7jmKGS7XL280tC/L3WWu187NkgKKrgcuQnAUpcqv+9U=
X-Received: by 2002:a6b:5d01:: with SMTP id r1mr17150582iob.170.1542642700557;
 Mon, 19 Nov 2018 07:51:40 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
 <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org> <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
 <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net>
In-Reply-To: <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 19 Nov 2018 07:51:29 -0800
Message-ID: <CAKv+Gu_-U8BHthhen-GBkium9qJMdd-pe_PB9TPdUaP=koeajQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Leif Lindholm <leif.lindholm@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Hongbo Zhang <hongbo.zhang@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4pwkvp3cUBOh

On Mon, 19 Nov 2018 at 04:44, Leif Lindholm <leif.lindholm@linaro.org> wrote:
>
> On Fri, Nov 16, 2018 at 02:04:07PM -0800, Ard Biesheuvel wrote:
> > > > > What is this using the exynos4210 USB device for? That
> > > > > is definitely not correct for a generic board.
> > > > >
> > > > Checked the code:
> > > > #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
> > > > #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
> > > > #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
> > > > #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
> > > > #define TYPE_FUSBH200_EHCI "fusbh200-ehci-usb"
> > > >
> > > > The first one seems only a parent type, not a general instance, cannot
> > > > be used directly.
> > > > The other four are specific instances using the first as parent type,
> > > > one of them can be chosen to use.
> > > > That is my understanding, any comments, or do we need to implement one
> > > > which seems generic?
> > >
> > > I think what we *really* want is sysbus-xhci-generic.
> > >
> > > That'll be a bit more work though as xhci core and xhci pci needs to be
> > > splitted, simliar to how it was done for ehci in commit
> > > 5010d4dc618b6b8e7c21129c487c06f6493f71fc (and related patches).
> > >
> > > Or just plug qemu-xhci into a pcie slot.  Not sure which would be closer
> > > to physical hardware.
> >
> > We don't need XHCI especially, EHCI is perfectly fine as well.
> >
> > This is mostly about ensuring that the emulated hardware spans the
> > space of what we encounter on real hardware, and non-PCIE SATA and USB
> > controllers is something we see often.
> >
> > So I could live with MMIO SATA and PCI USB as well, but I'd prefer it
> > if we could have both MMIO.
>
> I would actually strongly prefer non-MMIO.
>
> What "we see" is generally a result of embedded companies "value
> adding" in the usual way when moving from embedded to servers.
>
> I want the SBSA target to be an idealised machine, not an educational
> vehicle for showing how companies have got it wrong.
>
> Where in doubt, anything software discoverable should win over
> non-discoverable.
>

I don't think it makes sense at all to idealize the SBSA machine in
this way. For example, there are elaborate provisions in the IORT spec
how to describe an I/O topology involving named components (as opposed
to PCIe devices), and I have not seen an arm64 SoC yet that uses PCIe
internally for on-chip network controllers, nor do I expect to in the
near future. So having non-PCIe USB or SATA will permit us to exercise
code paths in the OS that we do rely on in production, and will for
the foreseeable future.

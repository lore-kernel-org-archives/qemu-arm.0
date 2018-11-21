Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1583425wrt;
        Wed, 21 Nov 2018 00:36:11 -0800 (PST)
X-Received: by 2002:a19:1901:: with SMTP id 1mr2780263lfz.99.1542789371247;
        Wed, 21 Nov 2018 00:36:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542789371; cv=none;
        d=google.com; s=arc-20160816;
        b=d50Ey8mFqXpzVRT74w7kagMaFN+KxR3g7qdkcSHP00ZQf2X/YMHSvVMNC//uRje28t
         2s0SPaAGiIrZEJpOx9/EmgYx3IEYLG0LVyvew8QpoU0Kqx1OpN938lt/sSZ1EV3QaF9m
         3F2LvcSGFuYvGl2EvMAdZ2nKA9UpJmmGeH8HQswlvDAxPSSPzJuJYZhXT+wm+84s+n7G
         sE0yPszzZKw1UqLFZ2hZhK0dDnP2M4pyjOHUvpNUsP2z0RNyjrRxuHcYjViGVvRnBoOd
         gWZ4g/K08Qcc/ToPCLTidV709qnCsQaJ5YOIYv/ibbJ1NSxs4eP6A029Y5xy8//p1w8U
         5Qrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e1NIrHG0Y1mYY107hOmeCTGf3QsQpT7j8JPS1BqjoQA=;
        b=SVp4QOPooL8GJacQhppejtAguWnIjuZxhM9/5yN6KkDs7qlabxmDHfPX8+PdNSAVo6
         afCy9cyd+GogjkHOkEAYBG6kFl4k6HyHu+2dXJol2aKcRM3GrOeFpXmuGVE7ICw6Gapu
         sVh0H/0DVoUIFJk5e/2bG8ngqnvt7WTz4KBQsadIjw0cBS7/Xk4Ox4MZhY1tJTsjwh67
         pIB0aRV2tIQYomY4Dou6aSodRnLwv1LAqP3P9riK+xOVipamnh8jRPc8U0FMb0Jt8Qek
         RJfA4J92FE5KDPMtDrDNX5XII2GLFfTHOQm0KeqMYxRHoVO4Ov1exptIFLBXUMCEjw3/
         Wmug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aciF79ph;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y10sor10716817lfj.73.2018.11.21.00.36.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 Nov 2018 00:36:11 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aciF79ph;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e1NIrHG0Y1mYY107hOmeCTGf3QsQpT7j8JPS1BqjoQA=;
        b=aciF79phBlcbcrjh81JqtNAeAr8HbTHj9YYEIjC1QV03ZiFnru/PGpXbeX0xWmyf0b
         0H5dqeCdWQYqSqO3DQb+FlMigCnMeY8/oiKXCzyxA0R00j+WEtGRa287oxyY5bnHNhdQ
         YbOZ2lzeuKuk4+dHnSj6qKW3IoGlVpfIplrr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e1NIrHG0Y1mYY107hOmeCTGf3QsQpT7j8JPS1BqjoQA=;
        b=L/xCcM42pjFLUU5gh6IU2emcS4mgO0rzjy22UAfYBMj3dmxEq2zMnoOa3H9f9E2ghQ
         ITQlN0AKKX1JT0Ex3YFFgpLX3zspiw8gzyvZqLWAx1u/2wN60xhOrofspbn66dnX0GHL
         F7hva3qJ/2FhZHFQVs9GnFCEgHstfFKUoIHb7EP+VQVVjHZcgY1BoJsbVPaFGQQWjV2G
         sTAo6wei0tkkFsADiDz3f+He0KF2zxSxjF95Kqbg5WWes/hKzzaWj4I8Zc/6YTYLn7xD
         bxH3EoHER67nCZmSJNhITfsG4x1yxCAwSgoSy4XiK7fZM08c8cSUQ2U6Lhyz/kkP62UD
         129w==
X-Gm-Message-State: AGRZ1gJ/xWcSsxQ06TtQTNaLXwhCvlSY5QTNfhMgbemYvrvuBf8Nyt04
	gVlff1yJG3IhrNmcMJmRDJrkjJf+JJbjje707rMJ/ro7
X-Google-Smtp-Source: AJdET5crxOusUwzYmUUF66xdwtKDLXLk/t/P8YsFCmMZLx//vmqvXyKlNNNsM2zoLrZGhA//wx/ScIOyn4ZsRn/s5tA=
X-Received: by 2002:a19:aace:: with SMTP id t197mr3039094lfe.7.1542789370682;
 Wed, 21 Nov 2018 00:36:10 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
 <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org> <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
 <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net> <CAKv+Gu_-U8BHthhen-GBkium9qJMdd-pe_PB9TPdUaP=koeajQ@mail.gmail.com>
 <20181119164421.me2j4fwzo43aghaa@bivouac.eciton.net> <CAKv+Gu9VjERXDdb=ZkvzVocL4Fd3_2e+F=H0nqEJVs4UEkYmhw@mail.gmail.com>
 <20181120081613.bezcjotqhmqflvvb@sirius.home.kraxel.org> <CAHmQWvDua+3fXT7wA2j7wDRbOi5VJWfMa_+YYt6Xjv9XZF1Skg@mail.gmail.com>
 <CAKv+Gu_hMyn0g0hV9z1nZY+neGKg_7Rjm_cS-u33HkGQra_6ng@mail.gmail.com>
In-Reply-To: <CAKv+Gu_hMyn0g0hV9z1nZY+neGKg_7Rjm_cS-u33HkGQra_6ng@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 21 Nov 2018 16:35:58 +0800
Message-ID: <CAHmQWvBJgyFY9Xme9k3qPA+QOXOX8KTZt+Qp0bt29cGRsEjWKQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: kraxel@redhat.com, Leif Lindholm <leif.lindholm@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: hFVn1ptNdUtP

Well, considering all the comments/suggestions I received, I'd like to
try to create a generic sysbus xhci.
This would take some time for me, so my plan is to send out a new v5
iteration of this sbsa-ref patch with updates according to Peter's
comments, but without any xhci feature this time, and later I'll
create the sysbus xhci with another patch set, including adding this
new xhci to the sbsa-ref platform.
Advantage of doing so: this won't make the sbsa-ref patch too
complicated to review, and the xhci work won't block the process of
sbsa-ref work.

On Tue, 20 Nov 2018 at 17:40, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Tue, 20 Nov 2018 at 09:49, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> >
> > On Tue, 20 Nov 2018 at 16:16, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > >   Hi,
> > >
> > > > > But I assume you specifically want things that do a lot of DMA, so I
> > > > > couldn't get away with asking for keeping it to the SBSA UART(s)? :)
> > > >
> > > > Ideally, it would be something that supports platform MSIs as well,
> > > > but that is unlikely to be a priority for anyone (and i would be very
> > > > surprised if any of QEMU's sysbus host controllers implement that at
> > > > the moment)
> > > >
> > > > I can live with just sysbus AHCI, though, if EHCI/XHCI are too cumbersome.
> > >
> > > Generic sysbus ehci should not be difficuilt, 10 lines patch or so.
> > >
> > > Gives you only usb2 though.  usb1 devices are handled either via ohci
> > > companion controller (should be doable), or via integrated usb2 hub
> > > (more common on recent hardware, but qemu usb-hub is usb1 only).
> > >
> > > Generic sysbus xhci would be more work.  But you'll get usb 1+2+3
> > > support.  And wiring up platform MSIs should be possible too.
> > >
> > In kernel, these drivers are enabled by default:
> > CONFIG_USB_XHCI_PLATFORM=y
> > CONFIG_USB_EHCI_HCD_PLATFORM=y
> > CONFIG_USB_OHCI_HCD_PLATFORM=y
> >
> > If we do generic EHCI or XHCI in qemu, can the driver in kernel work
> > with it? (I guess yes?)
> > My thought is if the available kernel driver will work without any
> > change, then we can create it in qemu.
> >
>
> Yes that should work. Our MacchiatoBin DSDT has the following for its
> XHCI controllers:
>
> Device (XHC0)
> {
>     Name (_HID, "PNP0D10")      // _HID: Hardware ID
>     Name (_UID, 0x00)           // _UID: Unique ID
>     Name (_CCA, 0x01)           // _CCA: Cache Coherency Attribute
>
>     Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>     {
>         Memory32Fixed (ReadWrite,
>             0xF2500000,         // Address Base (MMIO)
>             0x00004000,         // Address Length
>             )
>         Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
>         {
>           CP_GIC_SPI_CP0_USB_H0
>         }
>     })
> }
>
> and this gets picked up by the kernel without problems.
>
> Wiring up platform MSIs would involve modifying the IORT as well,
> which is one of the reasons I'd prefer to make these fixed devices: we
> cannot rely on qemu_fw_cfg to generate it for us, and adding a lot of
> new code to generate this on the fly is simply not worth the effort.

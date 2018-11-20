Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp349317wrt;
        Tue, 20 Nov 2018 01:40:18 -0800 (PST)
X-Received: by 2002:a24:470a:: with SMTP id t10-v6mr1398740itb.82.1542706818847;
        Tue, 20 Nov 2018 01:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542706818; cv=none;
        d=google.com; s=arc-20160816;
        b=NVT9LhvbjHr1uvYf9rhstVp92eiLQZUrrze275ytVZKvcTiYRI160qSvOIgrR7aokS
         yFY3Sy6huIRueUC1iDpOSYLAbCbhMuGNZbs8S1YY2BYR8Kd7fuMA0CNMYNwYWlbFPccn
         oxJhbPVl+yGixg8SHLqEcI/I8RcQFzmo0oqtCuL+eL6QSRYmPfHtrhJSolS+Qp4wT6cT
         mfj6KNEPaNNkRgitPNCq8MfIlnv+Dgybh89Rx4RWYFhjpcfuaMtPRBUlZt1w2UTBScrR
         4nmKgEB6UBFRH+xwh0mFkfellWhdp7uG2H5mudZwPUbfi9BKzcN+UPdiZzYwbmNIbZ8e
         76jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SQhh9BLbCTquIE8hNbvIhauYFtZ5sAg1Bu8gqjhCv2Y=;
        b=kFiAi+wu1Svl3cRjAEj1e6afdYBMXubVjDcZiLupaGk3AcFjNrFptYc93+xqy3rx7J
         GLkMBFIeyGzphGW23KLvK0pEY7QX9558wFMhSYRqkZrOdCRTA6Leb2H3UmTby6nqRoZA
         x525wkLlOGdB7txbY4I8wvsBU7oVT67cJOd4/WbJDS/TPLJIdRmVoTd9pN/ER1sXuK+V
         lut1lQ4tKwKkPzHfaPss3zjgJJSFz1eAdZFwjMB5BCDAqAWOHPF8gEMxn31QRy9Dhplv
         E6tk48oemyjxuLHuTDmPDTPQiXnY3WaADOEAocZprbKOyEoBtxXUZYmkLnPvwyZTJ5t5
         rJTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPPcKDCs;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v20sor13011035ita.10.2018.11.20.01.40.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Nov 2018 01:40:18 -0800 (PST)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dPPcKDCs;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SQhh9BLbCTquIE8hNbvIhauYFtZ5sAg1Bu8gqjhCv2Y=;
        b=dPPcKDCsOXQk8dzUCFZp6m959Q+1yI8aPePoMLM5BrUpwlAJO5xrFzQz4J9yf6BltR
         /fkis0PcWlUJay140nW80TEvM1PaQx77QXm3DAI+csCtvD3VaJ139vmt291Sjek3E0mD
         GXMVrnQJ6ZXwYr5OGOrkFMFYKunyAIyoPGi/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SQhh9BLbCTquIE8hNbvIhauYFtZ5sAg1Bu8gqjhCv2Y=;
        b=SPgeXPEUieIWtoBn4cYguy3znjjgg8/jGgcQ7eE9Bz6iUM8/CXrDXnw2XcuHZDyN9Y
         PxhvJazfQhbFyqFSqMpm40Q/IMhZPvWsqOHtWxIBvDrch8fOErw50fSpGkiEU4bOnI/9
         Lgeh1vC0iur5+tm183nL42o0yfIpShU66ydjJq2i7K0Mxsy1+gnScCD87P4yQ1C8jTrS
         fvpgI2G4RWLMBuivGQfYQYZf4Nunp0KqkUBL2hENBCBQnpS82oO4yx9yCeAQJ+g0/yPQ
         1xXEOtPYfauwK+GUu3qPHzLB3B1udhTbU48rzXQ7K6aibW9YDEFs31LEvlpaHRd1RvWR
         /XFg==
X-Gm-Message-State: AGRZ1gLbDWJcUXxDEXUlHDbPvv6cOBXG/shu516JCtFWuI4BdABWdnDz
	A06c9Sk3XIzXPtszFKwdc1mS9DmZcxNdt2WnSxnZ0DSZ
X-Google-Smtp-Source: AFSGD/WusShgDKa904IVmttKgWjq+Sb7AZslxeECzRf3mwMWgYcn9n6Yl2wY0YKRB++IIV0mbzqJdzOGlCjw7tfNcxk=
X-Received: by 2002:a24:edc4:: with SMTP id r187mr1669235ith.158.1542706818385;
 Tue, 20 Nov 2018 01:40:18 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
 <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org> <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
 <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net> <CAKv+Gu_-U8BHthhen-GBkium9qJMdd-pe_PB9TPdUaP=koeajQ@mail.gmail.com>
 <20181119164421.me2j4fwzo43aghaa@bivouac.eciton.net> <CAKv+Gu9VjERXDdb=ZkvzVocL4Fd3_2e+F=H0nqEJVs4UEkYmhw@mail.gmail.com>
 <20181120081613.bezcjotqhmqflvvb@sirius.home.kraxel.org> <CAHmQWvDua+3fXT7wA2j7wDRbOi5VJWfMa_+YYt6Xjv9XZF1Skg@mail.gmail.com>
In-Reply-To: <CAHmQWvDua+3fXT7wA2j7wDRbOi5VJWfMa_+YYt6Xjv9XZF1Skg@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 20 Nov 2018 10:40:07 +0100
Message-ID: <CAKv+Gu_hMyn0g0hV9z1nZY+neGKg_7Rjm_cS-u33HkGQra_6ng@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 7nyYebo7c+sg

On Tue, 20 Nov 2018 at 09:49, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> On Tue, 20 Nov 2018 at 16:16, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > > But I assume you specifically want things that do a lot of DMA, so I
> > > > couldn't get away with asking for keeping it to the SBSA UART(s)? :)
> > >
> > > Ideally, it would be something that supports platform MSIs as well,
> > > but that is unlikely to be a priority for anyone (and i would be very
> > > surprised if any of QEMU's sysbus host controllers implement that at
> > > the moment)
> > >
> > > I can live with just sysbus AHCI, though, if EHCI/XHCI are too cumbersome.
> >
> > Generic sysbus ehci should not be difficuilt, 10 lines patch or so.
> >
> > Gives you only usb2 though.  usb1 devices are handled either via ohci
> > companion controller (should be doable), or via integrated usb2 hub
> > (more common on recent hardware, but qemu usb-hub is usb1 only).
> >
> > Generic sysbus xhci would be more work.  But you'll get usb 1+2+3
> > support.  And wiring up platform MSIs should be possible too.
> >
> In kernel, these drivers are enabled by default:
> CONFIG_USB_XHCI_PLATFORM=y
> CONFIG_USB_EHCI_HCD_PLATFORM=y
> CONFIG_USB_OHCI_HCD_PLATFORM=y
>
> If we do generic EHCI or XHCI in qemu, can the driver in kernel work
> with it? (I guess yes?)
> My thought is if the available kernel driver will work without any
> change, then we can create it in qemu.
>

Yes that should work. Our MacchiatoBin DSDT has the following for its
XHCI controllers:

Device (XHC0)
{
    Name (_HID, "PNP0D10")      // _HID: Hardware ID
    Name (_UID, 0x00)           // _UID: Unique ID
    Name (_CCA, 0x01)           // _CCA: Cache Coherency Attribute

    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
    {
        Memory32Fixed (ReadWrite,
            0xF2500000,         // Address Base (MMIO)
            0x00004000,         // Address Length
            )
        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
        {
          CP_GIC_SPI_CP0_USB_H0
        }
    })
}

and this gets picked up by the kernel without problems.

Wiring up platform MSIs would involve modifying the IORT as well,
which is one of the reasons I'd prefer to make these fixed devices: we
cannot rely on qemu_fw_cfg to generate it for us, and adding a lot of
new code to generate this on the fly is simply not worth the effort.

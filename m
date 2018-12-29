Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8891247wrt;
        Sat, 29 Dec 2018 01:53:06 -0800 (PST)
X-Received: by 2002:a2e:9c52:: with SMTP id t18-v6mr14933863ljj.149.1546077186173;
        Sat, 29 Dec 2018 01:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546077186; cv=none;
        d=google.com; s=arc-20160816;
        b=WCPJmhDO9tQtyE1ZI/qvg3BTev0JRFZv+0q9g+tDKBAi1uEcQ0u4woc5W47pIC5m9e
         Y4AQiCDmkAVTqYmxyQyFrApRS/00TyPwxl1OmZR0vsKZc7uWR1S80c9mU9ud/7gF+a5J
         H+Z1FnFVeJcUC0Nw+b5OB95pTqcy26+9i/4TI9zKY6qG5o5X/osqNYMZOVZTRiYRYn7Z
         PoWD/4r4oDNnpkKZncPOO1wot4NMqxywCIxYo1KG4HbrqxstQPAxZUHkMASesekE1SLW
         rn2HXRufCnnX3ZXl8DccEKPIl/21Mwyfd1MxHfU9R4ZDgRjLPpmUxiYT1RZ5yuGtVn7+
         wAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iRphg1+XCyQSDAyvUgSuYX0dKypIj1bo59JirUCdAlE=;
        b=gLVxCYPa7eYUwsIJWvtjnp/YueJWd2pd29MIRZmBRQm+D+tmkqdzSX8FRVoGvfb9pn
         jV5Jzj0yl+VeRlrsUH4iOYCdGhMFwilztxNlWZKdo+jKIoHzJVaQZara4ojNUxnIFoTN
         ouj8xcxpEE2cMYdyWjh+iBFOCMVJYZvid3IhvgJw0NydqO0Tw9+owUe03flPhD2HliSv
         5rIb8AYq2oYDU7PfYGm5c/K/2ODmGaMx3e0MugVipqWWqn7AKg7eXChCX0h3TZOGcpIb
         sbZ1GObC2GSmw0pmdpnfE9zXRZ7O5AQVC1E+lQTcjwPHffd7kuxCS9p+JDP1pKanFfcA
         HhXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlzRJnhP;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id u19sor11234709lfc.20.2018.12.29.01.53.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Dec 2018 01:53:06 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XlzRJnhP;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iRphg1+XCyQSDAyvUgSuYX0dKypIj1bo59JirUCdAlE=;
        b=XlzRJnhP5brusgBQC+CCEr9AxH6q9C6DDAdwNxUJ4F5iIYEnhHhvML7S+gzPkv7ofG
         u2m5zJ+2Z8ZRqezTgoMfjcJ7lkoPHkMKfhc1ci2MewvOjcDNBncMA6usRKAze4HlATAQ
         uIZLsMY2uyhTCQAgDoFWbCU6Fe7UmOwTtl68k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRphg1+XCyQSDAyvUgSuYX0dKypIj1bo59JirUCdAlE=;
        b=S7OOu5EWpBfUaLmYFL/DTTbOSZQ9rx+2AHw1wc724OcJQ7bHp8Th1WIELIW/6B3U8Q
         dqQPAqXcGesA+nk7wUcJVGdrfKuBXjQlgLyhWmTprfTwIF70k0/NDCr8Orqb3ybLDsMx
         5hmYUjTg1LF0XgnMLD0eD3hoHZgmWduwtj8dyYj6kUa6qdM/IYWAm51xD9s6xFbOCsA3
         Bo9sg4YPfGR24Vs+i/QlSHVdCpCexOPqpmOeawxf73hqUKh50krw0AMabEpTKbTTfCpa
         LyeRIWQEzQAsxEG2ySerdJ8Hp7H4Xnjy8iAvFz3lVJdPjTYIIxaaj/kphYPnYrievt88
         DZ5g==
X-Gm-Message-State: AA+aEWayHw3pvoV8eJ4/rKbr2xxtTYoQCx+joUFcoiO5E4q1//hFQJI+
	taHtxRpr8pEOW41m91nAUQYGI5W3+0JcFnA2jIUNL6eW
X-Google-Smtp-Source: AFSGD/UNbxXXFkGdjEgys0nw8u7pv8AnCARQ4GT3nMISer7XOg2NoDq0tzR0kLwZUqJ0glJxHogjo3qxI89PWsMlOb0=
X-Received: by 2002:a19:1019:: with SMTP id f25mr14972426lfi.54.1546077185687;
 Sat, 29 Dec 2018 01:53:05 -0800 (PST)
MIME-Version: 1.0
References: <1539939312-19713-1-git-send-email-hongbo.zhang@linaro.org>
 <1539939312-19713-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA-vF5orNpfGFe2sGWh=TxWL054PmCM-Yu4faJne+4CkbA@mail.gmail.com>
 <CAHmQWvD1ocAfZo=9aJYeuVDWrBk=AF_D-AgHriYb3-7=n+rR6A@mail.gmail.com>
 <20181116122705.msdb5hydmhtyzzxy@sirius.home.kraxel.org> <CAKv+Gu8QXaRioVPNze_+mJg4aqjJmwn4O-1jdRcYwrkieXrBwQ@mail.gmail.com>
 <20181119124423.qj3sjhhdyetrbju5@bivouac.eciton.net> <CAKv+Gu_-U8BHthhen-GBkium9qJMdd-pe_PB9TPdUaP=koeajQ@mail.gmail.com>
 <20181119164421.me2j4fwzo43aghaa@bivouac.eciton.net> <CAKv+Gu9VjERXDdb=ZkvzVocL4Fd3_2e+F=H0nqEJVs4UEkYmhw@mail.gmail.com>
 <20181120081613.bezcjotqhmqflvvb@sirius.home.kraxel.org> <CAHmQWvDua+3fXT7wA2j7wDRbOi5VJWfMa_+YYt6Xjv9XZF1Skg@mail.gmail.com>
 <CAKv+Gu_hMyn0g0hV9z1nZY+neGKg_7Rjm_cS-u33HkGQra_6ng@mail.gmail.com> <CAHmQWvBJgyFY9Xme9k3qPA+QOXOX8KTZt+Qp0bt29cGRsEjWKQ@mail.gmail.com>
In-Reply-To: <CAHmQWvBJgyFY9Xme9k3qPA+QOXOX8KTZt+Qp0bt29cGRsEjWKQ@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Sat, 29 Dec 2018 17:52:54 +0800
Message-ID: <CAHmQWvC-4VwnjjHR=4+cds6awTUrbgWwjdYh0Y-+i9-ALtX_Og@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v4] hw/arm: Add arm SBSA reference machine
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: kraxel@redhat.com, Leif Lindholm <leif.lindholm@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: /xeAEkxPTHPJ

well, checked it again, creating an generic xhci may take much efforts
and it is far beyond than my main task of creating an arm server
platform, so I'll create a generic system ehci, it satisfies our
requirements very well, will send it out separately.

On Wed, 21 Nov 2018 at 16:35, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> Well, considering all the comments/suggestions I received, I'd like to
> try to create a generic sysbus xhci.
> This would take some time for me, so my plan is to send out a new v5
> iteration of this sbsa-ref patch with updates according to Peter's
> comments, but without any xhci feature this time, and later I'll
> create the sysbus xhci with another patch set, including adding this
> new xhci to the sbsa-ref platform.
> Advantage of doing so: this won't make the sbsa-ref patch too
> complicated to review, and the xhci work won't block the process of
> sbsa-ref work.
>
> On Tue, 20 Nov 2018 at 17:40, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >
> > On Tue, 20 Nov 2018 at 09:49, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> > >
> > > On Tue, 20 Nov 2018 at 16:16, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > > >
> > > >   Hi,
> > > >
> > > > > > But I assume you specifically want things that do a lot of DMA, so I
> > > > > > couldn't get away with asking for keeping it to the SBSA UART(s)? :)
> > > > >
> > > > > Ideally, it would be something that supports platform MSIs as well,
> > > > > but that is unlikely to be a priority for anyone (and i would be very
> > > > > surprised if any of QEMU's sysbus host controllers implement that at
> > > > > the moment)
> > > > >
> > > > > I can live with just sysbus AHCI, though, if EHCI/XHCI are too cumbersome.
> > > >
> > > > Generic sysbus ehci should not be difficuilt, 10 lines patch or so.
> > > >
> > > > Gives you only usb2 though.  usb1 devices are handled either via ohci
> > > > companion controller (should be doable), or via integrated usb2 hub
> > > > (more common on recent hardware, but qemu usb-hub is usb1 only).
> > > >
> > > > Generic sysbus xhci would be more work.  But you'll get usb 1+2+3
> > > > support.  And wiring up platform MSIs should be possible too.
> > > >
> > > In kernel, these drivers are enabled by default:
> > > CONFIG_USB_XHCI_PLATFORM=y
> > > CONFIG_USB_EHCI_HCD_PLATFORM=y
> > > CONFIG_USB_OHCI_HCD_PLATFORM=y
> > >
> > > If we do generic EHCI or XHCI in qemu, can the driver in kernel work
> > > with it? (I guess yes?)
> > > My thought is if the available kernel driver will work without any
> > > change, then we can create it in qemu.
> > >
> >
> > Yes that should work. Our MacchiatoBin DSDT has the following for its
> > XHCI controllers:
> >
> > Device (XHC0)
> > {
> >     Name (_HID, "PNP0D10")      // _HID: Hardware ID
> >     Name (_UID, 0x00)           // _UID: Unique ID
> >     Name (_CCA, 0x01)           // _CCA: Cache Coherency Attribute
> >
> >     Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> >     {
> >         Memory32Fixed (ReadWrite,
> >             0xF2500000,         // Address Base (MMIO)
> >             0x00004000,         // Address Length
> >             )
> >         Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
> >         {
> >           CP_GIC_SPI_CP0_USB_H0
> >         }
> >     })
> > }
> >
> > and this gets picked up by the kernel without problems.
> >
> > Wiring up platform MSIs would involve modifying the IORT as well,
> > which is one of the reasons I'd prefer to make these fixed devices: we
> > cannot rely on qemu_fw_cfg to generate it for us, and adding a lot of
> > new code to generate this on the fly is simply not worth the effort.

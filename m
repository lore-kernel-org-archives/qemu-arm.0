Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3941504ejx;
        Tue, 8 Nov 2022 06:16:53 -0800 (PST)
X-Received: by 2002:a17:90a:ad47:b0:214:3034:faa3 with SMTP id w7-20020a17090aad4700b002143034faa3mr35299978pjv.66.1667917013131;
        Tue, 08 Nov 2022 06:16:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1667917013; cv=none;
        d=google.com; s=arc-20160816;
        b=fMbf9eydLELP6mEohpyXjorWPf3A6sPJHc7L3KlnYm78brJWdmCpAI89NotQf3MwNf
         bB+ZC0SeU8wz6QAYP27V1gSF95xZ0ZaodzDSeMaVVBCSy/QMBc4mSfYzbMhxCQRVZ0XJ
         TInhyMEV1h3QFbZQwyX/8t4wefN4Ytzf3xMkOCgc54xtdhwr/uCqt2ZAhBNiXxqg8Llk
         cvef0qE3+6iezHASss/X+RMGZXr3XFGCqkOWfH63+y94k5eO3PKHzJ25oGgGrV3TjXNQ
         ID6fFs0IMLaYcnG+pd3Fj08BD7q9TPl9rodnpV41sTmTC/pHX6mwDJDUywzhi0xg9uII
         Fm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ITPAgsJShPeK7DahnQn03u0wvS/RXm6MP/AEDwichk=;
        b=iEgWMVgHLfowINXAvL3ehrLCIR0XgG5ZoQYo0vCNsuBM8RmLJosx430f8/TI7h0ua1
         wNrgaEWhV4TxGnRILkR2qxLu1sLkLCJekGlFoOl4l9ysx0RjEsbczN2REVdbsq5WEVfZ
         LM8NsBdwcrt7wzvzNB3tQ/HJOMMG2myDqfDZUnkr+sRTu/nAUZYjtJSBcFNxbwxY/i4V
         gjp2NddFt1Cyc0mBElMvtVZIYf2URr/j0Zng86YgcJiYbZTzKgsy/3wos6PrXlVLbGB9
         LT5XbdNpRfPC+Wy5VdJ+VrNjoyUaqDJXIE9FtWH2tvuaa9AirT2D3fOJtVD+tkbmOPLh
         1h/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N1SAehqT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t4-20020a17090a2f8400b001fded8896a7sor4160319pjd.15.2022.11.08.06.16.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Nov 2022 06:16:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N1SAehqT;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ITPAgsJShPeK7DahnQn03u0wvS/RXm6MP/AEDwichk=;
        b=N1SAehqTGa15ITQHH96SfR79qA6M959lnn5KuegCiOdNP6gTHR62qdRblkZBRGFhjK
         nhp+WgrQ+Unv3iZHcrY1CSmIWIZymwvuWgDSbtaxASd+TserMXrO8w3Il63XtPt8rwiF
         +JMPoNAhY+vSBCRAnbb6kxuhze0HwuMepkTKRjLFOskM4DBcYve/15LWswyp/k91GQgZ
         1yZEDBzm3zLdfPQuBjOlFd4jAPD96bNeYVO8I1Yu9kfVdpiGCLxtMQMhh1YVi779H7PA
         ljcRBh5JWdBa+3KjCgd4y++EIJw7QaiB9Fsci6qA5JgBy5grvucHun+p/jFTphPbKRcM
         U5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ITPAgsJShPeK7DahnQn03u0wvS/RXm6MP/AEDwichk=;
        b=iKv326Yz+fi6XVdMzJ2MAUpxkzBuB3iLAUgkpzdt4Ka02yHaLLfAFWJCCBBtuMZSM0
         QC4Yr+t3+7sp1ULMvCShOck/j8PCA3K4/DBB/yws+U+5e2zlbfnXmeAMnZZtONnHocnK
         PPMlsXyD5qHuUyhhmJUEl/KBLvG2JWPUGv6oEOZGRoWJDI4obNziZ8hQC1r9Ieq4lXhu
         5JTczE/lsMrksjkLzcsw/KCfZWHHG8vg21hMW2uxjlysgrtSRdmQSwJfNZcXtO3CAbO/
         jLBTf3SjK6yekglUzLbUwPYymnYyZ0u1qUSCjgqwf6/nstoigpJvoK2JjsFJfWJvKH2b
         7/4w==
X-Gm-Message-State: ACrzQf1AI1xtH5HcKaDJJHRNUyTVp77hml4Er+XymNcRKiNKIds+ETcz
	uUL5Kcu9c9dNFRPoFcREofHPLFueMRNo6PJf+a02cwAp
X-Google-Smtp-Source: AMsMyM4NeCoO+w6b5IEy+dpY5I8RFpOMVr0Gjxua2voc5Ss2xDaVAEs5nbGDa3tS2ut13CdWBZ1GIRlZ/kEA3LpeQ04=
X-Received: by 2002:a17:90b:4b81:b0:213:341d:3ea6 with SMTP id
 lr1-20020a17090b4b8100b00213341d3ea6mr57229214pjb.19.1667917012688; Tue, 08
 Nov 2022 06:16:52 -0800 (PST)
MIME-Version: 1.0
References: <20221108023542.17557-1-schspa@gmail.com> <87fsetg5xh.fsf@linaro.org>
 <CAMA88Tqt-7rCTC38OhZGmCZyO4rFz+HHBNtDjaVCbhna01yScQ@mail.gmail.com> <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
In-Reply-To: <CAFEAcA8J2Tx4gW5Y2q6qtkJ0BPpM4iWkt3nz0uezV+kiz6m_Ag@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Nov 2022 14:16:41 +0000
Message-ID: <CAFEAcA8KnNE90tHQjRNEVny=s7YLD5Wmff9R8ZyLxxz47bwRGA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/boot: set initrd parameters to 64bit in fdt
To: Schspa Shi <schspa@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Vby1ZcUeeGub

On Tue, 8 Nov 2022 at 13:54, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Tue, 8 Nov 2022 at 12:52, Schspa Shi <schspa@gmail.com> wrote:
> > Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> > > There is a whole comment in boot.c talking about keeping initrd withi=
n
> > > lowmem:
> > >
> > >     /*
> > >      * We want to put the initrd far enough into RAM that when the
> > >      * kernel is uncompressed it will not clobber the initrd. However
> > >      * on boards without much RAM we must ensure that we still leave
> > >      * enough room for a decent sized initrd, and on boards with larg=
e
> > >      * amounts of RAM we must avoid the initrd being so far up in RAM
> > >      * that it is outside lowmem and inaccessible to the kernel.
> > >      * So for boards with less  than 256MB of RAM we put the initrd
> > >      * halfway into RAM, and for boards with 256MB of RAM or more we =
put
> > >      * the initrd at 128MB.
> > >      * We also refuse to put the initrd somewhere that will definitel=
y
> > >      * overlay the kernel we just loaded, though for kernel formats w=
hich
> > >      * don't tell us their exact size (eg self-decompressing 32-bit k=
ernels)
> > >      * we might still make a bad choice here.
> > >      */
> > >
> >
> > I think this lowmem does not mean below 4GB. and it is to make sure
> > the initrd_start > memblock_start_of_DRAM for Linux address range check=
.
>
> The wording of this comment pre-dates 64-bit CPU support: it
> is talking about the requirement in the 32-bit booting doc
> https://www.kernel.org/doc/Documentation/arm/Booting
> that says
> "If an initramfs is in use then, as with the dtb, it must be placed in
> a region of memory where the kernel decompressor will not overwrite it
> while also with the region which will be covered by the kernel's
> low-memory mapping."
>
> So it does mean "below 4GB", because you can't boot a 32-bit kernel
> if you don't put the kernel, initrd, etc below 4GB.

A kernel person corrects me on the meaning of "lowmem" here -- the
kernel means by it "within the first 768MB of RAM". There is also
an implicit requirement that everything be within the bottom 32-bits
of the physical address space.

-- PMM

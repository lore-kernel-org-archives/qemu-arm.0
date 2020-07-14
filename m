Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp242566lfm;
        Tue, 14 Jul 2020 08:00:35 -0700 (PDT)
X-Received: by 2002:aca:5257:: with SMTP id g84mr3848347oib.105.1594738834878;
        Tue, 14 Jul 2020 08:00:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594738834; cv=none;
        d=google.com; s=arc-20160816;
        b=TvAqaYaRmxSbjb5C2ih2Y6eINyZVK64L1cUxijrtmMP9uXcE9wnY44RM5e8AyIyWvb
         wUjJ+Wp+kGaqH+DLNivtNqLzKjnRHTMWchrxNXqVrQqgnlRMYa3mtR/BsnNyleGftdTP
         nMWLlZJP7zDayvamF/owTixoZG1TYiL7PuPaZq+wP4l4YI+K064Pdne8qArV3C+qCxLl
         ljgxyueH6HVbpjrykZu41iXYM1nAU+iRsoprw6Byei9899wNQEnlPOdS33KKUzBT1ooH
         vOByKVB00SqFSrZodtvsMdBbQ2lWFEYemMjYPU8ZHFHqys2obL1GM0q4ew4bL7JIk1ZY
         Fdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r5oiMP4tCWVkF0mn3zMNFuadBPyU+S4nEE9KnOVOcTI=;
        b=eXP/MKINRqpZUblbTR6RvQaqxU09cHOHNmOlHI3//xia9jCMrmNPQefHxNCQywN7Zn
         4qdj+M+tFDla+GfuOnlOi4gALeJWq7P+7Dbjg8NKEJp/9/a2RznbuGmB8j7ccWlEFrA5
         7Wowt+QzWZprCvA+TID3uCmIqFxXT9QfSqMwD6gn7rIiUGmn/8xBF2exYCast01QFhOZ
         9da9R7Z9TQtRbqF9l/Y1oMBM+rayR4g4ZoAR0Axe2/pjv5wrarsXe04WhpyE+zpEGR1G
         h6qVxRGrOL1PzDy5E+rDhQohBYOQNE8aDl8zT06o8+wdREOxt89om/9XMBMQ4eB0QFCN
         RAtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LnYGb4Hq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v7sor10788121oto.117.2020.07.14.08.00.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Jul 2020 08:00:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LnYGb4Hq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r5oiMP4tCWVkF0mn3zMNFuadBPyU+S4nEE9KnOVOcTI=;
        b=LnYGb4HqvSr1i208KTdSKi6M1f3PBIfu5IpiLpu+VhkqAPd5TZ7jQ7P8CJgIbSB5zc
         OGU3EDXgF6jyrUTSMl9VN+rPvxFEi9pBzo90FBo8AjjKJUJ/gT/SQLoCgaz4sOcxuDjD
         jsWuP8Fd3qRXIeGPlllMzF9v36425yPiB+BfQic3RI82bYpVqdfMhqV66Qq5bgwcYtrB
         vRuQVsRqIDWBLmdFxOaLrT7kHBVlA4XUP51eAjMY5ooYhLDGrigjyqhK8MWisu9k3w64
         iyNAu610LsMHxucU0eWlJD8b6/QlWvjI1WYlMoNupzKXL9jWngnqRuUbQWb9RDSsKN1b
         Mt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r5oiMP4tCWVkF0mn3zMNFuadBPyU+S4nEE9KnOVOcTI=;
        b=BMnzv1Gg3x8/0aycDYALXUs3nHbY7pT3mEoSxKMYWoIXUdaB4mUCrk1GErv1nWWrzZ
         18y7SSl7faoJKHpZ+thn/6HWYA5CgWx/1wzssfR29L+Uifa/0gXylqUq+J8qn16+yNsW
         5ql8+gzndacRgVISbFC65Gn1S8//WoG8h1bdDNj1XpkYKDR66OJ5unhQxmdCFof1FTNH
         OztDYNJql9+Jalbim/UZHs1h9DGwMba7cB7df8tYZRYZEUhFCo5X9wEQLgs1p1gHyKxE
         wSsjOTDi/uMxi4B6hurLWGzN0srOF3D1tV/rwlmz4L7KGBm8JuNOzcFflT0BlG/G022y
         5WyQ==
X-Gm-Message-State: AOAM531h8fTOvcbBpMr8Cvz1aFOyGAaCncVInPTFAsJlaN39bqeynO66
	j1sUdjrSZ/j6Udis+B21lU6PpZTMSNs9DQca0zKMiLdxqv8=
X-Google-Smtp-Source: ABdhPJw7xPJ3guVc1lP+X354Njli8ve2d/JU29HBg9tZIkjpZAR2oC25fDuL4l9FIRMA6L7ytuV99l9uT18ZrZkkXpI=
X-Received: by 2002:a9d:7303:: with SMTP id e3mr4230778otk.221.1594738833592;
 Tue, 14 Jul 2020 08:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200713175746.5936-1-peter.maydell@linaro.org>
 <20200713175746.5936-5-peter.maydell@linaro.org> <871rleywhn.fsf@linaro.org>
In-Reply-To: <871rleywhn.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Jul 2020 16:00:22 +0100
Message-ID: <CAFEAcA-qkx_AVrYAsc0K=DYBnX8VGBftihuXDbJN-3qsc6OzEQ@mail.gmail.com>
Subject: Re: [PATCH for-5.1 4/4] docs/system: Document the arm virt board
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Z0IQZ9G9Xj1D

On Tue, 14 Jul 2020 at 15:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > Document the arm 'virt' board, which has been undocumented
> > for far too long given that it is the main recommended board
> > type for arm guests.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  docs/system/arm/virt.rst   | 157 +++++++++++++++++++++++++++++++++++++
> >  docs/system/target-arm.rst |   1 +
> >  MAINTAINERS                |   1 +
> >  3 files changed, 159 insertions(+)
> >  create mode 100644 docs/system/arm/virt.rst
> >
> > diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> > new file mode 100644
> > index 00000000000..6a7823d8bca
> > --- /dev/null
> > +++ b/docs/system/arm/virt.rst
> > @@ -0,0 +1,157 @@
> > +'virt' generic virtual platform (``virt``)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The `virt` board is a platform which does not correspond to any
> > +real hardware; it is designed for use in virtual machines.
> > +It is the recommended board type if you simply want to run
> > +a guest such as Linux and do not care about reproducing the
> > +idiosyncrasies and limitations of a particular bit of real-world
> > +hardware.
> > +
> > +This is a "versioned" board model, so as well as the ``virt`` machine
> > +type itself (which may have improvements, bugfixes and other minor
> > +changes between QEMU versions) a version is provided that guarantees
> > +to have the same behaviour as that of previous QEMU releases, so
> > +that VM migration will work between QEMU versions. For instance the
> > +``virt-5.0`` machine type will behave like the ``virt`` machine from
> > +the QEMU 5.0 release, and migration should work between ``virt-5.0``
> > +of the 5.0 release and ``virt-5.0`` of the 5.1 release. Migration
> > +is not guaranteed to work between different QEMU releases for
> > +the non-versioned ``virt`` machine type.
> > +
> > +Supported devices
> > +"""""""""""""""""
> > +
> > +The virt board supports:
> > +
> > +- Flash memory
> > +- One PL011 UART
> > +- An RTC
> > +- The fw_cfg device that allows a guest to obtain data from QEMU
> > +- A PL061 GPIO controller
> > +- An optional SMMUv3 IOMMU
> > +- hotpluggable DIMMs
> > +- hotpluggable NVDIMs
> > +- 32 virtio-mmio transport devices
>
> We seem to miss out we also support the virtio-pci transports here.

That's just a special case of "PCI", which I did indeed somehow forget.

 + PCI devices

thanks
-- PMM

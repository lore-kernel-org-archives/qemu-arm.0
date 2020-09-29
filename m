Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp4892994lfq;
        Tue, 29 Sep 2020 13:11:44 -0700 (PDT)
X-Received: by 2002:a17:906:358c:: with SMTP id o12mr5588081ejb.406.1601410304822;
        Tue, 29 Sep 2020 13:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601410304; cv=none;
        d=google.com; s=arc-20160816;
        b=Lz4VaTN95P9E9OQP7qO/yDKhz6YzxAhU7sgJa8CBBOrUVxTLdipHcrEb2FgpGcfEgV
         nzNszfGqwxoKImuU40Lwq+RfAXvWo0BfGynztd6rE3Hf08sxCaKdRznQ5tE0X6Y6vscN
         cgyGU0b/7eCqZ8ILuCiDC40xPufOvwiwHl0jfOJJ2oauYA+icohVgfPUwd2Uh7vvnPcb
         s62N5PE8y3ZrMsFaDUo6dhvjZOzLP7qhGGN3KfWzTlzYWthJsckEOWTM/h6ljNezcMw/
         EaWF3EKCGUqWJe+FYrJRFO1ISIbwHkXnFO+0QknVikjEb+PIDuW4o+pjljifoyXxx0eH
         nuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=73MxEsPtUT/TTCdrgP6iPP4/Lq4sm/5f1xzmLyh6hxA=;
        b=sp75d8np7IwRf0/IDRNfj9AqRDWzWjU4m/LfpT6HBxxnjgkNqBBOAaK1KJNKkAFpY+
         KclHM966bzE04EIGPOPpbWxCy5gpNtNfYMPHf14HYfkZUgPiprK3OFeRghDs+0uZgJgr
         NQR4FFEToa8bQwNZ040EV4VbD1dtH6uquenuE9dQUZ+57bTuMCT34bW79qJLbfrd6ht2
         kHRkLYZrOeUTXB9ZaXFQwQGQfH6KZ80RDcFoP3nTghgbgNVOmw0eB8XBpp5fl0U3Nve7
         zPQbbhOF0FYl3sLn/QJXF6Piu4eECjZ8PliF1II6Y0sC55f0l5ajSTdxvZ/9lsVbXhU/
         jcfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ggxhdLxC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p27sor3954411ejd.51.2020.09.29.13.11.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 29 Sep 2020 13:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ggxhdLxC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=73MxEsPtUT/TTCdrgP6iPP4/Lq4sm/5f1xzmLyh6hxA=;
        b=ggxhdLxCcavZ37JWVQnppWDOQKG1qFmxrrJTXv2OCkUF5/4r6+TJGKFxoXwaqduF9D
         6qWtqG6zl2kmkzE7lPX96g5ScHb4lB7arVx+fYXAPR0RVB3q7RJXKRLX6gTuA649f27t
         jUgxK/HMOVu48tiF7jgMaAK/mr/dI71tC9Ijb0H+pxCjuuaSuScQ43hLgmiJJyv547rw
         QIvi5b+16P9Up6iGBm/QoVJBf2GQNZXhGk2RzT5RacStnF51hlJ3n3LDYcub6+CIfoGa
         MjHJe+SYfRlmsZrFI91Lh1ENWcZrKnrEl+MVtDQcOMSt1oAYbykPKBh9maC/8DatLmTw
         nQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=73MxEsPtUT/TTCdrgP6iPP4/Lq4sm/5f1xzmLyh6hxA=;
        b=ZDTn5wRZWa64Y4rss1B2fFwgMIZcNu+pxx4SBrxX9E/vvdsYZhMhIVBZwnGjqIK0Hz
         NeGTC6MEjVmSRvIE0x/7eQUKwhlDf/SHlSwLEr6SqDzSYiKPQb/hYIE2cXkucKZHSXbl
         I2NjIBC0KlSmU2I1rAKLfP3wZCKWdQ4E3ULYJp8eH4je/6TYcNcqTk/2vI/OIzQ54f/P
         XO28N2mHJtvJGc06qtdU/3IZgpMaBsRWsAxRMexu0qpZ6KoLgk3fzXsADEiYBRXLI927
         aerznPtM4rawCYc9VoAxSdsVCdlOjWFSrf2s1v5oBKMNxHw/3VE4CgWnDVE4LT+PdnpW
         f1+g==
X-Gm-Message-State: AOAM530HfEEQYt55A2og9wXlT0BQPMjHSgur3U2uBhF7d8guIazI1o+k
	tuKWF8VTkbkhppo4YUF9x89h6TqsbrEq2U+4H/szHOrt
X-Google-Smtp-Source: ABdhPJyg+ZLsFEMn4YKZQIGAM4gNsSD24gIeZvsuq9F+1zA0aKU9tg0AxMmILZyBdUSEqXkHWTobmd3jnYwL0+Xng5I=
X-Received: by 2002:a17:906:4a53:: with SMTP id a19mr5876763ejv.56.1601410304552;
 Tue, 29 Sep 2020 13:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200316160634.3386-1-philmd@redhat.com> <20200316160634.3386-18-philmd@redhat.com>
 <CAFEAcA-Rt__Du0TqqVFov4mNoBvC9hTt7t7e-3G45Eck4z94tQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-Rt__Du0TqqVFov4mNoBvC9hTt7t7e-3G45Eck4z94tQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Sep 2020 21:11:33 +0100
Message-ID: <CAFEAcA-u53dVdv8EJdeeOWxw+SfPJueTq7M6g0vBF5XM2Go4zw@mail.gmail.com>
Subject: Re: [PATCH v3 17/19] hw/arm: Automatically select the 'virt' machine
 on KVM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: s+pLq0P2eKS9

On Tue, 29 Sep 2020 at 21:06, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Mon, 16 Mar 2020 at 16:08, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
> >
> > When building a KVM-only QEMU, the 'virt' machine is a good
> > default :)
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >  hw/arm/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > index d0903d8544..8e801cd15f 100644
> > --- a/hw/arm/Kconfig
> > +++ b/hw/arm/Kconfig
> > @@ -1,5 +1,6 @@
> >  config ARM_VIRT
> >      bool
> > +    default y if KVM
> >      imply PCI_DEVICES
> >      imply TEST_DEVICES
> >      imply VFIO_AMD_XGBE
>
> What does this actually do ? Why should the choice of
> accelerator affect what boards we pull in by default?

Put another way, our current default is "build everything",
so "default y if ..." on a board is a no-op...

-- PMM

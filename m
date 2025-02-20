Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1927826njb;
        Thu, 20 Feb 2025 03:05:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVpEAAt/xgc2t7Ono4BG1kB5dRX/ALvtOUsMcbTdJ7yPsmMg8L8vmx+3ywDTFKg2pLfVIIED6DirgIdsg==@linaro.org
X-Received: by 2002:a05:690c:690e:b0:6f7:53d2:d733 with SMTP id 00721157ae682-6fba53cc2b3mr66601117b3.0.1740049507104;
        Thu, 20 Feb 2025 03:05:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740049507; cv=none;
        d=google.com; s=arc-20240605;
        b=NBHeNitsadJ+DxU8y7u8ydOJF4i7ODxWjI2xaTfRofy48+zPTDAHNtWamCmDo9KaGp
         ap3rVfCHnGTNxS5PPkMUOptE1GTFgjV65YigW25bi1g1L0tfzECTe4KMbfZ0SM3iLjXw
         POS4Y021ekvjzHuTJgFUPg0M2R8SyihSOi+u8jlzXOW3ZohHms6ASlI0thAcNTonK4oR
         imOk4tBfAjt11n2VULoj0XyohGWL5CR2hk3rDp7h3jK0LJH2/rqhi5Aul09CIERFDfB+
         obBJOgX6UWNI+K6IX714/E8VCAd3b43SaWI59atHghTQGVfGuECDYh+qMdOnFSyH3F1h
         tuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EYdJeJG+A3qoQT6NxoCYcF2tRFQaYTlQIoqqfDLP8NA=;
        fh=/sYDYfKb4MS7Ep+tysVTWNs3citqrJ+qLJLB22j6myg=;
        b=Ex11Gx0Td5yehTZg/w+M/JK2owQYgZtKDBLHMcYJ/M5ACEJXVL4qnlcWgIxzqWpGAy
         hwiDoxCRl2Ymz6V6vT7JsBWgV+ItcppXEoqaLUaLZSNPfdDSlKU+kSg04NOAwnMGBPlE
         fslRPod9sfNpKQVVNOJK560ofLlCrhJzLTpxU0NgfNqVrQGNu4LqplnZuI8E+v9YJdPg
         u3zpZ0q/TcGSg7VRXOFlTcxIOsclR96ys/dUeR2g8z/DhI+L1md8fh+sYn2W3Ni1+ygA
         dmu/24tbRGhdMx+fg1uZmHNBCGmMSGP9gf9h4dTBnupkqczlVoyNUx4VYmk0FrJKGLd9
         LaDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J3e8QjXE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fba63c9047sor27005837b3.6.2025.02.20.03.05.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 03:05:07 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J3e8QjXE;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740049507; x=1740654307; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYdJeJG+A3qoQT6NxoCYcF2tRFQaYTlQIoqqfDLP8NA=;
        b=J3e8QjXEP3Y4ovO+joWwZfSr4Sj8D9l5ajwOVyZTQoQj9PkdcN3TvgItHAyqq4Q+ST
         JMXPooIX+lK1QQqJ8VPbeOSmBeXBwDwVK5t3YMSvH9u5HX6d0KjOObP6sS0ZOakQ/GPs
         kVDW/rWh+8c5Uqt7670jh7499EDgIUK23srHLx1VsumZttmH13mDRREIWC93RV8nQfYP
         ZJiE/K1pSjXel4hXDn+48S4hSklonCgQy+JLQ+Yjj86+9JP62MSs/3ms4sym+kn0FyVo
         ogpWlyKU4xz+zW/YWpSoHstr1O42Rr/Wa6MX6sDWhltso3mr3xUrWsHjaY4xaTtwv4Pr
         31ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740049507; x=1740654307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYdJeJG+A3qoQT6NxoCYcF2tRFQaYTlQIoqqfDLP8NA=;
        b=cemLBK2YJh9WcPyLDJRg9DsTn8fMcQ8MSeqFSD1KGks+CETDgAabpAe3tH0Pthsi6V
         9g+8TusF/whhzK/t7S7zHG+51uOe+2QTve+pGNCcesCtf3UU0W9yHRCelVjqofRBnxaM
         v7aIBIE2vDElDfNPSWiVRt8yVgJjE+XrhOsFkKkaHO7WdI3ciRLhQKbxwEFsvOj/73WJ
         7FqWOIDLXANhczT28cZnwqnZyYsUBEPQHVROJ+wJ3EYTjrDQayP5YTA2R09o24spyG5Z
         p92NREdlnnbeeaqggFndulGZ34mpQm3aSgvl1hW/ho6UjI2rq/gYxikweCyEwo0IS9PT
         p6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWNxdwQAkcWu0kEASSDbg+OnCaKzSajXrQ8nBR5N+bH5DxpvJnxPPu2WNowLM2W8+ss2Q46ED4bNYowsA==@linaro.org
X-Gm-Message-State: AOJu0Yy6WXJ2ujGeD4uiGOR/jucn80TVPB1PMjsEP1QZ0VSC0dEFLgY7
	9PB6RAWtFg5zXCVRUrMYpXODrz/NJvBoi7yo0TXV3Q8zEHTIn6GfPiWcWb78NamzWkBP2h61zSL
	v1QtAUc8CmJ410203LDFFPa+SBz7oBqm8kzXdIokf
X-Gm-Gg: ASbGncsbXvnmjt0/j1MumIPXWF2YUSwC/FuUcuBBqlvYZqI2LuNsqvpuC/QtfyrolcD
	HNOxGPPC4jCFifteQ6NHxuZMjwQU94TlXhRs+Pl853KKc0dBj5rPoF94fZ9buRNygqGUMvzcBTw
	==
X-Google-Smtp-Source: AGHT+IFRzFNTI4lNM501OJddrzMjnncdSjAsLfOYPFOf/JjbCQEA+JtQEZ6y8dy2c6OSiCpu06tZZHXUV6XuVwY0x3o=
X-Received: by 2002:a05:690c:9c09:b0:6ef:4cb2:8b4c with SMTP id
 00721157ae682-6fba579e7b8mr68444527b3.23.1740049506700; Thu, 20 Feb 2025
 03:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <CAFEAcA8PYv3-JX66THwj-mDM0es6V5gVVWJsHTqkd9wTEVor4A@mail.gmail.com>
 <CAFEAcA-ioFgThGJ70cyhe7rA0kbnDULsr-BuAqE+3b3TE0BGwg@mail.gmail.com>
 <CAFEAcA-fZakXqgDV72fE5sFJv7ah=bvoXYpGqXZZzGutxt7r+A@mail.gmail.com> <CAFEAcA-UP5VcDokb11KfpmQztRnWFS9pLcMZ5_2pe=BBKEv7Fg@mail.gmail.com>
In-Reply-To: <CAFEAcA-UP5VcDokb11KfpmQztRnWFS9pLcMZ5_2pe=BBKEv7Fg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2025 11:04:55 +0000
X-Gm-Features: AWEUYZmnHuUcS6GYlyYoxVfkOnMcx_1hdfv7x-M395WG2X8YB9mIfJWWyZIJKxc
Message-ID: <CAFEAcA_PUcnpwti4m1MgGbcVBFFHv1DSvNrzchkqTW5TVMU2pw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] hw/char/pl011: Implement TX (async) FIFO to avoid
 blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: C6z0aLn0L/yV

On Thu, 20 Feb 2025 at 10:52, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Thu, 20 Feb 2025 at 10:43, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> >
> > On Tue, 18 Feb 2025 at 13:54, Peter Maydell <peter.maydell@linaro.org> =
wrote:
> > >
> > > On Mon, 17 Feb 2025 at 14:55, Peter Maydell <peter.maydell@linaro.org=
> wrote:
> > > >
> > > > On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@li=
naro.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > This series add support for (async) FIFO on the transmit path
> > > > > of the PL011 UART.
> > > > >
> > > >
> > > > Applied to target-arm.next, thanks (with a couple of minor
> > > > tweaks to two of the patches).
> > >
> > > Unfortunately I seem to get failures in 'make check-functional'
> > > with the last patch of this series applied.
> >
> > I had a look at this this morning because I wondered if it
> > was a mistake in the style fixups I'd applied to the patches
> > on my end, and I found the bug fairly quickly. The problem is
> > that pl011_xmit() doesn't update the TXFE and TXFF FIFO empty/full
> > status flag bits when it removes characters from the FIFO.
> > So the guest kernel spins forever because TXFF is never unset.
> >
> > The following patch fixes this for me (and also makes us not
> > set INT_TX for the case where we couldn't send any bytes to
> > the chardev, which I noticed reading the code rather than
> > because it had any visible bad effects):
>
> Hmm, but that's clearly not the only problem -- it fixed the
> "no output at all issue", but now I see a test failure because
> of garbled console output:

> I also noticed that pl011_write_txdata() doesn't clear TXFE
> when it puts a byte into the fifo -- I'm testing to see if
> fixing that helps.

Yes, with this patch also:

--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -330,6 +330,7 @@ static void pl011_write_txdata(PL011State *s, uint8_t d=
ata)
     if (pl011_is_tx_fifo_full(s)) {
         s->flags |=3D PL011_FLAG_TXFF;
     }
+    s->flags &=3D ~PL011_FLAG_TXFE;

     pl011_xmit(NULL, G_IO_OUT, s);
 }

this remaining failure is fixed and I get a clean pass (other than
the gpu test failure, but that's not related to the pl011).

-- PMM

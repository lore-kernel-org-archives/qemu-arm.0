Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2588239lfk;
        Fri, 4 Feb 2022 06:03:34 -0800 (PST)
X-Received: by 2002:a5d:5888:: with SMTP id n8mr2681426wrf.224.1643983414597;
        Fri, 04 Feb 2022 06:03:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643983414; cv=none;
        d=google.com; s=arc-20160816;
        b=t6ZByeSdyqHYrlZ/FW7+R6jXJa9TdNiSoCJFURZczX9dxOoFuRj4JnRj/+jNTkIupk
         NssqC4zyVH8QJYw/TzoYwKETOwhVWRsRi8NoD5l+2HkifIdrHIGQ2Wmiw1bPycn9C7dt
         TaemcjV+xc1TD6Mt6KklGnhXH8c1ZbbEawO0L6wUN+HM+dfeJ0ECpHjADVJWdFzxJ/Ca
         tgg/ORBg9DZUz3bK9NxGju96bEAODy+E68vzrYEdA7pCGyJ/VCXU/V4fzPv2q8kUVHYQ
         cPtaK7Ddw8yECNGagGkxRAVnH6Rsc2r3gL/1WhXaRz/FOlY1llEtJAeyvG+MKj+7aFAK
         FY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yf0NU0innF4Y8QrLwFBIEAlblHbbWNvvstCMX0rUJPo=;
        b=l7+HZKZKSSqgd4My5PsIoL41sjAaU//0BoxPo4ge7Jkw2O4fhedp4v+elP2lr3rEeQ
         bewilhWsCcBRdCafuW/oDB7bW5ToH0yt1zGrFxv1rngjvYhtRLX2MhZx+M6v7KbtIehE
         dZIVWvXcV0MntZ9hSHbAey62jmGmAAJnMO+HyYZ1tFzYDtPgj6KsgzIebg05jtNOuvaM
         qWeuEdOJeU0uWiF7v7bFk2E6oDnD+kpORQ0RH1Y6EG3ykWhE6oZrjGByPc1jwcsWEMqD
         x84sznldYDZAf8Z/oFT8D8TS2OfQ0BpE3PgS7wFbqZnYFjDubdKsQgKgukwRTVEx1LJ2
         SJzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ot6WHHPf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bk7sor433166wrb.44.2022.02.04.06.03.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Feb 2022 06:03:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ot6WHHPf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yf0NU0innF4Y8QrLwFBIEAlblHbbWNvvstCMX0rUJPo=;
        b=Ot6WHHPfvKXQrTkan2EJKJ6GmLgW3CbPSabmkaUxg4jylfxK3lGrnKZOJALg2127Mi
         cbNBIloJA4Pp9hP/YRjJwQy2L9UB6hkQcCIxTXOrDfHUFlQh8r/HoWuIMBmS2UrhKGcN
         mW66IBkaHF/Cxzp/wwdEt42uo/ZXicbVlWf3/M/gbJK6Av8KiCstEhE0Vg4y3fzFSnDU
         j6FNJ+F/bcxca7sMz+7Q4UgF9UxOkBu0kFprhL/q12MtFXuoILtJIZOzQzWD10uxc/S/
         cm9sAir31X8y7zXRSqZ2T5tijIcvZJVMo/WTL8J8NlAyShYn2kdilOlXNKektwAL/JP8
         MBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yf0NU0innF4Y8QrLwFBIEAlblHbbWNvvstCMX0rUJPo=;
        b=xfAq2sgi852vBmQtn6q1ZOMne9R4jtwU2ITXwkex6VNdccjzno2jKCGbCRkxTFF/ZW
         rZZSpHc8wvQXOV3/1vhaqRwLfm9SEHvzWbGTsc0SBBLGlvi4n+jL7q7PpkgWwyK2bsB/
         r0xRTS5IPZVz9Q5zN4UokeGbZPjGGgFlFb264BbwANiQTPcHhXggcWZZUMuKFZ8r8VCE
         NgdlKij5Lo1FFVZkmgs1OWp7xd48ecLq12YUdwp3RUVeifCF/LTYY0SdGiLNZCOsglC5
         Z4jLkYaZcmc3BZqy448Ha3pPP+MnuBn6nKTDkasOYpzXPWkcN34MWhlDrsEQ/lppLz/0
         IJHQ==
X-Gm-Message-State: AOAM531i/63WWo8JS+RzZfWNqwzie/t5PzgXes51M6WLFysxPlX48N/1
	GVt4J/mlbIX0whmws+NOkLUY/JwR1ea0gp+OU7VYOOkoD4NKkA==
X-Google-Smtp-Source: ABdhPJyYWfME5/uKQnjDk4/HmEy0DFNiggSDZKXlb/2t/AtFUPcv7PrRGfebQMb2zsbesjYa5sRKaaK18lKWCydNdpE=
X-Received: by 2002:a5d:448b:: with SMTP id j11mr2711681wrq.172.1643983414289;
 Fri, 04 Feb 2022 06:03:34 -0800 (PST)
MIME-Version: 1.0
References: <20220203155304.2648009-1-valentinghita@google.com>
 <87tudfsv80.fsf@linaro.org> <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
 <87czk3rnfl.fsf@linaro.org> <CAFEAcA9y1F5X1BQOwzbJgJKPYvroHFM7ivSUOE-07d3S-GE7DA@mail.gmail.com>
 <878ruqst2a.fsf@linaro.org>
In-Reply-To: <878ruqst2a.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 14:03:23 +0000
Message-ID: <CAFEAcA-Ypai8S1JG_HpG-4PugMGxc+ReGj-QRhW7ip7LkfcBgg@mail.gmail.com>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Valentin Ghita <valentinghita@google.com>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7y55DIjkKrKS

On Fri, 4 Feb 2022 at 12:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 4 Feb 2022 at 09:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >> Assuming you are happy for the device to act as though a external
> >> debugger is attached regardless of the gdbstub state you could use a C=
PU
> >> property on the command line to enable this behaviour. We have some
> >> examples for SVE for the 64 bit CPUs (see object_property_add for
> >> sve-max-vq). So something like:
> >>
> >>   -cpu cortex-m3,dhscr=3Dtrue
> >>
> >> You would probably want to model the behaviour of DHSCR.C_HALT as well
> >> because that is something the core might do to itself if it detects it
> >> is running under debug.
> >
> > This is sounding pretty hacky to me. I think we should either have
> > a proper implementation of all of halting debug (probably opt-in,
> > with the default being that the gdbstub is transparent to the guest),
>
> So we could flip it and make it a property of gdbstub with transparency
> being the default. Then any architecture that wanted to have this
> behaviour could query the stub if enabled.

I don't particularly mind how we expose it to the user. But I
do think that we should either not implement this architectural
feature at all or we should implement it properly. "Just this
one tiny part that happens to be the bit this one user wanted"
isn't a long-term sensible place to land IMHO.

> > or we should just say that no, this isn't something we support,
> > and if you want gdb to get control when a particular bit of code
> > is executed then you should set a breakpoint there.
>
> It's a fairly niche use case but I don't see why we shouldn't assuming
> someone is willing to write the code. However I suspect there is quite a
> wide range of potential behaviours to model.
>
> > We don't even implement the guest-visible debug parts of the
> > architecture (eg architected single-step) yet, incidentally.
>
> Is this just for Aarch32? Because for Aarch64 as far as I'm aware the
> v8.0 debug works fine modulo bugs which I sent a fix for:

This is M-profile specifically. It has guest-controllable
single-step but the mechanism is (as usual with M-profile)
completely different from the A-profile equivalent.

-- PMM

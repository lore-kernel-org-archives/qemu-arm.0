Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3323355wru;
        Fri, 5 Jul 2019 09:07:59 -0700 (PDT)
X-Received: by 2002:a9d:6204:: with SMTP id g4mr3522150otj.40.1562342879793;
        Fri, 05 Jul 2019 09:07:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562342879; cv=none;
        d=google.com; s=arc-20160816;
        b=Wuh8cpY1B9fNzSzzRR7RnuRaa16sU8y6cyPkIR2Z1ysJ/8ayMz9wQ8T0kfuTLRuaBp
         xRN6+mHZQIRyP385Fd0hgmSlybKJ6LRqUgUBrrMyQ0pAvrD8nev/zGq02dvqqh5XN++/
         O9L+PYaKg8QggBpQAe8zl8xgEaq2KZ+cDBrp6Qw8gqf+wa+NKW4s7g9ePB4U/iAJkk/5
         BMbnIXEoeo9/zRYg+7+RRvcU3/3OSkkBExLEpG3PY49kkWOukgH/PQLE1uIxAblGqfwj
         s7W0LKHx8/wlhq2PpWsvwxlpugQXQAlTBLetkCh6tMxvDBC/Qn8uUVaBMb7JQRDq7phy
         MIqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s00Q9ijUuQV3ApsG7jwaXKYx1gaJ8io9p2etVndcIxo=;
        b=h9+gAaeBOMruoFn1NqNY9DqSSX4LVk8rIS7+84Yg9zpKQAkYNhirtPYBavtj8D9A3c
         U+fizlX6QbN6Ra0YSdy91EAk+CRta7oTgnDbLu/rGem1jega0FjBgzx94Hvo6oGl0d1N
         RMbuERkMlEbiqoMmsQDB4A+XRXo5wzaRVz3/MzKNKOaaDeFq5rMn1KQmsHe43UqwNakr
         tNpfdcZdijnDEZoiST6Toj+rAwbofFPZXCuGOVfbzE00K6oyedcFJ9uzF8dB5lJuQNBK
         BuY3L8izMhbJS1VVFgS3ehgfIhKwTSDJ+AXx4dSAFSWpJ1nlpsaG9KdtQFEpB8F29xcb
         6qVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z5NovQHu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l201sor3941213oih.75.2019.07.05.09.07.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2019 09:07:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=z5NovQHu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=s00Q9ijUuQV3ApsG7jwaXKYx1gaJ8io9p2etVndcIxo=;
        b=z5NovQHuJL2vVRXUAzlLajOmEHYkgDpL9n43EVJ5IAwCkb7LHwcfucK8r6Ga5xpwXK
         baN7srn9rk2Z3g8QNPw/GHkrwn5kYaoHXEWVviHJfo1SO4WCVaVUMrc4paivQBvankQ+
         SCdEZDiOmNb6uKPB2Qey+6fwri6VAMFA5kKR6EFi0baf4FQ+KOS5r/EI2CInQQKNkuWv
         4J3fhckQdmeFOaApusHtAGF87SE5zYa/eEDPZQhpS9+g/iwnL2dJqCRCGrSE4SO/6bd4
         5mzJzRRjJhor91xNcIrNMwKh9C2Ytl5ClGsh0i++Jjr/brfe8jBNfbox+5M0VhPOzJ+M
         KxqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=s00Q9ijUuQV3ApsG7jwaXKYx1gaJ8io9p2etVndcIxo=;
        b=TEY0SzTI9Adz8Ua9l9IdQi9YVieF+RWRW68d2bfH1LvjCQDe+iNzgX6cRgUKx6q1hD
         dvr30GeSis+Hl6bQs1flevAyp7YimBcqxK624Wux4wSTfRv3IV4x8fJQMIPOBvMa4SIQ
         LypGHR7UibQRfIkHtdsCUXJS+QEtBhTvOriCG7xonm4XP8W4E27i3Ji13UwRA6jFc1qI
         3DC2nidV9K+7ZCtFZJpAZtuz1HY+3ZCFGEx2e8bFN6ZOo9FKYpTcSsxKIHMDha12dhP+
         UZXGqLK7frTp3xUdZp6gNUy1ig03fxAws8tLBZPxOLUuPJDhD/mLzZgwLywDb/QGJ3gd
         7tCg==
X-Gm-Message-State: APjAAAXggsjI0/eF374A2vpggsTPKPsvYiulOJeohMrJWA194jGS0TOL
	x440EGCeuHGdXIqrAbmf9CyJWrvKYCqAtB8a11/aMFq/G324Bw==
X-Google-Smtp-Source: APXvYqxw/Ogyu1Pq875Wtl5x9p/fR6UUM1re3fnWso0ai1dVNCHUqoWIVVjIM0vcFbhC1b5MWICin5Ql3eXxKZLrCv0=
X-Received: by 2002:aca:6185:: with SMTP id v127mr2530668oib.163.1562342879203;
 Fri, 05 Jul 2019 09:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190703102208.10086-1-alex.bennee@linaro.org>
 <CAFEAcA-rT3B-1GvFY55Ete1cm8f+38AGFyzDcJxQsqM1c=D4sQ@mail.gmail.com> <87sgrkv5k3.fsf@zen.linaroharston>
In-Reply-To: <87sgrkv5k3.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Jul 2019 17:07:48 +0100
Message-ID: <CAFEAcA99=Kf7GoHaNfGu7qmyYUrxA7kK1p2jianj-4OTxFebvA@mail.gmail.com>
Subject: Re: [RFC PATCH for semihosting-tests] semihosting tests: add v7m tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: r4NKgSoA46bn

On Fri, 5 Jul 2019 at 16:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 3 Jul 2019 at 11:22, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >> diff --git a/microbit.lds b/microbit.lds
> >> new file mode 100644
> >> index 0000000..24840a3
> >> --- /dev/null
> >> +++ b/microbit.lds
> >> @@ -0,0 +1,32 @@
> >> +/*
> >> + * microbit.lds : simple linker script for baremetal ARM-M test cases
> >> + *
> >> + * Copyright (C) 2019 Linaro Limited. All rights reserved.
> >> + *
> >> + * Memory layout is for the BBC Microbit board which puts RAM at 0x20=
000000
> >> + */
> >
> > I know this is just copied from the baremetal.lds, but we
> > really should have a license statement in every source file
> > (and I should fix the ones which don't have a license at the moment).
> >
> >> +
> >> +RAMSTART =3D 0x20000000;
> >> +STACKTOP =3D 0x20004000;
> >
> > That puts stacktop really close to the start of the heap --
> > isn't there more space to give ourselves some safety margin?
>
> We could - do we actually use any heap in this - I thought it was all
> static .data?

By 'heap' here I mean everything that goes after RAMSTART,
which is the whole of the .text, .data and .bss sections.
Mostly I just think we should give ourselves a reasonable
amount of elbow room so we don't find out the hard way
that we've expanded the code/data to the point where it
runs into the stack...

> >
> >> +
> >> +ENTRY(exc_reset_thumb)
> >> +
> >> +SECTIONS
> >> +{
> >> +    . =3D 0x0;
> >> +    .text : {
> >> +        *(.text)
> >> +    }
> >> +    .data : {
> >> +        *(.data)
> >> +    }
> >> +    .rodata : {
> >> +        *(.rodata)
> >> +    }
> >> +    .bss : {
> >> +        *(.bss)
> >> +    }
>
> I wonder if there are runes for setting STACKTOP as end of .bss +
> something? I guess it would help if we could tell the linker what the
> top of microbit memory was.

In the baremetal.lds and baremetal-a64.lds files I use
". =3D RAMSTART;" and ". =3D STACKTOP;" lines, which means that
the linker will detect whether we've put too much stuff
in and run past STACKTOP. Your file here seems to be missing those...

(Also, why do you need a .rodata here when the other lds files don't?)

> >> +exc_reset:
> >> +.equ exc_reset_thumb, exc_reset + 1
> >> +.global exc_reset_thumb
> >
> > There must be a better way than this to declare an asm label
> > for a thumb entrypoint...
>
> That may not be needed any more - I'll drop it and see.

You do definitely need the vector table entry to have
the low bit set. I just suspect there's a way to say
"this label is a code entry point for Thumb mode" which
avoids the need for the manual addition.

thanks
-- PMM

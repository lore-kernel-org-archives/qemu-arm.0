Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2366620ejb;
        Mon, 20 Nov 2023 09:54:20 -0800 (PST)
X-Received: by 2002:a05:6512:244:b0:507:c7cc:12c4 with SMTP id b4-20020a056512024400b00507c7cc12c4mr6194809lfo.57.1700502859874;
        Mon, 20 Nov 2023 09:54:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700502859; cv=none;
        d=google.com; s=arc-20160816;
        b=kvcOYFXUJiHfo6Fd0URPLUaA+ChqPQKeWjMxMxmZrmq+zCzEjo/HAP/rz4YeHiSlhD
         q/m7p7eUUBNSPnZb+L27ySSUkejWr2FW9qgGv8n/VWDb9otjhMyWDboelLpMTzYRHtQL
         XUd2BO1q840LBuMXJ1rgdXsh/jIVL6PTCVszOAxIeSTbB8k3fnUmRP1I+jUCQI+AmioX
         Dick8cSvGKvyaTe/JoY/zyBwY5l2W8uuZj5cf8/24j1FNK5aB3YjMP6BcIkbM/t9Y0lx
         2OyEi/i19b7SgyXhTf6dVp0ir+dr1qaAnhw+hMDdehBPOROvK0mV8X+FJPj432woJAvs
         YF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eFbN8k47NjWd0k7i1IsxGVW2Va/kCQb/lJGRrI1QVjU=;
        fh=eFoGCzWREPbUj1o/RWEiQy4n33JVwuOTwzDTpVTNpsY=;
        b=k/VufyjzQVDgWb/0YUAarx3m8KbhNGQBStdDWpeXSAKhGrJpZ8In0fnX1O49nJ8nZ/
         GnpKqnLDk3wRKsij+a3B9yzrl3/C1T47tDPziLZDhr2LBk8wKkBFPlxtT1j0ZZguDJWk
         yHzWW5N3+gNU35HVArAWG/TqHBMkKbVjdLjl8OiHolRes7F0zJU5OWRjf1tqt8DUXP7K
         dmprzhu1LHLiQ6EEoNhFwYWLPSxjpnW91HdMxVs53LKzeamdCBHGka/4n+0c6cnp9N6y
         A3CXmjwDczGcofY6rWv/QdC489GVH3mJ3WJ2qm41QYBO619X6jvTxKJDpT+X4JmTWbK4
         wJ/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cFwhWBuL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z23-20020a195e57000000b00502fe29fbd6sor1823181lfi.26.2023.11.20.09.54.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Nov 2023 09:54:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cFwhWBuL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700502859; x=1701107659; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFbN8k47NjWd0k7i1IsxGVW2Va/kCQb/lJGRrI1QVjU=;
        b=cFwhWBuL3t9x5TtdhlRmOrUS7PmWxKnVbR5uf5IYFeL4g83GpxO7IKyP8FSzUfSke0
         caart1N3aKYGyxjt7jhAqm8T+mbLxjkK4Q/AGzz6uP0uuRZV/Toi0K9huTGCGQYTy1D0
         3Tc7BzMjpgsofZ3qy42ELvnZ5w5yCnv125j6e7rQnH8cZ6VoIILhO2w3zQ+ydyx5diW8
         L7XR/x316swGGOe44A9roQFp4dpFN1+cwI3ULIhPhbHMtTJlMrnVew94YQqIHCgwPHQ6
         5kcHroJK6poTzOWcbdFnqhSe46v6JmZ4bBsJg6N4/h/r10qqwhWlmGOtedkccKNjyFIi
         FiOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700502859; x=1701107659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFbN8k47NjWd0k7i1IsxGVW2Va/kCQb/lJGRrI1QVjU=;
        b=ejdit7flaE/rgcYMyrF0TiYdijw9IF0ZMV5m0ofBkcfxnHncZJ34a7FWbvP/Qmw3W/
         NBQoHl+E5298rZzLRp31f04cfgIaBh+08wLt7vEeUFx/GTqdFhMlYTBC0/A3LMd+4v1t
         7LkRRcTrE1eaqTTSpitLk3DDkmdzPNU7RNohLy9QGe7muYg6s+JeN/2Dj13fZgLpqdWr
         koRYSWTnNwZ8Uz88846S3aEdiCWJvjWCffQEEFOTnYqM5kaoImTCPHlXS02wgbMLGWjd
         NPQaD5t4OsQrdPsIbWr3ptjQjkvn0H/W9WmIHYjTIrAIBCYeC8TVjZ0W2KI5uO5DVrqY
         Zcrg==
X-Gm-Message-State: AOJu0Yz5yA+5fvz6qB7iYWpnDGret4AJG1nSaEnEJLr1z77NUPKuMqEr
	TL5NFvkdHHujP7x3PqdyBBkRJvu321qN7gz/9C6ODg0Y
X-Google-Smtp-Source: AGHT+IGLBAtBifGXTuJ7eT3GbWNZPACQTdmciKbJQmLQIc5qKaOinPuXTEb2suCkW4h1Iawy7TrnolKqydN3SKp2gnY=
X-Received: by 2002:ac2:515b:0:b0:507:a33f:135d with SMTP id
 q27-20020ac2515b000000b00507a33f135dmr6022321lfd.4.1700502859320; Mon, 20 Nov
 2023 09:54:19 -0800 (PST)
MIME-Version: 1.0
References: <20231120173506.3729884-1-peter.maydell@linaro.org> <bd03b433-da83-4ea2-bba8-57a1eaaa5d79@linaro.org>
In-Reply-To: <bd03b433-da83-4ea2-bba8-57a1eaaa5d79@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2023 17:54:08 +0000
Message-ID: <CAFEAcA-kaKKrKLgSq_3wBpsjorUequ=ZMZ7hC58E0F6TK5vVaA@mail.gmail.com>
Subject: Re: [PATCH for-8.2] target/arm: Handle overflow in calculation of
 next timer tick
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: J6AVjjev/QJQ

On Mon, 20 Nov 2023 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/20/23 09:35, Peter Maydell wrote:
> > In commit edac4d8a168 back in 2015 when we added support for
> > the virtual timer offset CNTVOFF_EL2, we didn't correctly update
> > the timer-recalculation code that figures out when the timer
> > interrupt is next going to change state. We got it wrong in
> > two ways:
> >   * for the 0->1 transition, we didn't notice that gt->cval + offset
> >     can overflow a uint64_t
> >   * for the 1->0 transition, we didn't notice that the transition
> >     might now happen before the count rolls over, if offset > count
> >
> > In the former case, we end up trying to set the next interrupt
> > for a time in the past, which results in QEMU hanging as the
> > timer fires continuously.
> >
> > In the latter case, we would fail to update the interrupt
> > status when we are supposed to.
> >
> > Fix the calculations in both cases.
> >
> > The test case is Alex Benn=C3=A9e's from the bug report, and tests
> > the 0->1 transition overflow case.
> >
> > Fixes: edac4d8a168 ("target-arm: Add CNTVOFF_EL2")
> > Cc: qemu-stable@nongnu.org
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/60
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > Thanks to Leonid for his recent patch which prodded me
> > into looking at this again. I preferred to fix both halves
> > of the if(), rather than just one, and I have thrown in
> > Alex's test case since it was conveniently to hand.
> > ---
> >   target/arm/helper.c                       | 25 ++++++++++--
> >   tests/tcg/aarch64/system/vtimer.c         | 48 ++++++++++++++++++++++=
+
> >   tests/tcg/aarch64/Makefile.softmmu-target |  7 +++-
> >   3 files changed, 75 insertions(+), 5 deletions(-)
> >   create mode 100644 tests/tcg/aarch64/system/vtimer.c
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index ff1970981ee..0430ae55edf 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -2646,11 +2646,28 @@ static void gt_recalc_timer(ARMCPU *cpu, int ti=
meridx)
> >           gt->ctl =3D deposit32(gt->ctl, 2, 1, istatus);
> >
> >           if (istatus) {
> > -            /* Next transition is when count rolls back over to zero *=
/
> > -            nexttick =3D UINT64_MAX;
> > +            /*
> > +             * Next transition is when (count - offset) rolls back ove=
r to 0.
> > +             * If offset > count then this is when count =3D=3D offset=
;
> > +             * if offset <=3D count then this is when count =3D=3D off=
set + UINT64_MAX
>
> Is it really UINT64_MAX or 2**64, i.e. UINT64_MAX + 1?

Yes, it should be the latter, though as you say it doesn't
affect the code.

thanks
-- PMM

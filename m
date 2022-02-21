Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2882800lfq;
        Mon, 21 Feb 2022 09:18:35 -0800 (PST)
X-Received: by 2002:a25:e911:0:b0:61e:128c:bf0d with SMTP id n17-20020a25e911000000b0061e128cbf0dmr19321079ybd.257.1645463914947;
        Mon, 21 Feb 2022 09:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645463914; cv=none;
        d=google.com; s=arc-20160816;
        b=bkUWMG81wyfBqO0pp6jL744kcn9ZCU8E15efS5s6p9YxUEWLS6cZBV7j33xybi5gev
         2aD7hoBxPJR/GvpnJJwOaqS5mL9OMj9rQwRT/Dr2kKAvAgGu5kkrvtXspdFtcS4KEEux
         Z2n5n9uPv4/js3vQfaPVCJN7vFQs57iwU8d/Rg28Erfkj7dOtyCJppITtT40O+vQi9HZ
         qK56XRwMY4NbloJPxyWKdVHWcNMLUu14aDg8BTUHtf1Rn2btBuotnYYqQ7R+f7sbH6/K
         I0NIRBcr/Abp7QHtki9zM5vhRNxeKZWyuh0Bo9DFy2r8b4DS9RM8hBecLVHiep8wiKNb
         W9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q01uazB+ysAQ4pfGo7MFrIPK58QOU1I4Lm5evUYp4GA=;
        b=kff6hUlw8/M/FUFDz0rWU7ar2ooWdnEMILtK7T7bLs1ydzavJyjxZuGCy3nCHTVUPr
         vNqcXRbuzxfYlkizvABh7DDssdJMVr4vXD+dItRV2AYDj5ZUUTHLBUfWPFZdb7n9O4u5
         YRkdda/orN9v8CdZv5msW25A4Jo7n3Zbu7IcISFMgn8xNgj7NCxaXw3uiZSfKJVSXbZJ
         +6ndZcBnIxh9jOUZYfguLcVUf0IuGvY/m+gBuZFWHYm4E+S1O9uSRczpeh4mwRAs17Pw
         sTS3KnOa/r8zFM0nbPUxF4+z0kmqGigj3YH1ebutnmB15jObaJ2LuV97LVyHSwFjH2HW
         EZ3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJ2zBEZl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o11sor182778ybk.161.2022.02.21.09.18.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Feb 2022 09:18:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJ2zBEZl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q01uazB+ysAQ4pfGo7MFrIPK58QOU1I4Lm5evUYp4GA=;
        b=MJ2zBEZlEs4Y0rzG4cHgdW/q6DFQo0Z9sfg7kxQdlslfTdOdYel16wz4qYzrop2GPI
         nA7iv+gR2ruKVt/vGi+tFFaAgxrWfuBEmDSzrGU1stXfT1FHKpDja7FLMgLF/yiXiaxW
         gEyGthK87DozbP5XSIeGhSIpFyuUkWdOFZmjG1xFnmyuZZIz36rpcQeemVy7C0pZchok
         v0a8UF+JXHvc0h6TDwYfTX9WqjiXoF/ZH8uCQPlVCt3sZYYbilFHQoyYuv0QNAk+oVvt
         LcrxNaLhb0RqL47vp4MLDagAmKNsWHmkUXahg0kJtHB/JykkxhR8Lly5UwJAkk1Ul72F
         /ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q01uazB+ysAQ4pfGo7MFrIPK58QOU1I4Lm5evUYp4GA=;
        b=412I7PD0qQeet7LfJzD/X/5aMR1JnKYLoHuC/HxEab4dGNlEx6OAY4bLtsPeX2qY/D
         Ok2llAxfRK6/VAWq4DSS4tnkA5g4QrJJbowSB8EPD6foEeT9FPT7J8ZTtvSTjWy0HFdE
         rcgkKLt8k35Bjzl6o2r4SP30ob2+OEs0OUp26iIjL02U5LLeXzmWBYH2KJmxZZjMHG02
         WWQlZ27ABNRVbAT+flBbEs/i11icI6AbbiZMJC+4/u2WhkrYmQIV1Ht4W3no67axlaO2
         SzjfNttZCDw/b2kn+cIG7MsTb2BUFaEZ6sT9rf4Dblky539GmumpqIttkyXu9Mdb9BEv
         2Zsw==
X-Gm-Message-State: AOAM533damyQAkXPk7b88wz+83vtgrsuz1aJ3XpFsVA9SCjoemhSf2jm
	9eS5pMiJgpabZgJpCl0cDTJ7ITiv/xWvmUY+M0feE7v51JJXqA==
X-Google-Smtp-Source: ABdhPJzNoj0+rUqFwF28PZCRU+CfiU6RFtbeJ8SY/zr4vicQMUxclaN2HKgxeTp3N/1JNdrXfrJYyx2jLvON9Q9fXc8=
X-Received: by 2002:a25:69c4:0:b0:624:4ee4:a142 with SMTP id
 e187-20020a2569c4000000b006244ee4a142mr13840313ybc.85.1645463914577; Mon, 21
 Feb 2022 09:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org> <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
 <87h78sm9oo.fsf@linaro.org>
In-Reply-To: <87h78sm9oo.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 17:18:23 +0000
Message-ID: <CAFEAcA-thpNdaTVUXrfHG5+pPD8RyORQXWG9V7eCFMp97y_56g@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Andrew Strauss <astrauss11@gmail.com>, Keith Packard <keithp@keithp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Gtt6C11EpS8Y

On Mon, 21 Feb 2022 at 17:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> The previous numbers were a guess at best and rather arbitrary without
> >> taking into account anything that might be loaded. Instead of using
> >> guesses based on the state of registers implement a new function that:
> >>
> >>  a) scans the MemoryRegions for the largest RAM block
> >>  b) iterates through all "ROM" blobs looking for the biggest gap
> >>
> >> The "ROM" blobs include all code loaded via -kernel and the various
> >> -device loader techniques.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Andrew Strauss <astrauss11@gmail.com>
> >> Cc: Keith Packard <keithp@keithp.com>
> >> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
> >>
> >
> >
> >> +/*
> >> + * Sort into address order. We break ties between rom-startpoints
> >> + * and rom-endpoints in favour of the startpoint, by sorting the 0->1
> >> + * transition before the 1->0 transition. Either way round would
> >> + * work, but this way saves a little work later by avoiding
> >> + * dealing with "gaps" of 0 length.
> >> + */
> >> +static gint sort_secs(gconstpointer a, gconstpointer b)
> >> +{
> >> +    RomSec *ra =3D (RomSec *) a;
> >> +    RomSec *rb =3D (RomSec *) b;
> >> +
> >> +    if (ra->base =3D=3D rb->base) {
> >> +        return ra->se - rb->se;
> >> +    }
> >> +    return ra->base > rb->base ? 1 : -1;
> >> +}
> >
> > This sort comparator still doesn't report the equality
> > case as actually equal.
>
> When ra->se and rb->se are the same it returns 0. Is that not what you wa=
nt?

Oops, yes it does. I misread it because I was expecting it to be
structured differently. (AFAIK there is no "standard" way to
structure a comparator-function that works with multiple fields,
so the way you have it is fine.)

-- PMM

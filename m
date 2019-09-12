Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1982001wrp;
        Thu, 12 Sep 2019 03:50:59 -0700 (PDT)
X-Received: by 2002:a05:6830:1587:: with SMTP id i7mr36503675otr.33.1568285458906;
        Thu, 12 Sep 2019 03:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568285458; cv=none;
        d=google.com; s=arc-20160816;
        b=UtaAgDrdHqg+aIFgiSnDKfru3kf3XZt7mKH1gNSOk7X+9MbLQNnz1nDLwmIuS82Ryr
         uugwAL0htEDMI1TGaNz+v05/5bH9lI4ug9W+ZGuTGIy7JU0GsIivXNl0sipqIC4CSfbn
         yNhbR7tWUXJ/6FDYdy6loBlNlhvaaJor6lrOjf3uie/AvOuJ96yAO4lUeHo/stVBRllA
         fZ8mRnm+caKyf9wursVMq/mSIBs+BZScDJxO9p/fuQMuZNs8563QsA9w/EZ2a8cnx6AD
         Vy3rorDaNWxd8yg+3RWpwIN4aH9h/IIyOtKiWxxPuIiMx5Pt38PW11XuxCZO1/Hlpo21
         GALQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VXWTXPZBNfSwhiAsVVlgTszhcEdm6hMqLTDpdFLRHU=;
        b=AWECGzoIcuHz7y4Jax582rk8uzmjzOZsC/15LSqBikDz0Gs3UF5dr6Xd9RsU9GDl5w
         MM4pRfR2QOZfuNoTZE0qxgwulWwnQk7OGO3t9FeoMj5h7r+3bE43q7neayXFH0JzxSzK
         wpcxlL2U6DEknlun9T5F3pZhmPgMyRJTzvIS2a0fPMqildwHsCyIbAqVPDdKxQ4T1Fg9
         NU9JhmO411zQZOSSEsFZV8fWd4nyeDRQDkYMVFOnjYRiwPTJVDqAyUcmTtJn1wWgFKWd
         u36vaeYRp6iexoXQJXSWLTOkaOPFPAjsME3ApMjLbUBI3Vm/fSv1oMREZubVpQc+lqJa
         P7XA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsAZQWy6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g8sor3518066otb.26.2019.09.12.03.50.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Sep 2019 03:50:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xsAZQWy6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4VXWTXPZBNfSwhiAsVVlgTszhcEdm6hMqLTDpdFLRHU=;
        b=xsAZQWy6B2UCaj+PHVuUO1ZlAjXLIb5vmRntH8qz/V8O9P+jYi1wmdQJyossnb6FP3
         IbNIq0MT9XOuZuM93AlxVzQDDMULhOmFSfLD0tFWCRHq0lD7U0o0Sj7Oph/UBJFoJacv
         SkT5AT+4TSaD/sQrYFhVHaULGD7yu7HVM5tslf4jjthbvEyHsein13DTvFZDwDxFrxLL
         i5d5mKhrb/GjRn5JhbF8ypgK6cSGs0ByinGyr6pbpjtNJzCTWRkuze+LJf3q5JZnVpDJ
         lpvZcvx2hFEQ/H6K0p+JrNtNr0ZQY5zyfFTBuXTJdqjJABovHLOkztjvSbG4jmDDQH7F
         RNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4VXWTXPZBNfSwhiAsVVlgTszhcEdm6hMqLTDpdFLRHU=;
        b=q6yy/sALh7spZB3G/JXZX0TwRFA1d7pA8eSZQOZuMmHRl95M/+096gsiElucOts34Q
         CLsRbN2QWVDx/31YnamnB6J5JarDjVxLm3hyaOi4g4ttSqMV3YudGWQBQy7oasdwAzvN
         bxrtKUGvMY28r/CVY0QrbZVmpAmURjNgoWiH6l6/9tFC82cHhYOwGm1f3FQIGUx0aHXg
         be04eRhFks61L7G645p80ZDSKNVIul2WZOVTfmikAOI7qM4w7YAmkHpbuJ4/xt50HiGL
         XdkokyLypGQ5WRUDVdTPSBtWyy0Hj9K7f23Jxr+sB/x+O1niwZ3y6m29bZ2Y3Xlxnobq
         QVyA==
X-Gm-Message-State: APjAAAVsFTopPPJcM9XHoASQ85DhcI56/hX56AyOeAVMvvudoC9nWrlh
	PqB5bVMd5ZVT8sq3JazLermM4iblwDz/Ggp8rY2TPOld50pP1A==
X-Google-Smtp-Source: APXvYqyUe5yd9CENp7xBletpyzu1tSfvZk4cbqVmedEOFwh/sqraRX5epPmfkrvG6pGROdgNFUL1pja9eskTkVyH2ig=
X-Received: by 2002:a9d:7504:: with SMTP id r4mr33442349otk.221.1568285458447;
 Thu, 12 Sep 2019 03:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190910144428.32597-1-peter.maydell@linaro.org>
 <20190910144428.32597-3-peter.maydell@linaro.org> <87r24lztgq.fsf@linaro.org>
In-Reply-To: <87r24lztgq.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2019 11:50:47 +0100
Message-ID: <CAFEAcA_s1aYO6ZK2pkrrc+YrdCoUww0H_RTOjvaH8z1FOemP0w@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH 02/13] target/arm/arm-semi: Always set some
 kind of errno for failed calls
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: xnKRpXsy4PDv

On Thu, 12 Sep 2019 at 11:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > If we fail a semihosting call we should always set the
> > semihosting errno to something; we were failing to do
> > this for some of the "check inputs for sanity" cases.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> although:
>
> > ---
> >  target/arm/arm-semi.c | 45 ++++++++++++++++++++++++++-----------------
> >  1 file changed, 27 insertions(+), 18 deletions(-)
> >
> > diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> > index 03e60105c05..51b55816faf 100644
> > --- a/target/arm/arm-semi.c
> > +++ b/target/arm/arm-semi.c
> > @@ -232,11 +232,13 @@ static target_ulong arm_gdb_syscall(ARMCPU *cpu, =
gdb_syscall_complete_cb cb,
> >  #define GET_ARG(n) do {                                 \
> >      if (is_a64(env)) {                                  \
> >          if (get_user_u64(arg ## n, args + (n) * 8)) {   \
> > -            return -1;                                  \
> > +            errno =3D EFAULT;                             \
> > +            return set_swi_errno(ts, -1);               \
>
> This looks a little queasy given ts is NULL for the softmmu version. I
> wonder (depending on your approach to -smp for 1/13) if we should just
> pass the ARMCPU down to the helper?

NULL is fine because the softmmu version of set_swi_errno() doesn't
do anything with it anyway, right?

thanks
-- PMM

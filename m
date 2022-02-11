Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp2227246lfk;
        Fri, 11 Feb 2022 03:52:18 -0800 (PST)
X-Received: by 2002:a05:6000:1e07:: with SMTP id bj7mr1080092wrb.154.1644580337858;
        Fri, 11 Feb 2022 03:52:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644580337; cv=none;
        d=google.com; s=arc-20160816;
        b=PGty1/biZRp7qq8stn0/ZhM+m3b+QPEwxE6tit4C9KD8k/6721cLBGAmlQKFvFyTre
         8Z7a9e/CZ5S98BGrZxfdu8aWgO8cbLQADaD3gd6ybGHyYY6DzRGPeQELW5NDjYrBin/y
         qe71AElxJMNvP7HEx8dyl6MTKFvlnVjp4C/Utlq3/EJaMB8gYFXo2eULeRugrzE46lQv
         HgCFp+ptJOlxq5bN3LrAO5cmn4RYB2SLNXHncbGtSAv28FiROf8T2B9rnNTs5jBGaz/p
         rA8XphyA7Y62K4rcIMt9lLX2eBxPPAHBdxnYhgNcurst4Llg9YzgBqpUSr4u0IUwGsPV
         XSnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wamW7hYAj2E7NHVJ2kYlcGI8TPeS64VluiCzCHS51oI=;
        b=LJdLysBtDhuE2rEHi7/xHQHK0EkPjAzor+eOT4F7Snf48NvCfld9PZtzuvCPTMqeZW
         xk17ISXAGiK2BqfZYtTV/1p3DfNPKb9W9BYbZiandzbI2WVBqXKSHIWwOaVt5FZLLxaU
         aFxCKqlgMhBTA/gUSFdrJMSXDv0M6/WJkepV4U9bXU9MM8wwpNs//ggYtYm2IgS0BKzt
         tmoOWXfmkCxI0D1YNO4YpMu2AcBPK1ej9QKiTipVdI8b5nIXyb6foUHY6GrwxK+0hvR/
         LZNp3fPxeKK4PKNudm5o+kEUsdFXyvGmI1+GprpnRV2d/FkWRv3wr7K60eCleDVGt2nT
         QuRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xLNBooLr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k12sor3137147wrh.50.2022.02.11.03.52.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 11 Feb 2022 03:52:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xLNBooLr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wamW7hYAj2E7NHVJ2kYlcGI8TPeS64VluiCzCHS51oI=;
        b=xLNBooLr6KuTl6f/e1XHGlMiXJVdUJONyS0+8dMQ3IkYgfayel6eQkVAJTLxSWgvqi
         tOeleLrLTdFSC7GUtW+tfGbmwpiTOmTsWLCZDSAzwqZVzc39+KZOjy7Z4e7KRPgy59bk
         IHAnuxwLlD4GVvO8pcWKwN81SWn16kG52s/nYQB/geVBd+j/HZz3NDu8zaA9uhE5g2VX
         GIE33h5fWl1ilHcc2vlY+sz3Doc/vxobz01kcOaq+QyAnnPah8uHTufzXh4IyGyIdGcg
         3dWkLrbou1pRz9zGfEGS1Ug1Bxaf5pH3ABEkr7bSxr5g+McSVlLF512pBH5JtAQ6UpW+
         h7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wamW7hYAj2E7NHVJ2kYlcGI8TPeS64VluiCzCHS51oI=;
        b=J45oCR7tCX0N2hU1F6HvwyPGMOZhnuAQlDeg24kQzJLfufnBBrBQSeCJ1ReruJy7k9
         O1I71s/rDFBWFr9gFPAtwYGDzERZW+p4K0a8xn0y2vD5fqsW2M5yyeIac74Lwapwquiq
         z8H3HQ61T/Lyn9K/vT8dMbkxVQyQTCdqFvSpl/QZxv9d7FNhH/RMT3SYlP2vsKGO4zRC
         zgKuZWRX6DBHt9R1uwXzKM4EIXkqH68h81jdc0aoQLvd0d77U9E8U6kgAx7jdqK7xIvp
         4n/D2OFKMtZ2o3FEGsfXgOyrrIzZwTJzkSniwCpc6gRCDUOYGLg1vLXb15MuosdVSlDs
         WaQw==
X-Gm-Message-State: AOAM533DERAKJsa/Tb0ATFql59fl7jgNVfEHDrMqkcG3rNSudNcwPYtu
	sTrNV9WyDWccGJ2nfPQOXmmlAN8bP8xNl8Ytjug+i+dGN+cWGQ==
X-Google-Smtp-Source: ABdhPJxbeCvTZjttlZl3PL4Kr5CseBKn9piBHnaBNLLOuO0a4qNPkAaphzqoOH5L2fJLw0HydLBRYpFiRRv51yywhio=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr1096694wrv.319.1644580337492;
 Fri, 11 Feb 2022 03:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org> <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
In-Reply-To: <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Feb 2022 11:52:06 +0000
Message-ID: <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-devel@nongnu.org, Andrew Strauss <astrauss11@gmail.com>, 
	Keith Packard <keithp@keithp.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: xCTiatADEDtC

On Thu, 10 Feb 2022 at 11:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Alex,
>
> On 10/2/22 12:30, Alex Benn=C3=A9e wrote:
> > The previous numbers were a guess at best and rather arbitrary without
> > taking into account anything that might be loaded. Instead of using
> > guesses based on the state of registers implement a new function that:
> >
> >   a) scans the MemoryRegions for the largest RAM block
> >   b) iterates through all "ROM" blobs looking for the biggest gap
> >
> > The "ROM" blobs include all code loaded via -kernel and the various
> > -device loader techniques.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Andrew Strauss <astrauss11@gmail.com>
> > Cc: Keith Packard <keithp@keithp.com>
> > Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>
> > +static LayoutInfo common_semi_find_bases(CPUState *cs)
> >   {
> > -    MemoryRegion *subregion;
> > +    FlatView *fv;
> > +    LayoutInfo info =3D { 0, 0, 0, 0 };
> > +
> > +    RCU_READ_LOCK_GUARD();
> > +
> > +    fv =3D address_space_to_flatview(cs->as);
>
> Why are we using the CPU view and not address_space_memory?

If you have a choice between "use the right view of an
address space" and "use the global address_space_memory",
it's better to prefer the former, I think. We use the
latter in lots of places, but it's not conceptually the
right way to think about how the memory system works IMHO.

-- PMM

Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp3981329lfk;
        Mon, 13 Dec 2021 02:56:18 -0800 (PST)
X-Received: by 2002:adf:fdc9:: with SMTP id i9mr15599602wrs.660.1639392978069;
        Mon, 13 Dec 2021 02:56:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639392978; cv=none;
        d=google.com; s=arc-20160816;
        b=BLr6F2roJ/N+CR70FUAB9LYCs/TlaY6zXTs1d5WGeDD3zoAq3GBD+/xeb2HORF62JO
         mqq8nyBYNhxA+JGzR15DS7SJq1iouyyBnEyFZvTFw9JBCeZFeH+ZsrPJUpt89qeW3hI4
         L79knWQSnCnqThrFPYmb4LGAC585ZPHORijGRJSKEmmbBCmKt1k55w3fVkUeUuHzn551
         1BVYNIhmkPXbphHbV4WmZhbcVZZ6ZRn0DFUQPLoIof+AXr81bBVAOyLOQAanmVbaKCse
         1rMB4Xf0dZEyZ44XEIbvfK72v6PnVCO3bD8f017MtMdI0KkF49qdB7FDFMAtakGrIImK
         PMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LFMvMQVlJhagT0WrHjhcMdfLZgqRS0X4f1TAvCuYn/I=;
        b=fp/8yFw62Cs2Mm/DOtspWQpXnR11O8l3M/acaD+50UIjj00mxqulrT4W0QFLJ9uDRv
         5w3PZ2eyRqNShpcP5vAg6L2plNErW5d/VR2wvb6rIi0OuT6UVbLMJ57mXugyZR4ViVuk
         ZxXDYYgPbCdVouoZRvHWRs3ZL5l7YmYqIQeQrPbibZbhphwRNPuLpkOiCMBwddO3XNyz
         24lhHyw4Lv9+VxN594KRdXCcHBIv8DahS/pyZfxdpgE48zqVHtsdMXRpifQ+kVKkyFna
         JfbxmbpUg8NgqPQ0oCvL4R3RBqupewSIzrq2ESKjXRV5+QUQfBxxi+KUvlPT4XFWmP3n
         2lgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivg4OZCi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x21sor2974419wmk.6.2021.12.13.02.56.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Dec 2021 02:56:18 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivg4OZCi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LFMvMQVlJhagT0WrHjhcMdfLZgqRS0X4f1TAvCuYn/I=;
        b=ivg4OZCiU1D0bWM5TjoXu7eSsjML22otTBu0voD2ZA60sgvgUSAgVLOxpI4HQwze4Q
         4WBTj+yjQZqvWJaAM8eXqB+vS/sL2qFKWQSRW5+C+ggOemgxSwix3b5IcCkcoDYimE+N
         8364MA/sfVQpeC2bzAk6HZBonvxJ8PrIGkqs4nSaFQ12bmdUtGAGyTAu86VVpKdTg32p
         bf9M+ucC0J+GM+9NHd0l80Bw0RA4mQyYNUwxAWB9ppgURzFtpAE3wFdFYrUkLKDjhfGr
         JtfZq35blQ5Ij9sNnSWvbnxQ5cpXq486wGZUbLuE/50CZ/FMtvV52/QSdAc3c+ztiY3x
         1lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LFMvMQVlJhagT0WrHjhcMdfLZgqRS0X4f1TAvCuYn/I=;
        b=xnOM54t8krJSBlz5b2PHgkkXkg1XdbhMi2tBH9hqrQSdZtp2JOEM8xhv/WJjFfHXxT
         E92oEcPR+jwkx9vdc1v0pflbwwSA3AZX0Koe70wriwC68LsGV9D6N5Z4Taw3k409peLS
         usfhxWZ0xPV1gyX2T7fNdNabmillniLNbHZ0obAPKRq6YFjJgXqeftlyeZffSEBf+MbH
         VICbPepu0w+Z3rwONJD+EDx0RPG++5hZztwKEPMma3SdxWP3SNJ3Hpxdt54gLpp/EW3w
         pz4tijl9G8mtqz2ISXNWD6kEDd2e6ef72+dguT1lPB3fg8GA9OdfBAKScD7xRaZrysM7
         oeeQ==
X-Gm-Message-State: AOAM530Kk/pGOh1DzMRNZkknSvQgOhOzLBC3/zzyCwNhKesCGhm9PVS5
	H44kP5EXzUcaMgPs4Dq6BwCxM3nusEioSdT9yQpMqmS3
X-Google-Smtp-Source: ABdhPJyJfEqkYNVBsWrgqTcV7Zh53nyQLzXhWo/j6bLlxc7om+s4/DKgZBakiwapZA0DkF7wxdm0tRPIJzGu54TJQSc=
X-Received: by 2002:a05:600c:3486:: with SMTP id a6mr36297863wmq.32.1639392977775;
 Mon, 13 Dec 2021 02:56:17 -0800 (PST)
MIME-Version: 1.0
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-12-peter.maydell@linaro.org> <6458979b-3162-570f-e5af-1f3baff70d04@linaro.org>
 <CAFEAcA-ZWwnyzoq6-D343dMN+8AZjke8ej+fp79g0bEZ+m6n0Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-ZWwnyzoq6-D343dMN+8AZjke8ej+fp79g0bEZ+m6n0Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Dec 2021 10:56:06 +0000
Message-ID: <CAFEAcA9LdfwphgD+dJL+rE7oLrRxCZu0x1roQZxf_F-g1n5hFw@mail.gmail.com>
Subject: Re: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by
 (DTE.SIZE + 1)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Shashi Mallela <shashi.mallela@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 7glOphAHDjUp

On Mon, 13 Dec 2021 at 09:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 12 Dec 2021 at 20:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > On 12/11/21 11:11 AM, Peter Maydell wrote:
> > >
> > >       if (dte_valid) {
> > > -        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> > > +        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> >
> > Without changing the type of max_eventid, I think it'd be easiest to fix the off-by-one
> > bug by not changing the comparisions, but changing this computation.  E.g.
> >
> >    max_eventid = (2 << FIELD_EX64(dte, DTE, SIZE)) - 1;
> >
> > so that the value becomes UINT32_MAX for SIZE=31.
>
> I think I'd prefer to use a uint64_t. I think that part of the reason
> for all these off-by-one errors is a lack of consistency in how we
> chose to name variables and whether we put in them the max-allowed
> value or the 2^n value, so the series tries to standardize on
> "always call it num_thingy and always use the 2^n value". I prefer
> to keep the consistency rather than rearrange things in this
> one case so it can use a uint32_t.

Looking at the series, I'm going to squash this patch into the
later "Fix event ID bounds checks" patch, and do all the fixing
of the event ID check there in a single patch.

-- PMM

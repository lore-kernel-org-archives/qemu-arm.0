Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5032036wrv;
        Tue, 6 Aug 2019 02:44:26 -0700 (PDT)
X-Received: by 2002:a54:4703:: with SMTP id k3mr1046665oik.143.1565084666169;
        Tue, 06 Aug 2019 02:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565084666; cv=none;
        d=google.com; s=arc-20160816;
        b=hjHsz3bcB0Y5p/L5RspsP27GEvxkoWAVDWry6T6+VqKAZBhx7dMLxI/XqmkAtzIIAs
         SI2AUTFlN1nf2hyTuPRxU82Wu7pwTXiW2jGdVQcCZ9QqjfVqFDVdbpoowXaEzjm9yCas
         +mwZCnvKnocHI6OrlHyw9PibwVHqe+V20fr1BkMRBdT1f7Zps8uibob0imce+Gi0Uarx
         nyoJ+rj1Cbn7ZeQ+WK1r0jmDLH7UoqdPh+GB7uZHMP110AtaSR7kcYRJ0lHn30//Zc7S
         vMvklM2itFfmdJ2csHhn0XrXtQJRTSJz78a8zxB1O//7rhSfpHcieu3EyJHJEc92ofm8
         75MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=midoLkk2oROs660CFtNkSmeuZgvHzcbI7Yf4h/5nf/4=;
        b=OZ4prkgF96hhfDxEH9tfHYyqOc42VAhba5xYOn/2TAWNkUx/AkBWp2+7nEWEpOdIHj
         Kf1JIQgmb5csxfHNIhi++4z2GLtPu6WYGKMrkgP/GUE2jUHmqi8jxzs8VXRwR/bxheeY
         YlL3rgBCgtz+uCZhKO1OPScfyCmpizb9XWm18ktoW/1dIjf5xHEdBVCRxUvaKHtRHzZQ
         hn+DlxZy9HB2k099J2r5IdPthtKeBPRMcONXW7KXdRmzQ/5jNMLuz10sPaUsCtLoCBG2
         kwfj81fW3D8o+6bHQg266Bo4YCjfyhcZxo/s63XyKN/T8UmkFTM4lVinw+pBrcPq4KJC
         EBLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDXNOtl4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g16sor43260386otq.174.2019.08.06.02.44.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2019 02:44:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PDXNOtl4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=midoLkk2oROs660CFtNkSmeuZgvHzcbI7Yf4h/5nf/4=;
        b=PDXNOtl40nrF18gOQXLL51CBSw2F4g+TaQhJ78B/HwWoir17gxEGA8zr21GyU7mgWV
         pd5rqX69Gx2SHudBbKOMnkZO8oVQjqkdORh1rQTRe4p0VAU0Qa/lyeYFzOzE0OnZ4+2G
         k+97PFY8Yz7GVJbrsXeL1hWVJ8bVVyleZXMajRZws2pm3KfC6e1XgQtU1qhQniz2yvTx
         u2dWQ3pX9j3qq9oXFqHnPQ4cETOwo4fKr2RsndOD/31Ec8nceNLDKEa1x4rBWwgjdyD3
         /hLYY/BU3yzN6u3Qcr3on3AkgYx2sHgMqIRmgrP9dWQLUYG+QRQSTIU5QvsFCcgiY2gf
         seNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=midoLkk2oROs660CFtNkSmeuZgvHzcbI7Yf4h/5nf/4=;
        b=hzmjLYR6eX22OHolLu8kwsiTcw2ULwQU0ADu0+p9+YhjOBKn/XVIYbKV1ogQsSPCMj
         C2Jde1FhBSTpVwI4Nl9fj1spzeijsLmFSjqYopRRNOsOGOKXlvhZKAvM0T2uqM3+CAzY
         hWRMVIeHrzui+PJgQ+Cl0FvU28yCjwmL7KlA1f9ualoJ9lfEYqph7Juy9z0xen9gnXY4
         t1MKjOe3zY3y39tY+sjbcJsIV1r6A0nUHh4KG5v1ZUJafaYHLTSIKPIaVIEhW3y4qZRF
         58IeuuONpt6Fvqr3WbMVlCWSKiv6rHLJ6hik/ztlhQ2FuFE8uGM+HciV6JU4s5B3ylqd
         doBw==
X-Gm-Message-State: APjAAAVvOpnkzjv3ZlBvJ2s5wFTTIU83T1sviQ73iTTAfS2j/Q0JPrM2
	+5wuLkEReExU3P/45Gfcf/KUnGIVxgmvrvF9SS/GhdHY
X-Google-Smtp-Source: APXvYqwZ+2O/NhfRLHtWqfelbIErtceLNVP16Ak1dS5XMiJkSTmB0KvSUZxMZJaMzCvErIN18OlB0ib6flLWUUz4IuY=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr2063944otj.97.1565084665664;
 Tue, 06 Aug 2019 02:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-8-richard.henderson@linaro.org> <CAFEAcA_HY=WuGEPxTEm5g5tYuCDHXRDs=9EXQd6r+zvsL6_=Uw@mail.gmail.com>
 <af4f9f07-ac63-dfeb-9f2d-734ffff3fe7d@linaro.org>
In-Reply-To: <af4f9f07-ac63-dfeb-9f2d-734ffff3fe7d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Aug 2019 10:44:14 +0100
Message-ID: <CAFEAcA8Ju1C9x9uR1f0Pyzf1sGPnXdyNZmVSqos6BNrbidhMpw@mail.gmail.com>
Subject: Re: [PATCH 07/67] target/arm: Introduce add_reg_for_lit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Hxw7TUv0TxN0

On Tue, 30 Jul 2019 at 01:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/29/19 7:15 AM, Peter Maydell wrote:
> > On Fri, 26 Jul 2019 at 18:50, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Used only on the thumb side so far, but will be more obvious
> >> once we start unifying the implementation of A32+T32.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---

> > This is losing the information in the comments about the UNPREDICTABLE
> > cases. Are there callsites where the new function is called where
> > "thumb and reg == 15" is not UNPREDICTABLE, or are they all
> > that way?
>
> These call sites are that way, but this function will eventually be used for
> LDR (literal) and ADR, which obviously are not UNPREDICTABLE.
>
> I don't think this comment attached to this code is useful as-is.  Either we do
> the natural a32-ish behaviour and use ALIGN(PC,4), or we should
> gen_illegal_op() and be done with it.

I think it's usually worth noting when something's UNPREDICTABLE
and we're choosing to take the falls-out-of-the-code behaviour,
that's all.

> Would you prefer a function like
>
> /* Use of PC is UNPREDICTABLE in thumb mode, but allowed in arm mode. */
> static TCGv_i32 load_reg_nothumbpc(DisasContext *s, int reg)
> {
>     if (unlikely(reg == 15) && s->thumb) {
>         gen_illegal_op(s);
>         /* Unreachable tcg ops will be deleted but must still be legal. */
>         return tcg_const_i32(0);
>     }
>     return load_reg(s, reg);
> }
>
> for these specific usages?

I definitely don't favour this -- all our "is this going to UNDEF"
checks should go right at the start before we generate any
TCG code at all for the insn. One of the things I'm hoping this
series cleans up is that the current decoder is quite bad at
sometimes detecting UNDEF conditions late (which then results
in warnings about potential leaks of TCG variables).

thanks
-- PMM

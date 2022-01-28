Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp265077lfk;
        Fri, 28 Jan 2022 02:51:00 -0800 (PST)
X-Received: by 2002:a05:6000:3ce:: with SMTP id b14mr7033716wrg.118.1643367060105;
        Fri, 28 Jan 2022 02:51:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643367060; cv=none;
        d=google.com; s=arc-20160816;
        b=z2S9Pzp75Dj/Oiub6F3rkheZ71vTh1BJGdMoDQbThFzedPXD4pvlEHTffaGZ2mMufd
         SZlFKR7U2sf26AXWM4Nen5YxxWZnXg0ZxLr7gAMj3ZXs8OHtQ3c7qoAA/EBy+H78nThx
         jn0lIaHXBL81gol6vrJvKl2tVDSCmFn4uIfq92PXvuXVA7B2i/S6h11ToqYdsMi8T+J3
         N6U0NOz0Qzo8LAorCInvRZjWAdx9cbsqemtDCHNYwQFT2DRPfFdO//n/vvmru3jbyprY
         QxJe0c88r6k6FmdaOpm9h6hmzxb7tN2jqFD+qlfbs9uVAIb676wquNyeWzop4w2niTs2
         TdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aQyN94duJXexWxI36pp2rVCw83t6s9vLpOMLUkHi5eA=;
        b=L5T8ySa9hYc9mMw97sCwKvoVN9KilYA/ofdxjf/LZVZ8bv/iSJsIlAIW/ydQLxa2oz
         1HQTf/V+Ze0BYdwub+M/4xKf4HpGxNfrKRf95rvdI/VUjj6WOAEI0vDghNsmxO7eBM/3
         IUkFBrUr5pD19C9qxmXdFdrj7nlwi7H1d6iKF3/ir6nW0zs+DEbVL5Fo7G9FEe9F8w/d
         i77a/r1clUu3GS64rR/QEqtV/S1MwvOJQhu9lvWh7HQnbeHerg24pzd2HnhUJHsAKoUi
         MyO2EOkbTHfx+1VLzaBT0mPYGOfznPSJkisOqamS25xrEXA+D578VuHCyAl74pVxijKz
         TofQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHQcVxgO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v26sor16062379wrd.39.2022.01.28.02.51.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Jan 2022 02:51:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHQcVxgO;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aQyN94duJXexWxI36pp2rVCw83t6s9vLpOMLUkHi5eA=;
        b=vHQcVxgOckzMDckiYgiz1zM5A6sGP8qAcio+8mX4k7WdDsMKR4MNb5XsSMsVN+OWG1
         aDgGNVUXXvmW1Fow92ufak6ty91vx7LxjM3+YLGTP3A6StbjSHk7OfuxiB/OXreMPmW6
         JbS6R32Kykl2HwJiNilnGEU3GOF6hAcn8QuJ201Dszh641EKtwn2dNWEBAJpSywZvN8n
         ZWTLA0mT0fRE2GV9e1kcnEEqAZ91ovPtU//mv7rEapaPmNbmqytEPP2UqqIEitpItlj7
         KcGjpt44MswvEri+NunjdXgwwVU75QX0c0fQA8V0kZiMfS8cTCZhQzvXMItoMnpfbCDj
         3r4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aQyN94duJXexWxI36pp2rVCw83t6s9vLpOMLUkHi5eA=;
        b=LZhMtNuOVixMR/WFbbrHm/YdJ/oi3uPJI1xJfiBhyjD6xVsnDFIJUHk7iWHDhr3xws
         QsG6suG8MU/PuE+QWpZjGZd9JCL3gKvbZQmnflfSi/tpEh2pjZvbjL6AJA4jH5mRrPmr
         4rwZuHLH+HJxFSq40NOKE4duLrJVh63jaX7y/HnMtGa4YZT9qK2xWLusF1GHWUn7OM20
         0yeF1evYDfCmNmjsRfMnbISGpRsxSJhxanD+uu7EzaYJHQGvLg+svBT/CFaFVHKJ3oXe
         VrWaHu+jG4S8YH9LT1mTLIuTT20qhzKy6ZpeZXsE9/wivaOfyXbsZLPMdHG5mnQ+9kEf
         3x2A==
X-Gm-Message-State: AOAM5307EUoW9QVkVkqHX0SRLRdnvROvlnGVupOPb7div3WoojI23TzB
	PhlAjYbToS7GpjzGe7hHJIj6uyk+Lf6EKqD1YKeYnHCtv9Jy2Oc3
X-Google-Smtp-Source: ABdhPJzIo0eKjyI4wWkgld4YACXagC/fnbq0ShzIWaValSKlycbUaSnHjZb8CCnnh+Gmzpkpr12i5RbyI1MvmVIvYn0=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr6438225wrq.295.1643367059789;
 Fri, 28 Jan 2022 02:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-2-peter.maydell@linaro.org> <e81fe48e-af20-5e4e-959c-be8e2265a513@linaro.org>
In-Reply-To: <e81fe48e-af20-5e4e-959c-be8e2265a513@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 10:50:48 +0000
Message-ID: <CAFEAcA8Qf4aG70bCqxXfCT1a_df5xpBBYi84Z+tupEMUp7nzNA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] hw/intc/arm_gicv3_its: Fix event ID bounds checks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Shashi Mallela <shashi.mallela@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: lscAPBOSCo+o

On Fri, 28 Jan 2022 at 01:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/12/22 04:10, Peter Maydell wrote:
> > In process_its_cmd() and process_mapti() we must check the
> > event ID against a limit defined by the size field in the DTE,
> > which specifies the number of ID bits minus one. Convert
> > this code to our num_foo convention:
> >   * change the variable names
> >   * use uint64_t and 1ULL when calculating the number
> >     of valid event IDs, because DTE.SIZE is 5 bits and
> >     so num_eventids may be up to 2^32
> >   * fix the off-by-one error in the comparison
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   hw/intc/arm_gicv3_its.c | 18 ++++++++++--------
> >   1 file changed, 10 insertions(+), 8 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> > +        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
>
> Could be written 2 << N, instead of 1 << (N + 1).

It could, but the spec defines the field as containing
"number of supported bits, minus 1", so I think that
using an expression that matches that is clearer.

Aside: clang optimizes both of these expressions to
the same thing; gcc does not:

https://godbolt.org/z/nsz4Mdxhq

(not that it will make a perf difference we care about here).

-- PMM

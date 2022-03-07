Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1501352lfo;
        Mon, 7 Mar 2022 05:48:06 -0800 (PST)
X-Received: by 2002:a81:581:0:b0:2d0:cd56:82eb with SMTP id 123-20020a810581000000b002d0cd5682ebmr8442800ywf.262.1646660886233;
        Mon, 07 Mar 2022 05:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646660886; cv=none;
        d=google.com; s=arc-20160816;
        b=aNyA8MyIpLu4TQiygcDB4CJDvyTmyjxKho3F4EpojJxSzHr5PBWiClZVZcUoSBGdj9
         IoqxnRxp/4o+2dARQEmVo+rQFH1lh8Jbmmc6/yPpD6EdXa4D9ImxAyFNEttciuuw3u0b
         OI/Q/iJCPjGMAsU9gid6XcZ9+jZhseOJjizWUmgqUetGi0ZT8bUSVB7FzzjonoyUftUl
         IzWmbJnUlkpocvVw/IwaCmSPW+klgNJ/Vd7bY6ZX1Go6JMupngets+kW0S7R970sKpSl
         uhP7NJZ1wNUp1vZWQ+HC2DZ+4j8mdfvzODmZmUZJfA3i0OWnjtL6SiLDtTucAjXCZvkW
         eAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jsFne9uw+6EkKnI8/EeJveN/YYV7rrna+RRmWojnQEU=;
        b=mRf7UtLV8ckPvdjExVwSjXLtikxObQd2/UrSMGjq5YajtLfAn3klqEub9c0+eR3odS
         dicOECsJCPyVbTHRYEVvsFDJsJsqbTVzkUfZEfl+iJaTqd/L7zmbV4FoWstVcjFMdKvk
         aIjbjWUkkgN92shbYOch6n7MG7QGUi6fZQuC7scnQvYjVkbHgleIloTzklfP1kzq0uKk
         3IBaHB8a15A9yyMbCob3Rkw3RHGUYK4WJy4vXWzqA9Qj94yRwa+ETaLLdsOOMgvcQe9C
         oU7LZNAYYxlGKgTJ/630fY7RzD/Klh3BiNaT6oyieG7aLCGpNfS+rt5gakepY+j8QKYu
         QN7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4DGrhZt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r4-20020a81e404000000b002dc582b66c8sor269803ywl.28.2022.03.07.05.48.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Mar 2022 05:48:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y4DGrhZt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jsFne9uw+6EkKnI8/EeJveN/YYV7rrna+RRmWojnQEU=;
        b=Y4DGrhZt+hmldsjZFEiPPJ6jS6GuzAdPelexKasFKGOOtjYkztUywaBdklEZZ5Jwor
         tGaKUpNNwrFES60OAii4nBeqB7GgOYy9umSPhFjq8fculZv5Kkqd/y5Fy/z3YJp9vSU6
         0RnUhC38s0+7vuJ4RdTwGChBs8q6Q2TnKCBGtqpYB3RXfOflqLdYPGqU2tTmQavKSgO2
         Hi3xLGESNYUdN9bTKYe5gvx9xR+8u4+haXgPggFGeEAbQs+tY4KBWjVRe2TzgGypx/hJ
         sgrDIi1MnmvtDkP/lCqwAFE6L9kUS+nuDeE4m7E/uUzOW7Ov3+L6SSUqfV2HBMThmuHD
         Z5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jsFne9uw+6EkKnI8/EeJveN/YYV7rrna+RRmWojnQEU=;
        b=URXrQAxS1VY6+Qd7zpH3n1upv7g0wqu9K4SWzWGgsVTjdfT+JXn7N3qFMtuN2FKIDb
         uuIyW+NbvxHEBMGS1mWOt1bmNTgqKfkLc/cdYslBt1ZxngyErdggq7oIM3kfHIppJrDY
         /j0CWN9gm/sNmJ98ILMcbdF3EF8bzbDJCpfMa5gHppP/TKbD/61cDNvjj3xN+WwclQOp
         oBuTRjnTAKX7GBjHRIgCWNdvPuSJEMZy8iXYSrQsVG95xgbgO7gcikKpVCBtbDIPtv11
         sUesX724x0dkJuk69V83cyh1vK2cNWWKyXxl9dJ7BFlyHot79/vQm9BjsjsIFVErv6Z2
         vsrQ==
X-Gm-Message-State: AOAM531NPAdk/axmlmpN0AQ3w/d8rVHJfPhHQIB3fttNLZnCJlDnSvVz
	XeCobc4RZ5wQ/J5VSygykvhABw9JgYYjgYAPEBUa4DQY
X-Google-Smtp-Source: ABdhPJyL2qfFT3CJLwQShzSkTiKh49B2Y152Wh1ktIKKJ0BrV+5YLDoCn8EB1hnwIDroqzkV0pN8Guefhdbh/cp1E2E=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr8235969ywh.329.1646660885807; Mon, 07
 Mar 2022 05:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20220301215958.157011-1-richard.henderson@linaro.org> <CAFEAcA8E49vV9bGxMMXM=NBSCm0R1toUptrvt4=v2rM69u9o7w@mail.gmail.com>
In-Reply-To: <CAFEAcA8E49vV9bGxMMXM=NBSCm0R1toUptrvt4=v2rM69u9o7w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 13:47:54 +0000
Message-ID: <CAFEAcA91h=Pkb6MVxtQfY=i93m+MhS-gMax2YhgBARWeFnjPPw@mail.gmail.com>
Subject: Re: [PATCH v4 00/18] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: Uk9pMSYxx2HH

On Wed, 2 Mar 2022 at 11:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 1 Mar 2022 at 22:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Changes for v4:
> >   * Add cpu property for lpa2.
> >   * Disable that property for -machine virt-6.2 and previous.
> >
> > Changes for v3:
> >   * Update emulation.rst.
> >   * Split out separate update to ID_AA64MMFR0.
> >   * Hack for avocado.
> >
>
> I've applied patches 1-16 to target-arm.next now, since they're
> all already reviewed. 17 and 18 are still on my list to review
> so we should be able to get those in (ie actually enable LPA2)
> for this release.

...and I've now applied 17 and 18 to target-arm.next.

thanks
-- PMM

Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp248291njn;
        Fri, 10 Jan 2025 07:52:02 -0800 (PST)
X-Received: by 2002:a05:690c:7346:b0:6f4:222f:3b77 with SMTP id 00721157ae682-6f531224ec9mr97034767b3.1.1736524322030;
        Fri, 10 Jan 2025 07:52:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736524322; cv=none;
        d=google.com; s=arc-20240605;
        b=ClmRSsWTCljhENWK+zLOqVhw79LaZl/jdV36d3zW3NhTpJEvFEjiK6ZIlChH7gfzXe
         Ho5x+cAuuThqqpgcAZ7iIayN6uxjlgMcjjJrPtbZIJni44sAA4yxFofTSw/6rqpte8h6
         CXxmp0DydWzGDhdNA0lGqB6n7/e8W3BQ0QKwzl2+0sPlodZjEjyuX6qkN6oa1S8S+LLj
         HbMFyaiRbnlz120DFnEt1wFtpDsr+6OGgjhr2jE1pW0balL2AdoGZke3gmXjTWl6G7Jr
         1AVc4035vPn+6/c1kQmnRpkrJU5YmnLVlrBQ5sdz3/v1ZDaVp3Kb/puAp9cZsS8hGLOI
         Od6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=acshiMArm7srx5Pa2I2/Hx8sleuA/XkPYzxDNAwY+ME=;
        fh=gnr46/89394yF46oPt6OyomdXD+Bf6yjjRLC2vFLyyA=;
        b=Pvi/OVMF68MP6uWlMXxRYFJ1o0C8Z4Vlpzx+J0eWQ/WTEYWcafYs+Z+BMXw1Xwy8LO
         lP7ba4z/EwOvOYcs0VRgptxeNPbWIX1YIYxNN6/J/IQNvW+qHf0dSuOm7wh/vIWEtPL9
         I/s8RZpsPe1m9QtObJoPN/jXDGMn8X5te6R0RsC9fNqyvDWDkqX65UJUb+RoCIoeIzTi
         BV0fkLAktlwji/1QWF6h0ts/8OxQCEC9JGYa2hB+2GIrBXbQDflRiGClO+IKjrofEme9
         eZ6VfF1a0Sqs6787a3qvoug13M7FPgqqAg8k3QVIKNS5mVp7OuM6F/KMD9c/AgiK5jSO
         LMOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vP9ntAV+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f546bd4623sor23790877b3.4.2025.01.10.07.52.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Jan 2025 07:52:02 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vP9ntAV+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736524321; x=1737129121; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acshiMArm7srx5Pa2I2/Hx8sleuA/XkPYzxDNAwY+ME=;
        b=vP9ntAV+Ii3ZwL9e0d2AM5PsY/oXGf/FqdYIw02/AxYYxU5v5gg1gfzn/O78Nz+hX1
         SZuoCK563V0SbzBwxTwqTAlnWYibKayXrqysAPgrQMepATU41kyTEVh5XJrKES1jNKD2
         of+vFvNC12LhqAlT91aSexQn0WApW5F1sfVJhxU9nnjo9ho7xlXoRDyhDMdGZIO0T0dP
         f7udPsFv4FdO8gtB0iFbfF2Obq27HMfoanlTtblDfOxrgIF+UxXYLp9+uM5AgS2qOQyk
         wXWObLFAkTexVCELarUnhzTwoKU7u7txQt5N7+c/XSED97a8CeoQcncdExL9bAPVcPgv
         6BbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524321; x=1737129121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acshiMArm7srx5Pa2I2/Hx8sleuA/XkPYzxDNAwY+ME=;
        b=qCYURsGlxbMTJiQ0OMun/+wsOVLdjp/7u9IMeh3x9IDQHkRVydSmXdnTlYHI1QgnoI
         kMnqpA70CeP4mnAcaeL/OStUzjaewpTypzbHzOvV0pj2FfUPCj7KwimjHdMsqrVDSu3s
         ElhgBWQS7UTTR6lWnq42GmbmG7WsBbH5q7zslc/FD3SgcWmpPSlxUI0Bq2Sq1x0LM5/+
         Sa44SXCvtfj/xtSk8x4jZgyuvt1IDzal53HZspv8E2O81Z9FcNkb5MgS+TcAAFaDN9t1
         0brPh9oFdRPaalloBpOLgq5pBFIggVC0sDyDM1ERPD1y2a0evFPjerDWG7OhCHsymQkV
         DRlQ==
X-Gm-Message-State: AOJu0Ywusk4t4jCT6GdhQUjeWwdchR7HZqgvokJfIGG5fj+BphQUsCQn
	2CzXSZ7cXnbkHUVY5oLg58gScw8+Z3rJQHlppWUF8RWvVXwYx+IFch3qIhULd+dA/gstDdg0MPf
	/pv5yEKP+3M+fpmk8bgxwsQskcQe/noeoE0qjBtmp4F6zNLtq6e8=
X-Gm-Gg: ASbGnctDUq1Nzf8eVE4qiSDjiYv6C7+gdAQ6iCeka4SAdAF9rjKrzWck1X2ozpYOAXP
	2/AwW9T0kVzmtTft6C5JhH/r/htObMcCC4yAguYo=
X-Google-Smtp-Source: AGHT+IEockeIEtarpkLBbSdsWp8DoSVNtEIj03oQ6c97crRmnEuxl6QeLIwkKMfAbapk5yMJwYDOtRACdNkUXJHFcNE=
X-Received: by 2002:a05:690c:6a12:b0:6ef:4696:f1d0 with SMTP id
 00721157ae682-6f531248bddmr95117747b3.12.1736524321691; Fri, 10 Jan 2025
 07:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20250110131211.2546314-1-peter.maydell@linaro.org> <877c724rcu.fsf@draig.linaro.org>
In-Reply-To: <877c724rcu.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2025 15:51:50 +0000
X-Gm-Features: AbW1kvZu6nHPy9KBXVipDdmgKfqneFBZj-dzPOlzuAGKjushJT1y9R9R8ULphHw
Message-ID: <CAFEAcA9sK4GkQwdkQuPkQqSPUCaARN5edjAk6s_EeX-NHTQzxg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Move minor arithmetic helpers out of helper.c
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: CqfjXio/LqHr

On Fri, 10 Jan 2025 at 15:32, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > helper.c includes some small TCG helper functions used for mostly
> > arithmetic instructions.  These are TCG only and there's no need for
> > them to be in the large and unwieldy helper.c.  Move them out to
> > their own source file in the tcg/ subdirectory, together with the
> > op_addsub.h multiply-included template header that they use.
> >
> > Since we are moving op_addsub.h, we take the opportunity to
> > give it a name which matches our convention for files which
> > are not true header files but which are #included from other
> > C files: op_addsub.c.inc.
> >
> > (Ironically, this means that helper.c no longer contains
> > any TCG helper function definitions at all.)
>
> What's left? It mostly looks like cpreg related stuff. I guess it could
> become cpreg.c?

It is mostly cpreg stuff by volume, but if I were going to try to
improve the situation I'd start by moving chunks of that out, e.g.
the PMU related cpregs and associated code could probably
going into their own file, similarly for the generic timer
cpregs and code.

helper.c also has code like the "take an interrupt" functions
for A-profile (arm_cpu_do_interrupt() and the things it calls).

-- PMM

Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp102250lfk;
        Mon, 7 Feb 2022 09:56:34 -0800 (PST)
X-Received: by 2002:a1c:7918:: with SMTP id l24mr46359wme.91.1644256594843;
        Mon, 07 Feb 2022 09:56:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644256594; cv=none;
        d=google.com; s=arc-20160816;
        b=f9n6slDi8aDi6P/yatqA7PamedSrwhC9EDxd/4MW8edmER3VAfEDE+g6ei2xrwAk1K
         sD1t6mxN3MFUUHV11QPBXbXeqdPs5J3tWTHr7X32z9D7e4fAHfWRkRQP3mTSHi0ZtO1W
         fS15rkx6C8ek6YSZbPqzI1D0+ffRghB4MHxbHwmBRizuxldEShfyfovixwooowAL7Et5
         /f+d2l40DZTPgwnOfGZAlKETLHBY5ZYMsvPTFPZBcEBP5IiqHDFo1eE4lk3Uf1DrkR+S
         lcjLCYu4iUvgIQyHbNifKeWhRo1ZVV8TXuxV5POfMScWROhEuVjqkpWEJWlqwyCJ8zkN
         2qeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ncOGZfi0AyHsfCE6I9z5rxgLAhu+ZNTqfDu0iBPnsqE=;
        b=HRknFxPK/L/VdDR9O1WI9J0Ivryo+o2O620aOg4exgwXclYhzoWM9YBAqFFujozd9P
         ehbOWIadxfQXNtFrSHb02uDa5/FzNc7xwxtukTNT5s1+8Yhh0eS27OXtY75DoQNyYfvX
         MDACX5Hku0nKeEbKQ36AYRyD793SM7O/m+jmmIMQgSREifJe4OPQKiMFBpT4PPvwoe/j
         +/8sHHcbKQGcKU1KBgvYVwh7QYQ9TBkb5CIupTM/NV1jrV/x1e8rZiIMMFKbrMIkjDc6
         3WQ8cOf7ssSP+uJahk2jO3ARQT6nMty3z0qhXpo4f4H28Pdd34OiX6E/KxTAXUFxV7aS
         LPlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OvRGsCFo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f13sor20814wmq.7.2022.02.07.09.56.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 07 Feb 2022 09:56:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OvRGsCFo;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncOGZfi0AyHsfCE6I9z5rxgLAhu+ZNTqfDu0iBPnsqE=;
        b=OvRGsCFow557GV2nCUtXxw5+uuIkjPssnvClXW7S6LVD3a72WogClUMHU7S8h9ozmo
         QzIreRgSYEcEb/Asw6T2PgVMz/hUyTRcjcSekrOoO96CGOB8jkbQr3zSV0vwl3+3MaiS
         IRw7jKx4vDOKmqdF5pzHE1s3tnYuplHEF8X/YRaRjEmQKMt+Q8aBRJFCprtrJsu1v6sZ
         BYGRG2rsZz/odyWwVYQ3p9xUymdq1OOtmqaqmCQhwysDaqVQeSqd/Ihfuj2UjyEoxmxN
         lhoIqsZUw6ecKHUsqXGHrZnZNnyPMMEHLnlVmV6f0yExAuSGZP9WGZoNf4UZc2ZKbgEa
         jb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncOGZfi0AyHsfCE6I9z5rxgLAhu+ZNTqfDu0iBPnsqE=;
        b=fqFGtRTiEFVSOq8jpDWoqvL1a3VqA9o4Km9tz7NIz7iI+sp5exmCekBYDImiBP2PYK
         qUsCByDDirzH0AltmluNzphnsydPhPNNeODJx0IJfWOGg6Hma+1VMbdBoN5+kQ7/ZTb3
         woW7i2NwI2cMoJGU6ZIfj9FadpIBESuBdoBUoTa5HgoCwgMIwwmNUS60QW8t+xvEqZQB
         7Gyhz+23amxQZcG8akTGu2N+TF3zrvXHn9SrvmNJf7SXURM3XawxTnEn7brviJrNG3AG
         U0LLLhCvKFXev44GkygPp4hClfTwJC+Yi/7RDc1ei+05sfOqhE/8YsQxPy2o7BfzcnU4
         ajVQ==
X-Gm-Message-State: AOAM531HjAgb8tzYXb8S75YcbpGX/WO3+YF1p3nHL8rVplTq5PhEKmU2
	KLoOeuYwqWweTR4e7EeQ4TVwIU7J9su2eozHLt9/+VnB
X-Google-Smtp-Source: ABdhPJyMVaEOizZmRdh2GkuAPYma1DR3Ot9L4SimshY/3jwHopzUUwtH89d6ADqdqKJEsGerm99I5aqscVtgxVAjoKc=
X-Received: by 2002:a1c:544d:: with SMTP id p13mr55243wmi.37.1644256594553;
 Mon, 07 Feb 2022 09:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:56:23 +0000
Message-ID: <CAFEAcA-amg4fT3jUwcvp+Z5Fi0PPN6Vi7TAVm=XARaw82LYEtg@mail.gmail.com>
Subject: Re: [PATCH 00/13] hw/intc/arm_gicv3_its: more cleanups, bugfixes
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: DKx9mO5pfHbU

On Tue, 1 Feb 2022 at 19:32, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This is another set of patches to the ITS emulation; mostly
> cleanups, but there are two bug fixes.

Applied to target-arm.next, thanks.

-- PMM

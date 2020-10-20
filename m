Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4867855lfa;
        Tue, 20 Oct 2020 07:59:25 -0700 (PDT)
X-Received: by 2002:a17:906:1c50:: with SMTP id l16mr3524571ejg.144.1603205964952;
        Tue, 20 Oct 2020 07:59:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603205964; cv=none;
        d=google.com; s=arc-20160816;
        b=L/ENs4SJLlyY0vVyVQjGHOCbXryZ8AMPjQpHqAWjIH4lO8mt6R3G0WvHRVgYMAEvNp
         5YGzazBdb4poxXv1aEKY21FmZTnCXN+025b6E7MRA4+1mCgTIN/iWbSPdTMgXaR/UAOT
         HdJOUyLyuA8ljHZBu/m2EnBFNeB5cKlMcn8mTDqc7DW00qmLB8QE2nGfz+g+xzu5bJaJ
         lV56QqQSyRa59R7aL57fPAdBgvAUDZfxgLe/pTf27DZFL2OcLUWLOMeq202pl9OLIc3c
         Xzyackv9PamIipBthfhcNsXyQZ4/dRH0enF9jycbjplf6eTQ/4Q+nd/GHwSybxZVhsvo
         vheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7bkquVpcEoY4NqgXc3bLKM+R+Z+x8Z9TEoN7lITSYec=;
        b=orz8LpTW5vUDzQHX6XKlM+QmCf9rP2ZB+tpyoTROITz4u/WHA7B81nzDWskRFHzVko
         52GGvCkqPeHORcVGX56F+fwQznc0yhDqvaXkY6jhbClHv5IEfvNj8T72VZj7SVETq2zx
         IVpcNTM0a/80uCvuqrPXOYrIec60fDCrmzNbaZumNSg8r0/GzLkIiqJQKyvRwZIRPT+d
         xtNotsO0XpplaRx/qNiF6msURLP5kyavnwtarZd8NwuJTQKGB3l/KGCsZFHLsHpFgmTx
         LxifGeUdHnte03yJWxct2ZmXGUxnK1Jwbg7RvPR68hgR7GM+SQMzZUf+WqXvL3dTtzey
         /dhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wtv8ZrF2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p27sor1301678ejc.69.2020.10.20.07.59.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Oct 2020 07:59:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wtv8ZrF2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7bkquVpcEoY4NqgXc3bLKM+R+Z+x8Z9TEoN7lITSYec=;
        b=Wtv8ZrF2lwHUaqWYCidG6l9VKHHZXbuD6WHEtoXMw2gbonZbvEgCpl3nkBrEfm3dPp
         IW61Y0BIZyOruefASV2QiKnc5ULC3HcnF8UOKQSNyTi+jS/mJyR6a9J8Z5uQtYcfkKvD
         v2EIBI5QQJin5CuYIQCywQopnE5ayB0g9CrhmeBsCxlnWIuHW0dBQzaLqWakRCCCmUja
         NNZ5SHICQaV1QpqWFGuDSg5I2EKKs715aBVUVt0YbMyko9lzU6kC1T5Tg/A7kMi+/8uL
         BUrHB/aGbjvu1iP0Cgs+pyOKyCvroyi1Xezo3s8PKHI0V6WqxEMFwqHNTI0DZGiKPjhS
         ulcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7bkquVpcEoY4NqgXc3bLKM+R+Z+x8Z9TEoN7lITSYec=;
        b=HeXHPkXxHfCg9fhkwDYt4rMieaVRs7PXot+9rXaoeqXr0KAzGrcD5zuCgFU0DuEyKf
         KVX+9g5iPc+rHwxDp/UuGH9S/R9xWWUcVFRc5+mid13dBSNLOtzbXnB5G+YeZzc/czVD
         XP/mzaEdBuz6p5nw7bKofnZtWq49YQp3YcUiEdO409dBhU4H6oSl2xsD/JKrsMRrdjqb
         JCygRHFNycD5XWuW/wYm4lUN+mVkFv6AB+cJumhLmTW18m1ZValu7f44hBEiJMhWglTs
         F8nu6EUKcXbFjTyjPntaZ0t9yunQRu0BG+gFv7m1vHTg91yEKsDX6UVwjZjfJGku8phW
         f2ww==
X-Gm-Message-State: AOAM530QfTnTiW/Kw7KmREidWQvwXiDnTR3xqG0tEyV1PwSuJJ3bRkBj
	rP1xcII2swqk/MMRLcTGjsi81GBEVOiS4s8vetAh5P48
X-Google-Smtp-Source: ABdhPJwiIWP4ZgP7rw2DvquwHSxNsrNS//2UKedOwf510yYoamEB8jw+BsyXTF7pZvQflUu6FcOQ7tXdpSCDmDX+XLo=
X-Received: by 2002:a17:906:c7d9:: with SMTP id dc25mr3537819ejb.482.1603205964676;
 Tue, 20 Oct 2020 07:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20201016184207.786698-1-richard.henderson@linaro.org>
In-Reply-To: <20201016184207.786698-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2020 15:59:13 +0100
Message-ID: <CAFEAcA9PAz0_r0HGqgcmXmFnB_of6f2X_QA4M=yV5WmoonFYbQ@mail.gmail.com>
Subject: Re: [PATCH v11 00/12] linux-user: User support for AArch64 BTI
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-TUID: +jDrKRdLgYYh

On Fri, 16 Oct 2020 at 19:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The kernel abi for this was merged in v5.8, just as the qemu 5.1
> merge window was closing, so this slipped to the next dev cycle.
>
> Changes from v10:
>   * Include Phil's plug of interp_name memory leak.
>   * Convert error reporting to Error api.
>   * Mirror the kernel's code structure for parsing notes
>     (though Error means that it's not exactly the same).
>   * Split aarch64 stuff from basic note parsing patch.
>
> Changes from v9:
>   * Split what is now patch 7 into 3 more (pmm).
>   * All prerequisites are now upstream.
>



Applied to target-arm.next, thanks.

-- PMM

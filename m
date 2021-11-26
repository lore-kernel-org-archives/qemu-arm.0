Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp926790lfk;
        Fri, 26 Nov 2021 08:53:04 -0800 (PST)
X-Received: by 2002:a1c:e913:: with SMTP id q19mr16779590wmc.87.1637945584218;
        Fri, 26 Nov 2021 08:53:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637945584; cv=none;
        d=google.com; s=arc-20160816;
        b=wuZTri6GthHtsnyPblVGJxRYhNNqRI7eGG98LIx9tm3crXELDHttpp8xKzpXrCWQGL
         fnRvPlbhdno3WS3Ns8FwexhWUST2lNt2Zq4VhBvh3XOJbDk02bTIW0cDYJvrqxMJA6m/
         k2pjX488yre+hPySHxndZ46JxbWN8jebe90IDAi/3OA9jRUzV8U3WrIB9LaLxTIGpdsy
         MdOZzdx9z3vm7EpzwrcXSvxhYRb4UW5NfHOJUMOl6vHnoU3ztGtj6pJH/VB2x3p9clA/
         PY4vlAmvFL//xphKRhqETTxashdJf0xexWIm3ytKZb3n58+IoAqCHkuSdrOi/6+WIlBZ
         5zLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H/c4Lfwu289fdqtW7jGN350pH2xZCNFAPPkgTLrF72g=;
        b=BVZQ2J/Ee9punkwrUZYMEa9a7XPZAf0vYv8cVzfGdhmRUuabu4eZgSA9i/QSm7sV9d
         p8rrLcZLdjNIBoN3BV/dABomiYJdd7i3J0OOeLT/RehL17yQhQHngWpsvKatLQQK6i4o
         BJsjkhf4BWJty5j7F4CNCbPdtMCSc//tsyQzADr8fduXbqsIovfE2DeV2hWxfX3qk+zc
         pSqqCiA4nGKaA5xeY+4EAz4blw0ORr9eVNgcSkEMUC4eKR41/MDk2RLFD/e2BuXPPZ87
         Q8nxvCvE2hi6x9Od1MABofSVhE2g5IEJ4smxZTBJLLFqOwMqzbhY1NWQ/fowuXsRCVGL
         aubA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nUfL7tj6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bg22sor7114315wmb.25.2021.11.26.08.53.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Nov 2021 08:53:04 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nUfL7tj6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H/c4Lfwu289fdqtW7jGN350pH2xZCNFAPPkgTLrF72g=;
        b=nUfL7tj6WuX8DqN3WbRiUYfikLpmq29JssEBwlYRnKQHgCmClIboRVgp2Ow8Uhxcjo
         9YdT1EDJHE8YXP8Lys/GhMrWVo01d5kVZ9m1/nJWKNAwfwSRIKDOr7PAC6c08vskkeks
         7A/WmY4z1W8doNkDFswQmATKv33l9bif5V748Q8ckXci3hCZ2E4OBiof1T7J+kaKKNva
         dmA/dcR9ojMfZ5XXjDrXZ0jovCXcEv2fzYjVEj/0Xc9hFfHjNDLvCMv9ip8ledrmUJIM
         WoIsPPkyH/KRnVF31Dc2yv/xVyOFJ10e4bjrGkhN2a9q3/2IDZZetl/qGx2hN5j4dB+M
         qXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/c4Lfwu289fdqtW7jGN350pH2xZCNFAPPkgTLrF72g=;
        b=aDAKXkLr1d6n54viYvHfVg1EEIDhiQbb7UVuklhXT1EyY+nZWdQqFQlmVqIobyqOx/
         Ggi6kp10pP251apZwBz8huWUHitPRmCsC04ewSUgeuG0MR2OKcnZ+LZtmE1myGNSyhNB
         y5WtRQEL9QJxvwa55R2VXlWoMzF/q/FSYQqZlbQDNJhTFHyt5IXqv8KUYm2VCpGNMOsd
         Lgwi7xiG0eSJQTUGO/bbtg/2mNF+JMXuF+ikdcJ1cRHQgP8fU7qVWKaRp/vp5/Nfd12n
         nPRQ089CcEc7hzYzzIVB2pFCgijTJCp/rRP9qAqXED8HJRd7L7fAotI4sHr5VmvO8RKk
         xwDA==
X-Gm-Message-State: AOAM5306ZyHUBZjNrdHvLzHUbeCTI34zL58IEYV53rhL325oCLP3+f8W
	L2aZWK+mJjJr4MfwLzfW4rJB1hWOrO8a5dyOFzbhIny/
X-Google-Smtp-Source: ABdhPJwP9eqrWt39so7h6rCQcnLsCq7Vs+FrhosaCd1wSYVF2hFlnoTgYlpwoLi+/s/8IqV80bdOL4xQJeWLid6/gHc=
X-Received: by 2002:a05:600c:22d0:: with SMTP id 16mr16785796wmg.37.1637945583837;
 Fri, 26 Nov 2021 08:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20211123122859.22452-1-agraf@csgraf.de> <CAFEAcA9ceorf5YK+yKS8KGfHPgFDTxWkLyfva0NDmkrHV5zz2A@mail.gmail.com>
 <5c36aaa3-158b-815f-3e71-badfe2d12632@csgraf.de>
In-Reply-To: <5c36aaa3-158b-815f-3e71-badfe2d12632@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Nov 2021 16:52:52 +0000
Message-ID: <CAFEAcA8Mb7tFw4pvG3td4G2w83Q-O6RP2X102b5CHp-PhFzJ+Q@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Extend nested and mte checks to hvf
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	saar amar <saaramar5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: vK6xGQL5/D/K

On Tue, 23 Nov 2021 at 14:00, Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 23.11.21 13:34, Peter Maydell wrote:
> > On Tue, 23 Nov 2021 at 12:29, Alexander Graf <agraf@csgraf.de> wrote:
> >> The virt machine has properties to enable MTE and Nested Virtualization
> >> support. However, its check to ensure the backing accel implementation
> >> supports it today only looks for KVM and bails out if it finds it.
> >>
> >> Extend the checks to HVF as well as it does not support either today.
> >>
> >> Reported-by: saar amar <saaramar5@gmail.com>
> >> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > Without this check, what happens if you try to enable
> > both eg virtualization and hvf? Crash, unhelpful error
> > message, something else?
>
>
> The guest just never gets either feature enabled. No crash, no error
> message.

Thanks; I've added that info to the commit message and applied this
to target-arm.next for 6.2.

-- PMM

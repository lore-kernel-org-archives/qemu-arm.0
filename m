Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1692975ejf;
        Tue, 16 Aug 2022 03:06:21 -0700 (PDT)
X-Received: by 2002:a25:dbc6:0:b0:687:9b7f:9310 with SMTP id g189-20020a25dbc6000000b006879b7f9310mr7927897ybf.178.1660644381601;
        Tue, 16 Aug 2022 03:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660644381; cv=none;
        d=google.com; s=arc-20160816;
        b=o2dBlSkv4KXafnAQZ7UuwNeJktH9wa4WQSKaUrgivNsqXQdnAEgKlgNQNYdk84flz7
         oCgmHho+0xBN+nnGQ4YKQebKaiZLpKhLULbr7d66UMXTKz3kdWrMoXOQRma1XofaW00P
         vkkZu5LIUwaIFTdy+MeJKehwDoiioU4toDI09jNpNLUUswsYElwEKC4ciJc1RkZRg+Xi
         9wpSlt0FtHLqgZyBhEyP02LiuOaGdYJGQj3H7wgjvxvZhQcjQLYeDaI/mzymSWtp30n9
         jGQo8DzrpeAz/hs/IQ5zSw6ED45XlOi5BYqS6FclkbBfyhUG/R4pbjs5uhX5rrQCqRKL
         S6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nj5CYFBzeUSey2i8rGPQhDmgbPxh3BPDWQVX54U0AUU=;
        b=H09tpw/Ep/h+36ZUdmtpDHha0pryo+b5rCzFIcZvGqZQ3LBY5Ri0W68uzqvN6jOXBr
         HvHf8fOrDxAm3cC/SNWaVZG6exlO9OZV4T6aPCtDju/As99NyE5LDVNvysc7z+VkquLP
         76KbaIW8/asqyIf+d5egj3VZkT9kh3ZSX/Njz7fRjLO/p1vmDMcuijOCbhLwd6oKZivI
         WI6jzFS0CdgD4lYBZZ4GCBEAwPo0y3K2uffHQO6sU6VPWw00Zz5N9DSt0b09r0DrHe1o
         tpPshgGXh+AiS7JJW+1wm/tCgOwMU3h49Hf/minK34fd5YYVQefVMj/qoXwVH/0NvaXH
         SnYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDnjUQ8o;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z2-20020a5b0202000000b0068620abcabfsor3448992ybl.111.2022.08.16.03.06.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 03:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lDnjUQ8o;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=nj5CYFBzeUSey2i8rGPQhDmgbPxh3BPDWQVX54U0AUU=;
        b=lDnjUQ8oLG8axquGD8OqHK/vSl1oDd1vrXjO/w3OiC/vzsxqW5LYT89WLOVsEQAqEz
         3LlT1PYMPJJw8AmzxAuZIQcOruyzl+Hc4RbcgtQtawjec2tilOXR3Yt1D/ozq1iGE6FZ
         gPuXrwY1yXtFXLyF/5JunCfj0o/qyDqsRcEeH5HseTj7Lbyorg0aUjkD1dNwiP6MoeA5
         xbxLgToz/wZLRCBNGLqWk447t213aBiJXQ6070XDDwZmM1Oe6R0NbqawM38vv3N8lArb
         XoDHQkIOr7l8tsiMOPwX8gOkP6mZ3fupLyvcGRZIRpPBFgzdbObrvHbA0lG0ZWABbvjH
         w93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=nj5CYFBzeUSey2i8rGPQhDmgbPxh3BPDWQVX54U0AUU=;
        b=nX82xZ2BGcg/ntlEjRxBMHxlKGnhdYZYrnyK5XhpDu7+WwKKGN72Xeh2D4wzt+GbGs
         54RyJWmBwwNb9xpqAB+V31CDcaVzNvpo0pc454Dqt3704So68+5ZDabcVin6mUdS1ef+
         SPIN8YOMKJHn3VrNSWR0W6ZwYGy7HCaSUQnN7wVb0Em074wnRSKtHF0m8JH9watYVOQj
         8ojDxw8dFNrkqQEH/wIZsZ6GWZss7jP3z+zC4Sw5153FdCRnHOxcM+j8vyXzVs5Ddxp/
         hARRH8fuHCrOsxGEj0yyeWsmzDqSXFDlSsNsc8fAYdduIwxVbkiqz9BVBv2c0OaIh+et
         uLiQ==
X-Gm-Message-State: ACgBeo3mXkU+D4lxKNfHgFrvjMMTravtntp8Clt+FSRQ/kmtK2sB5keg
	viQg6KZ6lZGwVfqWw/CbWgM3I7pCutxIJt/E7UYBjWyIhC1raQ==
X-Google-Smtp-Source: AA6agR6xdZkurRaeaSnddhLsRh95GjMHu3H7Dj5Req3MIrdmnMvJ37kZYo14keDq+anHMJjx6cqA2uOQKUzE47vMZVs=
X-Received: by 2002:a25:40cc:0:b0:68d:5ef2:67c8 with SMTP id
 n195-20020a2540cc000000b0068d5ef267c8mr2517617yba.39.1660644381216; Tue, 16
 Aug 2022 03:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtCPL0rRU9Q=s6kUFDHjC5uUmx2w=ePYMMaib6vq57g48qk0Q@mail.gmail.com>
 <CAFEAcA81OfC_Z_uQvrSRUKHQf4mmOgbLrHYiwsfzmgH8u8sUqg@mail.gmail.com>
 <CAJtCPL3yNpNkK0Ljzo=QOFX_gLQtGGcqDoomwJ+RH0hq5G=YQA@mail.gmail.com> <87r11gbjbv.fsf@linaro.org>
In-Reply-To: <87r11gbjbv.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 11:05:40 +0100
Message-ID: <CAFEAcA-6X=ptfDXGWA79-L9kRCQRq6jtci7ODPy0Ct369_EvCA@mail.gmail.com>
Subject: Re: Teensy 4.1 Implementation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Shiny Saana <shinysaana@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: PCaYtz7seBgK

On Tue, 16 Aug 2022 at 10:59, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Shiny Saana <shinysaana@gmail.com> writes:
> > I personally don't need any of the GPIO interfaces, but if needed
> > by someone else, that could be a good second step to
> > work on once that part of the board is implemented.
>
> Handling GPIOs in QEMU is fine (we have things like the qdev_init_gpio_*
> functions to handle them). The problem is usually what to do with the
> actual general purpose pins which aren't wired to something we emulate
> in the board. Some boards expose their values via QMP properties but I
> suspect whats really needed is a generic mechanism for exposing GPIO to
> external scripts rather than have every board define it's own thing.

Yes. However one key thing for trying to get a new board model
in is not to get tangled up in trying to improve/extend
the core QEMU facilities for something. That's much harder
than "my board model supports GPIO output lines to the same
extent as the other existing board models" :-)

thanks
-- PMM

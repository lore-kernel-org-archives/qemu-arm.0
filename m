Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5511675wrr;
        Thu, 14 Nov 2019 06:04:37 -0800 (PST)
X-Received: by 2002:aca:4dcc:: with SMTP id a195mr3667275oib.172.1573740277716;
        Thu, 14 Nov 2019 06:04:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573740277; cv=none;
        d=google.com; s=arc-20160816;
        b=zzuyZQo+chWGnYf9r2BAUYoutNG0CNHYFyPhHOjRcrrPff6u0RzkqqbA+8Kd5fCKpA
         VMhlI1ufYnLb0LyDJEodzX91fF+i0/QpN+nlOoB+YaSk3UyUT6KsKl14Xhnxfz9gh1aT
         Kso5Dz4m3DL/vdQTDLim/NiNexfm3oRorObDXz9mI3TDEprLD0TEiPwLGGmy9TJrligq
         tcZssF6GW3xzQXB3ko3IAAhc7Za2wo0wDmsM6o9eUXgcTkKGc+6PrOatI3cnwTmhzR41
         CCd1ymlUoqL62OafWlTnAhW6UbP8fLpHsq6JHq9kC3YCuJ3Y05fgisBXGMpzf94huFfd
         5t3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gAHuiqYzriXcWQl6W1mUt0tVDpXt9KikOjxABSOQxIY=;
        b=sSSVVEjxrNLUAhTWCSCcKgYfrXGP3Oc0qjn/g66sQqvZRhGaIQGCnssOuE2duz5Mle
         p0TuAPlZku6A+xLeHBcUhX4ZApv6IjZHWaWjf/TbJXbvbc0FVpj5Tl8qFrIcmjGKxP9F
         DjYnh0dLm1b0IW8W3swy9YYSmyc5aXiyIrYPJ5Ojnd+UHdQXV+5//a3QMvb/x3ns/bdY
         K/3fdZsMVpYzIQabRiQ6ipdR8DJpIGhAcWWAF9IGi+AUn9KRi4D9craQF6fVf3D733b7
         4YyEuX+SmDnP+xg+mSFFCuEPYBmoy9fM8nhWP0cN5WjvFx7OnbezMN6OqrjeWXYVdYoS
         DDNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZrpkloZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l7sor3087981otp.57.2019.11.14.06.04.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2019 06:04:37 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZrpkloZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gAHuiqYzriXcWQl6W1mUt0tVDpXt9KikOjxABSOQxIY=;
        b=lZrpkloZvxksKyOyT4xO8APksXz1nN7ue7BD3OPbFV0a9t1X5bTjCl2KOoUsJwzdS2
         BxMEH27xM5o8T+7Dop28+pxYzZ7sU7SFjm9i1oueqprZruvZum0ZcWiIieNCUuQnPQVE
         O5AbEY8udX122P86VuS0vswUgh3+5j0ylMmRxPn153SF2oZiyQokCyHkmDcOkQZWVyIn
         m6sMohZ8UM8ZahXIvbFBNG84UGwTG7V02X17U5TRLvTtjO6SnOdq0aWnORyQs3y1Cvtg
         EtRtz0M2Cl/HH6PgdodOaMwL4ZOvVCyAWtNx+xRQ20WRkyP+ogIAgcD9Ae0EvNHk18RH
         +c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gAHuiqYzriXcWQl6W1mUt0tVDpXt9KikOjxABSOQxIY=;
        b=dn6cil6aKu5UPsCuyxSeDOPyK5Q0DyfvBkHlJe+iJm08FrCMys+dMlBDIyaT1F+BGC
         DYoEqAuyIFCaN2M45bRNwttQJI5xmGiyOzqYcguQapc9207A0Ui+sivofc1r3wX9It6T
         XlIhLe84L3w2grGD3XX6YiuCizVsA/RlZXISMCvH1xT4htVqVNSDIBWMOyLjKDT7hClQ
         lBKEnRHvBGXUpkz66vjJEVTjdMftuB3TZdfp72ol9glA4UrOss9mfgLe8Tp5dP1AoFji
         egDmEQAJCa4ZA7QvpREgPrdmu0TtxGEtiqEGBXij5R5Xs6caSRRV+QIkpmtuDFJ8OHsY
         h03w==
X-Gm-Message-State: APjAAAVFc9rI6fIMEyJhWLzlH1sCrH84P70kmBbsqR2ZBXV9qRI/8+2u
	We7TD1m3nD/wx3GqdJ2XG874BJ1trNKjj7LGecpf5OAu
X-Google-Smtp-Source: APXvYqzgRYBLyEECUugJsXRqdWSWbpF0y6DO3fKtsXTD436ZgAXCqNmqnIbpdXG8X2OS9upbFKezrA6rDseRVi/X49A=
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr7937645otg.232.1573740277247;
 Thu, 14 Nov 2019 06:04:37 -0800 (PST)
MIME-Version: 1.0
References: <20191113221301.8768-1-joel@jms.id.au>
In-Reply-To: <20191113221301.8768-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 14:04:26 +0000
Message-ID: <CAFEAcA8AL6865u8KaY3HjRH19mTP=JUJ3FAgf9VezJYPOEbmBg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] arm/aspeed: Watchdog and SDRAM fixes
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: GeX9W1c60uaS

On Wed, 13 Nov 2019 at 22:13, Joel Stanley <joel@jms.id.au> wrote:
>
> Three of these are fixes for ast2600 models that I found when testing
> master. The forth is a usability improvement that is helpful when
> diagnosing why a watchdog is biting.
>
> v3 adds some comments and fixes whitespace, and r-b from Alex. Thanks
> for the review Alex.
>
> v2 fixes some review comments from C=C3=A9dric and adds his r-b.
>
> Joel Stanley (4):
>   aspeed/sdmc: Make ast2600 default 1G
>   aspeed/scu: Fix W1C behavior
>   watchdog/aspeed: Improve watchdog timeout message
>   watchdog/aspeed: Fix AST2600 frequency behaviour

Were you wanting any of these (or any of the other aspeed
patches currently on the list) to go into 4.2? None of them
are specifically marked as for-4.2 bugfixes, and I don't
know enough about aspeed to be able to judge their importance.

thanks
-- PMM

Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8751912lff;
        Thu, 16 Jan 2020 10:45:25 -0800 (PST)
X-Received: by 2002:a9d:4d8d:: with SMTP id u13mr3056221otk.299.1579200325025;
        Thu, 16 Jan 2020 10:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579200325; cv=none;
        d=google.com; s=arc-20160816;
        b=S/r85QJ68SUUVp94FH3iRziCZzPhhoPsTjDpSxs+HfcdCbkk+ISCPUabUWAkxBHxNF
         sYATl1thKise0lK/P4StUSS9MQJ73nT6U4RwNwK0xa3P+G9jcaYpB0Z1rk7dJn+IJHPa
         o3qH6aU8mzz7k+M05oxkvFZvRQa0asYMohA3yfjHm0p6uoWdKzEQ5z36i9Oa9Dtcbiy8
         sjy0b8RG7Pcr0ttSUP4YnchFgbBHHgW9PQRuLPdLqWt4vjYcHU78F/5Jc8IGijANcrUG
         1TNvSDnULw9/xNbdtzZ2at//sCy93IB8nzZal3G4XiLVY8a9Xl5mW6HimPFNYOP/rUyr
         lp6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TR9f1ok6iW3VkN7SoUvSSrDpC6U7lDL9AuOXaWKii4w=;
        b=ycHIAovzWNSFAW6L8hNQJzlojM97tUMmdV4kN18U0HcZpWL2so//F+toXnbOU3w70D
         bK2a3M3sphu8h0oeWyEwlNQqgOm7Exq6itzWg9aC+PldWR30TEwOgZAJDx491xebLrrU
         qgriA4LA18AnR+DZ22bi/+Mli5885UsySBmngm2mMK+kavFveWTG0gBuAVsEBiKaA9ih
         ZLnAjRoYn0DAzQF66bvkS5WvnUsRALFL1Io3cCVc24m/Kr0ADsqpYLr1e/C3DCYD7fTB
         HqD0rEILfB3s3Hvx6xhuH7OFJZVkEosI4OgIfZKZnf2pFwPjvAZRysJBsKH219+8fI0k
         ny8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oyiVEyYU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id c17sor11824589otn.118.2020.01.16.10.45.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Jan 2020 10:45:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oyiVEyYU;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TR9f1ok6iW3VkN7SoUvSSrDpC6U7lDL9AuOXaWKii4w=;
        b=oyiVEyYUbvEHYxDkO37+T9kqj/t4aq5GYH5nF49NCaYwwPlgCEXiirOMQhE/F3n2tf
         Rg1wNsEVwy1Hv+By18nv/cv7h5Htd8KX6s6mQ8OZayt3NDpbplms0RePcMDJEmFSoi1s
         /Ouolg9gCvJaFJJDEwKDyh4q2fCQhRgnbjktdw314wdP7F/a2c3BsMWpbtdAho1zgTBv
         6uns2fJjV5LNjBLFiIiXsUe0xsgnFGGp0hKqNVNU2D+K8lbS8mmQBs9mRGZfeDn5mxVU
         wP9Kw0GGbZBnX/sb4p0vgMonXGDzNzrVbnKXzBhnYJ3nuZbE9hHXuAZjXM+5iAYRR/2N
         r4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TR9f1ok6iW3VkN7SoUvSSrDpC6U7lDL9AuOXaWKii4w=;
        b=Xc+Yti4MYKGZoJBbYgP2V4OZxj7HALxI535hri7nmaTTe2rkQsOjEU3ilLlhNSt67f
         7qLmu48phePKXLwS6kGQ1GVM1XEMWr2KWg+oM5uuhPtFVlLEHoy+yxyfMeDu1+5R1Id/
         h+pllT7c4W7w3QiVmMCOlq34zD42+qFmqWtf0ywbYPILo46oB/9WEoyg/WATdF+964j2
         T2w+qPLbGpQwuSjtozii353aISStXzNYXobNZusWV2YbgU1P27otvbQBgGZrfVuQVDFm
         ImquTq1UpU1bq0a0PlUsnbzciZ6VyAIk3Ula6TuIkhcBxZVrBLL7FEzQ1ijp3ACyrVgX
         AIxQ==
X-Gm-Message-State: APjAAAXlAET5Nk4iTg88PeJsJUpSPC+HMiswXXt+GkYLyHyAJLT8mogI
	hO+bqJ3iZl7iWQ+EPbElO0YVPeaMusF5IpIVycHLEsdw86MoUw==
X-Google-Smtp-Source: APXvYqwa4EPzfP9xdOFoZbiT+5NEaYYybMg4bsvicufUkGr/0nbm2k3Cy6iTqLNnJLVRrXWFnes8pYxRzwnnq9cUoFg=
X-Received: by 2002:a05:6830:13da:: with SMTP id e26mr3017295otq.97.1579200323297;
 Thu, 16 Jan 2020 10:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20200110161626.31943-1-alex.bennee@linaro.org> <20200110161626.31943-2-alex.bennee@linaro.org>
In-Reply-To: <20200110161626.31943-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jan 2020 18:45:12 +0000
Message-ID: <CAFEAcA9nNH9pu+8E_YYkiNtzePjZdrEBjK_9zJv+XJaSvcnhmA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/arm: detect 64 bit overflow caused by high
 cval + voff
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	1859021@bugs.launchpad.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: h1rOrlQzKd+u

On Fri, 10 Jan 2020 at 16:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> If we don't detect this we will be stuck in a busy loop as we schedule
> a timer for before now which will continually trigger gt_recalc_timer
> even though we haven't reached the state required to trigger the IRQ.
>
> Bug: https://bugs.launchpad.net/bugs/1859021
> Cc: 1859021@bugs.launchpad.net
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/helper.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 19a57a17da5..eb17106f7bd 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2481,6 +2481,9 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeri=
dx)
>          } else {
>              /* Next transition is when we hit cval */
>              nexttick =3D gt->cval + offset;
> +            if (nexttick < gt->cval) {
> +                nexttick =3D UINT64_MAX;
> +            }
>          }

There's something odd going on with this code. Adding a bit of context:

        uint64_t offset =3D timeridx =3D=3D GTIMER_VIRT ?
                                      cpu->env.cp15.cntvoff_el2 : 0;
        uint64_t count =3D gt_get_countervalue(&cpu->env);
        /* Note that this must be unsigned 64 bit arithmetic: */
        int istatus =3D count - offset >=3D gt->cval;
        [...]
        if (istatus) {
            /* Next transition is when count rolls back over to zero */
            nexttick =3D UINT64_MAX;
        } else {
            /* Next transition is when we hit cval */
            nexttick =3D gt->cval + offset;
        }

I think this patch is correct, in that the 'nexttick' values
are all absolute and this cval/offset combination implies
that the next timer interrupt is going to be in a future
so distant we can't even fit the duration in a uint64_t.

But the other half of the 'if' also looks wrong: that's
for the case of "timer has fired, how long until the
wraparound causes the interrupt line to go low again?".
UINT64_MAX is right for the EL1 case where offset is 0,
but the offset might actually be set such that the wrap
around happens fairly soon. We want to calculate the
tick when (count - offset) hits 0, saturated to
UINT64_MAX. It's getting late here and I couldn't figure
out what that expression should be with 15 minutes of
fiddling around with pen and paper diagrams. I'll have another
go tomorrow if nobody else gets there first...

thanks
-- PMM

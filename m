Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2694808njk;
        Mon, 2 Dec 2024 02:57:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjcaDDbEDuEgdgi+Tvojm2mN6rv9SbqX0S/nBvaTV08axBrDtV8CJ04yoJt/S5AEAjRFmnDwYuE/AJuQ==@linaro.org
X-Received: by 2002:a05:6402:2788:b0:5d0:d330:c965 with SMTP id 4fb4d7f45d1cf-5d0d33227a1mr8187066a12.0.1733137064333;
        Mon, 02 Dec 2024 02:57:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733137064; cv=none;
        d=google.com; s=arc-20240605;
        b=HUUHwA8R861l59oRpB0ePkMj5Lc8modqzmRS/T+Fgopmt7whagjwpnG7jbj4PJeuEQ
         86B2XPfX9vxapmHt2jXw3VxW2XaMmY7ZM/lmmZZKThL6RlUpsj6x9ya+jcAA1x/bVXBA
         029lQ6wO/oVW5I1Ue9nWQY+qVG7LGMSxc+nv1rcklhwaFUiHdKtgbG24eB1vOhDcE0Dh
         UQsRmb62M4sxf8r66xSYpLqUQXrqqStgxtWSOdU1oaDotj3Z0rOBsNXwsyX7+trvvYcN
         fUXGA923lbmGlX+rGFpmz67S/5v7K6kpbJN6I6OkrpM62uQF/sunMTuYcsrwRb1kpbat
         A7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H/W1MgRVOSe8QGGE+aad1/X/nTuM1X5/7SpJy8wQRiM=;
        fh=PUg3eAOidGk76UxSGE9G7CM4nn6xELsw84J8k/FJzhA=;
        b=dvEc62l6T/MD73z5JunjQ/GvXD0KMl9OUDA8M9CDwZZA6F/GT9VBFMYiDCEZNrBj9Q
         vMYsK6M5FuYtkeLODERFhiF5UHb6f6R0f7nXxHgU8S0fI3eL3efXiaSuyO0y9TiH/Q3p
         HwqR7Oha5drUIpFdKY/ms6CNTerKCLfw3pLLcXuLfLY7Qv4hyP1WmxDtj4WfUgtTrDDZ
         LnrUXfjpkFo3KzGg9tXq9rkBgGv5MLUnjg7/kHaPZRU4fgRbfSgX+G0j7sb8rRr3jEt1
         uCa3tAOnc9h6t9IFeIaqfwMiO7jE9y5cwP0unzF+75E6ZExbmusloj/oWQ4QOPDfcH74
         i/qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uj1xl4DM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5d0c5ca1b75sor1529726a12.3.2024.12.02.02.57.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 02:57:44 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uj1xl4DM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733137064; x=1733741864; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H/W1MgRVOSe8QGGE+aad1/X/nTuM1X5/7SpJy8wQRiM=;
        b=uj1xl4DMlRvGr2/ucH4/ghrLKxL75ZCE0rPCZPih1/j8IuWWGOYod2LrzJ+WRAZZTB
         xw+8sa4nIPfA2oLLs6OyIgqEg2TdUvwuyGstkkpnM1edIXgEW0pg6nit/Rdw2lPZKB3e
         sWg4LTmJMNzbQEGFJlXh4X7pvPsyRBz2pjJonedZ2hhJioCHN5g5/2/GlgSvlxlYy4LW
         6YeBCuCAk+6tjq5gJIDoD8QQOg6Ddb5MgFk2B0i2F0Vt5uAwVdFysO5RwC6x5/j8n3Gk
         dCnk/h0HdTTDaM+C27qEkmpGiqFUwcTIs12nqo3aZhE3E3xv0EomGI9RSJ8Lx5YEkx4f
         Sx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137064; x=1733741864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/W1MgRVOSe8QGGE+aad1/X/nTuM1X5/7SpJy8wQRiM=;
        b=duNqXeXFkoMXbU/glg2Us1+chNx1+qfu75YOw3mFmOrOH2UUFg6/jOzdL8L+Ms4qya
         QXwHc4tMtkldAL8jHijJGtbjxJPB4ee+RY0xwoUxnU89TGRCRCcMZuRAgT1n0IO1Wak6
         b5X1f1Tu1lXgmXFd8AAYHuABfkWgBKk4C+I6F2sp8u96phuij5yZXHvd74lS2DvGsXqf
         C16YNwEYwyz0J/hPLWtQbM6NViNXyNcCkw02smfjKK00Pjt3UBOC+ANB/TiT56F8H9FA
         rbUwV+JO+mmbtsak++j+/Fppy/Bw6O0YfNBpgAdYstuoKXed/tisbARJBcB0MoryWcf1
         L9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqmXeOw5dtVujZUy0BR9jdXwUN9PpEkK5Z39zisX1t8qIGq6m9/s1LQV5mPew+ENkflvkMOjR4DZQ/hw==@linaro.org
X-Gm-Message-State: AOJu0Yx8SlhXBnE5HvCrLJOaHR4989dRF7DenikU4VaNi8J93aP4S3Dv
	a0uH3xfwiOkt+2l7duw/KJVAWX6KuBSHrhdjZxeTXqWU3xZbmNcyMbDAlK2nwuV/2GhSDtHtI+r
	kIW3phX3oFSYKwaykmZOC9zqDNA4i3pOAsG8oqD7V
X-Gm-Gg: ASbGnctrScRxeHwd5HaAqwzE7Arv0rAkJaWjwzEdBI11THjK+twWUnAcwOsgWvG6gcn
	MBgf9JqfevBMLUSROJIhTHjWfj20tksSK
X-Google-Smtp-Source: AGHT+IHNci2ZpLwz83fd7J1Yh8ElgkNw6ZVFSvSNPOekzEgRjlw7nCJ/S2cycQ82rP6R3C2BxXrWxjicroUbhEpqfQc=
X-Received: by 2002:a05:6402:4402:b0:5cf:f248:7715 with SMTP id
 4fb4d7f45d1cf-5d080c48680mr21164623a12.23.1733137063789; Mon, 02 Dec 2024
 02:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org> <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
In-Reply-To: <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2024 10:57:33 +0000
Message-ID: <CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, alex.bennee@linaro.org, 
	Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Steven Lee <steven_lee@aspeedtech.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: hP+d2LExpuxb

On Sun, 1 Dec 2024 at 18:09, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> Hi Marcin,
>
> On 12/1/24 05:34, Marcin Juszkiewicz wrote:
> > W dniu 28.11.2024 o 22:37, Pierrick Bouvier pisze:
> >> This boot an OP-TEE environment, and launch a nested guest VM inside it
> >> using the Realms feature. We do it for virt and sbsa-ref platforms.
> >>
> >> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> >
> >> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> >> index 5c048cfac6d..b975a1560df 100644
> >> --- a/tests/functional/meson.build
> >> +++ b/tests/functional/meson.build
> >> @@ -13,6 +13,8 @@ endif
> >>    test_timeouts = {
> >>      'aarch64_aspeed' : 600,
> >>      'aarch64_raspi4' : 480,
> >
> >> +  'aarch64_rme_virt' : 720,
> >
> > Took 2974.95s on M1 Pro macbook.
> >
> >> +  'aarch64_rme_sbsaref' : 720,
> >
> > This one needed 2288.29s.
> >
> >>      'aarch64_sbsaref_alpine' : 720,
> >
> > Have to check cause timed out.
> >
> >>      'aarch64_sbsaref_freebsd' : 720,
> >
> > 331.65s
> >
> > So RME tests probably need longer timeouts or would not run at all.
> >
>
> By any chance, are you running those tests in debug mode?
> It seems to me that CI is running functional tests with optimized
> builds, so I'm not sure we want to support debug "times" here.

We do need to support debug times, because a common developer
use case is "doing a debug build, run 'make check-functional'
to check whether anything is broken. The debug times also
are useful because the CI runners can have highly variable
performance -- if a test is slow enough to hit the timeout
for a debug build locally, it's probably going to also hit
the timeout at least sometimes in CI.

thanks
-- PMM

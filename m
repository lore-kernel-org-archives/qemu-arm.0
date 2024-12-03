Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3572738njk;
        Tue, 3 Dec 2024 02:29:28 -0800 (PST)
X-Received: by 2002:a05:6512:281c:b0:53d:de12:ef25 with SMTP id 2adb3069b0e04-53e129fff06mr890954e87.19.1733221768442;
        Tue, 03 Dec 2024 02:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733221768; cv=none;
        d=google.com; s=arc-20240605;
        b=GJCPA8jTEyi+ISY9p9UBGDkSoy2I11N8xuyX102cA94WQHHokKR3J0pGFv5noATH34
         7g00nwjUiXjKrQMiruQi3YWlY8v9ERoSOJ7Vo+gnKid6TYHOWGPP8BGv5tjRtBkTHz0f
         H9FxeY+Kh/fbJFPLtl24n5lUehPobLqXqGZaAYqMOvzsRgjcVE6spEyyP8Mj9NC2IY2e
         K3w0YAxDLsb4MkkdAOUBc5P81aEFi8h6gH8obP+6cFuLVMQh+rJGZQqcLC+Cw0Kr24EC
         Urm0W07ZgWHnhGGMe44QUz6Ri0slP3qfSwBucXw6i6wPtD2fgwtQ+gZ/X2NvU/3/aX0U
         JWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f0Q8uqfRhDvrNswbuG1OfIJbALNB3zPXNZJaDrH+yhU=;
        fh=jzQ4EgR8EKxK8+SMSzQ/AsNAxKgQFV1EXS1f3hVD50U=;
        b=E1vwVLgYW0B9xedMU11PVtNjUjtVsjBMwc9wiDP6uxf1yRKIVHrw1qfCvww5EF/n3n
         D0PG1aeqoH9j8dKn8pSyGmY9E9j63u6fzp2t0Vbwv+jvFb92opSM9LnxRFvQSgR4tZar
         NFEmLUNHdME3T697HflEvSKifqh2ZvGn1Jn3g4yB4AZr6y8iBtBQOQEtLwimEVNQ+j/q
         /B9A/xOW+JXavPQRvTNCeLKgM7ChcdVc8kiWSOYRDjXksnSMHY3bqq3OiaynBXEiNy6N
         iTRPKxDdzW49tx46XtjnKuuYUaXajKaYcWAsp4hmXd6jIMUs+GpRqtX+e+i2K3FhtZQy
         Odbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DIfPNq0Z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5d0d45cfc49sor1489057a12.10.2024.12.03.02.29.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 02:29:28 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DIfPNq0Z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733221768; x=1733826568; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f0Q8uqfRhDvrNswbuG1OfIJbALNB3zPXNZJaDrH+yhU=;
        b=DIfPNq0ZU2HrAqftIhtaII85Zt9hutO3Z6MeGk/zexBRG1zOVUBVP6uOesXF8wzhl3
         c9Vn+1sm3SvM95RNlaA0j14CUA8lyf64FANpcSga0GIG/nxVMpFJVAKmWlAOSIlzVfM6
         eNN40o18fRdSy9pRViGkITJT/UHeq2eOiDpaTrIr+I7S1iMaSKi3g46uIRdhgH1wUyJS
         VimBaERhU6lRRn+dR4NHtQSjiQhbqFlmtDM93PB7+V8C69DGwqhSOhzwyawsgko8gabp
         3YdKHQhzQcE48ia4d+R7SMInQf+nZzpSknGA/0XRa8Li4cctKkr447PU0R44geo70+AJ
         ugkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733221768; x=1733826568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0Q8uqfRhDvrNswbuG1OfIJbALNB3zPXNZJaDrH+yhU=;
        b=TOETrXuynIW0T7d4KjnO0lueQucsZCs3kpvpYO7LHe+tl8LT4UYtSUfc6Jtg/UaJKy
         gC+DlFSLGkNKgpdhL9bdguesyl+GjwFfoZrZSaJHd3svBG40K4e6q9xGMrU5yahQ5bvE
         MqzqWvgDd2sPePpuvlCfV0MHcZByBlmTM0QhCiodcU43UZFyiHhpYiJvYjG+jAY1rMXO
         xDPfAMA8rTVy4D7bWfevsYpUUPaSkJMZH8T8mFuXCfq8ygM3AWc1P0kn8EqpGUQeF2e8
         z3qkLhNuE/Bb5Sq2El3n2mf0s+ahwXX/AHliYXpRjjCWPFNbkzlDwPkndMspKZjSyz3t
         t2wQ==
X-Gm-Message-State: AOJu0YyGC4C64EdwUnBJdBmS/zsE0FBLrVrbz8Ry40YVBUtNLitahCe/
	tLMmCy3uUJvRs/0BP4/HDX3MXtgaoOHo2fxta2p+PU7HQHOq15JXWiDW7DAgV5rfK2u/DYbcVCU
	LaxsZRm6r2c+8d2zSDjQFfMe7UsZHxfSQLFOGJwZF
X-Gm-Gg: ASbGncswMcH5XTVOO6X62i6tVKHtd7B2A/2cxRJBTJzhwL+tKdNZQQrk2gdL9InXome
	1bIB8RZed0dP5saI+cc9F/l6NPDW6iYyx
X-Google-Smtp-Source: AGHT+IGdeUQhGG6ILfuNeFl9J7s4bUy31TXtHRR0DuA6BHZtnhUZ0fTuANdTNGF5Krndlgn3AkMU6lEJf3qwCkiO7nA=
X-Received: by 2002:a05:6402:270c:b0:5d0:d311:dd4 with SMTP id
 4fb4d7f45d1cf-5d10cb81b94mr1276216a12.22.1733221767859; Tue, 03 Dec 2024
 02:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20241128213729.1021961-1-pierrick.bouvier@linaro.org>
 <4b3180bd-8054-4431-a594-0445ce4837aa@linaro.org> <5620efa2-98c6-4613-b866-67e91ac6acf8@linaro.org>
 <CAFEAcA-xa1AKf2GAv7go5wdu+Td=4jf7Nriin-Oe3S6qEV6X0g@mail.gmail.com>
 <fd7ad48e-1e72-4735-8064-7039eedc00ae@linaro.org> <87ser6c5be.fsf@draig.linaro.org>
 <a26e2a3d-d915-4e84-9b8e-dd5935049f31@linaro.org> <CAFEAcA9q7advmbws+xx6Mgcg-=072tBfdRReSSqymYz6p9zENg@mail.gmail.com>
 <b16724af-0758-41b0-afdf-8a6eb138dd64@linaro.org>
In-Reply-To: <b16724af-0758-41b0-afdf-8a6eb138dd64@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Dec 2024 10:29:17 +0000
Message-ID: <CAFEAcA-iAkyN7hPJ=ttEBwNDFwOTO8fC1H1RKSLv6uM0qzsCkg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/functional/aarch64: add tests for FEAT_RME
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Troy Lee <leetroy@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jamin Lin <jamin_lin@aspeedtech.com>, 
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: WMcQib2fLePF

On Mon, 2 Dec 2024 at 20:09, Pierrick Bouvier
<pierrick.bouvier@linaro.org> wrote:
>
> On 12/2/24 11:56, Peter Maydell wrote:
> > On Mon, 2 Dec 2024 at 18:36, Pierrick Bouvier
> > <pierrick.bouvier@linaro.org> wrote:
> >> Maybe our enable-debug should produced optimized builds by default, and
> >> we could have a new --enable-debug-unopt for the "I need to use a
> >> debugger" use case. Would save a lot of time for devs, and in CI where
> >> minutes are precious.
> >
> > The whole point of --enable-debug is "I might need to use a debugger"
> > (or a sanitizer, or anything else where you care about debug info).
> > If you want the optimized builds, that's the default.
> >
>
> It seems like we associate debug info to "I might need to use a
> debugger". But, it's not the only use case.
> Sanitizers for example, are usable with optimizations enabled as well
> (with some caveats, as some errors might be optimized out).

Yes, it's the caveats that are the problem. If compilers
supported an optimization mode that guaranteed not to break
the debug illusion for backtracing, interactive debug, etc,
then we could use it. But the best they do is -O0, so that's
what we use. (-Og sounds like it ought to be what we want,
but unfortunately it still leaves you with "value optimized
out" errors in debuggers, so it's no good.)

> I don't have anything against what --enable-debug does, but supporting
> this for tests (and CI) because people *might* use it is a mistake IMHO.
> It's an opinion beyond the current series use case.

If your test is hitting the timeouts for --enable-debug on
a local dev machine then it has a high chance of hitting the
timeouts in CI in a non-debug build because of the "noisy
neighbour" problem where a CI job runs massively slower than
usual. The fix is to make sure the timeout is high enough not
to be hit in a debug build, and wherever possible to have tests
that are cut down so they have short runtimes.

thanks
-- PMM

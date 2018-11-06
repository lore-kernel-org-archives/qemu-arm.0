Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g5-v6sm6103762wrw.97.2018.11.06.06.23.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Nov 2018 06:23:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id AB49D3E0245;
	Tue,  6 Nov 2018 14:23:25 +0000 (GMT)
References: <CAFEAcA9J__5kPwE7P4SwHYmOp=V0fzoGq5BzBKeStytb6W3=ug@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: aarch32 acquire/release vs mttcg
In-reply-to: <CAFEAcA9J__5kPwE7P4SwHYmOp=V0fzoGq5BzBKeStytb6W3=ug@mail.gmail.com>
Date: Tue, 06 Nov 2018 14:23:25 +0000
Message-ID: <87o9b2e142.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: iyOx7VO5QCXh


Peter Maydell <peter.maydell@linaro.org> writes:

> Looking through code I noticed that in target/arm/translate.c there
> is the following comment in the decode for the load-acquire/store-release
> instructions:
>
>       /* Since the emulation does not have barriers,
>          the acquire/release semantics need no special
>          handling */
>
> This is out of date now we have MTTCG, isn't it?

Yes

> The equivalent code in translate-a64.c has some calls to tcg_gen_mb()
> to emit barriers...presumably we need to fix the a32 code to do
> the same.

Sounds right. Are they the same semantics as their bigger 64 bit
cousins?

>
> (We haven't noticed this because I think in practice nobody
> much is compiling Armv8-specific AArch32 code.)
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e

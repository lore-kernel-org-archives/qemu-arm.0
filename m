Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g125-v6sm5533776wmf.16.2018.08.01.08.11.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Aug 2018 08:11:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3F2643E00D2;
	Wed,  1 Aug 2018 16:11:56 +0100 (BST)
References: <20180801123111.3595-1-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH 0/4] target/arm sve fixes
In-reply-to: <20180801123111.3595-1-richard.henderson@linaro.org>
Date: Wed, 01 Aug 2018 16:11:56 +0100
Message-ID: <874lgeazpf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: V7A2zMgn9jIe


Richard Henderson <richard.henderson@linaro.org> writes:

> These four patches are minor, reported by Laurent this week.
>
> If there happens to be an -rc4 release, it would be nice if
> they were included.  But if not, no biggie.  I suspect that
> other minor issues will be found past these four, so I would
> hope everyone who cares about sve is just as happy working
> from a branch anyway.

All the RISU tests are still passing so:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>
>
> r~
>
>
> Richard Henderson (4):
>   target/arm: Fix sign of sve_cmpeq_ppzw/sve_cmpne_ppzw
>   target/arm: Fix typo in do_sat_addsub_64
>   target/arm: Reorganize SVE WHILE
>   target/arm: Fix typo in helper_sve_movz_d
>
>  target/arm/sve_helper.c    | 19 ++++++--------
>  target/arm/translate-sve.c | 51 ++++++++++++++++++++++++--------------
>  2 files changed, 40 insertions(+), 30 deletions(-)


--
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf74e85fbfsm407913366b.15.2025.03.04.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:58:41 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id ADBC15F93C;
	Tue,  4 Mar 2025 15:58:40 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Brian Cain
 <brian.cain@oss.qualcomm.com>
Subject: Re: [PATCH] tests/tcg: Suppress compiler false-positive warning on
 sha1.c
In-Reply-To: <CAFEAcA_nbax7qq7Lxc-Qo8xTaxxTn9dJ5VQYuQTy+Qp1_2mNXg@mail.gmail.com>
	(Peter Maydell's message of "Tue, 4 Mar 2025 14:36:42 +0000")
References: <20250227141343.1675415-1-peter.maydell@linaro.org>
	<87o6yh57r2.fsf@draig.linaro.org>
	<CAFEAcA9VDtWKoQ09dOt+ZxJ2MhdRTFY_X1ON58pEjYTM_NtZ-A@mail.gmail.com>
	<87ikoo6hbm.fsf@draig.linaro.org>
	<CAFEAcA9mFHo=U=F+7on-9m+VWh_b2rQXtEJovU3fuj3MZxHTyw@mail.gmail.com>
	<877c546f9r.fsf@draig.linaro.org>
	<CAFEAcA_nbax7qq7Lxc-Qo8xTaxxTn9dJ5VQYuQTy+Qp1_2mNXg@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 04 Mar 2025 15:58:40 +0000
Message-ID: <87v7so4wjz.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vnPa+PTJD74I

Peter Maydell <peter.maydell@linaro.org> writes:

> On Tue, 4 Mar 2025 at 14:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Tue, 4 Mar 2025 at 13:44, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>> >>
>> >> Peter Maydell <peter.maydell@linaro.org> writes:
>> >> > I think it's new-ish (gcc 11?). On the other hand
>> >> > -Wno-unknown-warning-option is quite old, and would suppress
>> >> > this error. If we do
>> >> >  CFLAGS+=3D-Wno-unknown-warning-option -Wno-stringop-overread
>> >> >
>> >> > does that work?
>> >>
>> >> Yes, I did:
>> >>
>> >> modified   tests/tcg/hexagon/Makefile.target
>> >> @@ -18,7 +18,7 @@
>> >>  # Hexagon doesn't support gdb, so skip the EXTRA_RUNS
>> >>  EXTRA_RUNS =3D
>> >>
>> >> -CFLAGS +=3D -Wno-incompatible-pointer-types -Wno-undefined-internal
>> >> +CFLAGS +=3D -Wno-incompatible-pointer-types -Wno-undefined-internal =
-Wno-unknown-warning-option
>> >>  CFLAGS +=3D -fno-unroll-loops -fno-stack-protector
>> >
>> > I think we should do this where we add -Wno-stringop-overread,
>> > not just for the hexagon tests -- or are the tcg tests
>> > guaranteed to be run with a fixed compiler from a container
>> > regardless of the local dev environment?
>>
>> I can move it, but hexagon is unusual in being clang based. However the
>> oldest compilers we use are 10.2 in the qemu/debian-legacy-test-cross
>> container.
>
> My question was more "do we only ever build this test with
> a fixed set of compilers that we control, or are we instead
> maybe sometimes using the user's clang/cc/gcc" ?

Its certainly possible - at least on a Debian system or with the
appropriate --cross-cc-$ARCH flags. I expect 99% of devs either have
Debian or Docker/Podman to fall back on.

> If the latter, we definitely need to associate the
> "don't warn about unknown warnings" with the place we are
> adding the option that's not known across all our supported
> compilers. If the former, then putting it in the hexagon
> specific file seems OK I guess.
>
> -- PMM

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

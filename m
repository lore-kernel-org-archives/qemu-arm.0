Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c19sm2772387edu.20.2021.03.12.03.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 03:24:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 350231FF7E;
	Fri, 12 Mar 2021 11:24:30 +0000 (GMT)
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-6-alex.bennee@linaro.org>
 <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard
 <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting
 test
Date: Fri, 12 Mar 2021 11:23:05 +0000
In-reply-to: <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
Message-ID: <87a6r8ehsi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 31FVq44I4z8P


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 12 Mar 2021 at 10:31, Alex Benn=3DC3=3DA9e <alex.bennee@linaro.or=
g> wro=3D
> te:
>>
>> Query the SYS_HEAPINFO semicall and do some basic verification of the
>> information via libc calls.
>
> Are we both testing system emulation and linux-user, or just one of the t=
wo=3D
> ?

Currently just linux-user. There is no inherent reason we couldn't add a
system emulation test but I felt that was already reasonably exercised
by your semihosting tests.

> (Not that I want to hold this up if we're only testing one, but coverage
> of both, including M-profile, seems like it would be useful; cf also
> https://bugs.launchpad.net/qemu/+bug/1918302 which is M-profile system-em=
ul=3D
> ation
> SYS_HEAPINFO being broken in 5.2.)
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

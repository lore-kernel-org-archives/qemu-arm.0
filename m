Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id lu5sm2837358ejb.97.2021.03.12.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 06:18:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 53CB31FF7E;
	Fri, 12 Mar 2021 14:18:33 +0000 (GMT)
References: <20210312102029.17017-1-alex.bennee@linaro.org>
 <20210312102029.17017-6-alex.bennee@linaro.org>
 <CAFEAcA_7OKauefw7ehAnqF6jmaqWPvNyVba+G2wg+xxsUgpZhQ@mail.gmail.com>
 <87a6r8ehsi.fsf@linaro.org>
 <CAFEAcA_0wKRcwpWODM23QaQi5qu86k=Y-2NHk4hWiz08oL98zQ@mail.gmail.com>
User-agent: mu4e 1.5.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard
 <keithp@keithp.com>, qemu-arm <qemu-arm@nongnu.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>
Subject: Re: [PATCH v5 5/5] tests/tcg: add HeapInfo checking to semihosting
 test
Date: Fri, 12 Mar 2021 14:08:38 +0000
In-reply-to: <CAFEAcA_0wKRcwpWODM23QaQi5qu86k=Y-2NHk4hWiz08oL98zQ@mail.gmail.com>
Message-ID: <877dmce9qe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yIvsG8CLEU+o


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 12 Mar 2021 at 11:24, Alex Benn=3DC3=3DA9e <alex.bennee@linaro.or=
g> wro=3D
> te:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Fri, 12 Mar 2021 at 10:31, Alex Benn=3D3DC3=3D3DA9e <alex.bennee@li=
naro.=3D
> org> wro=3D3D
>> > te:
>> >>
>> >> Query the SYS_HEAPINFO semicall and do some basic verification of the
>> >> information via libc calls.
>> >
>> > Are we both testing system emulation and linux-user, or just one of th=
e=3D
>  two=3D3D
>> > ?
>>
>> Currently just linux-user. There is no inherent reason we couldn't add a
>> system emulation test but I felt that was already reasonably exercised
>> by your semihosting tests.
>
> Do we run those automatically anywhere ? I agree that probably the
> best thing is to get those into the CI loop somehow (and then put
> a SYS_HEAPINFO test there.)

Not currently. I have toyed with series that make integrate the building
of external test suites into the source tree. There are a number that it
would be useful to have a short "make" away including:

  kvm-unit-tests
  LTP
  diy7 (memory model testing)
  sbsa-ref tools

and I guess the semihosting testd would be another good example.

--=20
Alex Benn=C3=A9e

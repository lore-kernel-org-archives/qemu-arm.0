Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b10sm1004014wru.92.2019.03.15.03.57.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2019 03:57:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DAD891FF87;
	Fri, 15 Mar 2019 10:56:59 +0000 (UTC)
References: <CABgYhWf=unSbmTksO+gkUuX+UL3g8HvEuDAeDdxBQVbzci05DQ@mail.gmail.com> <CAFEAcA8xqO=iV9oJWWdPHhhDFRmAoegMpwUZQUszXLwG7zS=Hw@mail.gmail.com>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Massimiliano Cialdi <cialdi@gmail.com>
Subject: Re: [Qemu-arm] QEMU user mode for cortex M
In-reply-to: <CAFEAcA8xqO=iV9oJWWdPHhhDFRmAoegMpwUZQUszXLwG7zS=Hw@mail.gmail.com>
Date: Fri, 15 Mar 2019 10:56:59 +0000
Message-ID: <87ftroxv5w.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Y9Jhud75LCVR


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 14 Mar 2019 at 22:30, Massimiliano Cialdi <cialdi@gmail.com> wrot=
e:
>>
>> hello,
>> I would like to try some algorithms on cortex M (especially cortex M4). =
I don't need to emulate the whole machine, I just need the user mode.
>> To test the feasibility, I wrote the trivial "hello world".
>>
>> I can compile it with arm-none-eabi-gcc, but the newlib associated with =
it does not implement any syscall.
>> So I tried, on ubuntu, with the cross compiler arm-linux-gnueabihf-gcc a=
nd its libc6, but the latter is only distributed for cortex A.
>>
>> What do you suggest? Should I recompile the libc6 for cortex M (or do I =
find it pre-compiled)? Should I implement (and how?) syscalls on newlib?
>>
>> In summary, I would need a step-by-step guide to running Cortex M code o=
n QEMU arm user mode.
>
> User-mode in Cortex-M is a weird thing to do, because what QEMU
> gives you is the A-profile Linux syscalls.
<snip>
> System emulation mode will get you something that actually
> works the way the real hardware does. You can then do
> output either via the UART or via semihosting (you need to
> enable the latter on the commandline).

We've recently added the ability to compile system-mode tests although
we currently only have one test for Cortex-M0 (see
tests/tcg/test-armv6m-undef.s). However if you could write a boot.S for
cortex-m4 with a semihosting __sys_outc and link it with
tests/tcg/minilib then you have a reasonable test harness for building C
binaries (albeit without a proper libc) you can run with the system
emulator.

--
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o20sm22746931wmh.21.2019.04.27.15.16.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Apr 2019 15:16:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E8D211FF87;
	Sat, 27 Apr 2019 23:16:20 +0100 (BST)
References: <trinity-1f7e0bc4-e787-4b8e-9ba2-9e458d88c7ca-1556216041544@3c-app-webde-bs13> <CAFEAcA_bS_Oz+shCU1U5rN_DMP9_osQXXmh470OP1r-9GQ4=ag@mail.gmail.com> <trinity-d1a9db92-6382-4db0-bbdd-1732d86106f3-1556302805332@3c-app-webde-bap58>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-arm] Regression tests for Assembly libraries for Cortex-M: More recent qemu versions core-dump or fail with warnings
In-reply-to: <trinity-d1a9db92-6382-4db0-bbdd-1732d86106f3-1556302805332@3c-app-webde-bap58>
Date: Sat, 27 Apr 2019 23:16:20 +0100
Message-ID: <875zqzqekr.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: DUDeIbgXPifu


"Bj=C3=B6rn Haase" <Bjoern.M.Haase@web.de> writes:

>
> Thank you peter for your helpful reply!
>
> Maybe I could make some effort of trying to boil down the testsuite code =
to 16 MByte of memory and use a linker script for one of the larger Cortex-=
M3 sytems.
>
>>> Also I believe that semihosting will not be supported on any of the nat=
ive cortex-m machines? Any advice would be very appreciated.
>>
>>All the cortex-m systems support semihosting. (Note
>>that the ABI for M-profile semihosting is not quite
>>the same as the A-profile ABI -- it uses a breakpoint
>>insn, rather than an SVC insn.) You need to enable
>>it with the -semihosting option, and you can't use
>>it from non-privileged code (this is the same as the
>>A-profile semihosting).
>
> You don't actually know whether someby has actually used this together wi=
th the syscall implementations in newlib/libgloss? I somehow fear that my o=
lder implementation
> only did work because it was using the SWI interface ...  However, I have=
 seen that libgloss seems to provide different versions of the "Angel" inte=
rface. One of these
> also seems to use a breakpoint instruction.
>
> Do you know of any publicly available target project that actually
> uses semihosting on a Cortex-M? This might be a good starting point
> for analysis.

Well tests/tcg/arm/test-armv6m-undef.S does - it is nominally a microbit
with cortex-m0 but uses semihosting for reporting the test status to the
caller.

>
> Thanks again for your advice!
>
> Yours,
>
> Bj=C3=B6rn.


--
Alex Benn=C3=A9e

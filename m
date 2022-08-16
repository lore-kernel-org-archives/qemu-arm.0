Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id l4-20020a5d4bc4000000b0021e6277bc50sm11717580wrt.36.2022.08.16.01.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 01:51:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6A53A1FFB7;
	Tue, 16 Aug 2022 09:51:03 +0100 (BST)
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-2-peter.maydell@linaro.org>
User-agent: mu4e 1.8.9; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar
 Rikalo <aleksandar.rikalo@syrmia.com>, Stefan Pejic
 <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut
 <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Furquan Shaikh <furquan@rivosinc.com>
Subject: Re: [PATCH 1/7] semihosting: Allow optional use of semihosting from
 userspace
Date: Tue, 16 Aug 2022 09:50:57 +0100
In-reply-to: <20220815190303.2061559-2-peter.maydell@linaro.org>
Message-ID: <87v8qsbmh4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: hLupBbgbgKRn


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently our semihosting implementations generally prohibit use of
> semihosting calls in system emulation from the guest userspace.  This
> is a very long standing behaviour justified originally "to provide
> some semblance of security" (since code with access to the
> semihosting ABI can do things like read and write arbitrary files on
> the host system).  However, it is sometimes useful to be able to run
> trusted guest code which performs semihosting calls from guest
> userspace, notably for test code.  Add a command line suboption to
> the existing semihosting-config option group so that you can
> explicitly opt in to semihosting from guest userspace with
>  -semihosting-config userspace=3Don
>
> (There is no equivalent option for the user-mode emulator, because
> there by definition all code runs in userspace and has access to
> semihosting already.)
>
> This commit adds the infrastructure for the command line option and
> adds a bool 'is_user' parameter to the function
> semihosting_userspace_enabled() that target code can use to check
> whether it should be permitting the semihosting call for userspace.
> It mechanically makes all the callsites pass 'false', so they
> continue checking "is semihosting enabled in general".  Subsequent
> commits will make each target that implements semihosting honour the
> userspace=3Don option by passing the correct value and removing
> whatever "don't do this for userspace" checking they were doing by
> hand.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

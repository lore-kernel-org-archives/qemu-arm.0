Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u5sm8620547wml.13.2020.11.19.03.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 03:26:26 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8A5CF1FF7E;
	Thu, 19 Nov 2020 11:26:25 +0000 (GMT)
References: <20201119092346.32356-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH for-5.2] target/arm: Make SYS_HEAPINFO work with RAM
 that doesn't start at 0
In-reply-to: <20201119092346.32356-1-peter.maydell@linaro.org>
Date: Thu, 19 Nov 2020 11:26:25 +0000
Message-ID: <87lfexvb8e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9PL1BBuQx3vK


Peter Maydell <peter.maydell@linaro.org> writes:

> The semihosting SYS_HEAPINFO call is supposed to return an array
> of four guest addresses:
>  * base of heap memory
>  * limit of heap memory
>  * base of stack memory
>  * limit of stack memory
>
> Some semihosting programs (including those compiled to use the
> 'newlib' embedded C library) use this call to work out where they
> should initialize themselves to.
>
> QEMU's implementation when in system emulation mode is very
> simplistic: we say that the heap starts halfway into RAM and
> continues to the end of RAM, and the stack starts at the top of RAM
> and works down to the bottom.

So there is nothing to stop this value being in the middle of say a
loaded kernel or something that happens to overrun into the second half
of memory? AFAICT if an initrd is ever used it will likely smash that.

> Unfortunately the code assumes that
> the base address of RAM is at address 0, so on boards like 'virt'
> where this is not true the addresses returned will all be wrong and
> the guest application will usually crash.
>
> Conveniently since all Arm boards call arm_load_kernel() we have the
> base address of the main RAM block in the arm_boot_info struct which
> is accessible via the CPU object.  Use this to return sensible values
> from SYS_HEAPINFO.

It's certainly an improvement but it feels like it could be a bit
smarter. Maybe it's not an issue for sort of things that use
semihosting?

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

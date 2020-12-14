Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 125sm31425025wmc.27.2020.12.14.03.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 03:31:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B78771FF7E;
	Mon, 14 Dec 2020 11:31:51 +0000 (GMT)
References: <20201125213617.2496935-1-keithp@keithp.com>
 <20201125213617.2496935-6-keithp@keithp.com>
 <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
 <87r1nz6iz4.fsf@keithp.com>
 <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kito Cheng <kito.cheng@gmail.com>
Cc: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org, Alistair
 Francis <Alistair.Francis@wdc.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: Re: [PATCH 5/8] riscv: Add semihosting support [v13]
Date: Mon, 14 Dec 2020 11:29:35 +0000
In-reply-to: <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
Message-ID: <87zh2gtyhk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TLV3YoEhPQ0a


Kito Cheng <kito.cheng@gmail.com> writes:

> Hi Keith:
>
> Thanks for your reply, but it seems like we need some more modification in
>  linux-user/riscv/cpu_loop.c to enable that, I guess I should post that i=
n mail
> rather than attachment :)
>
> Patch here:
>
> From 2f1eb5825a6dda177d3289106970eab05cb08445 Mon Sep 17 00:00:00 2001
> From: Kito Cheng <kito.cheng@sifive.com>
> Date: Wed, 9 Dec 2020 14:24:51 +0800
> Subject: [PATCH] riscv: Add semihosting support for user mode
>
> This could make testing easier and ARM/AArch64 has support on
> their linux user mode too, so I think it should be reasonable.
>
> Verified GCC testsuite with newlib/semihosting.
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>

If the riscv linux-user maintainer is happy with it I'll take it through
semihosting/next. It certainly has a use case in the ARM case.

> ---
>  linux-user/riscv/cpu_loop.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index aa9e437875..9665dabb09 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -23,6 +23,7 @@
>  #include "qemu.h"
>  #include "cpu_loop-common.h"
>  #include "elf.h"
> +#include "hw/semihosting/common-semi.h"
>
>  void cpu_loop(CPURISCVState *env)
>  {
> @@ -91,6 +92,10 @@ void cpu_loop(CPURISCVState *env)
>              sigcode =3D TARGET_SEGV_MAPERR;
>              sigaddr =3D env->badaddr;
>              break;
> +        case RISCV_EXCP_SEMIHOST:
> +            env->gpr[xA0] =3D do_common_semihosting(cs);
> +            env->pc +=3D 4;
> +            break;
>          case EXCP_DEBUG:
>          gdbstep:
>              signum =3D TARGET_SIGTRAP;


--=20
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 77sm1773057wmu.17.2018.02.21.12.44.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Feb 2018 12:44:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 07B2B3E0176;
	Wed, 21 Feb 2018 20:44:27 +0000 (GMT)
References: <CAFEAcA_Tp9cH5CBi4C6CRHpZ4ozygGSFYhdLaURBQOVZ9zVxvA@mail.gmail.com> <20180220210137.18018-1-alex.bennee@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org, richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>, Aurelien Jarno <aurelien@aurel32.net>, Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, "open list\:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] fpu/softfloat: use hardware sqrt if we can (EXPERIMENT!)
In-reply-to: <20180220210137.18018-1-alex.bennee@linaro.org>
Date: Wed, 21 Feb 2018 20:44:26 +0000
Message-ID: <87k1v69iol.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0islmOVuJXjy


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This is an attempt to save some of the cost of sqrt by using the
> inbuilt support of the host hardware. The idea is assuming we start
> with a valid input we can use the hardware. If any tininess issues
> occur this will trip and FPU exception where:
>
>   - we turn off cpu->use_host_fpu
>   - mask the FPU exceptions
>   - return to what we were doing
>
> Once we return we should pick up the fact that there was something
> weird about the operation and fall-back to the pure software
> implementation.
>
> You could imagine this being extended for code generation but instead
> of returning to the code we could exit and re-generate the TB but this
> time with pure software helpers rather than any support from the
> hardware.
>
> This is a sort of fix-it-up after the fact approach because reading
> the FP state is an expensive operation for everything so let's only
> worry about exceptions when they trip...
>
<snip>
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -20,6 +20,7 @@
>  #include "qemu/bitops.h"
>  #include <sys/ucontext.h>
>  #include <sys/resource.h>
> +#include <fenv.h>
>
>  #include "qemu.h"
>  #include "qemu-common.h"
> @@ -639,6 +640,21 @@ static void host_signal_handler(int host_signum, sig=
info_t *info,
>      ucontext_t *uc =3D puc;
>      struct emulated_sigtable *k;
>
> +    /* Catch any FPU exceptions we might get from having tried to use
> +     * the host FPU to speed up some calculations
> +     */
> +    if (host_signum =3D=3D SIGFPE && cpu->use_host_fpu) {
> +        cpu->use_host_fpu =3D false;
> +        /* sadly this gets lost on the context switch when we return */
> +        fedisableexcept(FE_INVALID   |
> +                        FE_OVERFLOW  |
> +                        FE_UNDERFLOW |
> +                        FE_INEXACT);
> +        /* sigaddset(&uc->uc_sigmask, SIGFPE); */
> +        uc->__fpregs_mem.mxcsr |=3D 0x1f80;

This is a bug, the correct place to reset mxcsr for the return is:

        (uc->uc_mcontext.fpregs)->mxcsr |=3D 0x1f80;

--
Alex Benn=C3=A9e

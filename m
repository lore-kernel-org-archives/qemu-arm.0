Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m65-v6sm342838wmd.1.2018.06.25.13.51.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jun 2018 13:51:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id C614C3E084C;
	Mon, 25 Jun 2018 21:51:27 +0100 (BST)
References: <20180625160009.17437-1-alex.bennee@linaro.org> <20180625160009.17437-6-alex.bennee@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 5/5] tests/tcg/aarch64: userspace system register test
In-reply-to: <20180625160009.17437-6-alex.bennee@linaro.org>
Date: Mon, 25 Jun 2018 21:51:27 +0100
Message-ID: <87tvpqwpww.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Z9wqZN6meowJ


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> This tests a bunch of registers that the kernel allows userspace to
> read including the CPUID registers.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/Makefile.target |  2 +-
>  tests/tcg/aarch64/sysregs.c       | 99 +++++++++++++++++++++++++++++++
>  2 files changed, 100 insertions(+), 1 deletion(-)
>  create mode 100644 tests/tcg/aarch64/sysregs.c
>
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index 08c45b8470..cc1a7eb486 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -7,7 +7,7 @@ VPATH 		+=3D $(AARCH64_SRC)
>
>  # we don't build any of the ARM tests
>  AARCH64_TESTS=3D$(filter-out $(ARM_TESTS), $(TESTS))
> -AARCH64_TESTS+=3Dfcvt
> +AARCH64_TESTS+=3Dfcvt sysregs
>  TESTS:=3D$(AARCH64_TESTS)
>
>  fcvt: LDFLAGS+=3D-lm
> diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
> new file mode 100644
> index 0000000000..177d1fe33b
> --- /dev/null
> +++ b/tests/tcg/aarch64/sysregs.c
> @@ -0,0 +1,99 @@
> +/*
> + * Check emulated system register access for linux-user mode.
> + *
> + * See: https://www.kernel.org/doc/Documentation/arm64/cpu-feature-regis=
ters.txt
> + */
> +
> +#include <asm/hwcap.h>
> +#include <stdio.h>
> +#include <sys/auxv.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <stdbool.h>
> +
<snip>
> +
> +    /* when (getauxval(AT_HWCAP) & HWCAP_CPUID), since 4.11*/
> +    if (!(getauxval(AT_HWCAP) & HWCAP_CPUID)) {
> +        printf("CPUID registers unavailable\n");
> +        return 1;
> +    } else {
> +        printf("Checking CPUID registers\n");
> +    }

Annoyingly this fails on qemu:debian-arm64-cross as it uses an older set
of headers than my desktop cross environment:

  aarch64-linux-gnu-gcc (Ubuntu/Linaro 7.3.0-16ubuntu3) 7.3.0

with the libc:

  Source: cross-toolchain-base (25ubuntu6)
  Version: 2.27-3ubuntu1cross1
  Provides: libc6-arm64-dcv1

So I'm thinking an #ifndef HWCAP_CPUID and define it would be acceptable
for a test case.

--
Alex Benn=C3=A9e

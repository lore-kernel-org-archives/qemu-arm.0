Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q14sm39334451wrc.77.2019.09.10.12.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 12:45:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 615F41FF87;
	Tue, 10 Sep 2019 20:45:20 +0100 (BST)
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-2-alex.bennee@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Riku Voipio
 <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH  v1 1/4] target/ppc: fix signal delivery for ppc64abi32
In-reply-to: <20190910193408.28917-2-alex.bennee@linaro.org>
Date: Tue, 10 Sep 2019 20:45:20 +0100
Message-ID: <87blvs0wbz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Nfq5GdRgBYR3


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> We were incorrectly setting NIP resulting in a segfault. This fixes
> linux-test for this ABI.

Oops, that was at the bottom of my tree for fixing ppc64abi32 which
showed up broken when testing/next enabled the TCG tests for it.

>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  linux-user/ppc/signal.c             | 4 +++-
>  tests/tcg/configure.sh              | 1 +
>  tests/tcg/multiarch/Makefile.target | 5 -----
>  3 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
> index 619a56950df..5b82af6cb62 100644
> --- a/linux-user/ppc/signal.c
> +++ b/linux-user/ppc/signal.c
> @@ -501,7 +501,9 @@ void setup_rt_frame(int sig, struct target_sigaction =
*ka,
>      int i, err =3D 0;
>  #if defined(TARGET_PPC64)
>      struct target_sigcontext *sc =3D 0;
> +#if !defined(TARGET_ABI32)
>      struct image_info *image =3D ((TaskState *)thread_cpu->opaque)->info;
> +#endif
>  #endif
>
>      rt_sf_addr =3D get_sigframe(ka, env, sizeof(*rt_sf));
> @@ -557,7 +559,7 @@ void setup_rt_frame(int sig, struct target_sigaction =
*ka,
>      env->gpr[5] =3D (target_ulong) h2g(&rt_sf->uc);
>      env->gpr[6] =3D (target_ulong) h2g(rt_sf);
>
> -#if defined(TARGET_PPC64)
> +#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
>      if (get_ppc64_abi(image) < 2) {
>          /* ELFv1 PPC64 function pointers are pointers to OPD entries. */
>          struct target_func_ptr *handler =3D
> diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
> index 6c4a471aeae..e8a1a1495fc 100755
> --- a/tests/tcg/configure.sh
> +++ b/tests/tcg/configure.sh
> @@ -54,6 +54,7 @@ fi
>  : ${cross_cc_cflags_ppc=3D"-m32"}
>  : ${cross_cc_ppc64=3D"powerpc-linux-gnu-gcc"}
>  : ${cross_cc_cflags_ppc64=3D"-m64"}
> +: ${cross_cc_cflags_ppc64abi32=3D"-mcpu=3Dpower8"}
>  : ${cross_cc_ppc64le=3D"powerpc64le-linux-gnu-gcc"}
>  : ${cross_cc_cflags_s390x=3D"-m64"}
>  : ${cross_cc_cflags_sparc=3D"-m32 -mv8plus -mcpu=3Dultrasparc"}
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Ma=
kefile.target
> index 6b1e30e2fec..e6893b2e283 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -12,11 +12,6 @@ VPATH 		+=3D $(MULTIARCH_SRC)
>  MULTIARCH_SRCS   =3D$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
>  MULTIARCH_TESTS  =3D$(MULTIARCH_SRCS:.c=3D)
>
> -# FIXME: ppc64abi32 linux-test seems to have issues but the other basic =
tests work
> -ifeq ($(TARGET_NAME),ppc64abi32)
> -BROKEN_TESTS =3D linux-test
> -endif
> -
>  # Update TESTS
>  TESTS		+=3D $(filter-out $(BROKEN_TESTS), $(MULTIARCH_TESTS))


--
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u8sm2919462wmj.45.2020.10.07.08.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 08:06:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id CA6DB1FF7E;
	Wed,  7 Oct 2020 16:05:59 +0100 (BST)
References: <20201006172359.2998-1-richard.henderson@linaro.org>
 <20201006172359.2998-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
Subject: Re: [PATCH 1/1] tests/tcg/aarch64: Add bti mmap smoke test
In-reply-to: <20201006172359.2998-2-richard.henderson@linaro.org>
Date: Wed, 07 Oct 2020 16:05:59 +0100
Message-ID: <87lfgiyt2g.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qlM8++cbZr71


Richard Henderson <richard.henderson@linaro.org> writes:

> This tests PROT_BTI, and also does not require special
> compiler support.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/aarch64/bti-2.c         | 108 ++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |   7 +-
>  2 files changed, 113 insertions(+), 2 deletions(-)
>  create mode 100644 tests/tcg/aarch64/bti-2.c
>
> diff --git a/tests/tcg/aarch64/bti-2.c b/tests/tcg/aarch64/bti-2.c
> new file mode 100644
> index 0000000000..6dc8908b5a
> --- /dev/null
> +++ b/tests/tcg/aarch64/bti-2.c
> @@ -0,0 +1,108 @@
> +/*
> + * Branch target identification, basic notskip cases.
> + */
> +
> +#include <stdio.h>
> +#include <signal.h>
> +#include <string.h>
> +#include <unistd.h>
> +#include <sys/mman.h>
> +
> +#ifndef PROT_BTI
> +#define PROT_BTI  0x10
> +#endif
> +
> +static void skip2_sigill(int sig, siginfo_t *info, void *vuc)
> +{
> +    ucontext_t *uc =3D vuc;
> +    uc->uc_mcontext.pc +=3D 8;
> +    uc->uc_mcontext.pstate =3D 1;
> +}
> +
> +#define NOP       "nop"
> +#define BTI_N     "hint #32"
> +#define BTI_C     "hint #34"
> +#define BTI_J     "hint #36"
> +#define BTI_JC    "hint #38"
> +
> +#define BTYPE_1(DEST)    \
> +    "mov x1, #1\n\t"     \
> +    "adr x16, 1f\n\t"    \
> +    "br x16\n"           \
> +"1: " DEST "\n\t"        \
> +    "mov x1, #0"
> +
> +#define BTYPE_2(DEST)    \
> +    "mov x1, #1\n\t"     \
> +    "adr x16, 1f\n\t"    \
> +    "blr x16\n"          \
> +"1: " DEST "\n\t"        \
> +    "mov x1, #0"
> +
> +#define BTYPE_3(DEST)    \
> +    "mov x1, #1\n\t"     \
> +    "adr x15, 1f\n\t"    \
> +    "br x15\n"           \
> +"1: " DEST "\n\t"        \
> +    "mov x1, #0"
> +
> +#define TEST(WHICH, DEST, EXPECT) \
> +    WHICH(DEST) "\n"              \
> +    ".if " #EXPECT "\n\t"         \
> +    "eor x1, x1," #EXPECT "\n"    \
> +    ".endif\n\t"                  \
> +    "add x0, x0, x1\n\t"
> +
> +extern char test_begin[], test_end[];
> +
> +asm("\n"
> +"test_begin:\n\t"
> +    BTI_C "\n\t"
> +    "mov x2, x30\n\t"
> +    "mov x0, #0\n\t"
> +
> +    TEST(BTYPE_1, NOP, 1)
> +    TEST(BTYPE_1, BTI_N, 1)
> +    TEST(BTYPE_1, BTI_C, 0)
> +    TEST(BTYPE_1, BTI_J, 0)
> +    TEST(BTYPE_1, BTI_JC, 0)
> +
> +    TEST(BTYPE_2, NOP, 1)
> +    TEST(BTYPE_2, BTI_N, 1)
> +    TEST(BTYPE_2, BTI_C, 0)
> +    TEST(BTYPE_2, BTI_J, 1)
> +    TEST(BTYPE_2, BTI_JC, 0)
> +
> +    TEST(BTYPE_3, NOP, 1)
> +    TEST(BTYPE_3, BTI_N, 1)
> +    TEST(BTYPE_3, BTI_C, 1)
> +    TEST(BTYPE_3, BTI_J, 0)
> +    TEST(BTYPE_3, BTI_JC, 0)
> +
> +    "ret x2\n"
> +"test_end:"
> +);
> +
> +int main()
> +{
> +    struct sigaction sa;
> +
> +    void *p =3D mmap(0, getpagesize(),
> +                   PROT_EXEC | PROT_READ | PROT_WRITE | PROT_BTI,
> +                   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +    if (p =3D=3D MAP_FAILED) {
> +        perror("mmap");
> +        return 1;
> +    }
> +
> +    memset(&sa, 0, sizeof(sa));
> +    sa.sa_sigaction =3D skip2_sigill;
> +    sa.sa_flags =3D SA_SIGINFO;
> +    if (sigaction(SIGILL, &sa, NULL) < 0) {
> +        perror("sigaction");
> +        return 1;
> +    }
> +
> +    memcpy(p, test_begin, test_end - test_begin);
> +    return ((int (*)(void))p)();
> +}
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index 491683e91d..d7d33e293c 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -26,11 +26,14 @@ run-plugin-pauth-%: QEMU_OPTS +=3D -cpu max
>  endif
>=20=20
>  # BTI Tests
> +# bti-1 tests the elf notes, so we require special compiler support.
>  ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_ARMV8_BTI),)
>  AARCH64_TESTS +=3D bti-1
> -bti-%: CFLAGS +=3D -mbranch-protection=3Dstandard
> -bti-%: LDFLAGS +=3D -nostdlib
> +bti-1: CFLAGS +=3D -mbranch-protection=3Dstandard
> +bti-1: LDFLAGS +=3D -nostdlib
>  endif
> +# bti-2 tests PROT_BTI, so no special compiler support required.
> +AARCH64_TESTS +=3D bti-2


LGTM

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

(I assume this just rolls up with your existing BTI patches).

--=20
Alex Benn=C3=A9e

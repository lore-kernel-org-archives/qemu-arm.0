Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1861973asm1370688a12.2.2025.01.24.09.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 09:15:27 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 1501D5F839;
	Fri, 24 Jan 2025 17:15:26 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org
Subject: Re: [PATCH 02/76] tests/tcg/x86_64/fma: Test some x86
 fused-multiply-add cases
In-Reply-To: <20250124162836.2332150-3-peter.maydell@linaro.org> (Peter
	Maydell's message of "Fri, 24 Jan 2025 16:27:22 +0000")
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
	<20250124162836.2332150-3-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 24 Jan 2025 17:15:26 +0000
Message-ID: <87r04si15d.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: fwf05zjc30xC

Peter Maydell <peter.maydell@linaro.org> writes:

> Add a test case which tests some corner case behaviour of
> fused-multiply-add on x86:
>  * 0 * Inf + SNaN should raise Invalid
>  * 0 * Inf + QNaN shouldh not raise Invalid
>  * tininess should be detected after rounding
>
> There is also one currently-disabled test case:
>  * flush-to-zero should be done after rounding
>
> This is disabled because QEMU's emulation currently does this
> incorrectly (and so would fail the test).  The test case is kept in
> but disabled, as the justification for why the test running harness
> has support for testing both with and without FTZ set.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  tests/tcg/x86_64/fma.c           | 109 +++++++++++++++++++++++++++++++
>  tests/tcg/x86_64/Makefile.target |   1 +
>  2 files changed, 110 insertions(+)
>  create mode 100644 tests/tcg/x86_64/fma.c
>
> diff --git a/tests/tcg/x86_64/fma.c b/tests/tcg/x86_64/fma.c
> new file mode 100644
> index 00000000000..09c622ebc00
> --- /dev/null
> +++ b/tests/tcg/x86_64/fma.c
> @@ -0,0 +1,109 @@
> +/*
> + * Test some fused multiply add corner cases.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include <stdio.h>
> +#include <stdint.h>
> +#include <stdbool.h>
> +#include <inttypes.h>
> +
> +#define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> +
> +/*
> + * Perform one "n * m + a" operation using the vfmadd insn and return
> + * the result; on return *mxcsr_p is set to the bottom 6 bits of MXCSR
> + * (the Flag bits). If ftz is true then we set MXCSR.FTZ while doing
> + * the operation.
> + * We print the operation and its results to stdout.
> + */
> +static uint64_t do_fmadd(uint64_t n, uint64_t m, uint64_t a,
> +                         bool ftz, uint32_t *mxcsr_p)
> +{
> +    uint64_t r;
> +    uint32_t mxcsr =3D 0;
> +    uint32_t ftz_bit =3D ftz ? (1 << 15) : 0;
> +    uint32_t saved_mxcsr =3D 0;
> +
> +    asm volatile("stmxcsr %[saved_mxcsr]\n"
> +                 "stmxcsr %[mxcsr]\n"
> +                 "andl $0xffff7fc0, %[mxcsr]\n"
> +                 "orl %[ftz_bit], %[mxcsr]\n"
> +                 "ldmxcsr %[mxcsr]\n"
> +                 "movq %[a], %%xmm0\n"
> +                 "movq %[m], %%xmm1\n"
> +                 "movq %[n], %%xmm2\n"
> +                 /* xmm0 =3D xmm0 + xmm2 * xmm1 */
> +                 "vfmadd231sd %%xmm1, %%xmm2, %%xmm0\n"
> +                 "movq %%xmm0, %[r]\n"
> +                 "stmxcsr %[mxcsr]\n"
> +                 "ldmxcsr %[saved_mxcsr]\n"
> +                 : [r] "=3Dr" (r), [mxcsr] "=3Dm" (mxcsr),
> +                   [saved_mxcsr] "=3Dm" (saved_mxcsr)
> +                 : [n] "r" (n), [m] "r" (m), [a] "r" (a),
> +                   [ftz_bit] "r" (ftz_bit)
> +                 : "xmm0", "xmm1", "xmm2");
> +    *mxcsr_p =3D mxcsr & 0x3f;
> +    printf("vfmadd132sd 0x%" PRIx64 " 0x%" PRIx64 " 0x%" PRIx64
> +           " =3D 0x%" PRIx64 " MXCSR flags 0x%" PRIx32 "\n",
> +           n, m, a, r, *mxcsr_p);
> +    return r;
> +}
> +
> +typedef struct testdata {
> +    /* Input n, m, a */
> +    uint64_t n;
> +    uint64_t m;
> +    uint64_t a;
> +    bool ftz;
> +    /* Expected result */
> +    uint64_t expected_r;
> +    /* Expected low 6 bits of MXCSR (the Flag bits) */
> +    uint32_t expected_mxcsr;
> +} testdata;
> +
> +static testdata tests[] =3D {
> +    { 0, 0x7ff0000000000000, 0x7ff000000000aaaa, false, /* 0 * Inf + SNa=
N */
> +      0x7ff800000000aaaa, 1 }, /* Should be QNaN and does raise Invalid =
*/
> +    { 0, 0x7ff0000000000000, 0x7ff800000000aaaa, false, /* 0 * Inf + QNa=
N */
> +      0x7ff800000000aaaa, 0 }, /* Should be QNaN and does *not* raise In=
valid */
> +    /*
> +     * These inputs give a result which is tiny before rounding but which
> +     * becomes non-tiny after rounding. x86 is a "detect tininess after
> +     * rounding" architecture, so it should give a non-denormal result a=
nd
> +     * not set the Underflow flag (only the Precision flag for an inexact
> +     * result).
> +     */
> +    { 0x3fdfffffffffffff, 0x001fffffffffffff, 0x801fffffffffffff, false,
> +      0x8010000000000000, 0x20 },
> +    /*
> +     * Flushing of denormal outputs to zero should also happen after
> +     * rounding, so setting FTZ should not affect the result or the flag=
s.
> +     * QEMU currently does not emulate this correctly because we do the
> +     * flush-to-zero check before rounding, so we incorrectly produce a
> +     * zero result and set Underflow as well as Precision.
> +     */
> +#ifdef ENABLE_FAILING_TESTS
> +    { 0x3fdfffffffffffff, 0x001fffffffffffff, 0x801fffffffffffff, true,
> +      0x8010000000000000, 0x20 }, /* Enabling FTZ shouldn't change flags=
 */
> +#endif

We could extend the multiarch/float_madds test to handle doubles as well
(or create a new multiarch test).

If the right FMA instructions can be forced via cflags you could then
add a specific binary to exercise the vfmadd231sd instruction like we do
for neon:

  float_madds: CFLAGS+=3D-mfpu=3Dneon-vfpv4

The test does basic testing but ideally you would add a reference output
to check against.

> +};
> +
> +int main(void)
> +{
> +    bool passed =3D true;
> +    for (int i =3D 0; i < ARRAY_SIZE(tests); i++) {
> +        uint32_t mxcsr;
> +        uint64_t r =3D do_fmadd(tests[i].n, tests[i].m, tests[i].a,
> +                              tests[i].ftz, &mxcsr);
> +        if (r !=3D tests[i].expected_r) {
> +            printf("expected result 0x%" PRIx64 "\n", tests[i].expected_=
r);
> +            passed =3D false;
> +        }
> +        if (mxcsr !=3D tests[i].expected_mxcsr) {
> +            printf("expected MXCSR flags 0x%x\n", tests[i].expected_mxcs=
r);
> +            passed =3D false;
> +        }
> +    }
> +    return passed ? 0 : 1;
> +}
> diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile=
.target
> index d6dff559c7d..be20fc64e88 100644
> --- a/tests/tcg/x86_64/Makefile.target
> +++ b/tests/tcg/x86_64/Makefile.target
> @@ -18,6 +18,7 @@ X86_64_TESTS +=3D adox
>  X86_64_TESTS +=3D test-1648
>  X86_64_TESTS +=3D test-2175
>  X86_64_TESTS +=3D cross-modifying-code
> +X86_64_TESTS +=3D fma
>  TESTS=3D$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
>  else
>  TESTS=3D$(MULTIARCH_TESTS)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

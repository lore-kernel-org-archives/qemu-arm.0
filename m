Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm88847965e9.16.2025.01.10.07.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:32:18 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 514445F8C8;
	Fri, 10 Jan 2025 15:32:17 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2] target/arm: Move minor arithmetic helpers out of
 helper.c
In-Reply-To: <20250110131211.2546314-1-peter.maydell@linaro.org> (Peter
	Maydell's message of "Fri, 10 Jan 2025 13:12:11 +0000")
References: <20250110131211.2546314-1-peter.maydell@linaro.org>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 10 Jan 2025 15:32:17 +0000
Message-ID: <877c724rcu.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7GiYcwPBoKYt

Peter Maydell <peter.maydell@linaro.org> writes:

> helper.c includes some small TCG helper functions used for mostly
> arithmetic instructions.  These are TCG only and there's no need for
> them to be in the large and unwieldy helper.c.  Move them out to
> their own source file in the tcg/ subdirectory, together with the
> op_addsub.h multiply-included template header that they use.
>
> Since we are moving op_addsub.h, we take the opportunity to
> give it a name which matches our convention for files which
> are not true header files but which are #included from other
> C files: op_addsub.c.inc.
>
> (Ironically, this means that helper.c no longer contains
> any TCG helper function definitions at all.)

What's left? It mostly looks like cpreg related stuff. I guess it could
become cpreg.c?

>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
> v1->v2: rename op_addsub.h to op_addsub.c.inc.
> ---
>  target/arm/helper.c                           | 285 -----------------
>  target/arm/tcg/arith_helper.c                 | 296 ++++++++++++++++++
>  .../arm/{op_addsub.h =3D> tcg/op_addsub.c.inc}  |   0
>  target/arm/tcg/meson.build                    |   1 +
>  4 files changed, 297 insertions(+), 285 deletions(-)
>  create mode 100644 target/arm/tcg/arith_helper.c
>  rename target/arm/{op_addsub.h =3D> tcg/op_addsub.c.inc} (100%)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5b595f951b4..63997678513 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -17,11 +17,9 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/timer.h"
>  #include "qemu/bitops.h"
> -#include "qemu/crc32c.h"
>  #include "qemu/qemu-print.h"
>  #include "exec/exec-all.h"
>  #include "exec/translation-block.h"
> -#include <zlib.h> /* for crc32 */
>  #include "hw/irq.h"
>  #include "system/cpu-timers.h"
>  #include "system/kvm.h"
> @@ -10984,289 +10982,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState =
*env, uint64_t va,
>      };
>  }
>=20=20
> -/*
> - * Note that signed overflow is undefined in C.  The following routines =
are
> - * careful to use unsigned types where modulo arithmetic is required.
> - * Failure to do so _will_ break on newer gcc.
> - */
> -
> -/* Signed saturating arithmetic.  */
> -
> -/* Perform 16-bit signed saturating addition.  */
> -static inline uint16_t add16_sat(uint16_t a, uint16_t b)
> -{
> -    uint16_t res;
> -
> -    res =3D a + b;
> -    if (((res ^ a) & 0x8000) && !((a ^ b) & 0x8000)) {
> -        if (a & 0x8000) {
> -            res =3D 0x8000;
> -        } else {
> -            res =3D 0x7fff;
> -        }
> -    }
> -    return res;
> -}
> -
> -/* Perform 8-bit signed saturating addition.  */
> -static inline uint8_t add8_sat(uint8_t a, uint8_t b)
> -{
> -    uint8_t res;
> -
> -    res =3D a + b;
> -    if (((res ^ a) & 0x80) && !((a ^ b) & 0x80)) {
> -        if (a & 0x80) {
> -            res =3D 0x80;
> -        } else {
> -            res =3D 0x7f;
> -        }
> -    }
> -    return res;
> -}
> -
> -/* Perform 16-bit signed saturating subtraction.  */
> -static inline uint16_t sub16_sat(uint16_t a, uint16_t b)
> -{
> -    uint16_t res;
> -
> -    res =3D a - b;
> -    if (((res ^ a) & 0x8000) && ((a ^ b) & 0x8000)) {
> -        if (a & 0x8000) {
> -            res =3D 0x8000;
> -        } else {
> -            res =3D 0x7fff;
> -        }
> -    }
> -    return res;
> -}
> -
> -/* Perform 8-bit signed saturating subtraction.  */
> -static inline uint8_t sub8_sat(uint8_t a, uint8_t b)
> -{
> -    uint8_t res;
> -
> -    res =3D a - b;
> -    if (((res ^ a) & 0x80) && ((a ^ b) & 0x80)) {
> -        if (a & 0x80) {
> -            res =3D 0x80;
> -        } else {
> -            res =3D 0x7f;
> -        }
> -    }
> -    return res;
> -}
> -
> -#define ADD16(a, b, n) RESULT(add16_sat(a, b), n, 16);
> -#define SUB16(a, b, n) RESULT(sub16_sat(a, b), n, 16);
> -#define ADD8(a, b, n)  RESULT(add8_sat(a, b), n, 8);
> -#define SUB8(a, b, n)  RESULT(sub8_sat(a, b), n, 8);
> -#define PFX q
> -
> -#include "op_addsub.h"
> -
> -/* Unsigned saturating arithmetic.  */
> -static inline uint16_t add16_usat(uint16_t a, uint16_t b)
> -{
> -    uint16_t res;
> -    res =3D a + b;
> -    if (res < a) {
> -        res =3D 0xffff;
> -    }
> -    return res;
> -}
> -
> -static inline uint16_t sub16_usat(uint16_t a, uint16_t b)
> -{
> -    if (a > b) {
> -        return a - b;
> -    } else {
> -        return 0;
> -    }
> -}
> -
> -static inline uint8_t add8_usat(uint8_t a, uint8_t b)
> -{
> -    uint8_t res;
> -    res =3D a + b;
> -    if (res < a) {
> -        res =3D 0xff;
> -    }
> -    return res;
> -}
> -
> -static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
> -{
> -    if (a > b) {
> -        return a - b;
> -    } else {
> -        return 0;
> -    }
> -}
> -
> -#define ADD16(a, b, n) RESULT(add16_usat(a, b), n, 16);
> -#define SUB16(a, b, n) RESULT(sub16_usat(a, b), n, 16);
> -#define ADD8(a, b, n)  RESULT(add8_usat(a, b), n, 8);
> -#define SUB8(a, b, n)  RESULT(sub8_usat(a, b), n, 8);
> -#define PFX uq
> -
> -#include "op_addsub.h"
> -
> -/* Signed modulo arithmetic.  */
> -#define SARITH16(a, b, n, op) do { \
> -    int32_t sum; \
> -    sum =3D (int32_t)(int16_t)(a) op (int32_t)(int16_t)(b); \
> -    RESULT(sum, n, 16); \
> -    if (sum >=3D 0) \
> -        ge |=3D 3 << (n * 2); \
> -    } while (0)
> -
> -#define SARITH8(a, b, n, op) do { \
> -    int32_t sum; \
> -    sum =3D (int32_t)(int8_t)(a) op (int32_t)(int8_t)(b); \
> -    RESULT(sum, n, 8); \
> -    if (sum >=3D 0) \
> -        ge |=3D 1 << n; \
> -    } while (0)
> -
> -
> -#define ADD16(a, b, n) SARITH16(a, b, n, +)
> -#define SUB16(a, b, n) SARITH16(a, b, n, -)
> -#define ADD8(a, b, n)  SARITH8(a, b, n, +)
> -#define SUB8(a, b, n)  SARITH8(a, b, n, -)
> -#define PFX s
> -#define ARITH_GE
> -
> -#include "op_addsub.h"
> -
> -/* Unsigned modulo arithmetic.  */
> -#define ADD16(a, b, n) do { \
> -    uint32_t sum; \
> -    sum =3D (uint32_t)(uint16_t)(a) + (uint32_t)(uint16_t)(b); \
> -    RESULT(sum, n, 16); \
> -    if ((sum >> 16) =3D=3D 1) \
> -        ge |=3D 3 << (n * 2); \
> -    } while (0)
> -
> -#define ADD8(a, b, n) do { \
> -    uint32_t sum; \
> -    sum =3D (uint32_t)(uint8_t)(a) + (uint32_t)(uint8_t)(b); \
> -    RESULT(sum, n, 8); \
> -    if ((sum >> 8) =3D=3D 1) \
> -        ge |=3D 1 << n; \
> -    } while (0)
> -
> -#define SUB16(a, b, n) do { \
> -    uint32_t sum; \
> -    sum =3D (uint32_t)(uint16_t)(a) - (uint32_t)(uint16_t)(b); \
> -    RESULT(sum, n, 16); \
> -    if ((sum >> 16) =3D=3D 0) \
> -        ge |=3D 3 << (n * 2); \
> -    } while (0)
> -
> -#define SUB8(a, b, n) do { \
> -    uint32_t sum; \
> -    sum =3D (uint32_t)(uint8_t)(a) - (uint32_t)(uint8_t)(b); \
> -    RESULT(sum, n, 8); \
> -    if ((sum >> 8) =3D=3D 0) \
> -        ge |=3D 1 << n; \
> -    } while (0)
> -
> -#define PFX u
> -#define ARITH_GE
> -
> -#include "op_addsub.h"
> -
> -/* Halved signed arithmetic.  */
> -#define ADD16(a, b, n) \
> -  RESULT(((int32_t)(int16_t)(a) + (int32_t)(int16_t)(b)) >> 1, n, 16)
> -#define SUB16(a, b, n) \
> -  RESULT(((int32_t)(int16_t)(a) - (int32_t)(int16_t)(b)) >> 1, n, 16)
> -#define ADD8(a, b, n) \
> -  RESULT(((int32_t)(int8_t)(a) + (int32_t)(int8_t)(b)) >> 1, n, 8)
> -#define SUB8(a, b, n) \
> -  RESULT(((int32_t)(int8_t)(a) - (int32_t)(int8_t)(b)) >> 1, n, 8)
> -#define PFX sh
> -
> -#include "op_addsub.h"
> -
> -/* Halved unsigned arithmetic.  */
> -#define ADD16(a, b, n) \
> -  RESULT(((uint32_t)(uint16_t)(a) + (uint32_t)(uint16_t)(b)) >> 1, n, 16)
> -#define SUB16(a, b, n) \
> -  RESULT(((uint32_t)(uint16_t)(a) - (uint32_t)(uint16_t)(b)) >> 1, n, 16)
> -#define ADD8(a, b, n) \
> -  RESULT(((uint32_t)(uint8_t)(a) + (uint32_t)(uint8_t)(b)) >> 1, n, 8)
> -#define SUB8(a, b, n) \
> -  RESULT(((uint32_t)(uint8_t)(a) - (uint32_t)(uint8_t)(b)) >> 1, n, 8)
> -#define PFX uh
> -
> -#include "op_addsub.h"
> -
> -static inline uint8_t do_usad(uint8_t a, uint8_t b)
> -{
> -    if (a > b) {
> -        return a - b;
> -    } else {
> -        return b - a;
> -    }
> -}
> -
> -/* Unsigned sum of absolute byte differences.  */
> -uint32_t HELPER(usad8)(uint32_t a, uint32_t b)
> -{
> -    uint32_t sum;
> -    sum =3D do_usad(a, b);
> -    sum +=3D do_usad(a >> 8, b >> 8);
> -    sum +=3D do_usad(a >> 16, b >> 16);
> -    sum +=3D do_usad(a >> 24, b >> 24);
> -    return sum;
> -}
> -
> -/* For ARMv6 SEL instruction.  */
> -uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
> -{
> -    uint32_t mask;
> -
> -    mask =3D 0;
> -    if (flags & 1) {
> -        mask |=3D 0xff;
> -    }
> -    if (flags & 2) {
> -        mask |=3D 0xff00;
> -    }
> -    if (flags & 4) {
> -        mask |=3D 0xff0000;
> -    }
> -    if (flags & 8) {
> -        mask |=3D 0xff000000;
> -    }
> -    return (a & mask) | (b & ~mask);
> -}
> -
> -/*
> - * CRC helpers.
> - * The upper bytes of val (above the number specified by 'bytes') must h=
ave
> - * been zeroed out by the caller.
> - */
> -uint32_t HELPER(crc32)(uint32_t acc, uint32_t val, uint32_t bytes)
> -{
> -    uint8_t buf[4];
> -
> -    stl_le_p(buf, val);
> -
> -    /* zlib crc32 converts the accumulator and output to one's complemen=
t.  */
> -    return crc32(acc ^ 0xffffffff, buf, bytes) ^ 0xffffffff;
> -}
> -
> -uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
> -{
> -    uint8_t buf[4];
> -
> -    stl_le_p(buf, val);
> -
> -    /* Linux crc32c converts the output to one's complement.  */
> -    return crc32c(acc, buf, bytes) ^ 0xffffffff;
> -}
>=20=20
>  /*
>   * Return the exception level to which FP-disabled exceptions should
> diff --git a/target/arm/tcg/arith_helper.c b/target/arm/tcg/arith_helper.c
> new file mode 100644
> index 00000000000..9a555c7966c
> --- /dev/null
> +++ b/target/arm/tcg/arith_helper.c
> @@ -0,0 +1,296 @@
> +/*
> + * ARM generic helpers for various arithmetical operations.
> + *
> + * This code is licensed under the GNU GPL v2 or later.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/helper-proto.h"
> +#include "qemu/crc32c.h"
> +#include <zlib.h> /* for crc32 */
> +
> +/*
> + * Note that signed overflow is undefined in C.  The following routines =
are
> + * careful to use unsigned types where modulo arithmetic is required.
> + * Failure to do so _will_ break on newer gcc.
> + */
> +
> +/* Signed saturating arithmetic.  */
> +
> +/* Perform 16-bit signed saturating addition.  */
> +static inline uint16_t add16_sat(uint16_t a, uint16_t b)
> +{
> +    uint16_t res;
> +
> +    res =3D a + b;
> +    if (((res ^ a) & 0x8000) && !((a ^ b) & 0x8000)) {
> +        if (a & 0x8000) {
> +            res =3D 0x8000;
> +        } else {
> +            res =3D 0x7fff;
> +        }
> +    }
> +    return res;
> +}
> +
> +/* Perform 8-bit signed saturating addition.  */
> +static inline uint8_t add8_sat(uint8_t a, uint8_t b)
> +{
> +    uint8_t res;
> +
> +    res =3D a + b;
> +    if (((res ^ a) & 0x80) && !((a ^ b) & 0x80)) {
> +        if (a & 0x80) {
> +            res =3D 0x80;
> +        } else {
> +            res =3D 0x7f;
> +        }
> +    }
> +    return res;
> +}
> +
> +/* Perform 16-bit signed saturating subtraction.  */
> +static inline uint16_t sub16_sat(uint16_t a, uint16_t b)
> +{
> +    uint16_t res;
> +
> +    res =3D a - b;
> +    if (((res ^ a) & 0x8000) && ((a ^ b) & 0x8000)) {
> +        if (a & 0x8000) {
> +            res =3D 0x8000;
> +        } else {
> +            res =3D 0x7fff;
> +        }
> +    }
> +    return res;
> +}
> +
> +/* Perform 8-bit signed saturating subtraction.  */
> +static inline uint8_t sub8_sat(uint8_t a, uint8_t b)
> +{
> +    uint8_t res;
> +
> +    res =3D a - b;
> +    if (((res ^ a) & 0x80) && ((a ^ b) & 0x80)) {
> +        if (a & 0x80) {
> +            res =3D 0x80;
> +        } else {
> +            res =3D 0x7f;
> +        }
> +    }
> +    return res;
> +}
> +
> +#define ADD16(a, b, n) RESULT(add16_sat(a, b), n, 16);
> +#define SUB16(a, b, n) RESULT(sub16_sat(a, b), n, 16);
> +#define ADD8(a, b, n)  RESULT(add8_sat(a, b), n, 8);
> +#define SUB8(a, b, n)  RESULT(sub8_sat(a, b), n, 8);
> +#define PFX q
> +
> +#include "op_addsub.c.inc"
> +
> +/* Unsigned saturating arithmetic.  */
> +static inline uint16_t add16_usat(uint16_t a, uint16_t b)
> +{
> +    uint16_t res;
> +    res =3D a + b;
> +    if (res < a) {
> +        res =3D 0xffff;
> +    }
> +    return res;
> +}
> +
> +static inline uint16_t sub16_usat(uint16_t a, uint16_t b)
> +{
> +    if (a > b) {
> +        return a - b;
> +    } else {
> +        return 0;
> +    }
> +}
> +
> +static inline uint8_t add8_usat(uint8_t a, uint8_t b)
> +{
> +    uint8_t res;
> +    res =3D a + b;
> +    if (res < a) {
> +        res =3D 0xff;
> +    }
> +    return res;
> +}
> +
> +static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
> +{
> +    if (a > b) {
> +        return a - b;
> +    } else {
> +        return 0;
> +    }
> +}
> +
> +#define ADD16(a, b, n) RESULT(add16_usat(a, b), n, 16);
> +#define SUB16(a, b, n) RESULT(sub16_usat(a, b), n, 16);
> +#define ADD8(a, b, n)  RESULT(add8_usat(a, b), n, 8);
> +#define SUB8(a, b, n)  RESULT(sub8_usat(a, b), n, 8);
> +#define PFX uq
> +
> +#include "op_addsub.c.inc"
> +
> +/* Signed modulo arithmetic.  */
> +#define SARITH16(a, b, n, op) do { \
> +    int32_t sum; \
> +    sum =3D (int32_t)(int16_t)(a) op (int32_t)(int16_t)(b); \
> +    RESULT(sum, n, 16); \
> +    if (sum >=3D 0) \
> +        ge |=3D 3 << (n * 2); \
> +    } while (0)
> +
> +#define SARITH8(a, b, n, op) do { \
> +    int32_t sum; \
> +    sum =3D (int32_t)(int8_t)(a) op (int32_t)(int8_t)(b); \
> +    RESULT(sum, n, 8); \
> +    if (sum >=3D 0) \
> +        ge |=3D 1 << n; \
> +    } while (0)
> +
> +
> +#define ADD16(a, b, n) SARITH16(a, b, n, +)
> +#define SUB16(a, b, n) SARITH16(a, b, n, -)
> +#define ADD8(a, b, n)  SARITH8(a, b, n, +)
> +#define SUB8(a, b, n)  SARITH8(a, b, n, -)
> +#define PFX s
> +#define ARITH_GE
> +
> +#include "op_addsub.c.inc"
> +
> +/* Unsigned modulo arithmetic.  */
> +#define ADD16(a, b, n) do { \
> +    uint32_t sum; \
> +    sum =3D (uint32_t)(uint16_t)(a) + (uint32_t)(uint16_t)(b); \
> +    RESULT(sum, n, 16); \
> +    if ((sum >> 16) =3D=3D 1) \
> +        ge |=3D 3 << (n * 2); \
> +    } while (0)
> +
> +#define ADD8(a, b, n) do { \
> +    uint32_t sum; \
> +    sum =3D (uint32_t)(uint8_t)(a) + (uint32_t)(uint8_t)(b); \
> +    RESULT(sum, n, 8); \
> +    if ((sum >> 8) =3D=3D 1) \
> +        ge |=3D 1 << n; \
> +    } while (0)
> +
> +#define SUB16(a, b, n) do { \
> +    uint32_t sum; \
> +    sum =3D (uint32_t)(uint16_t)(a) - (uint32_t)(uint16_t)(b); \
> +    RESULT(sum, n, 16); \
> +    if ((sum >> 16) =3D=3D 0) \
> +        ge |=3D 3 << (n * 2); \
> +    } while (0)
> +
> +#define SUB8(a, b, n) do { \
> +    uint32_t sum; \
> +    sum =3D (uint32_t)(uint8_t)(a) - (uint32_t)(uint8_t)(b); \
> +    RESULT(sum, n, 8); \
> +    if ((sum >> 8) =3D=3D 0) \
> +        ge |=3D 1 << n; \
> +    } while (0)
> +
> +#define PFX u
> +#define ARITH_GE
> +
> +#include "op_addsub.c.inc"
> +
> +/* Halved signed arithmetic.  */
> +#define ADD16(a, b, n) \
> +  RESULT(((int32_t)(int16_t)(a) + (int32_t)(int16_t)(b)) >> 1, n, 16)
> +#define SUB16(a, b, n) \
> +  RESULT(((int32_t)(int16_t)(a) - (int32_t)(int16_t)(b)) >> 1, n, 16)
> +#define ADD8(a, b, n) \
> +  RESULT(((int32_t)(int8_t)(a) + (int32_t)(int8_t)(b)) >> 1, n, 8)
> +#define SUB8(a, b, n) \
> +  RESULT(((int32_t)(int8_t)(a) - (int32_t)(int8_t)(b)) >> 1, n, 8)
> +#define PFX sh
> +
> +#include "op_addsub.c.inc"
> +
> +/* Halved unsigned arithmetic.  */
> +#define ADD16(a, b, n) \
> +  RESULT(((uint32_t)(uint16_t)(a) + (uint32_t)(uint16_t)(b)) >> 1, n, 16)
> +#define SUB16(a, b, n) \
> +  RESULT(((uint32_t)(uint16_t)(a) - (uint32_t)(uint16_t)(b)) >> 1, n, 16)
> +#define ADD8(a, b, n) \
> +  RESULT(((uint32_t)(uint8_t)(a) + (uint32_t)(uint8_t)(b)) >> 1, n, 8)
> +#define SUB8(a, b, n) \
> +  RESULT(((uint32_t)(uint8_t)(a) - (uint32_t)(uint8_t)(b)) >> 1, n, 8)
> +#define PFX uh
> +
> +#include "op_addsub.c.inc"
> +
> +static inline uint8_t do_usad(uint8_t a, uint8_t b)
> +{
> +    if (a > b) {
> +        return a - b;
> +    } else {
> +        return b - a;
> +    }
> +}
> +
> +/* Unsigned sum of absolute byte differences.  */
> +uint32_t HELPER(usad8)(uint32_t a, uint32_t b)
> +{
> +    uint32_t sum;
> +    sum =3D do_usad(a, b);
> +    sum +=3D do_usad(a >> 8, b >> 8);
> +    sum +=3D do_usad(a >> 16, b >> 16);
> +    sum +=3D do_usad(a >> 24, b >> 24);
> +    return sum;
> +}
> +
> +/* For ARMv6 SEL instruction.  */
> +uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
> +{
> +    uint32_t mask;
> +
> +    mask =3D 0;
> +    if (flags & 1) {
> +        mask |=3D 0xff;
> +    }
> +    if (flags & 2) {
> +        mask |=3D 0xff00;
> +    }
> +    if (flags & 4) {
> +        mask |=3D 0xff0000;
> +    }
> +    if (flags & 8) {
> +        mask |=3D 0xff000000;
> +    }
> +    return (a & mask) | (b & ~mask);
> +}
> +
> +/*
> + * CRC helpers.
> + * The upper bytes of val (above the number specified by 'bytes') must h=
ave
> + * been zeroed out by the caller.
> + */
> +uint32_t HELPER(crc32)(uint32_t acc, uint32_t val, uint32_t bytes)
> +{
> +    uint8_t buf[4];
> +
> +    stl_le_p(buf, val);
> +
> +    /* zlib crc32 converts the accumulator and output to one's complemen=
t.  */
> +    return crc32(acc ^ 0xffffffff, buf, bytes) ^ 0xffffffff;
> +}
> +
> +uint32_t HELPER(crc32c)(uint32_t acc, uint32_t val, uint32_t bytes)
> +{
> +    uint8_t buf[4];
> +
> +    stl_le_p(buf, val);
> +
> +    /* Linux crc32c converts the output to one's complement.  */
> +    return crc32c(acc, buf, bytes) ^ 0xffffffff;
> +}
> diff --git a/target/arm/op_addsub.h b/target/arm/tcg/op_addsub.c.inc
> similarity index 100%
> rename from target/arm/op_addsub.h
> rename to target/arm/tcg/op_addsub.c.inc
> diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
> index 09238989c5a..1f9077c372c 100644
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -40,6 +40,7 @@ arm_ss.add(files(
>    'tlb_helper.c',
>    'vec_helper.c',
>    'tlb-insns.c',
> +  'arith_helper.c',
>  ))
>=20=20
>  arm_ss.add(when: 'TARGET_AARCH64', if_true: files(

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

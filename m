Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v9sm1627280wre.96.2018.04.03.02.16.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Apr 2018 02:16:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A348C3E01DF;
	Tue,  3 Apr 2018 10:16:52 +0100 (BST)
References: <20180217182323.25885-1-richard.henderson@linaro.org> <20180217182323.25885-7-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v2 06/67] target/arm: Implement SVE predicate test
In-reply-to: <20180217182323.25885-7-richard.henderson@linaro.org>
Date: Tue, 03 Apr 2018 10:16:52 +0100
Message-ID: <87zi2kd4zf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 85VMzBANqY+Q


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 21 +++++++++++++
>  target/arm/helper.h        |  1 +
>  target/arm/sve_helper.c    | 77 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  target/arm/translate-sve.c | 62 +++++++++++++++++++++++++++++++++++++
>  target/arm/Makefile.objs   |  2 +-
>  target/arm/sve.decode      |  5 +++
>  6 files changed, 167 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/helper-sve.h
>  create mode 100644 target/arm/sve_helper.c
>
> diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
> new file mode 100644
> index 0000000000..b6e91539ae
> --- /dev/null
> +++ b/target/arm/helper-sve.h
> @@ -0,0 +1,21 @@
> +/*
> + *  AArch64 SVE specific helper definitions
> + *
> + *  Copyright (c) 2018 Linaro, Ltd
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +
> +DEF_HELPER_FLAGS_2(sve_predtest1, TCG_CALL_NO_WG, i32, i64, i64)
> +DEF_HELPER_FLAGS_3(sve_predtest, TCG_CALL_NO_WG, i32, ptr, ptr, i32)
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 6dd8504ec3..be3c2fcdc0 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -567,4 +567,5 @@ DEF_HELPER_FLAGS_2(neon_pmull_64_hi, TCG_CALL_NO_RWG_=
SE, i64, i64, i64)
>
>  #ifdef TARGET_AARCH64
>  #include "helper-a64.h"
> +#include "helper-sve.h"
>  #endif
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> new file mode 100644
> index 0000000000..7d13fd40ed
> --- /dev/null
> +++ b/target/arm/sve_helper.c
> @@ -0,0 +1,77 @@
> +/*
> + *  ARM SVE Operations
> + *
> + *  Copyright (c) 2018 Linaro
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "exec/exec-all.h"
> +#include "exec/cpu_ldst.h"
> +#include "exec/helper-proto.h"
> +#include "tcg/tcg-gvec-desc.h"
> +
> +
> +/* Return a value for NZCV as per the ARM PredTest pseudofunction.
> + *
> + * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
> + * and bit 0 set if C is set.
> + *
> + * This is an iterative function, called for each Pd and Pg word
> + * moving forward.
> + */
> +
> +/* For no G bits set, NZCV =3D C.  */
> +#define PREDTEST_INIT  1
> +
> +static uint32_t iter_predtest_fwd(uint64_t d, uint64_t g, uint32_t flags)
> +{
> +    if (g) {
> +        /* Compute N from first D & G.
> +           Use bit 2 to signal first G bit seen.  */
> +        if (!(flags & 4)) {
> +            flags |=3D ((d & (g & -g)) !=3D 0) << 31;
> +            flags |=3D 4;
> +        }
> +
> +        /* Accumulate Z from each D & G.  */
> +        flags |=3D ((d & g) !=3D 0) << 1;
> +
> +        /* Compute C from last !(D & G).  Replace previous.  */
> +        flags =3D deposit32(flags, 0, 1, (d & pow2floor(g)) =3D=3D 0);
> +    }
> +    return flags;
> +}
> +
> +/* The same for a single word predicate.  */
> +uint32_t HELPER(sve_predtest1)(uint64_t d, uint64_t g)
> +{
> +    return iter_predtest_fwd(d, g, PREDTEST_INIT);
> +}
> +
> +/* The same for a multi-word predicate.  */
> +uint32_t HELPER(sve_predtest)(void *vd, void *vg, uint32_t words)
> +{
> +    uint32_t flags =3D PREDTEST_INIT;
> +    uint64_t *d =3D vd, *g =3D vg;
> +    uintptr_t i =3D 0;
> +
> +    do {
> +        flags =3D iter_predtest_fwd(d[i], g[i], flags);
> +    } while (++i < words);
> +
> +    return flags;
> +}
> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
> index c0cccfda6f..c2e7fac938 100644
> --- a/target/arm/translate-sve.c
> +++ b/target/arm/translate-sve.c
> @@ -83,6 +83,43 @@ static void do_mov_z(DisasContext *s, int rd, int rn)
>      do_vector2_z(s, tcg_gen_gvec_mov, 0, rd, rn);
>  }
>
> +/* Set the cpu flags as per a return from an SVE helper.  */
> +static void do_pred_flags(TCGv_i32 t)
> +{
> +    tcg_gen_mov_i32(cpu_NF, t);
> +    tcg_gen_andi_i32(cpu_ZF, t, 2);
> +    tcg_gen_andi_i32(cpu_CF, t, 1);
> +    tcg_gen_movi_i32(cpu_VF, 0);
> +}

Why bother returning a value from the helper to then spend time
shuffling it into env->cpu_FLAG when we could do this directly? Does
this aid code generation when flag values are queried?

Also from above:

> + * The return value has bit 31 set if N is set, bit 1 set if Z is clear,
> + * and bit 0 set if C is set.

So there is assumed knowledge in the encoding of cpu_NF here - maybe a
reference to cpu.h where this is codified.

> +
> +/* Subroutines computing the ARM PredTest psuedofunction.  */
> +static void do_predtest1(TCGv_i64 d, TCGv_i64 g)
> +{
> +    TCGv_i32 t =3D tcg_temp_new_i32();
> +
> +    gen_helper_sve_predtest1(t, d, g);
> +    do_pred_flags(t);
> +    tcg_temp_free_i32(t);
> +}
> +
> +static void do_predtest(DisasContext *s, int dofs, int gofs, int words)
> +{
> +    TCGv_ptr dptr =3D tcg_temp_new_ptr();
> +    TCGv_ptr gptr =3D tcg_temp_new_ptr();
> +    TCGv_i32 t;
> +
> +    tcg_gen_addi_ptr(dptr, cpu_env, dofs);
> +    tcg_gen_addi_ptr(gptr, cpu_env, gofs);
> +    t =3D tcg_const_i32(words);
> +
> +    gen_helper_sve_predtest(t, dptr, gptr, t);
> +    tcg_temp_free_ptr(dptr);
> +    tcg_temp_free_ptr(gptr);
> +
> +    do_pred_flags(t);
> +    tcg_temp_free_i32(t);
> +}
> +
>  /*
>   *** SVE Logical - Unpredicated Group
>   */
> @@ -111,6 +148,31 @@ static void trans_BIC_zzz(DisasContext *s, arg_BIC_z=
zz *a, uint32_t insn)
>      do_vector3_z(s, tcg_gen_gvec_andc, 0, a->rd, a->rn, a->rm);
>  }
>
> +/*
> + *** SVE Predicate Misc Group
> + */
> +
> +void trans_PTEST(DisasContext *s, arg_PTEST *a, uint32_t insn)
> +{
> +    int nofs =3D pred_full_reg_offset(s, a->rn);
> +    int gofs =3D pred_full_reg_offset(s, a->pg);
> +    int words =3D DIV_ROUND_UP(pred_full_reg_size(s), 8);
> +
> +    if (words =3D=3D 1) {
> +        TCGv_i64 pn =3D tcg_temp_new_i64();
> +        TCGv_i64 pg =3D tcg_temp_new_i64();
> +
> +        tcg_gen_ld_i64(pn, cpu_env, nofs);
> +        tcg_gen_ld_i64(pg, cpu_env, gofs);
> +        do_predtest1(pn, pg);
> +
> +        tcg_temp_free_i64(pn);
> +        tcg_temp_free_i64(pg);
> +    } else {
> +        do_predtest(s, nofs, gofs, words);
> +    }
> +}
> +
>  /*
>   *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
>   */
> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index 9934cf1d4d..452ac6f453 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -19,4 +19,4 @@ target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve=
.decode $(DECODETREE)
>  	  "GEN", $(TARGET_DIR)$@)
>
>  target/arm/translate-sve.o: target/arm/decode-sve.inc.c
> -obj-$(TARGET_AARCH64) +=3D translate-sve.o
> +obj-$(TARGET_AARCH64) +=3D translate-sve.o sve_helper.o
> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 0c6a7ba34d..7efaa8fe8e 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -56,6 +56,11 @@ ORR_zzz		00000100 01 1 ..... 001 100 ..... .....		@rd_=
rn_rm_e0
>  EOR_zzz		00000100 10 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
>  BIC_zzz		00000100 11 1 ..... 001 100 ..... .....		@rd_rn_rm_e0
>
> +### SVE Predicate Misc Group
> +
> +# SVE predicate test
> +PTEST		00100101 01010000 11 pg:4 0 rn:4 00000
> +
>  ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
>
>  # SVE load predicate register


--
Alex Benn=C3=A9e

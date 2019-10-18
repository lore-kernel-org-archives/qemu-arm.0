Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l6sm6438163wmg.2.2019.10.18.06.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 06:40:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 869D21FF87;
	Fri, 18 Oct 2019 14:40:34 +0100 (BST)
References: <20191017044232.27601-1-richard.henderson@linaro.org>
 <20191017044232.27601-3-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 2/4] target/arm: Convert PMUL.8 to gvec
In-reply-to: <20191017044232.27601-3-richard.henderson@linaro.org>
Date: Fri, 18 Oct 2019 14:40:34 +0100
Message-ID: <87y2xinpd9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: f4GrkGdv9m2i


Richard Henderson <richard.henderson@linaro.org> writes:

> The gvec form will be needed for implementing SVE2.
>
> Extend the implementation to operate on uint64_t instead of uint32_t.
> Use a counted inner loop instead of terminating when op1 goes to zero,
> looking toward the required implementation for ARMv8.4-DIT.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.h        |  3 ++-
>  target/arm/neon_helper.c   | 22 ----------------------
>  target/arm/translate-a64.c | 10 +++-------
>  target/arm/translate.c     | 11 ++++-------
>  target/arm/vec_helper.c    | 30 ++++++++++++++++++++++++++++++
>  5 files changed, 39 insertions(+), 37 deletions(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index fc0d594a14..800446e537 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -335,7 +335,6 @@ DEF_HELPER_2(neon_sub_u8, i32, i32, i32)
>  DEF_HELPER_2(neon_sub_u16, i32, i32, i32)
>  DEF_HELPER_2(neon_mul_u8, i32, i32, i32)
>  DEF_HELPER_2(neon_mul_u16, i32, i32, i32)
> -DEF_HELPER_2(neon_mul_p8, i32, i32, i32)
>  DEF_HELPER_2(neon_mull_p8, i64, i32, i32)
>
>  DEF_HELPER_2(neon_tst_u8, i32, i32, i32)
> @@ -689,6 +688,8 @@ DEF_HELPER_FLAGS_4(gvec_sshl_h, TCG_CALL_NO_RWG, void=
, ptr, ptr, ptr, i32)
>  DEF_HELPER_FLAGS_4(gvec_ushl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i3=
2)
>  DEF_HELPER_FLAGS_4(gvec_ushl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i3=
2)
>
> +DEF_HELPER_FLAGS_4(gvec_pmul_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i3=
2)
> +
>  #ifdef TARGET_AARCH64
>  #include "helper-a64.h"
>  #include "helper-sve.h"
> diff --git a/target/arm/neon_helper.c b/target/arm/neon_helper.c
> index c581ffb7d3..9e7a9a1ac5 100644
> --- a/target/arm/neon_helper.c
> +++ b/target/arm/neon_helper.c
> @@ -1131,28 +1131,6 @@ NEON_VOP(mul_u16, neon_u16, 2)
>
>  /* Polynomial multiplication is like integer multiplication except the
>     partial products are XORed, not added.  */
> -uint32_t HELPER(neon_mul_p8)(uint32_t op1, uint32_t op2)
> -{
> -    uint32_t mask;
> -    uint32_t result;
> -    result =3D 0;
> -    while (op1) {
> -        mask =3D 0;
> -        if (op1 & 1)
> -            mask |=3D 0xff;
> -        if (op1 & (1 << 8))
> -            mask |=3D (0xff << 8);
> -        if (op1 & (1 << 16))
> -            mask |=3D (0xff << 16);
> -        if (op1 & (1 << 24))
> -            mask |=3D (0xff << 24);
> -        result ^=3D op2 & mask;
> -        op1 =3D (op1 >> 1) & 0x7f7f7f7f;
> -        op2 =3D (op2 << 1) & 0xfefefefe;
> -    }
> -    return result;
> -}
> -
>  uint64_t HELPER(neon_mull_p8)(uint32_t op1, uint32_t op2)
>  {
>      uint64_t result =3D 0;
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 255a168df6..04e25cfe06 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -11110,9 +11110,10 @@ static void disas_simd_3same_int(DisasContext *s=
, uint32_t insn)
>      case 0x13: /* MUL, PMUL */
>          if (!u) { /* MUL */
>              gen_gvec_fn3(s, is_q, rd, rn, rm, tcg_gen_gvec_mul, size);
> -            return;
> +        } else {  /* PMUL */
> +            gen_gvec_op3_ool(s, is_q, rd, rn, rm, 0, gen_helper_gvec_pmu=
l_b);
>          }
> -        break;
> +        return;
>      case 0x12: /* MLA, MLS */
>          if (u) {
>              gen_gvec_op3(s, is_q, rd, rn, rm, &mls_op[size]);
> @@ -11242,11 +11243,6 @@ static void disas_simd_3same_int(DisasContext *s=
, uint32_t insn)
>                  genfn =3D fns[size][u];
>                  break;
>              }
> -            case 0x13: /* MUL, PMUL */
> -                assert(u); /* PMUL */
> -                assert(size =3D=3D 0);
> -                genfn =3D gen_helper_neon_mul_p8;
> -                break;
>              case 0x16: /* SQDMULH, SQRDMULH */
>              {
>                  static NeonGenTwoOpEnvFn * const fns[2][2] =3D {
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 598bb1cc00..b66a2f6b71 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -5014,16 +5014,17 @@ static int disas_neon_data_insn(DisasContext *s, =
uint32_t insn)
>
>          case NEON_3R_VMUL: /* VMUL */
>              if (u) {
> -                /* Polynomial case allows only P8 and is handled below. =
 */
> +                /* Polynomial case allows only P8.  */
>                  if (size !=3D 0) {
>                      return 1;
>                  }
> +                tcg_gen_gvec_3_ool(rd_ofs, rn_ofs, rm_ofs, vec_size, vec=
_size,
> +                                   0, gen_helper_gvec_pmul_b);
>              } else {
>                  tcg_gen_gvec_mul(size, rd_ofs, rn_ofs, rm_ofs,
>                                   vec_size, vec_size);
> -                return 0;
>              }
> -            break;
> +            return 0;
>
>          case NEON_3R_VML: /* VMLA, VMLS */
>              tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, vec_size, vec_size,
> @@ -5213,10 +5214,6 @@ static int disas_neon_data_insn(DisasContext *s, u=
int32_t insn)
>              tmp2 =3D neon_load_reg(rd, pass);
>              gen_neon_add(size, tmp, tmp2);
>              break;
> -        case NEON_3R_VMUL:
> -            /* VMUL.P8; other cases already eliminated.  */
> -            gen_helper_neon_mul_p8(tmp, tmp, tmp2);
> -            break;
>          case NEON_3R_VPMAX:
>              GEN_NEON_INTEGER_OP(pmax);
>              break;
> diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
> index fcb3663903..d401282c6f 100644
> --- a/target/arm/vec_helper.c
> +++ b/target/arm/vec_helper.c
> @@ -1134,3 +1134,33 @@ void HELPER(gvec_ushl_h)(void *vd, void *vn, void =
*vm, uint32_t desc)
>      }
>      clear_tail(d, opr_sz, simd_maxsz(desc));
>  }
> +
> +/*
> + * 8x8->8 polynomial multiply.
> + *
> + * Polynomial multiplication is like integer multiplication except the
> + * partial products are XORed, not added.
> + *
> + * TODO: expose this as a generic vector operation, as it is a common
> + * crypto building block.
> + */
> +void HELPER(gvec_pmul_b)(void *vd, void *vn, void *vm, uint32_t desc)
> +{
> +    intptr_t i, j, opr_sz =3D simd_oprsz(desc);
> +    uint64_t *d =3D vd, *n =3D vn, *m =3D vm;
> +
> +    for (i =3D 0; i < opr_sz / 8; ++i) {
> +        uint64_t nn =3D n[i];
> +        uint64_t mm =3D m[i];
> +        uint64_t rr =3D 0;
> +
> +        for (j =3D 0; j < 8; ++j) {
> +            uint64_t mask =3D (nn & 0x0101010101010101ull) * 0xff;
> +            rr ^=3D mm & mask;
> +            mm =3D (mm << 1) & 0xfefefefefefefefeull;
> +            nn =3D (nn >> 1) & 0x7f7f7f7f7f7f7f7full;
> +        }
> +        d[i] =3D rr;
> +    }
> +    clear_tail(d, opr_sz, simd_maxsz(desc));
> +}


--
Alex Benn=C3=A9e

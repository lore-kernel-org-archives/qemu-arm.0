Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j71sm3175966wmj.44.2019.05.02.09.07.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 May 2019 09:07:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1E7921FF87;
	Thu,  2 May 2019 17:07:42 +0100 (BST)
References: <20190501050536.15580-1-richard.henderson@linaro.org> <20190501050536.15580-24-richard.henderson@linaro.org>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-arm] [PATCH v2 23/29] target/arm: Use tcg_gen_abs_i64 and tcg_gen_gvec_abs
In-reply-to: <20190501050536.15580-24-richard.henderson@linaro.org>
Date: Thu, 02 May 2019 17:07:42 +0100
Message-ID: <87zho44z75.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: z+NWg7Gd7+n6


Richard Henderson <richard.henderson@linaro.org> writes:

> Cc: qemu-arm@nongnu.org
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.h        |  2 --
>  target/arm/neon_helper.c   |  5 -----
>  target/arm/translate-a64.c | 41 +++++---------------------------------
>  target/arm/translate.c     | 11 +++-------
>  4 files changed, 8 insertions(+), 51 deletions(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 50cb036378..132aa1682e 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -352,8 +352,6 @@ DEF_HELPER_2(neon_ceq_u8, i32, i32, i32)
>  DEF_HELPER_2(neon_ceq_u16, i32, i32, i32)
>  DEF_HELPER_2(neon_ceq_u32, i32, i32, i32)
>
> -DEF_HELPER_1(neon_abs_s8, i32, i32)
> -DEF_HELPER_1(neon_abs_s16, i32, i32)
>  DEF_HELPER_1(neon_clz_u8, i32, i32)
>  DEF_HELPER_1(neon_clz_u16, i32, i32)
>  DEF_HELPER_1(neon_cls_s8, i32, i32)
> diff --git a/target/arm/neon_helper.c b/target/arm/neon_helper.c
> index ed1c6fc41c..4259056723 100644
> --- a/target/arm/neon_helper.c
> +++ b/target/arm/neon_helper.c
> @@ -1228,11 +1228,6 @@ NEON_VOP(ceq_u16, neon_u16, 2)
>  NEON_VOP(ceq_u32, neon_u32, 1)
>  #undef NEON_FN
>
> -#define NEON_FN(dest, src, dummy) dest =3D (src < 0) ? -src : src
> -NEON_VOP1(abs_s8, neon_s8, 4)
> -NEON_VOP1(abs_s16, neon_s16, 2)
> -#undef NEON_FN
> -
>  /* Count Leading Sign/Zero Bits.  */
>  static inline int do_clz8(uint8_t x)
>  {
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 9dcc5ff3a3..b7c5a928b4 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -9468,11 +9468,7 @@ static void handle_2misc_64(DisasContext *s, int o=
pcode, bool u,
>          if (u) {
>              tcg_gen_neg_i64(tcg_rd, tcg_rn);
>          } else {
> -            TCGv_i64 tcg_zero =3D tcg_const_i64(0);
> -            tcg_gen_neg_i64(tcg_rd, tcg_rn);
> -            tcg_gen_movcond_i64(TCG_COND_GT, tcg_rd, tcg_rn, tcg_zero,
> -                                tcg_rn, tcg_rd);
> -            tcg_temp_free_i64(tcg_zero);
> +            tcg_gen_abs_i64(tcg_rd, tcg_rn);
>          }
>          break;
>      case 0x2f: /* FABS */
> @@ -12366,11 +12362,12 @@ static void disas_simd_two_reg_misc(DisasContex=
t *s, uint32_t insn)
>          }
>          break;
>      case 0xb:
> -        if (u) { /* NEG */
> +        if (u) { /* ABS, NEG */
>              gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_neg, size);
> -            return;
> +        } else {
> +            gen_gvec_fn2(s, is_q, rd, rn, tcg_gen_gvec_abs, size);
>          }
> -        break;
> +        return;
>      }
>
>      if (size =3D=3D 3) {
> @@ -12438,17 +12435,6 @@ static void disas_simd_two_reg_misc(DisasContext=
 *s, uint32_t insn)
>                          gen_helper_neon_qabs_s32(tcg_res, cpu_env, tcg_o=
p);
>                      }
>                      break;
> -                case 0xb: /* ABS, NEG */
> -                    if (u) {
> -                        tcg_gen_neg_i32(tcg_res, tcg_op);
> -                    } else {
> -                        TCGv_i32 tcg_zero =3D tcg_const_i32(0);
> -                        tcg_gen_neg_i32(tcg_res, tcg_op);
> -                        tcg_gen_movcond_i32(TCG_COND_GT, tcg_res, tcg_op,
> -                                            tcg_zero, tcg_op, tcg_res);
> -                        tcg_temp_free_i32(tcg_zero);
> -                    }
> -                    break;
>                  case 0x2f: /* FABS */
>                      gen_helper_vfp_abss(tcg_res, tcg_op);
>                      break;
> @@ -12561,23 +12547,6 @@ static void disas_simd_two_reg_misc(DisasContext=
 *s, uint32_t insn)
>                      tcg_temp_free_i32(tcg_zero);
>                      break;
>                  }
> -                case 0xb: /* ABS, NEG */
> -                    if (u) {
> -                        TCGv_i32 tcg_zero =3D tcg_const_i32(0);
> -                        if (size) {
> -                            gen_helper_neon_sub_u16(tcg_res, tcg_zero, t=
cg_op);
> -                        } else {
> -                            gen_helper_neon_sub_u8(tcg_res, tcg_zero, tc=
g_op);
> -                        }
> -                        tcg_temp_free_i32(tcg_zero);
> -                    } else {
> -                        if (size) {
> -                            gen_helper_neon_abs_s16(tcg_res, tcg_op);
> -                        } else {
> -                            gen_helper_neon_abs_s8(tcg_res, tcg_op);
> -                        }
> -                    }
> -                    break;
>                  case 0x4: /* CLS, CLZ */
>                      if (u) {
>                          if (size =3D=3D 0) {
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index b25781554f..dd053c80d6 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8120,6 +8120,9 @@ static int disas_neon_data_insn(DisasContext *s, ui=
nt32_t insn)
>                  case NEON_2RM_VNEG:
>                      tcg_gen_gvec_neg(size, rd_ofs, rm_ofs, vec_size, vec=
_size);
>                      break;
> +                case NEON_2RM_VABS:
> +                    tcg_gen_gvec_abs(size, rd_ofs, rm_ofs, vec_size, vec=
_size);
> +                    break;
>
>                  default:
>                  elementwise:
> @@ -8225,14 +8228,6 @@ static int disas_neon_data_insn(DisasContext *s, u=
int32_t insn)
>                              }
>                              tcg_temp_free_i32(tmp2);
>                              break;
> -                        case NEON_2RM_VABS:
> -                            switch(size) {
> -                            case 0: gen_helper_neon_abs_s8(tmp, tmp); br=
eak;
> -                            case 1: gen_helper_neon_abs_s16(tmp, tmp); b=
reak;
> -                            case 2: tcg_gen_abs_i32(tmp, tmp); break;
> -                            default: abort();
> -                            }
> -                            break;
>                          case NEON_2RM_VCGT0_F:
>                          {
>                              TCGv_ptr fpstatus =3D get_fpstatus_ptr(1);


--
Alex Benn=C3=A9e

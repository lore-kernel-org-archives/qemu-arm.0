Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 128sm15748124wmi.28.2017.11.13.08.44.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2017 08:44:14 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7BAF83E009E;
	Mon, 13 Nov 2017 16:44:14 +0000 (GMT)
References: <20171004184325.24157-1-richard.henderson@linaro.org> <20171004184325.24157-6-richard.henderson@linaro.org>
User-agent: mu4e 1.0-alpha2; emacs 26.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v1 05/12] target/arm: Decode aa64 armv8.1 scalar/vector x indexed element
In-reply-to: <20171004184325.24157-6-richard.henderson@linaro.org>
Date: Mon, 13 Nov 2017 16:44:14 +0000
Message-ID: <87tvxy9li9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Ud9nDlezWXQx


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/translate-a64.c | 46 ++++++++++++++++++++++++++++++++++++++++=
------
>  1 file changed, 40 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 0ea47a9dff..b02aad8cd7 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -10749,12 +10749,23 @@ static void disas_simd_indexed(DisasContext *s,=
 uint32_t insn)
>          is_long =3D true;
>          /* fall through */
>      case 0xc: /* SQDMULH */
> -    case 0xd: /* SQRDMULH */
>          if (u) {
>              unallocated_encoding(s);
>              return;
>          }
>          break;
> +    case 0xd: /* SQRDMULH / SQRDMLAH */
> +        if (u && !arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
> +            unallocated_encoding(s);
> +            return;
> +        }
> +        break;
> +    case 0xf: /* SQRDMLSH */
> +        if (!u || !arm_dc_feature(s, ARM_FEATURE_V8_1_SIMD)) {
> +            unallocated_encoding(s);
> +            return;
> +        }
> +        break;
>      case 0x8: /* MUL */
>          if (u || is_scalar) {
>              unallocated_encoding(s);
> @@ -10941,13 +10952,36 @@ static void disas_simd_indexed(DisasContext *s,=
 uint32_t insn)
>                                                 tcg_op, tcg_idx);
>                  }
>                  break;
> -            case 0xd: /* SQRDMULH */
> +            case 0xd: /* SQRDMULH / SQRDMLAH */
> +                if (u) { /* SQRDMLAH */
> +                    read_vec_element_i32(s, tcg_res, rd, pass,
> +                                         is_scalar ? size : MO_32);
> +                    if (size =3D=3D 1) {
> +                        gen_helper_neon_qrdmlah_s16(tcg_res, cpu_env,
> +                                                    tcg_op, tcg_idx, tcg=
_res);
> +                    } else {
> +                        gen_helper_neon_qrdmlah_s32(tcg_res, cpu_env,
> +                                                    tcg_op, tcg_idx, tcg=
_res);
> +                    }
> +                } else { /* SQRDMULH */
> +                    if (size =3D=3D 1) {
> +                        gen_helper_neon_qrdmulh_s16(tcg_res, cpu_env,
> +                                                    tcg_op, tcg_idx);
> +                    } else {
> +                        gen_helper_neon_qrdmulh_s32(tcg_res, cpu_env,
> +                                                    tcg_op, tcg_idx);
> +                    }
> +                }
> +                break;
> +            case 0xf: /* SQRDMLSH */
> +                read_vec_element_i32(s, tcg_res, rd, pass,
> +                                     is_scalar ? size : MO_32);
>                  if (size =3D=3D 1) {
> -                    gen_helper_neon_qrdmulh_s16(tcg_res, cpu_env,
> -                                                tcg_op, tcg_idx);
> +                    gen_helper_neon_qrdmlsh_s16(tcg_res, cpu_env,
> +                                                tcg_op, tcg_idx, tcg_res=
);
>                  } else {
> -                    gen_helper_neon_qrdmulh_s32(tcg_res, cpu_env,
> -                                                tcg_op, tcg_idx);
> +                    gen_helper_neon_qrdmlsh_s32(tcg_res, cpu_env,
> +                                                tcg_op, tcg_idx, tcg_res=
);
>                  }
>                  break;
>              default:


--
Alex Benn=C3=A9e

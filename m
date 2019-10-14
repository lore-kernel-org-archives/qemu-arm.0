Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d193sm33043084wmd.0.2019.10.14.09.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 09:39:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 41AB11FF87;
	Mon, 14 Oct 2019 17:39:53 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-10-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 09/20] target/arm: Hoist XSCALE_CPAR, VECLEN,
 VECSTRIDE in cpu_get_tb_cpu_state
In-reply-to: <20191011155546.14342-10-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 17:39:53 +0100
Message-ID: <87k197mgbq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: XwFazpBBLl2X


Richard Henderson <richard.henderson@linaro.org> writes:

> We do not need to compute any of these values for M-profile.
> Further, XSCALE_CPAR overlaps VECSTRIDE so obviously the two
> sets must be mutually exclusive.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ddd21edfcf..e2a62cf19a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11235,21 +11235,28 @@ void cpu_get_tb_cpu_state(CPUARMState *env, tar=
get_ulong *pc,
>              }
>          } else {
>              flags =3D rebuild_hflags_a32(env, fp_el, mmu_idx);
> +
> +            /*
> +             * Note that XSCALE_CPAR shares bits with VECSTRIDE.
> +             * Note that VECLEN+VECSTRIDE are RES0 for M-profile.
> +             */
> +            if (arm_feature(env, ARM_FEATURE_XSCALE)) {
> +                flags =3D FIELD_DP32(flags, TBFLAG_A32,
> +                                   XSCALE_CPAR, env->cp15.c15_cpar);
> +            } else {
> +                flags =3D FIELD_DP32(flags, TBFLAG_A32, VECLEN,
> +                                   env->vfp.vec_len);
> +                flags =3D FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
> +                                   env->vfp.vec_stride);
> +            }
>          }
>
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
> -        flags =3D FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len=
);
> -        flags =3D FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_=
stride);
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_=
bits);
>          if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
>              || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)=
) {
>              flags =3D FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
>          }
> -        /* Note that XSCALE_CPAR shares bits with VECSTRIDE */
> -        if (arm_feature(env, ARM_FEATURE_XSCALE)) {
> -            flags =3D FIELD_DP32(flags, TBFLAG_A32,
> -                               XSCALE_CPAR, env->cp15.c15_cpar);
> -        }
>      }
>
>      /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine


--
Alex Benn=C3=A9e

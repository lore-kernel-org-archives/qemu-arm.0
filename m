Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o18sm47754615wrw.90.2019.10.14.09.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 09:17:23 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3D62F1FF87;
	Mon, 14 Oct 2019 17:17:23 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-7-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v6 06/20] target/arm: Reduce tests vs M-profile in
 cpu_get_tb_cpu_state
In-reply-to: <20191011155546.14342-7-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 17:17:23 +0100
Message-ID: <87pnizmhd8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0qPiGzxoBGH+


Richard Henderson <richard.henderson@linaro.org> writes:

> Hoist the computation of some TBFLAG_A32 bits that only apply to
> M-profile under a single test for ARM_FEATURE_M.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 49 +++++++++++++++++++++------------------------
>  1 file changed, 23 insertions(+), 26 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d4303420da..296a4b2232 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11194,6 +11194,29 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>
>          if (arm_feature(env, ARM_FEATURE_M)) {
>              flags =3D rebuild_hflags_m32(env, fp_el, mmu_idx);
> +
> +            if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
> +                FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
> +                !=3D env->v7m.secure) {
> +                flags =3D FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1=
);
> +            }
> +
> +            if ((env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MAS=
K) &&
> +                (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) =
||
> +                 (env->v7m.secure &&
> +                  !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)=
))) {
> +                /*
> +                 * ASPEN is set, but FPCA/SFPA indicate that there is no
> +                 * active FP context; we must create a new FP context be=
fore
> +                 * executing any FP insn.
> +                 */
> +                flags =3D FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEED=
ED, 1);
> +            }
> +
> +            bool is_secure =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_M=
ASK;
> +            if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
> +                flags =3D FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
> +            }
>          } else {
>              flags =3D rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
>          }
> @@ -11233,32 +11256,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>          }
>      }
>
> -    if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
> -        FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) !=3D env->v7m.=
secure) {
> -        flags =3D FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);
> -    }
> -
> -    if (arm_feature(env, ARM_FEATURE_M) &&
> -        (env->v7m.fpccr[env->v7m.secure] & R_V7M_FPCCR_ASPEN_MASK) &&
> -        (!(env->v7m.control[M_REG_S] & R_V7M_CONTROL_FPCA_MASK) ||
> -         (env->v7m.secure &&
> -          !(env->v7m.control[M_REG_S] & R_V7M_CONTROL_SFPA_MASK)))) {
> -        /*
> -         * ASPEN is set, but FPCA/SFPA indicate that there is no active
> -         * FP context; we must create a new FP context before executing
> -         * any FP insn.
> -         */
> -        flags =3D FIELD_DP32(flags, TBFLAG_A32, NEW_FP_CTXT_NEEDED, 1);
> -    }
> -
> -    if (arm_feature(env, ARM_FEATURE_M)) {
> -        bool is_secure =3D env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
> -
> -        if (env->v7m.fpccr[is_secure] & R_V7M_FPCCR_LSPACT_MASK) {
> -            flags =3D FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
> -        }
> -    }
> -
>      if (!arm_feature(env, ARM_FEATURE_M)) {
>          int target_el =3D arm_debug_target_el(env);


--
Alex Benn=C3=A9e

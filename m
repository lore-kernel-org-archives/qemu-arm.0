Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o19sm23260481wmh.27.2019.10.14.09.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 09:13:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DB22A1FF87;
	Mon, 14 Oct 2019 17:13:06 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-6-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 05/20] target/arm: Split out rebuild_hflags_m32
In-reply-to: <20191011155546.14342-6-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 17:13:06 +0100
Message-ID: <87r23fmhkd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: PJOXMLT+Em4D


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a function to compute the values of the TBFLAG_A32 bits
> that will be cached, and are used by M-profile.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 45 ++++++++++++++++++++++++++++++---------------
>  1 file changed, 30 insertions(+), 15 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 4c65476d93..d4303420da 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11083,6 +11083,29 @@ static uint32_t rebuild_hflags_common_32(CPUARMS=
tate *env, int fp_el,
>      return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
>  }
>
> +static uint32_t rebuild_hflags_m32(CPUARMState *env, int fp_el,
> +                                   ARMMMUIdx mmu_idx)
> +{
> +    uint32_t flags =3D 0;
> +
> +    if (arm_v7m_is_handler_mode(env)) {
> +        flags =3D FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
> +    }
> +
> +    /*
> +     * v8M always applies stack limit checks unless CCR.STKOFHFNMIGN
> +     * is suppressing them because the requested execution priority
> +     * is less than 0.
> +     */
> +    if (arm_feature(env, ARM_FEATURE_V8) &&
> +        !((mmu_idx & ARM_MMU_IDX_M_NEGPRI) &&
> +          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))=
) {
> +        flags =3D FIELD_DP32(flags, TBFLAG_A32, STACKCHECK, 1);
> +    }
> +
> +    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
> +}
> +
>  static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>                                     ARMMMUIdx mmu_idx)
>  {
> @@ -11168,7 +11191,13 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>          }
>      } else {
>          *pc =3D env->regs[15];
> -        flags =3D rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
> +
> +        if (arm_feature(env, ARM_FEATURE_M)) {
> +            flags =3D rebuild_hflags_m32(env, fp_el, mmu_idx);
> +        } else {
> +            flags =3D rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
> +        }
> +
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len=
);
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_=
stride);
> @@ -11204,20 +11233,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>          }
>      }
>
> -    if (arm_v7m_is_handler_mode(env)) {
> -        flags =3D FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
> -    }
> -
> -    /* v8M always applies stack limit checks unless CCR.STKOFHFNMIGN is
> -     * suppressing them because the requested execution priority is less=
 than 0.
> -     */
> -    if (arm_feature(env, ARM_FEATURE_V8) &&
> -        arm_feature(env, ARM_FEATURE_M) &&
> -        !((mmu_idx  & ARM_MMU_IDX_M_NEGPRI) &&
> -          (env->v7m.ccr[env->v7m.secure] & R_V7M_CCR_STKOFHFNMIGN_MASK))=
) {
> -        flags =3D FIELD_DP32(flags, TBFLAG_A32, STACKCHECK, 1);
> -    }
> -
>      if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
>          FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S) !=3D env->v7m.=
secure) {
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, FPCCR_S_WRONG, 1);


--
Alex Benn=C3=A9e

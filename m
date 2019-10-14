Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id t203sm22713511wmf.42.2019.10.14.11.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 11:47:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5C5B41FF87;
	Mon, 14 Oct 2019 19:47:13 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-13-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 12/20] target/arm: Add arm_rebuild_hflags
In-reply-to: <20191011155546.14342-13-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 19:47:13 +0100
Message-ID: <87eezfmafi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: trR1cGsIhrb9


Richard Henderson <richard.henderson@linaro.org> writes:

> This function assumes nothing about the current state of the cpu,
> and writes the computed value to env->hflags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h    |  6 ++++++
>  target/arm/helper.c | 30 ++++++++++++++++++++++--------
>  2 files changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9909ff89d4..d844ea21d8 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3297,6 +3297,12 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, =
ARMELChangeHookFn *hook,
>  void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook, v=
oid
>          *opaque);
>
> +/**
> + * arm_rebuild_hflags:
> + * Rebuild the cached TBFLAGS for arbitrary changed processor state.
> + */
> +void arm_rebuild_hflags(CPUARMState *env);
> +
>  /**
>   * aa32_vfp_dreg:
>   * Return a pointer to the Dn register within env in 32-bit mode.
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 89aa6fd933..85de96d071 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11198,17 +11198,35 @@ static uint32_t rebuild_hflags_a64(CPUARMState =
*env, int el, int fp_el,
>      return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
>  }
>
> +static uint32_t rebuild_hflags_internal(CPUARMState *env)
> +{
> +    int el =3D arm_current_el(env);
> +    int fp_el =3D fp_exception_el(env, el);
> +    ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
> +
> +    if (is_a64(env)) {
> +        return rebuild_hflags_a64(env, el, fp_el, mmu_idx);
> +    } else if (arm_feature(env, ARM_FEATURE_M)) {
> +        return rebuild_hflags_m32(env, fp_el, mmu_idx);
> +    } else {
> +        return rebuild_hflags_a32(env, fp_el, mmu_idx);
> +    }
> +}
> +
> +void arm_rebuild_hflags(CPUARMState *env)
> +{
> +    env->hflags =3D rebuild_hflags_internal(env);
> +}
> +
>  void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags)
>  {
> -    ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
> -    int current_el =3D arm_current_el(env);
> -    int fp_el =3D fp_exception_el(env, current_el);
>      uint32_t flags, pstate_for_ss;
>
> +    flags =3D rebuild_hflags_internal(env);
> +
>      if (is_a64(env)) {
>          *pc =3D env->pc;
> -        flags =3D rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
>          if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
>              flags =3D FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
>          }
> @@ -11217,8 +11235,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>          *pc =3D env->regs[15];
>
>          if (arm_feature(env, ARM_FEATURE_M)) {
> -            flags =3D rebuild_hflags_m32(env, fp_el, mmu_idx);
> -
>              if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
>                  FIELD_EX32(env->v7m.fpccr[M_REG_S], V7M_FPCCR, S)
>                  !=3D env->v7m.secure) {
> @@ -11242,8 +11258,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>                  flags =3D FIELD_DP32(flags, TBFLAG_A32, LSPACT, 1);
>              }
>          } else {
> -            flags =3D rebuild_hflags_a32(env, fp_el, mmu_idx);
> -
>              /*
>               * Note that XSCALE_CPAR shares bits with VECSTRIDE.
>               * Note that VECLEN+VECSTRIDE are RES0 for M-profile.


--
Alex Benn=C3=A9e

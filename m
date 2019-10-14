Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n14sm16456526wro.83.2019.10.14.11.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 11:21:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 44C7F1FF87;
	Mon, 14 Oct 2019 19:21:14 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-11-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v6 10/20] target/arm: Simplify set of PSTATE_SS in
 cpu_get_tb_cpu_state
In-reply-to: <20191011155546.14342-11-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 19:21:14 +0100
Message-ID: <87h84bmbmt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xhgmTTYXA8Uo


Richard Henderson <richard.henderson@linaro.org> writes:

> Hoist the variable load for PSTATE into the existing test vs is_a64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index e2a62cf19a..398e5f5d6d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11197,7 +11197,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>      ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
>      int current_el =3D arm_current_el(env);
>      int fp_el =3D fp_exception_el(env, current_el);
> -    uint32_t flags;
> +    uint32_t flags, pstate_for_ss;
>
>      if (is_a64(env)) {
>          *pc =3D env->pc;
> @@ -11205,6 +11205,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>          if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
>              flags =3D FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
>          }
> +        pstate_for_ss =3D env->pstate;
>      } else {
>          *pc =3D env->regs[15];
>
> @@ -11257,9 +11258,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>              || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)=
) {
>              flags =3D FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
>          }
> +        pstate_for_ss =3D env->uncached_cpsr;
>      }
>
> -    /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
> +    /*
> +     * The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
>       * states defined in the ARM ARM for software singlestep:
>       *  SS_ACTIVE   PSTATE.SS   State
>       *     0            x       Inactive (the TB flag for SS is always 0)
> @@ -11267,16 +11270,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>       *     1            1       Active-not-pending
>       * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
>       */
> -    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE)) {
> -        if (is_a64(env)) {
> -            if (env->pstate & PSTATE_SS) {
> -                flags =3D FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
> -            }
> -        } else {
> -            if (env->uncached_cpsr & PSTATE_SS) {
> -                flags =3D FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
> -            }
> -        }
> +    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE) &&
> +        (pstate_for_ss & PSTATE_SS)) {
> +        flags =3D FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
>      }
>
>      *pflags =3D flags;


--
Alex Benn=C3=A9e

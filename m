Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x5sm34222663wrg.69.2019.10.14.08.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 08:43:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 773881FF87;
	Mon, 14 Oct 2019 16:43:40 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-3-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v6 02/20] target/arm: Split out rebuild_hflags_a64
In-reply-to: <20191011155546.14342-3-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 16:43:40 +0100
Message-ID: <87v9srmixf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: s4wBtVvENqTB


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a function to compute the values of the TBFLAG_A64 bits
> that will be cached.  For now, the env->hflags variable is not
> used, and the results are fed back to cpu_get_tb_cpu_state.
>
> Note that not all BTI related flags are cached, so we have to
> test the BTI feature twice -- once for those bits moved out to
> rebuild_hflags_a64 and once for those bits that remain in
> cpu_get_tb_cpu_state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 131 +++++++++++++++++++++++---------------------
>  1 file changed, 69 insertions(+), 62 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8829d91ae1..69da04786e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11070,6 +11070,71 @@ static uint32_t rebuild_hflags_common(CPUARMStat=
e *env, int fp_el,
>      return flags;
>  }
>
> +static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
> +                                   ARMMMUIdx mmu_idx)
> +{
> +    ARMMMUIdx stage1 =3D stage_1_mmu_idx(mmu_idx);
> +    ARMVAParameters p0 =3D aa64_va_parameters_both(env, 0, stage1);
> +    uint32_t flags =3D 0;
> +    uint64_t sctlr;
> +    int tbii, tbid;
> +
> +    flags =3D FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
> +
> +    /* FIXME: ARMv8.1-VHE S2 translation regime.  */
> +    if (regime_el(env, stage1) < 2) {
> +        ARMVAParameters p1 =3D aa64_va_parameters_both(env, -1, stage1);
> +        tbid =3D (p1.tbi << 1) | p0.tbi;
> +        tbii =3D tbid & ~((p1.tbid << 1) | p0.tbid);
> +    } else {
> +        tbid =3D p0.tbi;
> +        tbii =3D tbid & !p0.tbid;
> +    }
> +
> +    flags =3D FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
> +    flags =3D FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
> +
> +    if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
> +        int sve_el =3D sve_exception_el(env, el);
> +        uint32_t zcr_len;
> +
> +        /*
> +         * If SVE is disabled, but FP is enabled,
> +         * then the effective len is 0.
> +         */
> +        if (sve_el !=3D 0 && fp_el =3D=3D 0) {
> +            zcr_len =3D 0;
> +        } else {
> +            zcr_len =3D sve_zcr_len_for_el(env, el);
> +        }
> +        flags =3D FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
> +        flags =3D FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
> +    }
> +
> +    sctlr =3D arm_sctlr(env, el);
> +
> +    if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
> +        /*
> +         * In order to save space in flags, we record only whether
> +         * pauth is "inactive", meaning all insns are implemented as
> +         * a nop, or "active" when some action must be performed.
> +         * The decision of which action to take is left to a helper.
> +         */
> +        if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_EnDB))=
 {
> +            flags =3D FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
> +        }
> +    }
> +
> +    if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
> +        /* Note that SCTLR_EL[23].BT =3D=3D SCTLR_BT1.  */
> +        if (sctlr & (el =3D=3D 0 ? SCTLR_BT0 : SCTLR_BT1)) {
> +            flags =3D FIELD_DP32(flags, TBFLAG_A64, BT, 1);
> +        }
> +    }
> +
> +    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
> +}
> +
>  void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags)
>  {
> @@ -11079,67 +11144,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>      uint32_t flags =3D 0;
>
>      if (is_a64(env)) {
> -        ARMCPU *cpu =3D env_archcpu(env);
> -        uint64_t sctlr;
> -
>          *pc =3D env->pc;
> -        flags =3D FIELD_DP32(flags, TBFLAG_ANY, AARCH64_STATE, 1);
> -
> -        /* Get control bits for tagged addresses.  */
> -        {
> -            ARMMMUIdx stage1 =3D stage_1_mmu_idx(mmu_idx);
> -            ARMVAParameters p0 =3D aa64_va_parameters_both(env, 0, stage=
1);
> -            int tbii, tbid;
> -
> -            /* FIXME: ARMv8.1-VHE S2 translation regime.  */
> -            if (regime_el(env, stage1) < 2) {
> -                ARMVAParameters p1 =3D aa64_va_parameters_both(env, -1, =
stage1);
> -                tbid =3D (p1.tbi << 1) | p0.tbi;
> -                tbii =3D tbid & ~((p1.tbid << 1) | p0.tbid);
> -            } else {
> -                tbid =3D p0.tbi;
> -                tbii =3D tbid & !p0.tbid;
> -            }
> -
> -            flags =3D FIELD_DP32(flags, TBFLAG_A64, TBII, tbii);
> -            flags =3D FIELD_DP32(flags, TBFLAG_A64, TBID, tbid);
> -        }
> -
> -        if (cpu_isar_feature(aa64_sve, cpu)) {
> -            int sve_el =3D sve_exception_el(env, current_el);
> -            uint32_t zcr_len;
> -
> -            /* If SVE is disabled, but FP is enabled,
> -             * then the effective len is 0.
> -             */
> -            if (sve_el !=3D 0 && fp_el =3D=3D 0) {
> -                zcr_len =3D 0;
> -            } else {
> -                zcr_len =3D sve_zcr_len_for_el(env, current_el);
> -            }
> -            flags =3D FIELD_DP32(flags, TBFLAG_A64, SVEEXC_EL, sve_el);
> -            flags =3D FIELD_DP32(flags, TBFLAG_A64, ZCR_LEN, zcr_len);
> -        }
> -
> -        sctlr =3D arm_sctlr(env, current_el);
> -
> -        if (cpu_isar_feature(aa64_pauth, cpu)) {
> -            /*
> -             * In order to save space in flags, we record only whether
> -             * pauth is "inactive", meaning all insns are implemented as
> -             * a nop, or "active" when some action must be performed.
> -             * The decision of which action to take is left to a helper.
> -             */
> -            if (sctlr & (SCTLR_EnIA | SCTLR_EnIB | SCTLR_EnDA | SCTLR_En=
DB)) {
> -                flags =3D FIELD_DP32(flags, TBFLAG_A64, PAUTH_ACTIVE, 1);
> -            }
> -        }
> -
> -        if (cpu_isar_feature(aa64_bti, cpu)) {
> -            /* Note that SCTLR_EL[23].BT =3D=3D SCTLR_BT1.  */
> -            if (sctlr & (current_el =3D=3D 0 ? SCTLR_BT0 : SCTLR_BT1)) {
> -                flags =3D FIELD_DP32(flags, TBFLAG_A64, BT, 1);
> -            }
> +        flags =3D rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
> +        if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
>              flags =3D FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);
>          }
>      } else {
> @@ -11159,9 +11166,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>              flags =3D FIELD_DP32(flags, TBFLAG_A32,
>                                 XSCALE_CPAR, env->cp15.c15_cpar);
>          }
> -    }
>
> -    flags =3D rebuild_hflags_common(env, fp_el, mmu_idx, flags);
> +        flags =3D rebuild_hflags_common(env, fp_el, mmu_idx, flags);
> +    }
>
>      /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
>       * states defined in the ARM ARM for software singlestep:


--
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q19sm37513441wra.89.2019.10.14.09.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 09:01:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AFDFE1FF87;
	Mon, 14 Oct 2019 17:01:02 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-5-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 04/20] target/arm: Split arm_cpu_data_is_big_endian
In-reply-to: <20191011155546.14342-5-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 17:01:02 +0100
Message-ID: <87sgnvmi4h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vu+qeWfP0RE3


Richard Henderson <richard.henderson@linaro.org> writes:

> Set TBFLAG_ANY.BE_DATA in rebuild_hflags_common_32 and
> rebuild_hflags_a64 instead of rebuild_hflags_common, where we do
> not need to re-test is_a64() nor re-compute the various inputs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h    | 49 +++++++++++++++++++++++++++------------------
>  target/arm/helper.c | 16 +++++++++++----
>  2 files changed, 42 insertions(+), 23 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ad79a6153b..4d961474ce 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3108,33 +3108,44 @@ static inline uint64_t arm_sctlr(CPUARMState *env=
, int el)
>      }
>  }
>
> +static inline bool arm_cpu_data_is_big_endian_a32(CPUARMState *env,
> +                                                  bool sctlr_b)
> +{
> +#ifdef CONFIG_USER_ONLY
> +    /*
> +     * In system mode, BE32 is modelled in line with the
> +     * architecture (as word-invariant big-endianness), where loads
> +     * and stores are done little endian but from addresses which
> +     * are adjusted by XORing with the appropriate constant. So the
> +     * endianness to use for the raw data access is not affected by
> +     * SCTLR.B.
> +     * In user mode, however, we model BE32 as byte-invariant
> +     * big-endianness (because user-only code cannot tell the
> +     * difference), and so we need to use a data access endianness
> +     * that depends on SCTLR.B.
> +     */
> +    if (sctlr_b) {
> +        return true;
> +    }
> +#endif
> +    /* In 32bit endianness is determined by looking at CPSR's E bit */
> +    return env->uncached_cpsr & CPSR_E;
> +}
> +
> +static inline bool arm_cpu_data_is_big_endian_a64(int el, uint64_t sctlr)
> +{
> +    return sctlr & (el ? SCTLR_EE : SCTLR_E0E);
> +}
>
>  /* Return true if the processor is in big-endian mode. */
>  static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
>  {
> -    /* In 32bit endianness is determined by looking at CPSR's E bit */
>      if (!is_a64(env)) {
> -        return
> -#ifdef CONFIG_USER_ONLY
> -            /* In system mode, BE32 is modelled in line with the
> -             * architecture (as word-invariant big-endianness), where lo=
ads
> -             * and stores are done little endian but from addresses which
> -             * are adjusted by XORing with the appropriate constant. So =
the
> -             * endianness to use for the raw data access is not affected=
 by
> -             * SCTLR.B.
> -             * In user mode, however, we model BE32 as byte-invariant
> -             * big-endianness (because user-only code cannot tell the
> -             * difference), and so we need to use a data access endianne=
ss
> -             * that depends on SCTLR.B.
> -             */
> -            arm_sctlr_b(env) ||
> -#endif
> -                ((env->uncached_cpsr & CPSR_E) ? 1 : 0);
> +        return arm_cpu_data_is_big_endian_a32(env, arm_sctlr_b(env));
>      } else {
>          int cur_el =3D arm_current_el(env);
>          uint64_t sctlr =3D arm_sctlr(env, cur_el);
> -
> -        return (sctlr & (cur_el ? SCTLR_EE : SCTLR_E0E)) !=3D 0;
> +        return arm_cpu_data_is_big_endian_a64(cur_el, sctlr);
>      }
>  }
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f05d042474..4c65476d93 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11061,9 +11061,6 @@ static uint32_t rebuild_hflags_common(CPUARMState=
 *env, int fp_el,
>      flags =3D FIELD_DP32(flags, TBFLAG_ANY, MMUIDX,
>                         arm_to_core_mmu_idx(mmu_idx));
>
> -    if (arm_cpu_data_is_big_endian(env)) {
> -        flags =3D FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
> -    }
>      if (arm_singlestep_active(env)) {
>          flags =3D FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
>      }
> @@ -11073,7 +11070,14 @@ static uint32_t rebuild_hflags_common(CPUARMStat=
e *env, int fp_el,
>  static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
>                                           ARMMMUIdx mmu_idx, uint32_t fla=
gs)
>  {
> -    flags =3D FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
> +    bool sctlr_b =3D arm_sctlr_b(env);
> +
> +    if (sctlr_b) {
> +        flags =3D FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, 1);
> +    }
> +    if (arm_cpu_data_is_big_endian_a32(env, sctlr_b)) {
> +        flags =3D FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
> +    }
>      flags =3D FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
>
>      return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
> @@ -11122,6 +11126,10 @@ static uint32_t rebuild_hflags_a64(CPUARMState *=
env, int el, int fp_el,
>
>      sctlr =3D arm_sctlr(env, el);
>
> +    if (arm_cpu_data_is_big_endian_a64(el, sctlr)) {
> +        flags =3D FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
> +    }
> +
>      if (cpu_isar_feature(aa64_pauth, env_archcpu(env))) {
>          /*
>           * In order to save space in flags, we record only whether


--
Alex Benn=C3=A9e

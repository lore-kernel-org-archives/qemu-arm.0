Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s22sm2482499wmc.7.2019.09.05.08.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 08:28:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E17CC1FF87;
	Thu,  5 Sep 2019 16:28:41 +0100 (BST)
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <20190820210720.18976-3-richard.henderson@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-arm] [PATCH v5 02/17] target/arm: Split out
 rebuild_hflags_a64
In-reply-to: <20190820210720.18976-3-richard.henderson@linaro.org>
Date: Thu, 05 Sep 2019 16:28:41 +0100
Message-ID: <875zm692za.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FYvfdj/wwOqR


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a function to compute the values of the TBFLAG_A64 bits
> that will be cached.  For now, the env->hflags variable is not
> used, and the results are fed back to cpu_get_tb_cpu_state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 131 +++++++++++++++++++++++---------------------
>  1 file changed, 69 insertions(+), 62 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f2c6419369..02cb43cf58 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11032,6 +11032,71 @@ static uint32_t rebuild_hflags_common(CPUARMStat=
e *env, int fp_el,
>      return flags;
>  }
>
> +static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
> +                                   ARMMMUIdx mmu_idx)
> +{
<snip>
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
> @@ -11041,67 +11106,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>      uint32_t flags =3D 0;
>
>      if (is_a64(env)) {
<snip>
> -
> -        if (cpu_isar_feature(aa64_bti, cpu)) {
> -            /* Note that SCTLR_EL[23].BT =3D=3D SCTLR_BT1.  */
> -            if (sctlr & (current_el =3D=3D 0 ? SCTLR_BT0 : SCTLR_BT1)) {
> -                flags =3D FIELD_DP32(flags, TBFLAG_A64, BT, 1);
> -            }
> +        flags =3D rebuild_hflags_a64(env, current_el, fp_el, mmu_idx);
> +        if (cpu_isar_feature(aa64_bti, env_archcpu(env))) {
>              flags =3D FIELD_DP32(flags, TBFLAG_A64, BTYPE, env->btype);

It seems off to only hoist part of the BTI flag check into the helper,
was it just missed or is there a reason? If so it could probably do with
an additional comment.

>          }
>      } else {
> @@ -11121,9 +11128,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
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

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 3sm19810780wmo.22.2019.10.14.08.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 08:53:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2A2CA1FF87;
	Mon, 14 Oct 2019 16:53:48 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-4-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 03/20] target/arm: Split out rebuild_hflags_common_32
In-reply-to: <20191011155546.14342-4-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 16:53:48 +0100
Message-ID: <87tv8bmigj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: t8F4KrHfjLzs


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a function to compute the values of the TBFLAG_A32 bits
> that will be cached, and are used by all profiles.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 69da04786e..f05d042474 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11070,6 +11070,15 @@ static uint32_t rebuild_hflags_common(CPUARMStat=
e *env, int fp_el,
>      return flags;
>  }
>
> +static uint32_t rebuild_hflags_common_32(CPUARMState *env, int fp_el,
> +                                         ARMMMUIdx mmu_idx, uint32_t fla=
gs)
> +{
> +    flags =3D FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env));
> +    flags =3D FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(env));
> +
> +    return rebuild_hflags_common(env, fp_el, mmu_idx, flags);
> +}
> +
>  static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>                                     ARMMMUIdx mmu_idx)
>  {
> @@ -11141,7 +11150,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>      ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
>      int current_el =3D arm_current_el(env);
>      int fp_el =3D fp_exception_el(env, current_el);
> -    uint32_t flags =3D 0;
> +    uint32_t flags;
>
>      if (is_a64(env)) {
>          *pc =3D env->pc;
> @@ -11151,12 +11160,11 @@ void cpu_get_tb_cpu_state(CPUARMState *env, tar=
get_ulong *pc,
>          }
>      } else {
>          *pc =3D env->regs[15];
> +        flags =3D rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, VECLEN, env->vfp.vec_len=
);
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE, env->vfp.vec_=
stride);
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_=
bits);
> -        flags =3D FIELD_DP32(flags, TBFLAG_A32, SCTLR_B, arm_sctlr_b(env=
));
> -        flags =3D FIELD_DP32(flags, TBFLAG_A32, NS, !access_secure_reg(e=
nv));
>          if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
>              || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)=
) {
>              flags =3D FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
> @@ -11166,8 +11174,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>              flags =3D FIELD_DP32(flags, TBFLAG_A32,
>                                 XSCALE_CPAR, env->cp15.c15_cpar);
>          }
> -
> -        flags =3D rebuild_hflags_common(env, fp_el, mmu_idx, flags);
>      }
>
>      /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine


--
Alex Benn=C3=A9e

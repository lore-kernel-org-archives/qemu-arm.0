Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a2sm21291230wrp.11.2019.10.14.11.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 11:46:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D09351FF87;
	Mon, 14 Oct 2019 19:46:12 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-12-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 11/20] target/arm: Hoist computation of TBFLAG_A32.VFPEN
In-reply-to: <20191011155546.14342-12-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 19:46:12 +0100
Message-ID: <87ftjvmah7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ndcC50nQeewg


Richard Henderson <richard.henderson@linaro.org> writes:

> There are 3 conditions that each enable this flag.  M-profile always
> enables; A-profile with EL1 as AA64 always enables.  Both of these
> conditions can easily be cached.  The final condition relies on the
> FPEXC register which we are not prepared to cache.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    |  2 +-
>  target/arm/helper.c | 14 ++++++++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 4d961474ce..9909ff89d4 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3192,7 +3192,7 @@ FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
>   * the same thing as the current security state of the processor!
>   */
>  FIELD(TBFLAG_A32, NS, 6, 1)
> -FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Not cached. */
> +FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Partially cached, minus FPEXC=
. */
>  FIELD(TBFLAG_A32, CONDEXEC, 8, 8)       /* Not cached. */
>  FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
>  /* For M profile only, set if FPCCR.LSPACT is set */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 398e5f5d6d..89aa6fd933 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11088,6 +11088,9 @@ static uint32_t rebuild_hflags_m32(CPUARMState *e=
nv, int fp_el,
>  {
>      uint32_t flags =3D 0;
>
> +    /* v8M always enables the fpu.  */
> +    flags =3D FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
> +
>      if (arm_v7m_is_handler_mode(env)) {
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);
>      }
> @@ -11119,6 +11122,10 @@ static uint32_t rebuild_hflags_a32(CPUARMState *=
env, int fp_el,
>                                     ARMMMUIdx mmu_idx)
>  {
>      uint32_t flags =3D rebuild_hflags_aprofile(env);
> +
> +    if (arm_el_is_aa64(env, 1)) {
> +        flags =3D FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
> +    }
>      return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
>  }
>
> @@ -11250,14 +11257,13 @@ void cpu_get_tb_cpu_state(CPUARMState *env, tar=
get_ulong *pc,
>                  flags =3D FIELD_DP32(flags, TBFLAG_A32, VECSTRIDE,
>                                     env->vfp.vec_stride);
>              }
> +            if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)) {
> +                flags =3D FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
> +            }

We seem to be short of symbolic definitions for this bit but whatever:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

>          }
>
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, THUMB, env->thumb);
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, CONDEXEC, env->condexec_=
bits);
> -        if (env->vfp.xregs[ARM_VFP_FPEXC] & (1 << 30)
> -            || arm_el_is_aa64(env, 1) || arm_feature(env, ARM_FEATURE_M)=
) {
> -            flags =3D FIELD_DP32(flags, TBFLAG_A32, VFPEN, 1);
> -        }
>          pstate_for_ss =3D env->uncached_cpsr;
>      }


--
Alex Benn=C3=A9e

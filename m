Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n18sm15852220wmi.20.2019.10.14.09.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 09:19:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C44611FF87;
	Mon, 14 Oct 2019 17:19:57 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-9-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 08/20] target/arm: Split out rebuild_hflags_aprofile
In-reply-to: <20191011155546.14342-9-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 17:19:57 +0100
Message-ID: <87mue3mh8y.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6/PYxje/7jq0


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a function to compute the values of the TBFLAG_ANY bits
> that will be cached, and are used by A-profile.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d1cd54cc93..ddd21edfcf 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11106,18 +11106,28 @@ static uint32_t rebuild_hflags_m32(CPUARMState =
*env, int fp_el,
>      return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
>  }
>
> +static uint32_t rebuild_hflags_aprofile(CPUARMState *env)
> +{
> +    int flags =3D 0;
> +
> +    flags =3D FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL,
> +                       arm_debug_target_el(env));
> +    return flags;
> +}
> +
>  static uint32_t rebuild_hflags_a32(CPUARMState *env, int fp_el,
>                                     ARMMMUIdx mmu_idx)
>  {
> -    return rebuild_hflags_common_32(env, fp_el, mmu_idx, 0);
> +    uint32_t flags =3D rebuild_hflags_aprofile(env);
> +    return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
>  }
>
>  static uint32_t rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
>                                     ARMMMUIdx mmu_idx)
>  {
> +    uint32_t flags =3D rebuild_hflags_aprofile(env);
>      ARMMMUIdx stage1 =3D stage_1_mmu_idx(mmu_idx);
>      ARMVAParameters p0 =3D aa64_va_parameters_both(env, 0, stage1);
> -    uint32_t flags =3D 0;
>      uint64_t sctlr;
>      int tbii, tbid;
>
> @@ -11262,12 +11272,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>          }
>      }
>
> -    if (!arm_feature(env, ARM_FEATURE_M)) {
> -        int target_el =3D arm_debug_target_el(env);
> -
> -        flags =3D FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL, target_=
el);
> -    }
> -
>      *pflags =3D flags;
>      *cs_base =3D 0;
>  }


--
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n1sm24138371wrg.67.2019.10.14.11.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 11:59:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4AACE1FF87;
	Mon, 14 Oct 2019 19:59:12 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-16-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com,
 peter.maydell@linaro.org
Subject: Re: [PATCH v6 15/20] target/arm: Add HELPER(rebuild_hflags_{a32,
 a64, m32})
In-reply-to: <20191011155546.14342-16-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 19:59:12 +0100
Message-ID: <87a7a3m9vj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vEX+l7fPzlPt


Richard Henderson <richard.henderson@linaro.org> writes:

> This functions are given the mode and el state of the cpu
> and writes the computed value to env->hflags.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/helper.h |  4 ++++
>  target/arm/helper.c | 24 ++++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index 1fb2cb5a77..3d4ec267a2 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -90,6 +90,10 @@ DEF_HELPER_4(msr_banked, void, env, i32, i32, i32)
>  DEF_HELPER_2(get_user_reg, i32, env, i32)
>  DEF_HELPER_3(set_user_reg, void, env, i32, i32)
>
> +DEF_HELPER_FLAGS_2(rebuild_hflags_m32, TCG_CALL_NO_RWG, void, env,
> int)
> +DEF_HELPER_FLAGS_2(rebuild_hflags_a32, TCG_CALL_NO_RWG, void, env, int)
> +DEF_HELPER_FLAGS_2(rebuild_hflags_a64, TCG_CALL_NO_RWG, void, env, int)
> +
>  DEF_HELPER_1(vfp_get_fpscr, i32, env)
>  DEF_HELPER_2(vfp_set_fpscr, void, env, i32)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 37424e3d4d..b2d701cf00 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11220,6 +11220,30 @@ void arm_rebuild_hflags(CPUARMState *env)
>      env->hflags =3D rebuild_hflags_internal(env);
>  }
>
> +void HELPER(rebuild_hflags_m32)(CPUARMState *env, int el)
> +{
> +    int fp_el =3D fp_exception_el(env, el);
> +    ARMMMUIdx mmu_idx =3D arm_mmu_idx_el(env, el);
> +
> +    env->hflags =3D rebuild_hflags_m32(env, fp_el, mmu_idx);
> +}
> +
> +void HELPER(rebuild_hflags_a32)(CPUARMState *env, int el)
> +{
> +    int fp_el =3D fp_exception_el(env, el);
> +    ARMMMUIdx mmu_idx =3D arm_mmu_idx_el(env, el);
> +
> +    env->hflags =3D rebuild_hflags_a32(env, fp_el, mmu_idx);
> +}
> +
> +void HELPER(rebuild_hflags_a64)(CPUARMState *env, int el)
> +{
> +    int fp_el =3D fp_exception_el(env, el);
> +    ARMMMUIdx mmu_idx =3D arm_mmu_idx_el(env, el);
> +
> +    env->hflags =3D rebuild_hflags_a64(env, el, fp_el, mmu_idx);
> +}
> +
>  void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags)
>  {


--
Alex Benn=C3=A9e

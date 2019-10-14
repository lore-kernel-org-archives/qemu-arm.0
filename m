Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id o18sm48449050wrw.90.2019.10.14.11.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 11:49:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 877181FF87;
	Mon, 14 Oct 2019 19:49:05 +0100 (BST)
References: <20191011155546.14342-1-richard.henderson@linaro.org>
 <20191011155546.14342-14-richard.henderson@linaro.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v6 13/20] target/arm: Split out arm_mmu_idx_el
In-reply-to: <20191011155546.14342-14-richard.henderson@linaro.org>
Date: Mon, 14 Oct 2019 19:49:05 +0100
Message-ID: <87d0ezmace.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: bNKJdHWGTFtb


Richard Henderson <richard.henderson@linaro.org> writes:

> Avoid calling arm_current_el() twice.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/internals.h |  9 +++++++++
>  target/arm/helper.c    | 12 +++++++-----
>  2 files changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 232d963875..f5313dd3d4 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -949,6 +949,15 @@ void arm_cpu_update_virq(ARMCPU *cpu);
>   */
>  void arm_cpu_update_vfiq(ARMCPU *cpu);
>
> +/**
> + * arm_mmu_idx_el:
> + * @env: The cpu environment
> + * @el: The EL to use.
> + *
> + * Return the full ARMMMUIdx for the translation regime for EL.
> + */
> +ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el);
> +
>  /**
>   * arm_mmu_idx:
>   * @env: The cpu environment
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 85de96d071..3f7d3f257d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11026,15 +11026,12 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMSt=
ate *env, bool secstate)
>  }
>  #endif
>
> -ARMMMUIdx arm_mmu_idx(CPUARMState *env)
> +ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
>  {
> -    int el;
> -
>      if (arm_feature(env, ARM_FEATURE_M)) {
>          return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
>      }
>
> -    el =3D arm_current_el(env);
>      if (el < 2 && arm_is_secure_below_el3(env)) {
>          return ARMMMUIdx_S1SE0 + el;
>      } else {
> @@ -11042,6 +11039,11 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env)
>      }
>  }
>
> +ARMMMUIdx arm_mmu_idx(CPUARMState *env)
> +{
> +    return arm_mmu_idx_el(env, arm_current_el(env));
> +}
> +
>  int cpu_mmu_index(CPUARMState *env, bool ifetch)
>  {
>      return arm_to_core_mmu_idx(arm_mmu_idx(env));
> @@ -11202,7 +11204,7 @@ static uint32_t rebuild_hflags_internal(CPUARMSta=
te *env)
>  {
>      int el =3D arm_current_el(env);
>      int fp_el =3D fp_exception_el(env, el);
> -    ARMMMUIdx mmu_idx =3D arm_mmu_idx(env);
> +    ARMMMUIdx mmu_idx =3D arm_mmu_idx_el(env, el);
>
>      if (is_a64(env)) {
>          return rebuild_hflags_a64(env, el, fp_el, mmu_idx);


--
Alex Benn=C3=A9e

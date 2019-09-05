Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a18sm3894457wrh.25.2019.09.05.06.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 06:58:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3B1D31FF87;
	Thu,  5 Sep 2019 14:58:29 +0100 (BST)
References: <20190820210720.18976-1-richard.henderson@linaro.org>
 <20190820210720.18976-2-richard.henderson@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: Re: [Qemu-arm] [PATCH v5 01/17] target/arm: Split out
 rebuild_hflags_common
In-reply-to: <20190820210720.18976-2-richard.henderson@linaro.org>
Date: Thu, 05 Sep 2019 14:58:29 +0100
Message-ID: <878sr2975m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ege6OofNT4Q8


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a function to compute the values of the TBFLAG_ANY bits
> that will be cached.  For now, the env->hflags variable is not
> used, and the results are fed back to cpu_get_tb_cpu_state.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h    | 29 ++++++++++++++++++-----------
>  target/arm/helper.c | 26 +++++++++++++++++++-------
>  2 files changed, 37 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 0981303170..3dc52c032b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -231,6 +231,9 @@ typedef struct CPUARMState {
>      uint32_t pstate;
>      uint32_t aarch64; /* 1 if CPU is in aarch64 state; inverse of PSTATE=
.nRW */
>
> +    /* Cached TBFLAGS state.  See below for which bits are included.  */
> +    uint32_t hflags;
> +
>      /* Frequently accessed CPSR bits are stored separately for efficienc=
y.
>         This contains all the other bits.  Use cpsr_{read,write} to access
>         the whole CPSR.  */
> @@ -3136,15 +3139,18 @@ typedef ARMCPU ArchCPU;
>
>  #include "exec/cpu-all.h"
>
> -/* Bit usage in the TB flags field: bit 31 indicates whether we are
> +/*
> + * Bit usage in the TB flags field: bit 31 indicates whether we are
>   * in 32 or 64 bit mode. The meaning of the other bits depends on that.
>   * We put flags which are shared between 32 and 64 bit mode at the top
>   * of the word, and flags which apply to only one mode at the bottom.
> + *
> + * Unless otherwise noted, these bits are cached in env->hflags.
>   */
>  FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
>  FIELD(TBFLAG_ANY, MMUIDX, 28, 3)
>  FIELD(TBFLAG_ANY, SS_ACTIVE, 27, 1)
> -FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)
> +FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)     /* Not cached. */
>  /* Target EL if we take a floating-point-disabled exception */
>  FIELD(TBFLAG_ANY, FPEXC_EL, 24, 2)
>  FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
> @@ -3155,13 +3161,14 @@ FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
>  FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 21, 2)
>
>  /* Bit usage when in AArch32 state: */
> -FIELD(TBFLAG_A32, THUMB, 0, 1)
> -FIELD(TBFLAG_A32, VECLEN, 1, 3)
> -FIELD(TBFLAG_A32, VECSTRIDE, 4, 2)
> +FIELD(TBFLAG_A32, THUMB, 0, 1)          /* Not cached. */
> +FIELD(TBFLAG_A32, VECLEN, 1, 3)         /* Not cached. */
> +FIELD(TBFLAG_A32, VECSTRIDE, 4, 2)      /* Not cached. */
>  /*
>   * We store the bottom two bits of the CPAR as TB flags and handle
>   * checks on the other bits at runtime. This shares the same bits as
>   * VECSTRIDE, which is OK as no XScale CPU has VFP.
> + * Not cached, because VECLEN+VECSTRIDE are not cached.
>   */
>  FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
>  /*
> @@ -3170,15 +3177,15 @@ FIELD(TBFLAG_A32, XSCALE_CPAR, 4, 2)
>   * the same thing as the current security state of the processor!
>   */
>  FIELD(TBFLAG_A32, NS, 6, 1)
> -FIELD(TBFLAG_A32, VFPEN, 7, 1)
> -FIELD(TBFLAG_A32, CONDEXEC, 8, 8)
> +FIELD(TBFLAG_A32, VFPEN, 7, 1)          /* Not cached. */
> +FIELD(TBFLAG_A32, CONDEXEC, 8, 8)       /* Not cached. */
>  FIELD(TBFLAG_A32, SCTLR_B, 16, 1)
>  /* For M profile only, set if FPCCR.LSPACT is set */
> -FIELD(TBFLAG_A32, LSPACT, 18, 1)
> +FIELD(TBFLAG_A32, LSPACT, 18, 1)        /* Not cached. */
>  /* For M profile only, set if we must create a new FP context */
> -FIELD(TBFLAG_A32, NEW_FP_CTXT_NEEDED, 19, 1)
> +FIELD(TBFLAG_A32, NEW_FP_CTXT_NEEDED, 19, 1) /* Not cached. */
>  /* For M profile only, set if FPCCR.S does not match current security st=
ate */
> -FIELD(TBFLAG_A32, FPCCR_S_WRONG, 20, 1)
> +FIELD(TBFLAG_A32, FPCCR_S_WRONG, 20, 1) /* Not cached. */
>  /* For M profile only, Handler (ie not Thread) mode */
>  FIELD(TBFLAG_A32, HANDLER, 21, 1)
>  /* For M profile only, whether we should generate stack-limit checks */
> @@ -3190,7 +3197,7 @@ FIELD(TBFLAG_A64, SVEEXC_EL, 2, 2)
>  FIELD(TBFLAG_A64, ZCR_LEN, 4, 4)
>  FIELD(TBFLAG_A64, PAUTH_ACTIVE, 8, 1)
>  FIELD(TBFLAG_A64, BT, 9, 1)
> -FIELD(TBFLAG_A64, BTYPE, 10, 2)
> +FIELD(TBFLAG_A64, BTYPE, 10, 2)         /* Not cached. */
>  FIELD(TBFLAG_A64, TBID, 12, 2)
>
>  static inline bool bswap_code(bool sctlr_b)
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7e0d5398ab..f2c6419369 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11016,6 +11016,22 @@ ARMMMUIdx arm_stage1_mmu_idx(CPUARMState *env)
>  }
>  #endif
>
> +static uint32_t rebuild_hflags_common(CPUARMState *env, int fp_el,
> +                                      ARMMMUIdx mmu_idx, uint32_t flags)
> +{
> +    flags =3D FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
> +    flags =3D FIELD_DP32(flags, TBFLAG_ANY, MMUIDX,
> +                       arm_to_core_mmu_idx(mmu_idx));
> +
> +    if (arm_cpu_data_is_big_endian(env)) {
> +        flags =3D FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
> +    }
> +    if (arm_singlestep_active(env)) {
> +        flags =3D FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
> +    }
> +    return flags;
> +}
> +
>  void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>                            target_ulong *cs_base, uint32_t *pflags)
>  {
> @@ -11107,7 +11123,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>          }
>      }
>
> -    flags =3D FIELD_DP32(flags, TBFLAG_ANY, MMUIDX, arm_to_core_mmu_idx(=
mmu_idx));
> +    flags =3D rebuild_hflags_common(env, fp_el, mmu_idx, flags);
>
>      /* The SS_ACTIVE and PSTATE_SS bits correspond to the state machine
>       * states defined in the ARM ARM for software singlestep:
> @@ -11115,9 +11131,9 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targe=
t_ulong *pc,
>       *     0            x       Inactive (the TB flag for SS is always 0)
>       *     1            0       Active-pending
>       *     1            1       Active-not-pending
> +     * SS_ACTIVE is set in hflags; PSTATE_SS is computed every TB.
>       */
> -    if (arm_singlestep_active(env)) {
> -        flags =3D FIELD_DP32(flags, TBFLAG_ANY, SS_ACTIVE, 1);
> +    if (FIELD_EX32(flags, TBFLAG_ANY, SS_ACTIVE)) {
>          if (is_a64(env)) {
>              if (env->pstate & PSTATE_SS) {
>                  flags =3D FIELD_DP32(flags, TBFLAG_ANY, PSTATE_SS, 1);
> @@ -11128,10 +11144,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>              }
>          }
>      }
> -    if (arm_cpu_data_is_big_endian(env)) {
> -        flags =3D FIELD_DP32(flags, TBFLAG_ANY, BE_DATA, 1);
> -    }
> -    flags =3D FIELD_DP32(flags, TBFLAG_ANY, FPEXC_EL, fp_el);
>
>      if (arm_v7m_is_handler_mode(env)) {
>          flags =3D FIELD_DP32(flags, TBFLAG_A32, HANDLER, 1);


--
Alex Benn=C3=A9e

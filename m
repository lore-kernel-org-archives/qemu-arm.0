Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k9sm3826233wrq.15.2019.08.07.03.47.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 07 Aug 2019 03:47:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 07DB11FF87;
	Wed,  7 Aug 2019 11:47:38 +0100 (BST)
References: <20190805130952.4415-1-peter.maydell@linaro.org>
 <20190805130952.4415-3-peter.maydell@linaro.org>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Fix routing of singlestep
 exceptions
In-reply-to: <20190805130952.4415-3-peter.maydell@linaro.org>
Date: Wed, 07 Aug 2019 11:47:37 +0100
Message-ID: <87sgqdi75i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9lHBdwE6pD7t


Peter Maydell <peter.maydell@linaro.org> writes:

> When generating an architectural single-step exception we were
> routing it to the "default exception level", which is to say
> the same exception level we execute at except that EL0 exceptions
> go to EL1. This is incorrect because the debug exception level
> can be configured by the guest for situations such as single
> stepping of EL0 and EL1 code by EL2.
>
> We have to track the target debug exception level in the TB
> flags, because it is dependent on CPU state like HCR_EL2.TGE
> and MDCR_EL2.TDE. (That we were previously calling the
> arm_debug_target_el() function to determine dc->ss_same_el
> is itself a bug, though one that would only have manifested
> as incorrect syndrome information.) Since we are out of TB
> flag bits unless we want to expand into the cs_base field,
> we share some bits with the M-profile only HANDLER and
> STACKCHECK bits, since only A-profile has this singlestep.
>
> Fixes: https://bugs.launchpad.net/qemu/+bug/1838913
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
> In theory it would be possible to use just a single TB flag
> bit, because other than the route_to_el2 bool, all the
> state arm_debug_target_el() checks is either constant or
> known from other TB flags. But I think trying to do this
> would be pretty hard to maintain and might well break
> anyway with future architectural changes.
>
> Slightly less painfully we could reclaim the existing
> TBFLAG_ANY_SS_ACTIVE, since the debug target EL can't
> be 0 and is irrelevant if SS is not active, so we
> could arrange for SS_ACTIVE to be DEBUG_TARGET_EL =3D=3D 0.
> But we're going to have to overspill into cs_base pretty
> soon anyway so I'm not too keen on being very stingy with
> the current flags word at the expense of maintainability.
> ---
>  target/arm/cpu.h           |  5 +++++
>  target/arm/translate.h     | 15 +++++++++++----
>  target/arm/helper.c        |  6 ++++++
>  target/arm/translate-a64.c |  2 +-
>  target/arm/translate.c     |  4 +++-
>  5 files changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 94c990cddbd..23ca6c79144 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3142,6 +3142,11 @@ FIELD(TBFLAG_ANY, PSTATE_SS, 26, 1)
>  /* Target EL if we take a floating-point-disabled exception */
>  FIELD(TBFLAG_ANY, FPEXC_EL, 24, 2)
>  FIELD(TBFLAG_ANY, BE_DATA, 23, 1)
> +/*
> + * For A-profile only, target EL for debug exceptions.
> + * Note that this overlaps with the M-profile-only HANDLER and STACKCHEC=
K bits.
> + */
> +FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 21, 2)
>
>  /* Bit usage when in AArch32 state: */
>  FIELD(TBFLAG_A32, THUMB, 0, 1)
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index 45053190baa..b65954c669b 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -50,6 +50,8 @@ typedef struct DisasContext {
>      uint32_t svc_imm;
>      int aarch64;
>      int current_el;
> +    /* Debug target exception level for single-step exceptions */
> +    int debug_target_el;
>      GHashTable *cp_regs;
>      uint64_t features; /* CPU features bits */
>      /* Because unallocated encodings generate different exception syndro=
me
> @@ -70,8 +72,6 @@ typedef struct DisasContext {
>       * ie A64 LDX*, LDAX*, A32/T32 LDREX*, LDAEX*.
>       */
>      bool is_ldex;
> -    /* True if a single-step exception will be taken to the current EL */
> -    bool ss_same_el;
>      /* True if v8.3-PAuth is active.  */
>      bool pauth_active;
>      /* True with v8.5-BTI and SCTLR_ELx.BT* set.  */
> @@ -251,8 +251,15 @@ static inline void gen_exception(int excp, uint32_t =
syndrome,
>  /* Generate an architectural singlestep exception */
>  static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
>  {
> -    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, isv, ex),
> -                  default_exception_el(s));
> +    bool same_el =3D (s->debug_target_el =3D=3D s->current_el);
> +
> +    /*
> +     * If singlestep is targeting a lower EL than the current one,
> +     * then s->ss_active must be false and we can never get here.
> +     */
> +    assert(s->debug_target_el >=3D s->current_el);
> +
> +    gen_exception(EXCP_UDEF, syn_swstep(same_el, isv, ex), s->debug_targ=
et_el);
>  }
>
>  /*
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b74c23a9bc0..24806c16ca2 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11170,6 +11170,12 @@ void cpu_get_tb_cpu_state(CPUARMState *env, targ=
et_ulong *pc,
>          }
>      }
>
> +    if (!arm_feature(env, ARM_FEATURE_M)) {
> +        int target_el =3D arm_debug_target_el(env);
> +
> +        flags =3D FIELD_DP32(flags, TBFLAG_ANY, DEBUG_TARGET_EL, target_=
el);
> +    }
> +
>      *pflags =3D flags;
>      *cs_base =3D 0;
>  }
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index f6729b96fd0..90850eadc1b 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14180,7 +14180,7 @@ static void aarch64_tr_init_disas_context(DisasCo=
ntextBase *dcbase,
>      dc->ss_active =3D FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
>      dc->pstate_ss =3D FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
>      dc->is_ldex =3D false;
> -    dc->ss_same_el =3D (arm_debug_target_el(env) =3D=3D dc->current_el);
> +    dc->debug_target_el =3D FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_TARGE=
T_EL);
>
>      /* Bound the number of insns to execute to those left on the page.  =
*/
>      bound =3D -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 19b9d8f2725..b32508cd2f9 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -11882,7 +11882,9 @@ static void arm_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      dc->ss_active =3D FIELD_EX32(tb_flags, TBFLAG_ANY, SS_ACTIVE);
>      dc->pstate_ss =3D FIELD_EX32(tb_flags, TBFLAG_ANY, PSTATE_SS);
>      dc->is_ldex =3D false;
> -    dc->ss_same_el =3D false; /* Can't be true since EL_d must be AArch6=
4 */
> +    if (!arm_feature(env, ARM_FEATURE_M)) {
> +        dc->debug_target_el =3D FIELD_EX32(tb_flags, TBFLAG_ANY, DEBUG_T=
ARGET_EL);
> +    }
>
>      dc->page_start =3D dc->base.pc_first & TARGET_PAGE_MASK;


--
Alex Benn=C3=A9e

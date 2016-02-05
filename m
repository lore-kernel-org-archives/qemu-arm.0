Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id di1sm16107556wjc.3.2016.02.05.06.20.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 06:20:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 2D31B3E025C;
	Fri,  5 Feb 2016 14:20:57 +0000 (GMT)
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org> <1454506721-11843-6-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 5/7] target-arm: Add isread parameter to CPAccessFns
In-reply-to: <1454506721-11843-6-git-send-email-peter.maydell@linaro.org>
Date: Fri, 05 Feb 2016 14:20:57 +0000
Message-ID: <87io23nsqe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Q9gak0EpOwLZ


Peter Maydell <peter.maydell@linaro.org> writes:

> System registers might have access requirements which need to
> be described via a CPAccessFn and which differ for reads and
> writes. For this to be possible we need to pass the access
> function a parameter to tell it whether the access being checked
> is a read or a write.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h           |  4 ++-
>  target-arm/helper.c        | 81 +++++++++++++++++++++++++++++-----------------
>  target-arm/helper.h        |  2 +-
>  target-arm/op_helper.c     |  5 +--
>  target-arm/translate-a64.c |  6 ++--
>  target-arm/translate.c     |  7 ++--
>  6 files changed, 68 insertions(+), 37 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 0fb79d0..5137632 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -1319,7 +1319,9 @@ typedef uint64_t CPReadFn(CPUARMState *env, const ARMCPRegInfo *opaque);
>  typedef void CPWriteFn(CPUARMState *env, const ARMCPRegInfo *opaque,
>                         uint64_t value);
>  /* Access permission check functions for coprocessor registers. */
> -typedef CPAccessResult CPAccessFn(CPUARMState *env, const ARMCPRegInfo *opaque);
> +typedef CPAccessResult CPAccessFn(CPUARMState *env,
> +                                  const ARMCPRegInfo *opaque,
> +                                  bool isread);

I guess my only comment here is we've extended the call for every access
check with another parameter (and associated TCG activity) for something
only one handler currently cares about.

Is there an argument for an rwaccessfn() that we use for just those
registers that care about the detail? I know system registers are hardly
a fast path priority but I'm concerned about knock on effects on
performance. Have you done any measurements?

>  /* Hook function for register reset */
>  typedef void CPResetFn(CPUARMState *env, const ARMCPRegInfo *opaque);
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index d85b04f..8bc3ea3 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -344,7 +344,8 @@ void init_cpreg_list(ARMCPU *cpu)
>   * access_el3_aa32ns_aa64any: Used to check both AArch32/64 register views.
>   */
>  static CPAccessResult access_el3_aa32ns(CPUARMState *env,
> -                                        const ARMCPRegInfo *ri)
> +                                        const ARMCPRegInfo *ri,
> +                                        bool isread)
>  {
>      bool secure = arm_is_secure_below_el3(env);
>
> @@ -356,10 +357,11 @@ static CPAccessResult access_el3_aa32ns(CPUARMState *env,
>  }
>
>  static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
> -                                                const ARMCPRegInfo *ri)
> +                                                const ARMCPRegInfo *ri,
> +                                                bool isread)
>  {
>      if (!arm_el_is_aa64(env, 3)) {
> -        return access_el3_aa32ns(env, ri);
> +        return access_el3_aa32ns(env, ri, isread);
>      }
>      return CP_ACCESS_OK;
>  }
> @@ -369,7 +371,8 @@ static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
>   * We assume that the .access field is set to PL1_RW.
>   */
>  static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
> -                                            const ARMCPRegInfo *ri)
> +                                            const ARMCPRegInfo *ri,
> +                                            bool isread)
>  {
>      if (arm_current_el(env) == 3) {
>          return CP_ACCESS_OK;
> @@ -651,7 +654,8 @@ static void cpacr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      env->cp15.cpacr_el1 = value;
>  }
>
> -static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                   bool isread)
>  {
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          /* Check if CPACR accesses are to be trapped to EL2 */
> @@ -668,7 +672,8 @@ static CPAccessResult cpacr_access(CPUARMState *env, const ARMCPRegInfo *ri)
>      return CP_ACCESS_OK;
>  }
>
> -static CPAccessResult cptr_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult cptr_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                  bool isread)
>  {
>      /* Check if CPTR accesses are set to trap to EL3 */
>      if (arm_current_el(env) == 2 && (env->cp15.cptr_el[3] & CPTR_TCPAC)) {
> @@ -710,7 +715,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>
> -static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                   bool isread)
>  {
>      /* Performance monitor registers user accessibility is controlled
>       * by PMUSERENR.
> @@ -1154,7 +1160,8 @@ static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      env->teecr = value;
>  }
>
> -static CPAccessResult teehbr_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult teehbr_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                    bool isread)
>  {
>      if (arm_current_el(env) == 0 && (env->teecr & 1)) {
>          return CP_ACCESS_TRAP;
> @@ -1207,7 +1214,8 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
>
>  #ifndef CONFIG_USER_ONLY
>
> -static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                       bool isread)
>  {
>      /* CNTFRQ: not visible from PL0 if both PL0PCTEN and PL0VCTEN are zero */
>      if (arm_current_el(env) == 0 && !extract32(env->cp15.c14_cntkctl, 0, 2)) {
> @@ -1216,7 +1224,8 @@ static CPAccessResult gt_cntfrq_access(CPUARMState *env, const ARMCPRegInfo *ri)
>      return CP_ACCESS_OK;
>  }
>
> -static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx)
> +static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx,
> +                                        bool isread)
>  {
>      unsigned int cur_el = arm_current_el(env);
>      bool secure = arm_is_secure(env);
> @@ -1235,7 +1244,8 @@ static CPAccessResult gt_counter_access(CPUARMState *env, int timeridx)
>      return CP_ACCESS_OK;
>  }
>
> -static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx)
> +static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx,
> +                                      bool isread)
>  {
>      unsigned int cur_el = arm_current_el(env);
>      bool secure = arm_is_secure(env);
> @@ -1257,29 +1267,34 @@ static CPAccessResult gt_timer_access(CPUARMState *env, int timeridx)
>  }
>
>  static CPAccessResult gt_pct_access(CPUARMState *env,
> -                                         const ARMCPRegInfo *ri)
> +                                    const ARMCPRegInfo *ri,
> +                                    bool isread)
>  {
> -    return gt_counter_access(env, GTIMER_PHYS);
> +    return gt_counter_access(env, GTIMER_PHYS, isread);
>  }
>
>  static CPAccessResult gt_vct_access(CPUARMState *env,
> -                                         const ARMCPRegInfo *ri)
> +                                    const ARMCPRegInfo *ri,
> +                                    bool isread)
>  {
> -    return gt_counter_access(env, GTIMER_VIRT);
> +    return gt_counter_access(env, GTIMER_VIRT, isread);
>  }
>
> -static CPAccessResult gt_ptimer_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult gt_ptimer_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                       bool isread)
>  {
> -    return gt_timer_access(env, GTIMER_PHYS);
> +    return gt_timer_access(env, GTIMER_PHYS, isread);
>  }
>
> -static CPAccessResult gt_vtimer_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult gt_vtimer_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                       bool isread)
>  {
> -    return gt_timer_access(env, GTIMER_VIRT);
> +    return gt_timer_access(env, GTIMER_VIRT, isread);
>  }
>
>  static CPAccessResult gt_stimer_access(CPUARMState *env,
> -                                       const ARMCPRegInfo *ri)
> +                                       const ARMCPRegInfo *ri,
> +                                       bool isread)
>  {
>      /* The AArch64 register view of the secure physical timer is
>       * always accessible from EL3, and configurably accessible from
> @@ -1776,7 +1791,8 @@ static void par_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  #ifndef CONFIG_USER_ONLY
>  /* get_phys_addr() isn't present for user-mode-only targets */
>
> -static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult ats_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                 bool isread)
>  {
>      if (ri->opc2 & 4) {
>          /* The ATS12NSO* operations must trap to EL3 if executed in
> @@ -1921,7 +1937,8 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      A32_BANKED_CURRENT_REG_SET(env, par, par64);
>  }
>
> -static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult at_s1e2_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                     bool isread)
>  {
>      if (arm_current_el(env) == 3 && !(env->cp15.scr_el3 & SCR_NS)) {
>          return CP_ACCESS_TRAP;
> @@ -2575,7 +2592,8 @@ static void aa64_fpsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      vfp_set_fpsr(env, value);
>  }
>
> -static CPAccessResult aa64_daif_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult aa64_daif_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                       bool isread)
>  {
>      if (arm_current_el(env) == 0 && !(env->cp15.sctlr_el[1] & SCTLR_UMA)) {
>          return CP_ACCESS_TRAP;
> @@ -2590,7 +2608,8 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  }
>
>  static CPAccessResult aa64_cacheop_access(CPUARMState *env,
> -                                          const ARMCPRegInfo *ri)
> +                                          const ARMCPRegInfo *ri,
> +                                          bool isread)
>  {
>      /* Cache invalidate/clean: NOP, but EL0 must UNDEF unless
>       * SCTLR_EL1.UCI is set.
> @@ -2846,7 +2865,8 @@ static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      }
>  }
>
> -static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                      bool isread)
>  {
>      /* We don't implement EL2, so the only control on DC ZVA is the
>       * bit in the SCTLR which can prohibit access for EL0.
> @@ -2863,13 +2883,14 @@ static uint64_t aa64_dczid_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      int dzp_bit = 1 << 4;
>
>      /* DZP indicates whether DC ZVA access is allowed */
> -    if (aa64_zva_access(env, NULL) == CP_ACCESS_OK) {
> +    if (aa64_zva_access(env, NULL, false) == CP_ACCESS_OK) {
>          dzp_bit = 0;
>      }
>      return cpu->dcz_blocksize | dzp_bit;
>  }
>
> -static CPAccessResult sp_el0_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult sp_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                    bool isread)
>  {
>      if (!(env->pstate & PSTATE_SP)) {
>          /* Access to SP_EL0 is undefined if it's being used as
> @@ -2908,7 +2929,8 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      tlb_flush(CPU(cpu), 1);
>  }
>
> -static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                     bool isread)
>  {
>      if ((env->cp15.cptr_el[2] & CPTR_TFP) && arm_current_el(env) == 2) {
>          return CP_ACCESS_TRAP_EL2;
> @@ -3656,7 +3678,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>
> -static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri)
> +static CPAccessResult ctr_el0_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                     bool isread)
>  {
>      /* Only accessible in EL0 if SCTLR.UCT is set (and only in AArch64,
>       * but the AArch32 CTR has its own reginfo struct)
> diff --git a/target-arm/helper.h b/target-arm/helper.h
> index c2a85c7..c98e9ce 100644
> --- a/target-arm/helper.h
> +++ b/target-arm/helper.h
> @@ -62,7 +62,7 @@ DEF_HELPER_1(cpsr_read, i32, env)
>  DEF_HELPER_3(v7m_msr, void, env, i32, i32)
>  DEF_HELPER_2(v7m_mrs, i32, env, i32)
>
> -DEF_HELPER_3(access_check_cp_reg, void, env, ptr, i32)
> +DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
>  DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
>  DEF_HELPER_2(get_cp_reg, i32, env, ptr)
>  DEF_HELPER_3(set_cp_reg64, void, env, ptr, i64)
> diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
> index a5ee65f..313c0f8 100644
> --- a/target-arm/op_helper.c
> +++ b/target-arm/op_helper.c
> @@ -457,7 +457,8 @@ void HELPER(set_user_reg)(CPUARMState *env, uint32_t regno, uint32_t val)
>      }
>  }
>
> -void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome)
> +void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome,
> +                                 uint32_t isread)
>  {
>      const ARMCPRegInfo *ri = rip;
>      int target_el;
> @@ -471,7 +472,7 @@ void HELPER(access_check_cp_reg)(CPUARMState *env, void *rip, uint32_t syndrome)
>          return;
>      }
>
> -    switch (ri->accessfn(env, ri)) {
> +    switch (ri->accessfn(env, ri, isread)) {
>      case CP_ACCESS_OK:
>          return;
>      case CP_ACCESS_TRAP:
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index 80f6c20..8f1eaad 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -1366,16 +1366,18 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
>           * runtime; this may result in an exception.
>           */
>          TCGv_ptr tmpptr;
> -        TCGv_i32 tcg_syn;
> +        TCGv_i32 tcg_syn, tcg_isread;
>          uint32_t syndrome;
>
>          gen_a64_set_pc_im(s->pc - 4);
>          tmpptr = tcg_const_ptr(ri);
>          syndrome = syn_aa64_sysregtrap(op0, op1, op2, crn, crm, rt, isread);
>          tcg_syn = tcg_const_i32(syndrome);
> -        gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn);
> +        tcg_isread = tcg_const_i32(isread);
> +        gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn, tcg_isread);
>          tcg_temp_free_ptr(tmpptr);
>          tcg_temp_free_i32(tcg_syn);
> +        tcg_temp_free_i32(tcg_isread);
>      }
>
>      /* Handle special cases first */
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index cff511b..375acf5 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -7168,7 +7168,7 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>               * call in order to handle c15_cpar.
>               */
>              TCGv_ptr tmpptr;
> -            TCGv_i32 tcg_syn;
> +            TCGv_i32 tcg_syn, tcg_isread;
>              uint32_t syndrome;
>
>              /* Note that since we are an implementation which takes an
> @@ -7213,9 +7213,12 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>              gen_set_pc_im(s, s->pc - 4);
>              tmpptr = tcg_const_ptr(ri);
>              tcg_syn = tcg_const_i32(syndrome);
> -            gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn);
> +            tcg_isread = tcg_const_i32(isread);
> +            gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn,
> +                                           tcg_isread);
>              tcg_temp_free_ptr(tmpptr);
>              tcg_temp_free_i32(tcg_syn);
> +            tcg_temp_free_i32(tcg_isread);
>          }
>
>          /* Handle special cases first */


--
Alex Bennée

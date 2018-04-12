Received: by 10.28.71.155 with SMTP id m27csp2154168wmi;
        Thu, 12 Apr 2018 10:16:20 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/IhtnUwXLUJffun4OSkJa1GL1YSxG5OiJMtAGqOZAJ0mCFUZi7NPyA6ZSTBY4hEfp0+huU
X-Received: by 2002:a25:8583:: with SMTP id x3-v6mr911083ybk.76.1523553380791;
        Thu, 12 Apr 2018 10:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523553380; cv=none;
        d=google.com; s=arc-20160816;
        b=ArkiuVJFlhFJ1/KfqYW5N8YA2nsUeQP60ysBE5FZkGYM90g/ozj/Bowi0dRPvUT4Pp
         NiLGtKnIBA4xyu3wupNcoV8Qt/SYO3E96E0oKvjo+5hB8uuW8SnWsrC/pFSnJrhNr7aS
         zdsuVHV+hmRUitrtEC3kU3C/9Yuq6Y05zw4T1qct+VacK7Mcjp4eN+Lnj3jnu2UnjpC4
         dvX5E44XNw8LMUFHayRvIJUdY/N1bA0JMuK3SPsm/rvzy0/g6KGQdgAIjzyoTkxraTdh
         O2ZTtVDzCqVnykj9zzF7S2zUeUeduSpTRW6wIauFu+ZJPjJs4CMW3JngR7X7nd3X4V/b
         8pgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VuXqfyA8uTv4pdhjafUr0kEppycT93A5bSySJxlfjXY=;
        b=CmUVk0D1yyG07Wf8vnv2m6oVCMesBVZ1lU1IbbUWnnjFhWzAtGjHxVVjNW7eY6bNKb
         7AuiG0WelmU9zVy0GMhvl2FtXXLr70k5hxK+ihFdYwAUl3RFs1ha/xJWU+IjZAwaArME
         MpMyibNcFFOKNiD3OKcpdkFPnoMfTuGC72D55dgLuxc6/3kkBVzDnyzXnH4lieT1lst7
         5zQfco3SaHo+qw3MepQuoZh6U3zrEaKY615sJbbhw0Boij0HZctYKaewMDQ9FeJPv62v
         6jzHJh/IjGuUhHEsQE46fiSoEThWUJ7l8lywd/8lxiZ41a9Sg8gHHo3lzd8fsmItkNW+
         sxrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VWbE9NhW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j184si1396491qka.142.2018.04.12.10.16.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VWbE9NhW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fpc-0005CY-6p
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:16:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fpQ-0005B0-3J
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:16:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fpO-0008PJ-3H
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:16:08 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:41570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6fpN-0008N0-TP
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:16:06 -0400
Received: by mail-ot0-x244.google.com with SMTP id m22-v6so6835868otf.8
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 10:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VuXqfyA8uTv4pdhjafUr0kEppycT93A5bSySJxlfjXY=;
	b=VWbE9NhW+iZ5mihf/tCVC8gH5Ber6rZxN2cRR6+OikZtivskfyrAjISZwD5NNC2KTP
	pvgOCJP65k3lC2cbh8MQ2QruP4VlQlqkNQOczmMOEsCbMbe5noLiw/NP6hzcfzgSUpLI
	XpnfZoA1c386hMUzFBscmvDxd68eeDLxrcw8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VuXqfyA8uTv4pdhjafUr0kEppycT93A5bSySJxlfjXY=;
	b=SL6hBUdl/MV+f9qSmqF9DoNmV3udsHXTsEOE+dzi/0EuHtN7GLDy2DAXdEM/Z9NNRR
	XVqCmE3Ig1vD4g8qm5SIYB6VMVLUVXvEvCKZ9KCRhbAooFS8fSCqVEt6nVP+7APrq901
	uejbZw6KBCZ/lNEaNNzPD2o2rKSHZRtY9VAWDNVPdCBscrj3EzvmB6BOX/8lEs0gilkZ
	x6r8Omt8Mnz2x9GepS39fArMZj8gZN9+Qa2aBe9H+QMpcTAdXkM/HOz4MEipz+jiTGaR
	5DzT+OY/RDHCtqR8cZH3Py5IxsTif7Sa6ii4zHHHl/sZ10GODHHP+M3pX/QqLPWmpLiZ
	+O5g==
X-Gm-Message-State: ALQs6tBi62Une+hmFOVa/GS/s2dsEnkW3F9us1cH3mTwZEZEGgpZa5bO
	fbuRbw0xz51iRlFGXN+ibK/D1uM91ZdQVVtpSOV9Gg==
X-Received: by 2002:a9d:3a45:: with SMTP id
	j63-v6mr1219148otc.126.1523553365052; 
	Thu, 12 Apr 2018 10:16:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 10:15:44
	-0700 (PDT)
In-Reply-To: <1521232280-13089-13-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-13-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 18:15:44 +0100
Message-ID: <CAFEAcA_UP-DgPZPL8-sMAs9TFHiUrfya8LAxAnO2U_WJAMH6yg@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH v3 12/22] target/arm: Filter cycle counter
 based on PMCCFILTR_EL0
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o7+IKmBnxx0m

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> The pmu_counter_filtered and pmu_op_start/finish functions are generic
> (as opposed to PMCCNTR-specific) to allow for the implementation of
> other events.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c    |  3 ++
>  target/arm/cpu.h    | 37 +++++++++++++++++++----
>  target/arm/helper.c | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++---
>  3 files changed, 116 insertions(+), 11 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a2cb21e..b0d032c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -887,6 +887,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      if (!cpu->has_pmu) {
>          unset_feature(env, ARM_FEATURE_PMU);
>          cpu->id_aa64dfr0 &= ~0xf00;
> +    } else {
> +        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> +        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);

You probably don't want to do this if we're using KVM, as there
are some code paths where we call do_interrupt() when using KVM
which will trigger the hooks and likely do unexpected things.
(For instance kvm_arm_handle_debug() does this to set the guest
up to take debug exceptions.)

>      }
>
>      if (!arm_feature(env, ARM_FEATURE_EL2)) {
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index b0ef727..9c3b5ef 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -458,6 +458,11 @@ typedef struct CPUARMState {
>           * was reset. Otherwise it stores the counter value
>           */
>          uint64_t c15_ccnt;
> +        /* ccnt_cached_cycles is used to hold the last cycle count when
> +         * c15_ccnt holds the guest-visible count instead of the delta during
> +         * PMU operations which require this.
> +         */
> +        uint64_t ccnt_cached_cycles;

Can this ever hold valid state at a point when we need to do VM
migration, or is it purely temporary ?

>          uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
>          uint64_t vpidr_el2; /* Virtualization Processor ID Register */
>          uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
> @@ -896,15 +901,35 @@ int cpu_arm_signal_handler(int host_signum, void *pinfo,
>                             void *puc);
>
>  /**
> - * pmccntr_sync
> + * pmccntr_op_start/finish

Shouldn't this doc change and prototype change have gone with the earlier
patch that changed the implementation?

>   * @env: CPUARMState
>   *
> - * Synchronises the counter in the PMCCNTR. This must always be called twice,
> - * once before any action that might affect the timer and again afterwards.
> - * The function is used to swap the state of the register if required.
> - * This only happens when not in user mode (!CONFIG_USER_ONLY)
> + * Convert the counter in the PMCCNTR between its delta form (the typical mode
> + * when it's enabled) and the guest-visible value. These two calls must always
> + * surround any action which might affect the counter, and the return value
> + * from pmccntr_op_start must be supplied as the second argument to
> + * pmccntr_op_finish.
> + */
> +uint64_t pmccntr_op_start(CPUARMState *env);
> +void pmccntr_op_finish(CPUARMState *env, uint64_t prev_cycles);
> +
> +/**
> + * pmu_op_start/finish
> + * @env: CPUARMState
> + *
> + * Convert all PMU counters between their delta form (the typical mode when
> + * they are enabled) and the guest-visible values. These two calls must
> + * surround any action which might affect the counters, and the return value
> + * from pmu_op_start must be supplied as the second argument to pmu_op_finish.
> + */
> +uint64_t pmu_op_start(CPUARMState *env);
> +void pmu_op_finish(CPUARMState *env, uint64_t prev_cycles);
> +
> +/**
> + * Functions to register as EL change hooks for PMU mode filtering
>   */
> -void pmccntr_sync(CPUARMState *env);
> +void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
> +void pmu_post_el_change(ARMCPU *cpu, void *ignored);
>
>  /* SCTLR bit meanings. Several bits have been reused in newer
>   * versions of the architecture; in that case we define constants
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0102357..95b09d6 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -908,6 +908,15 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
>  #define PMCRC   0x4
>  #define PMCRE   0x1
>
> +#define PMXEVTYPER_P          0x80000000
> +#define PMXEVTYPER_U          0x40000000
> +#define PMXEVTYPER_NSK        0x20000000
> +#define PMXEVTYPER_NSU        0x10000000
> +#define PMXEVTYPER_NSH        0x08000000
> +#define PMXEVTYPER_M          0x04000000
> +#define PMXEVTYPER_MT         0x02000000
> +#define PMXEVTYPER_EVTCOUNT   0x000003ff
> +
>  #define PMU_NUM_COUNTERS(env) ((env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT)
>  /* Bits allowed to be set/cleared for PMCNTEN* and PMINTEN* */
>  #define PMU_COUNTER_MASK(env) ((1 << 31) | ((1 << PMU_NUM_COUNTERS(env)) - 1))
> @@ -998,7 +1007,7 @@ static CPAccessResult pmreg_access_ccntr(CPUARMState *env,
>
>  static inline bool arm_ccnt_enabled(CPUARMState *env)
>  {
> -    /* This does not support checking PMCCFILTR_EL0 register */
> +    /* Does not check PMCCFILTR_EL0, which is handled by pmu_counter_filtered */
>
>      if (!(env->cp15.c9_pmcr & PMCRE) || !(env->cp15.c9_pmcnten & (1 << 31))) {
>          return false;
> @@ -1006,6 +1015,44 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
>
>      return true;
>  }
> +
> +/* Returns true if the counter corresponding to the passed-in pmevtyper or
> + * pmccfiltr value is filtered using the current state */

"is filtered (ie does not count events)" would make it clearer.

Nit: */ should be on a line of its own.

> +static inline bool pmu_counter_filtered(CPUARMState *env, uint64_t pmxevtyper)
> +{
> +    bool secure = arm_is_secure(env);
> +    int el = arm_current_el(env);
> +
> +    bool P   = pmxevtyper & PMXEVTYPER_P;
> +    bool U   = pmxevtyper & PMXEVTYPER_U;
> +    bool NSK = pmxevtyper & PMXEVTYPER_NSK;
> +    bool NSU = pmxevtyper & PMXEVTYPER_NSU;
> +    bool NSH = pmxevtyper & PMXEVTYPER_NSH;
> +    bool M   = pmxevtyper & PMXEVTYPER_M;

Lowercase for variable names, please.

> +
> +    if (el == 1 && P) {
> +        return true;
> +    } else if (el == 0 && U) {
> +        return true;
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> +        if (el == 1 && !secure && NSK != P) {
> +            return true;
> +        } else if (el == 0 && !secure && NSU != U) {
> +            return true;
> +        } else if (el == 3 && secure && M != P) {
> +            return true;
> +        }
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_EL2) && el == 2 && !secure && !NSH) {
> +        return true;
> +    }

This doesn't follow the structure that the Arm ARM pseudocode
uses, which makes it a bit tricky to review. (see AArch64.CountEvents()).
It also doesn't implement the same logic -- for instance this
code will return true if we're in NS EL1 and the U bit is set,
whereas the pseudocode returns true for NS EL1 only if U != NSU.

> +    return false;
> +}
> +
>  /*
>   * Ensure c15_ccnt is the guest-visible count so that operations such as
>   * enabling/disabling the counter or filtering, modifying the count itself,
> @@ -1023,7 +1070,8 @@ uint64_t pmccntr_op_start(CPUARMState *env)
>                            ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
>  #endif
>
> -    if (arm_ccnt_enabled(env)) {
> +    if (arm_ccnt_enabled(env) &&
> +          !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
>
>          uint64_t eff_cycles = cycles;
>          if (env->cp15.c9_pmcr & PMCRD) {
> @@ -1043,7 +1091,8 @@ uint64_t pmccntr_op_start(CPUARMState *env)
>   */
>  void pmccntr_op_finish(CPUARMState *env, uint64_t prev_cycles)
>  {
> -    if (arm_ccnt_enabled(env)) {
> +    if (arm_ccnt_enabled(env) &&
> +          !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
>          if (env->cp15.c9_pmcr & PMCRD) {
>              /* Increment once every 64 processor clock cycles */
> @@ -1054,10 +1103,30 @@ void pmccntr_op_finish(CPUARMState *env, uint64_t prev_cycles)
>      }
>  }
>
> +uint64_t pmu_op_start(CPUARMState *env)
> +{
> +    return pmccntr_op_start(env);
> +}

Do these two functions end up being different at the end
of the patchset?

> +
> +void pmu_op_finish(CPUARMState *env, uint64_t prev_cycles)
> +{
> +    pmccntr_op_finish(env, prev_cycles);
> +}
> +
> +void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
> +{
> +    cpu->env.cp15.ccnt_cached_cycles = pmu_op_start(&cpu->env);
> +}
> +
> +void pmu_post_el_change(ARMCPU *cpu, void *ignored)
> +{
> +    pmu_op_finish(&cpu->env, cpu->env.cp15.ccnt_cached_cycles);
> +}
> +
>  static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                         uint64_t value)
>  {
> -    uint64_t saved_cycles = pmccntr_op_start(env);
> +    uint64_t saved_cycles = pmu_op_start(env);
>
>      if (value & PMCRC) {
>          /* The counter has been reset */
> @@ -1068,7 +1137,7 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      env->cp15.c9_pmcr &= ~0x39;
>      env->cp15.c9_pmcr |= (value & 0x39);
>
> -    pmccntr_op_finish(env, saved_cycles);
> +    pmu_op_finish(env, saved_cycles);
>  }
>
>  static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> @@ -1117,6 +1186,14 @@ void pmccntr_op_finish(CPUARMState *env, uint64_t prev_cycles)
>  {
>  }
>
> +uint64_t pmu_op_start(CPUARMState *env)
> +{
> +}
> +
> +void pmu_op_finish(CPUARMState *env, uint64_t prev_cycles)
> +{
> +}
> +
>  #endif
>
>  static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> --

thanks
-- PMM

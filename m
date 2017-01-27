Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o2sm7652280wra.42.2017.01.27.04.33.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 04:33:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 59CA53E0342;
	Fri, 27 Jan 2017 12:33:39 +0000 (GMT)
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org> <1485285380-10565-2-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.1.91.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Liviu Ionescu <ilg@livius.net>
Subject: Re: [PATCH 01/10] target/arm: Drop IS_M() macro
In-reply-to: <1485285380-10565-2-git-send-email-peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 12:33:39 +0000
Message-ID: <87a8acadi4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: jBQ/jLd+Fqsx


Peter Maydell <peter.maydell@linaro.org> writes:

> We only use the IS_M() macro in two places, and it's a bit of a
> namespace grab to put in cpu.h.  Drop it in favour of just explicitly
> calling arm_feature() in the places where it was used.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h    | 6 ------
>  target/arm/cpu.c    | 2 +-
>  target/arm/helper.c | 2 +-
>  3 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 521c11b..b2cc329 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1762,12 +1762,6 @@ bool write_list_to_cpustate(ARMCPU *cpu);
>   */
>  bool write_cpustate_to_list(ARMCPU *cpu);
>
> -/* Does the core conform to the "MicroController" profile. e.g. Cortex-M3.
> -   Note the M in older cores (eg. ARM7TDMI) stands for Multiply. These are
> -   conventional cores (ie. Application or Realtime profile).  */
> -
> -#define IS_M(env) arm_feature(env, ARM_FEATURE_M)
> -
>  #define ARM_CPUID_TI915T      0x54029152
>  #define ARM_CPUID_TI925T      0x54029252
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9075989..6395d5a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -182,7 +182,7 @@ static void arm_cpu_reset(CPUState *s)
>      /* On ARMv7-M the CPSR_I is the value of the PRIMASK register, and is
>       * clear at reset. Initial SP and PC are loaded from ROM.
>       */
> -    if (IS_M(env)) {
> +    if (arm_feature(env, ARM_FEATURE_M)) {
>          uint32_t initial_msp; /* Loaded from 0x0 */
>          uint32_t initial_pc; /* Loaded from 0x4 */
>          uint8_t *rom;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index cfbc622..ce7e43b 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6695,7 +6695,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
>      CPUARMState *env = &cpu->env;
>      unsigned int new_el = env->exception.target_el;
>
> -    assert(!IS_M(env));
> +    assert(!arm_feature(env, ARM_FEATURE_M));
>
>      arm_log_exception(cs->exception_index);
>      qemu_log_mask(CPU_LOG_INT, "...from EL%d to EL%d\n", arm_current_el(env),


--
Alex Bennée

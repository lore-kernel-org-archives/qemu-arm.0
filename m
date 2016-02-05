Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id ka4sm15439105wjc.47.2016.02.05.03.13.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 03:13:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D64DC3E025C;
	Fri,  5 Feb 2016 11:13:41 +0000 (GMT)
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org> <1454506721-11843-3-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 2/7] target-arm: Implement MDCR_EL3 and SDCR
In-reply-to: <1454506721-11843-3-git-send-email-peter.maydell@linaro.org>
Date: Fri, 05 Feb 2016 11:13:41 +0000
Message-ID: <87powbo1ei.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: zqpK7ll1uzGy


Peter Maydell <peter.maydell@linaro.org> writes:

> Implement the MDCR_EL3 register (which is SDCR for AArch32).
> For the moment we implement it as reads-as-written.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h    |  1 +
>  target-arm/helper.c | 24 ++++++++++++++++++++++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 52284e9..cf2df50 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -382,6 +382,7 @@ typedef struct CPUARMState {
>          uint64_t mdscr_el1;
>          uint64_t oslsr_el1; /* OS Lock Status */
>          uint64_t mdcr_el2;
> +        uint64_t mdcr_el3;
>          /* If the counter is enabled, this stores the last time the counter
>           * was reset. Otherwise it stores the counter value
>           */
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index b631b83..8b96b80 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -364,6 +364,23 @@ static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
>      return CP_ACCESS_OK;
>  }
>
> +/* Some secure-only AArch32 registers trap to EL3 if used from
> + * Secure EL1 (but are just ordinary UNDEF in other non-EL3 contexts).
> + * We assume that the .access field is set to PL1_RW.
> + */
> +static CPAccessResult access_trap_aa32s_el1(CPUARMState *env,
> +                                            const ARMCPRegInfo *ri)
> +{

I wonder if we should assert the fact we are in AArch32 here in case the
wrong access function gets added to a AArch64 register?

> +    if (arm_current_el(env) == 3) {
> +        return CP_ACCESS_OK;
> +    }
> +    if (arm_is_secure_below_el3(env)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    /* This will be EL1 NS and EL2 NS, which just UNDEF */
> +    return CP_ACCESS_TRAP_UNCATEGORIZED;
> +}
> +
>  static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
> @@ -3532,6 +3549,13 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
>        .access = PL3_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
>        .writefn = scr_write },
> +    { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
> +      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
> +    { .name = "SDCR", .type = ARM_CP_ALIAS,
> +      .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
> +      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },

Does anything ensure the fields are reset to 0 on a warm reset?

>      { .name = "SDER32_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 1,
>        .access = PL3_RW, .resetvalue = 0,


--
Alex Bennée

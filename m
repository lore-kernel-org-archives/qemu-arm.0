Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n131sm17671808wmf.9.2016.02.05.08.07.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Feb 2016 08:07:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 22C693E0180;
	Fri,  5 Feb 2016 16:07:57 +0000 (GMT)
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org> <1454506721-11843-7-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH 6/7] target-arm: Implement NSACR trapping behaviour
In-reply-to: <1454506721-11843-7-git-send-email-peter.maydell@linaro.org>
Date: Fri, 05 Feb 2016 16:07:57 +0000
Message-ID: <87h9hnnns2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: s6YI7BssELKm


Peter Maydell <peter.maydell@linaro.org> writes:

> Implement some corner cases of the behaviour of the NSACR
> register on ARMv8:
>  * if EL3 is AArch64 then accessing the NSACR from Secure EL1
>    with AArch32 should trap to EL3
>  * if EL3 is not present or is AArch64 then reads from NS EL1 and
>    NS EL2 return constant 0xc00
>
> It would in theory be possible to implement all these with
> a single reginfo definition, but for clarity we use three
> separate definitions for the three cases and install the
> right one based on the CPU feature flags.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 58 insertions(+), 4 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 8bc3ea3..34dc144 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3562,6 +3562,25 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
>      REGINFO_SENTINEL
>  };
>
> +static CPAccessResult nsacr_access(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                   bool isread)
> +{
> +    /* The NSACR is RW at EL3, and RO for NS EL1 and NS EL2.
> +     * At Secure EL1 it traps to EL3.
> +     */
> +    if (arm_current_el(env) == 3) {
> +        return CP_ACCESS_OK;
> +    }
> +    if (arm_is_secure_below_el3(env)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    /* Accesses from EL1 NS and EL2 NS are UNDEF for write but allow reads. */
> +    if (isread) {
> +        return CP_ACCESS_OK;
> +    }
> +    return CP_ACCESS_TRAP_UNCATEGORIZED;
> +}
> +
>  static const ARMCPRegInfo el3_cp_reginfo[] = {
>      { .name = "SCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 0,
> @@ -3587,10 +3606,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 1,
>        .access = PL3_RW, .resetvalue = 0,
>        .fieldoffset = offsetoflow32(CPUARMState, cp15.sder) },
> -      /* TODO: Implement NSACR trapping of secure EL1 accesses to EL3 */
> -    { .name = "NSACR", .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
> -      .access = PL3_W | PL1_R, .resetvalue = 0,
> -      .fieldoffset = offsetof(CPUARMState, cp15.nsacr) },
>      { .name = "MVBAR", .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
>        .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
>        .writefn = vbar_write, .resetvalue = 0,
> @@ -4361,6 +4376,45 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          };
>          define_one_arm_cp_reg(cpu, &rvbar);
>      }
> +    /* The behaviour of NSACR is sufficiently various that we don't
> +     * try to describe it in a single reginfo:
> +     *  if EL3 is 64 bit, then trap to EL3 from S EL1,
> +     *     reads as constant 0xc00 from NS EL1 and NS EL2
> +     *  if EL3 is 32 bit, then RW at EL3, RO at NS EL1 and NS EL2
> +     *  if v7 without EL3, register doesn't exist
> +     *  if v8 without EL3, reads as constant 0xc00 from NS EL1 and NS EL2
> +     */
> +    if (arm_feature(env, ARM_FEATURE_EL3)) {
> +        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> +            ARMCPRegInfo nsacr = {
> +                .name = "NSACR", .type = ARM_CP_CONST,

I was thrown by the ARM_CP_CONST here as there is EL dependency. If
nsacr_access says CP_ACCESS_OK where does the write go? The ARM ARM says
RO and the code in translate-a64 says:

        if (ri->type & ARM_CP_CONST) {
            /* If not forbidden by access permissions, treat as WI */
            return;
        }

So we might want to make that clear in the comment.

> +                .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
> +                .access = PL1_RW, .accessfn = nsacr_access,

PL1_R?

> +                .resetvalue = 0xc00
> +            };
> +            define_one_arm_cp_reg(cpu, &nsacr);
> +        } else {
> +            ARMCPRegInfo nsacr = {
> +                .name = "NSACR",
> +                .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
> +                .access = PL3_RW | PL1_R,
> +                .resetvalue = 0,
> +                .fieldoffset = offsetof(CPUARMState, cp15.nsacr)
> +            };
> +            define_one_arm_cp_reg(cpu, &nsacr);
> +        }
> +    } else {
> +        if (arm_feature(env, ARM_FEATURE_V8)) {
> +            ARMCPRegInfo nsacr = {
> +                .name = "NSACR", .type = ARM_CP_CONST,
> +                .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
> +                .access = PL1_R,
> +                .resetvalue = 0xc00
> +            };
> +            define_one_arm_cp_reg(cpu, &nsacr);
> +        }
> +    }
> +
>      if (arm_feature(env, ARM_FEATURE_MPU)) {
>          if (arm_feature(env, ARM_FEATURE_V6)) {
>              /* PMSAv6 not implemented */

I don't know if a more compact definition would make this easier to
follow?

    /* The behaviour of NSACR is sufficiently various we tweak the reginfo:
     *  if EL3 is 64 bit, then trap to EL3 from S EL1,
     *     reads as constant 0xc00 from NS EL1 and NS EL2
     *  if EL3 is 32 bit, then RW at EL3, RO at NS EL1 and NS EL2
     *  if v7 without EL3, register doesn't exist
     *  if v8 without EL3, reads as constant 0xc00 from NS EL1 and NS EL2
     */
    if (arm_feature(env, ARM_FEATURE_V8) || arm_feature(env, ARM_FEATURE_EL3)) {
        ARMCPRegInfo nsacr = {
            .name = "NSACR",
            .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 2,
            .access = PL1_R,
            .resetvalue = 0xc00
        };

        if (arm_feature(env, ARM_FEATURE_EL3)) {
            if (arm_feature(env, ARM_FEATURE_AARCH64)) {
                nsacr.type = ARM_CP_CONST;      /* if no trap RO */
                nsacr.accessfn = nsacr_access;
            } else {
                nsacr.access = PL3_RW | PL1_R;
                nsacr.resetvalue = 0;
                nsacr.fieldoffset = offsetof(CPUARMState, cp15.nsacr);
            };
        } else {
            nsacr.type = ARM_CP_CONST;
        }

        define_one_arm_cp_reg(cpu, &nsacr);
    }



--
Alex Bennée

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t3sm12778648wjz.11.2016.02.26.06.49.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Feb 2016 06:49:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 0DA313E01B4;
	Fri, 26 Feb 2016 14:49:34 +0000 (GMT)
References: <1455890863-11203-1-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.17; emacs 25.0.91.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org, qemu-stable@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH] target-arm: Make reserved ranges in ID_AA64* spaces RAZ, not UNDEF
In-reply-to: <1455890863-11203-1-git-send-email-peter.maydell@linaro.org>
Date: Fri, 26 Feb 2016 14:49:33 +0000
Message-ID: <87oab37chu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: mByVBGuU9pnr


Peter Maydell <peter.maydell@linaro.org> writes:

> The v8 ARM ARM defines that unused spaces in the ID_AA64* system
> register ranges are Reserved and must RAZ, rather than being UNDEF.
> Implement this.
>
> In particular, ARM v8.2 adds a new feature register ID_AA64MMFR2,
> and newer versions of the Linux kernel will attempt to read this,
> which causes them not to boot up on versions of QEMU missing this fix.

I see ARM where sneaky getting a non-public register usage into the
kernel patch ;-)

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>

(by tested I mean it didn't boot next-20160226 before this patch and now it
does)

>
> Since the encoding .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 6
> is actually defined in ARMv8 (as ID_MMFR4), we give it an entry in
> the ARMCPU struct so CPUs can override it, though since none do
> this too will just RAZ.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The patch which touches ID_AA64MMFR2 is currently in linux-next...
>
>  target-arm/cpu-qom.h |   1 +
>  target-arm/helper.c  | 128 ++++++++++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 122 insertions(+), 7 deletions(-)
>
> diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
> index 1cc4502..1061c08 100644
> --- a/target-arm/cpu-qom.h
> +++ b/target-arm/cpu-qom.h
> @@ -155,6 +155,7 @@ typedef struct ARMCPU {
>      uint32_t id_mmfr1;
>      uint32_t id_mmfr2;
>      uint32_t id_mmfr3;
> +    uint32_t id_mmfr4;
>      uint32_t id_isar0;
>      uint32_t id_isar1;
>      uint32_t id_isar2;
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 5a0447b..4deea0f 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -4280,12 +4280,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 5,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_isar5 },
> -            /* 6..7 are as yet unallocated and must RAZ */
> -            { .name = "ID_ISAR6", .cp = 15, .crn = 0, .crm = 2,
> -              .opc1 = 0, .opc2 = 6, .access = PL1_R, .type = ARM_CP_CONST,
> -              .resetvalue = 0 },
> -            { .name = "ID_ISAR7", .cp = 15, .crn = 0, .crm = 2,
> -              .opc1 = 0, .opc2 = 7, .access = PL1_R, .type = ARM_CP_CONST,
> +            { .name = "ID_MMFR4", .state = ARM_CP_STATE_BOTH,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = cpu->id_mmfr4 },
> +            /* 7 is as yet unallocated and must RAZ */
> +            { .name = "ID_ISAR7_RESERVED", .state = ARM_CP_STATE_BOTH,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 2, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = 0 },
>              REGINFO_SENTINEL
>          };
> @@ -4339,7 +4341,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          define_arm_cp_regs(cpu, not_v7_cp_reginfo);
>      }
>      if (arm_feature(env, ARM_FEATURE_V8)) {
> -        /* AArch64 ID registers, which all have impdef reset values */
> +        /* AArch64 ID registers, which all have impdef reset values.
> +         * Note that within the ID register ranges the unused slots
> +         * must all RAZ, not UNDEF; future architecture versions may
> +         * define new registers here.
> +         */
>          ARMCPRegInfo v8_idregs[] = {
>              { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
> @@ -4349,6 +4355,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64pfr1},
> +            { .name = "ID_AA64PFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 2,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64PFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4362,6 +4392,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64dfr1 },
> +            { .name = "ID_AA64DFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 2,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64DFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "ID_AA64AFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 4,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4370,6 +4408,14 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 5,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64afr1 },
> +            { .name = "ID_AA64AFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64AFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "ID_AA64ISAR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4378,6 +4424,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64isar1 },
> +            { .name = "ID_AA64ISAR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 4,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 5,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64ISAR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "ID_AA64MMFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4386,6 +4456,30 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->id_aa64mmfr1 },
> +            { .name = "ID_AA64MMFR2_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 2,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 4,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 5,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "ID_AA64MMFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "MVFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -4398,6 +4492,26 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 2,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .resetvalue = cpu->mvfr2 },
> +            { .name = "MVFR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 3,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "MVFR4_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 4,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "MVFR5_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 5,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "MVFR6_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 6,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
> +            { .name = "MVFR7_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
> +              .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 3, .opc2 = 7,
> +              .access = PL1_R, .type = ARM_CP_CONST,
> +              .resetvalue = 0 },
>              { .name = "PMCEID0", .state = ARM_CP_STATE_AA32,
>                .cp = 15, .opc1 = 0, .crn = 9, .crm = 12, .opc2 = 6,
>                .access = PL0_R, .accessfn = pmreg_access, .type = ARM_CP_CONST,


--
Alex Bennée

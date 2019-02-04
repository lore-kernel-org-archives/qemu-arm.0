Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id a14sm6921047wrr.13.2019.02.04.07.33.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Feb 2019 07:33:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTPS id AC4F91FF7C;
	Mon,  4 Feb 2019 15:33:36 +0000 (UTC)
References: <20190128173940.25813-1-alex.bennee@linaro.org> <20190128173940.25813-3-alex.bennee@linaro.org> <CAFEAcA9fD_bju_+QM3D+088rKJffQ66HBPYUB-cDknKmPikhaQ@mail.gmail.com>
User-agent: mu4e 1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH v1 2/4] target/arm: expose CPUID registers to userspace
In-reply-to: <CAFEAcA9fD_bju_+QM3D+088rKJffQ66HBPYUB-cDknKmPikhaQ@mail.gmail.com>
Date: Mon, 04 Feb 2019 15:33:36 +0000
Message-ID: <87munb4lgv.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 3vTCBVUZQ5aA


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 28 Jan 2019 at 17:39, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> A number of CPUID registers are exposed to userspace by modern Linux
>> kernels thanks to the "ARM64 CPU Feature Registers" ABI. For QEMU's
>> user-mode emulation we don't need to emulate the kernels trap but just
>> return the value the trap would have done. For this we use the PL0U_R
>> permission mask which allows this access in CONFIG_USER mode.
>>
>> Some registers only return a subset of their contents so we need
>> specific CONFIG_USER_ONLY logic to do this.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>
>> ---
>> v4
>>   - tweak commit message
>>   - use PL0U_R instead of PL1U_R to be less confusing
>>   - more CONFIG_USER logic for special cases
>>   - mask a bunch of bits for some registers
>> ---
>>  target/arm/helper.c | 51 ++++++++++++++++++++++++++++++++-------------
>>  1 file changed, 36 insertions(+), 15 deletions(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 42c1c0b144..68808e7293 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -3543,7 +3543,7 @@ static uint64_t mpidr_read(CPUARMState *env, const=
 ARMCPRegInfo *ri)
>>  static const ARMCPRegInfo mpidr_cp_reginfo[] =3D {
>>      { .name =3D "MPIDR", .state =3D ARM_CP_STATE_BOTH,
>>        .opc0 =3D 3, .crn =3D 0, .crm =3D 0, .opc1 =3D 0, .opc2 =3D 5,
>> -      .access =3D PL1_R, .readfn =3D mpidr_read, .type =3D ARM_CP_NO_RA=
W },
>> +      .access =3D PL0U_R, .readfn =3D mpidr_read, .type =3D ARM_CP_NO_R=
AW },
>>      REGINFO_SENTINEL
>>  };
>>
>> @@ -5488,6 +5488,7 @@ static uint64_t id_pfr1_read(CPUARMState *env, con=
st ARMCPRegInfo *ri)
>>      return pfr1;
>>  }
>>
>> +#ifndef CONFIG_USER_ONLY
>>  static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *=
ri)
>>  {
>>      ARMCPU *cpu =3D arm_env_get_cpu(env);
>> @@ -5498,6 +5499,7 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env,=
 const ARMCPRegInfo *ri)
>>      }
>>      return pfr0;
>>  }
>> +#endif
>>
>>  /* Shared logic between LORID and the rest of the LOR* registers.
>>   * Secure state has already been delt with.
>> @@ -5799,18 +5801,26 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>>           * define new registers here.
>>           */
>>          ARMCPRegInfo v8_idregs[] =3D {
>> -            /* ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST because we d=
on't
>> -             * know the right value for the GIC field until after we
>> -             * define these regs.
>> +            /* ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST for system
>> +             * emulation because we don't know the right value for the
>> +             * GIC field until after we define these regs. For
>> +             * user-mode HWCAP_CPUID emulation the GIC bits are masked
>> +             * anyway.
>>               */
>>              { .name =3D "ID_AA64PFR0_EL1", .state =3D ARM_CP_STATE_AA64,
>>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 0,
>> +#ifndef CONFIG_USER_ONLY
>>                .access =3D PL1_R, .type =3D ARM_CP_NO_RAW,
>>                .readfn =3D id_aa64pfr0_read,
>> -              .writefn =3D arm_cp_write_ignore },
>> +              .writefn =3D arm_cp_write_ignore
>> +#else
>> +              .access =3D PL0U_R, .type =3D ARM_CP_CONST,
>> +              .resetvalue =3D cpu->isar.id_aa64pfr0 & 0x000f000f0ff0000=
ULL
>> +#endif
>> +            },
>>              { .name =3D "ID_AA64PFR1_EL1", .state =3D ARM_CP_STATE_AA64,
>>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 1,
>> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
>> +              .access =3D PL0U_R, .type =3D ARM_CP_CONST,
>>                .resetvalue =3D cpu->isar.id_aa64pfr1},
>>              { .name =3D "ID_AA64PFR2_EL1_RESERVED", .state =3D ARM_CP_S=
TATE_AA64,
>>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 4, .opc2 =
=3D 2,
>> @@ -5839,11 +5849,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>>                .resetvalue =3D 0 },
>>              { .name =3D "ID_AA64DFR0_EL1", .state =3D ARM_CP_STATE_AA64,
>>                .opc0 =3D 3, .opc1 =3D 0, .crn =3D 0, .crm =3D 5, .opc2 =
=3D 0,
>> -              .access =3D PL1_R, .type =3D ARM_CP_CONST,
>> +              .access =3D PL0U_R, .type =3D ARM_CP_CONST,
>>                .resetvalue =3D cpu->id_aa64dfr0 },
>
> This doesn't seem right -- I think ID_AA64DFR0_EL1 should be exposed
> as zero, not whatever the underlying register value is.

Under a kernel I'm seeing numbers reported so I don't think it's totally
squashed:

  id_aa64dfr0_el1     : 0x0000000000000006
  id_aa64dfr1_el1     : 0x0000000000000000

Confusingly the kernel does:

static const struct arm64_ftr_bits ftr_id_aa64dfr0[] =3D {
	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, 36, 28, 0),
	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR0_PMSV=
ER_SHIFT, 4, 0),
	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_CTX_CMP=
S_SHIFT, 4, 0),
	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_WRPS_SH=
IFT, 4, 0),
	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR0_BRPS_SH=
IFT, 4, 0),
	/*
	 * We can instantiate multiple PMU instances with different levels
	 * of support.
	 */
	S_ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_EXACT, ID_AA64DFR0_PMUVER_=
SHIFT, 4, 0),
	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_TRACEVER_SHI=
FT, 4, 0),
	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_DEBUGVER_SHI=
FT, 4, 0x6),
	ARM64_FTR_END,
};

So I'm not sure if that is intentional as the line:

  ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_EXACT, ID_AA64DFR0_DEBUGVER_SH=
IFT, 4, 0x6)

implies the DEBUGVER is hidden but actually 0x6?

> More generally, this ifdeffing of "maybe mask the values" doesn't
> seem very future-proof. If we add something to one of the cpu-id_*
> values, that should be masked out to zero by default for linux-user,
> not defaulting to passed through.

Do you mean setting cpu->id_foo during cpu_init? I wasn't sure if that
might interact badly with the recent changes to base our features off
what's actually set in them.

>
> thanks
> -- PMM


--
Alex Benn=C3=A9e

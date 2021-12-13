Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g18sm12324566wrv.42.2021.12.13.13.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 13:13:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B27421FF96;
	Mon, 13 Dec 2021 21:13:56 +0000 (GMT)
References: <20211213182449.7068-1-bslathi19@gmail.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Byron Lathi <bslathi19@gmail.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] Target/arm: Implement Cortex-A5
Date: Mon, 13 Dec 2021 21:02:07 +0000
In-reply-to: <20211213182449.7068-1-bslathi19@gmail.com>
Message-ID: <87wnk8i4x7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6isQhy31Qr5E


Byron Lathi <bslathi19@gmail.com> writes:

> Add support for the Cortex-A5. These changes are based off of the A7 and
> A9 init functions, using the appropriate values from the technical
> reference manual for the A5.
>
> Signed-off-by: Byron Lathi <bslathi19@gmail.com>
> ---
>  target/arm/cpu_tcg.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 13d0e9b195..38f0fc3977 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -304,6 +304,42 @@ static void cortex_a8_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortexa8_cp_reginfo);
>  }
>=20=20
> +static void cortex_a5_initfn(Object *obj)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(obj);
> +
> +    cpu->dtb_compatible =3D "arm,cortex-a5";
> +    set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +    cpu->midr =3D 0x410fc0f1;

hmm wikipedia lists the part number as 0xc05 (and the a15 as 0xc0f) but
I can't find the actual value in the TRM.

> +    cpu->reset_fpsid =3D 0x41023051;

I think for the a5 the FPU is optional so maybe we need a cpu option
here? Or maybe just assume it's enabled on QEMUs version?

> +    cpu->isar.mvfr0 =3D 0x10110221;
> +    cpu->isar.mvfr1 =3D 0x11000011;
> +    cpu->ctr =3D 0x83338003;
> +    cpu->reset_sctlr =3D 0x00c50078;
> +    cpu->isar.id_pfr0 =3D 0x00001231;
> +    cpu->isar.id_pfr1 =3D 0x00000011;
> +    cpu->isar.id_dfr0 =3D 0x02010444;
> +    cpu->id_afr0 =3D 0x00000000;
> +    cpu->isar.id_mmfr0 =3D 0x00100103;

the TRM says [11:8] Outermost shareability 0x0 L1 cache coherency not suppo=
rted.

> +    cpu->isar.id_mmfr1 =3D 0x40000000;
> +    cpu->isar.id_mmfr2 =3D 0x01230000;
> +    cpu->isar.id_mmfr3 =3D 0x00102211;
> +    cpu->isar.id_isar0 =3D 0x00101111;
> +    cpu->isar.id_isar1 =3D 0x13112111;
> +    cpu->isar.id_isar2 =3D 0x21232041;
> +    cpu->isar.id_isar3 =3D 0x11112131;
> +    cpu->isar.id_isar4 =3D 0x00011142;
> +    cpu->isar.dbgdidr =3D 0x1203f001;
> +    cpu->clidr =3D 0x09200003;

I'm fairly sure these depend on the part as well although it makes no
difference to our emulation.

> +    cpu->ccsidr[0] =3D 0x701fe00a;
> +    cpu->ccsidr[1] =3D 0x203fe00a;
> +}
> +
>  static const ARMCPRegInfo cortexa9_cp_reginfo[] =3D {
>      /*
>       * power_control should be set to maximum latency. Again,
> @@ -1019,6 +1055,7 @@ static const ARMCPUInfo arm_tcg_cpus[] =3D {
>      { .name =3D "arm1136",     .initfn =3D arm1136_initfn },
>      { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
>      { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
> +    { .name =3D "cortext-a5",  .initfn =3D cortex_a5_initfn },

Extra 't'

>      { .name =3D "cortex-a7",   .initfn =3D cortex_a7_initfn },
>      { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
>      { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },


--=20
Alex Benn=C3=A9e

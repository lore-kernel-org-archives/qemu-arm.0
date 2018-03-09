Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 55sm1138974wrz.6.2018.03.09.05.45.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Mar 2018 05:45:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 442E13E009E;
	Fri,  9 Mar 2018 13:45:47 +0000 (GMT)
References: <20180308130626.12393-1-peter.maydell@linaro.org> <20180308130626.12393-5-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Igor
 Mammedov <imammedo@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v3 4/6] target/arm: Make 'any' CPU just an alias for 'max'
In-reply-to: <20180308130626.12393-5-peter.maydell@linaro.org>
Date: Fri, 09 Mar 2018 13:45:47 +0000
Message-ID: <874llpl5v8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: JbQhr6GJ6TPF


Peter Maydell <peter.maydell@linaro.org> writes:

> Now we have a working '-cpu max', the linux-user-only
> 'any' CPU is pretty much the same thing, so implement it
> that way.
>
> For the moment we don't add any of the extra feature bits
> to the system-emulation "max", because we don't set the
> ID register bits we would need to to advertise those
> features as present.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.c   | 52 +++++++++++++++++++++++++----------------------
>  target/arm/cpu64.c | 59 ++++++++++++++++++++++++++----------------------=
------
>  2 files changed, 56 insertions(+), 55 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index e46ddcc613..6068efb8ff 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -965,9 +965,19 @@ static ObjectClass *arm_cpu_class_by_name(const char=
 *cpu_model)
>      ObjectClass *oc;
>      char *typename;
>      char **cpuname;
> +    const char *cpunamestr;
>
>      cpuname =3D g_strsplit(cpu_model, ",", 1);
> -    typename =3D g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpuname[0]);
> +    cpunamestr =3D cpuname[0];
> +#ifdef CONFIG_USER_ONLY
> +    /* For backwards compatibility usermode emulation allows "-cpu any",
> +     * which has the same semantics as "-cpu max".
> +     */
> +    if (!strcmp(cpunamestr, "any")) {
> +        cpunamestr =3D "max";
> +    }
> +#endif
> +    typename =3D g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpunamestr);
>      oc =3D object_class_by_name(typename);
>      g_strfreev(cpuname);
>      g_free(typename);
> @@ -1711,29 +1721,23 @@ static void arm_max_initfn(Object *obj)
>          kvm_arm_set_cpu_features_from_host(cpu);
>      } else {
>          cortex_a15_initfn(obj);
> -        /* In future we might add feature bits here even if the
> -         * real-world A15 doesn't implement them.
> -         */
> -    }
> -}
> -#endif
> -
>  #ifdef CONFIG_USER_ONLY
> -static void arm_any_initfn(Object *obj)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(obj);
> -    set_feature(&cpu->env, ARM_FEATURE_V8);
> -    set_feature(&cpu->env, ARM_FEATURE_VFP4);
> -    set_feature(&cpu->env, ARM_FEATURE_NEON);
> -    set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> -    set_feature(&cpu->env, ARM_FEATURE_CRC);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> -    cpu->midr =3D 0xffffffff;
> +        /* We don't set these in system emulation mode for the moment,
> +         * since we don't correctly set the ID registers to advertise th=
em,
> +         */
> +        set_feature(&cpu->env, ARM_FEATURE_V8);
> +        set_feature(&cpu->env, ARM_FEATURE_VFP4);
> +        set_feature(&cpu->env, ARM_FEATURE_NEON);
> +        set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> +        set_feature(&cpu->env, ARM_FEATURE_CRC);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> +#endif
> +    }
>  }
>  #endif
>
> @@ -1789,7 +1793,7 @@ static const ARMCPUInfo arm_cpus[] =3D {
>      { .name =3D "max",         .initfn =3D arm_max_initfn },
>  #endif
>  #ifdef CONFIG_USER_ONLY
> -    { .name =3D "any",         .initfn =3D arm_any_initfn },
> +    { .name =3D "any",         .initfn =3D arm_max_initfn },
>  #endif
>  #endif
>      { .name =3D NULL }
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 9042d3dfd1..3429875787 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -226,38 +226,38 @@ static void aarch64_max_initfn(Object *obj)
>          kvm_arm_set_cpu_features_from_host(cpu);
>      } else {
>          aarch64_a57_initfn(obj);
> -        /* In future we might add feature bits here even if the
> -         * real-world A57 doesn't implement them.
> +#ifdef CONFIG_USER_ONLY
> +        /* We don't set these in system emulation mode for the moment,
> +         * since we don't correctly set the ID registers to advertise th=
em,
> +         * and in some cases they're only available in AArch64 and not A=
Arch32,
> +         * whereas the architecture requires them to be present in both =
if
> +         * present in either.
>           */
> +        set_feature(&cpu->env, ARM_FEATURE_V8);
> +        set_feature(&cpu->env, ARM_FEATURE_VFP4);
> +        set_feature(&cpu->env, ARM_FEATURE_NEON);
> +        set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA512);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SHA3);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SM3);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> +        set_feature(&cpu->env, ARM_FEATURE_CRC);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
> +        set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> +        /* For usermode -cpu max we can use a larger and more efficient =
DCZ
> +         * blocksize since we don't have to follow what the hardware doe=
s.
> +         */
> +        cpu->ctr =3D 0x80038003; /* 32 byte I and D cacheline size, VIPT=
 icache */
> +        cpu->dcz_blocksize =3D 7; /*  512 bytes */
> +#endif
>      }
>  }
>
> -#ifdef CONFIG_USER_ONLY
> -static void aarch64_any_initfn(Object *obj)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(obj);
> -
> -    set_feature(&cpu->env, ARM_FEATURE_V8);
> -    set_feature(&cpu->env, ARM_FEATURE_VFP4);
> -    set_feature(&cpu->env, ARM_FEATURE_NEON);
> -    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA512);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SHA3);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SM3);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_SM4);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> -    set_feature(&cpu->env, ARM_FEATURE_CRC);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_RDM);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
> -    set_feature(&cpu->env, ARM_FEATURE_V8_FCMA);
> -    cpu->ctr =3D 0x80038003; /* 32 byte I and D cacheline size, VIPT ica=
che */
> -    cpu->dcz_blocksize =3D 7; /*  512 bytes */
> -}
> -#endif
> -
>  typedef struct ARMCPUInfo {
>      const char *name;
>      void (*initfn)(Object *obj);
> @@ -268,9 +268,6 @@ static const ARMCPUInfo aarch64_cpus[] =3D {
>      { .name =3D "cortex-a57",         .initfn =3D aarch64_a57_initfn },
>      { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_initfn },
>      { .name =3D "max",                .initfn =3D aarch64_max_initfn },
> -#ifdef CONFIG_USER_ONLY
> -    { .name =3D "any",         .initfn =3D aarch64_any_initfn },
> -#endif
>      { .name =3D NULL }
>  };


--
Alex Benn=C3=A9e

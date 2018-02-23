Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d188sm5182387wme.21.2018.02.23.09.00.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 09:00:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id BD4303E0260;
	Fri, 23 Feb 2018 17:00:38 +0000 (GMT)
References: <20180217182323.25885-1-richard.henderson@linaro.org> <20180217182323.25885-2-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v2 01/67] target/arm: Enable SVE for aarch64-linux-user
In-reply-to: <20180217182323.25885-2-richard.henderson@linaro.org>
Date: Fri, 23 Feb 2018 17:00:38 +0000
Message-ID: <877er3abex.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: v9tN7by3P79Y


Richard Henderson <richard.henderson@linaro.org> writes:

> Enable ARM_FEATURE_SVE for the generic "any" cpu.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c   | 7 +++++++
>  target/arm/cpu64.c | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1b3ae62db6..10843994c3 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -150,6 +150,13 @@ static void arm_cpu_reset(CPUState *s)
>          env->cp15.sctlr_el[1] |=3D SCTLR_UCT | SCTLR_UCI | SCTLR_DZE;
>          /* and to the FP/Neon instructions */
>          env->cp15.cpacr_el1 =3D deposit64(env->cp15.cpacr_el1, 20, 2, 3);
> +        /* and to the SVE instructions */
> +        env->cp15.cpacr_el1 =3D deposit64(env->cp15.cpacr_el1, 16, 2, 3);
> +        env->cp15.cptr_el[3] |=3D CPTR_EZ;
> +        /* with maximum vector length */
> +        env->vfp.zcr_el[1] =3D ARM_MAX_VQ - 1;
> +        env->vfp.zcr_el[2] =3D ARM_MAX_VQ - 1;
> +        env->vfp.zcr_el[3] =3D ARM_MAX_VQ - 1;
>  #else

I notice this is linux-user only but what happens if you specify a
specific CPU in linux-user mode, do we still end up running SVE specific
initialisation?

It seems to me that we should be seeing feature guarded reset stuff in here.

>          /* Reset into the highest available EL */
>          if (arm_feature(env, ARM_FEATURE_EL3)) {
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index efc519b49b..36ef9e9d9d 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -231,6 +231,7 @@ static void aarch64_any_initfn(Object *obj)
>      set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
>      set_feature(&cpu->env, ARM_FEATURE_CRC);
>      set_feature(&cpu->env, ARM_FEATURE_V8_FP16);
> +    set_feature(&cpu->env, ARM_FEATURE_SVE);
>      cpu->ctr =3D 0x80038003; /* 32 byte I and D cacheline size, VIPT ica=
che */
>      cpu->dcz_blocksize =3D 7; /*  512 bytes */
>  }


--
Alex Benn=C3=A9e

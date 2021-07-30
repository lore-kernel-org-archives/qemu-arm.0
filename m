Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 140sm1256633wmb.43.2021.07.30.03.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:37:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A00C81FF96;
	Fri, 30 Jul 2021 11:37:05 +0100 (BST)
References: <20210730030821.231106-1-ishii.shuuichir@fujitsu.com>
 <20210730030821.231106-2-ishii.shuuichir@fujitsu.com>
User-agent: mu4e 1.6.0; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 1/3] target-arm: delete ARM_FEATURE_A64FX
Date: Fri, 30 Jul 2021 11:36:15 +0100
In-reply-to: <20210730030821.231106-2-ishii.shuuichir@fujitsu.com>
Message-ID: <87r1fggka6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: E9SKQldsz5o/


Shuuichirou Ishii <ishii.shuuichir@fujitsu.com> writes:

> The ARM_FEATURE_A64FX property was added,
> but there is no function that uses this property yet,
> so it will be removed until a function that uses it is added.
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  target/arm/cpu.h   | 1 -
>  target/arm/cpu64.c | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 1b0c7b91ec..9f0a5f84d5 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2145,7 +2145,6 @@ enum arm_features {
>      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
>      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
>      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> -    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor HPC extensions
> support */

This is confusing because I can't see this feature flag in the mainline
branch. Have you inadvertently based this series from an internal branch?=20

>  };
>=20=20
>  static inline int arm_feature(CPUARMState *env, int feature)
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index a15f9c0c55..dd72300e88 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -856,7 +856,6 @@ static void aarch64_a64fx_initfn(Object *obj)
>      ARMCPU *cpu =3D ARM_CPU(obj);
>=20=20
>      cpu->dtb_compatible =3D "arm,a64fx";
> -    set_feature(&cpu->env, ARM_FEATURE_A64FX);
>      set_feature(&cpu->env, ARM_FEATURE_V8);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
>      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);


--=20
Alex Benn=C3=A9e

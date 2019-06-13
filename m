Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g8sm1578578wme.20.2019.06.13.06.32.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 06:32:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DB2361FF87;
	Thu, 13 Jun 2019 14:32:37 +0100 (BST)
References: <20190517174046.11146-1-peter.maydell@linaro.org> <20190517174046.11146-3-peter.maydell@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH 2/4] target/arm: Allow M-profile CPUs to disable the DSP extension via CPU property
In-reply-to: <20190517174046.11146-3-peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 14:32:37 +0100
Message-ID: <878su5ehl6.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8TgJL6tBsB4m


Peter Maydell <peter.maydell@linaro.org> writes:

> Allow the DSP extension to be disabled via a CPU property for
> M-profile CPUs. (A and R-profile CPUs don't have this extension
> as a defined separate optional architecture extension, so
> they don't need the property.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h |  2 ++
>  target/arm/cpu.c | 29 +++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 778fb293e7c..b1c7ab3ee94 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -801,6 +801,8 @@ struct ARMCPU {
>      bool has_vfp;
>      /* CPU has Neon */
>      bool has_neon;
> +    /* CPU has M-profile DSP extension */
> +    bool has_dsp;
>
>      /* CPU has memory protection unit */
>      bool has_mpu;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 406fd360a2a..c43139ba897 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -769,6 +769,9 @@ static Property arm_cpu_has_vfp_property =3D
>  static Property arm_cpu_has_neon_property =3D
>              DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
>
> +static Property arm_cpu_has_dsp_property =3D
> +            DEFINE_PROP_BOOL("dsp", ARMCPU, has_dsp, true);
> +
>  static Property arm_cpu_has_mpu_property =3D
>              DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
>
> @@ -881,6 +884,12 @@ void arm_cpu_post_init(Object *obj)
>          }
>      }
>
> +    if (arm_feature(&cpu->env, ARM_FEATURE_M) &&
> +        arm_feature(&cpu->env, ARM_FEATURE_THUMB_DSP)) {
> +        qdev_property_add_static(DEVICE(obj), &arm_cpu_has_dsp_property,
> +                                 &error_abort);
> +    }
> +
>      if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
>                                   &error_abort);
> @@ -1100,6 +1109,26 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>          cpu->isar.mvfr0 =3D u;
>      }
>
> +    if (arm_feature(env, ARM_FEATURE_M) && !cpu->has_dsp) {
> +        uint32_t u;
> +
> +        unset_feature(env, ARM_FEATURE_THUMB_DSP);
> +
> +        u =3D cpu->isar.id_isar1;
> +        u =3D FIELD_DP32(u, ID_ISAR1, EXTEND, 1);
> +        cpu->isar.id_isar1 =3D u;
> +
> +        u =3D cpu->isar.id_isar2;
> +        u =3D FIELD_DP32(u, ID_ISAR2, MULTU, 1);
> +        u =3D FIELD_DP32(u, ID_ISAR2, MULTS, 1);
> +        cpu->isar.id_isar2 =3D u;
> +
> +        u =3D cpu->isar.id_isar3;
> +        u =3D FIELD_DP32(u, ID_ISAR3, SIMD, 1);
> +        u =3D FIELD_DP32(u, ID_ISAR3, SATURATE, 0);
> +        cpu->isar.id_isar3 =3D u;
> +    }
> +
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          if (arm_feature(env, ARM_FEATURE_M)) {


--
Alex Benn=C3=A9e

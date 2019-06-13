Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q21sm4068078wmq.13.2019.06.13.06.30.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 06:30:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D90C61FF87;
	Thu, 13 Jun 2019 14:30:40 +0100 (BST)
References: <20190517174046.11146-1-peter.maydell@linaro.org> <20190517174046.11146-2-peter.maydell@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 1/4] target/arm: Allow VFP and Neon to be disabled via a CPU property
In-reply-to: <20190517174046.11146-2-peter.maydell@linaro.org>
Date: Thu, 13 Jun 2019 14:30:40 +0100
Message-ID: <87a7elehof.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9eSZsqiTnqZg


Peter Maydell <peter.maydell@linaro.org> writes:

> Allow VFP and neon to be disabled via a CPU property. As with
> the "pmu" property, we only allow these features to be removed
> from CPUs which have it by default, not added to CPUs which
> don't have it.
>
> The primary motivation here is to be able to optionally
> create Cortex-M33 CPUs with no FPU, but we provide switches
> for both VFP and Neon because the two interact:
>  * AArch64 can't have one without the other
>  * Some ID register fields only change if both are disabled
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpu.h |   4 ++
>  target/arm/cpu.c | 150 +++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 148 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 733b840a712..778fb293e7c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -797,6 +797,10 @@ struct ARMCPU {
>      bool has_el3;
>      /* CPU has PMU (Performance Monitor Unit) */
>      bool has_pmu;
> +    /* CPU has VFP */
> +    bool has_vfp;
> +    /* CPU has Neon */
> +    bool has_neon;
>
>      /* CPU has memory protection unit */
>      bool has_mpu;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 8eee1d8c59a..406fd360a2a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -763,6 +763,12 @@ static Property arm_cpu_cfgend_property =3D
>  static Property arm_cpu_has_pmu_property =3D
>              DEFINE_PROP_BOOL("pmu", ARMCPU, has_pmu, true);
>
> +static Property arm_cpu_has_vfp_property =3D
> +            DEFINE_PROP_BOOL("vfp", ARMCPU, has_vfp, true);
> +
> +static Property arm_cpu_has_neon_property =3D
> +            DEFINE_PROP_BOOL("neon", ARMCPU, has_neon, true);
> +
>  static Property arm_cpu_has_mpu_property =3D
>              DEFINE_PROP_BOOL("has-mpu", ARMCPU, has_mpu, true);
>
> @@ -803,6 +809,13 @@ void arm_cpu_post_init(Object *obj)
>      if (arm_feature(&cpu->env, ARM_FEATURE_M)) {
>          set_feature(&cpu->env, ARM_FEATURE_PMSA);
>      }
> +    /* Similarly for the VFP feature bits */
> +    if (arm_feature(&cpu->env, ARM_FEATURE_VFP4)) {
> +        set_feature(&cpu->env, ARM_FEATURE_VFP3);
> +    }
> +    if (arm_feature(&cpu->env, ARM_FEATURE_VFP3)) {
> +        set_feature(&cpu->env, ARM_FEATURE_VFP);
> +    }
>
>      if (arm_feature(&cpu->env, ARM_FEATURE_CBAR) ||
>          arm_feature(&cpu->env, ARM_FEATURE_CBAR_RO)) {
> @@ -847,6 +860,27 @@ void arm_cpu_post_init(Object *obj)
>                                   &error_abort);
>      }
>
> +    /*
> +     * Allow user to turn off VFP and Neon support, but only for TCG --
> +     * KVM does not currently allow us to lie to the guest about its
> +     * ID/feature registers, so the guest always sees what the host has.
> +     */
> +    if (arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
> +        cpu->has_vfp =3D true;
> +        if (!kvm_enabled()) {
> +            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_prope=
rty,
> +                                     &error_abort);
> +        }
> +    }
> +
> +    if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
> +        cpu->has_neon =3D true;
> +        if (!kvm_enabled()) {
> +            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_prop=
erty,
> +                                     &error_abort);
> +        }
> +    }
> +
>      if (arm_feature(&cpu->env, ARM_FEATURE_PMSA)) {
>          qdev_property_add_static(DEVICE(obj), &arm_cpu_has_mpu_property,
>                                   &error_abort);
> @@ -956,6 +990,116 @@ static void arm_cpu_realizefn(DeviceState *dev, Err=
or **errp)
>          return;
>      }
>
> +    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
> +        cpu->has_vfp !=3D cpu->has_neon) {
> +        /*
> +         * This is an architectural requirement for AArch64; AArch32 is
> +         * more flexible and permits VFP-no-Neon and Neon-no-VFP.
> +         */
> +        error_setg(errp,
> +                   "AArch64 CPUs must have both VFP and Neon or neither"=
);
> +        return;
> +    }
> +
> +    if (!cpu->has_vfp) {
> +        uint64_t t;
> +        uint32_t u;
> +
> +        unset_feature(env, ARM_FEATURE_VFP);
> +        unset_feature(env, ARM_FEATURE_VFP3);
> +        unset_feature(env, ARM_FEATURE_VFP4);
> +
> +        t =3D cpu->isar.id_aa64isar1;
> +        t =3D FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 0);
> +        cpu->isar.id_aa64isar1 =3D t;
> +
> +        t =3D cpu->isar.id_aa64pfr0;
> +        t =3D FIELD_DP64(t, ID_AA64PFR0, FP, 0xf);
> +        cpu->isar.id_aa64pfr0 =3D t;
> +
> +        u =3D cpu->isar.id_isar6;
> +        u =3D FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
> +        cpu->isar.id_isar6 =3D u;
> +
> +        u =3D cpu->isar.mvfr0;
> +        u =3D FIELD_DP32(u, MVFR0, FPSP, 0);
> +        u =3D FIELD_DP32(u, MVFR0, FPDP, 0);
> +        u =3D FIELD_DP32(u, MVFR0, FPTRAP, 0);
> +        u =3D FIELD_DP32(u, MVFR0, FPDIVIDE, 0);
> +        u =3D FIELD_DP32(u, MVFR0, FPSQRT, 0);
> +        u =3D FIELD_DP32(u, MVFR0, FPSHVEC, 0);
> +        u =3D FIELD_DP32(u, MVFR0, FPROUND, 0);
> +        cpu->isar.mvfr0 =3D u;
> +
> +        u =3D cpu->isar.mvfr1;
> +        u =3D FIELD_DP32(u, MVFR1, FPFTZ, 0);
> +        u =3D FIELD_DP32(u, MVFR1, FPDNAN, 0);
> +        u =3D FIELD_DP32(u, MVFR1, FPHP, 0);
> +        cpu->isar.mvfr1 =3D u;
> +
> +        u =3D cpu->isar.mvfr2;
> +        u =3D FIELD_DP32(u, MVFR2, FPMISC, 0);
> +        cpu->isar.mvfr2 =3D u;
> +    }
> +
> +    if (!cpu->has_neon) {
> +        uint64_t t;
> +        uint32_t u;
> +
> +        unset_feature(env, ARM_FEATURE_NEON);
> +
> +        t =3D cpu->isar.id_aa64isar0;
> +        t =3D FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
> +        cpu->isar.id_aa64isar0 =3D t;
> +
> +        t =3D cpu->isar.id_aa64isar1;
> +        t =3D FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
> +        cpu->isar.id_aa64isar1 =3D t;
> +
> +        t =3D cpu->isar.id_aa64pfr0;
> +        t =3D FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 0xf);
> +        cpu->isar.id_aa64pfr0 =3D t;
> +
> +        u =3D cpu->isar.id_isar5;
> +        u =3D FIELD_DP32(u, ID_ISAR5, RDM, 0);
> +        u =3D FIELD_DP32(u, ID_ISAR5, VCMA, 0);
> +        cpu->isar.id_isar5 =3D u;
> +
> +        u =3D cpu->isar.id_isar6;
> +        u =3D FIELD_DP32(u, ID_ISAR6, DP, 0);
> +        u =3D FIELD_DP32(u, ID_ISAR6, FHM, 0);
> +        cpu->isar.id_isar6 =3D u;
> +
> +        u =3D cpu->isar.mvfr1;
> +        u =3D FIELD_DP32(u, MVFR1, SIMDLS, 0);
> +        u =3D FIELD_DP32(u, MVFR1, SIMDINT, 0);
> +        u =3D FIELD_DP32(u, MVFR1, SIMDSP, 0);
> +        u =3D FIELD_DP32(u, MVFR1, SIMDHP, 0);
> +        u =3D FIELD_DP32(u, MVFR1, SIMDFMAC, 0);
> +        cpu->isar.mvfr1 =3D u;
> +
> +        u =3D cpu->isar.mvfr2;
> +        u =3D FIELD_DP32(u, MVFR2, SIMDMISC, 0);
> +        cpu->isar.mvfr2 =3D u;
> +    }
> +
> +    if (!cpu->has_neon && !cpu->has_vfp) {
> +        uint64_t t;
> +        uint32_t u;
> +
> +        t =3D cpu->isar.id_aa64isar0;
> +        t =3D FIELD_DP64(t, ID_AA64ISAR0, FHM, 0);
> +        cpu->isar.id_aa64isar0 =3D t;
> +
> +        t =3D cpu->isar.id_aa64isar1;
> +        t =3D FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 0);
> +        cpu->isar.id_aa64isar1 =3D t;
> +
> +        u =3D cpu->isar.mvfr0;
> +        u =3D FIELD_DP32(u, MVFR0, SIMDREG, 0);
> +        cpu->isar.mvfr0 =3D u;
> +    }
> +
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          if (arm_feature(env, ARM_FEATURE_M)) {
> @@ -1016,12 +1160,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
>      if (arm_feature(env, ARM_FEATURE_V5)) {
>          set_feature(env, ARM_FEATURE_V4T);
>      }
> -    if (arm_feature(env, ARM_FEATURE_VFP4)) {
> -        set_feature(env, ARM_FEATURE_VFP3);
> -    }
> -    if (arm_feature(env, ARM_FEATURE_VFP3)) {
> -        set_feature(env, ARM_FEATURE_VFP);
> -    }
>      if (arm_feature(env, ARM_FEATURE_LPAE)) {
>          set_feature(env, ARM_FEATURE_V7MP);
>          set_feature(env, ARM_FEATURE_PXN);


--
Alex Benn=C3=A9e

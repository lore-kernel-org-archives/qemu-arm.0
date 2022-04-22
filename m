Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id i12-20020a05640200cc00b00421058b175esm1029351edu.53.2022.04.22.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 08:51:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A008C1FFB7;
	Fri, 22 Apr 2022 16:51:14 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-31-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 30/60] target/arm: Name CPState type
Date: Fri, 22 Apr 2022 16:51:08 +0100
In-reply-to: <20220417174426.711829-31-richard.henderson@linaro.org>
Message-ID: <87bkwtt8ul.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lcZ9eZCpaCBN


Richard Henderson <richard.henderson@linaro.org> writes:

> Give this enum a name and use in ARMCPRegInfo,
> add_cpreg_to_hashtable and define_one_arm_cp_reg_with_opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/cpregs.h | 6 +++---
>  target/arm/helper.c | 6 ++++--
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
> index 2c991ab5df..fe338730ab 100644
> --- a/target/arm/cpregs.h
> +++ b/target/arm/cpregs.h
> @@ -116,11 +116,11 @@ enum {
>   * Note that we rely on the values of these enums as we iterate through
>   * the various states in some places.
>   */
> -enum {
> +typedef enum {
>      ARM_CP_STATE_AA32 =3D 0,
>      ARM_CP_STATE_AA64 =3D 1,
>      ARM_CP_STATE_BOTH =3D 2,
> -};
> +} CPState;
>=20=20
>  /*
>   * ARM CP register secure state flags.  These flags identify security st=
ate
> @@ -262,7 +262,7 @@ struct ARMCPRegInfo {
>      uint8_t opc1;
>      uint8_t opc2;
>      /* Execution state in which this register is visible: ARM_CP_STATE_*=
 */
> -    int state;
> +    CPState state;
>      /* Register type: ARM_CP_* bits/values */
>      int type;
>      /* Access rights: PL*_[RW] */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 33ba77890b..8b89039667 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8503,7 +8503,7 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Er=
ror **errp)
>  }
>=20=20
>  static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
> -                                   void *opaque, int state, int secstate,
> +                                   void *opaque, CPState state, int secs=
tate,
>                                     int crm, int opc1, int opc2,
>                                     const char *name)
>  {
> @@ -8663,13 +8663,15 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cp=
u,
>       * bits; the ARM_CP_64BIT* flag applies only to the AArch32 view of
>       * the register, if any.
>       */
> -    int crm, opc1, opc2, state;
> +    int crm, opc1, opc2;
>      int crmmin =3D (r->crm =3D=3D CP_ANY) ? 0 : r->crm;
>      int crmmax =3D (r->crm =3D=3D CP_ANY) ? 15 : r->crm;
>      int opc1min =3D (r->opc1 =3D=3D CP_ANY) ? 0 : r->opc1;
>      int opc1max =3D (r->opc1 =3D=3D CP_ANY) ? 7 : r->opc1;
>      int opc2min =3D (r->opc2 =3D=3D CP_ANY) ? 0 : r->opc2;
>      int opc2max =3D (r->opc2 =3D=3D CP_ANY) ? 7 : r->opc2;
> +    CPState state;
> +
>      /* 64 bit registers have only CRm and Opc1 fields */
>      assert(!((r->type & ARM_CP_64BIT) && (r->opc2 || r->crn)));
>      /* op0 only exists in the AArch64 encodings */


--=20
Alex Benn=C3=A9e

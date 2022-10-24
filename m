Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d6311000000b0022e035a4e93sm26150983wru.87.2022.10.24.07.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:13:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 344A21FFB7;
	Mon, 24 Oct 2022 15:13:19 +0100 (BST)
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
 <20221024051851.3074715-3-richard.henderson@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 02/14] target/arm: Add ptw_idx to S1Translate
Date: Mon, 24 Oct 2022 15:09:32 +0100
In-reply-to: <20221024051851.3074715-3-richard.henderson@linaro.org>
Message-ID: <87o7u19uo0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Gf6uVjz0dghw


Richard Henderson <richard.henderson@linaro.org> writes:

> Hoist the computation of the mmu_idx for the ptw up to
> get_phys_addr_with_struct and get_phys_addr_twostage.
> This removes the duplicate check for stage2 disabled
> from the middle of the walk, performing it only once.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 71 ++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 54 insertions(+), 17 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 004375e02b..161b7922e3 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -17,6 +17,7 @@
>=20=20
>  typedef struct S1Translate {
>      ARMMMUIdx in_mmu_idx;
> +    ARMMMUIdx in_ptw_idx;

I could use a comment here to explain the difference between mmu and ptr
indexes here because...

<snip>
> @@ -2527,10 +2536,32 @@ static bool get_phys_addr_with_struct(CPUARMState=
 *env, S1Translate *ptw,
>                                        ARMMMUFaultInfo *fi)
>  {
>      ARMMMUIdx mmu_idx =3D ptw->in_mmu_idx;
> -    ARMMMUIdx s1_mmu_idx =3D stage_1_mmu_idx(mmu_idx);
>      bool is_secure =3D ptw->in_secure;
> +    ARMMMUIdx s1_mmu_idx;
>=20=20
> -    if (mmu_idx !=3D s1_mmu_idx) {
> +    switch (mmu_idx) {
> +    case ARMMMUIdx_Phys_S:
> +    case ARMMMUIdx_Phys_NS:
> +        /* Checking Phys early avoids special casing later vs regime_el.=
 */
> +        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
> +                                      is_secure, result, fi);
> +
> +    case ARMMMUIdx_Stage1_E0:
> +    case ARMMMUIdx_Stage1_E1:
> +    case ARMMMUIdx_Stage1_E1_PAN:
> +        /* First stage lookup uses second stage for ptw. */
> +        ptw->in_ptw_idx =3D is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_S=
tage2;
> +        break;
> +
> +    case ARMMMUIdx_E10_0:
> +        s1_mmu_idx =3D ARMMMUIdx_Stage1_E0;
> +        goto do_twostage;
> +    case ARMMMUIdx_E10_1:
> +        s1_mmu_idx =3D ARMMMUIdx_Stage1_E1;
> +        goto do_twostage;
> +    case ARMMMUIdx_E10_1_PAN:
> +        s1_mmu_idx =3D ARMMMUIdx_Stage1_E1_PAN;
> +    do_twostage:
>          /*
>           * Call ourselves recursively to do the stage 1 and then stage 2
>           * translations if mmu_idx is a two-stage regime, and EL2 presen=
t.
> @@ -2541,6 +2572,12 @@ static bool get_phys_addr_with_struct(CPUARMState =
*env, S1Translate *ptw,
>              return get_phys_addr_twostage(env, ptw, address, access_type,
>                                            result, fi);
>          }
> +        /* fall through */

following this I got confused as to what might be overwritten or
ignored. I assume for v8-A (ARM_FEATURE_EL2) we won't be falling through
anyway?

Anyway I think I understand it now:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> +
> +    default:
> +        /* Single stage and second stage uses physical for ptw. */
> +        ptw->in_ptw_idx =3D is_secure ? ARMMMUIdx_Phys_S : ARMMMUIdx_Phy=
s_NS;
> +        break;
>      }
>=20=20
>      /*


--=20
Alex Benn=C3=A9e

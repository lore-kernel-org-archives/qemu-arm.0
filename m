Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p8sm10623113wrx.25.2021.12.13.05.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 05:10:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C707C1FF96;
	Mon, 13 Dec 2021 13:10:09 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-14-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 13/26] hw/intc/arm_gicv3_its: Use FIELD macros for CTEs
Date: Mon, 13 Dec 2021 13:08:42 +0000
In-reply-to: <20211211191135.1764649-14-peter.maydell@linaro.org>
Message-ID: <87lf0olkge.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZyTeO+E26b2I


Peter Maydell <peter.maydell@linaro.org> writes:

> Use FIELD macros to handle CTEs, rather than ad-hoc mask-and-shift.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/gicv3_internal.h | 3 ++-
>  hw/intc/arm_gicv3_its.c  | 7 ++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 14e8ef68e02..1eeb99035da 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -403,7 +403,8 @@ FIELD(DTE, ITTADDR, 6, 44)
>   * Valid =3D 1 bit, RDBase =3D 16 bits
>   */
>  #define GITS_CTE_SIZE                 (0x8ULL)
> -#define GITS_CTE_RDBASE_PROCNUM_MASK  MAKE_64BIT_MASK(1, RDBASE_PROCNUM_=
LENGTH)
> +FIELD(CTE, VALID, 0, 1)
> +FIELD(CTE, RDBASE, 1, RDBASE_PROCNUM_LENGTH)
>=20=20
>  /* Special interrupt IDs */
>  #define INTID_SECURE 1020
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index d6637229479..ab6ce09dbc2 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -104,7 +104,7 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, =
uint64_t *cte,
>                                        MEMTXATTRS_UNSPECIFIED, res);
>      }
>=20=20
> -    return (*cte & TABLE_ENTRY_VALID_MASK) !=3D 0;
> +    return FIELD_EX64(*cte, CTE, VALID);
>  }
>=20=20
>  static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
> @@ -308,7 +308,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
>           * Current implementation only supports rdbase =3D=3D procnum
>           * Hence rdbase physical address is ignored
>           */
> -        rdbase =3D (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
> +        rdbase =3D FIELD_EX64(cte, CTE, RDBASE);
>=20=20
>          if (rdbase >=3D s->gicv3->num_cpu) {
>              return result;
> @@ -426,7 +426,8 @@ static bool update_cte(GICv3ITSState *s, uint16_t ici=
d, bool valid,
>=20=20
>      if (valid) {
>          /* add mapping entry to collection table */
> -        cte =3D (valid & TABLE_ENTRY_VALID_MASK) | (rdbase << 1ULL);
> +        cte =3D FIELD_DP64(cte, CTE, VALID, 1);
> +        cte =3D FIELD_DP64(cte, CTE, RDBASE, rdbase);

I almost flagged this until I realised the double deposit are additive
and the same as the bare |

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

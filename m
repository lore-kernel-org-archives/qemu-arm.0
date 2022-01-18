Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c3sm20572877wrd.54.2022.01.18.09.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 09:15:03 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 60F581FFB7;
	Tue, 18 Jan 2022 17:15:03 +0000 (GMT)
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
 <20220111171048.3545974-2-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH v2 01/13] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Date: Tue, 18 Jan 2022 17:13:58 +0000
In-reply-to: <20220111171048.3545974-2-peter.maydell@linaro.org>
Message-ID: <877dax9d9k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: RMhv7kBNTeco


Peter Maydell <peter.maydell@linaro.org> writes:

> In process_its_cmd() and process_mapti() we must check the
> event ID against a limit defined by the size field in the DTE,
> which specifies the number of ID bits minus one. Convert
> this code to our num_foo convention:
>  * change the variable names
>  * use uint64_t and 1ULL when calculating the number
>    of valid event IDs, because DTE.SIZE is 5 bits and
>    so num_eventids may be up to 2^32
>  * fix the off-by-one error in the comparison
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index fa3cdb57554..6d11fa02040 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -225,7 +225,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
>      MemTxResult res =3D MEMTX_OK;
>      bool dte_valid;
>      uint64_t dte =3D 0;
> -    uint32_t max_eventid;
> +    uint64_t num_eventids;
>      uint16_t icid =3D 0;
>      uint32_t pIntid =3D 0;
>      bool ite_valid =3D false;
> @@ -258,7 +258,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
>      dte_valid =3D FIELD_EX64(dte, DTE, VALID);
>=20=20
>      if (dte_valid) {
> -        max_eventid =3D 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> +        num_eventids =3D 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
>=20=20
>          ite_valid =3D get_ite(s, eventid, dte, &icid, &pIntid, &res);
>=20=20
> @@ -299,10 +299,11 @@ static bool process_its_cmd(GICv3ITSState *s, uint6=
4_t value, uint32_t offset,
>                        dte_valid ? "valid" : "invalid",
>                        ite_valid ? "valid" : "invalid",
>                        cte_valid ? "valid" : "invalid");
> -    } else if (eventid > max_eventid) {
> +    } else if (eventid >=3D num_eventids) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: invalid command attributes: eventid %d > %d\n=
",
> -                      __func__, eventid, max_eventid);
> +                      "%s: invalid command attributes: eventid %d >=3D %"
> +                      PRId64 "\n",
> +                      __func__, eventid, num_eventids);
>      } else {
>          /*
>           * Current implementation only supports rdbase =3D=3D procnum
> @@ -336,7 +337,8 @@ static bool process_mapti(GICv3ITSState *s, uint64_t =
value, uint32_t offset,
>      AddressSpace *as =3D &s->gicv3->dma_as;
>      uint32_t devid, eventid;
>      uint32_t pIntid =3D 0;
> -    uint32_t max_eventid, max_Intid;
> +    uint64_t num_eventids;
> +    uint32_t max_Intid;
>      bool dte_valid;
>      MemTxResult res =3D MEMTX_OK;
>      uint16_t icid =3D 0;
> @@ -376,11 +378,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_=
t value, uint32_t offset,
>          return result;
>      }
>      dte_valid =3D FIELD_EX64(dte, DTE, VALID);
> -    max_eventid =3D 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
> +    num_eventids =3D 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
>      max_Intid =3D (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
>=20=20
>      if ((devid >=3D s->dt.num_ids) || (icid >=3D s->ct.num_ids)
> -            || !dte_valid || (eventid > max_eventid) ||
> +            || !dte_valid || (eventid >=3D num_eventids) ||
>              (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) =
&&
>               (pIntid !=3D INTID_SPURIOUS))) {

It seems process_mapti has the similar "catch all the errors" if leg
that I split apart in process_its_command to make it easier to see what
failed.

However:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

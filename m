Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p6sm10456105wru.41.2021.12.13.03.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 03:54:35 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 45D791FF96;
	Mon, 13 Dec 2021 11:54:35 +0000 (GMT)
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-10-peter.maydell@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shashi Mallela
 <shashi.mallela@linaro.org>
Subject: Re: [PATCH 09/26] hw/intc/arm_gicv3_its: Correct handling of MAPI
Date: Mon, 13 Dec 2021 11:54:12 +0000
In-reply-to: <20211211191135.1764649-10-peter.maydell@linaro.org>
Message-ID: <877dc8n2is.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CaWgmh8vg/5C


Peter Maydell <peter.maydell@linaro.org> writes:

> The MAPI command takes arguments DeviceID, EventID, ICID, and is
> defined to be equivalent to MAPTI DeviceID, EventID, EventID, ICID.
> (That is, where MAPTI takes an explicit pINTID, MAPI uses the EventID
> as the pINTID.)
>
> We didn't quite get this right.  In particular the error checks for
> MAPI include "EventID does not specify a valid LPI identifier", which
> is the same as MAPTI's error check for the pINTID field.  QEMU's code
> skips the pINTID error check entirely in the MAPI case.
>
> We can fix this bug and in the process simplify the code by switching
> to the obvious implementation of setting pIntid =3D eventid early
> if ignore_pInt is true.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3_its.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index 15eb72a0a15..6f21c56fba2 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -354,7 +354,9 @@ static bool process_mapti(GICv3ITSState *s, uint64_t =
value, uint32_t offset,
>=20=20
>      eventid =3D (value & EVENTID_MASK);
>=20=20
> -    if (!ignore_pInt) {
> +    if (ignore_pInt) {
> +        pIntid =3D eventid;
> +    } else {
>          pIntid =3D ((value & pINTID_MASK) >> pINTID_SHIFT);

This would be worth cleaning up with field accessors at some point.

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

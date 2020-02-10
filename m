Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g128sm342199wme.47.2020.02.10.04.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 04:23:41 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7CFB51FF87;
	Mon, 10 Feb 2020 12:23:40 +0000 (GMT)
References: <20200210120146.17631-1-peter.maydell@linaro.org>
User-agent: mu4e 1.3.8; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/arm: Implement ARMv8.1-VMID16 extension
In-reply-to: <20200210120146.17631-1-peter.maydell@linaro.org>
Date: Mon, 10 Feb 2020 12:23:40 +0000
Message-ID: <875zge3a2b.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: lLc+wPiuxulu


Peter Maydell <peter.maydell@linaro.org> writes:

> The ARMv8.1-VMID16 extension extends the VMID from 8 bits to 16 bits:
>
>  * the ID_AA64MMFR1_EL1.VMIDBits field specifies whether the VMID is
>    8 or 16 bits
>  * the VMID field in VTTBR_EL2 is extended to 16 bits
>  * VTCR_EL2.VS lets the guest specify whether to use the full 16 bits,
>    or use the backwards-compatible 8 bits
>
> For QEMU implementing this is trivial:
>  * we do not track VMIDs in TLB entries, so we never use the VMID
> field

Not currently but does the VMID allow you to have per-guest page table
caching? Last time I chatted to rth about potential performance wins we
discussed how easy it would be to support this in the softmmu now we
have indirect TLB lookups anyway. Given how much time is currently spent
expensively re-populating tables we could keep the last couple of id
tagged tables around for faster switching between sets of tables.

>  * we treat any write to VTTBR_EL2, not just a change to the VMID field
>    bits, as a "possible VMID change" that causes us to throw away TLB
>    entries, so that code doesn't need changing
>  * we allow the guest to read/write the VTCR_EL2.VS bit already
>
> So all that's missing is the ID register part: report that we support
> VMID16 in our 'max' CPU.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Not something anybody's been asking for, but worthwhile as
> a step towards finishing off support for all the v8.1 extensions.
>
>  target/arm/cpu64.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 2d97bf45e1e..bf2cf278c03 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -672,6 +672,7 @@ static void aarch64_max_initfn(Object *obj)
>          t =3D cpu->isar.id_aa64mmfr1;
>          t =3D FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
>          t =3D FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
> +        t =3D FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
>          cpu->isar.id_aa64mmfr1 =3D t;
>=20=20
>          /* Replicate the same data to the 32-bit id registers.  */

I guess we can easily add the isar_feature_aa64_ functions when we need
them.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

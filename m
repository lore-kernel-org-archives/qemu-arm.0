Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r14-20020a5d6c6e000000b0020a9f757708sm2436715wrz.33.2022.04.22.08.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 08:32:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 35F891FFB7;
	Fri, 22 Apr 2022 16:32:58 +0100 (BST)
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-26-richard.henderson@linaro.org>
User-agent: mu4e 1.7.13; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH v3 25/60] target/arm: Reorg CPAccessResult and
 access_check_cp_reg
Date: Fri, 22 Apr 2022 16:31:53 +0100
In-reply-to: <20220417174426.711829-26-richard.henderson@linaro.org>
Message-ID: <87o80tt9p1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: CwdhbgIvQo3d


Richard Henderson <richard.henderson@linaro.org> writes:

> Rearrange the values of the enumerators of CPAccessResult
> so that we may directly extract the target el. For the two
> special cases in access_check_cp_reg, use CPAccessResult.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpregs.h    | 26 ++++++++++++--------
>  target/arm/op_helper.c | 56 +++++++++++++++++++++---------------------
>  2 files changed, 44 insertions(+), 38 deletions(-)
>
> diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
> index 005aa2d3a5..700fcc1478 100644
> --- a/target/arm/cpregs.h
> +++ b/target/arm/cpregs.h
> @@ -167,26 +167,32 @@ static inline bool cptype_valid(int cptype)
>  typedef enum CPAccessResult {
>      /* Access is permitted */
>      CP_ACCESS_OK =3D 0,
> +
> +    /*
> +     * Combined with one of the following, the low 2 bits indicate the
> +     * target exception level.  If 0, the exception is taken to the usual
> +     * target EL (EL1 or PL1 if in EL0, otherwise to the current EL).
> +     */
> +    CP_ACCESS_EL_MASK =3D 3,
> +
>      /*
>       * Access fails due to a configurable trap or enable which would
>       * result in a categorized exception syndrome giving information abo=
ut
>       * the failing instruction (ie syndrome category 0x3, 0x4, 0x5, 0x6,
> -     * 0xc or 0x18). The exception is taken to the usual target EL (EL1 =
or
> -     * PL1 if in EL0, otherwise to the current EL).
> +     * 0xc or 0x18).
>       */
> -    CP_ACCESS_TRAP =3D 1,
> +    CP_ACCESS_TRAP =3D (1 << 2),
> +    CP_ACCESS_TRAP_EL2 =3D CP_ACCESS_TRAP | 2,
> +    CP_ACCESS_TRAP_EL3 =3D CP_ACCESS_TRAP | 3,
> +
>      /*
>       * Access fails and results in an exception syndrome 0x0 ("uncategor=
ized").
>       * Note that this is not a catch-all case -- the set of cases which =
may
>       * result in this failure is specifically defined by the architectur=
e.
>       */
> -    CP_ACCESS_TRAP_UNCATEGORIZED =3D 2,
> -    /* As CP_ACCESS_TRAP, but for traps directly to EL2 or EL3 */
> -    CP_ACCESS_TRAP_EL2 =3D 3,
> -    CP_ACCESS_TRAP_EL3 =3D 4,
> -    /* As CP_ACCESS_UNCATEGORIZED, but for traps directly to EL2 or EL3 =
*/
> -    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 =3D 5,
> -    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 =3D 6,
> +    CP_ACCESS_TRAP_UNCATEGORIZED =3D (2 << 2),
> +    CP_ACCESS_TRAP_UNCATEGORIZED_EL2 =3D CP_ACCESS_TRAP_UNCATEGORIZED | =
2,
> +    CP_ACCESS_TRAP_UNCATEGORIZED_EL3 =3D CP_ACCESS_TRAP_UNCATEGORIZED | =
3,
>  } CPAccessResult;

This does feel like we are moving from an enum to a bunch of #defines
for bitfields. I guess we keep type checking though....

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

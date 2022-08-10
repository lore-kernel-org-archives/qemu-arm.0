Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id b3-20020a05600010c300b002206261cb6esm16018759wrx.66.2022.08.10.06.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:17:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D256B1FFB7;
	Wed, 10 Aug 2022 14:17:16 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-23-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 22/62] target/arm: Add secure parameter to
 get_phys_addr_pmsav8
Date: Wed, 10 Aug 2022 14:16:35 +0100
In-reply-to: <20220703082419.770989-23-richard.henderson@linaro.org>
Message-ID: <87fsi4kzkz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BwgrpJNsJZGK


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from get_phys_addr_pmsav8.
> Since we already had a local variable named secure, use that.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index d424dec729..f7892a0c48 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -1960,10 +1960,9 @@ void v8m_security_lookup(CPUARMState *env, uint32_=
t address,
>=20=20
>  static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
>                                   MMUAccessType access_type, ARMMMUIdx mm=
u_idx,
> -                                 GetPhysAddrResult *result,
> +                                 bool secure, GetPhysAddrResult
>  *result,

NIT: why not use is_secure like all the other functions (and reformat
the commit subject to match too).

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id s8-20020a7bc388000000b0040684abb623sm104631wmj.24.2023.10.12.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 08:21:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 82C561FFBB;
	Thu, 12 Oct 2023 16:21:27 +0100 (BST)
References: <20231012085710.880440-1-mironov@fintech.ru>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sergey Mironov <mironov@fintech.ru>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] target/arm: Adding a check for the result of
 calling the CPU information check function
Date: Thu, 12 Oct 2023 16:16:11 +0100
In-reply-to: <20231012085710.880440-1-mironov@fintech.ru>
Message-ID: <87pm1jn9xk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: H2T3aIgaFinh


Sergey Mironov <mironov@fintech.ru> writes:

> 6 out of 7 calls to get_arm_cp_reginfo() are checked

Yes but we should be careful with asserts (vs if (ri) legs) because I
don't think get_arm_cp_reginfo() guarantees it will always be
successful.

>
> Signed-off-by: Sergey Mironov <mironov@fintech.ru>
> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 74fbb6e1d7..cffbbaf571 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -198,6 +198,7 @@ static void add_cpreg_to_list(gpointer key, gpointer =
opaque)
>      uint32_t regidx =3D (uintptr_t)key;
>      const ARMCPRegInfo *ri =3D get_arm_cp_reginfo(cpu->cp_regs, regidx);
>=20=20
> +    assert(ri !=3D NULL);

  /* must always succeed as we are iterating the keys of cp_regs */
  assert(ri);

is enough for a !NULL check.

>      if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
>          cpu->cpreg_indexes[cpu->cpreg_array_len] =3D cpreg_to_kvm_id(reg=
idx);
>          /* The value array need not be initialized at this point */

That said we already have an assert that would fire in
init_cpregs_list():

  assert(cpu->cpreg_array_len =3D=3D arraylen);

so I'm not sure what this is adding to ensuring the contract is kept.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

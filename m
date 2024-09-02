Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c243fd65f4sm2925323a12.29.2024.09.02.03.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:28:54 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 74B2E5F835;
	Mon,  2 Sep 2024 11:28:53 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alireza Sanaee via <qemu-arm@nongnu.org>
Cc: <qemu-devel@nongnu.org>,  Alireza Sanaee <alireza.sanaee@huawei.com>,
  <linuxarm@huawei.com>,  <peter.maydell@linaro.org>,
  <richard.henderson@linaro.org>,  <shameerali.kolothum.thodi@huawei.com>,
  <Jonathan.Cameron@Huawei.com>,  <jiangkunkun@huawei.com>
Subject: Re: [PATCH v2] target/arm/tcg: refine cache descriptions with a
 wrapper
In-Reply-To: <20240830184713.224-1-alireza.sanaee@huawei.com> (Alireza Sanaee
	via's message of "Fri, 30 Aug 2024 19:47:13 +0100")
References: <20240830184713.224-1-alireza.sanaee@huawei.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Mon, 02 Sep 2024 11:28:53 +0100
Message-ID: <87r0a2cpsq.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ymTRnDAaZR3O

Alireza Sanaee via <qemu-arm@nongnu.org> writes:

> This patch allows for easier manipulation of the cache description
> register, CCSIDR. Which is helpful for testing as well. Currently
> numbers get hard-coded and might be prone to errors.
>
> Therefore, this patch adds wrappers for different types of CPUs
> available in tcg to decribe caches. Two functions `make_ccsidr32` and
> `make_ccsidr64` describing descriptions. The 32 bit version receives
> extra parameters that became unknown later in 64 bit.
>
> For CCSIDR register, 32 bit version follows specification [1].
> Conversely, 64 bit version follows specification [2].
>
> [1] B4.1.19, ARM Architecture Reference Manual ARMv7-A and ARMv7-R
> edition, https://developer.arm.com/documentation/ddi0406
> [2] D23.2.29, ARM Architecture Reference Manual for A-profile Architectur=
e,
> https://developer.arm.com/documentation/ddi0487/latest/
>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  target/arm/cpu-features.h | 53 ++++++++++++++++++++++++
>  target/arm/cpu64.c        | 19 ++++++---
>  target/arm/tcg/cpu64.c    | 86 ++++++++++++++++++---------------------
>  3 files changed, 105 insertions(+), 53 deletions(-)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index c59ca104fe..00a0f0d963 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -1022,6 +1022,59 @@ static inline bool isar_feature_any_evt(const ARMI=
SARegisters *id)
>      return isar_feature_aa64_evt(id) || isar_feature_aa32_evt(id);
>  }
>=20=20
> +static inline uint64_t make_ccsidr32(unsigned assoc, unsigned linesize,
> +                                     unsigned cachesize, uint8_t flags)
> +{

isn't this returning a 32 bit value?

> +    unsigned lg_linesize =3D ctz32(linesize);
> +    unsigned sets;
> +
> +    /*
> +     * The 32-bit CCSIDR_EL1 format is:
> +     *   [27:13] number of sets - 1
> +     *   [12:3]  associativity - 1
> +     *   [2:0]   log2(linesize) - 4
> +     *           so 0 =3D=3D 16 bytes, 1 =3D=3D 32 bytes, 2 =3D=3D 64 by=
tes, etc
> +     */
> +    assert(assoc !=3D 0);
> +    assert(is_power_of_2(linesize));
> +    assert(lg_linesize >=3D 4 && lg_linesize <=3D 7 + 4);
> +
> +    /* sets * associativity * linesize =3D=3D cachesize. */
> +    sets =3D cachesize / (assoc * linesize);
> +    assert(cachesize % (assoc * linesize) =3D=3D 0);
> +
> +    return ((uint64_t)(flags) << 28)
> +        | ((sets - 1) << 13)
> +        | ((assoc - 1) << 3)
> +        | (lg_linesize - 4);

This is a nice improvement but using deposit() will ensure you don't
accidentally overflow fields with the shift/or combos. So something
like:

  uint32_t ccsidr32 =3D 0;
  ..
  ccsidr32 =3D deposit32(ccsidr32, 28,  4, flags);
  ccsidr32 =3D deposit32(ccsidr32, 13, 14, sets - 1);
  ccsidr32 =3D deposit32(ccsidr32,  3, 10, assoc - 1);
  ccsidr32 =3D deposit32(ccsidr32,  0,  3, lg_linesize - 1);

And leave the compiler to simplify everything (not that it matters that
much for an init function).

Actually I note CCSIDR already has some field definitions so it would
be:

  ccsidr32 =3D FIELD_DP32(ccsidr32, CCSIDR_EL1, LINESIZE, lg_linesize -1);

etc. Although I notice it two sets of defines to account for FEAT_CCIDX

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

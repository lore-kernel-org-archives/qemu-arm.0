Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d4111000000b002c558869934sm4610183wrp.81.2023.02.24.07.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 07:29:22 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B04EF1FFB7;
	Fri, 24 Feb 2023 15:29:21 +0000 (GMT)
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
 <dddae7d3-4c18-04d3-198b-803b4c128de1@linaro.org>
 <CAFEAcA8sxm7-TN89onqEaD5kpH5yoe5mTR-RPebqn64Frgj+-A@mail.gmail.com>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
Date: Fri, 24 Feb 2023 15:27:50 +0000
In-reply-to: <CAFEAcA8sxm7-TN89onqEaD5kpH5yoe5mTR-RPebqn64Frgj+-A@mail.gmail.com>
Message-ID: <87h6vbnktq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: kaDK2m4qVrBr


Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 23 Feb 2023 at 23:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 2/22/23 01:01, Alex Benn=C3=A9e wrote:
>> > This is a mandatory feature for Armv8.1 architectures but we don't
>> > state the feature clearly in our emulation list. While checking verify
>> > our cortex-a76 model matches up with the current TRM by breaking out
>> > the long form isar into a more modern readable FIELD_DP code.
>> >
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > ---
>> >   docs/system/arm/emulation.rst |  1 +
>> >   target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>> >   target/arm/cpu_tcg.c          |  2 +-
>> >   3 files changed, 28 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation=
.rst
>> > index 2062d71261..2c4fde5eef 100644
>> > --- a/docs/system/arm/emulation.rst
>> > +++ b/docs/system/arm/emulation.rst
>> > @@ -14,6 +14,7 @@ the following architecture extensions:
>> >   - FEAT_BBM at level 2 (Translation table break-before-make levels)
>> >   - FEAT_BF16 (AArch64 BFloat16 instructions)
>> >   - FEAT_BTI (Branch Target Identification)
>> > +- FEAT_CRC32 (CRC32 instruction)
>> >   - FEAT_CSV2 (Cache speculation variant 2)
>> >   - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>> >   - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
>> > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> > index 4066950da1..12e1a532ab 100644
>> > --- a/target/arm/cpu64.c
>> > +++ b/target/arm/cpu64.c
>> > @@ -912,6 +912,8 @@ static void aarch64_a72_initfn(Object *obj)
>> >   static void aarch64_a76_initfn(Object *obj)
>> >   {
>> >       ARMCPU *cpu =3D ARM_CPU(obj);
>> > +    uint64_t t;
>> > +    uint32_t u;
>> >
>> >       cpu->dtb_compatible =3D "arm,cortex-a76";
>> >       set_feature(&cpu->env, ARM_FEATURE_V8);
>> > @@ -928,7 +930,18 @@ static void aarch64_a76_initfn(Object *obj)
>> >       cpu->ctr =3D 0x8444C004;
>> >       cpu->dcz_blocksize =3D 4;
>> >       cpu->isar.id_aa64dfr0  =3D 0x0000000010305408ull;
>> > -    cpu->isar.id_aa64isar0 =3D 0x0000100010211120ull;
>> > +
>> > +    /* per r4p1 of the Cryptographic Extension TRM */
>> > +    t =3D cpu->isar.id_aa64isar0;
>> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
>> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
>> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, SHA2, 1);     /* FEAT_SHA512 */
>> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);    /* FEAT_CRC32 */
>> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
>> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
>> > +    t =3D FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
>> > +    cpu->isar.id_aa64isar0 =3D t;
>>
>> Ok, so, this might be helpful for grepping, but it's not helpful for rea=
ding the
>> documentation, which on page B2-137 uses hex.
>
> Agreed -- we write these functions and review them by looking
> at the TRMs, and the TRMs specify the values of the ID registers
> as straight hex values.

Ahh found it now was confusing the pages with sections: B2.4 on page
B2-137.=20

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

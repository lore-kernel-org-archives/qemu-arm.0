Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 62sm25172217wrq.31.2020.08.03.06.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 06:27:57 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 152C71FF7E;
	Mon,  3 Aug 2020 14:27:57 +0100 (BST)
References: <20200803124848.18295-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] target/arm: Delete unused VFP_DREG macros
In-reply-to: <20200803124848.18295-1-peter.maydell@linaro.org>
Date: Mon, 03 Aug 2020 14:27:57 +0100
Message-ID: <873653oo4i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: VchfKq/ldD0Z


Peter Maydell <peter.maydell@linaro.org> writes:

> As part of the Neon decodetree conversion we removed all
> the uses of the VFP_DREG macros, but forgot to remove the
> macro definitions. Do so now.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/translate.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index c39a929b938..27bf6cd8b51 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -2471,21 +2471,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_=
t insn)
>      return 1;
>  }
>=20=20
> -#define VFP_REG_SHR(x, n) (((n) > 0) ? (x) >> (n) : (x) << -(n))
> -#define VFP_DREG(reg, insn, bigbit, smallbit) do { \
> -    if (dc_isar_feature(aa32_simd_r32, s)) { \
> -        reg =3D (((insn) >> (bigbit)) & 0x0f) \
> -              | (((insn) >> ((smallbit) - 4)) & 0x10); \
> -    } else { \
> -        if (insn & (1 << (smallbit))) \
> -            return 1; \
> -        reg =3D ((insn) >> (bigbit)) & 0x0f; \
> -    }} while (0)
> -
> -#define VFP_DREG_D(reg, insn) VFP_DREG(reg, insn, 12, 22)
> -#define VFP_DREG_N(reg, insn) VFP_DREG(reg, insn, 16,  7)
> -#define VFP_DREG_M(reg, insn) VFP_DREG(reg, insn,  0,  5)
> -
>  static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
>  {
>  #ifndef CONFIG_USER_ONLY


--=20
Alex Benn=C3=A9e

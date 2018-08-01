Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n17-v6sm5236150wmc.13.2018.08.01.06.45.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Aug 2018 06:45:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3664C3E00D2;
	Wed,  1 Aug 2018 14:45:50 +0100 (BST)
References: <20180801123111.3595-1-richard.henderson@linaro.org> <20180801123111.3595-2-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 1/4] target/arm: Fix sign of sve_cmpeq_ppzw/sve_cmpne_ppzw
In-reply-to: <20180801123111.3595-2-richard.henderson@linaro.org>
Date: Wed, 01 Aug 2018 14:45:50 +0100
Message-ID: <87o9em8ak1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ZId1K0C3bmsk


Richard Henderson <richard.henderson@linaro.org> writes:

> The normal vector element is sign-extended before
> comparing with the wide vector element.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/sve_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 54795c9194..9bd0694d55 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -2436,13 +2436,13 @@ uint32_t HELPER(NAME)(void *vd, void *vn, void *v=
m, void *vg, uint32_t desc) \
>  #define DO_CMP_PPZW_S(NAME, TYPE, TYPEW, OP) \
>      DO_CMP_PPZW(NAME, TYPE, TYPEW, OP, H1_4, 0x1111111111111111ull)
>
> -DO_CMP_PPZW_B(sve_cmpeq_ppzw_b, uint8_t,  uint64_t, =3D=3D)
> -DO_CMP_PPZW_H(sve_cmpeq_ppzw_h, uint16_t, uint64_t, =3D=3D)
> -DO_CMP_PPZW_S(sve_cmpeq_ppzw_s, uint32_t, uint64_t, =3D=3D)
> +DO_CMP_PPZW_B(sve_cmpeq_ppzw_b, int8_t,  uint64_t, =3D=3D)
> +DO_CMP_PPZW_H(sve_cmpeq_ppzw_h, int16_t, uint64_t, =3D=3D)
> +DO_CMP_PPZW_S(sve_cmpeq_ppzw_s, int32_t, uint64_t, =3D=3D)
>
> -DO_CMP_PPZW_B(sve_cmpne_ppzw_b, uint8_t,  uint64_t, !=3D)
> -DO_CMP_PPZW_H(sve_cmpne_ppzw_h, uint16_t, uint64_t, !=3D)
> -DO_CMP_PPZW_S(sve_cmpne_ppzw_s, uint32_t, uint64_t, !=3D)
> +DO_CMP_PPZW_B(sve_cmpne_ppzw_b, int8_t,  uint64_t, !=3D)
> +DO_CMP_PPZW_H(sve_cmpne_ppzw_h, int16_t, uint64_t, !=3D)
> +DO_CMP_PPZW_S(sve_cmpne_ppzw_s, int32_t, uint64_t, !=3D)
>
>  DO_CMP_PPZW_B(sve_cmpgt_ppzw_b, int8_t,   int64_t, >)
>  DO_CMP_PPZW_H(sve_cmpgt_ppzw_h, int16_t,  int64_t, >)


--
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y11-v6sm14969739wrr.84.2018.08.01.06.44.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Aug 2018 06:44:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 6CD0C3E00D2;
	Wed,  1 Aug 2018 14:44:12 +0100 (BST)
References: <20180801123111.3595-1-richard.henderson@linaro.org> <20180801123111.3595-5-richard.henderson@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, laurent.desnogues@gmail.com, peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH 4/4] target/arm: Fix typo in helper_sve_movz_d
In-reply-to: <20180801123111.3595-5-richard.henderson@linaro.org>
Date: Wed, 01 Aug 2018 14:44:12 +0100
Message-ID: <87pnz28amr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 340mvqXCCMaH


Richard Henderson <richard.henderson@linaro.org> writes:

> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/sve_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 87594a8adb..c3cbec9cf5 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -1042,7 +1042,7 @@ void HELPER(sve_movz_d)(void *vd, void *vn, void *v=
g, uint32_t desc)
>      uint64_t *d =3D vd, *n =3D vn;
>      uint8_t *pg =3D vg;
>      for (i =3D 0; i < opr_sz; i +=3D 1) {
> -        d[i] =3D n[1] & -(uint64_t)(pg[H1(i)] & 1);
> +        d[i] =3D n[i] & -(uint64_t)(pg[H1(i)] & 1);
>      }
>  }


--
Alex Benn=C3=A9e

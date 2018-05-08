Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h67-v6sm8121665wmg.41.2018.05.08.04.30.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 May 2018 04:30:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id A81733E00FC;
	Tue,  8 May 2018 12:30:28 +0100 (BST)
References: <20180504100547.14621-1-peter.maydell@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, qemu-stable@nongnu.org
Subject: Re: [PATCH] softfloat: Handle default NaN mode after pickNaNMulAdd, not before
In-reply-to: <20180504100547.14621-1-peter.maydell@linaro.org>
Date: Tue, 08 May 2018 12:30:28 +0100
Message-ID: <87tvriv0yz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: q67GJ7om6c+J


Peter Maydell <peter.maydell@linaro.org> writes:

> It is implementation defined whether a multiply-add of
> (0,inf,qnan) or (inf,0,qnan) raises InvalidaOperation or
> not, so we let the target-specific pickNaNMulAdd function
> handle this. This means that we must do the "return the
> default NaN in default NaN mode" check after the call,
> not before. Correct the ordering, and restore the comment
> from the old propagateFloat64MulAddNaN() that warned about
> this corner case.
>
> This fixes a regression from 2.11 for Arm guests where we would
> incorrectly fail to set the Invalid flag for these cases.
>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
>  fpu/softfloat.c | 52 ++++++++++++++++++++++++++++---------------------
>  1 file changed, 30 insertions(+), 22 deletions(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 70e0c40a1c..8401b37bd4 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -602,34 +602,42 @@ static FloatParts pick_nan(FloatParts a, FloatParts=
 b, float_status *s)
>  static FloatParts pick_nan_muladd(FloatParts a, FloatParts b, FloatParts=
 c,
>                                    bool inf_zero, float_status *s)
>  {
> +    int which;
> +
>      if (is_snan(a.cls) || is_snan(b.cls) || is_snan(c.cls)) {
>          s->float_exception_flags |=3D float_flag_invalid;
>      }
>
> -    if (s->default_nan_mode) {
> -        a.cls =3D float_class_dnan;
> -    } else {
> -        switch (pickNaNMulAdd(is_qnan(a.cls), is_snan(a.cls),
> -                              is_qnan(b.cls), is_snan(b.cls),
> -                              is_qnan(c.cls), is_snan(c.cls),
> -                              inf_zero, s)) {
> -        case 0:
> -            break;
> -        case 1:
> -            a =3D b;
> -            break;
> -        case 2:
> -            a =3D c;
> -            break;
> -        case 3:
> -            a.cls =3D float_class_dnan;
> -            return a;
> -        default:
> -            g_assert_not_reached();
> -        }
> +    which =3D pickNaNMulAdd(is_qnan(a.cls), is_snan(a.cls),
> +                          is_qnan(b.cls), is_snan(b.cls),
> +                          is_qnan(c.cls), is_snan(c.cls),
> +                          inf_zero, s);
>
> -        a.cls =3D float_class_msnan;
> +    if (s->default_nan_mode) {
> +        /* Note that this check is after pickNaNMulAdd so that function
> +         * has an opportunity to set the Invalid flag.
> +         */
> +        a.cls =3D float_class_dnan;
> +        return a;
>      }
> +
> +    switch (which) {
> +    case 0:
> +        break;
> +    case 1:
> +        a =3D b;
> +        break;
> +    case 2:
> +        a =3D c;
> +        break;
> +    case 3:
> +        a.cls =3D float_class_dnan;
> +        return a;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    a.cls =3D float_class_msnan;
> +
>      return a;
>  }


--
Alex Benn=C3=A9e

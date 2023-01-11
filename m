Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d62c7000000b002bbeda3809csm7777857wrv.11.2023.01.11.02.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 02:00:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4ABEC1FFB7;
	Wed, 11 Jan 2023 10:00:36 +0000 (GMT)
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-4-richard.henderson@linaro.org>
User-agent: mu4e 1.9.12; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 03/36] tcg: Allocate objects contiguously in
 temp_allocate_frame
Date: Wed, 11 Jan 2023 09:59:52 +0000
In-reply-to: <20230108023719.2466341-4-richard.henderson@linaro.org>
Message-ID: <87zgapl7az.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: pAuP5D50bAWD


Richard Henderson <richard.henderson@linaro.org> writes:

> When allocating a temp to the stack frame, consider the
> base type and allocate all parts at once.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tcg.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 99e6e4e1a8..7e69e2c9fd 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -3242,11 +3242,12 @@ static bool liveness_pass_2(TCGContext *s)
>=20=20
>  static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
>  {
> -    int size =3D tcg_type_size(ts->type);
> -    int align;
>      intptr_t off;
> +    int size, align;
>=20=20
> -    switch (ts->type) {
> +    /* When allocating an object, look at the full type. */
> +    size =3D tcg_type_size(ts->base_type);
> +    switch (ts->base_type) {
>      case TCG_TYPE_I32:
>          align =3D 4;
>          break;
> @@ -3277,13 +3278,26 @@ static void temp_allocate_frame(TCGContext *s, TC=
GTemp *ts)
>          tcg_raise_tb_overflow(s);
>      }
>      s->current_frame_offset =3D off + size;
> -
> -    ts->mem_offset =3D off;
>  #if defined(__sparc__)
> -    ts->mem_offset +=3D TCG_TARGET_STACK_BIAS;
> +    off +=3D TCG_TARGET_STACK_BIAS;
>  #endif
> -    ts->mem_base =3D s->frame_temp;
> -    ts->mem_allocated =3D 1;
> +
> +    /* If the object was subdivided, assign memory to all the parts. */
> +    if (ts->base_type !=3D ts->type) {
> +        int part_size =3D tcg_type_size(ts->type);
> +        int part_count =3D size / part_size;
> +
> +        ts -=3D ts->temp_subindex;

Whats going on here? Are we jumping to a previous temp? What guarentees
there is something at ts - ts->temp_subindex?

> +        for (int i =3D 0; i < part_count; ++i) {
> +            ts[i].mem_offset =3D off + i * part_size;
> +            ts[i].mem_base =3D s->frame_temp;
> +            ts[i].mem_allocated =3D 1;
> +        }
> +    } else {
> +        ts->mem_offset =3D off;
> +        ts->mem_base =3D s->frame_temp;
> +        ts->mem_allocated =3D 1;
> +    }
>  }
>=20=20
>  /* Assign @reg to @ts, and update reg_to_temp[]. */


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

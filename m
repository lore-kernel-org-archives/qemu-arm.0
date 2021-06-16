Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id i21sm4886971wmq.12.2021.06.16.06.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 06:46:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C04E41FF7E;
	Wed, 16 Jun 2021 14:46:12 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  laurent@vivier.eu
Subject: Re: [PATCH 04/21] linux-user/arm: Implement setup_sigtramp
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
	<20210616011209.1446045-5-richard.henderson@linaro.org>
Date: Wed, 16 Jun 2021 14:46:12 +0100
In-Reply-To: <20210616011209.1446045-5-richard.henderson@linaro.org> (Richard
	Henderson's message of "Tue, 15 Jun 2021 18:11:52 -0700")
Message-ID: <87y2b9gbx7.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: TY3/eV90EPSZ

Richard Henderson <richard.henderson@linaro.org> writes:

> ARM is more complicated than the others, in that we also
> have trampolines for using SA_RESTORER with FDPIC, and
> we need to create trampolines for both ARM and Thumb modes.
>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/target_signal.h |   2 +
>  linux-user/arm/signal.c        | 170 +++++++++++++++++++--------------
>  2 files changed, 100 insertions(+), 72 deletions(-)
>
> +
> +    /* ARM sigframe */
> +    _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xfff);
> +    __put_user(0xe59d9000 | SIGFRAME_FDPIC_OFS, &tramp[i++]);
> +    __put_user(0xe8998200, &tramp[i++]);

Erm is this based on your c11 series?

> +
> +    /* Thumb sigframe */
> +    _Static_assert(SIGFRAME_FDPIC_OFS <=3D 0xff << 2);
> +    _Static_assert((SIGFRAME_FDPIC_OFS & 3) =3D=3D 0);
> +    __put_user(0x9a00e9dd | (SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
> +    __put_user(0x46c04750, &tramp[i++]);
> +
> +    /* ARM rt_sigframe */
> +    _Static_assert(RT_SIGFRAME_FDPIC_OFS <=3D 0xfff);
> +    __put_user(0xe59d9000 | RT_SIGFRAME_FDPIC_OFS, &tramp[i++]);
> +    __put_user(0xe8998200, &tramp[i++]);
> +
> +    /* Thumb rt_sigframe */
> +    _Static_assert(RT_SIGFRAME_FDPIC_OFS <=3D 0xff << 2);
> +    _Static_assert((RT_SIGFRAME_FDPIC_OFS & 3) =3D=3D 0);
> +    __put_user(0x9a00e9dd | (RT_SIGFRAME_FDPIC_OFS << 14), &tramp[i++]);
> +    __put_user(0x46c04750, &tramp[i++]);
> +
> +    unlock_user(tramp, sigtramp_page, total_size);
> +}

--=20
Alex Benn=C3=A9e

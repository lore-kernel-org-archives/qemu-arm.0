Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a1sm8596106wrr.80.2020.01.24.11.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 11:57:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 580E71FF87;
	Fri, 24 Jan 2020 19:57:20 +0000 (GMT)
References: <20200124172954.28481-1-peter.maydell@linaro.org>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] target/arm/arm-semi: Don't let the guest close
 stdin/stdout/stderr
In-reply-to: <20200124172954.28481-1-peter.maydell@linaro.org>
Date: Fri, 24 Jan 2020 19:57:20 +0000
Message-ID: <87zhec8w67.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: vM01KMJZVY+x


Peter Maydell <peter.maydell@linaro.org> writes:

> The guest can use the semihosting API to open a handle
> corresponding to QEMU's own stdin, stdout, or stderr.
> When the guest closes this handle, we should not
> close the underlying host stdin/stdout/stderr
> the way we would do if the handle corresponded to
> a host fd we'd opened on behalf of the guest in SYS_OPEN.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/arm-semi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index 788fe61b51a..8718fd01948 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -403,6 +403,15 @@ static uint32_t host_closefn(ARMCPU *cpu, GuestFD *g=
f)
>  {
>      CPUARMState *env =3D &cpu->env;
>=20=20
> +    /*
> +     * Only close the underlying host fd if it's one we opened on behalf
> +     * of the guest in SYS_OPEN.
> +     */
> +    if (gf->hostfd =3D=3D STDIN_FILENO ||
> +        gf->hostfd =3D=3D STDOUT_FILENO ||
> +        gf->hostfd =3D=3D STDERR_FILENO) {
> +        return 0;
> +    }
>      return set_swi_errno(env, close(gf->hostfd));
>  }


--=20
Alex Benn=C3=A9e

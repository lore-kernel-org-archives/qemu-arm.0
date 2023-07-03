Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f10-20020a7bc8ca000000b003fbad1b4904sm15798249wml.0.2023.07.03.06.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 06:50:04 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 86E061FFBC;
	Mon,  3 Jul 2023 14:50:03 +0100 (BST)
References: <20230703124746.2456684-1-clg@kaod.org>
User-agent: mu4e 1.11.8; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] aspeed: Introduce helper for 32-bit hosts limitation
Date: Mon, 03 Jul 2023 14:47:17 +0100
In-reply-to: <20230703124746.2456684-1-clg@kaod.org>
Message-ID: <878rbxhzp0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: r6okz1hyQgzx


C=C3=A9dric Le Goater <clg@kaod.org> writes:

> On 32-bit hosts, RAM has a 2047 MB limit. Use a macro to define the
> default ram size of machines (AST2600 SoC) that can have 2 GB.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 6880998484cd..9fca644d920e 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -47,6 +47,13 @@ struct AspeedMachineState {
>      char *spi_model;
>  };
>=20=20
> +/* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
> +#if HOST_LONG_BITS =3D=3D 32
> +#define ASPEED_RAM_SIZE(sz) MIN((sz), 1 * GiB)
> +#else
> +#define ASPEED_RAM_SIZE(sz) (sz)
> +#endif
> +

On the one hand this seems a bit hacky to change the guest definition
based on the host architecture - to revive an ongoing argument about
64-on-32 configurations this seems an even more obvious subset of the
problem because regardless of the hoop jumping we do in code generation
we are limited in how much ram we can allocate.

On the other hand at least this moves the hackiness to one place:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

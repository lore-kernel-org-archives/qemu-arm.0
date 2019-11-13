Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id q15sm2731029wrs.91.2019.11.13.04.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 04:21:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 192A11FF87;
	Wed, 13 Nov 2019 12:21:55 +0000 (GMT)
References: <20191113005201.19005-1-joel@jms.id.au>
 <20191113005201.19005-2-joel@jms.id.au>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, =?utf-8?Q?C=C3=A9dric?= Le
 Goater
 <clg@kaod.org>, Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/4] aspeed/sdmc: Make ast2600 default 1G
In-reply-to: <20191113005201.19005-2-joel@jms.id.au>
Date: Wed, 13 Nov 2019 12:21:55 +0000
Message-ID: <87a7907yqk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NeWAQz+lROFv


Joel Stanley <joel@jms.id.au> writes:

> Most boards have this much.
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/misc/aspeed_sdmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
> index f3a63a2e01db..2df3244b53c8 100644
> --- a/hw/misc/aspeed_sdmc.c
> +++ b/hw/misc/aspeed_sdmc.c
> @@ -208,10 +208,10 @@ static int ast2600_rambits(AspeedSDMCState *s)
>      }
>
>      /* use a common default */
> -    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 512M",
> +    warn_report("Invalid RAM size 0x%" PRIx64 ". Using default 1024M",
>                  s->ram_size);
> -    s->ram_size =3D 512 << 20;
> -    return ASPEED_SDMC_AST2600_512MB;
> +    s->ram_size =3D 1024 << 20;

FWIW units.h has some nice #defines to wrap this stuff:

 s->ram_size =3D 1024 * MiB

Not a blocker though:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> +    return ASPEED_SDMC_AST2600_1024MB;
>  }
>
>  static void aspeed_sdmc_reset(DeviceState *dev)


--
Alex Benn=C3=A9e

Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id c4-20020adfe704000000b00241b5af8697sm4172574wrm.85.2022.12.23.15.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 15:41:27 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 959141FFB7;
	Fri, 23 Dec 2022 23:41:26 +0000 (GMT)
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-5-armbru@redhat.com>
User-agent: mu4e 1.9.7; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com, marcel.apfelbaum@gmail.com,
 yangxiaojuan@loongson.cn, gaosong@loongson.cn,
 richard.henderson@linaro.org, deller@gmx.de, jasowang@redhat.com,
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org,
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, crwulff@gmail.com,
 marex@denx.de, Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 4/4] docs/devel: Rules on #include in headers
Date: Fri, 23 Dec 2022 23:41:08 +0000
In-reply-to: <20221222120813.727830-5-armbru@redhat.com>
Message-ID: <87cz89y9g9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: qRQh0xH8m2mK


Markus Armbruster <armbru@redhat.com> writes:

> Rules for headers were proposed a long time ago, and generally liked:
>
>     Message-ID: <87h9g8j57d.fsf@blackfin.pond.sub.org>
>     https://lists.nongnu.org/archive/html/qemu-devel/2016-03/msg03345.html
>
> Wortk them into docs/devel/style.rst.

nit: spelling Work

>
> Suggested-by: Bernhard Beschow <shentey@gmail.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  docs/devel/style.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 7ddd42b6c2..68aa776930 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -293,6 +293,13 @@ that QEMU depends on.
>  Do not include "qemu/osdep.h" from header files since the .c file will h=
ave
>  already included it.
>=20=20
> +Headers should normally include everything they need beyond osdep.h.
> +If exceptions are needed for some reason, they must be documented in
> +the header.  If all that's needed from a header is typedefs, consider
> +putting those into qemu/typedefs.h instead of including the header.
> +
> +Cyclic inclusion is forbidden.
> +
>  C types
>  =3D=3D=3D=3D=3D=3D=3D


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

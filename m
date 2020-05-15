Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n9sm2600291wrv.43.2020.05.15.02.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 02:00:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9E4EC1FF7E;
	Fri, 15 May 2020 10:00:06 +0100 (BST)
References: <20200507151819.28444-1-peter.maydell@linaro.org>
 <20200507151819.28444-2-peter.maydell@linaro.org>
User-agent: mu4e 1.4.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 1/5] docs/system: Add 'Arm' to the Integrator/CP
 document title
In-reply-to: <20200507151819.28444-2-peter.maydell@linaro.org>
Date: Fri, 15 May 2020 10:00:06 +0100
Message-ID: <87pnb5d149.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 7/ocwVBzXgJ/


Peter Maydell <peter.maydell@linaro.org> writes:

> Add 'Arm' to the Integrator/CP document title, for consistency with
> the titling of the other documentation of Arm devboard models
> (versatile, realview).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  docs/system/arm/integratorcp.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/docs/system/arm/integratorcp.rst b/docs/system/arm/integrato=
rcp.rst
> index e6f050f602b..594438008e4 100644
> --- a/docs/system/arm/integratorcp.rst
> +++ b/docs/system/arm/integratorcp.rst
> @@ -1,5 +1,5 @@
> -Integrator/CP (``integratorcp``)
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +Arm Integrator/CP (``integratorcp``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
>  The Arm Integrator/CP board is emulated with the following devices:


--=20
Alex Benn=C3=A9e

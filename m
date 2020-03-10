Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w9sm28780055wrn.35.2020.03.10.07.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 07:54:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 81FEC1FF7E;
	Tue, 10 Mar 2020 14:54:47 +0000 (GMT)
References: <20200309215818.2021-1-peter.maydell@linaro.org>
 <20200309215818.2021-5-peter.maydell@linaro.org>
User-agent: mu4e 1.3.9; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 4/5] docs: Move arm-cpu-features.rst into the system manual
In-reply-to: <20200309215818.2021-5-peter.maydell@linaro.org>
Date: Tue, 10 Mar 2020 14:54:47 +0000
Message-ID: <874kuwi7k8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: yXeLqQGJVfAP


Peter Maydell <peter.maydell@linaro.org> writes:

> Now we have somewhere to put arm-specific rst documentation,
> we can move arm-cpu-features.rst from the docs/ top level
> directory into docs/system/arm/.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  .../{arm-cpu-features.rst =3D> system/arm/cpu-features.rst} | 8 +-------
>  docs/system/target-arm.rst                                | 6 ++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  rename docs/{arm-cpu-features.rst =3D> system/arm/cpu-features.rst} (99%)
>
> diff --git a/docs/arm-cpu-features.rst b/docs/system/arm/cpu-features.rst
> similarity index 99%
> rename from docs/arm-cpu-features.rst
> rename to docs/system/arm/cpu-features.rst
> index fc1623aeca5..7495b7b672b 100644
> --- a/docs/arm-cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -1,11 +1,5 @@
> +Arm CPU Features
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -ARM CPU Features
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Examples of probing and using ARM CPU features
> -
> -Introduction
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
>  CPU features are optional features that a CPU of supporting type may
>  choose to implement or not.  In QEMU, optional CPU features have
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 86ea6f2f568..1425bd5303a 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -78,3 +78,9 @@ undocumented; you can get a complete list by running
>     arm/stellaris
>     arm/musicpal
>     arm/sx1
> +
> +Arm CPU features
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   arm/cpu-features


--=20
Alex Benn=C3=A9e

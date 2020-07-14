Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p25sm4150834wmg.39.2020.07.14.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2020 06:16:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 572FF1FF7E;
	Tue, 14 Jul 2020 14:16:50 +0100 (BST)
References: <20200713175746.5936-1-peter.maydell@linaro.org>
 <20200713175746.5936-3-peter.maydell@linaro.org>
User-agent: mu4e 1.5.4; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH for-5.1 2/4] docs/system: Briefly document collie board
In-reply-to: <20200713175746.5936-3-peter.maydell@linaro.org>
Date: Tue, 14 Jul 2020 14:16:50 +0100
Message-ID: <877dv6z16l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: UV5MbYyDzEoo


Peter Maydell <peter.maydell@linaro.org> writes:

> Add skeletal documentation of the collie board.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/collie.rst | 16 ++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  MAINTAINERS                |  1 +
>  3 files changed, 18 insertions(+)
>  create mode 100644 docs/system/arm/collie.rst
>
> diff --git a/docs/system/arm/collie.rst b/docs/system/arm/collie.rst
> new file mode 100644
> index 00000000000..9f8dbcad25d
> --- /dev/null
> +++ b/docs/system/arm/collie.rst
> @@ -0,0 +1,16 @@
> +Sharp Zaurus SL-5500 (``collie``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This machine is a model of the Sharp Zaurus SL-5500, which is
> +based on the StrongARM SA1110.

Maybe:

... Sharp Zaurus SL-5500, which was PDA in the 1990's based on the StrongAR=
M SA1110.

just to make the class of hardware clearer.
<snip>

Either way:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

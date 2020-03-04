Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n11sm28318380wrq.40.2020.03.04.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 02:35:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BD2241FF87;
	Wed,  4 Mar 2020 10:35:36 +0000 (GMT)
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com>
User-agent: mu4e 1.3.9; emacs 27.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 philmd@redhat.com, b.galvani@gmail.com, jasowang@redhat.com,
 imammedo@redhat.com
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
In-reply-to: <20200301215029.15196-19-nieklinnenbank@gmail.com>
Date: Wed, 04 Mar 2020 10:35:36 +0000
Message-ID: <871rq876h3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Fc37Os+64Na7


Niek Linnenbank <nieklinnenbank@gmail.com> writes:

> The Xunlong Orange Pi PC machine is a functional ARM machine
> based on the Allwinner H3 System-on-Chip. It supports mainline
> Linux, U-Boot, NetBSD and is covered by acceptance tests.
>
> This commit adds a documentation text file with a description
> of the machine and instructions for the user.

This is great, thanks for taking the time to include documentation.

>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  docs/orangepi.rst | 226
> ++++++++++++++++++++++++++++++++++++++++++++++

I suspect there is a better place to put this is than the top level. I
wonder if it should be docs/specs?

>  MAINTAINERS       |   1 +
>  2 files changed, 227 insertions(+)
>  create mode 100644 docs/orangepi.rst
>
> diff --git a/docs/orangepi.rst b/docs/orangepi.rst
> new file mode 100644
> index 0000000000..a9b46f553c
> --- /dev/null
> +++ b/docs/orangepi.rst
> @@ -0,0 +1,226 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +Orange Pi PC Machine Type
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +The Xunlong Orange Pi PC is an Allwinner H3 System on Chip
> +based embedded computer with mainline support in both U-Boot
> +and Linux. The board comes with a Quad Core Cortex A7 @ 1.3GHz,
> +1GiB RAM, 100Mbit ethernet, USB, SD/MMC, USB, HDMI and
> +various other I/O.

When Peter's document PR goes in later this week there will also be a:

  docs/system/target-arm.rst

which would benefit from a section for the Orange Pi in it.

> +
> +Supported devices
> +-----------------
> +
> +The Orange Pi PC machine supports the following devices:
> +
> + * SMP (Quad Core Cortex A7)
> + * Generic Interrupt Controller configuration
> + * SRAM mappings
> + * SDRAM controller
> + * Real Time Clock
> + * Timer device (re-used from Allwinner A10)
> + * UART
> + * SD/MMC storage controller
> + * EMAC ethernet

Do we ever exercise the ethernet in the acceptance tests? I see we have
some that boots a full OS but boot console only seems to touch the
serial console.

<snip>

--=20
Alex Benn=C3=A9e

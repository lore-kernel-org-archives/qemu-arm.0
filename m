Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a71sm2114958wme.11.2019.10.08.01.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 01:57:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1EFB91FF87;
	Tue,  8 Oct 2019 09:57:28 +0100 (BST)
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-2-f4bug@amsat.org>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?utf-8?Q?Zolt=C3=A1n?=
 Baldaszti <bztemail@gmail.com>, Laurent Bonnans
 <laurent.bonnans@here.com>, Esteban Bosse <estebanbosse@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Philippe =?utf-8?Q?Mathieu-Dau?=
 =?utf-8?Q?d=C3=A9?=
 <f4bug@amsat.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, BALATON
 Zoltan <balaton@eik.bme.hu>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Clement Deschamps
 <clement.deschamps@antfield.fr>, Cleber Rosa <crosa@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Pekka Enberg
 <penberg@iki.fi>,
 Guenter Roeck <linux@roeck-us.net>, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 01/19] hw/arm/raspi: Use the IEC binary prefix definitions
In-reply-to: <20190926173428.10713-2-f4bug@amsat.org>
Date: Tue, 08 Oct 2019 09:57:27 +0100
Message-ID: <875zkzk420.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 6m1CqqyaoDkw


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> IEC binary prefixes ease code review: the unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  hw/arm/raspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 74c062d05e..615d755879 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -230,7 +230,7 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->max_cpus =3D BCM283X_NCPUS;
>      mc->min_cpus =3D BCM283X_NCPUS;
>      mc->default_cpus =3D BCM283X_NCPUS;
> -    mc->default_ram_size =3D 1024 * 1024 * 1024;
> +    mc->default_ram_size =3D 1 * GiB;
>      mc->ignore_memory_transaction_failures =3D true;
>  };
>  DEFINE_MACHINE("raspi2", raspi2_machine_init)
> @@ -252,7 +252,7 @@ static void raspi3_machine_init(MachineClass *mc)
>      mc->max_cpus =3D BCM283X_NCPUS;
>      mc->min_cpus =3D BCM283X_NCPUS;
>      mc->default_cpus =3D BCM283X_NCPUS;
> -    mc->default_ram_size =3D 1024 * 1024 * 1024;
> +    mc->default_ram_size =3D 1 * GiB;
>  }
>  DEFINE_MACHINE("raspi3", raspi3_machine_init)
>  #endif


--
Alex Benn=C3=A9e

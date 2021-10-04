Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d2sm14877035wrc.32.2021.10.04.08.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 08:44:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 756981FF96;
	Mon,  4 Oct 2021 16:44:53 +0100 (BST)
References: <20211004134742.2044280-1-alex.bennee@linaro.org>
 <20211004134742.2044280-6-alex.bennee@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, f4bug@amsat.org, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Andrew
 Baumann <Andrew.Baumann@microsoft.com>
Subject: Re: [PATCH  v1 5/7] hw/arm/bcm2836: Add the BCM2711 which uses a GICv2
Date: Mon, 04 Oct 2021 16:43:50 +0100
In-reply-to: <20211004134742.2044280-6-alex.bennee@linaro.org>
Message-ID: <87ilycg5fu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: H3hcPapRmVTJ


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The BCM2711 is improvement of the BCM2837:
> - Cortex-A72 instead of the A53
> - peripheral block and local soc controller are mapped differently,
> - GICv2
> - PCIe block
> - exhanced MMU to address over 4GiB of SDRAM
>
<snip>
> ---
> vAJB:
<snip>
>   - move peri_base/ctrl to locations pointed to by DTB (0x7e000000/0x4000=
0000)
<snip>
> +
> +static void bcm2711_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> +    BCM283XClass *bc =3D BCM283X_CLASS(oc);
> +
> +    bc->cpu_type =3D ARM_CPU_TYPE_NAME("cortex-a72");
> +    bc->core_count =3D BCM283X_NCPUS;
> +    bc->peri_base =3D 0x7e000000;
> +    bc->ctrl_base =3D 0x40000000;
> +    bc->clusterid =3D 0x0;
> +    bc->gic_base =3D 0x40000,
> +    dc->realize =3D bcm2836_realize;
> +}

It turns out I was misreading the way you calculate addresses from DTS
files. Reverted to:

    bc->peri_base =3D 0xfe000000;
    bc->ctrl_base =3D 0xff800000;

--=20
Alex Benn=C3=A9e

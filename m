Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w13-20020adfec4d000000b002efb6e0c495sm3058052wrn.91.2023.04.14.01.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 01:57:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6E6E51FFB7;
	Fri, 14 Apr 2023 09:57:45 +0100 (BST)
References: <20230414073432.36000-1-slankes@eonerc.rwth-aachen.de>
 <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
User-agent: mu4e 1.10.0; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [RFC 1/1] add support of `--initrd` for ELF-ARM kernels
Date: Fri, 14 Apr 2023 09:54:50 +0100
In-reply-to: <20230414073432.36000-2-slankes@eonerc.rwth-aachen.de>
Message-ID: <87v8hyc03a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: v6/PvzHnrQ+G


Stefan Lankes <slankes@eonerc.rwth-aachen.de> writes:

> Currently, the flag `--initrd` is only support for Linux ARM kernels.
> However, also other ELF kernels could depend on an initial ramdisk.
> This PR loads also the initrd for ELF kernels and announce the
> location by the nodes "/chosen/initrd-start" and
> "/chosen/initrd-end" within the device tree.
>
> Signed-off-by: Stefan Lankes <slankes@eonerc.rwth-aachen.de>
> ---
>  hw/arm/boot.c | 106 +++++++++++++++++++++++++++++---------------------
>  1 file changed, 62 insertions(+), 44 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 54f6a3e0b3..f767a4809e 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -657,20 +657,38 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
>      }
>=20=20
>      if (binfo->initrd_size) {
> -        rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initr=
d-start",
> +        if (binfo->is_linux) {
> +            rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,i=
nitrd-start",
>                                            acells, binfo->initrd_start);
> -        if (rc < 0) {
> -            fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
> -            goto fail;
> -        }
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set /chosen/linux,initrd-start=
\n");
> +                goto fail;
> +            }
>=20=20
> -        rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,initr=
d-end",
> -                                          acells,
> -                                          binfo->initrd_start +
> -                                          binfo->initrd_size);
> -        if (rc < 0) {
> -            fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
> -            goto fail;
> +            rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "linux,i=
nitrd-end",
> +                                              acells,
> +                                              binfo->initrd_start +
> +                                              binfo->initrd_size);
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n=
");
> +                goto fail;
> +            }
> +        } else {
> +            rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "initrd-=
start",
> +                                          acells, binfo->initrd_start);
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set /chosen/initrd-start\n");
> +                goto fail;
> +            }
> +
> +            rc =3D qemu_fdt_setprop_sized_cells(fdt, "/chosen", "initrd-=
end",
> +                                              acells,
> +                                              binfo->initrd_start +
> +                                              binfo->initrd_size);
> +            if (rc < 0) {
> +                fprintf(stderr, "couldn't set /chosen/initrd-end\n");
> +                goto fail;
> +            }

Where are these DTB nodes documented?

Also could you not achieve the same thing using the guest-loader which
uses the multiboot spec and sets:

        const char *compat[2] =3D { "multiboot,module", "multiboot,ramdisk"=
 };
        if (qemu_fdt_setprop_string_array(fdt, node, "compatible",
                                          (char **) &compat,
                                          ARRAY_SIZE(compat)) < 0) {
            error_setg(errp, "couldn't set %s/compatible", node);
            return;
        }


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
